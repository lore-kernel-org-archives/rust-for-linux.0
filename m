Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A6233FE04;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770464224; cv=none; b=Xze2d7l+SJIezo0yJlmKP+rPggiML8hh1bpN5Z17CEKao2+R92boi5obDOg1L8UxM2QSrrXcBBQf6EfpKit+rJ/XA7FMIFOrA0TIItQaLW7Ocw/tYEga0iHojvwEgI62sc0VgCvxjcDH80HOo4TdUXA5NWhEhEbL4QsNrMitqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770464224; c=relaxed/simple;
	bh=bz1+NChw9jqeqpfXTkTO8no1oUG2MeIxrIxupn++pRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2+yCd3DtxNb0Twu6FYz54q+mDroPEnlPuk9NruJY2EcFiwEKmzEBh6VvmINxYQYy84FmAZub8yBU2l50nCHV1TlXPyxYAdnTS5RvVXRs17j8GuLbYz9sFKaIe5LqfBjXXSIuBXkrh6baEKwaW9Wx2dBc8FtZ4e4Sz9t/wKJKqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDB2FQ+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDB2FQ+j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84330C19425;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770464223;
	bh=bz1+NChw9jqeqpfXTkTO8no1oUG2MeIxrIxupn++pRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UDB2FQ+jFq7ynVBBJhEo8nPgg+peXJPPj0sjpzpoNI92Ezz5ZMD6RzX2CtCa+0i6v
	 JXiVFSUQDfXxcGrVhJhe/VpVqfP93TmjoRK3tIk72SokOMFfceYT0wvKTVzjcZCtn1
	 D7sW4DHYqOiUBXWiqQJuGKfL/IOKCLHIGp5fQ0sR6FJ0BVFaru5q65RznrGqpUaTLQ
	 +Lvg/l5K8pc/UL8cis1shTnB103WJEsx7S6IL2DzOdFWy0fjnxpDTtEbfEYuvlhpdC
	 krjh6o+xA70DiRyf7BFFC5YBGmuipjlvN1cvlP9CRXMjJu1PNscitFyDjmQOsHZ/BY
	 mRZl+Rfa/2ymw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74830EE0AD9;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamklr.cock.li@kernel.org>
Date: Sat, 07 Feb 2026 17:02:48 +0530
Subject: [PATCH v3 2/4] rust: kvec: implement shrink_to and shrink_to_fit
 for Vec
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-binder-shrink-vec-v3-v3-2-8ff388563427@cock.li>
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
In-Reply-To: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
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
 Shivam Kalra <shivamklr@cock.li>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770464219; l=6276;
 i=shivamklr@cock.li; s=20260206; h=from:subject:message-id;
 bh=VS6hjlCsw50rC5LExWM9OsFec4LNbO7EsbpLvNDwBLA=;
 b=57DJT0+/d7Rh/Wgps3VfhfwTnf7wGAWgIIJ2fdXHeWcxDZS3o0pdS/jDtsIsxzjonLPAm6nMj
 VIjwgQY74KgDcejMewKsGWCBABV/FCLmiZ1OCoyqZ+PUgYXl0KG48ps
X-Developer-Key: i=shivamklr@cock.li; a=ed25519;
 pk=vMC4wm7HuB8IdkiHldCdtuViW0NTnShcRaMF50MWRFQ=
X-Endpoint-Received: by B4 Relay for shivamklr@cock.li/20260206 with
 auth_id=628
X-Original-From: Shivam Kalra <shivamklr@cock.li>
Reply-To: shivamklr@cock.li

From: Shivam Kalra <shivamklr@cock.li>

Implement `shrink_to` and `shrink_to_fit` methods for `Vec<T, A>` where
`A` implements the `Shrinkable` trait.

`shrink_to` reduces the vector's capacity to a specified minimum, while
`shrink_to_fit` attempts to shrink capacity to match the current length.

Both methods only perform shrinking when it would be beneficial:
- The allocator must support meaningful shrinking (checked via the
  `Shrinkable` trait bound and `is_shrinkable` runtime check).
- The operation must free at least one page of memory.

This prevents unnecessary allocations (where shrinking provides no
benefit) while allowing to reclaim unused memory.

