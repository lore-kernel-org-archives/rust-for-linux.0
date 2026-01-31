Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170122E5D17;
	Sat, 31 Jan 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769846812; cv=none; b=M5pAtGo7gsdLjTxDQwYmwS5lnMZ7bYXtaLyuCX65HuMisEPQyqd8GpS+YInQkdRc01kANnByni5TbSprJIrRZLIis0GFkxuhQ1FF4Ta8rDg00m8SY8QdYR8IN810/0nUuhgLTIaf4Mz6nHx/C8nvwndDIKEQMALsDfPbEfVK/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769846812; c=relaxed/simple;
	bh=ypJSZsd2gkd3H9jZrx749RhEDkv5ZqvN4gf27waZnjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EnSeAnxNirOYHyivdp87XxWy0/TKVpVIfc9qDNqQdE8Wong+o8J9F7rDKMJWcypDOODjXXBNqJp0quTFUNFDqU268QSqpzZrpQ6pwE+jaHsTcb+RctofaGj/LG3x2bcfQEe+1GHy6Nr43+kA0288H4xpNT1cf3/gzbnVS0gOQk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=qrw2eMaL; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="qrw2eMaL"
From: Shivam Kalra <shivamklr@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1769846805; bh=ypJSZsd2gkd3H9jZrx749RhEDkv5ZqvN4gf27waZnjY=;
	h=From:To:Cc:Subject:Date:From;
	b=qrw2eMaLCoxjTADxmpfx1ggb2v+Dts6du/Nmj6/QUloU7i5/RvBLMj5+wWaD2y6xa
	 PnA4jYGeeA58wkzExpZ2mPrQg4kBqT3pj8oHIBzkRJovwhqk23IyZsgD6k9D1Jyg1M
	 R9rQlNOgmjMvJmdu6nHoaXqppwMr2HgyDq6BRwD91xBtPqVVNNkDXWqEOJxV5kYbhU
	 bxlSxJhE9la2N/Yav6qOhqWut8rgfT14v3Is0XwWTNJULSgI3X9SWjp/IvonXpuKoT
	 vZdcLYZgomWAR38XBV6cPqzCGq2nSYdoMB2OHq1mVzr5bPtg9ZWXoE3bLuiFKkWnjm
	 w4TOEFT3Zz0qQ==
To: dakr@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org
Cc: aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Kalra <shivamklr@cock.li>
Subject: [PATCH v1 2/3] rust: alloc: add KUnit tests for Vec shrinking
Date: Sat, 31 Jan 2026 13:36:13 +0530
Message-ID: <20260131080614.264242-1-shivamklr@cock.li>
X-Mailer: git-send-email 2.43.0
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

