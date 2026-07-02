Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40F848AE11
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993957; cv=none; b=mBSdNQpt4gFg0KzD+HTlccopttLxixBR7OLjuTg7acuk4btzKBTLmwRgYjYcXQt/CmcyT/PCzYyi81lm38k9ztINiJJCrFSYQVyVEl4ppkjFfJY2TChzq0tMByFOswm82L6Ozu2W+Iv08w+K+kDA1uCWCaMtxJheoK8sH9rMNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993957; c=relaxed/simple;
	bh=3p2PCVJY3rtxvx93jEL/7MqbNyX0OX+xPKx+baJG+yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hbih0/Tg/q2t4AN9li6klGIS5XfXS9EzUPhDMYrJ/ctpvMBDVJkh6/iVZyR0GNo9cS9E0kSfvlCNoOZZvmXF5Nd941rQCGzOwdtqQC9t7uSvM0VrsisqSHbcSlcJVwzqyGFcpyD5NCAIi5t7Hwb511SF8XsG4FHvqifJCGx4d8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=gELbD21b; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="gELbD21b"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bbc6c99b5cso437136e0c.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 05:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993952; x=1783598752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFceAFuK036YUVrKWQ2ER28PIOKf2Yja+50h/9H1BAo=;
        b=gELbD21bdwPgwih7W5HKGpcJYl7MWiFaDRvjPQOTdVfO5hS3XQti3DwFD+xS167yfc
         ozt4Wtx+mXIn5zUMtOBFbzq9qZGs2GAZph3GFe/sx5NnLPvgrhpTAp7jE2cDoWutmFjs
         yXaVBp3+eKr6wT9LOC1bzPZljtnLh4CjAnIU02U5aGPegl7KwYBzytvLnxIFqAP/4uvl
         /oOjkO/GjRejH1/MIQ5NDpVTrCg6dqJR5RxkZEJYjD2t3psYHwQANY/kKNH4G0aVoYGw
         7+Jmt3ng43H2sVHdSTAwqsbfyMDw+WocCq7QkWR3Y6fXRaoiTdcGDijMgMGPlN7HZDaL
         ACVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993952; x=1783598752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFceAFuK036YUVrKWQ2ER28PIOKf2Yja+50h/9H1BAo=;
        b=aktHpVWZIptofgJhkmgKZdj+6uaPTddFlaPM2kkV5TATcqLzGp/3HErw5yaJwL72GV
         ctEyh/oLtNx4VFgCcmgEfwEwUQ/RVIRtoycToQASBDtp3DYNoeb6br1dyAFXXRIhbneA
         aYWqTk8aL1/qYj+B8QjShMQdvbx34gJEoTobn+2lKoaukGKVeodYAkQ9x+xJKFuW7kZ9
         RLbGkFh/RWSHTwzAc0kD1z83vtWNytwgXuPMXqIL3tjkH1tFdhveJM1mQcPz53eE8B2V
         gISDfUhAzh1sY5JZoJGG8BXgEXgyYQ8YEjnQXlnppHe0SrMJo1cEpyZSO6+6LpuDgvHh
         hiog==
X-Forwarded-Encrypted: i=1; AHgh+RpkG8tJx4ldz1lu3gJ+kOMaCzelNmI5OAoJWtkJfZgJKpiBBl0bsUiEkwxUFBDZwTTiFgboVvGNlsnKZadAEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+m4/0d1DB+jnPkgbtfAeGmENmUmuNwYVzDPRXagbatEgLuuZp
	nyPWoTH+O5Qo5QcHjW26+IoZq428CKa7wEod1nIxbTX54+K7P521rI3DvcDSLn1sihI=
X-Gm-Gg: AfdE7clysTujSLcFBodA4II1U4erlJosLPc3K+YWAzQqtdnaNVY5UTWRrUKZhkqbhzn
	3dTUOUknOJqWNsEjVspbQ3TueNjmsbkeO4xmtI//kP2XfKxWyBNZY9QBFfQf3oSSljHI4eivwgE
	twQGRF5/SdY0ezGCR5QntSGwBRmR/UcXgFPeaQDlrLMrly5x0xBCmXuiCzItONU2jmqkvjkK/ut
	FFhnOTN0K/pBfNKJ5+K60twHSaUlIRrf1g7qMOvdTWs1DJIu/nwrAgk+Bb+kUiB0zd7YUDdaRX6
	brKFdy5DRLLUJt//euwD1VsxjXySrrVfRpLlyZY41PawCk113pmQ6dyb9gCFEU3BgZ1SyYSGJaY
	wBHoqrrbfsEuCOm5mJNoRbmQqkVoZpj3OjwL1Ymstib0jJGYTP59NKkyqr7HfgvfGKQi44L6mcQ
	Q48uU7i7Xh5eZO+msZAX0AdxPwbQ==
X-Received: by 2002:a05:6102:689a:b0:73a:2195:4386 with SMTP id ada2fe7eead31-73daacc3e92mr2255449137.24.1782993951555;
        Thu, 02 Jul 2026 05:05:51 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:05:51 -0700 (PDT)
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
	nova-gpu@lists.linux.dev,
	Pedro Yudi Honda <niyudi.honda@usp.br>
