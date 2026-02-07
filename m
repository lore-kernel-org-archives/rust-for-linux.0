Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15F33E34C;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770464223; cv=none; b=T92+78AoSOTAs2we+TM212Tj9ifnAlos4/lsYQ/p+6mPLdb7zKjZosLoKUHGVURhqJfiM0wJhVZdn3l7XlTGnQWfi7MIRhTKepI1UwNZV9ALnc4n7nqyxmJJpLaowrGTihLq4dlyKATZijCAkR/75ZBeT9Ga36etl2WJKQu7HWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770464223; c=relaxed/simple;
	bh=Vu6LCkHLEagnBlnc2yB95toUMOvp1Ep3fa6cqun+Mxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bHB9iDj0jWTXD2p/D+o6cbmdRWGe3JqCz7e7vOA4mTOlw4GM7LjtXu5xCfkiRi4/AlrXRKeQvTgoV26W03VtbO5+HfZcmozrh14Sg0nMVhYNKzRZH7Jay8Bag9rM1HF5QxpApxJlZN3yIfzOxTA0sO+EiTjIticQYMndzeHtTic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvAg59y2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvAg59y2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74AEAC19422;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770464223;
	bh=Vu6LCkHLEagnBlnc2yB95toUMOvp1Ep3fa6cqun+Mxw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BvAg59y2Ggc9mD6wdNKjrbo2e14P+XEwLFZilNYgfwFr8UeME2p6iWYofE27rRn+o
	 ob8yD/XdWSvp3WIbzkq2IxY1O9TEOjYPt+ZTdTVWx7PUQGSgA8x8uASm7reuc0G3kz
	 jGrn09fkoy2NdZGKzDJLpCHewCgpmib6JcwdZJanyyzQ0+CNiHe4o0XMuHDhtiCf2O
	 NmMd+dpVfFMILQJPzifx5s1zBfk0PLTspYshtgIpdd/+MgaR1b2uxQcJHOMmi6rxDU
	 aSkhJHsZKvy5b1WIzzLylA5NCSKyO31JA5bVR82OlxhhH1AxxwpnZH8U5NYwTdgbg3
	 IADxXTaGDaTFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CA5EE0ADA;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamklr.cock.li@kernel.org>
Date: Sat, 07 Feb 2026 17:02:47 +0530
Subject: [PATCH v3 1/4] rust: alloc: introduce Shrinkable trait
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-binder-shrink-vec-v3-v3-1-8ff388563427@cock.li>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770464219; l=3225;
 i=shivamklr@cock.li; s=20260206; h=from:subject:message-id;
 bh=jpKzN865IppJi7C0CyvO1g4N4Vl1EkzCBuFHxaHO0OE=;
 b=zhIqUwyAdly7/oTkm+yQc7lOMHTvmT3Eo+4h5sTrfCeCRighkyX4B4LuahXY3vuFS4AiuoOh5
 KZTu2KbaoCsA/CSSM/LXWseQ3QK9QxZ/Y+AZtY+8JRmdF6nL8f4hLnk
X-Developer-Key: i=shivamklr@cock.li; a=ed25519;
 pk=vMC4wm7HuB8IdkiHldCdtuViW0NTnShcRaMF50MWRFQ=
X-Endpoint-Received: by B4 Relay for shivamklr@cock.li/20260206 with
 auth_id=628
X-Original-From: Shivam Kalra <shivamklr@cock.li>
Reply-To: shivamklr@cock.li

From: Shivam Kalra <shivamklr@cock.li>

Introduce the `Shrinkable` trait to identify allocators that can
meaningfully reclaim memory when an allocation is shrunk.

In the kernel, the slab allocator (`Kmalloc`) uses fixed-size buckets,
meaning a "shrink" operation often results in the same bucket size being
used, yielding no actual memory savings. However, page-based allocators
like `Vmalloc` can reclaim physical pages when the size reduction
crosses a page boundary.

This marker trait allows generic containers (like `KVec` or `KVVec`) to
determine at compile-time or run-time (via `is_shrinkable`) if a
shrinking operation is worth performing.

Signed-off-by: Shivam Kalra <shivamklr@cock.li>
---
 rust/kernel/alloc/allocator.rs | 48 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 63bfb91b36712..615799b680b55 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -251,6 +251,54 @@ unsafe fn realloc(
     }
 }
 
+/// Marker trait for allocators that support meaningful shrinking.
+///
+/// Shrinking is only meaningful for allocators that can actually reclaim memory. The slab
+/// allocator (`Kmalloc`) uses fixed-size buckets and cannot reclaim memory when shrinking,
+/// so it does not implement this trait.
+///
+/// For `Vmalloc`, shrinking always makes sense since it uses page-granularity allocations.
+/// For `KVmalloc`, shrinking only makes sense if the allocation is backed by vmalloc (checked
+/// at runtime via `is_vmalloc_addr`).
+///
+/// # Note
+///
+/// Currently, shrinking vmalloc allocations requires explicit alloc+copy+free because
+/// `vrealloc` does not support in-place shrinking (see TODO at `mm/vmalloc.c:4316`).
+/// Once `vrealloc` gains this capability, the shrink implementation can be simplified.
+///
+/// # Safety
+///
+/// Implementors must ensure that [`Shrinkable::is_shrinkable`] returns `true` only when
+/// shrinking the allocation would actually reclaim memory.
+pub unsafe trait Shrinkable: Allocator {
+    /// Returns whether shrinking an allocation at the given pointer would reclaim memory.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer to an allocation made by this allocator.
+    unsafe fn is_shrinkable(ptr: NonNull<u8>) -> bool;
+}
+
+// SAFETY: `Vmalloc` always uses vmalloc, which allocates at page granularity. Shrinking a
+// vmalloc allocation by at least one page will reclaim that memory.
+unsafe impl Shrinkable for Vmalloc {
+    #[inline]
+    unsafe fn is_shrinkable(_ptr: NonNull<u8>) -> bool {
+        true
+    }
+}
+
+// SAFETY: `KVmalloc` may use either kmalloc or vmalloc. We check at runtime using
+// `is_vmalloc_addr` to determine if shrinking would be meaningful.
+unsafe impl Shrinkable for KVmalloc {
+    #[inline]
+    unsafe fn is_shrinkable(ptr: NonNull<u8>) -> bool {
+        // SAFETY: `ptr` is a valid pointer by the safety requirements of this function.
+        unsafe { bindings::is_vmalloc_addr(ptr.as_ptr().cast()) }
+    }
+}
+
 #[macros::kunit_tests(rust_allocator)]
 mod tests {
     use super::*;

-- 
2.43.0


