Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A423F484E;
	Fri,  5 Jun 2026 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665043; cv=none; b=X49R4A3d32veBvjAj5azelRVWS1jbREK/4cZVh4JcjDf+2p310j97/fjPRR3EAVP0o+xzZU8WcuC6oVBnQ/VE1YGLrdcitFejMnuFfxZXa+ZQ9vZZqD9L6sg3KOSGb0VPF53kZpGHuAXANnjjBcKXq+SNCWAj5EZoVAdncEsHfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665043; c=relaxed/simple;
	bh=FOAFWRJhz2L/B/iphAJ2TLk6j36jpfgR1vtVHkxVv8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DnUWxRBlJlrz6u5nXjK/yUOf9tBFepcElc0aDzd6PsEAzMQSFhDJIJBST8theKwnO/n0BL1KVJiABoFE0ibKeYIxItREtV2E6L60VNGnpsetWwilKbVHlXw12tAVIgHNpIhGP8+VfnLDgAlT7SVMTcYnC5XtyI7iq83KKvc7QjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdgS43Dg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdgS43Dg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721E71F00893;
	Fri,  5 Jun 2026 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780665042;
	bh=i/eQvBYjoOzHxPVndJd5kkVjBsPdj9BDZyM2rTU05fM=;
	h=From:Date:Subject:To:Cc;
	b=ZdgS43Dgx9hFtIDy6FssbJdSBDxxFjf+F+V6gTovKtyMCiA2PWuC07ZgJniy5duKQ
	 CdHhmALJHZUg1pBujInEpM5/b0GUIfOPI9wUlgwpuuHpFiVGKNQEbEM0MsgKOGgqT0
	 lHhuOK2JqoHtOhlDKRIKDhUCNKSGY4qDLkpW8rLTPHz6B59zf7LvCYYwgLQEkhyUHC
	 30J0Ju3L90PI/sqmhfjLqFdnM8v1ONcMYzdQMbNFygmDLgMxc9ibF++Xheqnpc9ZTe
	 qXmgpep5sudSblWeLkyT5EUQKKiusDyF3FpaetmNdRgKVujsDogXkGZc8TbpbGOC3O
	 /1+lQ1iyjxjbg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 15:10:30 +0200
Subject: [PATCH v2] rust: add a ring buffer implementation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-ringbuffer-v2-1-99df02489185@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMXKImoC/23MQQ7CIBCF4as0sxZTENC68h6mC9CBTjRgBiWap
 ncXu3b5v+R9MxRkwgLHbgbGSoVyaqE2HVwmlyIKurYG1SvbK2kEU4r+FQKy0EobM1jtXFDQDg/
 GQO8VO4+tJyrPzJ/VrvK3/mWqFFIMfmeGvTk46e3phpzwvs0cYVyW5QvWPBsMpQAAAA==
X-Change-ID: 20260215-ringbuffer-42455964aaf2
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13753;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=FOAFWRJhz2L/B/iphAJ2TLk6j36jpfgR1vtVHkxVv8I=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIsrGkPy8LgMKi6dAjyAoDylSIJYWmJzFPIL9u
 g99meHjVH2JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLKxgAKCRD6UCkIqsW9
 0MO7D/49nelxL52GDmWv1ZKIyb5au06OSqWDRST2nCn+qIohWtWVQDweUUsXzOI5tb1407TeR3J
 52E6g842zx/UmoDDmpGo/JbJxonaizF5UybkWhoIBiRmY6OAaHIaVUUf3Gcd0xI9B5dvBCd+31+
 nqusYyHdFUFXwfydzczTjLr1qvggT8PB0tL8SIwnN3nT3U5zfQMvTv+5rCB6NlmMekksn+w2ATS
 Stf2yVuM1UBT2CEAGz/D3so58uD9h4hGkUccQAQ1eUBvAPYvdVq0TMwG+pZzgkbhy2589cKJk6w
 I2WXJyc/mcY4BOw8pzq+lUTG8lX/HS0dlX7hHzsosFYVUju+6I+4X2YDYNyWLr48CumL4CYP72z
 /JYFT3HCWTFvXTT6kxBBTxJwLxM9e+G+KeahKSpfkaGyn67H0H5SrByAohymx59uKf3ebyoJiAZ
 eTjoN/win0jyLL+Ibx57pPodNiJustfLvwaicJF1BHFeI5pKmG/L71XmhLuWt1mk+OeT7z9UJrh
 searroYLHWpa5r1+NInX0pYaUDEpKldusgUg05utd6cKL5NiLJxYhTHKEZlpWtYEHtsXGU3x+oB
 k0QDyau7siLAeETavqTsBaAK77LuE6jmVkA6/amsbZtO+jomA8VnTWDwkhz5hMD352KSec8SDCW
 r3DJopMp5Pkf0Og==
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
 rust/kernel/alloc/ringbuffer.rs | 338 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 344 insertions(+)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index e38720349dcf..05eb0289b82b 100644
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
index 000000000000..09e1ce1d048e
--- /dev/null
+++ b/rust/kernel/alloc/ringbuffer.rs
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A fixed-capacity FIFO ring buffer.
+//!
+//! This module provides [`RingBuffer`], a circular buffer implementation that
+//! supports efficient push and pop operations at opposite ends of the buffer.
+
+use super::{
+    allocator::{KVmalloc, Kmalloc, Vmalloc},
+    Allocator, Flags, Vec,
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
+    pub fn full(&self) -> bool {
+        (self.head + 1) % self.nodes.len() == self.tail
+    }
+
+    fn empty(&self) -> bool {
+        self.head == self.tail
+    }
+
+    /// Returns the number of available slots in the buffer.
+    ///
+    /// This is the number of elements that can be pushed before the buffer
+    /// becomes full.
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
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260215-ringbuffer-42455964aaf2

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


