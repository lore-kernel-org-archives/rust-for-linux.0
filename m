Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960C2DB7BA
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 05:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777008612; cv=none; b=kv4Peum2QOf4gVGveyaO8daymBydPqJNqoOUL9xMr9NsVTXy2oYw+7ek/8GshDpc1SkBzuEVoI7i/a9NRxhJ5ng/mGqzDKvH19/yZILuuh6+fa72X4J8/yoJRRHeVMm1oIp0X81lssVRhUpHEOkVrrEsqwY4UHJ+MuveotCEVBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777008612; c=relaxed/simple;
	bh=r/alvrJIilJ8lBwi8xOW/gbxfhO6uFDacXHOGag8+WY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NzBhb+geuKCL6QO18tiLcMJYTXDE/n5jc26324KuhTsI3Oq2sDuVUd/N/czZ3YE0rE3p1nNDQGrPGY85cEaQC9wO5VaTBTTPAWYx4focQftQwILMGU5Sq/lt2Q3f8tqNidxTJoqh0rpCoso4zOmachMghyBXFUiFijn6Ymz5r8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9SoK+CU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X9SoK+CU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso47280955ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 22:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777008610; x=1777613410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kKEdQrvB8ytWMvKSrM0F6/GX8zuGT5l4i061TWozc+c=;
        b=X9SoK+CUOl0sb8fBP1xR7M79oujA3Namy+FJNRjSpgtF2HSOu0uQro3XG9UjsQE1NV
         UDFTKAb6xWvqaUB/+XCkGs2g1blJOo9o/qNThh4Mw5Q+bfp565Q1D2XJ5Ix/JgXRwGRA
         /Br4TpCf+0PcbatheNBUP9VAxLGIF9ly3H4HaMWUUEVkRuNntm07Qz3PdGq9zSsDQEur
         AuyRHRgi2hKKRg/7LX2iS6vOsoCKZwBA3fiNidXt6v1eT2AMkRijHgiEI++a37f9u3vr
         CQ4zSg6u8spAa409vKL6+K/sVCFRBfcVEVssYXsj5YVpesvGE3ej3mHLBMBQ152uMjv8
         TFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777008610; x=1777613410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKEdQrvB8ytWMvKSrM0F6/GX8zuGT5l4i061TWozc+c=;
        b=EKuL3EIYubXM7jDqU+3xK34ekXUzxNohDgOtDLnnC6VjB9D6EslJ3N9FJqo/jjj1pz
         4yjZix30egrVtINSNMAyKoUDAc1tjXirlAF8CbpXgslSTJb1rT3spZRmJnz7XaqUDU/4
         x1TpQTAzf7qqhvARWl4crH2yPOlb0UVJdgX8+aZ6RF/60++itORh8f06nHm8gEKWXLy0
         neDYgE8wFjCguV+/idrk0eXGcqVn81Mv18FNMwgMJbyizkssCFwE6IUMJj+Q4BU3MHSg
         V/ly6tEQDhXTLy71HUuX/BHCKwXefBEtLi559W4m6qNMT+hw7A2T+7ojFdo4McixM4pn
         vdZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tmQFlmwx86XhSIz5jS9W/uPrC8+QsT8Z6QK3AC3y8O+DXjUSCATaP3RGQvjuTz4dcLbIBxVB2+VMkmV/OmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHT24MIfETBtH5zpqpALUXEsV+Hg1b7TgwI8MPp+nxr7geAwxj
	pnPUIITIS3wkoBrTpBuA+RzGR9yg5/LmVjWudkbOhCieTXuM60ABDPPkdBRabdgM
X-Gm-Gg: AeBDies3qzVDtAma9jN3CjgYT9TE78D/XuLORJNgUMIBYm9nKZlNJGR0fzDkh5OyQiD
	zKJArnsKrzZK87Et+UEQc79oCEYYB3k50upUWD3pBZugDyjtvwZd3a2xB9beAHQdnNNNj5aiCu2
	wO8L+lru/yIUtJriCbTmVMoYCh7Pu3wEdBf0Xxj5Jv1t333Gwq5UXCx3IlmjyBG21cnKHpJEbxb
	XWKkcu2+fjL4SLMH60K6DYevGfxDanq1NxPOoyXSyU776T1Uv5LzEOLE04seWKLjRufnfmCwWui
	3BHX2jxcXIqsp69mpB/t+C+aicg/36gXqs4SayUgBv8koYa+B2n8nCUyp89UPRCU4gC1PinP9x1
	Ags3lTFbYEWqSfnQqgJbbL5UTvoP0vhLEP9muUwLZmvaehwJ5uGOQgQMULFoZOT7guu5Kv/HVEV
	Fyi3+mm1E5ERCIGD9+7MddnPWHWsZa4nDUdsnj6hml7glgONQU4Wq32i6Sgg==
X-Received: by 2002:a17:903:3c47:b0:2b0:afb4:7d41 with SMTP id d9443c01a7336-2b5f9ea4989mr306875585ad.10.1777008610413;
        Thu, 23 Apr 2026 22:30:10 -0700 (PDT)
Received: from localhost.localdomain ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm215188165ad.54.2026.04.23.22.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:30:09 -0700 (PDT)
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
Subject: [PATCH] rust: alloc: add test for realloc with zero size acting as free
Date: Fri, 24 Apr 2026 13:29:36 +0800
Message-ID: <20260424052936.250238-1-yu.whisper.personal@gmail.com>
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

Add unit test to verify that `KMalloc`, `Vmalloc`, and `KVmalloc` all
conform to this contract.

Signed-off-by: Hsiu Che Yu <yu.whisper.personal@gmail.com>
---
 rust/kernel/alloc/allocator.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
index 63bfb91b3671..6120587db205 100644
--- a/rust/kernel/alloc/allocator.rs
+++ b/rust/kernel/alloc/allocator.rs
@@ -305,4 +305,23 @@ fn is_aligned_to(&self, align: usize) -> bool {
 
         Ok(())
     }
+
+    #[test]
+    fn test_realloc_zero_size_is_free() -> Result {
+        const INIT_SIZE: usize = 64;
+
+        let old = Layout::from_size_align(INIT_SIZE, 1).unwrap();
+        let new = Layout::from_size_align(0, 1).unwrap();
+
+        let ptr = unsafe { Kmalloc::realloc(None, new, old, GFP_KERNEL, NumaNode::NO_NODE)? };
+        assert_eq!(ptr.len(), 0);
+
+        let ptr = unsafe { Vmalloc::realloc(None, new, old, GFP_KERNEL, NumaNode::NO_NODE)? };
+        assert_eq!(ptr.len(), 0);
+
+        let ptr = unsafe { KVmalloc::realloc(None, new, old, GFP_KERNEL, NumaNode::NO_NODE)? };
+        assert_eq!(ptr.len(), 0);
+
+        Ok(())
+    }
 }
-- 
2.43.0

