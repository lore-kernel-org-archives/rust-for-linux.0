Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AF21C9F4
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 13:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079198; cv=none; b=oJIkfXRk6fKjmQxuMcCCxI+JlC1zB2HHEGvb6mcrCqTpqtDPadzaRKqkQ6PoRpmKMoGy6csgDKG//u9SZ9UpzLqcMBRw1nMKYRDvP1r3Y8GE1WqPmNJx1VLQBFIhq7tZCXFwLnwRtIm5q1J6+pZ1EGJH6uZ0VVjeWUR8d508jug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079198; c=relaxed/simple;
	bh=emQPdhup99Z5QtiURk30Lj0zFxcNy6czk/mQFRFY1Ec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i7CPcI/eB+sjYnOBjnQ1x4CM2wM0YDfw2MvBGJnheqY0bjk6NT5nS7R0oaE+EqZn6eBj9+hmtLDM6bbOvBuH2r4QnPVwb1uMoj3Y8XtfKgtbIyhy1US0RtE3qvU6kvwrVp+dMeIGd/j4HlRvfG7AP5bq43wE2opQuQbGn2RVrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pMPc514y; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pMPc514y"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so43211735e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 05:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764079195; x=1764683995; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=chXXKrD+EO5miwbK6PlKXaTfuoU30ukfdCueJLsRgKk=;
        b=pMPc514y/accauwuPYSqNkZ8tbYH9ESbnXg8KvKQRFkcTTO0Wy7BmDtuErWjbKajMn
         ODENe/JhQcjyBtTf03PnwumXhDIvPf1vPkmCQ7tYzgqqWs3NvBlF8qkGUJUo7Ib6A5w2
         NNRQpkzstPuFlStvSdaRtVsnIttYlrwLh2DZBP3GU1UxSt8sfubLgZ0BPUcw5EzFh+NZ
         Px2/u7eACknsqU9mdfqwAfhyKsadneb7thLHYpvyBbAn/5W+DPWamlmNCZsOrBdftSC1
         FYt7TEm0HAzsy7F8oCmYqEhDDtTyhSuZgNkEObkxt33vVH31fHBUE/XAPubeRYljlL1Z
         YDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079195; x=1764683995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chXXKrD+EO5miwbK6PlKXaTfuoU30ukfdCueJLsRgKk=;
        b=tS8xLSbFQEo/qJteZPHZfq1+ajzdusGXKgl7rv1Ohjq9o57I5dfp0yh37Qmq3Xths3
         Itb0GUOEQYoLbxFZvbQwX7sRnjcPMnvcPLYOoMbxhJYHnAsS756OW8c576qGuEG2RwQ9
         S6EFVCtLuRy9nfc6Ne3dmtFLfrEtQxFXfuZ/BsxFUJQv9Xav+ixj40aMJKgpPT9PdaUG
         clLKcyAPHF3ysqvp7JkBjMY9VucBNVEULsf0R7zTmDGplTNmf5v+LugqKvQYBtb4F5f8
         lsDsgrjChQ3sJaQf05IqKFzKmfSQNa1i5pUDzPKLAPwl3SsVU0WKL//UyWvC85tUaJ+s
         T7AA==
X-Forwarded-Encrypted: i=1; AJvYcCX8+ql4lMmLrMf+UADp4HpnMMiLDZZaBNlrPDs7aVFXpuTuPtBiM99N4j3f+yIkQntol7cw6/gqlwRus3ia8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXkjxwsNWarJCixLojGd/usCUzVMFAst2uiVP+cVcjKxgav9nn
	eJSfLdou+1FTZIV1fKY7Evob6jl1vkeFnZAwru7zuoCtlF6gLt2Hv68KAgw4DufFXmbleNSlZnl
	ZgyhKGOaBP8EV8orclw==
X-Google-Smtp-Source: AGHT+IGRFXXkiHfta8PSnKNzjAC2VJBxGSZWUgFyXbv+BxfdZofY3oqG0yTSaodz9j8ihSokENMBvq0kn8NmCsI=
X-Received: from wmht12.prod.google.com ([2002:a05:600c:41cc:b0:477:9f68:c324])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154c:b0:477:7b16:5f88 with SMTP id 5b1f17b1804b1-477c0165a5cmr146798485e9.6.1764079195375;
 Tue, 25 Nov 2025 05:59:55 -0800 (PST)
