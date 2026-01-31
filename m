Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1B8331206;
	Sat, 31 Jan 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874089; cv=none; b=sccKNrbxkR31Hf3vuWFcdM+xbL7F25J2rY6b5n1/y4rsI5Q56CiFlUYnDb7Z4hTp9vtoEfb+vkiQrfT9XoSIM1R3oHmrm7MILaDGqBO65/37GvaDv71qqQ7nc7/5OSN8iQLcZZPlUnetxmbWonPQmrstaHNN5rnzNtvboJHu22g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874089; c=relaxed/simple;
	bh=ypJSZsd2gkd3H9jZrx749RhEDkv5ZqvN4gf27waZnjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+pST5jHBfzSNnGC5s3B/2QAOdrAZMCAUyiyo/9fc5rth4flC7KcIOgcYgWWssFanI6rIGFQMmXz/2DGMyNrRKSxy9asdHE8Q7ihszhVEPd/TR7Qn0Ote4gd9PoHPUBenTjZdiSAGn8/Fy4VC5zUpzUcdizl76fNqr/y9tbbNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=YDCO8sdg; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="YDCO8sdg"
From: Shivam Kalra <shivamklr@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1769874085; bh=ypJSZsd2gkd3H9jZrx749RhEDkv5ZqvN4gf27waZnjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDCO8sdgoGcMq8UwjUMLjhkmoBn7Ou+JmXzk7pZLIsAxkiGnAh1tY3zuhs2xnQiQJ
	 cXwLNg+X798hthqIqGwzq6l8lejdb4c0EQVW8qWAGrpSzyiShaeFnC+2Xo0uBA3R/e
	 +Kf0g1akWzv790gDSExZ74EvAOBzgdVyq8/pwmzdYPlPkxS/Ez43UpK7Z6SWlaSuxW
	 cYbBNv8vgNjgVYsh3v1xELYDIIuVokwGy8Uf+zyYGxjgSdOdLvfNPSF2XEgyllaZmD
	 TAhp3bxpgOQLKbBggLllAtU4iRf2rj+3sZzPCLrr6PBsGs0ZdPUsLicMD5n+Iy4XSz
	 4sEnknIyWSr/g==
To: dakr@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org
Cc: aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Kalra <shivamklr@cock.li>
Subject: [PATCH v2 2/3] rust: alloc: add KUnit tests for Vec shrinking
Date: Sat, 31 Jan 2026 21:10:14 +0530
Message-ID: <20260131154016.270385-3-shivamklr@cock.li>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131154016.270385-1-shivamklr@cock.li>
References: <20260131154016.270385-1-shivamklr@cock.li>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comprehensive KUnit tests for Vec::shrink_to() and
Vec::shrink_to_fit() to verify that capacity is reduced correctly.

The tests cover:
- shrinking from excess capacity
- correct handling of empty vectors
- no-op behavior when capacity is already optimal
- respecting the minimum capacity limit for shrink_to()
- no growth when the requested minimum exceeds current capacity

Testing:
- KUnit tests pass locally (command above).
- Built with CONFIG_RUST=y on x86_64 (user-mode testing via --arch um).

Signed-off-by: Shivam Kalra <shivamklr@cock.li>
---
 rust/kernel/alloc/kvec.rs | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 9c02734ced88f..5ab78d6c03e40 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -1509,4 +1509,69 @@ fn add(value: &mut [bool]) {
             func.push_within_capacity(false).unwrap();
         }
     }
+
+    #[test]
+    fn test_shrink_to_fit() {
+        // Create a vector with excess capacity.
+        let mut v: KVec<u32> = KVec::with_capacity(100, GFP_KERNEL).unwrap();
+        v.push(1, GFP_KERNEL).unwrap();
+        v.push(2, GFP_KERNEL).unwrap();
+        v.push(3, GFP_KERNEL).unwrap();
+
+        assert!(v.capacity() >= 100);
+        assert_eq!(v.len(), 3);
+
+        // Shrink with 0 (equivalent to shrink_to_fit).
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+
+        // Capacity should now equal length.
+        assert_eq!(v.capacity(), 3);
+        assert_eq!(v.len(), 3);
+        assert_eq!(&v, &[1, 2, 3]);
+
+        // Shrink empty vector.
+        let mut v: KVec<u32> = KVec::with_capacity(50, GFP_KERNEL).unwrap();
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+        assert_eq!(v.capacity(), 0);
+
+        // Shrink already optimal (no-op).
+        let mut v: KVec<u32> = KVec::new();
+        v.push(1, GFP_KERNEL).unwrap();
+        v.shrink_to(0, GFP_KERNEL).unwrap();
+        assert!(v.capacity() >= 1);
+    }
+
+    #[test]
+    fn test_shrink_to_min() {
+        let mut v: KVec<u32> = KVec::with_capacity(100, GFP_KERNEL).unwrap();
+        for i in 0..10 {
+            v.push(i, GFP_KERNEL).unwrap();
+        }
+        assert_eq!(v.len(), 10);
+        assert!(v.capacity() >= 100);
+
+        // Shrink to a specific minimum higher than len.
+        v.shrink_to(50, GFP_KERNEL).unwrap();
+        assert!(v.capacity() >= 50);
+        assert!(v.capacity() < 100); // Should have shrunk
+        assert_eq!(v.len(), 10);
+        assert_eq!(v[0], 0);
+        assert_eq!(v[9], 9);
+
+        // Shrink to a minimum lower than len (should stop at len).
+        v.shrink_to(5, GFP_KERNEL).unwrap();
+        assert_eq!(v.capacity(), 10);
+        assert_eq!(v.len(), 10);
+    }
+
+    #[test]
+    fn test_shrink_to_no_growth() {
+        let mut v: KVec<u32> = KVec::with_capacity(10, GFP_KERNEL).unwrap();
+        v.push(1, GFP_KERNEL).unwrap();
+        let cap = v.capacity();
+
+        // Requesting larger capacity should NOT grow the vector.
+        v.shrink_to(100, GFP_KERNEL).unwrap();
+        assert_eq!(v.capacity(), cap);
+    }
 }
-- 
2.43.0

