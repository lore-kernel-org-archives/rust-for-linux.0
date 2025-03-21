Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93015224B0D
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 11:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555751; cv=none; b=XubzoxMo77qrQksiJMKNuyN0/ex/sMGCWmEy110aHWo7NIHJL3fH5t5bZ6lnNpoRByt2aGXUag16i+ijMOUdqSsSP47eybHAIACozDH714FtzrVWoedmAgjvoBCbJxrZvGG2laV1s1rGBM2rLbI/HIM21hKllNI/Nmwa/LJKXyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555751; c=relaxed/simple;
	bh=YaeVlpzXjvPDkI4FnyVde0SzpQIycLSBwX+kZosLmRM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TocjhQq8tGBAKvnlvM6xNk4vDBv7+FWLQOPJwOYDJJk9pZACnF/ZC8k8KiM2i4WtVHwGALCM6UpVMM3EZa1E/Rs1JRzeSgcaKXPIhl8ouIcC0HhvTvb2zsFxD6jmfxKlyK6XPkt52KzKpUTYb8qxa0zpyRtnP6m0X8eFvY8sMIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KujQUkrU; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KujQUkrU"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so10863385e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 04:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742555747; x=1743160547; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FEtwWwxACgrctspVF7aNc849z/4SxoLV8lH9TGiMdMk=;
        b=KujQUkrU6yWcCX0a23r9OVcUyhlVDsxx8SkofN5zgvyj0iSulQEni68IXoNnp5LjWo
         s7aa3/v68IcQYRDi+VeIMTb5XNnvG0ytCM+n1shYMmHCMz910P8vTXlpI7cvE3/1HjG/
         kLOpylfynBZeWlr/OszE+w9Z1hJMvvM4KSIaWUdbQyzVqt9D1obknzEjwKaQfLbjb1Iz
         e9Y1dp7as7iYkN//z08waeCNVCx/4cVmISKAG5R1DuqxSSW8uM8DORE5Jkfjvr8A8o2x
         8nj2rLrQiijCX2nf81YUwyZv7QaM/RXmDvizCVSqZHT4/AU9umsTf7fO9t6VJJh0ACoR
         6KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742555747; x=1743160547;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FEtwWwxACgrctspVF7aNc849z/4SxoLV8lH9TGiMdMk=;
        b=N+QHWawqbngtuordV41PdqG5pCw15mK7X2QDPceZtU4UvV5OgEt9S5tyW43qqATi/U
         rVNwsF4+YtfObv4nuIPcZLrR6zx/Z79wtcAdD3lRBk07O42mpir3DNN0eKDXu5wdFDjN
         ViMC+pjtJ58PCXbcaZQZMHLuQ6A/MBRFAtLZ7fMytChUSJ2eWenajbZrRfLByEv6iQ/8
         yESnkrUQ21+xsOtfCXHHKBpOkjeb50UCawjMxHgU7lcBvnthL5datXkuRpgdA0HwtEMn
         3FrSM+5j87FD5s8hpgT8mW7p+3mKNRCRwOW/JwIN/5keXgdnAgcL3E7LECg35hfynzov
         5ddg==
X-Forwarded-Encrypted: i=1; AJvYcCUaZdwsgjN67Jb8soH5S9Ji/N3/QG4G7vNNl+ReN3lYzZIWu/syriVt0/P/9iYsIAEO1+R7merPheYwqQlyQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU9YZ3YSiD5Zmdvn8TjSDG3xxTtC1g9u+4DZ5TphMTTIjkJ+Oy
	BaQt47vDI6Ohq2VcFufqbJkgyQebLR0Sbgx5APg/cjY1ro5cs5iKlgFEU+D0XwjtCg==
X-Google-Smtp-Source: AGHT+IFc5s/EfYR5qKnhAVdyXTzHilce3ue1QCTbFoHoDkFtJ5ZgGvqfLHWcBi2NxYb+Xjr6XiaTrfs=
X-Received: from wmbbi17.prod.google.com ([2002:a05:600c:3d91:b0:43c:fe64:2de3])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1553:b0:43c:e7a7:1e76
 with SMTP id 5b1f17b1804b1-43d509e373fmr22742705e9.1.1742555746945; Fri, 21
 Mar 2025 04:15:46 -0700 (PDT)