Date: Tue, 25 Nov 2025 13:59:37 +0000
In-Reply-To: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9078; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=emQPdhup99Z5QtiURk30Lj0zFxcNy6czk/mQFRFY1Ec=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpJbZYFGwaU4GbCDXqBbs3FZ6Xabk52Z9GLWkzp
 z424Dg+9aWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaSW2WAAKCRAEWL7uWMY5
 RrTqD/4iDROrp6gmLNwpy1aWZjr/JZps3FQvutW7W2LSYcMrtWW1MkIuJ8Htxf+ve0GnMC4ibd3
 4kQPbyfATUR748Y3u95t0akpkkVjicxlrEuq5FbYgN3DBTOoylLtV2hLuYF1qTV1zzNImGbsp83
 uxiqVFPN4NeF76Eg0JFfLay62UPWDVXKu6Ona+Wy6bL7gqldojVggQMkWbyjPLRqkieR/JeNXY3
 zBK8bOeAjwX+/WK6cCN9WkwvSHIv3z5kzJoBSCBE4MRV1VbG8qsw4K5A4oz7qduVFBC4Li43IKz
 EVyhuW0pRNC9w8iMWSPPaDTFJKKKF4N393FzKrEOuygS18VM0JF43bXtJPRnRY3F7Mc1IVkw60X
 s/So/jFxY62vqKF29MX6826V8haRTmMtGg0tvr6Gj1ieePOxKD8dwAxli+/+I9ygAiSw8KXGmjL
 4WxeOSYeyCgs/2nINTrzsDG/r0WqFKirYgU27Vmcb8rmOzN1YfRShi0xNI4XfhrF5TWgCenA0Zu
 6SohPlBl7npMSS/8K0SohcAfNQ/4wTO62CsPAOYstYJqpjNvr9OjZimUEAP9iHMdh/rLWlyhWYb
 /IovPGg6WnfHp5cZI5pyteQV0o8Fwii5gzu5Ou/GW+WVxuRkLbzC0cHTfMAvmgjC/LsOVrqw0f5 YS8rxo+0rKF3j3A==
X-Mailer: b4 0.14.2
Message-ID: <20251125-binder-bitmap-v6-1-dedaf1d05a98@google.com>
Subject: [PATCH v6 1/6] rust: bitmap: add MAX_LEN and MAX_INLINE_LEN constants
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>
Cc: "=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Burak Emir <bqe@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

To avoid hard-coding these values in drivers, define constants for them
that drivers can reference. Also, update all instances in bitmap.rs and
id_pool.rs that use these values to use the new constants.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/bitmap.rs  | 33 +++++++++++++++++++--------------
 rust/kernel/id_pool.rs | 39 ++++++++++++++++++++++-----------------
 2 files changed, 41 insertions(+), 31 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index aa8fc7bf06fc99865ae755d8694e4bec3dc8e7f0..0705646c6251a49f213a45f1f013cb9eb2ed81de 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -12,8 +12,6 @@
 use crate::pr_err;
 use core::ptr::NonNull;
 
-const BITS_PER_LONG: usize = bindings::BITS_PER_LONG as usize;
-
 /// Represents a C bitmap. Wraps underlying C bitmap API.
 ///
 /// # Invariants
