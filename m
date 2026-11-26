Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699647;
	b=F1mYkzr9mOwhGCv2F6ROZwxXLduuGO2L4MrXbRQslO/89apM6rrwuvgoTTjhhKNC3m0u
	 0LSK+222wb64hUgHJLOeYsXiz1e3NRjwBne8vkBdmqOpEPFjMLW1VThxI581BmUqusLfu
	 QvjpdwUbGo4uujO8/Fd19SYg13MKr26tQu3WmDvYMS82eTcZF8QcreDAjkW+3K5PxybJZ
	 7xPbaVg+p1sugY/vlFbcDaKe6Syw290SjyiMpK0ETvOZckEq1YT81rHNcXGyvhW8U0M3C
	 e89SjQ/hDmAVSvfcE0S3pz42EqcT+0EaiV/lIXnCyvQgxImNMRzV+bkCbuXIeVfQ2+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699647;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NjGs7n+zOqXMAl5AoMZVePKGqPODn2ht7+UhA1D/b3o=;
	b=W/myia7V9j7oZSFtxnuesvY0Zbhejv8mkKC24Pm4KveSemx5f27iju/oZzJ0nBYc9ueQ
	 Lm2Q43Y54dtOyk0XRJKKcaZUwLPCbM4ZKWATAZk8hp8AsEnpXm0Ifl24CEYhJTnn+myHM
	 m2sovqt9q7u1ufNrqrKknObw8ffPBduiiiP/KD7DBD4tzpLYhur0qsNhk5HnJH7KgbMpk
	 Nd/ZW//eNbxylkKu1KgkhuHLxzsiFcp/i8oQTf0usIcyefQ9W3M2Jg9dfaLIVRr07lefR
	 rkAqlWU661EQZfBHMJoKmF/5mY33V8guE+HQoVdn5WuNdsWZOEC4issf+eAwR2KVrSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gSVwZXPx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24D606A323;
	Thu, 26 Nov 2026 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gSVwZXPx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE59B1F000D0;
	Thu, 26 Nov 2026 13:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699646;
	bh=NjGs7n+zOqXMAl5AoMZVePKGqPODn2ht7+UhA1D/b3o=;
	h=From:Date:Subject:To:Cc;
	b=gSVwZXPxG0NZur5k62GtvCWw57k4b0g6ebMGFIkvuGESiX5wpsKsn65P0DeCMt2ZT
	 9UF3dikJlMR68gUp27yuNyL66ZEnoF2FlXgmSL3QbFdNcPRbezxeOSNljkqAc9UQB8
	 frMVLcysOOz86cjEGJwtzMQXgQmCbzoRzUgaBJbTH/B1tay8H3aIorcTERLMC8gFiN
	 VONINGrBx4vwWbQJw077O3KYwi8zxizJGN4FFx8iCd0FmYTpiF834J5R6Q/hyZakZ+
	 9ulic/XLif5YCDC+ghUgihirr9oOzmYEZSDyTpOzucNsWVJs63N3aD6vtoHoDUtrYG
	 Hm35qccxtkVYw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 26 Nov 2026 13:53:15 +0100
Subject: [PATCH v4] rust: add a ring buffer implementation
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ringbuffer-v4-1-035b949fd239@kernel.org>
X-B4-Tracking: v=1; b=H4sIALorCGsC/23NQQ7CIBCF4asY1mKAAgVX3sO4gDK0RNMaUKJpe
 ndpF5qqyzfJ98+IEsQACe03I4qQQwpDXwbfblDTmb4FHFzZiBEmCaMCx9C39u49RMwZF0JLbox
 nqIBrBB8eS+x4KrsL6TbE59LOdL7+zWSKKda2EroWylArD2eIPVx2Q2zR3MnsYyVZWzZb7TxhX
 GmqxI+t3pbSL1sVa4WrOXijXLP+O03TC3JmVQYdAQAA
