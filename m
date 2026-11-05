Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875089;
	b=zkNSh1Myqg6T6SWEi9QDjlUK3D8L9lxSCxnpzbnSDfu7bgx/ZDFcZy7XPrvZmLCIMyJC
	 HH11+4CcRr3sbCpB1bhPkMGG4IURSwlSuulQDsS0FGi5CAiu+Fn//n7Op9NiIJrUpT2Ty
	 7zYlkrWNKYpWhS44Qr/KiLOs7Dr83P+cpUvGY01Ku7oagMcmnnUZrJYPdetaZE8SNSn0t
	 rIGmGiqaKpuBf4/u2ZvJWW7hydd4GCsyKkH3mtCoK6a8/GaaKHiAmUzWmFf22FW/3+j2j
	 cNl1pW1gPU13rGi6vfoD5VZ7JOeV/0GUaw2uLGhnumK/ybk65IT7x3vlDjC7O5wtm2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875089;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SSE0rQuSBdhC6ZyzpUrxMKaiUTo9vEg3j4WX57kdHic=;
	b=3MGdgj5YVDGdGVg4kefnOgyslYO+wZnyYSdb+Cq9RB2aRHJAdvFd0lgRLACpMDV6VYTg
	 vD9vcgRBZ6fF7fPyuXOuMoqVbssiTqjImp3qjR7gJrwkhopTnB3fW2dI51xTpyVlOJE1+
	 qM9AzzUrYR2WR0f0fIq1yp3Lgu3nG0w4xgjNDc8cg8tHxbj/1RNTCh+8aXvDVmbjJJIlG
	 moNs17lUNG3ER2i9WrZDlnrfkgupgSK7N/OekTikLGnXpLAsfAXoOInu/s8uHyMsM0i1f
	 pQnJlHK7/933dCs3Tvf5SomveCxOTYOUEjj9qCZQGkB3SuT3p4vqAz1KvOsv1LJMMMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IM0ZOAiG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F535606A331;
	Thu,  5 Nov 2026 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IM0ZOAiG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A931F000C1;
	Thu,  5 Nov 2026 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793875088;
	bh=SSE0rQuSBdhC6ZyzpUrxMKaiUTo9vEg3j4WX57kdHic=;
	h=From:Date:Subject:To:Cc;
	b=IM0ZOAiGr5M2B+QMJUawNYKMOpKIjashwOHweQSzYFiw/zkK3QvBbTRHiL7WwO+E4
	 nnUuPKzWg6PJ1KzYy2l5QY3ECQ/REyCTL9zwmwu4ONzoIhtxEQx+FSO/7ESVOoFDct
	 y6wpO/oyzUi10aY1/bQBqKVyh0u9cc19/qopFPhfH3ixy83r5dA8rHFr6z0CG8MR+5
	 +NVtXhup2IwPWBwfaDHwk7mvQ2qNtEVN9DBrh1F3LqbwIN8B25ln7LZLBqZnK6zQcc
	 BWMbm1+CtCQPWQvqi3G0ZJWhPDt95iGag5FWSyYvsRvh4X1yqZlJGVtDo4KnR7WKk8
	 qfT3Fa8aEzgXw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 05 Nov 2026 11:37:50 +0100
Subject: [PATCH v3] rust: add a ring buffer implementation
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-ringbuffer-v3-1-b5d74efa8dc6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAH1c7GoC/23MQQ7CIBCF4as0rMXAFLC48h7GBbVDSzTUDEo0T
 e8u7cY0cfle8v0TS0gBEztWEyPMIYUxllHvKnYdXOyRh65sBgKMAKk5hdi3L++RuAKltTXKOQ+
 sgAehD+81dr6UPYT0HOmztrNc3r+ZLLnktq21PejGydacbkgR7/uRerZ0MvysEVsLi7WdF6AaK
 xu9sfM8fwG57y6j4QAAAA==