Date: Fri, 21 Mar 2025 11:15:31 +0000
In-Reply-To: <20250321111535.3740332-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250321111535.3740332-1-bqe@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250321111535.3740332-4-bqe@google.com>
Subject: [PATCH v5 3/4] rust: add bitmap API.
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Provides an abstraction for C bitmap API and bitops operations.
Includes enough to implement a Binder data structure that was
introduced in commit 15d9da3f818c ("binder: use bitmap for faster
descriptor lookup"), namely drivers/android/dbitmap.h.

The implementation is optimized to represent the bitmap inline
if it would take the space of a pointer. This saves allocations.
We offer a safe API through bounds checks which panic if violated.

We use the `usize` type for sizes and indices into the bitmap,
because Rust generally always uses that type for indices and lengths
and it will be more convenient if the API accepts that type. This means
that we need to perform some casts to/from u32 and usize, since the C
headers use unsigned int instead of size_t/unsigned long for these
numbers in some places.

Adds new MAINTAINERS section BITMAP API [RUST].

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS           |   7 +
 rust/kernel/bitmap.rs | 293 ++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs    |   1 +
 3 files changed, 301 insertions(+)
 create mode 100644 rust/kernel/bitmap.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 7cd15c25a43c..bc8f05431689 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4114,6 +4114,13 @@ S:	Maintained
 F:	rust/helpers/bitmap.c
 F:	rust/helpers/cpumask.c
 
+BITMAP API [RUST]
+M:	Alice Ryhl <aliceryhl@google.com>
+M:	Burak Emir <bqe@google.com>
+R:	Yury Norov <yury.norov@gmail.com>
+S:	Maintained
+F:	rust/kernel/bitmap.rs
+
 BITOPS API
 M:	Yury Norov <yury.norov@gmail.com>
 R:	Rasmus Villemoes <linux@rasmusvillemoes.dk>
diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
new file mode 100644
index 000000000000..118dceaf2b4b
--- /dev/null
+++ b/rust/kernel/bitmap.rs
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Rust API for bitmap.
+//!
+//! C headers: [`include/linux/bitmap.h`](srctree/include/linux/bitmap.h).
+
+use crate::alloc::{AllocError, Flags};
+use crate::bindings;
+use core::ptr::NonNull;
+
+/// Holds either a pointer to array of `unsigned long` or a small bitmap.
+#[repr(C)]
+union BitmapRepr {
+  bitmap: usize,
+  ptr: NonNull<usize>
+}
+
+/// Represents a bitmap.
+///
+/// Wraps underlying C bitmap API.
+///
+/// # Examples
+///
+/// Basic usage
+///
+/// ```
+/// use kernel::alloc::flags::GFP_KERNEL;
+/// use kernel::bitmap::Bitmap;
+///
+/// let mut b = Bitmap::new(16, GFP_KERNEL)?;
+/// assert_eq!(16, b.len());
+/// for i in 0..16 {
+///   if i % 4 == 0 {
+///     b.set_bit(i);
+///   }
+/// }
+/// assert_eq!(Some(1), b.next_zero_bit(0));
+/// assert_eq!(Some(5), b.next_zero_bit(5));
+/// assert_eq!(Some(12), b.last_bit());
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// Requesting too large values results in [`AllocError`]
+///
+/// ```
+/// use kernel::alloc::flags::GFP_KERNEL;
+/// use kernel::bitmap::Bitmap;
+/// assert!(Bitmap::new(1 << 31, GFP_KERNEL).is_err());
+/// ```
+///
+/// # Invariants
+///
+/// * `nbits` is `<= i32::MAX - 1` and never changes.
+/// * if `nbits <= bindings::BITS_PER_LONG`, then `repr` is a bitmap.
+/// * otherwise, `repr` holds a non-null pointer that was obtained from a
+///   successful call to `bitmap_zalloc` and holds the address of an initialized
+///   array of `unsigned long` that is large enough to hold `nbits` bits.
+pub struct Bitmap {
+    /// Representation of bitmap.
+    repr: BitmapRepr,
+    /// Length of this bitmap. Must be `<= i32::MAX - 1`.
+    nbits: usize,
+}
+
+impl Drop for Bitmap {
+    fn drop(&mut self) {
+        if self.nbits <= bindings::BITS_PER_LONG as _ {
+            return
+        }
+        // SAFETY: `self.ptr` was returned by the C `bitmap_zalloc`.
+        //
+        // INVARIANT: there is no other use of the `self.ptr` after this
+        // call and the value is being dropped so the broken invariant is
+        // not observable on function exit.
+        unsafe { bindings::bitmap_free(self.as_mut_ptr()) };
+    }
+}
+
+impl Bitmap {
+    /// Constructs a new [`Bitmap`].
+    ///
+    /// If the length `nbits` is small enough to admit inline representation, this
+    /// implementation does not allocate.
+    ///
+    /// Fails with [`AllocError`] when the [`Bitmap`] could not be allocated. This
+    /// includes the case when `nbits` is greater than `i32::MAX - 1`.
+    #[inline]
+    pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError> {
+        if nbits <= bindings::BITS_PER_LONG as _ {
+            return Ok(Bitmap { repr: BitmapRepr { bitmap: 0 }, nbits });
+        }
+        if nbits <= i32::MAX.try_into().unwrap() {
+            let nbits_u32 = u32::try_from(nbits).unwrap();
+            // SAFETY: `nbits <= i32::MAX - 1` and the C function handles `nbits == 0`.
+            let ptr = unsafe { bindings::bitmap_zalloc(nbits_u32, flags.as_raw()) };
+            let ptr = NonNull::new(ptr).ok_or(AllocError)?;
+            // INVARIANT: `ptr` returned by C `bitmap_zalloc` and `nbits` checked.
+            return Ok(Bitmap {
+                repr: BitmapRepr { ptr },
+                nbits,
+            });
+        }
+        Err(AllocError)
+    }
+
+    /// Returns length of this [`Bitmap`].
+    #[inline]
+    pub fn len(&self) -> usize {
+        self.nbits
+    }
+
+    /// Returns a mutable raw pointer to the backing [`Bitmap`].
+    #[inline]
+    fn as_mut_ptr(&mut self) -> *mut usize {
+        if self.nbits <= bindings::BITS_PER_LONG as _ {
+            // SAFETY: Bitmap is represented inline.
+            unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
+        } else {
+            // SAFETY: Bitmap is represented as array of `unsigned long`.
+            unsafe { self.repr.ptr.as_mut() }
+        }
+    }
+
+    /// Returns a raw pointer to the backing [`Bitmap`].
+    #[inline]
+    fn as_ptr(&self) -> *const usize {
+        if self.nbits <= bindings::BITS_PER_LONG as _ {
+            // SAFETY: Bitmap is represented inline.
+            unsafe { core::ptr::addr_of!(self.repr.bitmap) }
+        } else {
+            // SAFETY: Bitmap is represented as array of `unsigned long`.
+            unsafe { self.repr.ptr.as_ptr() }
+        }
+    }
+
+    /// Set bit with index `index`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn set_bit(&mut self, index: usize) {
+        assert!(
+            index < self.nbits,
+            "Bit `index` must be < {}, was {}",
+            self.nbits,
+            index
+        );
+        // SAFETY: Bit `index` is within bounds.
+        unsafe { bindings::__set_bit(index as u32, self.as_mut_ptr()) };
+    }
+
+    /// Set bit with index `index`, atomically.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn set_bit_atomic(&self, index: usize) {
+        assert!(
+            index < self.nbits,
+            "Bit `index` must be < {}, was {}",
+            self.nbits,
+            index
+        );
+        // SAFETY: `index` is within bounds and `set_bit` is atomic.
+        unsafe { bindings::set_bit(index as u32, self.as_ptr() as *mut usize) };
+    }
+
+    /// Clear bit with index `index`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn clear_bit(&mut self, index: usize) {
+        assert!(
+            index < self.nbits,
+            "Bit `index` must be < {}, was {}",
+            self.nbits,
+            index
+        );
+        // SAFETY: `index` is within bounds.
+        unsafe { bindings::__clear_bit(index as u32, self.as_mut_ptr()) };
+    }
+
+    /// Clear bit with index `index`, atomically.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn clear_bit_atomic(&self, index: usize) {
+        assert!(
+            index < self.nbits,
+            "Bit `index` must be < {}, was {}",
+            self.nbits,
+            index
+        );
+        // SAFETY: `index` is within bounds and `clear_bit` is atomic.
+        unsafe { bindings::clear_bit(index as u32, self.as_ptr() as *mut usize) };
+    }
+
+    /// Copy `src` into this [`Bitmap`] and set any remaining bits to zero.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+    /// use kernel::bitmap::Bitmap;
+    ///
+    /// let mut long_bitmap = Bitmap::new(256, GFP_KERNEL)?;
+    /// assert_eq!(None, long_bitmap.last_bit());
+    /// let mut short_bitmap = Bitmap::new(16, GFP_KERNEL)?;
+    /// short_bitmap.set_bit(7);
+    ///
+    /// long_bitmap.copy_and_extend(&short_bitmap);
+    /// assert_eq!(Some(7), long_bitmap.last_bit());
+    ///
+    /// long_bitmap.clear_bit(7);
+    /// assert_eq!(None, long_bitmap.last_bit());
+    ///
+    /// # Ok::<(), AllocError>(())
+    /// ```
+    #[inline]
+    pub fn copy_and_extend(&mut self, src: &Bitmap) {
+        let len = core::cmp::min(src.nbits, self.nbits);
+        // SAFETY: access to `self` and `src` is within bounds.
+        unsafe {
+            bindings::bitmap_copy_and_extend(
+                self.as_mut_ptr(),
+                src.as_ptr(),
+                len as u32,
+                self.nbits as u32,
+            )
+        };
+    }
+
+    /// Finds last bit that is set.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+    /// use kernel::bitmap::Bitmap;
+    ///
+    /// let bitmap = Bitmap::new(64, GFP_KERNEL)?;
+    /// match bitmap.last_bit() {
+    ///     Some(idx) => {
+    ///         pr_info!("The last bit has index {idx}.\n");
+    ///     }
+    ///     None => {
+    ///         pr_info!("All bits in this bitmap are 0.\n");
+    ///     }
+    /// }
+    /// # Ok::<(), AllocError>(())
+    /// ```
+    #[inline]
+    pub fn last_bit(&self) -> Option<usize> {
+        // SAFETY: `nbits == 0` is supported and access is within bounds.
+        let index = unsafe { bindings::_find_last_bit(self.as_ptr(), self.nbits) };
+        if index == self.nbits {
+            None
+        } else {
+            Some(index)
+        }
+    }
+
+    /// Finds next zero bit, starting from `start`.
+    ///
+    /// # Panics
+    ///
+    /// Panics if `index` is greater than or equal to `self.nbits`.
+    #[inline]
+    pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
+        assert!(
+            start < self.nbits,
+            "Offset `start` must be < {}, was {}",
+            self.nbits,
+            start
+        );
+
+        // SAFETY: access is within bounds.
+        let index = unsafe { bindings::_find_next_zero_bit(self.as_ptr(), self.nbits, start) };
+        if index == self.nbits {
+            None
+        } else {
+            Some(index)
+        }
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b46bc481d94..9f675c0841e6 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -36,6 +36,7 @@
 pub use ffi;
 
 pub mod alloc;
+pub mod bitmap;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
 #[doc(hidden)]
-- 
2.49.0.395.g12beb8f557-goog

