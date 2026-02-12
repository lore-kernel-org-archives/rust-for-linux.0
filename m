Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AA21D61BC;
	Thu, 12 Feb 2026 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884729; cv=none; b=XwFY9LxOi5yVagj7LjmPcDEsAV0t0uapijjxPTFAYfTply7L5ymXxeEmTuL11TShbEy4jiZmV7ZIqJaGzinvQdwFVjpH7M3LZo7ZrZsEVMXzbx50ha1wPETkIL2plAjCgMnetyzLtc+dAMTO+Beluw8yF3zl5Rbvit3rp4Pyf/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884729; c=relaxed/simple;
	bh=Nhuwb8Qlgw/27lqKry0LC8M8GZuoPjdo0qzwMJep4DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cxVFjdeFxGAEtkhrfSE0Ej/Y5EFqvDNT73AolNAeH+9lmvQqljq9J/UzjxSPbXuWUtEvwgn9vGk3HzFdqa/tBWkJC2kRczzNiA31DCLOiur3vPE3sH/EAZunXSar6tTIlGnkKSkY5qjAZWG6k8RM5mq68Ifs0sNkW+BGSo6w2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+DJ8f1m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+DJ8f1m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5102C19424;
	Thu, 12 Feb 2026 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770884729;
	bh=Nhuwb8Qlgw/27lqKry0LC8M8GZuoPjdo0qzwMJep4DY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N+DJ8f1mfzd+O+7QHJro0FqopHlwpWTeSLMeA5JxE7PIkIUl7GNgroQSamWudnc3T
	 O9EX+vwtSJUmYGGbZ5GYwU3lwF19tDT+2+KXH/Pjn626YNVzBXEzSBL2lM/3rnfVZm
	 ZA8YB58l+fg14+D6e0Ze3sfLb7O+URMmCpNN7r50y/Da2nyfZWPI74hTmSOvboidu7
	 P70N7Si3Sv70rcPv3tdFOf58fxyVJBuM1vBdneHYg26+jUdGv9hRhmzitz9N4dkvXI
	 RTehYhTxb+aerP2p4JwIZ/hSYE5COBbJLw7YC0JN0Tr6DwS+JAgz90E6P4BkZIt5c9
	 EXbz59zDpvohg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95605EDF05A;
	Thu, 12 Feb 2026 08:25:29 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Thu, 12 Feb 2026 13:47:08 +0530
Subject: [PATCH v4 2/3] rust: alloc: add KUnit tests for KVVec shrink_to
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-binder-shrink-vec-v3-v4-2-bd02f06bf2cd@zohomail.in>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770884727; l=4784;
 i=shivamkalra98@zohomail.in; s=20260212; h=from:subject:message-id;
 bh=2QVEAhtM4EYkLAdeVfP5HSGd+aJKKYsshbr35ZHZtV8=;
 b=6/UvYjHgkd/gQqNE/CED2qqQ1s3tKidz79s7gC1vRIYMT0KgVhFjf6Fzz0S4dZKjbNT1bqvyA
 zZuEFu5bgU5D9tRG0no+6Q8JpB9QyHS3EYJw9Wn9INDeGxkVN6y2N6h
X-Developer-Key: i=shivamkalra98@zohomail.in; a=ed25519;
 pk=9Q+S1LD/xjbjL7bEaLIlwRADBwU/6LJq7lYm8LFrkQE=
X-Endpoint-Received: by B4 Relay for shivamkalra98@zohomail.in/20260212
 with auth_id=633
X-Original-From: Shivam Kalra <shivamkalra98@zohomail.in>
Reply-To: shivamkalra98@zohomail.in

From: Shivam Kalra <shivamkalra98@zohomail.in>

Add comprehensive KUnit tests for the shrink_to method for KVVec.
The tests verify:
- Basic shrinking from multiple pages to fewer pages with data integrity
  preservation
- Empty vector shrinking to zero capacity
- No-op behavior when shrinking to a larger capacity than current
- Respect for min_capacity parameter when larger than vector length
These tests ensure that the shrinking logic correctly identifies when
memory can be reclaimed (by freeing at least one page) and that data
integrity is maintained throughout shrink operations.

Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
---
 rust/kernel/alloc/kvec.rs | 112 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 8524f9f3dff0..d28f8fccd30f 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1474,4 +1474,116 @@ fn add(value: &mut [bool]) {
             func.push_within_capacity(false).unwrap();
         }
     }
