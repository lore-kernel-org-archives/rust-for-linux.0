Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD102F6164;
	Sun, 15 Feb 2026 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771187110; cv=none; b=O4Oruh0Cx/BMGcUNZQ20zai76zTBd//OQmfh84iZfWEcK5tzmTGKAAgMxms0//F9BJplVBkGSmbtq7fgOKAvxOldW2nZ3BAVJ8LVjuJG0FbKBKx1j20CZHGtPaNbUYbyPj4Cp1sFR47D8teTkOtbwBzEkL0dSvqu6sKyGGIi5Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771187110; c=relaxed/simple;
	bh=QUhwtDTsBxTEEpW2V6FAFeI5N9qzX9T/Vs/N5cwU9mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Pq56UWycH6/2+qrl6+7njHjpHoBIupvvusJS/8PjX4t1IgXshelWTZkSTZrULNCeOW8a7w8/R5nrYhk0yoN7JjlyVNlieBC7xhe5vkJR3+/1UkcuTbvQuHNOhGqBq+y1Ouj8btlygyA1Z2v1mhZpzLfWLTIjYmgVML1SOkxJnGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZqjnt12; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZqjnt12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903B9C4CEF7;
	Sun, 15 Feb 2026 20:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771187109;
	bh=QUhwtDTsBxTEEpW2V6FAFeI5N9qzX9T/Vs/N5cwU9mg=;
	h=From:Date:Subject:To:Cc:From;
	b=qZqjnt12PhuF5jpjrbKLKF3lMh64JAYgbqF7Ra4OOXXoV8sPhaq2WdbuoAOCsShSK
	 5aZYcIo1Yo1JKo+Hg+4OLqR2LQvLZbiXM34Ht1RZnTlHDCOiccS17iGHZG3KVbFNav
	 vkt+St96pl6/eQOehEI4cWtZPjFpeByLAwFsJNdCjRCuJ8P2W4LwHZo4btpfhi0+Ym
	 D+GeD7yMqsiXxlTtlI8XYE/yPdWEH94i4YE6Z5Ajg9WQ8/Hef8YQ4nKEvemyhre1RF
	 INGyh4otkUuyoREBQbX49t9ms2NaO39kys0rV9oQu1ig8HrAL2Nh8PfkbLzjBKGkZy
	 eeK8Ke2l7iAEA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Sun, 15 Feb 2026 21:24:59 +0100
Subject: [PATCH] rust: add a ring buffer implementation
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJorkmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NT3aLMvPSk0rS01CJdEyMTU1NLM5PExDQjJaCGgqLUtMwKsGHRsbW
 1AAzHAPFcAAAA
X-Change-ID: 20260215-ringbuffer-42455964aaf2
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11195;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=QUhwtDTsBxTEEpW2V6FAFeI5N9qzX9T/Vs/N5cwU9mg=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpkiubETOwk3oc9HGKotm4b9j/1jtOMOGAvyJVM
 cE+Gwz81I2JAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaZIrmwAKCRDhuBo+eShj
 d/SFEACnyhPU3q4xNdxNhZJXF4lnQIZdZKeAFC/DhI+wcMPy7HF7HOSvL2beQ4JwD3YHTqOtL7W
 /8OcWFNnfxH8tMYXusIFhwMSgExkmy2lRL3c3ZRf/t6lhEns1opZBgfwCZhaGa66qKNH9dDFh3P
 DLqSbeHQQ7fvt/h+7EXAuh6VRZr4tNOuz9uCoZk/5Ibo8/ofBOU7gu/d3+WeYdbfsmPpdUqpB0H
 y3P6Izrc4uEUXzDr7lPHII7u4L3xnCIASt2GQ2a21lYVbfgHkxrTNO2fxGugEVAxTJVzA+w7Nst
 DUDfkQRakpppbzMN9BA69jlIJKAomQkre5QdS7Ed9SxR9cLHZG2zzZVI+unHWpCa7ANPM1PLgTx
 7wlM7OTS+rKJI6UiPckrYgVXyldBX/DdzPiYlD6Pde/v5hV07X3e0ZfoRFp5PSl7+xNI8plxGI4
 Hzm5SPqEkZHuOy4kbMyfSjWIAdNm0BlH3CuMcn/yrq2BhfNQ5v0JdSNAcbaHfj7eQg4Egy7q5tj
 daTrd53lZQQTLIXR6slm6sDsNFARXiIuVzObFbvE5DKZuVvkC7eE247/wAzP7siOcqskmsq8E/z
 oNgq4j5I8xlbvkYB+Kb4gKtPtQ7b2mXjRzLHBkENQ1Tgn59xsIQE2VEbzDDFBKunYp7s9LZiKd0
 1afKII29zFBE8Gg==
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
 rust/kernel/lib.rs        |   1 +
 rust/kernel/ringbuffer.rs | 321 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 322 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf1200428..d6555ccceb32f 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -133,6 +133,7 @@
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
+pub mod ringbuffer;
 pub mod scatterlist;
 pub mod security;
 pub mod seq_file;
