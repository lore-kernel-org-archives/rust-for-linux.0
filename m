Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB6F1B413D
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415866; cv=none; b=VfoXALPjRkTOxdHAZc8UA/6UGcVPg83/pe+0Q+FXqNUdpg192n/JKZJTLUXs+mo0VqHbssmTHPQbo/D/0zsb2MpRVOF3ZRBFnYD54TgVJceU6hrDL5qnNw7YkLnKOr3R4BjDqORiXamhtRH9OmN9wkTP5cQWAv7SIghlfQfil/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415866; c=relaxed/simple;
	bh=8A3uMsFF+huUNbBhcaSD0nISjE+9uuKXd9IS0ow8x/E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o+omIQ302BeH3fqtrDr08GE1tnTilYgBvZ3GgN4W5yoq8Qa0oJlo25mui7sEDaAOiiPKCYlRRJspRzfcGSvYkrf6wrbeYAoLiLHwUyMIMvkbMoLkNBO0mvUtYRZ3xE9Bm6KECvdVzFQsfYev+/pC7dnvDrkHQJ2gwHX4c+2cCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NinkPlhy; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bqe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NinkPlhy"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39d9243b1c2so1947093f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745415863; x=1746020663; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYkzDG4QPS+s/iRimZmwNUYZHK0CJLGiXqGKH8PKprw=;
        b=NinkPlhygOsx61n193NJo0GgxHDYjhSHD3WLlqM47xFkBiv8aFrX4GEh60zxdFr2+E
         vZvO2X5gn7FreLGIGuIeJW9toekLUJyIe/isJPrhb9Ouv5qK4zXTrwtPPz1Tduy1+RjN
         3Q8HmHBKtRf0ln3C46XAHTbJTfdM7Hl7lz+u+HtjGSQ/F7OkHvgbj0tnetG0U59k6DE+
         ENtgoWyqFRcGSxRLtZe2NiFwykpvm5kBHTw0vsQrew0AHYKphDPfq3Ey4W6arJVlDpMX
         kV5LZKf8uNy26JJLBvdnkUXREfUOng8Xrm3GJ4vl8rNXQ243v/B93y4hynfFhxevDR9W
         FIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415863; x=1746020663;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYkzDG4QPS+s/iRimZmwNUYZHK0CJLGiXqGKH8PKprw=;
        b=S2Rz6F+rtfDXhc9NC0j6FkUsZL+BRBfoNkO4MZkFxcMERVtPS/txusYD6K5aleeKuH
         hjYASstjnr5TZzv6HHR0MHK1SMBV6wkZg/htSwqDU6jhzDr6EbYDqzmPMQ/Am2GVaWpY
         ut3YrjrHnoEls0/JQnCmhHu6lE0aWr+mFTIhDXLowUk2dF0cooEUG5dAjTXnZtw2HZni
         0chMzty/EQNKDyX8toMl1jsfwatTLmpb8kiK+arFRLyg8tZEKL5uin9ycQuwJuJi3JLD
         JvB+omK3f6lH8qzTUbwM23xo+BCytkKPtrnAH5n07p9dGlUcovDitreFNkngrrJTYPZ0
         TOSg==
X-Forwarded-Encrypted: i=1; AJvYcCXLYcYYKpvPO4n1ZCX9rVRE22T8FEUnjqe8B5FcCy8BPLw3qwN9ZtklhK6BkZSb3xu8nYohW2/R8uTpAE6wPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTchAnSYXwrxqHrwmc0Ow1Zeg9zHZmDHVc5phu9wMG0xNHuOrQ
	5km80mjBEDJqSi0uP6QnvUCz/VYcN691QRFd6kyMnrefBqLV+7vs+dR74vf0fZp6YA==
