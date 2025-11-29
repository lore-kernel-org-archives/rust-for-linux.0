Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC727280F
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424636; cv=none; b=Z6xk/GV6JLlLbtf8DHcotUxNRo4/jeLZ6WWFBIlWnPVvVLKXOgcPz8uM8x4GtrZHmpNqiLBRDfcLL0sh4s2BQrBv9ZduDGyQ2Z5zJnNy0RFYy+mWkhWUWs8yMqKD0u43l2HhQf1CtrBB4Av6qfbPU1pb727gYjpcNfw3eMqaSVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424636; c=relaxed/simple;
	bh=CM7jNN4TePOQPMBsMAlNFl4ZOltHTX1DPBovd4Yvy+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3Q1E4pyo6+5etp8RS1v+Yk1csvEVELlVY/E6alZkYsw824U8HhNjhhXeeYzsMkooRr5+1HQL43LBOt5BfOzzXhnFbFkovdovOm65rPF/ryQAKtDc8dKcZ9ltu58Olnfd8EUsO5vrVNYLvs00wJXSu2fNhhxwmTMjFwsqq9ypS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMtK4W1A; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMtK4W1A"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-298039e00c2so38901585ad.3
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 05:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764424633; x=1765029433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAqwBtl2E/J/hHI5JWJWSFXxbwpu71L6FPfsnW170Bw=;
        b=VMtK4W1AcwPqtSAqAMfn8RTeLMTNOLb1hTt8Ey15z/2KpFWMvhYe5pLj08XXdl6PDJ
         WsZw0rC70iQoasNIWLCSPxPfBfDkQPHFyMcFJXShdIXW4Ecxfhk9OXphlVDlWU+xmqAP
         nsdjEJNBhwn+vEu33hTzqRP1fuEi7rTByUkabLCSes7Vs6X0VTrjBNVp1r/woviogSvh
         CFLRIhhIhdC9EY7pYBHTkRuavCsVQFQlw6+FYzG+/N6f0vn58qTmynfbE2TYnfZmI/rn
         OM5hWkN5f/MjOfgv7pZhaE2mvAAYhMzSPZsMLf+bTpsz/wmZowWdbPp7tlu3lzo1P29T
         Euyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424633; x=1765029433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAqwBtl2E/J/hHI5JWJWSFXxbwpu71L6FPfsnW170Bw=;
        b=uDj/196Kva3PLFsLVPf9u4rYafOSItCjP4+B+xiirO6kOp3ULJ/u4XZuiZvQQYaCyv
         oSm812QIZ4T23iPyDK9IYw2XcfbN7lXFYVOwmAZzKo6rt7bma0rBkeZU7qDcV4yYbWY0
         01Y43q0JnUEvdQMRdmovDcSraVGjrxav100Z6h3Wsw1HI4r8MKSwnNx3NFFOARxa7HYz
         Ppj8VjFrKiYdOIda0tLT0EpTLt2AxIIfowWSBr78cTX6HHszeuTdPa6bMIvI8PwLjk1i
         CkFU0XT1hRnDzJ9F9ac2/3z+IKL4tD6PASYui8EGp0/i291DNXCfScIWwIT1lVZm5jQi
         7nKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgsXPCgTubgidcLGiABqF8mriXXeDOPzjqvS4Ivv36+DxGYqf7otaWdoxtgiMVYwbuNzs4SESHUcaChQAjmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEpj69EllHnnEc3jiRLKBXXqrd3lyVy9swmOw+rkO9XTNCPDhx
	pOOmqenPtiytYklYBi2pgy/RrpE9TnPS3paagz7/FpNAPYTQVogKiE6I
X-Gm-Gg: ASbGnctqpksXwjXb2qPbFFGDWoyroygFKcZ7YcMn3pFYnp0O0vVpDK6DagtVsbuLPym
	p79U1J4S/mX3xuirKAgD0l9HjkICAlOn2jEEGmyJxoMlZ4vbEUYxcwVgCTyqA37NTCJPW4I7/on
	9MvWkgQcyNCwSXt+85HOv0pbVd868N/qfiOlKsnIsI7qYE0z7WrqUuaBVormuxwV52ysavU4j6C
	MqFpb+UvtP38CeRcf9z6sM69ULiYDNuZZq0zUtCLcjfaCRYJKdov4Z79LHHx2+Sy6e4eJUE2L/C
	O+YYgXLyPQReUDmN78EahqVtC83HLe6wB16DF8MntUTHfoPIl4ASqui0l78yig3XV+tcSYDtKe5
	XfbRXds9RWDtuLDI7qSZFrGQpNq9O9FVG0GgCgrWfonACYYjGrFV2r2tyU5EairAv2hfOLB1c5U
	D47j8Q/QVUIHxw0bKGhfILJl/CEDcpO6mxRTWeqSSmO962cj0GISlBrXh2083FWgBZ
X-Google-Smtp-Source: AGHT+IEXDwvB6Es576qZrqunEvinwqTauJDMMQVrykWfuq2wMdK5X2oejN3gpeUs4GU/2Ild1wmekg==
X-Received: by 2002:a17:903:1b10:b0:298:485d:5576 with SMTP id d9443c01a7336-29b6be91657mr294336935ad.8.1764424633514;
        Sat, 29 Nov 2025 05:57:13 -0800 (PST)
Received: from atharv-HP-Pavilion-x360-2-in-1-Laptop-14-ek1xxx.. ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce46ca9bsm75400025ad.38.2025.11.29.05.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:57:13 -0800 (PST)
From: Atharv Dubey <atharvd440@gmail.com>
To: paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com
Cc: boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	linux-security-module@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Atharv Dubey <atharvd440@gmail.com>
Subject: [PATCH] rust: security: use `pin_init::zeroed()` for LSM context initialization
Date: Sat, 29 Nov 2025 19:26:57 +0530
Message-ID: <20251129135657.36144-1-atharvd440@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the previous `unsafe { core::mem::zeroed() }` initialization of
`bindings::lsm_context` with `pin_init::zeroed()`.

Link: https://github.com/Rust-for-Linux/linux/issues/1189
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 rust/kernel/security.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
index 9d271695265f..4dc3eba6ce84 100644
--- a/rust/kernel/security.rs
+++ b/rust/kernel/security.rs
@@ -62,8 +62,7 @@ impl SecurityCtx {
     /// Get the security context given its id.
     #[inline]
     pub fn from_secid(secid: u32) -> Result<Self> {
-        // SAFETY: `struct lsm_context` can be initialized to all zeros.
-        let mut ctx: bindings::lsm_context = unsafe { core::mem::zeroed() };
+        let mut ctx: bindings::lsm_context = pin_init::zeroed();
 
         // SAFETY: Just a C FFI call. The pointer is valid for writes.
         to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut ctx) })?;
-- 
2.43.0

