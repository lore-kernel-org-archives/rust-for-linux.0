Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74052335BA
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 06:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777013118; cv=none; b=imoqtFGg2W2C30GThxWhW6WjdlzFQz7in1MrwwZoJfLQPdL7vBV6eXX0dSGUAe85MeDeJa8OoY5Y+aZ3KNc5MvDjk/Fp7TEFXr5J7n8NKPD8ykAL3RhyLw2U8TgbOCSQAxP0af2nrctjh05NtXBD8lOg6rIklTCCGIfTXub7xPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777013118; c=relaxed/simple;
	bh=Prc4SN6K9n9uEQ2sXWlX9fAmLEOWBxJIHJ9Lk+N4WcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R8qBrSI6Fzn7TFc2rFvjM82w4jFiiYRv/VySVGwSSWU3lhTmBvEgGdGSTz8TCAFfdEZyh+Fi41uWLb4qN4+BqcFmbPYUNglLsLGwMX6NzTpb90PBKA6k3iUb7HAmZT+d1TF8LJ5XGP2UwlOEkz5kGCdl5Q54z1MzetV+1Iw196c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2iRD/j7; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2iRD/j7"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2adff872068so37558925ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 23:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777013117; x=1777617917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeitggvRJhqpoo6Zt75xFK9Pxxp4BKwQty2a6KWXTS8=;
        b=T2iRD/j7XGkHmvrtR9F4nHMf5nKTFCiSISMTcHXzTctXWPePZNSADccRJZFXhbydQK
         LYo9T1A6Sb9j7U5uNW49hQweRN374Fe4o3saMIFU/BOx6bjbDgnSODDE2NYGoiE6ftJ6
         QTxSXF4DgSsQ61OsfrQ/bq23qm30C2hW9gkQE6F9sr1UHgg6rtiira7rBhmX3jN9VIrq
         VTmZbdjGqOQQDYvLXiP2TklqesBKGSfHgvUIhAIICHWwYHaqer0Q7gkby06C123ybasZ
         PxciW1pwsONmSICW3U8ceZMt4V+rJENkMtSQSGSpD1gRFY/5jca0henBYQOb2toFJiqa
         5WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777013117; x=1777617917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeitggvRJhqpoo6Zt75xFK9Pxxp4BKwQty2a6KWXTS8=;
        b=ohMiwvkRty+G1rI6o+k3SG+Y7oeKSsza4DRubesGM6rDLnl1MsxloBHoJewAVOypj4
         x1Amg3HZQPNay4HJx8lVWAl6yUy1ZNkBisMJD9ksrKB++TJphca1kFcz3TK37i1tUuE/
         vnJT9PxqoX4A0lJGNfqPqwoSKfWu9UUXjNXap2JcBMkn03pILnjkq1Rt9iodjEAlenRj
         IAoGzBpjbpOnVquvC0TbpUgcP0VcRdi9DrwtcIw6FJvgo6aRMXB2Zts1xXfSOJY7Xfwi
         GE2nDX4WuCx21Lshc2iIJY+p6grr2/3MQ2jxKBRKjwpW+Mr/7pwyG4uPgv1SFhNCz3n8
         sU1Q==
X-Forwarded-Encrypted: i=1; AFNElJ+zDLEPDm+9woud/9TYnob2wV8f9eyv/ciEg+y7r8Ge1PY2hVEA463KSqCdVDItMxLWkvhxQE9jn4wIyOCKQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHocOf++4lWL5lAgrAJC4bqf75dX5CGWIRJWFQPHuo5U38jEcy
	9MwerUBXqTVpx62dH2X5R89sctMXNkgOnqpqMZdYmHBkUauikvPemxP0
