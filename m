Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FB0321430
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701696; cv=none; b=LDxZmZmfIMxhSDDE23XGRWYHuNmVQmYtD9Fz37EhyoQevqNLWVbGfy4bd4IuEFlae8eDe2c721g26yVs2MJGW3EHcocRo5Mt6hfjbuWGuUvcPr8YA2Od1tpEv77p1HxlhrMu8G4eB/REkyFCDRZdhXWhb/V0naAbYJ1c9vL9IFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701696; c=relaxed/simple;
	bh=uT4U1/TMr7E8tTr+E+rHYczgFh2mgpS62XPXW4XwN0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KToyshpcuOrTX6FfG7Y5VATtOj46/du8A7Az17aAxRazTkSjkK3VRHbaUEAHwvrqqagrkD/xDYw2pAtotWsOGlDmV7c29Vtu0vfxCVLuUjZ0Y/lBAHWH48CjQM+IKIT2CFD2JLs0mKlNYuI0cN6EmAC1bnLUwnskfizt/ohmhZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8vdB5qF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8vdB5qF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F38C113CF;
	Wed, 20 Aug 2025 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755701696;
	bh=uT4U1/TMr7E8tTr+E+rHYczgFh2mgpS62XPXW4XwN0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I8vdB5qFS5JPostOz5d1j9iNL0xV0jLueaZ63OhrAyOsOjryGd2ew37R6ZoMXDInm
	 cafNS85wA6GykoFYt/1S197/pyMi0j0ZLXopMrcjI0EQutbtCrUvjeZMEl+dMZkhJG
	 DVSWuF9Klw3lytW3/DLu0DRzMPv/8w19W0If/qTGLCBePvWzC1bm6OkIbk1Ogez0zB
	 AkrhhPAX6pj0MEM0rAaAFw2gMBIo2jd7Wzx+/4xrfp1UtRhUT3uIxaX/JUDdOkPebU
	 2sT5iL1igpixybHwvRQwnEUtej9q2ziXth+RZ9TcL+4obxmi5amWlFeJV/mU+RtZ/M
	 4w9gnFyYQb/vQ==
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
Subject: [PATCH v5 3/7] rust: alloc: implement VmallocPageIter
Date: Wed, 20 Aug 2025 16:53:39 +0200
Message-ID: <20250820145434.94745-4-dakr@kernel.org>
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

Introduce the VmallocPageIter type; an instance of VmallocPageIter may
be exposed by owners of vmalloc allocations to provide borrowed access
to its backing pages.

For instance, this is useful to access and borrow the backing pages of
allocation primitives, such as Box and Vec, backing a scatterlist.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/allocator.rs | 103 +++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 2315f5063011..103be3e68eac 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -10,6 +10,7 @@
 
 use super::Flags;
 use core::alloc::Layout;
+use core::marker::PhantomData;
 use core::ptr;
 use core::ptr::NonNull;
 
@@ -236,3 +237,105 @@ unsafe fn realloc(
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
+/// - `buf` is a valid and [`page::PAGE_SIZE`] aligned pointer into a [`Vmalloc`] allocation.
+/// - `size` is the number of bytes from `buf` until the end of the [`Vmalloc`] allocation `buf`
+///   points to.
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
+    /// - `buf` must be a [`page::PAGE_SIZE`] aligned pointer into a [`Vmalloc`] allocation.
+    /// - `buf` must be valid for at least the lifetime of `'a`.
+    /// - `size` must be the number of bytes from `buf` until the end of the [`Vmalloc`] allocation
+    ///   `buf` points to.
+    pub unsafe fn new(buf: NonNull<u8>, size: usize) -> Self {
+        // INVARIANT: By the safety requirements, `buf` is a valid and `page::PAGE_SIZE` aligned
+        // pointer into a [`Vmalloc`] allocation.
+        Self {
+            buf,
+            size,
+            index: 0,
+            _p: PhantomData,
+        }
+    }
+
+    /// Returns the base address of the backing [`Vmalloc`] allocation.
+    #[inline]
+    pub fn base_address(&self) -> NonNull<u8> {
+        self.buf
+    }
+
+    /// Returns the size of the backing [`Vmalloc`] allocation in bytes.
+    ///
+    /// Note that this is the size the [`Vmalloc`] allocation has been allocated with. Hence, this
+    /// number may be smaller than `[`Self::page_count`] * [`page::PAGE_SIZE`]`.
+    #[inline]
+    pub fn size(&self) -> usize {
+        self.size
+    }
+
+    /// Returns the number of pages owned by the backing [`Vmalloc`] allocation.
+    #[inline]
+    pub fn page_count(&self) -> usize {
+        self.size().div_ceil(page::PAGE_SIZE)
+    }
+}
-- 
2.50.1

