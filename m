Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D452C9D
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 05:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767247057; cv=none; b=tB0yAiEed8DPHf4qCkDgJR0IMmIcwOGTKuhzlgabmnqzIN2A6Rk7dfYJUT4zkoxbMdaqeZIVq/oRb7oGr11MOrcYH8cCN9OR7Z/UwdN8c10hqK+ufiDvKCppnsvdLjfv9ShU1eosdHq7EM7lTw74D9Pd+qXA4AEdTAXllyW5YzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767247057; c=relaxed/simple;
	bh=Hp8DN7D/yTHZZuYL6cvL6rGmqaVhTJhqpDL41o8WHio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bKc/Q3D5F/yhQfOo6VmMCzcWjRIbBWC9lhouREVaLQF1lNtXxplJfvoU6q8mbV+FqX+uZhpRFcOjXgtmM2N2gB1kO6+zh6SZLNV5bCk7CrduqFVZbFWDGsad245KdQ5ARm8faksphgbxDp4U3eRISAfjxU19qhm6te0XlCqQi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bveC7DrD; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bveC7DrD"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5597a426807so7938552e0c.2
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 21:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767247054; x=1767851854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTgqKg/NyZLs05GYEiIMrHKONV7wwa4BNTXrO2B8hPs=;
        b=bveC7DrDrNWMjm7EbDyQ1pSAc8aGqjQ2gu0C/KG2YatD1SKmUHetWSEzjdd0oZgzWe
         6pxHp2WYx21w0+x39gDFOUeKEYmGvMTmZzuaKhwKA2w9vUzt+kX2W2ebaxQNK0/BsD1K
         ciObWmXduT8mCIlcWCGMXLFpsa5f7aU00dxC5Ttx8YTuwKxT2gvatBKgeVQ5cLepE90H
         4xXJjcXrkJo345kaCpxKVEvzmxARLHyAVvFuApkca0ec6iAIFnk6mNhUH+bxDXX9V0md
         cpFtEwx69hHfyo6+S2xHIrOZYWsFi34MPkw7LsKGxcNtvtMX57hM3KTgoTCdf8S60e+E
         1LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767247054; x=1767851854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UTgqKg/NyZLs05GYEiIMrHKONV7wwa4BNTXrO2B8hPs=;
        b=K1yVOFIuqioX8zqr7LaatZuowQ1zPgch2cETlOLHjhVNtcFoE6Q+DmMLiE4Cl0w2dU
         WUuL/60cLelso/xaZXtncnea7VEskCqSzfEqqAWW69h7HgB0/EB6hQBaRckC+aMb7pm/
         SJaUHJGHVBwFeHj9xjivNTPvOnxqF1CVK2YCusMuoZ62NQ9mWdJswk9e84eGYdModWCg
         d4m0xcDS/PoDAPbZzQ3DldqiggtDWECKt4rfH3snH+p5s8otC/DGS9BPboCN0xjz18IK
         P8dVP0HY27VytlaOuFsf1m+vNsUe/blLEFLAzJH0Awj8JZpfJc5r/l3s9np8MCfcN2CP
         MLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZPtcx4izRgOgxtjiVCeJt9tJG+v5gO4kFG54Q3cOToxFT3t4n3dB++XjnLnzEr6QrH+VUcF89J37tAyzMJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq5wsnpH4hY5+RFSJ3/0Yv7413WWO17c4DkHrxiWDPPc2pvW3e
	fBgV/H920ILBcjE449YS1FRfHlGSOeVreAEBH+wQqelm1MdQCan8LThdtLJ+Yg==
X-Gm-Gg: AY/fxX7OzWrz3pewNE2boTbrcF9ERG9hU09Z/3u8XItqDZVHp/y2OsLGxQtnV0XCVO+
	ob/+Gec1bipPyQsyVcge0e9MONBpSgAR4Cr1qkOu2j3DQcrsrHik4p+6Sdknqop71toWKPBhhp+
	2WkfACVq8zBFex2ylXYnZlfckuMaJf4mqzxTf+BLeT1gB/z/3OUrHoIpVG8AUsVmOwS9Bs07FIL
	LD79FwNQpRRpfoD+4manYk8DoJktO6w+jaFYs2ob/WSxqtwV+wpvxokCqE/RAhGh4lADGIPsELb
	XUc/N5/R3dttvTwjGLKIxXBfkU0Q/NjONnCNh9Jk/W3sPs0TbAa3/cNTCKcBfFkKGCbCY9CyES/
	Th4bo6X7NeqCwbzVUxMjdIJOzapbVaMz8ktg2fc58HFyKgM+ASftst11OEqgqeONcNulsc174qj
	DR4fmcuHokO0V2DpMIwpNCC6JD6PdfSpQvm7VMtVyDL5XHiMJPEoQRHZ83UhsuTg==
X-Google-Smtp-Source: AGHT+IEZZpaRTAmD7INNOuGELczB4YgTQeCBkJGfEePqpcBDjYe/OyBFzHcCZC3d+qr9KR+GYjqSJg==
X-Received: by 2002:a17:903:2ec4:b0:2a0:8e35:969d with SMTP id d9443c01a7336-2a2f27373bbmr345376845ad.39.1767239435700;
        Wed, 31 Dec 2025 19:50:35 -0800 (PST)
Received: from bee.. (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm341874445ad.34.2025.12.31.19.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:50:35 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	tmgross@umich.edu,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 2/2] rust: sync: atomic: Add atomic bool tests
Date: Thu,  1 Jan 2026 12:49:22 +0900
Message-ID: <20260101034922.2020334-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101034922.2020334-1-fujita.tomonori@gmail.com>
References: <20260101034922.2020334-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add tests for Atomic<bool> operations.

Atomic<bool> does not fit into the existing u8/16/32/64 tests so
introduce a dedicated tests for it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/predefine.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 3fc99174b086..42067c6a266c 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -199,4 +199,20 @@ fn atomic_arithmetic_tests() {
             assert_eq!(v + 25, x.load(Relaxed));
         });
     }
+
+    #[test]
+    fn atomic_bool_tests() {
+        let x = Atomic::new(false);
+
+        assert_eq!(false, x.load(Relaxed));
+        x.store(true, Relaxed);
+        assert_eq!(true, x.load(Relaxed));
+
+        assert_eq!(true, x.xchg(false, Relaxed));
+        assert_eq!(false, x.load(Relaxed));
+
+        assert_eq!(Err(false), x.cmpxchg(true, true, Relaxed));
+        assert_eq!(false, x.load(Relaxed));
+        assert_eq!(Ok(false), x.cmpxchg(false, true, Full));
+    }
 }
-- 
2.43.0