X-Gm-Gg: AeBDietv+vejBOozY/ibfm7MHdcOrgrEYBHviZ1kcVJwZhrliyn0a8fB8djeiLTUzJ4
	CwtxbFGFFqDwnVnHK+yYmL/oko+AgG3fNxO8qvZSJxHymXdyEzzCshopm62pCh2VVql/NvZKEDr
	WWx1cVu3gwIvD3FNp2l3z+OENWpSokAHr5UmXnwbGMisWsawuO9MUlXZcZ24gpCw3QVC0iV5k3w
	hWvrCyoyeK0H0MwaljLjKTLIqw2bktMT4xVJUuXEgB2W7gSqKNkq9MLf6zhVHAVAXV8+4o4xYEx
	I21DF5lGVWhaTq2sQ8i8xtt+kT610W+PY6eZimaOsCMEcAAEb7R8CGPX5wL7xandcQiYIaCg8MM
	EtR7OeVOQuEUVs4egX24QaMbM6coE79/0ntNqKLplwkOdRJxdLamOunei0WQ+tDcJs7lMOBgOoE
	zwdJgPlgU0AW2y6kI8Sb5Go1niVbgzfvekoywZSt9ljR1mxozc0k2/5DSuJg==
X-Received: by 2002:a17:903:2ec5:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2b5f9eebb7amr331003595ad.11.1777013114540;
        Thu, 23 Apr 2026 23:45:14 -0700 (PDT)
Received: from localhost.localdomain ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20695sm212320285ad.56.2026.04.23.23.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 23:45:13 -0700 (PDT)
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust: alloc: add smoke test for zero-size realloc code path
Date: Fri, 24 Apr 2026 14:44:43 +0800
Message-ID: <20260424064443.264504-1-yu.whisper.personal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Allocator` trait documents that reallocating with a target size of
zero must be equivalent to freeing the memory:
    "If the requested size is zero, `realloc` behaves equivalent
    to `free`."
Add a smoke test to verify that `Kmalloc`, `Vmalloc`, and `KVmalloc`
do not error or panic when reallocating with a zero target size.
Note that the actual deallocation performed by the underlying C
functions is not verified here.

Link: https://lore.kernel.org/all/20260424052936.250238-1-yu.whisper.personal@gmail.com
Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
v2: clarify that this is a smoke test and does not verify actual
        deallocation

 rust/kernel/alloc/allocator.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 63bfb91b3671..85606c30dab6 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -305,4 +305,29 @@ fn is_aligned_to(&self, align: usize) -> bool {
 
         Ok(())
     }
+
+    #[test]
+    fn test_realloc_zero_size_does_not_error() -> Result {
+        // Note: this test only verifies that zero-size realloc completes without
+        // error. The actual deallocation is performed by the underlying C functions
+        // and is not verified here.
+        const INIT_SIZE: usize = 64;
+
+        let old = Layout::from_size_align(INIT_SIZE, 1).unwrap();
+        let new = Layout::from_size_align(0, 1).unwrap();
+
+        let existing = unsafe { Kmalloc::realloc(None, old, old, GFP_KERNEL, NumaNode::NO_NODE)? };
+        let existing_ptr = existing.cast::<u8>();
+        unsafe { Kmalloc::realloc(Some(existing_ptr), new, old, GFP_KERNEL, NumaNode::NO_NODE)? };
+
+        let existing = unsafe { Vmalloc::realloc(None, old, old, GFP_KERNEL, NumaNode::NO_NODE)? };
+        let existing_ptr = existing.cast::<u8>();
+        unsafe { Vmalloc::realloc(Some(existing_ptr), new, old, GFP_KERNEL, NumaNode::NO_NODE)? };
+
+        let existing = unsafe { KVmalloc::realloc(None, old, old, GFP_KERNEL, NumaNode::NO_NODE)? };
+        let existing_ptr = existing.cast::<u8>();
+        unsafe { KVmalloc::realloc(Some(existing_ptr), new, old, GFP_KERNEL, NumaNode::NO_NODE)? };
+
+        Ok(())
+    }
 }
-- 
2.43.0