X-Change-ID: 20260215-ringbuffer-42455964aaf2
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=18152;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=U55yt4FJdNyuB45do6g85oiUsN4qPFcb2VQtZtg0y4g=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrCCvBikthmmnrGS2LnSVMgko1eyS59jCV5gdpY
 1YXBQTI/omJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawgrwQAKCRD6UCkIqsW9
 0AzFEACujz8+GD0hblqRBmWD5x5hdQB8iS8SF/TRg3yZsA/l1vtKliL+mkxpzEWmwFwaxquky3V
 XBtxfOzEZtOzw9P8587IKjBTFl8o/PF1clz/Ot286IjXn8AGfiuKvA1LPw2GA38PnmeWMTIHlxr
 FvqJkqiv53TK3DfA6Ca6KrK+1rXcjcdTU02541x8vRP38FLnHOxjKVaOKJ/Pc0zJsNrD8sPpL57
 ZpV327Gs8aRitpIqpNrJUhv+x1wLG6lMKrCagaekyM4dEnNIZSX5dQXSYSC9v3rTk2TsvqPQ3Ku
 glCfUesRUWYrePXnN+gG/MnZa37MNXRGQW/MCwurIKhgp3a0WdtFcjpbgTOZGDcVUbX27//y+Cu
 3M0XKAj/i27dOLASbLH4qI7wEXnO8NsuvDyOsVjD8muKyk22mZb3yRcy7QMcfZr1JeFMVuFUmBw
 m+tpUquljRIyYPfRIixxAPPTAl+3gQRpLPv2OsQNagv/08J2j+Jecm8xAUf8F8SFuwHuPKj98w6
 rEsz5pvJSFQsPsSj0LayrdX8UJ66dkNsU2x8EbbPeYnY8z13VrsuIVYIwIP4SI8KTW6A672/K8G
 +xTVP6i4wdiNZfGN2BP6DR1xICPzuSYOE1zBDHPpAMMLGf4yInVV6BuOgqxbzIneILbloYEEnPi
 5E6ygj6mcVijr1g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a fixed-capacity FIFO ring buffer. The implementation uses a circular
buffer with head and tail pointers, providing constant-time push and pop
operations.

The module includes a few tests covering basic operations, wrap-around
behavior, interleaved push/pop sequences, and edge cases such as
single-capacity buffers.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v4:
- Add an `// INVARIANT:` comment to `RingBuffer::new` and populate the
  slots before constructing the buffer (Sashiko, Miguel).
- Add `// INVARIANT:` comments to `push_head` and `pop_tail`.
- Describe slots as occupied and vacant instead of full and empty.
- Add a module-level example (Miguel).
- Add examples to `new`, `push_head` and `pop_tail` that show both the
  success and the failure path (Miguel).
- Use intra-doc links for `true` and `None` (Miguel).
- Link to v3: https://msgid.link/20261105-ringbuffer-v3-1-b5d74efa8dc6@kernel.org

Changes in v3:
- Lay out the imports vertically, as the coding guidelines require
  (Onur).
- Mark the trivial accessors `#[inline]` (Onur).
- Rebase on v7.4-rc1.
- Link to v2: https://msgid.link/20260605-ringbuffer-v2-1-99df02489185@kernel.org

Changes in v2:
- Move the module into `rust/kernel/alloc/`, next to `Vec` (Alice).
- Drop the redundant `size` field; use `nodes.len()` instead (Alice).
- Return `ENOMEM` when `capacity + 1` overflows `usize` instead of
  panicking inside `with_capacity` (Alice).
- Simplify the `head < tail` branch of `free_count` to `tail - head`
  (Alice).
- Remove the manual `Drop` impl; the backing `KVec` already drops the
  stored slots (Alice).
- Make `RingBuffer` generic over the backing allocator. Add
  `KRingBuffer`, `VRingBuffer` and `KVRingBuffer` aliases and re-export
  them from `kernel::alloc`. The constructor now takes an additional
  `Flags` argument (Daniel, Danilo).
