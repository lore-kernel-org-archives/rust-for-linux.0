Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675334BC012
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Jul 2026 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927691; cv=none; b=Oaqod7AMZGYQpvn7hKn/n7WMoGd+NMHXuMwtVuBIlo5BaaztmGzP87hEXsdbwK+WK8c/DXj+1JBcI9mjp1cEGveN4F0oiRsFx20Z6YbE9cncrwAZw/QpF75anIUbpY0ezhJZpGiA05wZmO1X91DT93jKebd1/+ItFv1YbH0gIgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927691; c=relaxed/simple;
	bh=t2q8xrLgb+cVvPOt0w87a6e9ZSmUQFB6Nqn9L1La7ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EzXTissY7ZjxwL79T2XP5ozvKxieC5zbSMSC6GAh70fPTEpiNWSa+UYCIj6s7fLy0Sr+fwE+me0EF2j5lusEpwBpe245l3Ae4WDl2KwbGWPi/4ICecHF2tVD0Puh/uDvSNcNcnSoDp8NIzCmZpuciiQi3qJDlLKYX3qGOzwlTp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=RQbeghHa; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="RQbeghHa"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-847968ca62fso778753b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Jul 2026 10:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782927690; x=1783532490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=RQbeghHaMcQ6y2IOHz3H1rkx8MZu9KpT5dYCqdbZfy3f+WdRCQLBUZOMgwVsStxu7m
         ZGcr7f50SkPh8ohYj+J7ZLqk6j47R/KW17jtiUMI4BVeugniOgrF9ghCGBZ4NMux8YiD
         06NBfXlI8+a3eCyQL997XmYYZtiS//jUjB0E7k3psSv0Brpx1ntM9P/kxFmoc6FMRcrj
         cRw3ZktJ9kC7wzJwFi8/mTtmsADWddiMau+n2aOeEuV/QnNEcrGda0AHsG3Nj5SOuMtm
         DIxiq+LV3wfObx+Bv0epXwdyDgHUS+KGW4q4jCdCyysnlHEaJNyQaaHzkwZW6WXMrHdd
         fd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927690; x=1783532490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=iqNPYOjq+2ahbL9mc1oWyN7YvsCkWKSRSf3wm0bHo92XaaX13VelgCODeGN93PcoFQ
         3dYTnnU9mFppGMEVR/aDunEqbeRNjKtJmqNP1Z+4172NbY/EPUdDIKpGwCOxNSvLL2K3
         3qZxwQAk5wcPPGmKbEaQPhygrCiyXuWuXrNun5/CbojruFB75gYodydgijJTTM8FY412
         W8kXpBmZ0dc3HTTpvHOQI8UcPU7P/eCZqstlDymm337qrRhm3Xei89fYTT+QbOvPxYkd
         /U7UkPoEqvuEy+7ZL5B/6y7Y5f7oVB/cK3vbv5xOSqp1rqjh02oVbpnmKPcZ1b5kwulr
         lMPg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9J3GnfWZQgHFGRJyXXNDRX8bSqnX8Tben8+KtMCauXIvyqh2YCVlU9R+mWGG/FqQk2lFa5TpL21Y5YCrfSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMfIP8Wg0KzGAvPy6aAPGNRjSS80kILjkCvuNO0JwpeE1MmlWD
	rj2or2CWKkK5yXjMxj+m4Z9J0jdpR+SJDEG3klYeyMR+zjsdxgEGBRPswOzyS7hC8Qg=
X-Gm-Gg: AfdE7cni1+5jM/jWtlMJKAcoWnOve7Y5lUDgIudBqEKsxCDmzKG368t5wXzhPRREb0R
	uRNDnhjxdF/jeUWBcIKkbkWOk2P10h854qzhgBHIumJgZhBNUjKCwDONATKTylez15VmTak2dUx
	KsQ8lnUjQyDt2TW9d8tD82Ygfvrl7bWWqBDGXHxb3M0Rm7BPCGIifLU0whhJyrZ+Lt0YFBfVJ3g
	ppwW+OtoY/SjHnn1XKBSVkbACrwOq2UFkeejsNuoMS6bMs2TyvDSe/HBgu2nAY1BsImsYmm/dK5
	7L2kt9W/vAGQoRTyPUMJ5VJ6P9t+aenkKilxVrbrXp23wyMITSqTZ4SlNgTFONyMDlrjwzwR8p8
	RiyD8TTwPDfBp//dWK4gRvxEiFMxpXQ1EPPgQtbstcGC3KqaJyJ+GQ0esijggt1l3K+qf6V5SwP
	13Ys6GtexnhZam85Q=
X-Received: by 2002:a05:6a00:1bc4:b0:845:e4c1:22ca with SMTP id d2e1a72fcca58-847c088a919mr2322057b3a.48.1782927689594;
        Wed, 01 Jul 2026 10:41:29 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc4d0sm150943b3a.3.2026.07.01.10.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:41:29 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	apopple@nvidia.com
Cc: nico.antinori.7@gmail.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH v2 5/5] drm/nova: use `zerocopy` in riscv.rs
Date: Wed,  1 Jul 2026 14:40:56 -0300
Message-Id: <20260701174056.12604-6-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701174056.12604-1-niyudi.honda@gmail.com>
References: <20260701174056.12604-1-niyudi.honda@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

In riscv.rs, replave the following `transmute` traits with their
`zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware/riscv.rs | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 2afa7f36404e..ba56bc7d4188 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -7,8 +7,7 @@
     device,
     dma::Coherent,
     firmware::Firmware,
-    prelude::*,
-    transmute::FromBytes, //
+    prelude::*, //
 };
 
 use crate::{
@@ -18,7 +17,7 @@
 
 /// Descriptor for microcode running on a RISC-V core.
 #[repr(C)]
-#[derive(Debug)]
+#[derive(Debug, FromBytes)]
 struct RmRiscvUCodeDesc {
     version: u32,
     bootloader_offset: u32,
@@ -36,9 +35,6 @@ struct RmRiscvUCodeDesc {
     monitor_code_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for RmRiscvUCodeDesc {}
-
 impl RmRiscvUCodeDesc {
     /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
     ///
@@ -50,7 +46,7 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
         bin_fw
             .fw
             .get(offset..end)
-            .and_then(Self::from_bytes_copy)
+            .and_then(|b| Self::read_from_bytes(b).ok())
             .ok_or(EINVAL)
     }
 }
-- 
2.34.1

