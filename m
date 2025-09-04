Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3BB302CC8
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Sep 2025 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004628; cv=none; b=SIASqJgy97PEQ9pqdeWvjy1g+HzjvF4+vIMmyWozyAaNscLpnjO8dfAwXLnpXq8i6uH2tvRUifh5aw/O00NRjCOgEfwR7PgsdzooCleG7c+kjUtTNdPBf5bpeSeV0bz10DYL2Xs0YP4yBHWQcBLl0nfsV7yVPH99PJNgwY+PGJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004628; c=relaxed/simple;
	bh=DVpfp1V5U+zmdZD5x0TGGmHec3RE56P4hJzLGkhqAok=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eP/ogy3dofHzTkv/CDbBtCMVFfbqS/pITXc76t/dh78I336rw75p6j9mk16Bd0f3KthvIuXZONshcJh6wavwEgA9424RhBELQgRSjM3zx4uUxBvhKsmWjt2azwEGTtwmys1iQ2nVnBjuBDi1fvoAWWS2wg5BhacI3FXQAKMQjr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o25e4wto; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o25e4wto"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b9c1b74e1so8142575e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Sep 2025 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757004623; x=1757609423; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqniLRQ1WhMUGHKyeRbk6ymh9mMKakd5DBqcVK6FLkY=;
        b=o25e4wtoaUpQ5XiGDJrT2auO55Klsn12q3z+NiwSEGm/HXy0zVRSnykTzPh+JJZYIT
         m3tmoVgcfEUwCJpkJqmQA+Iym/XoAXalgvI85/X7B9VppO9qUcCAF0cZcNKvMc6KCyEL
         Ymn+N07U98qNNzsljev1CfqjDgvijV3s5zm3gCIBZbAmHvumtDjApbwPXKA9mMiWI8aj
         CjL4DTiNlgAGsJai0oFR+lM90mBt9NLGfMEQjwTeLGrJUH/AABQsbsy5G7VL440mjYig
         pprDlYlfyxeDDQ40+ih2wS8T+aSXRaXhXWBP6ZUbgWXyi1l9NMZWpJjkEv8looKtyKOo
         ya6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004623; x=1757609423;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqniLRQ1WhMUGHKyeRbk6ymh9mMKakd5DBqcVK6FLkY=;
        b=hQaRsFASlvNrd2ES/2+uiuo4Y6cFHXrln9Wqj3a7DJjTREnntGFkUzdXr3fU2N1XM/
         AwY09dP/tWeryqTSzIViTYSwZPEYzeTmtFqjj6coOB/sRJAAIgMRNqfTM+AZNOosHKbX
         /YTVctBHTsNPdKYffvKAr21oOVwutJ+oUrfWUGeOR1UlLK4aDQGJhvnx3AzK4fguB2TI
         4sVQtxndltTZSfcIINNrvL39OhzRStS1SK5xkkDlg5MNxNBTXS+l1Ot+u7lM5M2nQsU+
         u3rFkSyVxzmgE00rLRVrR7rwyK3Utdu0HYSf4ojGCTMFlVz2nlAYZfqpW7KnC5kwpblv
         PYIg==
X-Forwarded-Encrypted: i=1; AJvYcCU/3doIg4DvNhjrTTaOTbUyTg7SmtvVE9Xl8MesL4DwC3ATpAOQq+mxwzMD7Wzh9D7Bnbo9KTDs6ZbgMLvZ0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCbeqKDCMiOEq3N6UM3MCUsrUZneNrOBm3HWH5Wn07ILVk0OQX
	TuAl+6ucyMWXcNxac10SbG+in8I5PfV1A7osOkdMTe01eULGyKr58tud0Z81gYVYVwuhHw==
X-Google-Smtp-Source: AGHT+IFUJMbhrhmmfsVCGPz0fLLygzvdgSlU5jlelnMP2OikigZ82bKz27U2sGewnv2ESRYylDWSh+Q=
X-Received: from wmer2.prod.google.com ([2002:a05:600c:4342:b0:45d:d1f2:48ba])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1914:b0:45b:88d6:8dbe
 with SMTP id 5b1f17b1804b1-45b88d6939amr157411045e9.7.1757004623428; Thu, 04
 Sep 2025 09:50:23 -0700 (PDT)
Date: Thu,  4 Sep 2025 16:50:09 +0000
In-Reply-To: <20250904165015.3791895-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250904165015.3791895-1-bqe@google.com>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
Message-ID: <20250904165015.3791895-6-bqe@google.com>
Subject: [PATCH v15 5/5] rust: add dynamic ID pool abstraction for bitmap
From: Burak Emir <bqe@google.com>
To: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>
Cc: Burak Emir <bqe@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This is a port of the Binder data structure introduced in commit
15d9da3f818c ("binder: use bitmap for faster descriptor lookup") to
Rust.

