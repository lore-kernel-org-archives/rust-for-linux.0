Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52A02853E0;
	Sat, 14 Feb 2026 20:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771101331; cv=none; b=oEUmaYkn6f3FbROkE9zfUgftVgP/ldnKek5ksWY8fkiWoyTXWo08zMbqhrBpaqVBd43OkKOTwqNSCbs+ETpDZDOVxXyJzw37yXrORqCTfRTTrNYMj9f0s9PoYLDBOBqR+jiUK5pNRsevbfCcBopqE9YS9+YtURIXiBbHEYG/xyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771101331; c=relaxed/simple;
	bh=DFzFq2+l6oRFWjsx6kkw3fVOrQ6Yd/TVaImOm3VVMtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lLwP1epMGo9OwPxPU1MLm71u5v1fYqyY7hn9G2W+T2oUvJ3ZpOD486LD4FETdFns90kF9WXzOQAZ/XxiZ9Hh+mW4D37DkaFC9YIzmDc8mJwkOID2KIMoevc45jt8CJFjypD6gZhJ0WnGyFgOFoyZckYa9sUS0DnLblviAbKqjJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQl7cH0S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQl7cH0S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9012DC2BC9E;
	Sat, 14 Feb 2026 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771101331;
	bh=DFzFq2+l6oRFWjsx6kkw3fVOrQ6Yd/TVaImOm3VVMtQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KQl7cH0SB/n4JZSOTLEnFFeKYXXl6ZX4/ZQLSLpZFx2BIJFwgxTwhaZ6HJCq02HMI
	 UDNeJdePJgx8HJYF6wBQI8q2u7c3VtyrWJG5f0e6j90JEvI8UXcqIGpDvrYWvoVEj6
	 ssHmTXbeEFgdClPIrSVhC+CN6Lqx3sXrKwm+W72qvZlN8Qof5hbkz6NaSeWH89oODS
	 AD8LSQEnNaPknhhbG4H8tcxlSsXIElnSt21/RIEfmNrAft1EGx4yvwLDjOXo+HThmW
	 jH8HXOAs6f7L0YhmPaxPoAV6o8n7SicYfDPx+Ce5/xL2CssZMMTql/X+ijy4lnDAZg
	 wJO/EKb0nJj7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740A9EF5852;
	Sat, 14 Feb 2026 20:35:31 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Sun, 15 Feb 2026 02:05:21 +0530
Subject: [PATCH v5 1/3] rust: kvec: implement shrink_to for KVVec
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-binder-shrink-vec-v3-v5-1-6e5e56d69766@zohomail.in>
References: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>
In-Reply-To: <20260215-binder-shrink-vec-v3-v5-0-6e5e56d69766@zohomail.in>
To: Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shivam Kalra <shivamkalra98@zohomail.in>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771101329; l=6328;
 i=shivamkalra98@zohomail.in; s=20260212; h=from:subject:message-id;
 bh=CNOdoVAKpifopKTG32k814tiFCi7KrBOMJnN4YVcgbY=;
 b=GLSleGN3AXLN7xb5N1298AIm4FNbkCx5fItdmTZ37q2ADEkF3stkblHXUXuPqVubnCZnySQYX
 fM8bo6AzHmHB7CZYCAKluJHmJR8YvlBC8PTIm92AvR8/gezbghtnZAD
X-Developer-Key: i=shivamkalra98@zohomail.in; a=ed25519;
 pk=9Q+S1LD/xjbjL7bEaLIlwRADBwU/6LJq7lYm8LFrkQE=
X-Endpoint-Received: by B4 Relay for shivamkalra98@zohomail.in/20260212
 with auth_id=633
X-Original-From: Shivam Kalra <shivamkalra98@zohomail.in>
Reply-To: shivamkalra98@zohomail.in

From: Shivam Kalra <shivamkalra98@zohomail.in>

Implement shrink_to method specifically for `KVVec` (i.e.,
`Vec<T, KVmalloc>`). `shrink_to` reduces the vector's capacity to a
specified minimum.

For kmalloc-backed allocations, the method delegates to realloc(),
letting the allocator decide whether shrinking is worthwhile. For
vmalloc-backed allocations (detected via is_vmalloc_addr), shrinking
only occurs if at least one page of memory can be freed, using an
explicit alloc+copy+free since vrealloc does not yet support in-place
shrinking.

A TODO note marks this for future replacement with a generic shrink_to
for all allocators that uses A::realloc() once the underlying allocators
properly support shrinking via realloc.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
---
 rust/kernel/alloc/kvec.rs | 114 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae81..e7bc439538e49 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -9,7 +9,10 @@
 };
 use crate::{
     fmt,
-    page::AsPageIter, //
+    page::{
+        AsPageIter,
+        PAGE_SIZE, //
+    },
 };
 use core::{
     borrow::{Borrow, BorrowMut},
@@ -734,6 +737,115 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
         self.truncate(num_kept);
     }
 }
