Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554771DA3D
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754676739; cv=none; b=rCb0XEzKqnuHCo8HAjO1hWr5MEWsrDoMIQflX9PpPCyehsK9e+HxbjRv6B4cyaIZWOrqEl5je5Z19cAGut9OoUd+eSi9zuikWzb5/0/6R3l3+VLFH1gqAYj/+h8P3uictn+k6c2gTPLjRc3FueQKAaPLOWZCSRo15BIHIpxaQ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754676739; c=relaxed/simple;
	bh=+bAJrjVZY5gu9Jz2uq0aLVq+7CdtuLb4Lt3g/phO0Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQFTVsY5BW5cqs3KHQcE0lHOA04y24hLmpFiPvgU1/tTLpFUYqFi9a7JN4EjPFJRptK9KVD08uPFMYkwRCWYSsLIyAMsIAjuB+SGpf/7V2fHXOmYtddOEKoe728sm/hNUxDexuccpAzSDdFrkwBUuNTyXTsbAChHJZ5jRnMe4SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=om4Ob3rB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="om4Ob3rB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6471BC4CEF8;
	Fri,  8 Aug 2025 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754676738;
	bh=+bAJrjVZY5gu9Jz2uq0aLVq+7CdtuLb4Lt3g/phO0Ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=om4Ob3rBE4IrtHnavs1ShYhXdUy9HE0qpX1X5f1HEYHx2RHddeGLmfaUj6EcWvrKy
	 hGw5YV0Z2BFtCii7PTPQ4CZ2YUuytV8z+aV0yOIjwpTI5EL8McyK8qiu+xzGcnJ/Ps
	 q+h+7K9lxpNabAwx6KnYw+ryWQwZmYPK0wvhjr/J9Iun74TCxYHZHGW0T54jcZKyzn
	 +pB0N9Hcj0e7UE608HkAOPgppsiwv9f5bMjYNtMB+r2rpa7XX3ekURRn0wSeNW0bOf
	 FqT+qQDliSL1Wcg/ZbxlMSv0aAsDceeiU7I4P6g8BtVvAEhTWeD/vUzGqqfHJtbPs+
	 hZhuLWrPjANDA==
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
Subject: [PATCH v3 3/7] rust: alloc: implement VmallocPageIter
Date: Fri,  8 Aug 2025 20:10:17 +0200
Message-ID: <20250808181155.223504-4-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808181155.223504-1-dakr@kernel.org>
References: <20250808181155.223504-1-dakr@kernel.org>
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
 rust/kernel/alloc/allocator.rs | 92 ++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 2315f5063011..3ed2d5ff1e37 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -10,6 +10,7 @@
 
 use super::Flags;
 use core::alloc::Layout;
+use core::marker::PhantomData;
 use core::ptr;
 use core::ptr::NonNull;
 
@@ -236,3 +237,94 @@ unsafe fn realloc(
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
+    _p: PhantomData<&'a u8>,
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