Subject: [PATCH v2 3/5] drm/nova: use `zerocopy` in fwsec.rs
Date: Thu,  2 Jul 2026 09:03:22 -0300
Message-Id: <20260702120324.40388-4-niyudi.honda@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702120324.40388-1-niyudi.honda@gmail.com>
References: <20260702120324.40388-1-niyudi.honda@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pedro Yudi Honda <niyudi.honda@usp.br>

In firmware/fwsec.rs, replace the following `transmute` traits with
their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`
- `transmute::AsBytes` -> `zerocopy::IntoBytes`
- add `zerocopy::KnownLayout` where necessary

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 49 ++++++-------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 95e0dd77746b..1b75cdc02256 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -19,11 +19,7 @@
         self,
         Device, //
     },
-    prelude::*,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
+    prelude::*, //
 };
 
 use crate::{
@@ -49,26 +45,22 @@
 const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
 
 #[repr(C)]
-#[derive(Debug)]
+#[derive(Debug, FromBytes)]
 struct FalconAppifHdrV1 {
     version: u8,
     header_size: u8,
     entry_size: u8,
     entry_count: u8,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FalconAppifHdrV1 {}
 
 #[repr(C, packed)]
-#[derive(Debug)]
+#[derive(Debug, FromBytes)]
 struct FalconAppifV1 {
     id: u32,
     dmem_base: u32,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FalconAppifV1 {}
 
-#[derive(Debug)]
+#[derive(Debug, FromBytes, IntoBytes, zerocopy_derive::KnownLayout)]
 #[repr(C, packed)]
 struct FalconAppifDmemmapperV3 {
     signature: u32,
@@ -89,12 +81,8 @@ struct FalconAppifDmemmapperV3 {
     ucode_cmd_mask1: u32,
     multi_tgt_tbl: u32,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
 
-#[derive(Debug)]
+#[derive(Debug, FromBytes, IntoBytes, zerocopy_derive::KnownLayout)]
 #[repr(C, packed)]
 struct ReadVbios {
     ver: u32,
@@ -103,12 +91,8 @@ struct ReadVbios {
     size: u32,
     flags: u32,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for ReadVbios {}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for ReadVbios {}
 
-#[derive(Debug)]
+#[derive(Debug, FromBytes, IntoBytes, zerocopy_derive::KnownLayout)]
 #[repr(C, packed)]
 struct FrtsRegion {
     ver: u32,
@@ -117,22 +101,15 @@ struct FrtsRegion {
     size: u32,
     ftype: u32,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FrtsRegion {}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for FrtsRegion {}
 
 const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
 
 #[repr(C, packed)]
+#[derive(FromBytes, IntoBytes, zerocopy_derive::KnownLayout)]
 struct FrtsCmd {
     read_vbios: ReadVbios,
     frts_region: FrtsRegion,
 }
-// SAFETY: Any byte sequence is valid for this struct.
-unsafe impl FromBytes for FrtsCmd {}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for FrtsCmd {}
 
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
 const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
@@ -151,11 +128,9 @@ pub(crate) enum FwsecCommand {
 
 /// A single signature that can be patched into a FWSEC image.
 #[repr(transparent)]
+#[derive(FromBytes)]
 pub(crate) struct Bcrt30Rsa3kSignature([u8; BCRT30_RSA3K_SIG_SIZE]);
 
-/// SAFETY: A signature is just an array of bytes.
-unsafe impl FromBytes for Bcrt30Rsa3kSignature {}
-
 impl From<[u8; BCRT30_RSA3K_SIG_SIZE]> for Bcrt30Rsa3kSignature {
     fn from(sig: [u8; BCRT30_RSA3K_SIG_SIZE]) -> Self {
         Self(sig)
@@ -228,7 +203,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
         let hdr = ucode
             .get(hdr_offset..)
-            .and_then(FalconAppifHdrV1::from_bytes_prefix)
+            .and_then(|b| FalconAppifHdrV1::read_from_prefix(b).ok())
             .ok_or(EINVAL)?
             .0;
 
@@ -246,7 +221,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
             let app = ucode
                 .get(entry_offset..)
-                .and_then(FalconAppifV1::from_bytes_prefix)
+                .and_then(|b| FalconAppifV1::read_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0;
 
@@ -263,7 +238,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
             let dmem_mapper = ucode
                 .get_mut(dmem_mapper_offset..)
-                .and_then(FalconAppifDmemmapperV3::from_bytes_mut_prefix)
+                .and_then(|b| FalconAppifDmemmapperV3::mut_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0;
 
@@ -281,7 +256,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
             let frts_cmd = ucode
                 .get_mut(frts_cmd_offset..)
-                .and_then(FrtsCmd::from_bytes_mut_prefix)
+                .and_then(|b| FrtsCmd::mut_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0;
 
-- 
2.34.1