diff --git a/rust/kernel/ringbuffer.rs b/rust/kernel/ringbuffer.rs
new file mode 100644
index 0000000000000..9a66ebf1bb390
--- /dev/null
+++ b/rust/kernel/ringbuffer.rs
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A fixed-capacity FIFO ring buffer.
+//!
+//! This module provides [`RingBuffer`], a circular buffer implementation that
+//! supports efficient push and pop operations at opposite ends of the buffer.
+
+use kernel::prelude::*;
+
+/// A fixed-capacity FIFO ring buffer.
+///
+/// `RingBuffer` is a circular buffer that allows pushing elements to the head
+/// and popping elements from the tail in constant time. The buffer has a fixed
+/// capacity specified at construction time and will return an error if a push
+/// is attempted when full.
+///
+/// # Invariants
+///
+/// - `self.head` points at the next empty slot.
+/// - `self.tail` points at the last full slot, except if the buffer is empty.
+/// - The buffer is empty when `self.head == self.tail`.
+/// - The buffer will always have at least one empty slot, even when full.
+pub struct RingBuffer<T> {
+    nodes: KVec<Option<T>>,
+    size: usize,
+    head: usize,
+    tail: usize,
+}
+
+impl<T> RingBuffer<T> {
+    /// Creates a new `RingBuffer` with the specified capacity.
+    ///
+    /// The buffer will be able to hold exactly `capacity` elements. Memory is
+    /// allocated during construction.
+    ///
+    /// # Errors
+    ///
+    /// Returns an error if memory allocation fails.
+    pub fn new(capacity: usize) -> Result<Self> {
+        let mut this = Self {
+            nodes: KVec::with_capacity(capacity + 1, GFP_KERNEL)?,
+            size: capacity + 1,
+            head: 0,
+            tail: 0,
+        };
+
+        for _ in 0..this.size {
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
+        (self.head + 1) % self.size == self.tail
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
+            self.size - (self.head - self.tail)
+        } else {
+            (self.size - self.tail) + self.head
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
+        self.head = (self.head + 1) % self.size;
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
+        self.tail = (self.tail + 1) % self.size;
+        value
+    }
+}
+
+impl<T> Drop for RingBuffer<T> {
+    fn drop(&mut self) {
+        while !self.empty() {
+            drop(self.pop_tail().expect("Not empty"));
+        }
+    }
+}
+
+#[kunit_tests(rust_kernel_ringbuffer)]
+mod tests {
+    use super::*;
+
+    #[test]
+    fn test_new_buffer_is_empty() {
+        let buffer: RingBuffer<i32> = RingBuffer::new(5).expect("Failed to create buffer");
+        assert!(!buffer.full());
+        assert!(buffer.empty());
+    }
+
+    #[test]
+    fn test_new_buffer_has_correct_capacity() {
+        let capacity = 10;
+        let buffer: RingBuffer<i32> = RingBuffer::new(capacity).expect("Failed to create buffer");
+        assert_eq!(buffer.free_count(), capacity);
+    }
+
+    #[test]
+    fn test_push_single_element() {
+        let mut buffer: RingBuffer<i32> = RingBuffer::new(5).expect("Failed to create buffer");
+        assert!(buffer.push_head(42).is_ok());
+        assert!(!buffer.empty());
+        assert!(!buffer.full());
+    }
+
+    #[test]
+    fn test_push_and_pop_single_element() {
+        let mut buffer: RingBuffer<i32> = RingBuffer::new(5).expect("Failed to create buffer");
+        buffer.push_head(42).expect("Failed to push");
+        let value = buffer.pop_tail();
+        assert_eq!(value, Some(42));
+        assert!(buffer.empty());
+    }
+
+    #[test]
+    fn test_push_and_pop_multiple_elements() {
+        let mut buffer: RingBuffer<i32> = RingBuffer::new(5).expect("Failed to create buffer");
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
+        let mut buffer: RingBuffer<i32> = RingBuffer::new(5).expect("Failed to create buffer");
+        assert_eq!(buffer.pop_tail(), None);
+    }
+
+    #[test]
+    fn test_buffer_full() {
+        let capacity = 3;
+        let mut buffer: RingBuffer<i32> =
+            RingBuffer::new(capacity).expect("Failed to create buffer");
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
+        let mut buffer: RingBuffer<i32> =
+            RingBuffer::new(capacity).expect("Failed to create buffer");
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
+        let mut buffer: RingBuffer<i32> =
+            RingBuffer::new(capacity).expect("Failed to create buffer");
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
+        let mut buffer: RingBuffer<i32> =
+            RingBuffer::new(capacity).expect("Failed to create buffer");
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
+        let mut buffer: RingBuffer<i32> =
+            RingBuffer::new(capacity).expect("Failed to create buffer");
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
+        let mut buffer: RingBuffer<i32> = RingBuffer::new(10).expect("Failed to create buffer");
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
+        let mut buffer: RingBuffer<i32> = RingBuffer::new(5).expect("Failed to create buffer");
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
+        let mut buffer: RingBuffer<i32> =
+            RingBuffer::new(capacity).expect("Failed to create buffer");
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
+        let mut buffer: RingBuffer<i32> = RingBuffer::new(1).expect("Failed to create buffer");
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
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260215-ringbuffer-42455964aaf2

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