X-Google-Smtp-Source: AGHT+IFjZ9nvsbJJRU6YlcLC3n/B96WwEEC0zWLNdVEVMidMbDpBPaw3kk+FeEc/O6BmNi/2AaTWsVI=
X-Received: from wmaj6.prod.google.com ([2002:a05:600c:6c06:b0:43b:b74b:9350])
 (user=bqe job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:598c:0:b0:39c:1f11:ead
 with SMTP id ffacd0b85a97d-39efba6a611mr15865850f8f.26.1745415863034; Wed, 23
 Apr 2025 06:44:23 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:43:37 +0000
In-Reply-To: <20250423134344.3888205-2-bqe@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423134344.3888205-7-bqe@google.com>
Subject: [PATCH v7 5/5] rust: add dynamic ID pool abstraction for bitmap
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

This is a port of the Binder data structure introduced in commit
15d9da3f818c ("binder: use bitmap for faster descriptor lookup") to
Rust.

Like drivers/android/dbitmap.h, the ID pool abstraction lets
clients acquire and release IDs. The implementation uses a bitmap to
know what IDs are in use, and gives clients fine-grained control over
the time of allocation. This fine-grained control is needed in the
Android Binder. We provide an example that release a spinlock for
allocation and unit tests (rustdoc examples).

The implementation is not aware that the underlying Bitmap abstraction
handles lengths below BITS_PER_LONG without allocation.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Burak Emir <bqe@google.com>
---
 MAINTAINERS            |   1 +
 rust/kernel/id_pool.rs | 201 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 3 files changed, 203 insertions(+)
 create mode 100644 rust/kernel/id_pool.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index d448b73c5934..161281251108 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4142,6 +4142,7 @@ R:	Yury Norov <yury.norov@gmail.com>
 S:	Maintained
 F:	lib/find_bit_benchmark_rust.rs
 F:	rust/kernel/bitmap.rs
+F:	rust/kernel/id_pool.rs
 
 BITOPS API
 M:	Yury Norov <yury.norov@gmail.com>
diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
new file mode 100644
index 000000000000..8f07526bb580
--- /dev/null
+++ b/rust/kernel/id_pool.rs
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! Rust API for an ID pool backed by a `Bitmap`.
+
+use crate::alloc::{AllocError, Flags};
+use crate::bitmap::Bitmap;
+
+/// Represents a dynamic ID pool backed by a `Bitmap`.
+///
+/// Clients acquire and release IDs from zero bits in a bitmap.
+///
+/// The ID pool can grow or shrink as needed. It has been designed
+/// to support the scenario where users need to control the time
+/// of allocation of a new backing bitmap, which may require release
+/// of locks.
+/// These operations then, are verified to determine if the grow or
+/// shrink is sill valid.
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
+///   assert_eq!(i, pool.acquire_next_id(i).ok_or(ENOSPC)?);
+/// }
+///
+/// pool.release_id(23);
+/// assert_eq!(23, pool.acquire_next_id(0).ok_or(ENOSPC)?);
+///
+/// assert_eq!(None, pool.acquire_next_id(0));  // time to realloc.
+/// let resizer = pool.grow_alloc().alloc(GFP_KERNEL)?;
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
+/// fn get_id_maybe_alloc(guarded_pool: &SpinLock<IdPool>) -> Result<usize, AllocError> {
+///   let mut pool = guarded_pool.lock();
+///   loop {
+///     match pool.acquire_next_id(0) {
+///       Some(index) => return Ok(index),
+///       None => {
+///         let alloc_request = pool.grow_alloc();
+///         drop(pool);
+///         let resizer = alloc_request.alloc(GFP_KERNEL)?;
+///         pool = guarded_pool.lock();
+///         pool.grow(resizer)
+///       }
+///     }
+///   }
+/// }
+/// ```
+pub struct IdPool {
+    map: Bitmap,
+}
+
+/// Returned when the `IdPool` should change size.
+pub struct AllocRequest {
+    nbits: usize,
+}
+
+/// Contains an allocated `Bitmap` for resizing `IdPool`.
+pub struct PoolResizer {
+    new: Bitmap,
+}
+
+impl AllocRequest {
+    /// Allocates a new `Bitmap` for `IdPool`.
+    pub fn alloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
+        let new = Bitmap::new(self.nbits, flags)?;
+        Ok(PoolResizer { new })
+    }
+}
+
+impl IdPool {
+    /// Constructs a new `[IdPool]`.
+    #[inline]
+    pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError> {
+        let map = Bitmap::new(nbits, flags)?;
+        Ok(Self { map })
+    }
+
+    /// Returns how many IDs this pool can currently have.
+    #[inline]
+    pub fn len(&self) -> usize {
+        self.map.len()
+    }
+
+    /// Returns an [`AllocRequest`] if the [`IdPool`] can be shrunk, [`None`] otherwise.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
+    /// use kernel::id_pool::{AllocRequest, IdPool};
+    ///
+    /// let mut pool = IdPool::new(1024, GFP_KERNEL)?;
+    /// let alloc_request = pool.shrink_alloc().ok_or(AllocError)?;
+    /// let resizer = alloc_request.alloc(GFP_KERNEL)?;
+    /// pool.shrink(resizer);
+    /// assert_eq!(pool.len(), kernel::bindings::BITS_PER_LONG as usize);
+    /// # Ok::<(), AllocError>(())
+    /// ```
+    #[inline]
+    pub fn shrink_alloc(&self) -> Option<AllocRequest> {
+        let len = self.map.len();
+        if len <= bindings::BITS_PER_LONG as usize {
+            return None;
+        }
+        /*
+         * Determine if the bitmap can shrink based on the position of
+         * its last set bit. If the bit is within the first quarter of
+         * the bitmap then shrinking is possible. In this case, the
+         * bitmap should shrink to half its current size.
+         */
+        match self.map.last_bit() {
+            Some(bit) => {
+                if bit < (len >> 2) {
+                    Some(AllocRequest { nbits: len >> 1 })
+                } else {
+                    None
+                }
+            }
+            None => Some(AllocRequest {
+                nbits: bindings::BITS_PER_LONG as usize,
+            }),
+        }
+    }
+
+    /// Shrinks pool by using a new `Bitmap`, if still possible.
+    #[inline]
+    pub fn shrink(&mut self, mut resizer: PoolResizer) {
+        // Verify that shrinking is still possible. The `resizer`
+        // bitmap might have been allocated without locks, so this call
+        // could now be outdated. In this case, drop `resizer` and move on.
+        if let Some(AllocRequest { nbits }) = self.shrink_alloc() {
+            if nbits <= resizer.new.len() {
+                resizer.new.copy_and_extend(&self.map);
+                self.map = resizer.new;
+                return;
+            }
+        }
+    }
+
+    /// Returns an `AllocRequest` for growing this `IdPool`.
+    #[inline]
+    pub fn grow_alloc(&self) -> AllocRequest {
+        AllocRequest {
+            nbits: self.map.len() << 1,
+        }
+    }
+
+    /// Grows pool by using a new `Bitmap`, if still necessary.
+    #[inline]
+    pub fn grow(&mut self, mut resizer: PoolResizer) {
+        // `resizer` bitmap might have been allocated without locks,
+        // so this call could now be outdated. In this case, drop
+        // `resizer` and move on.
+        if resizer.new.len() <= self.map.len() {
+            return;
+        }
+
+        resizer.new.copy_and_extend(&self.map);
+        self.map = resizer.new;
+    }
+
+    /// Acquires a new ID by finding and setting the next zero bit in the
+    /// bitmap. Upon success, returns its index. Otherwise, returns `None`
+    /// to indicate that a `grow_alloc` is needed.
+    #[inline]
+    pub fn acquire_next_id(&mut self, offset: usize) -> Option<usize> {
+        match self.map.next_zero_bit(offset) {
+            res @ Some(nr) => {
+                self.map.set_bit(nr);
+                res
+            }
+            None => None,
+        }
+    }
+
+    /// Releases an ID.
+    #[inline]
+    pub fn release_id(&mut self, id: usize) {
+        self.map.clear_bit(id);
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 94eb150c52c7..4c6b45dcad04 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -54,6 +54,7 @@
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
+pub mod id_pool;
 pub mod init;
 pub mod io;
 pub mod ioctl;
-- 
2.49.0.805.g082f7c87e0-goog