X-Change-ID: 20260215-ringbuffer-42455964aaf2
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Boqun Feng <boqun@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=14143;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=6BwLTDlWRMMSA97+Tf0KDa1PAFO4/Dgo6DzHawO77q8=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq7FyBrLaQprV77j6ySQA+QsjjYn/66/EabjGjN
 2l9ulmcYLOJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCauxcgQAKCRD6UCkIqsW9
 0E2bD/91rBhE3YI76EAfrXauRAWyVE60fl93YqgOhQRVQbKJqxz7Qwhb8WEGF23tpKSytYRuQH5
 NvFL6ve/Exhi9VDVj4D9SPR6bM5bs1J66UDT2wJVQHSuZ4XEHa6FhmYM7ilQApyzTUOx4oRqnts
 RcK6zOgbbczfS2rBlm7WTedOGw1RS3nVmVQ28EDu+s8oVflI5sf5JVwQrKQA4bXtGwo/jEfrqBb
 GFyfEWJGhjxys6hxJG92TTv9IW46PhxctWE/59c2ccHcq9/dV0YU0G3s6zGs9XLAs4x0bKFaR6Q
 Obddb86egs7FaGqq5EvX4OKjMdO+HbiyLCGOAb6J60dLPsi7wzKUeDvRiMKhccnJOVpa8HZ36FZ
 OT1DNa+qks6FPdqmDjNgQ1dRPXVqHxYxGeKIGY0t44OVXd+VnTaeSIXBJDXz2RuJ14MqbnUs8qO
 B0HJvdfMsB0hNyls0FwilZsUYLzoBy80mJcyh1WYoQkOMLBWhK+x/FFXFQZYi6ct4JCMRRw6uMt
 HqFWJAvTRpLJe+GwpfVi8k9eh+Wkcs96CYQrR5utTllYt0lnoDZDg0vbzVdCgOHL6CzsCUD9fX9
 UA7fDnQG733UNfh288MFZ9RecX8ArwR6lMvA3jsXEHVJwy8yIPrBt5JS0oJHX/oyBRBWHFKNSJd
 8YVayFkVSdGhQrA==
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

To: Danilo Krummrich <dakr@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>
To: Uladzislau Rezki <urezki@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
---
 rust/kernel/alloc.rs            |   6 +
 rust/kernel/alloc/ringbuffer.rs | 349 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 355 insertions(+)

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
index 000000000000..abe0ae96f071
--- /dev/null
+++ b/rust/kernel/alloc/ringbuffer.rs
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A fixed-capacity FIFO ring buffer.
+//!
+//! This module provides [`RingBuffer`], a circular buffer implementation that
+//! supports efficient push and pop operations at opposite ends of the buffer.
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
+/// - `self.head` points at the next empty slot.
+/// - `self.tail` points at the last full slot, except if the buffer is empty.
+/// - The buffer is empty when `self.head == self.tail`.
+/// - The buffer will always have at least one empty slot, even when full.
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
+    pub fn new(capacity: usize, flags: Flags) -> Result<Self> {
+        let slots = capacity.checked_add(1).ok_or(ENOMEM)?;
+        let mut this = Self {
+            nodes: Vec::with_capacity(slots, flags)?,
+            head: 0,
+            tail: 0,
+        };
+
+        for _ in 0..this.nodes.capacity() {
+            this.nodes.push_within_capacity(None)?;
+        }
+
+        Ok(this)
+    }
+
+    /// Returns `true` if the buffer is full.
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
+    #[inline]
+    pub fn push_head(&mut self, value: T) -> Result {
+        if self.full() {
+            return Err(ENOSPC);
+        }
+
+        self.nodes[self.head] = Some(value);
+        self.head = (self.head + 1) % self.nodes.len();
+
+        Ok(())
+    }
+
+    /// Pops and returns the value at the tail of the buffer.
+    ///
+    /// Returns `None` if the buffer is empty. Values are returned in FIFO
+    /// order, i.e., the oldest value is returned first.
+    #[inline]
+    pub fn pop_tail(&mut self) -> Option<T> {
+        if self.empty() {
+            return None;
+        }
+
+        let value = self.nodes[self.tail].take();
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


