Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAE4352C4E;
	Fri, 30 Jan 2026 20:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769806530; cv=none; b=bUaXp7aY+u9Al58SPqb+EFRYj3hDtp9Cw0ThvRILQDMWCT9oFUxYK7HlCEk1Yjd66de/pD+QtFJMwXK4lD8j0WGkfC1sJQgoJrCJBLVK85F7pg1iwiWYHgSFHgF1pGjYKK72zua30Tdw8cY3zk6vLUfrCL0PgB1bsFO+2U12Vw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769806530; c=relaxed/simple;
	bh=esEcNNEfTcgzbfPBBZyLIznR/0jROJnXakLmAGgUkA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk2cJH3jem1ic8G2axbMLNy4FhuzbOnuZ2Pgi7BTWJfHa1EmhMtCkUIrJuPzJM7TzhklrnfiLW1NnmjSmwxvL4jLH90bVruMBMa+FObKHIb0xt+ai5p9XxWaLbOtJS1MAOQ84kSFJmc4Rvk2uZrAboIm0UvRdkSEpoRJSQybtnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=hYa6NRC5; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="hYa6NRC5"
From: Shivam Kalra <shivamklr@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1769806524; bh=esEcNNEfTcgzbfPBBZyLIznR/0jROJnXakLmAGgUkA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hYa6NRC5fQXa9hfNuteMrITO1oX4ite4tj6D+CEMbfdH53x4Kka3srfMbfznsokiX
	 JZGQIeOivUy0WES4/UlIIwnTyY8royFdjOZjI3axg/yswTw0xwV9RjpCASGXJvXPoX
	 46lR42IQl5TtyrcTuzkm1luKkcEDI3q8IwXL5ZAY/0O5wghQuBMSp2tnunPBghPazB
	 mZfGjsDCeJtwbMXPMDZMpOnfFYXYGLRiPRgsd0BRwq7Z8ZSGLGmkD4lHnggXHmJ7li
	 URgk6qJYcSh8wd7KiXLPSbzDRIc6NPTHbqQ5w3GMGZyq40QV7ueX8lKpb3saIk0Fnv
	 WdKxvCmTr01bQ==
To: dakr@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org
Cc: aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Kalra <shivamklr@cock.li>
Subject: [PATCH v1 1/3] rust: alloc: Add shrink_to and shrink_to_fit methods to Vec
Date: Sat, 31 Jan 2026 02:24:21 +0530
Message-ID: <20260130205424.261700-2-shivamklr@cock.li>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130205424.261700-1-shivamklr@cock.li>
References: <20260130205424.261700-1-shivamklr@cock.li>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add methods to shrink the capacity of a Vec to free excess memory.
This is useful for drivers that experience variable workloads and want
to reclaim memory after spikes.

- `shrink_to(min_capacity, flags)`: Shrinks the capacity of the vector
  with a lower bound. The capacity will remain at least as large as
  both the length and the supplied value.

- `shrink_to_fit(flags)`: Shrinks the capacity of the vector as much
  as possible.

This implementation guarantees shrinking (unless already optimal),
because the kernel allocators don't support in-place shrinking,
a new allocation is always made.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Shivam Kalra <shivamklr@cock.li>
---
 rust/kernel/alloc/kvec.rs | 111 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae81..9c02734ced88f 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -733,6 +733,117 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
         }
         self.truncate(num_kept);
     }
