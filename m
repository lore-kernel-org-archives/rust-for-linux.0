Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8D1AC44D;
	Thu, 12 Feb 2026 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884729; cv=none; b=GVQkPxFfkzoFCjCyo5jhyinnaSxXEjrdj8kjirVhL2zwrQS+iU5PGml85d4siLQiH/VxK4qm6fGDGJTyrUGZOkrcNAvTNuZMcgmnkxHALp1pR7GXkyHhvr3bIAHui4rUqixLuLbV8tj0Wl5hxuy+y/7tyRapb2XL6rtZixZ5ejM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884729; c=relaxed/simple;
	bh=+U+p2Z/uUpt8RAU6nY6WDOUeBR8Psa2pT13SYRVgxIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ra7+S5XXmcjDlQIzgFCEUyhsbKMX5r329AjzYhkSYAUVd6NpCk1COK/hwDdFVgggmbbMtIAT1oUjzKcEIB17K8AlLQcZOfissobhzGjq7E7e/wnvL+g6uDI1zMVeKD0gD3yMzs5OfXThubQttP7U/jIcu570OMAt1NUV2ldahog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBTsj6mV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBTsj6mV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91D31C2BC87;
	Thu, 12 Feb 2026 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770884729;
	bh=+U+p2Z/uUpt8RAU6nY6WDOUeBR8Psa2pT13SYRVgxIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YBTsj6mV+SCiqvZvIq/p/xLjsChWCdLJzjGycyLUviI/GlVz3iQXxVYjqR+wWh2mb
	 p2Qar+xL/PlGsAldpnrcuNVODK4w2XoVPoTRSc58OARfGdVeBOgmLK00HzKG0/12Il
	 z64ScUPICL4chGvUaUyVzuovhu/h9oD0M9Hun27DxgREHS1lvWbwjra3o4nIXL0zXu
	 kWrJ3DJ0bZukGKy9QuABGi9r2YntWTo3LOPXlVssRvI93T6QmQC9fyLFTVYphxouOm
	 KmEvw3icsHWKa3hnhbxcY/L2v1hRZeN86JH9ixPCZSS/DqdDXLFamfusuhzQj9yyat
	 Ik+nrM+ca6b4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB3BEDF057;
	Thu, 12 Feb 2026 08:25:29 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Thu, 12 Feb 2026 13:47:07 +0530
Subject: [PATCH v4 1/3] rust: kvec: implement shrink_to for KVVec
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-binder-shrink-vec-v3-v4-1-bd02f06bf2cd@zohomail.in>
References: <20260212-binder-shrink-vec-v3-v4-0-bd02f06bf2cd@zohomail.in>
In-Reply-To: <20260212-binder-shrink-vec-v3-v4-0-bd02f06bf2cd@zohomail.in>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770884727; l=4766;
 i=shivamkalra98@zohomail.in; s=20260212; h=from:subject:message-id;
 bh=1lmOoNDN5k5Y6BEWGGmNH2kzUdtUf76G0aStHL8oIVA=;
 b=xJMLNeITnl+KLCAJHk6yXl87VBNwc4sEfJttzmOGUN2f7M6ibXpJI+sRUXDFCsCDAF9rL2q1E
 yPexhxYkR2VAVfyTmwkqsCb848DVmC60710WSWlfWYqgX366tmw1R8O
X-Developer-Key: i=shivamkalra98@zohomail.in; a=ed25519;
 pk=9Q+S1LD/xjbjL7bEaLIlwRADBwU/6LJq7lYm8LFrkQE=
X-Endpoint-Received: by B4 Relay for shivamkalra98@zohomail.in/20260212
 with auth_id=633
X-Original-From: Shivam Kalra <shivamkalra98@zohomail.in>
Reply-To: shivamkalra98@zohomail.in

From: Shivam Kalra <shivamkalra98@zohomail.in>

Implement shrink_to method specifically for `KVVec` (i.e., `Vec<T, KVmalloc>`).
`shrink_to` reduces the vector's capacity to a specified minimum, but
only performs shrinking when it would free at least one page of memory.
This prevents unnecessary allocations while allowing reclamation of
unused memory.
The implementation uses explicit alloc+copy+free because `vrealloc`
does not yet support in-place shrinking. A TODO note marks this for
future replacement with a generic shrink_to for all allocators that
uses `A::realloc()` once the underlying allocators properly support
shrinking via realloc.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
---
 rust/kernel/alloc/kvec.rs | 78 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index ac8d6f763ae81..8524f9f3dff0a 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -9,7 +9,7 @@
 };
 use crate::{
     fmt,
-    page::AsPageIter, //
+    page::{AsPageIter, PAGE_SIZE},
 };
 use core::{
     borrow::{Borrow, BorrowMut},
@@ -734,6 +734,82 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
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
+    /// Shrinking only occurs if the operation would free at least one page of memory.
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
+                // SAFETY: `self.ptr` was allocated with `KVmalloc`, layout matches.
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
+        // TODO: Once vrealloc supports in-place shrinking (mm/vmalloc.c:4316), this
+        // explicit alloc+copy+free can potentially be replaced with realloc.
+        let new_ptr = KVmalloc::alloc(new_layout.into(), flags, NumaNode::NO_NODE)?;
+
+        // SAFETY: Both pointers are valid, non-overlapping, and properly aligned.
+        unsafe {
+            ptr::copy_nonoverlapping(self.as_ptr(), new_ptr.as_ptr().cast::<T>(), self.len);
+        }
+
+        // SAFETY: `self.ptr` was allocated with `KVmalloc`, layout matches.
+        unsafe { KVmalloc::free(self.ptr.cast(), self.layout.into()) };
+
+        // SAFETY: `new_ptr` is non-null because `KVmalloc::alloc` succeeded.
+        self.ptr = unsafe { NonNull::new_unchecked(new_ptr.as_ptr().cast::<T>()) };
+        self.layout = new_layout;
+
+        Ok(())
+    }
+}
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
     /// Extend the vector by `n` clones of `value`.

-- 
2.43.0