+
+    #[test]
+    fn test_kvvec_shrink_to() {
+        use crate::page::PAGE_SIZE;
+
+        // Calculate elements per page for u32.
+        let elements_per_page = PAGE_SIZE / core::mem::size_of::<u32>();
+
+        // Create a vector with capacity spanning multiple pages.
+        let mut v = KVVec::<u32>::with_capacity(elements_per_page * 4, GFP_KERNEL).unwrap();
+
+        // Add a few elements.
+        v.push(1, GFP_KERNEL).unwrap();
+        v.push(2, GFP_KERNEL).unwrap();
+        v.push(3, GFP_KERNEL).unwrap();
+
+        let initial_capacity = v.capacity();
+        assert!(initial_capacity >= elements_per_page * 4);
+
+        // Shrink to a capacity that would free at least one page.
+        v.shrink_to(elements_per_page, GFP_KERNEL).unwrap();
+
+        // Capacity should have been reduced.
+        assert!(v.capacity() < initial_capacity);
+        assert!(v.capacity() >= elements_per_page);
+
+        // Elements should be preserved.
+        assert_eq!(v.len(), 3);
+        assert_eq!(v[0], 1);
+        assert_eq!(v[1], 2);
+        assert_eq!(v[2], 3);
+
+        // Shrink to zero (should shrink to len).
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+
+        // Capacity should be at least the length.
+        assert!(v.capacity() >= v.len());
+
+        // Elements should still be preserved.
+        assert_eq!(v.len(), 3);
+        assert_eq!(v[0], 1);
+        assert_eq!(v[1], 2);
+        assert_eq!(v[2], 3);
+    }
+
+    #[test]
+    fn test_kvvec_shrink_to_empty() {
+        use crate::page::PAGE_SIZE;
+
+        let elements_per_page = PAGE_SIZE / core::mem::size_of::<u64>();
+
+        // Create a vector with large capacity but no elements.
+        let mut v = KVVec::<u64>::with_capacity(elements_per_page * 4, GFP_KERNEL).unwrap();
+
+        assert!(v.is_empty());
+        let initial_capacity = v.capacity();
+
+        // Shrink empty vector to zero.
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+
+        // Should have freed the allocation.
+        assert!(v.capacity() < initial_capacity);
+        assert!(v.is_empty());
+    }
+
+    #[test]
+    fn test_kvvec_shrink_to_no_op() {
+        use crate::page::PAGE_SIZE;
+
+        let elements_per_page = PAGE_SIZE / core::mem::size_of::<u32>();
+
+        // Create a small vector.
+        let mut v = KVVec::<u32>::with_capacity(elements_per_page, GFP_KERNEL).unwrap();
+        v.push(1, GFP_KERNEL).unwrap();
+
+        let capacity_before = v.capacity();
+
+        // Try to shrink to a capacity larger than current - should be no-op.
+        v.shrink_to(capacity_before + 100, GFP_KERNEL).unwrap();
+
+        assert_eq!(v.capacity(), capacity_before);
+        assert_eq!(v.len(), 1);
+        assert_eq!(v[0], 1);
+    }
+
+    #[test]
+    fn test_kvvec_shrink_to_respects_min_capacity() {
+        use crate::page::PAGE_SIZE;
+
+        let elements_per_page = PAGE_SIZE / core::mem::size_of::<u32>();
+
+        // Create a vector with large capacity.
+        let mut v = KVVec::<u32>::with_capacity(elements_per_page * 4, GFP_KERNEL).unwrap();
+
+        // Add some elements.
+        for i in 0..10 {
+            v.push(i, GFP_KERNEL).unwrap();
+        }
+
+        // Shrink to a min_capacity larger than length.
+        let min_cap = elements_per_page * 2;
+        v.shrink_to(min_cap, GFP_KERNEL).unwrap();
+
+        // Capacity should be at least min_capacity.
+        assert!(v.capacity() >= min_cap);
+
+        // All elements preserved.
+        assert_eq!(v.len(), 10);
+        for i in 0..10 {
+            assert_eq!(v[i as usize], i);
+        }
+    }
 }

-- 
2.43.0


