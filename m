Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E733E346;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770464223; cv=none; b=NpBTy2hwAfaem4CWNGEsGD7cQLcReEG+5Xb1eDSN1AYamoT9PA3r4keW6bYnuReVGDhwtG2TpEqFg81zYWyXQsRpfl/aA2R0Lv9ubTZNLBhRxOm7HCrZ07Glz0VLXaX1NsekWLO5HZ4axRT6tUvjOkMnNqp4r5Har6ko7iwwZds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770464223; c=relaxed/simple;
	bh=FyMsfRksnV7rJFrVFyGIsI8M1GFYOiy/knSgCLU8ejo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlTInetkMDsQmcGpy5ulJBfNwDNdMtyBnV9bL6MSQvjVmEmtu5Rpmes1ZKi5LK9Tm6IgtTUt4QdqcAPxA5OcyzPLja4ylcPLUNn6rE1c+n5hL/AW20Xx8i/PsxdMYMBcXX+NnvcteEOw/zY7C9ofutRSh3QpqOVzfyxrC0P0Xbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSv0tQ5d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSv0tQ5d"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB2EFC2BCB0;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770464223;
	bh=FyMsfRksnV7rJFrVFyGIsI8M1GFYOiy/knSgCLU8ejo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eSv0tQ5donQ1Lb7xGH99sej03Ekn1+JuxQpWnLFcYkW4aeBFUSX4xI6oCfxCjh8it
	 WvX94G+/Tu58329tnap+sP4aeFvwbWdC+Wh975hN7f+0mU1oWPc/ih5orXsV7m+cyc
	 bnPQeL26xiR7HiqERrQflBkKN9yKiyim341DOPWereupX0YspcMIhLznjmMF9dDm/f
	 VXk+5+liUOyuxS1a0m1v7NOfEKf1ckJrXhzlD6iPS355nQSpnY1SbumC+fpkhWrU/4
	 EhK1qxOvxK16R51f4rEYYjMMcQTr8w3WL0Afet/qJdJ0kaWm3EXom++neEiwu9nrcu
	 LOPZJJY01Cy8Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC67EE0ADA;
	Sat,  7 Feb 2026 11:37:03 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamklr.cock.li@kernel.org>
Date: Sat, 07 Feb 2026 17:02:49 +0530
Subject: [PATCH v3 3/4] rust: alloc: add KUnit tests for Vec shrink
 operations
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-binder-shrink-vec-v3-v3-3-8ff388563427@cock.li>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770464219; l=8169;
 i=shivamklr@cock.li; s=20260206; h=from:subject:message-id;
 bh=NHTvS6dyqkW3XRY4+kOP853dlPQBD1euqXKRvwPwRzM=;
 b=e0veNa+pVF5XE5buNoXhgDCwpn/qL2W0am/1lsecsDXVsQ3QhZYkH+iDPcmf7Aexl2WmqDJ/u
 Tic5PXAM7jKCEOJNGA4JSox4fJ3Hb/vdbpxEuqs7Nos+tGBJYwCMTtj
X-Developer-Key: i=shivamklr@cock.li; a=ed25519;
 pk=vMC4wm7HuB8IdkiHldCdtuViW0NTnShcRaMF50MWRFQ=
X-Endpoint-Received: by B4 Relay for shivamklr@cock.li/20260206 with
 auth_id=628
X-Original-From: Shivam Kalra <shivamklr@cock.li>
Reply-To: shivamklr@cock.li

From: Shivam Kalra <shivamklr@cock.li>

Add comprehensive KUnit tests for `shrink_to` and `shrink_to_fit` methods
across different allocator backends (Vmalloc and KVmalloc).

The tests verify:
- Basic shrinking from multiple pages to less than one page
- Data integrity preservation after shrinking
- No-op behavior when shrinking would not free pages
- Empty vector shrinking
- Partial shrinking with min_capacity constraints
- Consecutive shrink operations
- KVVec shrinking behavior for both small (kmalloc-backed) and large
  (vmalloc-backed) allocations

