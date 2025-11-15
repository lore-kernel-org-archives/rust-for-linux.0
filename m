Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8279DDDA9
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763183018; cv=none; b=oyY/p5Jua1Q7oPsFnUBkLCL+RagpQEqT60RSMhG+NdEKvy3EXwq5zRWt99EYaRjLOh5Q5MHVYXGH5UI1hiRMWSykgdkDa0Nl5XicuQptrog9H5HVux+3ge3KqAVq3hIHCfwlpjDtVsy3811xpI8jS421IsIO4AjoLxUU2FXuDTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763183018; c=relaxed/simple;
	bh=elWuHl1WJhA3q+X45uTVoaGgih8FU+HaVATh5WEeOBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PuH7b+A5g34ZTDZG6E3v2Jl167ht4sNOyjhTw7Qv0DC2fJ447l3PVRP/EE1QpZXJptVMznoln41hG8zTR1bbdz7BZ/TlJJBNX20m9Vj8cAXGz9HgSFWMSLZE7gTCUZHoM2RbnG3YhGT++bQ+TA6FcezCLgRD6FejqtPzRthw9hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0/oHAmj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0/oHAmj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297e264528aso27091355ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 21:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763183017; x=1763787817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAODmJxOiVZT8ni3izxRjYgzhxVLmJbCxcdrm5qXouQ=;
        b=G0/oHAmjsS7CODZcQWxsqTbG6a1ElWLeVZkaAWVRsPXsSABe/bR9f5ooKEUy6hLhYH
         yc3Wk7vcV1iSJz9k3Ttxp/1jacJYEciwtc5wj3JsVj68iRcYDKjZRl+/FQS5UGW0gJMU
         ydG3o/kjzeXHc/XGpVIhrCx5zyn88R32StHG/vlqx5y/yVT8dTcuHwLWM5vA9yNj6xS+
         8FvJnZNaUPVgAhdnQ83Tkz1ZJtcNm87Sxrj07S/gGyiq7oLQOhFMjZOvWJ7iuy1puWM6
         qYuGjPSeKtDzaUBrN8guZsO6QMevnuaAIYw1QatZqHOoF3y9Bco6M4H2WBmU7Gh5uIul
         O+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763183017; x=1763787817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eAODmJxOiVZT8ni3izxRjYgzhxVLmJbCxcdrm5qXouQ=;
        b=T0j7MYu/moon590V/PqdG0W+udnNoyMwL9Fis+TMR8YBBUjpNwORqGW06ZdChpmS+z
         uA27MB8scMqM4WDq94Bgz2GLk4NVxsKncdESehrooW3lXWVXFVLk8wbUpvDLIvrYDxGT
         mIrQN7HMO/sdDZgz3L8V+BKfqhZbwu3aJ5HyJiBE1jbgZub9zcGxhijdOu8pXm1F25jD
         6goWkLLtVvlSemYcxq32llmbKPotSVPCBJ/7SLKFGPNjbxuRy6C6wDkBA2N97JIqru/+
         QtSeCeDM84125N1dMwqrfnCoOmGxdFont40B/HydoT4PdGb2i73j91X0mlHiSVmpu+AQ
         Ci4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVExaCyM+Cx2lJfDa7771IntgsUhO/ytvO/sE5VCPw+DBn0sxNvMlDfgesAnADKRDnOCOpM8X6ZU0+pjQmw3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx5Z6Vj6XdBm3IsERvQxQf0kd4LuM5UWemPIlZhJUFx7KtvPiT
	7lLnhsUGzphnm/yaeQV8dipyZQU4fnkOP60zWm1+mT0Oar1pXTEmBl01
X-Gm-Gg: ASbGncvPHiTN2nYFmLVQQUbfjrt22Lfp+lnKXYSrwyIQRjg6o3M9wOvdORJLKg+jInP
	KV6JRa9PqNfuDPNVNGj41u3G5JBtZkxsYCPKrG2w7X+9fHYp/RhVli/KxoJ0ABka3lSghiJKgDo
	mD4Wn2yTDIeHqiwAdxRtFX1+PuhKajTifzgll3gFk57AL1QrW33D8tsXZY/s+aaD8lLvgSVppvx
	/4IFuvAOdtMZXQJufOshvTvR+eYP1kjsM420e5si7aSU2be7eElVvX7+LOkY1eerWXqJwQ1z5wq
	ORvy8k6DcrnDv8zfVSTk3kyidB3BE/whfP1qhZlAlwHpZsBRAIKHL803qqFPx098oymL24Zmsau
	PEm2oKouGhksGcTDIHsRijX9LGK9flFvBLmgYgzIBaW/GuhPQ4WljsaQKvbtWsg/xNXwTRcLcQR
	wQDN3hO6mMJmt8xCS7EtM4X0c/m+OvrNZPAyx+8Bisktq8Kpg4
X-Google-Smtp-Source: AGHT+IFBgdY5q/CrZKHlwk9sZgomEd+5bWCl6SkyzdHPrpOxXMCx/xEJyGuVcDafk0LW60LlJSXLvA==
X-Received: by 2002:a17:903:17c6:b0:246:7a43:3f66 with SMTP id d9443c01a7336-2986a6b568dmr59710095ad.7.1763183016780;
        Fri, 14 Nov 2025 21:03:36 -0800 (PST)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245c4asm72261935ad.33.2025.11.14.21.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 21:03:36 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	peterz@infradead.org,
	will@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	gary@garyguo.net,
	lossin@kernel.org,
	mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v1 3/3] rust: sync: atomic: Add store_release/load_acquire tests
Date: Sat, 15 Nov 2025 14:03:05 +0900
Message-ID: <20251115050305.3872412-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
References: <20251115050305.3872412-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add minimum store_release/load_acquire tests.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/sync/atomic/predefine.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/sync/atomic/predefine.rs b/rust/kernel/sync/atomic/predefine.rs
index 09b357be59b8..51e9df0cf56e 100644
--- a/rust/kernel/sync/atomic/predefine.rs
+++ b/rust/kernel/sync/atomic/predefine.rs
@@ -137,6 +137,16 @@ fn atomic_basic_tests() {
         });
     }
 
+    #[test]
+    fn atomic_acquire_release_tests() {
+        for_each_type!(42 in [i8, i16, i32, i64, u32, u64, isize, usize] |v| {
+            let x = Atomic::new(0);
+
+            x.store(v, Release);
+            assert_eq!(v, x.load(Acquire));
+        });
+    }
+
     #[test]
     fn atomic_xchg_tests() {
         for_each_type!(42 in [i32, i64, u32, u64, isize, usize] |v| {
-- 
2.43.0

