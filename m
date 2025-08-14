Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F2B262FDC
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755164089; cv=none; b=JJkp5U0kdTa5us2Xe6YUQ9d+BeT4Ii9CUTwRXAJl2e3KkxKwRd6ZVfy6AlUNwROZjfzPS/4Xmj/zh/DJvnf02lPj2hOWu6Ch9UISnr2a2aQ+xm+VnqR201uMYZTHg44MHM9sniW3bwXlwV8rs8I5+mx8FHq6ZFdwg+WVlPLFSA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755164089; c=relaxed/simple;
	bh=Xlu6bq48Gggfeqw2se2yUB5BCtSo0HdXuLjPEG2BZh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUdLgOLJee49vJ55Rf8Bz5mzrQr63Db/B2npKRepn2ASeFWaBZTvY/monvuqHEaaTKlIgrl+jIaR2JLIPcgt3S9jf0EVML4WpATTaBXRugyONrlrjT1xsf5/48xZI2CguHTkkZibWMea/ClEiEFcRS3ucKdgXvuPyx/BdmM/jY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5RsMvtp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5RsMvtp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA988C4CEF1;
	Thu, 14 Aug 2025 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755164089;
	bh=Xlu6bq48Gggfeqw2se2yUB5BCtSo0HdXuLjPEG2BZh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T5RsMvtp0NH32DFNrXWvnBQ+I0iY16XGCwEFAPBgZ8IKF1cdNdWRlHUR+wN5P/T81
	 8WDgoc62IClw8RTzQRR2fmz+ebytk/FAkU/msp2N+ZF6FzeHvxbSSglhV99B6zQRsK
	 Y3ltSSj+TnZ79qV0phDx2Rh/0aaAMV8cqwQY+fzRcVm09B3PTv1CZtxC5lZqqirSVX
	 UePP4OwipYWxPcFgTnT1pYeVTmQPEd822ysf8k9acPOHTJXmoiPIXgN3X4YeyaNYR/
	 WGSLP2Nhw1qpDp9UOBycngwQwh+HwRG8ekTR4z1ifCK53rSRaqNCzrCksoeptgX1LW
	 Vnwl5EJrA9odQ==
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
Subject: [PATCH v4 3/7] rust: alloc: implement VmallocPageIter
Date: Thu, 14 Aug 2025 11:33:42 +0200
Message-ID: <20250814093427.19629-4-dakr@kernel.org>
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

Introduce the VmallocPageIter type; an instance of VmallocPageIter may
be exposed by owners of vmalloc allocations to provide borrowed access
to the backing pages of the vmalloc allocation.

For instance, this is useful to access and borrow the backing pages of
allocation primitives, such as Box and Vec, backing a scatterlist.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/allocator.rs | 98 ++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 2315f5063011..5cff3069bff4 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -10,6 +10,7 @@
 
 use super::Flags;
 use core::alloc::Layout;
+use core::marker::PhantomData;
 use core::ptr;
 use core::ptr::NonNull;
 
@@ -236,3 +237,100 @@ unsafe fn realloc(
         unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
     }
 }
+
+/// An [`Iterator`] of [`page::BorrowedPage`] items owned by a [`Vmalloc`] allocation.
+///
+/// # Guarantees
+///
+/// The pages iterated by the [`Iterator`] appear in the order as they are mapped in the CPU's
+/// virtual address space ascendingly.
+///
+/// # Invariants
+///
+/// - `buf` is a valid pointer to the beginning of a [`Vmalloc`] allocation.
+/// - `size` is the size of the [`Vmalloc`] allocation `buf` points to.
+pub struct VmallocPageIter<'a> {
+    /// The base address of the [`Vmalloc`] buffer.
+    buf: NonNull<u8>,
+    /// The size of the buffer pointed to by `buf` in bytes.
+    size: usize,
+    /// The current page index of the [`Iterator`].
+    index: usize,
+    _p: PhantomData<page::BorrowedPage<'a>>,
+}
+
+impl<'a> Iterator for VmallocPageIter<'a> {
+    type Item = page::BorrowedPage<'a>;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        let offset = self.index.checked_mul(page::PAGE_SIZE)?;
+
+        // Even though `self.size()` may be smaller than `Self::page_count() * page::PAGE_SIZE`, it
+        // is always a number between `(Self::page_count() - 1) * page::PAGE_SIZE` and
+        // `Self::page_count() * page::PAGE_SIZE`, hence the check below is sufficient.
+        if offset < self.size() {
+            self.index += 1;
+        } else {
+            return None;
+        }
+
+        // TODO: Use `NonNull::add()` instead, once the minimum supported compiler version is
+        // bumped to 1.80 or later.
+        //
+        // SAFETY: `offset` is in the interval `[0, (self.page_count() - 1) * page::PAGE_SIZE]`,
+        // hence the resulting pointer is guaranteed to be within the same allocation.
+        let ptr = unsafe { self.buf.as_ptr().add(offset) };
+
+        // SAFETY: `ptr` is guaranteed to be non-null given that it is derived from `self.buf`.
+        let ptr = unsafe { NonNull::new_unchecked(ptr) };
+
+        // SAFETY:
+        // - `ptr` is a valid pointer to a `Vmalloc` allocation.
+        // - `ptr` is valid for the duration of `'a`.
+        Some(unsafe { Vmalloc::to_page(ptr) })
+    }
+
+    fn size_hint(&self) -> (usize, Option<usize>) {
+        let remaining = self.page_count().saturating_sub(self.index);
+
+        (remaining, Some(remaining))
+    }
+}
+
+impl<'a> VmallocPageIter<'a> {
+    /// Creates a new [`VmallocPageIter`] instance.
+    ///
+    /// # Safety
+    ///
+    /// - `buf` must be a pointer to the beginning of a [`Vmalloc`] allocation.
+    /// - `buf` points to must at least be valid for the lifetime of `'a`.
+    /// - `size` must be the size of the [`Vmalloc`] allocation `buf` points to.
+    pub unsafe fn new(buf: NonNull<u8>, size: usize) -> Self {
+        // INVARIANT: `buf` is a valid pointer to the beginning of a `Vmalloc` allocation by the
+        // safety requirements of this function.
+        Self {
+            buf,
+            size,
+            index: 0,
+            _p: PhantomData,
+        }
+    }
+
+    /// Returns the base address of the backing [`Vmalloc`] allocation.
+    pub fn base_address(&self) -> NonNull<u8> {
+        self.buf
+    }
+
+    /// Returns the size of the backing [`Vmalloc`] allocation in bytes.
+    ///
+    /// Note that this is the size the [`Vmalloc`] allocation has been allocated with. Hence, this
+    /// number may be smaller than `[`Self::page_count`] * [`page::PAGE_SIZE`]`.
+    pub fn size(&self) -> usize {
+        self.size
+    }
+
+    /// Returns the number of pages owned by the backing [`Vmalloc`] allocation.
+    pub fn page_count(&self) -> usize {
+        self.size().div_ceil(page::PAGE_SIZE)
+    }
+}
-- 
2.50.1

