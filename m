Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0160A28643A
	for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753536224; cv=none; b=hUAtDst+IHCYq7trejDQUvOSKif/+kQk+jhlalSpKFyCqV3SvcuOXdRo21EjWxxRIM7O4JjkqP06DgBK9Wq6CuNwc8HyqmEegG/SN+E7WS5OMdYX3zlhKTJ46odT2q61Yx/PbGdnkynXVVDg+mjQqwJ1VwXlTxaBFncUZI5OXvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753536224; c=relaxed/simple;
	bh=XDv7xqVzGr3tjiLDY2GZay8L0P/ScjmmwU5AHWOuiak=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SChqHk8hkvLCgNch/NE5bsUBSQra8O5d+NgGNRp2ekOmYhdPTXG+D3Y2SwU0k7L34/n6YB01j9A6evtti5gb0nQ8bstbWIgKcFSHHPOo1aZii7+5Ws9ApLNLArf1aPFOMlY1taokMYSijc3UI3qy2RnsGGOdll2UErbglSaTVMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kWBh80nv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kWBh80nv"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4560a30a793so10726735e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 26 Jul 2025 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753536221; x=1754141021; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgwHbCr2ZvmYKCAvZ6Jo8foujNnaH3MRKvB5fhzEjBk=;
        b=kWBh80nvzE/Q2sFVpC/QNk4GdlfznGqhraCjw9Uc/LwPdL5M9UHflZKJiJb4/T1TWX
         QugZ47gB51ME1OhrJJXV+UarEav7cdEUPsEsGfYyP3Vj8CabwbjIk/zW7yC5UXQ3QE1t
         KHaxITjOqvHbvo3I0mRut3xpOOxOeQ8g5+gkOUVKFloKVtwb1BLymdz/iHI4rPWZu/ub
         UW5w4PtSKtrs6szGQgjpQNIaMQ/so4YAR2lSbZ8fQddMTX9jHlU+TDRO+o27GwoNZXz6
         RPf1CZ/+WG5xPU/E1xmo953VX7argB8axBqYdVNrhEPUjDAJjGZ7yQxcDXWpRGmjcpwS
         rqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753536221; x=1754141021;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgwHbCr2ZvmYKCAvZ6Jo8foujNnaH3MRKvB5fhzEjBk=;
        b=UXrQeoFsWOjdOsmhcOS9sANN8UL3smjBNdkoOaxsYRsu2MSefwK8SuPtJYw7g9fJ1P
         BVyvTj3dFd1z3huvuKD3nrZgl/ehok2C2MXuDxTefD4rOsbv+7Wm4BFrWnK28dYqSDFF
         JEGFfAmmlwqZXL+5xMW7vN16Qt9Gk7YSrEla/pcxZ8g/k0iSVdhNm8pEPyIR3k/tEFTx
         ln8b8hcL0YvR72BXx7DEGoH3m9ZsxevQCLSn3kC8aWTqIQdNHKL/yeh5rnZ13anAK3Av
         VxtVrgRpChRCi9BOZcF5pwHOlDHrsWP2owN/OHeM8BYM5dxMTDnD7S61duslln5s/GaN
         NQXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSISfGYRNQB8R0ocL9ym3xNu1YPOpqK1CccDr0PCK70hQo9+NcuFxDdrXNj1S+A5zTA3cO57LMuad4SO4pYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQszgpWORv8RxC/cJOBWr5LKkj3zpCZqh5hvLww1CW+0VuUsE
	HYzZzs4KhQ3ULNNDsFlrSRY3PeyBoB1zL8Sj5251f90h9F1vqAmwxeYPPXxGjmI2xZlS4sD5frI
	NlJosrjxE63+l4tHxeA==
X-Google-Smtp-Source: AGHT+IHK0oinGXcTRpIRR9GkmcUt0z0luOQdU/wKAKEP5Mdo9w8BMXUuDfOXSr1dZ2NTcmmdHQ/ztKHyo4udlFU=
X-Received: from wmsd5.prod.google.com ([2002:a05:600c:3ac5:b0:456:134a:a210])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548a:b0:450:d30e:ff96 with SMTP id 5b1f17b1804b1-4587631c069mr50085215e9.0.1753536221362;
 Sat, 26 Jul 2025 06:23:41 -0700 (PDT)
