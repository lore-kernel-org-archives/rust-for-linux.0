Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73894371D02
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 20:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420759; cv=none; b=oB0m5K2nae8VxsWJOdmCWJehvSjDgN1J+kUk4Kf8v1ahrd8PiAP0k7vZuH535YgoYjiTSxGqCsp7eCgw2BHfvXi/K8s0YS4HRrUQNz2beAnmc9uER1EDbRzGCEpUkuko+h/7WqelNrnOKr69cxmXY8idE0Fab+g/oR798b2caJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420759; c=relaxed/simple;
	bh=/J3b/L8mneeaNE5Fyq/yYyAveJ7DU+NEYqsX9Rp5P7o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tZhhfJ7aG0i/0wBF9DAdV6prMYVN62eNZOGvoCgwiu4ptZIu/VDF2LH3+hRMKzgh15oUHveElFt+1eon0W2xbAZ5SAN0Td2ZJXwuW4v0ZNdXd1IZwRD1yI5n+jFrgUE8/PfkKcDrFzxDfVUZEqutudUoYe7nSfLXdXW++wn3xUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=TwFoReLR; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="TwFoReLR"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30c6874d295so165643eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 13:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420757; x=1783025557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Whz9p3Ho44DCR9pjX+bz8mpXVMfXqyHIujw7aYpp2e0=;
        b=TwFoReLReXIymj5QyHTU3kVOrZ/4/4ZSSpdEoc/nvifSXDZQl5tGzu1CbakKXk+mtJ
         LogVBZBFbrjeFJZ358xmJ7PzM+xu/YPrM0+gZ8sYXXS3l2eIk8k2Q1CbOcHSxr/M+MIY
         xq5/efqFY2/FV3fDcEiUz+36g0fQM+iY/52tG44gFjW1V4JCayKViWjJY4bdbSNXxQAS
         +yq4k3/4FafQh6lDlp/T5eaz8dljY+gUM3sdqHNQLrRRTP32q+awWCEz/PVFCwZmDroV
         LMh4+refUml27Ut6G5gsbm7TtCO0WtuWCxBZAIEStgKUV2TX5fgoW2qPWnI7FskBWpPX
         UNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420757; x=1783025557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Whz9p3Ho44DCR9pjX+bz8mpXVMfXqyHIujw7aYpp2e0=;
        b=MF5BTOFXbFP63B9mMJYdK05CDqTrgmY/o4j2XVz2/IBPNl1moYJuuaDgZfS6kTkCxS
         a+oxj1cyM/O3u6D0OeGsgMGhFAsS/OxG4xY4Rx4uPJgw4LD9tYnhLuJ9aUuNaMPnpD5Z
         ShtJMuKJWJ3beQuN7tj+6CYpJZoAKW907y3q2M08ODMPKcwkgu6EP1ryspJA4dMJwFLQ
         IuJbazRV7qImgiUKRpQMlLly8QffOzvpnGx81yOOJoVfUgUGE1QtplJSOuxdfr3u8SKo
         PknXfYL9um47CtQUVH8z67/jBCdLVjHaa5/1fb1LKdw9qM/2H3tveS7F4QE/Y7VCB/VZ
         dY9A==
X-Forwarded-Encrypted: i=1; AHgh+Rpt39ARtPsPM+gjFwbfP6uLmXIztuZ3KK5H2Ux7anqYh8Ckwah3k0OJbWhc5ptUSNOI8pmofR4+LgAacNAx6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YysN8k0wsuW8gTVMy3/QMREaCyeSpUVZhK2MIlhTQu3LemOhDpC
	Jk90inuZNSxTi94xWf82ECQuCTqCx976jePEz/iAgvdpjrJPZ7fwyEzvqbCHlw247B8=
X-Gm-Gg: AfdE7cnlgLIRqsSSY7aIz3t06u55LFe/eJNOQBHtOru9k3OmLuTdVT49DIgbdiKRWyJ
	QRCdUttnNgvoAgZOzgUOUcJXS8v5FMED7Qb5UmSW1SxbSGI1iqrtwZGF/zWeL45tLxXn3btBqP/
	+hDy20cRvQBDueUjibarsbZ0wzeSeZj0ftjCTwgwi4DUn5E6VOY0lVV1bnCPwRAs7wziJb8mDyG
	vpjrBIb+xkAK2wU80uGEk4vj3ACxOr4xaiKipIJY+xcEmR8NrEYHMTk2Cs3ZMCKHSrKNp96NXNf
	vBWaGrleSBbgFaduI1yTEZAzZavzhL2rtX6dX+rW3ZaZSiNfH+w9uAZ2YOj/CRVk6Q7B7KKxg1h
	0eGXKHv3he30837pPLfI/24TmLUqYGrxmUf3a/GKOZ87Ev4Ka41Z8YXLNbQPsaqNJJOpo0Dw3oT
	Ma1A0JFGbQ5RDgI665+xitPCAZAg==
X-Received: by 2002:a05:7300:fd08:b0:30b:fb88:f059 with SMTP id 5a478bee46e88-30c5562a8a3mr11239343eec.15.1782420756594;
        Thu, 25 Jun 2026 13:52:36 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:35 -0700 (PDT)
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
Subject: [PATCH 4/7] drm/nova: use `zerocopy` in fwsec.rs
Date: Thu, 25 Jun 2026 17:51:43 -0300
Message-Id: <20260625205146.5047-5-niyudi.honda@usp.br>
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

In firmware/fwsec.rs, replace the following `transmute` traits with
their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`
- `transmute::AsBytes` -> `zerocopy::IntoBytes`
- add `zerocopy::KnownLayout` where necessary

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware/fwsec.rs | 47 ++++++-------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 199ae2adb664..aafa481d805f 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -20,10 +20,6 @@
         Device, //
     },
     prelude::*,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
 };
 
 use crate::{
@@ -50,26 +46,22 @@
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
@@ -90,12 +82,8 @@ struct FalconAppifDmemmapperV3 {
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
@@ -104,12 +92,8 @@ struct ReadVbios {
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
@@ -118,22 +102,15 @@ struct FrtsRegion {
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
@@ -152,11 +129,9 @@ pub(crate) enum FwsecCommand {
 
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
@@ -229,7 +204,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
         let hdr = ucode
             .get(hdr_offset..)
-            .and_then(FalconAppifHdrV1::from_bytes_prefix)
+            .and_then(|b| FalconAppifHdrV1::read_from_prefix(b).ok())
             .ok_or(EINVAL)?
             .0;
 
@@ -247,7 +222,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
             let app = ucode
                 .get(entry_offset..)
-                .and_then(FalconAppifV1::from_bytes_prefix)
+                .and_then(|b| FalconAppifV1::read_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0;
 
@@ -264,7 +239,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
             let dmem_mapper = ucode
                 .get_mut(dmem_mapper_offset..)
-                .and_then(FalconAppifDmemmapperV3::from_bytes_mut_prefix)
+                .and_then(|b| FalconAppifDmemmapperV3::mut_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0;
 
@@ -282,7 +257,7 @@ fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
 
             let frts_cmd = ucode
                 .get_mut(frts_cmd_offset..)
-                .and_then(FrtsCmd::from_bytes_mut_prefix)
+                .and_then(|b| FrtsCmd::mut_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0;
 
-- 
2.34.1