- Link to v1: https://msgid.link/20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org
---
 rust/kernel/alloc.rs            |   6 +
 rust/kernel/alloc/ringbuffer.rs | 452 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 458 insertions(+)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index 68d80f3fa6c8..c27eda267317 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -6,6 +6,7 @@
 pub mod kbox;
 pub mod kvec;
 pub mod layout;
+pub mod ringbuffer;
 
 pub use self::kbox::Box;
 pub use self::kbox::KBox;
@@ -18,6 +19,11 @@
 pub use self::kvec::VVec;
 pub use self::kvec::Vec;
 
+pub use self::ringbuffer::KRingBuffer;
+pub use self::ringbuffer::KVRingBuffer;
+pub use self::ringbuffer::RingBuffer;
+pub use self::ringbuffer::VRingBuffer;
+
 /// Indicates an allocation error.
 #[derive(Copy, Clone, PartialEq, Eq, Debug)]
 pub struct AllocError;
diff --git a/rust/kernel/alloc/ringbuffer.rs b/rust/kernel/alloc/ringbuffer.rs
new file mode 100644
index 000000000000..fa8eaf3b838f
--- /dev/null
+++ b/rust/kernel/alloc/ringbuffer.rs
@@ -0,0 +1,452 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A fixed-capacity FIFO ring buffer.
+//!
+//! This module provides [`RingBuffer`], a circular buffer implementation that
+//! supports efficient push and pop operations at opposite ends of the buffer.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::alloc::KRingBuffer;
+//!
+//! let mut buffer = KRingBuffer::new(3, GFP_KERNEL)?;
+//!
+//! // Values are pushed to the head of the buffer until it is full.
+//! buffer.push_head(1)?;
+//! buffer.push_head(2)?;
+//! buffer.push_head(3)?;
+//! assert!(buffer.full());
+//! assert_eq!(buffer.push_head(4), Err(ENOSPC));
+//!
+//! // Values are popped from the tail of the buffer in FIFO order.
+//! assert_eq!(buffer.pop_tail(), Some(1));
+//! assert_eq!(buffer.pop_tail(), Some(2));
+//! assert_eq!(buffer.free_count(), 2);
+//!
+//! // The freed slots are reused, the buffer wraps around.
+//! buffer.push_head(4)?;
+//! buffer.push_head(5)?;
+//! assert_eq!(buffer.pop_tail(), Some(3));
+//! assert_eq!(buffer.pop_tail(), Some(4));
+//! assert_eq!(buffer.pop_tail(), Some(5));
+//! assert_eq!(buffer.pop_tail(), None);
+//! # Ok::<(), Error>(())
+//! ```
+
+use super::{
+    allocator::{
+        KVmalloc,
+        Kmalloc,
+        Vmalloc, //
+    },
+    Allocator,
+    Flags,
+    Vec, //
+};
+use kernel::prelude::*;
+
+/// A fixed-capacity FIFO ring buffer.
+///
+/// `RingBuffer` is a circular buffer that allows pushing elements to the head
+/// and popping elements from the tail in constant time. The buffer has a fixed
+/// capacity specified at construction time and will return an error if a push
+/// is attempted when full.
+///
+/// The backing storage is provided by the allocator `A`. Type aliases are
+/// provided for the common choices: [`KRingBuffer`], [`VRingBuffer`] and
+/// [`KVRingBuffer`].
+///
+/// # Invariants
+///
+/// - `self.head` points at the next vacant slot.
+/// - `self.tail` points at the last occupied slot, except if the buffer is
+///   empty.
+/// - The buffer is empty when `self.head == self.tail`.
+/// - The buffer will always have at least one vacant slot, even when full.
+pub struct RingBuffer<T, A: Allocator> {
+    nodes: Vec<Option<T>, A>,
+    head: usize,
+    tail: usize,
+}
+
+/// A [`RingBuffer`] backed by [`Kmalloc`].
+pub type KRingBuffer<T> = RingBuffer<T, Kmalloc>;
+
+/// A [`RingBuffer`] backed by [`Vmalloc`].
+pub type VRingBuffer<T> = RingBuffer<T, Vmalloc>;
+
+/// A [`RingBuffer`] backed by [`KVmalloc`].
+pub type KVRingBuffer<T> = RingBuffer<T, KVmalloc>;
+
+impl<T, A: Allocator> RingBuffer<T, A> {
+    /// Creates a new `RingBuffer` with the specified capacity.
+    ///
+    /// The buffer will be able to hold exactly `capacity` elements. Memory is
+    /// allocated during construction using `flags`.
+    ///
+    /// # Errors
+    ///
+    /// Returns an error if memory allocation fails.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::KRingBuffer;
+    ///
+    /// let buffer = KRingBuffer::<u32>::new(8, GFP_KERNEL)?;
+    /// assert_eq!(buffer.free_count(), 8);
+    ///
+    /// // The memory for a buffer of this capacity cannot be allocated.
+    /// assert!(KRingBuffer::<u32>::new(usize::MAX, GFP_KERNEL).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn new(capacity: usize, flags: Flags) -> Result<Self> {
+        let slots = capacity.checked_add(1).ok_or(ENOMEM)?;
+        let mut nodes = Vec::with_capacity(slots, flags)?;
+
+        for _ in 0..nodes.capacity() {
+            nodes.push_within_capacity(None)?;
+        }
+
+        // INVARIANT: `nodes` holds `nodes.capacity() >= slots >= 1` slots, all
+        // of which are vacant. Thus:
+        // - `head` points at a vacant slot.
+        // - `tail` need not point at an occupied slot, since the buffer is
+        //   empty.
+        // - The buffer is empty and `head == tail`.
+        // - The buffer has at least one vacant slot.
+        Ok(Self {
+            nodes,
+            head: 0,
+            tail: 0,
+        })
+    }
+
+    /// Returns [`true`] if the buffer is full.
+    ///
+    /// When the buffer is full, any call to [`push_head`] will return an error.
+    ///
+    /// [`push_head`]: Self::push_head
+    #[inline]
+    pub fn full(&self) -> bool {
+        (self.head + 1) % self.nodes.len() == self.tail
+    }
+
+    #[inline]
+    fn empty(&self) -> bool {
+        self.head == self.tail
+    }
+
+    /// Returns the number of available slots in the buffer.
+    ///
+    /// This is the number of elements that can be pushed before the buffer
+    /// becomes full.
+    #[inline]
+    pub fn free_count(&self) -> usize {
+        (if self.head >= self.tail {
+            self.nodes.len() - (self.head - self.tail)
+        } else {
+            self.tail - self.head
+        } - 1)
+    }
+
+    /// Pushes a value to the head of the buffer.
+    ///
+    /// # Errors
+    ///
+    /// Returns [`ENOSPC`] if the buffer is full.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::KRingBuffer;
+    ///
+    /// let mut buffer = KRingBuffer::new(1, GFP_KERNEL)?;
+    ///
+    /// assert_eq!(buffer.push_head(1), Ok(()));
+    ///
+    /// // The buffer is full, so the value is rejected.
+    /// assert_eq!(buffer.push_head(2), Err(ENOSPC));
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn push_head(&mut self, value: T) -> Result {
+        if self.full() {
+            return Err(ENOSPC);
+        }
+
+        self.nodes[self.head] = Some(value);
+
+        // INVARIANT: The occupied slots are now the ones from `tail` up to and
+        // including the slot at `head`, which now holds `value`. The buffer was
+        // not full, so the slot after `head` is not `tail` and is thus vacant.
+        // After advancing `head` to that slot:
+        // - `head` points at the next vacant slot.
+        // - `tail` points at the last occupied slot. If the buffer was empty,
+        //   that is the slot that now holds `value`.
+        // - The buffer is not empty and `head != tail`.
+        // - The buffer has at least one vacant slot, the one at `head`.
+        self.head = (self.head + 1) % self.nodes.len();
+
+        Ok(())
+    }
+
+    /// Pops and returns the value at the tail of the buffer.
+    ///
+    /// Returns [`None`] if the buffer is empty. Values are returned in FIFO
+    /// order, i.e., the oldest value is returned first.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::KRingBuffer;
+    ///
+    /// let mut buffer = KRingBuffer::new(2, GFP_KERNEL)?;
+    /// buffer.push_head(1)?;
+    /// buffer.push_head(2)?;
+    ///
+    /// assert_eq!(buffer.pop_tail(), Some(1));
+    /// assert_eq!(buffer.pop_tail(), Some(2));
+    ///
+    /// // The buffer is empty, so there is no value to return.
+    /// assert_eq!(buffer.pop_tail(), None);
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn pop_tail(&mut self) -> Option<T> {
+        if self.empty() {
+            return None;
+        }
+
+        let value = self.nodes[self.tail].take();
+
+        // INVARIANT: The buffer was not empty, so the slot at `tail` was
+        // occupied. It is now vacant, and the remaining occupied slots are the
+        // ones from the slot after `tail` up to, but not including, the slot at
+        // `head`. After advancing `tail` to the slot after it:
+        // - `head` points at the next vacant slot, since `head` is unchanged
+        //   and no slot became occupied.
+        // - `tail` points at the last occupied slot, unless no occupied slots
+        //   remain.
+        // - No occupied slots remain exactly when `tail` reached `head`, so the
+        //   buffer is empty when `head == tail`.
+        // - The buffer has at least one vacant slot, the one at `head`.
+        self.tail = (self.tail + 1) % self.nodes.len();
+        value
+    }
+}
+
+#[kunit_tests(rust_kernel_ringbuffer)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn test_new_buffer_is_empty() {
+        let buffer: KRingBuffer<i32> =
+            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buffer");
+        assert!(!buffer.full());
+        assert!(buffer.empty());
+    }
+
+    #[test]
+    fn test_new_buffer_has_correct_capacity() {
+        let capacity = 10;
+        let buffer: KRingBuffer<i32> =
+            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to create buffer");
+        assert_eq!(buffer.free_count(), capacity);
+    }
+
+    #[test]
+    fn test_push_single_element() {
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buffer");
+        assert!(buffer.push_head(42).is_ok());
+        assert!(!buffer.empty());
+        assert!(!buffer.full());
+    }
+
+    #[test]
+    fn test_push_and_pop_single_element() {
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buffer");
+        buffer.push_head(42).expect("Failed to push");
+        let value = buffer.pop_tail();
+        assert_eq!(value, Some(42));
+        assert!(buffer.empty());
+    }
+
+    #[test]
+    fn test_push_and_pop_multiple_elements() {
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buffer");
+
+        for i in 0..5 {
+            buffer.push_head(i).expect("Failed to push");
+        }
+
+        for i in 0..5 {
+            assert_eq!(buffer.pop_tail(), Some(i));
+        }
+
+        assert!(buffer.empty());
+    }
+
+    #[test]
+    fn test_pop_from_empty_buffer() {
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buffer");
+        assert_eq!(buffer.pop_tail(), None);
+    }
+
+    #[test]
+    fn test_buffer_full() {
+        let capacity = 3;
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to create buffer");
+
+        for i in 0..capacity {
+            assert!(buffer.push_head(i as i32).is_ok());
+        }
+
+        assert!(buffer.full());
+        assert_eq!(buffer.free_count(), 0);
+    }
+
+    #[test]
+    fn test_push_to_full_buffer_fails() {
+        let capacity = 3;
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to create buffer");
+
+        for i in 0..capacity {
+            buffer.push_head(i as i32).expect("Failed to push");
+        }
+
+        assert!(buffer.full());
+        assert!(buffer.push_head(999).is_err());
+    }
+
+    #[test]
+    fn test_free_count_decreases_on_push() {
+        let capacity = 5;
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to create buffer");
+
+        assert_eq!(buffer.free_count(), capacity);
+
+        for i in 0..capacity {
+            buffer.push_head(i as i32).expect("Failed to push");
+            assert_eq!(buffer.free_count(), capacity - i - 1);
+        }
+    }
+
+    #[test]
+    fn test_free_count_increases_on_pop() {
+        let capacity = 5;
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to create buffer");
+
+        for i in 0..capacity {
+            buffer.push_head(i as i32).expect("Failed to push");
+        }
+
+        assert_eq!(buffer.free_count(), 0);
+
+        for i in 1..=capacity {
+            buffer.pop_tail();
+            assert_eq!(buffer.free_count(), i);
+        }
+    }
+
+    #[test]
+    fn test_wrap_around_behavior() {
+        let capacity = 3;
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to create buffer");
+
+        // Fill the buffer.
+        for i in 0..capacity {
+            buffer.push_head(i as i32).expect("Failed to push");
+        }
+
+        // Pop two elements.
+        assert_eq!(buffer.pop_tail(), Some(0));
+        assert_eq!(buffer.pop_tail(), Some(1));
+
+        // Push two more (should wrap around).
+        buffer.push_head(10).expect("Failed to push");
+        buffer.push_head(11).expect("Failed to push");
+
+        // Verify order.
+        assert_eq!(buffer.pop_tail(), Some(2));
+        assert_eq!(buffer.pop_tail(), Some(10));
+        assert_eq!(buffer.pop_tail(), Some(11));
+        assert!(buffer.empty());
+    }
+
+    #[test]
+    fn test_fifo_order() {
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(10, GFP_KERNEL).expect("Failed to create buffer");
+
+        let values = [1, 2, 3, 4, 5];
+        for &value in &values {
+            buffer.push_head(value).expect("Failed to push");
+        }
+
+        for &expected in &values {
+            assert_eq!(buffer.pop_tail(), Some(expected));
+        }
+    }
+
+    #[test]
+    fn test_interleaved_push_pop() {
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(5, GFP_KERNEL).expect("Failed to create buffer");
+
+        buffer.push_head(1).expect("Failed to push");
+        buffer.push_head(2).expect("Failed to push");
+        assert_eq!(buffer.pop_tail(), Some(1));
+
+        buffer.push_head(3).expect("Failed to push");
+        assert_eq!(buffer.pop_tail(), Some(2));
+        assert_eq!(buffer.pop_tail(), Some(3));
+
+        assert!(buffer.empty());
+    }
+
+    #[test]
+    fn test_buffer_state_after_fill_and_drain() {
+        let capacity = 4;
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(capacity, GFP_KERNEL).expect("Failed to create buffer");
+
+        // Fill and drain twice.
+        for _ in 0..2 {
+            for i in 0..capacity {
+                buffer.push_head(i as i32).expect("Failed to push");
+            }
+            assert!(buffer.full());
+
+            for _ in 0..capacity {
+                buffer.pop_tail();
+            }
+            assert!(buffer.empty());
+        }
+    }
+
+    #[test]
+    fn test_single_capacity_buffer() {
+        let mut buffer: KRingBuffer<i32> =
+            KRingBuffer::new(1, GFP_KERNEL).expect("Failed to create buffer");
+
+        assert_eq!(buffer.free_count(), 1);
+        buffer.push_head(42).expect("Failed to push");
+        assert!(buffer.full());
+        assert_eq!(buffer.free_count(), 0);
+
+        assert_eq!(buffer.pop_tail(), Some(42));
+        assert!(buffer.empty());
+    }
+}

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260215-ringbuffer-42455964aaf2

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


