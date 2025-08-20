Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCACB1E8333
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701693; cv=none; b=HsXPjcYzthBM2uOwN86TtqHhV66RwFB2Xejw4pUskrZX68RjhmE9nWVOelb6DcmmHvfFBlDvE+2lwah+yIoqWnkLNAZ0CKT+tBry5UAg7nksdNak4f3kl8RTxIWEG50b2nqeaZw7KNprgK6cBl1UwKvdBc/Y6e/Taq8qD8vD6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701693; c=relaxed/simple;
	bh=NF0CS9WgLtEvgN8wGgJpG/+v7Flfi0RraxVCe/Ht5N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XoP8RK3S0xiiwFKZre+KltyaeM0Sa+idocU3opqYMEvo7eiG+Kv1uky8G+yABrML2y4XNF0Y0x7tQ/2oe2OdheDZqVVO7GO1wVIyfzYaF9DbrflI9jPHW+psO0GStA1bzHKg+A0Xz3BReKE+jwzVjIkNJBs4jr3Hu9sWXFChDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+uwjHFw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+uwjHFw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B96C4CEE7;
	Wed, 20 Aug 2025 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755701692;
	bh=NF0CS9WgLtEvgN8wGgJpG/+v7Flfi0RraxVCe/Ht5N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j+uwjHFwb1zSk7joyZUfWDRasCojvYZvdEYGY0O3fXRn6Gt6duUzs7k/DCTesmOpx
	 DA+MZQ1kaRzmElKvxs5BWWVSC6x3JnWEUHMsqE0iGQs86/8i3sWSwhECdP5LUeuaRF
	 bDy+bxmHPDMpcXbVCdYaYyFGgr6zPzqD9nUFp317dH+DHO8AiqSAw0a3FTwrw67Scx
	 EHzNUFA+VkdHEoWJm0N8uXb55J/PMMMh58764YborM8F9vTAOrdHBQRIJ2fqRDO67X
	 VPqPm3bdqLw+qCmI6r+raBdn74/8cqpoE4m9yQX8GJlCGJOl4OddfV0UJ6kIt81nhR
	 XmP+7+hZB+MzA==
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
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v5 2/7] rust: alloc: vmalloc: implement Vmalloc::to_page()
Date: Wed, 20 Aug 2025 16:53:38 +0200
Message-ID: <20250820145434.94745-3-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820145434.94745-1-dakr@kernel.org>
References: <20250820145434.94745-1-dakr@kernel.org>
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
Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
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