+
+    /// Shrinks the capacity of the vector with a lower bound.
+    ///
+    /// The capacity will remain at least as large as both the length
+    /// and the supplied value.
+    ///
+    /// If the current capacity is less than the lower limit, this is a no-op.
+    ///
+    /// This requires allocating a new buffer and copying the elements, then freeing
+    /// the old buffer.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::with_capacity(100, GFP_KERNEL)?;
+    /// v.push(1, GFP_KERNEL)?;
+    /// v.push(2, GFP_KERNEL)?;
+    /// assert!(v.capacity() >= 100);
+    ///
+    /// v.shrink_to(50, GFP_KERNEL)?;
+    /// assert!(v.capacity() >= 50);
+    /// assert!(v.capacity() < 100);
+    ///
+    /// v.shrink_to(0, GFP_KERNEL)?;
+    /// assert!(v.capacity() >= 2);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn shrink_to(&mut self, min_capacity: usize, flags: Flags) -> Result<(), AllocError> {
+        // Calculate the target capacity: max(len, min_capacity).
+        let target_cap = core::cmp::max(self.len(), min_capacity);
+
+        // If we're already within limits, nothing to do.
+        if self.capacity() <= target_cap {
+            return Ok(());
+        }
+
+        // ZSTs have no allocation to shrink.
+        if Self::is_zst() {
+            return Ok(());
+        }
+
+        // Handle empty vector or target capacity 0: just free the allocation and reset.
+        if target_cap == 0 {
+            // Only free if we actually have an allocation.
+            if !self.layout.is_empty() {
+                // SAFETY:
+                // - `self.ptr` was previously allocated with `A`.
+                // - `self.layout` matches the `ArrayLayout` of the preceding allocation.
+                unsafe { A::free(self.ptr.cast(), self.layout.into()) };
+            }
+            self.ptr = NonNull::dangling();
+            self.layout = ArrayLayout::empty();
+            return Ok(());
+        }
+
+        // Create a new layout that exactly fits the target capacity.
+        // SAFETY: `target_cap` is guaranteed to be <= `self.capacity()`, and the original
+        // capacity was validated, so `target_cap * size_of::<T>() <= isize::MAX`.
+        let new_layout = unsafe { ArrayLayout::<T>::new_unchecked(target_cap) };
+
+        // Allocate a new, smaller buffer.
+        let new_ptr = A::alloc(new_layout.into(), flags, NumaNode::NO_NODE)?;
+
+        // SAFETY:
+        // - `self.as_ptr()` is valid for reads of `self.len` elements by the type invariant.
+        // - `new_ptr` is valid for writes of `self.len` elements (we just allocated it).
+        // - The regions do not overlap (different allocations).
+        // - Both pointers are properly aligned.
+        unsafe {
+            ptr::copy_nonoverlapping(self.as_ptr(), new_ptr.as_ptr().cast::<T>(), self.len);
+        }
+
+        // Free the old buffer.
+        // SAFETY:
+        // - `self.ptr` was previously allocated with `A`.
+        // - `self.layout` matches the `ArrayLayout` of the preceding allocation.
+        unsafe { A::free(self.ptr.cast(), self.layout.into()) };
+
+        // SAFETY: `new_ptr.as_ptr()` is non-null because `A::alloc` succeeded.
+        self.ptr = unsafe { NonNull::new_unchecked(new_ptr.as_ptr().cast::<T>()) };
+        self.layout = new_layout;
+
+        Ok(())
+    }
+
+    /// Shrinks the capacity of the vector as much as possible.
+    ///
+    /// The capacity will be reduced to match the length, freeing any excess memory.
+    /// This requires allocating a new buffer and copying the elements, then freeing
+    /// the old buffer.
+    ///
+    /// If the allocation of the new buffer fails, the vector is left unchanged and
+    /// an error is returned.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::with_capacity(100, GFP_KERNEL)?;
+    /// v.push(1, GFP_KERNEL)?;
+    /// v.push(2, GFP_KERNEL)?;
+    /// v.push(3, GFP_KERNEL)?;
+    /// assert!(v.capacity() >= 100);
+    ///
+    /// v.shrink_to_fit(GFP_KERNEL)?;
+    /// assert_eq!(v.capacity(), 3);
+    /// assert_eq!(&v, &[1, 2, 3]);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn shrink_to_fit(&mut self, flags: Flags) -> Result<(), AllocError> {
+        self.shrink_to(0, flags)
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
-- 
2.43.0