@@ -149,14 +147,14 @@ macro_rules! bitmap_assert_return {
 ///
 /// # Invariants
 ///
-/// * `nbits` is `<= i32::MAX` and never changes.
-/// * if `nbits <= bindings::BITS_PER_LONG`, then `repr` is a `usize`.
+/// * `nbits` is `<= MAX_LEN`.
+/// * if `nbits <= MAX_INLINE_LEN`, then `repr` is a `usize`.
 /// * otherwise, `repr` holds a non-null pointer to an initialized
 ///   array of `unsigned long` that is large enough to hold `nbits` bits.
 pub struct BitmapVec {
     /// Representation of bitmap.
     repr: BitmapRepr,
-    /// Length of this bitmap. Must be `<= i32::MAX`.
+    /// Length of this bitmap. Must be `<= MAX_LEN`.
     nbits: usize,
 }
 
@@ -164,7 +162,7 @@ impl core::ops::Deref for BitmapVec {
     type Target = Bitmap;
 
     fn deref(&self) -> &Bitmap {
-        let ptr = if self.nbits <= BITS_PER_LONG {
+        let ptr = if self.nbits <= BitmapVec::MAX_INLINE_LEN {
             // SAFETY: Bitmap is represented inline.
             #[allow(unused_unsafe, reason = "Safe since Rust 1.92.0")]
             unsafe {
@@ -183,7 +181,7 @@ fn deref(&self) -> &Bitmap {
 
 impl core::ops::DerefMut for BitmapVec {
     fn deref_mut(&mut self) -> &mut Bitmap {
-        let ptr = if self.nbits <= BITS_PER_LONG {
+        let ptr = if self.nbits <= BitmapVec::MAX_INLINE_LEN {
             // SAFETY: Bitmap is represented inline.
             #[allow(unused_unsafe, reason = "Safe since Rust 1.92.0")]
             unsafe {
@@ -213,7 +211,7 @@ unsafe impl Sync for BitmapVec {}
 
 impl Drop for BitmapVec {
     fn drop(&mut self) {
-        if self.nbits <= BITS_PER_LONG {
+        if self.nbits <= BitmapVec::MAX_INLINE_LEN {
             return;
         }
         // SAFETY: `self.ptr` was returned by the C `bitmap_zalloc`.
@@ -226,23 +224,29 @@ fn drop(&mut self) {
 }
 
 impl BitmapVec {
+    /// The maximum possible length of a `BitmapVec`.
+    pub const MAX_LEN: usize = i32::MAX as usize;
+
+    /// The maximum length that uses the inline representation.
+    pub const MAX_INLINE_LEN: usize = usize::BITS as usize;
+
     /// Constructs a new [`BitmapVec`].
     ///
     /// Fails with [`AllocError`] when the [`BitmapVec`] could not be allocated. This
-    /// includes the case when `nbits` is greater than `i32::MAX`.
+    /// includes the case when `nbits` is greater than `MAX_LEN`.
     #[inline]
     pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError> {
-        if nbits <= BITS_PER_LONG {
+        if nbits <= BitmapVec::MAX_INLINE_LEN {
             return Ok(BitmapVec {
                 repr: BitmapRepr { bitmap: 0 },
                 nbits,
             });
         }
-        if nbits > i32::MAX.try_into().unwrap() {
+        if nbits > Self::MAX_LEN {
             return Err(AllocError);
         }
         let nbits_u32 = u32::try_from(nbits).unwrap();
-        // SAFETY: `BITS_PER_LONG < nbits` and `nbits <= i32::MAX`.
+        // SAFETY: `MAX_INLINE_LEN < nbits` and `nbits <= MAX_LEN`.
         let ptr = unsafe { bindings::bitmap_zalloc(nbits_u32, flags.as_raw()) };
         let ptr = NonNull::new(ptr).ok_or(AllocError)?;
         // INVARIANT: `ptr` returned by C `bitmap_zalloc` and `nbits` checked.
@@ -495,9 +499,10 @@ mod tests {
     #[test]
     fn bitmap_borrow() {
         let fake_bitmap: [usize; 2] = [0, 0];
+        let fake_bitmap_len = 2 * usize::BITS as usize;
         // SAFETY: `fake_c_bitmap` is an array of expected length.
-        let b = unsafe { Bitmap::from_raw(fake_bitmap.as_ptr(), 2 * BITS_PER_LONG) };
-        assert_eq!(2 * BITS_PER_LONG, b.len());
+        let b = unsafe { Bitmap::from_raw(fake_bitmap.as_ptr(), fake_bitmap_len) };
+        assert_eq!(fake_bitmap_len, b.len());
         assert_eq!(None, b.next_bit(0));
     }
 
diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
index a41a3404213ca92d53b14c80101afff6ac8c416e..0b1f720a1f7df8766a8481f3c0b332d4cff3b4ad 100644
--- a/rust/kernel/id_pool.rs
+++ b/rust/kernel/id_pool.rs
@@ -7,8 +7,6 @@
 use crate::alloc::{AllocError, Flags};
 use crate::bitmap::BitmapVec;
 
-const BITS_PER_LONG: usize = bindings::BITS_PER_LONG as usize;
-
 /// Represents a dynamic ID pool backed by a [`BitmapVec`].
 ///
 /// Clients acquire and release IDs from unset bits in a bitmap.
@@ -97,13 +95,12 @@ pub fn realloc(&self, flags: Flags) -> Result<PoolResizer, AllocError> {
 impl IdPool {
     /// Constructs a new [`IdPool`].
     ///
-    /// A capacity below [`BITS_PER_LONG`] is adjusted to
-    /// [`BITS_PER_LONG`].
+    /// A capacity below [`MAX_INLINE_LEN`] is adjusted to [`MAX_INLINE_LEN`].
     ///
-    /// [`BITS_PER_LONG`]: srctree/include/asm-generic/bitsperlong.h
+    /// [`MAX_INLINE_LEN`]: BitmapVec::MAX_INLINE_LEN
     #[inline]
     pub fn new(num_ids: usize, flags: Flags) -> Result<Self, AllocError> {
-        let num_ids = core::cmp::max(num_ids, BITS_PER_LONG);
+        let num_ids = usize::max(num_ids, BitmapVec::MAX_INLINE_LEN);
         let map = BitmapVec::new(num_ids, flags)?;
         Ok(Self { map })
     }
@@ -116,28 +113,34 @@ pub fn capacity(&self) -> usize {
 
     /// Returns a [`ReallocRequest`] if the [`IdPool`] can be shrunk, [`None`] otherwise.
     ///
-    /// The capacity of an [`IdPool`] cannot be shrunk below [`BITS_PER_LONG`].
+    /// The capacity of an [`IdPool`] cannot be shrunk below [`MAX_INLINE_LEN`].
     ///
-    /// [`BITS_PER_LONG`]: srctree/include/asm-generic/bitsperlong.h
+    /// [`MAX_INLINE_LEN`]: BitmapVec::MAX_INLINE_LEN
     ///
     /// # Examples
     ///
     /// ```
-    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
-    /// use kernel::id_pool::{ReallocRequest, IdPool};
+    /// use kernel::{
+    ///     alloc::AllocError,
+    ///     bitmap::BitmapVec,
+    ///     id_pool::{
+    ///         IdPool,
+    ///         ReallocRequest,
+    ///     },
+    /// };
     ///
     /// let mut pool = IdPool::new(1024, GFP_KERNEL)?;
     /// let alloc_request = pool.shrink_request().ok_or(AllocError)?;
     /// let resizer = alloc_request.realloc(GFP_KERNEL)?;
     /// pool.shrink(resizer);
-    /// assert_eq!(pool.capacity(), kernel::bindings::BITS_PER_LONG as usize);
+    /// assert_eq!(pool.capacity(), BitmapVec::MAX_INLINE_LEN);
     /// # Ok::<(), AllocError>(())
     /// ```
     #[inline]
     pub fn shrink_request(&self) -> Option<ReallocRequest> {
         let cap = self.capacity();
-        // Shrinking below [`BITS_PER_LONG`] is never possible.
-        if cap <= BITS_PER_LONG {
+        // Shrinking below `MAX_INLINE_LEN` is never possible.
+        if cap <= BitmapVec::MAX_INLINE_LEN {
             return None;
         }
         // Determine if the bitmap can shrink based on the position of
@@ -146,13 +149,13 @@ pub fn shrink_request(&self) -> Option<ReallocRequest> {
         // bitmap should shrink to half its current size.
         let Some(bit) = self.map.last_bit() else {
             return Some(ReallocRequest {
-                num_ids: BITS_PER_LONG,
+                num_ids: BitmapVec::MAX_INLINE_LEN,
             });
         };
         if bit >= (cap / 4) {
             return None;
         }
-        let num_ids = usize::max(BITS_PER_LONG, cap / 2);
+        let num_ids = usize::max(BitmapVec::MAX_INLINE_LEN, cap / 2);
         Some(ReallocRequest { num_ids })
     }
 
@@ -177,11 +180,13 @@ pub fn shrink(&mut self, mut resizer: PoolResizer) {
 
     /// Returns a [`ReallocRequest`] for growing this [`IdPool`], if possible.
     ///
-    /// The capacity of an [`IdPool`] cannot be grown above [`i32::MAX`].
+    /// The capacity of an [`IdPool`] cannot be grown above [`MAX_LEN`].
+    ///
+    /// [`MAX_LEN`]: BitmapVec::MAX_LEN
     #[inline]
     pub fn grow_request(&self) -> Option<ReallocRequest> {
         let num_ids = self.capacity() * 2;
-        if num_ids > i32::MAX.try_into().unwrap() {
+        if num_ids > BitmapVec::MAX_LEN {
             return None;
         }
         Some(ReallocRequest { num_ids })

-- 
2.52.0.460.gd25c4c69ec-goog