+// TODO: This is a temporary KVVec-specific implementation. It should be replaced with a generic
+// `shrink_to()` for `impl<T, A: Allocator> Vec<T, A>` that uses `A::realloc()` once the
+// underlying allocators properly support shrinking via realloc.
+impl<T> Vec<T, KVmalloc> {
+    /// Shrinks the capacity of the vector with a lower bound.
+    ///
+    /// The capacity will remain at least as large as both the length and the supplied value.
+    /// If the current capacity is less than the lower limit, this is a no-op.
+    ///
+    /// For `kmalloc` allocations, this delegates to `realloc()`, which decides whether
+    /// shrinking is worthwhile. For `vmalloc` allocations, shrinking only occurs if the
+    /// operation would free at least one page of memory, and performs a deep copy since
+    /// `vrealloc` does not yet support in-place shrinking.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// // Allocate enough capacity to span multiple pages.
+    /// let elements_per_page = kernel::page::PAGE_SIZE / core::mem::size_of::<u32>();
+    /// let mut v = KVVec::with_capacity(elements_per_page * 4, GFP_KERNEL)?;
+    /// v.push(1, GFP_KERNEL)?;
+    /// v.push(2, GFP_KERNEL)?;
+    ///
+    /// v.shrink_to(0, GFP_KERNEL)?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn shrink_to(&mut self, min_capacity: usize, flags: Flags) -> Result<(), AllocError> {
+        let target_cap = core::cmp::max(self.len(), min_capacity);
+
+        if self.capacity() <= target_cap {
+            return Ok(());
+        }
+
+        if Self::is_zst() {
+            return Ok(());
+        }
+
+        // For kmalloc allocations, delegate to realloc() and let the allocator decide
+        // whether shrinking is worthwhile.
+        //
+        // SAFETY: `self.ptr` points to a valid `KVmalloc` allocation.
+        if !unsafe { bindings::is_vmalloc_addr(self.ptr.as_ptr().cast()) } {
+            let new_layout = ArrayLayout::<T>::new(target_cap).map_err(|_| AllocError)?;
+
+            // SAFETY:
+            // - `self.ptr` is valid and was previously allocated with `KVmalloc`.
+            // - `self.layout` matches the `ArrayLayout` of the preceding allocation.
+            let ptr = unsafe {
+                KVmalloc::realloc(
+                    Some(self.ptr.cast()),
+                    new_layout.into(),
+                    self.layout.into(),
+                    flags,
+                    NumaNode::NO_NODE,
+                )?
+            };
+
+            self.ptr = ptr.cast();
+            self.layout = new_layout;
+            return Ok(());
+        }
+
+        // Only shrink if we would free at least one page.
+        let current_size = self.capacity() * core::mem::size_of::<T>();
+        let target_size = target_cap * core::mem::size_of::<T>();
+        let current_pages = current_size.div_ceil(PAGE_SIZE);
+        let target_pages = target_size.div_ceil(PAGE_SIZE);
+
+        if current_pages <= target_pages {
+            return Ok(());
+        }
+
+        if target_cap == 0 {
+            if !self.layout.is_empty() {
+                // SAFETY:
+                // - `self.ptr` was previously allocated with `KVmalloc`.
+                // - `self.layout` matches the `ArrayLayout` of the preceding allocation.
+                unsafe { KVmalloc::free(self.ptr.cast(), self.layout.into()) };
+            }
+            self.ptr = NonNull::dangling();
+            self.layout = ArrayLayout::empty();
+            return Ok(());
+        }
+
+        // SAFETY: `target_cap <= self.capacity()` and original capacity was valid.
+        let new_layout = unsafe { ArrayLayout::<T>::new_unchecked(target_cap) };
+
+        let new_ptr = KVmalloc::alloc(new_layout.into(), flags, NumaNode::NO_NODE)?;
+
+        // SAFETY:
+        // - `self.as_ptr()` is valid for reads of `self.len()` elements of `T`.
+        // - `new_ptr` is valid for writes of at least `target_cap >= self.len()` elements.
+        // - The two allocations do not overlap since `new_ptr` is freshly allocated.
+        // - Both pointers are properly aligned for `T`.
+        unsafe {
+            ptr::copy_nonoverlapping(self.as_ptr(), new_ptr.as_ptr().cast::<T>(), self.len())
+        };
+
+        // SAFETY:
+        // - `self.ptr` was previously allocated with `KVmalloc`.
+        // - `self.layout` matches the `ArrayLayout` of the preceding allocation.
+        unsafe { KVmalloc::free(self.ptr.cast(), self.layout.into()) };
+
+        self.ptr = new_ptr.cast::<T>();
+        self.layout = new_layout;
+
+        Ok(())
+    }
+}
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
     /// Extend the vector by `n` clones of `value`.

-- 
2.43.0