Date: Sat, 26 Jul 2025 13:23:24 +0000
In-Reply-To: <20250726-maple-tree-v1-0-27a3da7cb8e5@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250726-maple-tree-v1-0-27a3da7cb8e5@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6486; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=XDv7xqVzGr3tjiLDY2GZay8L0P/ScjmmwU5AHWOuiak=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBohNbXyRmF2zytMMMrm4rFmcdjquo0alEVhk3Vl
 CXdwtTdF7iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaITW1wAKCRAEWL7uWMY5
 RhWDD/9l1MeQpBGr+HV7JMdLIjd2i9o0iNLwnnm6xX7E0mrEmHWsUQ5bRH0W+p/8tudSkN9xG0o
 PTt0cR7RIw42ZpHN3ewphysCo5tvFzedmCj+Mxz6r64n7QQvm46pl3bksPmndh+E3pMGnNABAr+
 9nY3OJkCOCjZK9X0Fu/hRgntpDkqMfs2Ux9LkDUtAf125aDF931odgruaYhLUZD9Le6lyjeFC5R
 vydFnAf0zHh+03ZkMMM/SR0WKJmwN5NytueHgJa1A1qxgkefT6K37nVGklV/UvrE0E8ESoVbeqM
 xP1vbvwjUZcWtafW3oOzZTXAeslkFn0AEV8Hc9+HWWoO9esbZrL8KG6+zTsrIuXE2z2RtNbWr0r
 hM+ViSO2TX+ZbZXFIkxErX2QrpETKvcNp6VpWVoi2Cy7oTwoMvV+Yuhustg88E9k8BnEqTLzVWT
 HzuxHgOJHIPMP6J5pGq99NS7CA90Jz/S6LNabFVKICycYiWoFeYktvnmwSND0UAUvcmCCqSVnFM
 3QUo53DympxOQ0nk48KweRmq31fKIabyZKncDdq2/nYJ8n1AHNCItDDgTt1XL0s0MgC0ohN2Ew5
 AmBdjifFMO443CQjeqSsc1Cbu8e8D4lKI1T0JC7a6xloZHxBzpsjznPz+qada3iRteJq4rWPwAT NBEBElt7effAZPQ==
X-Mailer: b4 0.14.2
Message-ID: <20250726-maple-tree-v1-3-27a3da7cb8e5@google.com>
Subject: [PATCH 3/3] rust: maple_tree: add MapleTreeAlloc
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	maple-tree@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To support allocation trees, we introduce a new type MapleTreeAlloc for
the case where the tree is created using MT_FLAGS_ALLOC_RANGE. To ensure
that you can only call mtree_alloc_range on an allocation tree, we
restrict thta method to the new MapleTreeAlloc type. However, all
methods on MapleTree remain accessible to MapleTreeAlloc as allocation
trees can use the other methods without issues.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/maple_tree.rs | 158 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
index c7ef504a9c78065b3d5752b4f5337fb6277182d1..8c025d2c395b6d57f1fb16214b4e87d4e7942d6f 100644
--- a/rust/kernel/maple_tree.rs
+++ b/rust/kernel/maple_tree.rs
@@ -32,6 +32,26 @@ pub struct MapleTree<T: ForeignOwnable> {
     _p: PhantomData<T>,
 }
 