Like drivers/android/dbitmap.h, the ID pool abstraction lets
clients acquire and release IDs. The implementation uses a bitmap to
know what IDs are in use, and gives clients fine-grained control over
the time of allocation. This fine-grained control is needed in the
Android Binder. We provide an example that release a spinlock for
allocation and unit tests (rustdoc examples).

The implementation does not permit shrinking below capacity below
BITS_PER_LONG.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS            |   1 +
 rust/kernel/id_pool.rs | 226 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 3 files changed, 228 insertions(+)
 create mode 100644 rust/kernel/id_pool.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 444aa282b8cd..f838135932f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4309,6 +4309,7 @@ R:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
 F:	lib/find_bit_benchmark_rust.rs
 F:	rust/kernel/bitmap.rs
+F:	rust/kernel/id_pool.rs
 
 BITOPS API
 M:	Yury Norov <yury.norov@gmail.com>
diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
new file mode 100644
index 000000000000..a41a3404213c
--- /dev/null
+++ b/rust/kernel/id_pool.rs
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Rust API for an ID pool backed by a [`BitmapVec`].
+
+use crate::alloc::{AllocError, Flags};
+use crate::bitmap::BitmapVec;
+
+const BITS_PER_LONG: usize = bindings::BITS_PER_LONG as usize;
+
+/// Represents a dynamic ID pool backed by a [`BitmapVec`].
+///
+/// Clients acquire and release IDs from unset bits in a bitmap.
+///
+/// The capacity of the ID pool may be adjusted by users as
+/// needed. The API supports the scenario where users need precise control
+/// over the time of allocation of a new backing bitmap, which may require
+/// release of spinlock.
+/// Due to concurrent updates, all operations are re-verified to determine
+/// if the grow or shrink is sill valid.
+///
+/// # Examples
+///
+/// Basic usage
+///
+/// ```
+/// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+/// use kernel::id_pool::IdPool;
+///
+/// let mut pool = IdPool::new(64, GFP_KERNEL)?;
+/// for i in 0..64 {
+///     assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
+/// }
+///
+/// pool.release_id(23);
+/// assert_eq!(23, pool.acquire_next_id(0).ok_or(ENOSPC)?);
+///
+/// assert_eq!(None, pool.acquire_next_id(0));  // time to realloc.
+/// let resizer = pool.grow_request().ok_or(ENOSPC)?.realloc(GFP_KERNEL)?;
+/// pool.grow(resizer);
+///
+/// assert_eq!(pool.acquire_next_id(0), Some(64));
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// Releasing spinlock to grow the pool
+///
+/// ```no_run
+/// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+/// use kernel::sync::{new_spinlock, SpinLock};
+/// use kernel::id_pool::IdPool;
+///
+/// fn get_id_maybe_realloc(guarded_pool: &SpinLock<IdPool>) -> Result<usize, AllocError> {
+///     let mut pool = guarded_pool.lock();
+///     loop {
+///         match pool.acquire_next_id(0) {
+///             Some(index) => return Ok(index),
+///             None => {
+///                 let alloc_request = pool.grow_request();
+///                 drop(pool);
+///                 let resizer = alloc_request.ok_or(AllocError)?.realloc(GFP_KERNEL)?;
+///                 pool = guarded_pool.lock();
+///                 pool.grow(resizer)
+///             }
+///         }
+///     }
+/// }
+/// ```
+pub struct IdPool {
+    map: BitmapVec,
+}
+
+/// Indicates that an [`IdPool`] should change to a new target size.
+pub struct ReallocRequest {
+    num_ids: usize,
+}
+
+/// Contains a [`BitmapVec`] of a size suitable for reallocating [`IdPool`].
+pub struct PoolResizer {
+    new: BitmapVec,
+}
+
+impl ReallocRequest {
+    /// Allocates a new backing [`BitmapVec`] for [`IdPool`].
+    ///
+    /// This method only prepares reallocation and does not complete it.
+    /// Reallocation will complete after passing the [`PoolResizer`] to the
+    /// [`IdPool::grow`] or [`IdPool::shrink`] operation, which will check
+    /// that reallocation still makes sense.
+    pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
+        let new = BitmapVec::new(self.num_ids, flags)?;
+        Ok(PoolResizer { new })
+    }
+}
+
+impl IdPool {
+    /// Constructs a new [`IdPool`].
+    ///
+    /// A capacity below [`BITS_PER_LONG`] is adjusted to
+    /// [`BITS_PER_LONG`].
+    ///
+    /// [`BITS_PER_LONG`]: srctree/include/asm-generic/bitsperlong.h
+    #[inline]
+    pub fn new(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
+        let num_ids = core::cmp::max(num_ids, BITS_PER_LONG);
+        let map = BitmapVec::new(num_ids, flags)?;
+        Ok(Self { map })
+    }
+
+    /// Returns how many IDs this pool can currently have.
+    #[inline]
+    pub fn capacity(&self) -> usize {
+        self.map.len()
+    }
+
+    /// Returns a [`ReallocRequest`] if the [`IdPool`] can be shrunk, [`None`] otherwise.
+    ///
+    /// The capacity of an [`IdPool`] cannot be shrunk below [`BITS_PER_LONG`].
+    ///
+    /// [`BITS_PER_LONG`]: srctree/include/asm-generic/bitsperlong.h
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+    /// use kernel::id_pool::{ReallocRequest, IdPool};
+    ///
+    /// let mut pool = IdPool::new(1024, GFP_KERNEL)?;
+    /// let alloc_request = pool.shrink_request().ok_or(AllocError)?;
+    /// let resizer = alloc_request.realloc(GFP_KERNEL)?;
+    /// pool.shrink(resizer);
+    /// assert_eq!(pool.capacity(), kernel::bindings::BITS_PER_LONG as usize);
+    /// # Ok::<(), AllocError>(())
+    /// ```
+    #[inline]
+    pub fn shrink_request(&self) -> Option<ReallocRequest> {
+        let cap = self.capacity();
+        // Shrinking below [`BITS_PER_LONG`] is never possible.
+        if cap <= BITS_PER_LONG {
+            return None;
+        }
+        // Determine if the bitmap can shrink based on the position of
+        // its last set bit. If the bit is within the first quarter of
+        // the bitmap then shrinking is possible. In this case, the
+        // bitmap should shrink to half its current size.
+        let Some(bit) = self.map.last_bit() else {
+            return Some(ReallocRequest {
+                num_ids: BITS_PER_LONG,
+            });
+        };
+        if bit >= (cap / 4) {
+            return None;
+        }
+        let num_ids = usize::max(BITS_PER_LONG, cap / 2);
+        Some(ReallocRequest { num_ids })
+    }
+
+    /// Shrinks pool by using a new [`BitmapVec`], if still possible.
+    #[inline]
+    pub fn shrink(&mut self, mut resizer: PoolResizer) {
+        // Between request to shrink that led to allocation of `resizer` and now,
+        // bits may have changed.
+        // Verify that shrinking is still possible. In case shrinking to
+        // the size of `resizer` is no longer possible, do nothing,
+        // drop `resizer` and move on.
+        let Some(updated) = self.shrink_request() else {
+            return;
+        };
+        if updated.num_ids > resizer.new.len() {
+            return;
+        }
+
+        resizer.new.copy_and_extend(&self.map);
+        self.map = resizer.new;
+    }
+
+    /// Returns a [`ReallocRequest`] for growing this [`IdPool`], if possible.
+    ///
+    /// The capacity of an [`IdPool`] cannot be grown above [`i32::MAX`].
+    #[inline]
+    pub fn grow_request(&self) -> Option<ReallocRequest> {
+        let num_ids = self.capacity() * 2;
+        if num_ids > i32::MAX.try_into().unwrap() {
+            return None;
+        }
+        Some(ReallocRequest { num_ids })
+    }
+
+    /// Grows pool by using a new [`BitmapVec`], if still necessary.
+    ///
+    /// The `resizer` arguments has to be obtained by calling [`Self::grow_request`]
+    /// on this object and performing a [`ReallocRequest::realloc`].
+    #[inline]
+    pub fn grow(&mut self, mut resizer: PoolResizer) {
+        // Between request to grow that led to allocation of `resizer` and now,
+        // another thread may have already grown the capacity.
+        // In this case, do nothing, drop `resizer` and move on.
+        if resizer.new.len() <= self.capacity() {
+            return;
+        }
+
+        resizer.new.copy_and_extend(&self.map);
+        self.map = resizer.new;
+    }
+
+    /// Acquires a new ID by finding and setting the next zero bit in the
+    /// bitmap.
+    ///
+    /// Upon success, returns its index. Otherwise, returns [`None`]
+    /// to indicate that a [`Self::grow_request`] is needed.
+    #[inline]
+    pub fn acquire_next_id(&mut self, offset: usize) -> Option<usize> {
+        let next_zero_bit = self.map.next_zero_bit(offset);
+        if let Some(nr) = next_zero_bit {
+            self.map.set_bit(nr);
+        }
+        next_zero_bit
+    }
+
+    /// Releases an ID.
+    #[inline]
+    pub fn release_id(&mut self, id: usize) {
+        self.map.clear_bit(id);
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 586be7f246eb..9b8a6c386c52 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -90,6 +90,7 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+pub mod id_pool;
 pub mod init;
 pub mod io;
 pub mod ioctl;
-- 
2.51.0.355.g5224444f11-goog