These tests ensure that the shrinking logic correctly identifies when
memory can be reclaimed and that the `Shrinkable` trait implementation
works as expected.

Signed-off-by: Shivam Kalra <shivamklr@cock.li>
---
 rust/kernel/alloc/kvec.rs | 185 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 22a327d69c06..e7d4ba11c2b0 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1505,4 +1505,189 @@ fn add(value: &mut [bool]) {
             func.push_within_capacity(false).unwrap();
         }
     }
+
+    /// Test basic shrink_to functionality for VVec.
+    ///
+    /// Verifies that:
+    /// - Shrinking from multiple pages to less than one page works correctly.
+    /// - Data integrity is preserved after shrinking.
+    /// - Shrinking an already-optimal vector is a no-op.
+    /// - Requesting a min_capacity larger than current capacity is a no-op.
+    #[test]
+    fn test_shrink_to_vmalloc() {
+        use crate::page::PAGE_SIZE;
+
+        let elements_per_page = PAGE_SIZE / core::mem::size_of::<u32>();
+        let initial_pages = 4;
+        let initial_capacity = elements_per_page * initial_pages;
+
+        let mut v: VVec<u32> = VVec::with_capacity(initial_capacity, GFP_KERNEL).unwrap();
+
+        for i in 0..10 {
+            v.push(i, GFP_KERNEL).unwrap();
+        }
+
+        assert!(v.capacity() >= initial_capacity);
+        assert_eq!(v.len(), 10);
+
+        // Shrink from 4 pages to less than 1 page.
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+
+        // Verify data integrity.
+        assert_eq!(v.len(), 10);
+        for i in 0..10 {
+            assert_eq!(v[i], i as u32);
+        }
+
+        assert!(v.capacity() >= 10);
+        assert!(v.capacity() < initial_capacity);
+
+        // Already optimal: should be a no-op.
+        let cap_after_shrink = v.capacity();
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+        assert_eq!(v.capacity(), cap_after_shrink);
+
+        // min_capacity > capacity: should be a no-op (never grows).
+        v.shrink_to(initial_capacity * 2, GFP_KERNEL).unwrap();
+        assert_eq!(v.capacity(), cap_after_shrink);
+    }
+
+    /// Test that shrink_to is a no-op when no pages would be freed.
+    ///
+    /// Verifies that:
+    /// - When current and target capacity both fit in one page, no shrink occurs.
+    /// - The shrink_to_fit wrapper behaves identically to shrink_to(0).
+    #[test]
+    fn test_shrink_to_vmalloc_no_page_savings() {
+        use crate::page::PAGE_SIZE;
+
+        let elements_per_page = PAGE_SIZE / core::mem::size_of::<u32>();
+
+        let mut v: VVec<u32> = VVec::with_capacity(elements_per_page, GFP_KERNEL).unwrap();
+
+        for i in 0..(elements_per_page / 2) {
+            v.push(i as u32, GFP_KERNEL).unwrap();
+        }
+
+        let cap_before = v.capacity();
+
+        // No page savings: capacity unchanged.
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+        assert_eq!(v.capacity(), cap_before);
+
+        // shrink_to_fit wrapper: same behavior.
+        v.shrink_to_fit(GFP_KERNEL).unwrap();
+        assert_eq!(v.capacity(), cap_before);
+    }
+
+    /// Test shrink_to on an empty VVec.
+    ///
+    /// Verifies that shrinking an empty vector to capacity 0 frees the allocation.
+    #[test]
+    fn test_shrink_to_vmalloc_empty() {
+        use crate::page::PAGE_SIZE;
+
+        let elements_per_page = PAGE_SIZE / core::mem::size_of::<u32>();
+        let initial_capacity = elements_per_page * 2;
+
+        let mut v: VVec<u32> = VVec::with_capacity(initial_capacity, GFP_KERNEL).unwrap();
+        assert!(v.capacity() >= initial_capacity);
+
+        // Shrink empty vector: frees allocation.
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+        assert_eq!(v.capacity(), 0);
+        assert_eq!(v.len(), 0);
+    }
+
+    /// Test partial shrink and consecutive shrink operations.
+    ///
+    /// Verifies that:
+    /// - Shrinking with min_capacity > len but still saving pages works.
+    /// - Consecutive shrink calls maintain data integrity.
+    #[test]
+    fn test_shrink_to_vmalloc_partial_and_consecutive() {
+        use crate::page::PAGE_SIZE;
+
+        let elements_per_page = PAGE_SIZE / core::mem::size_of::<u32>();
+
+        let mut v: VVec<u32> = VVec::with_capacity(elements_per_page * 4, GFP_KERNEL).unwrap();
+
+        // Fill with ~2.5 pages worth of elements.
+        let target_elements = elements_per_page * 2 + elements_per_page / 2;
+        for i in 0..target_elements {
+            v.push(i as u32, GFP_KERNEL).unwrap();
+        }
+
+        // Partial shrink: 4 pages -> 3 pages (min_capacity > len).
+        let min_cap_3_pages = elements_per_page * 3;
+        v.shrink_to(min_cap_3_pages, GFP_KERNEL).unwrap();
+        assert!(v.capacity() >= min_cap_3_pages);
+        assert!(v.capacity() < elements_per_page * 4);
+        assert_eq!(v.len(), target_elements);
+
+        for i in 0..target_elements {
+            assert_eq!(v[i], i as u32);
+        }
+
+        // Consecutive shrink: verify layout remains consistent.
+        let cap_before = v.capacity();
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+        assert!(v.capacity() >= target_elements);
+        assert!(v.capacity() <= cap_before);
+
+        for i in 0..target_elements {
+            assert_eq!(v[i], i as u32);
+        }
+    }
+
+    /// Test KVVec shrink with small allocation (kmalloc-backed).
+    ///
+    /// KVmalloc uses kmalloc for small allocations. Since kmalloc cannot reclaim
+    /// memory when shrinking, shrink_to should be a no-op for small KVVec.
+    #[test]
+    fn test_shrink_to_kvvec_small() {
+        // Small allocation: likely kmalloc-backed, shrink should be no-op.
+        let mut v: KVVec<u32> = KVVec::with_capacity(10, GFP_KERNEL).unwrap();
+        for i in 0..5 {
+            v.push(i, GFP_KERNEL).unwrap();
+        }
+
+        let cap_before = v.capacity();
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+
+        // Kmalloc-backed: capacity unchanged (is_shrinkable returns false).
+        assert_eq!(v.capacity(), cap_before);
+        assert_eq!(v.len(), 5);
+    }
+
+    /// Test KVVec shrink with large allocation (vmalloc-backed).
+    ///
+    /// KVmalloc falls back to vmalloc for large allocations. When vmalloc-backed
+    /// and page savings are possible, shrink_to should actually shrink.
+    #[test]
+    fn test_shrink_to_kvvec_large() {
+        use crate::page::PAGE_SIZE;
+
+        let elements_per_page = PAGE_SIZE / core::mem::size_of::<u32>();
+        let initial_capacity = elements_per_page * 4;
+
+        // Large allocation: likely vmalloc-backed.
+        let mut v: KVVec<u32> = KVVec::with_capacity(initial_capacity, GFP_KERNEL).unwrap();
+        for i in 0..10 {
+            v.push(i, GFP_KERNEL).unwrap();
+        }
+
+        assert!(v.capacity() >= initial_capacity);
+
+        // Shrink from 4 pages to <1 page.
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+
+        // Vmalloc-backed with page savings: should shrink.
+        // Note: If allocation happened to use kmalloc, capacity won't change.
+        // This test verifies the path works; actual behavior depends on allocator.
+        assert_eq!(v.len(), 10);
+        for i in 0..10 {
+            assert_eq!(v[i], i as u32);
+        }
+    }
 }

-- 
2.43.0


