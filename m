Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731391E8837
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Aug 2025 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754513468; cv=none; b=I6eHOS4pL/ilBcreXmh9l2dbXyXPr2PWZFkEfNTxjnC3Y+WK2xBNICQTVe2VxeWIiEec31DiZ2PaDzOPFhrdlOTaqKzeeioiJqE7DcXf7709VTdMM7A1yTpj34wThDPejhCbyIL5zPdbpsCZ3icwHqBqjN8vjJKniNRvAhjPNAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754513468; c=relaxed/simple;
	bh=60fLN6D5JcQ36eXekLUL0kwTdHuSf2RS/X3uKemxCdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Klq2uDJRSTrRnldLg3BHXHPlKjBlzWQ5QCOApx9Oouhmx/bE7fXPr3eAg97VhNJD6O1ISFbW9w1LLYP25R2TVIiUMw/vJcnmSDJEBkkNldbis3G48I8HskojXi9rlz7dMBmbnem04v+Qpdv4K2Mt/3MNqTOjqmTjaKp7//RRCEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwGn2LpM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwGn2LpM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54752C4CEE7;
	Wed,  6 Aug 2025 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754513467;
	bh=60fLN6D5JcQ36eXekLUL0kwTdHuSf2RS/X3uKemxCdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bwGn2LpMSjOTAfQ7H/7Hg4YHYphg5K8SSso+TTIqm0MtceTkhkbq3Bfcc7bKhd6z0
	 NPnC2gctWoqLarP5sbclHpysYipIAXWOYckxvZCauigYbPiS9eQ1Q+a7AGhJnKJWuj
	 UxCwlnlD+RqTY4nnGnjHjUnY3lD744r9fK39hPgtkVxbnWcPZq9gy+2dS5d11cUP/B
	 pp3Xqjjw4KpFMAkiuruNpc4B0dFoJjxIhnm+YbY1yeGN+XsV9rdvOVXFgHbMaIXHxr
	 5IMnu2bPDn92Z6/Qa/rcsnzpt0r8Gmmt1kGPlehQvVGkd/6fMMCsbq3CW0j3zc/h47
	 gsO+R9k/ymulQ==
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
Subject: [PATCH v2 3/6] rust: alloc: vmalloc: implement Vmalloc::to_page()
Date: Wed,  6 Aug 2025 22:50:12 +0200
Message-ID: <20250806205044.85085-4-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806205044.85085-1-dakr@kernel.org>
References: <20250806205044.85085-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement an abstraction of vmalloc_to_page() for subsequent use in the
PageOwner implementation of VBox and VVec.

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

