Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE053161A4
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Jul 2026 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782927684; cv=none; b=ES2QEYLx/lqYgEiON/eWWHy0DbQuz2xiXO4+TYzQhdDJQ39vX9gtVj2EQk+kNqcSAJKKU8sgB2NJYqsiHsZGnam6Qg9eFVvUFkn436bf2+jls2EvT2tR+5in6Om5yWA53NOEQPR8EDrpTmJ8ZikF5hFhZwjUoB7b1K7DBxQ26UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782927684; c=relaxed/simple;
	bh=3p2PCVJY3rtxvx93jEL/7MqbNyX0OX+xPKx+baJG+yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X3JCMhVTqWkezVc4dD9cJ0D2TjP9FTCvn2fLZYXkEfvXrk43MF8U+0vIpgcAr8xCO87xEKyha8qLsL0+EPEPH6cBb2JlW/jCNj3izP98A1Ba5AJHFI2GRNYCnzk9NpRjTpinaozIoL2QtWOvr2e7sztBSw3V9swLKv+mrAuIegE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=BQ0ZQWYT; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="BQ0ZQWYT"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84794e800f4so511767b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Jul 2026 10:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782927681; x=1783532481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFceAFuK036YUVrKWQ2ER28PIOKf2Yja+50h/9H1BAo=;
        b=BQ0ZQWYT+sdux4OlJ80Y8zRqWhdTiiwTBfVYMkU2LrtFMWqsrZr4k5jr/Z4P44lXvm
         XSrtflvTCkMr8Uk2griZ6eI1mCLKDqkoQD8sr3tczjGCUtKUVYkk6vEfLx/XmuOv6PWH
         RbEw+UAqh9f6hwjwxEv6XuZ5Im6qfaQM5lAQYGvKs4A8iFguQM/kzBt8zvvM2FGyFlyC
         8N6Tk2er8g9pCd4hBsvoPFfyyA9WZASib6/CNxrHvXlt8JaXl1I/jc0buNhZTLzwx4HR
         sgHU6sCf082NiVONoKvurXayxR+ilt0dISouA2pX9nTUyg55wQ1F6NFHDaZ+DRk762db
         Vvyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782927681; x=1783532481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFceAFuK036YUVrKWQ2ER28PIOKf2Yja+50h/9H1BAo=;
        b=iST6TzSJfnl06aNNi6T3TaaUJ9/QA3XQhwl1FRksfwnMdgahuB040ENx6zKZcrO84W
         Mnmacn7lNo8MJ53RRxbQ7qu/45fLfHsmSBoOgPLUJI/gAxmEbqt1mXX5tEbEKwUY6M7F
         u7aJnID0seBrfNzpRNUq9oAgfR7ISWKUXeYQDXQ4sCfbeuPKm/0tsqbFRShv6JSFcH7N
         ooQ/Z+72xPNlsNu6cRKXkbx9PGo14JEhQrAYSe6U8Si6Uxfjcwsggw4ILQ2fQb+LMG3+
         yXh21iSsEFqu3pDBegjcuZgS6hw4WDeqRjWAP/xmGNNkxfAr57SjFAl3sr5ktw30MGX0
         2enQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcM0qpmkMsed0ngBQ22pq7JTSCfTnKptIoE5Tc+F8GeeTlVM9NOiKC5FZjx1iY8IaBueL3bs77N8PgLSWMug==@vger.kernel.org
X-Gm-Message-State: AOJu0YzciyFBYZ91ZIcx2pHihXpMisOytHTycFl7E+SShWJtwX182Hyv
	OMj941EGRutnY3gIAQrkOeETSOmc9sw5hkU1G0tdq7gLDBDeule9EJRSD55mCV2XcaY=
X-Gm-Gg: AfdE7clhacZHL6zkdjKSPdmF95bodpWuBPKXbcxG3CXhwjOEs69JuuSYrLNKbm3nAxl
	XeQYxj8pwp1AgbNhEGPfsRP0t/uYWJ14h8lwesKPwSLORPMIy5E3lx/OROlgcVoOP9AQk3AkNgl
	zaLSWREm/O9rM/ETPGxm7Y+o7RSdmAvMSOrb+oFGi7cw8rKASDVdlRXYojfqFdhzkviJy5sf3+F
	zoMBuquW60s2s3proegIPldT6El9BVjsGXWCxwsGk2BGJSkHnuY7ukHhTvm+7hCPvTcIvOccISZ
	9bnmyQeA/+QZIrZ37vg9oKC77Orj8uGhYCdYvEwMaWZXa7W4YwFlvwPVoCj9vSWwgmHg00lWWKh
	chp96LH7I7NsFqIpjszPmVUfrvLvgLJjbfjs8hG1Mkdv/Yr+lYPvXHgk1Gbz3pNuS/GYgTcKdp3
	ECE8FliphxexJ2sxE=
X-Received: by 2002:a05:6a00:194b:b0:847:78ad:e1e3 with SMTP id d2e1a72fcca58-847c5182f69mr1755324b3a.41.1782927680927;
        Wed, 01 Jul 2026 10:41:20 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc4d0sm150943b3a.3.2026.07.01.10.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 10:41:20 -0700 (PDT)
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
Subject: [PATCH v2 3/5] drm/nova: use `zerocopy` in fwsec.rs
Date: Wed,  1 Jul 2026 14:40:54 -0300
Message-Id: <20260701174056.12604-4-niyudi.honda@gmail.com>
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