The implementation uses explicit alloc+copy+free because `vrealloc`
does not yet support in-place shrinking. A TODO note marks this for
future optimization once the kernel's `vrealloc` gains that capability.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Shivam Kalra <shivamklr@cock.li>
---
 rust/kernel/alloc/kvec.rs | 111 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae81..22a327d69c061 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -3,13 +3,13 @@
 //! Implementation of [`Vec`].
 
 use super::{
-    allocator::{KVmalloc, Kmalloc, Vmalloc, VmallocPageIter},
+    allocator::{KVmalloc, Kmalloc, Shrinkable, Vmalloc, VmallocPageIter},
     layout::ArrayLayout,
     AllocError, Allocator, Box, Flags, NumaNode,
 };
 use crate::{
     fmt,
-    page::AsPageIter, //
+    page::{AsPageIter, PAGE_SIZE},
 };
 use core::{
     borrow::{Borrow, BorrowMut},
@@ -735,6 +735,113 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
     }
 }
 
+impl<T, A: Shrinkable> Vec<T, A> {
+    /// Shrinks the capacity of the vector with a lower bound.
+    ///
+    /// The capacity will remain at least as large as both the length and the supplied value.
+    /// If the current capacity is less than the lower limit, this is a no-op.
+    ///
+    /// Shrinking only occurs if:
+    /// - The allocator supports shrinking for this allocation (see [`Shrinkable`]).
+    /// - The operation would free at least one page of memory.
+    ///
+    /// If these conditions are not met, the vector is left unchanged.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::allocator::Vmalloc;
+    ///
+    /// // Allocate enough capacity to span multiple pages.
+    /// let elements_per_page = kernel::page::PAGE_SIZE / core::mem::size_of::<u32>();
+    /// let mut v: Vec<u32, Vmalloc> = Vec::with_capacity(elements_per_page * 4, GFP_KERNEL)?;
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
+        // SAFETY: `self.ptr` is valid by the type invariant.
+        if !unsafe { A::is_shrinkable(self.ptr.cast()) } {
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
+                // SAFETY: `self.ptr` was allocated with `A`, layout matches.
+                unsafe { A::free(self.ptr.cast(), self.layout.into()) };
+            }
+            self.ptr = NonNull::dangling();
+            self.layout = ArrayLayout::empty();
+            return Ok(());
+        }
+
+        // SAFETY: `target_cap <= self.capacity()` and original capacity was valid.
+        let new_layout = unsafe { ArrayLayout::<T>::new_unchecked(target_cap) };
+
+        // TODO: Once vrealloc supports in-place shrinking (mm/vmalloc.c:4316), this
+        // explicit alloc+copy+free can potentially be replaced with realloc.
+        let new_ptr = A::alloc(new_layout.into(), flags, NumaNode::NO_NODE)?;
+
+        // SAFETY: Both pointers are valid, non-overlapping, and properly aligned.
+        unsafe {
+            ptr::copy_nonoverlapping(self.as_ptr(), new_ptr.as_ptr().cast::<T>(), self.len);
+        }
+
+        // SAFETY: `self.ptr` was allocated with `A`, layout matches.
+        unsafe { A::free(self.ptr.cast(), self.layout.into()) };
+
+        // SAFETY: `new_ptr` is non-null because `A::alloc` succeeded.
+        self.ptr = unsafe { NonNull::new_unchecked(new_ptr.as_ptr().cast::<T>()) };
+        self.layout = new_layout;
+
+        Ok(())
+    }
+
+    /// Shrinks the capacity of the vector as much as possible.
+    ///
+    /// This is equivalent to calling `shrink_to(0, flags)`. See [`Vec::shrink_to`] for details.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::allocator::Vmalloc;
+    ///
+    /// let elements_per_page = kernel::page::PAGE_SIZE / core::mem::size_of::<u32>();
+    /// let mut v: Vec<u32, Vmalloc> = Vec::with_capacity(elements_per_page * 4, GFP_KERNEL)?;
+    /// v.push(1, GFP_KERNEL)?;
+    /// v.push(2, GFP_KERNEL)?;
+    /// v.push(3, GFP_KERNEL)?;
+    ///
+    /// v.shrink_to_fit(GFP_KERNEL)?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn shrink_to_fit(&mut self, flags: Flags) -> Result<(), AllocError> {
+        self.shrink_to(0, flags)
+    }
+}
+
 impl<T: Clone, A: Allocator> Vec<T, A> {
     /// Extend the vector by `n` clones of `value`.
     pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> Result<(), AllocError> {

-- 
2.43.0