+/// A maple tree with `MT_FLAGS_ALLOC_RANGE` set.
+///
+/// All methods on [`MapleTree`] are also accessible on this type.
+#[pin_data]
+#[repr(transparent)]
+pub struct MapleTreeAlloc<T: ForeignOwnable> {
+    #[pin]
+    tree: MapleTree<T>,
+}
+
+// Make MapleTree methods usable on MapleTreeAlloc.
+impl<T: ForeignOwnable> core::ops::Deref for MapleTreeAlloc<T> {
+    type Target = MapleTree<T>;
+
+    #[inline]
+    fn deref(&self) -> &MapleTree<T> {
+        &self.tree
+    }
+}
+
 #[inline]
 fn to_maple_range(range: impl RangeBounds<usize>) -> Option<(usize, usize)> {
     let first = match range.start_bound() {
@@ -342,6 +362,107 @@ pub fn load(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
     }
 }
 
+impl<T: ForeignOwnable> MapleTreeAlloc<T> {
+    /// Create a new allocation tree.
+    pub fn new() -> impl PinInit<Self> {
+        let tree = pin_init!(MapleTree {
+            // SAFETY: This initializes a maple tree into a pinned slot. The maple tree will be
+            // destroyed in Drop before the memory location becomes invalid.
+            tree <- Opaque::ffi_init(|slot| unsafe {
+                bindings::mt_init_flags(slot, bindings::MT_FLAGS_ALLOC_RANGE)
+            }),
+            _p: PhantomData,
+        });
+
+        pin_init!(MapleTreeAlloc { tree <- tree })
+    }
+
+    /// Insert an entry with the given size somewhere in the given range.
+    ///
+    /// The maple tree will search for a location in the given range where there is space to insert
+    /// the new range. If there is not enough available space, then an error will be returned.
+    ///
+    /// The index of the new range is returned.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::maple_tree::{MapleTreeAlloc, AllocErrorKind};
+    ///
+    /// let tree = KBox::pin_init(MapleTreeAlloc::<KBox<i32>>::new(), GFP_KERNEL)?;
+    ///
+    /// let ten = KBox::new(10, GFP_KERNEL)?;
+    /// let twenty = KBox::new(20, GFP_KERNEL)?;
+    /// let thirty = KBox::new(30, GFP_KERNEL)?;
+    /// let hundred = KBox::new(100, GFP_KERNEL)?;
+    ///
+    /// // Allocate three ranges.
+    /// let idx1 = tree.alloc_range(100, ten, ..1000, GFP_KERNEL)?;
+    /// let idx2 = tree.alloc_range(100, twenty, ..1000, GFP_KERNEL)?;
+    /// let idx3 = tree.alloc_range(100, thirty, ..1000, GFP_KERNEL)?;
+    ///
+    /// assert_eq!(idx1, 0);
+    /// assert_eq!(idx2, 100);
+    /// assert_eq!(idx3, 200);
+    ///
+    /// // This will fail because the remaining space is too small.
+    /// assert_eq!(
+    ///     tree.alloc_range(800, hundred, ..1000, GFP_KERNEL).unwrap_err().cause,
+    ///     AllocErrorKind::Busy,
+    /// );
+    /// # Ok::<_, Error>(())
+    /// ```
+    pub fn alloc_range<R>(
+        &self,
+        size: usize,
+        value: T,
+        range: R,
+        gfp: Flags,
+    ) -> Result<usize, AllocError<T>>
+    where
+        R: RangeBounds<usize>,
+    {
+        let Some((min, max)) = to_maple_range(range) else {
+            return Err(AllocError {
+                value,
+                cause: AllocErrorKind::InvalidRequest,
+            });
+        };
+
+        let ptr = T::into_foreign(value);
+        let mut index = 0;
+
+        // SAFETY: The tree is valid, and we are passing a pointer to an owned instance of `T`.
+        let res = to_result(unsafe {
+            bindings::mtree_alloc_range(
+                self.tree.tree.get(),
+                &mut index,
+                ptr,
+                size,
+                min,
+                max,
+                gfp.as_raw(),
+            )
+        });
+
+        if let Err(err) = res {
+            // SAFETY: As `mtree_alloc_range` failed, it is safe to take back ownership.
+            let value = unsafe { T::from_foreign(ptr) };
+
+            let cause = if err == ENOMEM {
+                AllocErrorKind::Nomem
+            } else if err == EBUSY {
+                AllocErrorKind::Busy
+            } else {
+                AllocErrorKind::InvalidRequest
+            };
+            Err(AllocError { value, cause })
+        } else {
+            Ok(index)
+        }
+    }
+}
+
 /// Error type for failure to insert a new value.
 pub struct InsertError<T> {
     /// The value that could not be inserted.
@@ -378,3 +499,40 @@ fn from(insert_err: InsertError<T>) -> Error {
         Error::from(insert_err.cause)
     }
 }
+
+/// Error type for failure to insert a new value.
+pub struct AllocError<T> {
+    /// The value that could not be inserted.
+    pub value: T,
+    /// The reason for the failure to insert.
+    pub cause: AllocErrorKind,
+}
+
+/// The reason for the failure to insert.
+#[derive(PartialEq, Eq, Copy, Clone)]
+pub enum AllocErrorKind {
+    /// There is not enough space for the requested allocation.
+    Busy,
+    /// Failure to allocate memory.
+    Nomem,
+    /// The insertion request was invalid.
+    InvalidRequest,
+}
+
+impl From<AllocErrorKind> for Error {
+    #[inline]
+    fn from(kind: AllocErrorKind) -> Error {
+        match kind {
+            AllocErrorKind::Busy => EBUSY,
+            AllocErrorKind::Nomem => ENOMEM,
+            AllocErrorKind::InvalidRequest => EINVAL,
+        }
+    }
+}
+
+impl<T> From<AllocError<T>> for Error {
+    #[inline]
+    fn from(insert_err: AllocError<T>) -> Error {
+        Error::from(insert_err.cause)
+    }
+}

-- 
2.50.1.470.g6ba607880d-goog

