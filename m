Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC76332EC1
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 20:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420770; cv=none; b=g0VJiOhkdvH7CG68wZ/+xLmbNQYlyfGWgSPnsP4LBKZQo7lXpMoXtzWeYDyEpPjiuSFtANbWv8EpSM6kCOVSxixIX8W84ekjEZE4z9xNwkLWwcPNlaL/C7/Zy0SRvpFq8bkXIno3DasEcOaa82So7mYfMWI8oy4chNuhvQrJwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420770; c=relaxed/simple;
	bh=t2q8xrLgb+cVvPOt0w87a6e9ZSmUQFB6Nqn9L1La7ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4ZaezMyoLMGfobyTuUMiLsO5+DkSEaC/PxYwEL5VHhS0XoExuVBjC35Xda1h2PtSxnwrUTZXN/uEuLTwCllhuxHNFVhz9flPZIf8Hf2LsEFC/JpslzXjWeudZZURvnT2pzXJ9OpZHHFyLGgOdoyj5j4XvhJ8DeWdnexOWZvypw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=jGpgMplU; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="jGpgMplU"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30c965eab27so864086eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 13:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420768; x=1783025568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=jGpgMplUv4xa1SMzzkc7iMRG8jbTbuI3Or/A0+lrOIlwgH7nSVz7MVZnYb57/qJabF
         s+pW2vxTk0cVuXZepRJA87UBGbhLq4p/QWGb9Wl+BLrszMDScbfiQtS3mHc9QFxYAnYv
         EesW6dWF0tAcDW1d+ymYgS4mtTHlEbiBLOWyoyoxHdxViMZgto9YaJhx0Wohl+RSs09v
         L/ZW4mPba/wFpcvsveEcsRcRemOSeDR7qRAbH0bPXgntOxr4ZXH1n6CJ+mTBcWiRnpV/
         eCLX+6kCvqk795weWzgrQ1dBscW7drapRPGEJUl/A2FkNA+vEG8plx6aeo1YcDdiNxjV
         nGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420768; x=1783025568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=gWNNTBpJlQYjZuWKmc9iZqyPMbs8ifPVN8OUkCwxnremTJG7Hq7CO0+Gg+UE8p6QH8
         tP239nOrn5p5qi3fGfW4927fM3IwOtyA4LXxB1/nF7X+heGsXZPjV9r97/r0LnPy+TKG
         bO2gd7kptNqOaqxbQYz8Pz2s6/Jv3TYZ7CKMUp4HgLGKx0faOTlHJdfaLj0YXY8Z4Cc9
         1VrWSgcJxQZtOGALNzo0JtPTyNjJjRTCP0SV66Cj823Jev1BfaOiZ+eZvu005rTsQRlx
         oqQ/k6ctp9a1iVIWidCiMVxWeHfXCgowYZmn2IoRJQKPlMPxEzwzQbawXlRSLhFoWoTh
         SfAA==
X-Forwarded-Encrypted: i=1; AHgh+RqujkHNrrvnmlQvI5nEDyf0rkQGdppc6bBzbgNI+099yeSikNZ16MtV1QzvvEwrMcwMwHt37iFpGphNE03Ehg==@vger.kernel.org
X-Gm-Message-State: AOJu0YydMuGzs/YChi4RESJh8Msrlzpl6mHBfCyVGa3RAOz/7a4S4Lk7
	Hl9zZsIekhSvh9RkxdUDC8BovuSgQq/wDfFmlibKAT9zfMWz/BQxf2FObA7hT5KGXlk=
X-Gm-Gg: AfdE7ckkXFrakfhk3Wb+XEW3dYqHqE8H7yUVWbWwbfSh9vou9ZPxpYQERRXXqSvT225
	iUgiQLfnk1z6zZTOchO6Pkfw+BNe5/SUbES8PnkuA0Bn/gupnoR3zo5u62Ry9sxmBknX/BnI2QA
	kbbKxNS8Lm4rpskxryC5ybw7e30bZZYgG6MXmddGXAQyG+HV7mluBqmrwWZsQ/9Rt7olMO+uy0m
	sVF+Wk1IfA8c33j1vPbt2ncbX24rpe0e+xNewUgG3s+I6itUZx3vU6+Smwa8HPCWvsx6tRnAWLb
	jL+dfAqJyUzAbw8HFaZN67bjtSByi/wlF5bWnkvmaIQ/Q7LAVffCoD9qxOKOkpmWlnvyh+0JCUB
	dG0vJ7A8dK804rT2CiwP3+pevrIkl7V0e5ERe4HoTofalasMNZ2yHIjLjcDDbBCzMS7xbZOO/h5
	scCZ/YmLQea77ntS1BcpQ1jl2QEoPs/9MYaF3X
X-Received: by 2002:a05:7300:a497:b0:307:3a6c:ecea with SMTP id 5a478bee46e88-30c84b95570mr4109057eec.1.1782420767666;
        Thu, 25 Jun 2026 13:52:47 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:47 -0700 (PDT)
From: Pedro Yudi Honda <niyudi.honda@usp.br>
X-Google-Original-From: Pedro Yudi Honda
To: dakr@kernel.org,
	acourbot@nvidia.com,
	nova-gpu@lists.linux.dev
Cc: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH 6/7] drm/nova: use `zerocopy` in riscv.rs
Date: Thu, 25 Jun 2026 17:51:45 -0300
Message-Id: <20260625205146.5047-7-niyudi.honda@usp.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625205146.5047-1-niyudi.honda@usp.br>
References: <20260625205146.5047-1-niyudi.honda@usp.br>
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

