Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D61459EA
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 09:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164087; cv=none; b=HV1ENxdQeJAvQR0MmNJIMiBD4iWXdPvGZ5KOzD7E8tsKt4FQPd+gaSZn9CLtzCMEGB1XmrjVukLQRoVUJOhm5MkY+JocFBoVsCsswoGrvT9OBeOp4JlGFmgb0GzsmWJtVfNarhdvFvXkoKjzzvwos46rOyFnq4jP269PJ5LYd1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164087; c=relaxed/simple;
	bh=1OJWjFfxVmJ92LcCFB79rJQpnC9FN0vMXapg64UkPJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e0uE+T+c30E03DaVUngi2kF8pvJXWHUjw5IXu+xXDGz7yS1Kx91NtKB0vTMDoNZ0ibbbOd0VOJ4YtwqJl7r8xtPBupQzDAGsonA8ERXOlqfV7kkXkRpK8WeA187YMYjKI8HW+wUuX8YFyr0gtqPORPYBa4rwWBKdnOXqctk2efo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szWUPk9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szWUPk9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A32C4CEED;
	Thu, 14 Aug 2025 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755164085;
	bh=1OJWjFfxVmJ92LcCFB79rJQpnC9FN0vMXapg64UkPJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=szWUPk9wpQJHcKNzVtBt0UmH0tLihnSCTV9Pxjql9QYH1O87/alGcuUOBEovq5aEg
	 Wbe4Xgm4jM5iImH3osJorQKAiIJyinbsTuQ+PyvIKL+NpjMakmYnjo6seQJsIiBjX8
	 S/AmYm442Zm+3u0o/kLrqnAHnQZUQltJKKPWw59tZWIbHWwPRvHCQEioj7csJho4mO
	 9IlsQPgffdFZv192TobzQpBIvjW4BHt3ZZ8cVhcSWjluQ68qukMFcI7jxhC1+V3tqS
	 l/xeeS1pkwa6mNbQRQY5gr/KmzSh+rcaZ9Q2Q5plvwTYKphXtr70DnEVqnUnWg823F
	 cIKas9N81cAxw==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 2/7] rust: alloc: vmalloc: implement Vmalloc::to_page()
Date: Thu, 14 Aug 2025 11:33:41 +0200
Message-ID: <20250814093427.19629-3-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814093427.19629-1-dakr@kernel.org>
References: <20250814093427.19629-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement an abstraction of vmalloc_to_page() for subsequent use in the
AsPageIter implementation of VBox and VVec.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/allocator.rs | 49 ++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index aa2dfa9dca4c..2315f5063011 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -15,6 +15,7 @@
 
 use crate::alloc::{AllocError, Allocator};
 use crate::bindings;
+use crate::page;
 use crate::pr_warn;
 
 /// The contiguous kernel allocator.
@@ -140,6 +141,54 @@ unsafe fn realloc(
     }
 }
 
+impl Vmalloc {
+    /// Convert a pointer to a [`Vmalloc`] allocation to a [`page::BorrowedPage`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use core::ptr::{NonNull, from_mut};
+    /// # use kernel::{page, prelude::*};
+    /// use kernel::alloc::allocator::Vmalloc;
+    ///
+    /// let mut vbox = VBox::<[u8; page::PAGE_SIZE]>::new_uninit(GFP_KERNEL)?;
+    ///
+    /// {
+    ///     // SAFETY: By the type invariant of `Box` the inner pointer of `vbox` is non-null.
+    ///     let ptr = unsafe { NonNull::new_unchecked(from_mut(&mut *vbox)) };
+    ///
+    ///     // SAFETY:
+    ///     // `ptr` is a valid pointer to a `Vmalloc` allocation.
+    ///     // `ptr` is valid for the entire lifetime of `page`.
+    ///     let page = unsafe { Vmalloc::to_page(ptr.cast()) };
+    ///
+    ///     // SAFETY: There is no concurrent read or write to the same page.
+    ///     unsafe { page.fill_zero_raw(0, page::PAGE_SIZE)? };
+    /// }
+    /// # Ok::<(), Error>(())
+    /// ```
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to a [`Vmalloc`] allocation.
+    /// - `ptr` must remain valid for the entire duration of `'a`.
+    pub unsafe fn to_page<'a>(ptr: NonNull<u8>) -> page::BorrowedPage<'a> {
+        // SAFETY: `ptr` is a valid pointer to `Vmalloc` memory.
+        let page = unsafe { bindings::vmalloc_to_page(ptr.as_ptr().cast()) };
+
+        // SAFETY: `vmalloc_to_page` returns a valid pointer to a `struct page` for a valid pointer
+        // to `Vmalloc` memory.
+        let page = unsafe { NonNull::new_unchecked(page) };
+
+        // SAFETY:
+        // - `page` is a valid pointer to a `struct page`, given that by the safety requirements of
+        //   this function `ptr` is a valid pointer to a `Vmalloc` allocation.
+        // - By the safety requirements of this function `ptr` is valid for the entire lifetime of
+        //   `'a`.
+        unsafe { page::BorrowedPage::from_raw(page) }
+    }
+}
+
 // SAFETY: `realloc` delegates to `ReallocFunc::call`, which guarantees that
 // - memory remains valid until it is explicitly freed,
 // - passing a pointer to a valid memory allocation is OK,
-- 
2.50.1

