Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0093672A9
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 20:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420747; cv=none; b=O+uOuNVkIQYa4rvLja6IhLevT2PThTQiIXZZ8GYK4JiLtDMwuSSAWHFXDWAbKr87LhEghXnSLXdvhKRRe0rs6X30gO5BKZQt6Xs5vRZdjqGq8jcNOXuzDiaLfhNh+FgpCe5E+1Kv5B8MZ+OhY2Cz5YwboIYEtDyaCAR0+Un2NiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420747; c=relaxed/simple;
	bh=JezChDeKmz4e6ACoehqELifx3PLlNWERcu3SGBqd3G8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vm7TP+NZDtemfbXHvnGCfgz6dkCY3TbgAMDsgh3QBy8Piho37dpiuHDV6BsDVoClOSugeCvxThfcuV3/bJUAYuqSa9POSSwQ1kqXp4G99PA9uJMiQh1ofVD9gQstDipeBRTBWPBHo73WdECUryzR6P2xMLHg/v8EMFY2JEKjBvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=wmRVesjX; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="wmRVesjX"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bc871ecdfso431550eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 13:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420745; x=1783025545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AKNe+HW/iOAU2SHoyF/WHAkP5lgz/mE/XVIjRk/zXs=;
        b=wmRVesjXLLWSIE2i4VTRO6lCSO/6P3PI+3lIt7HxW+Z22XC61HLIkEOKlaK5gRPtwg
         3sM2/eA5YmVoUMdTSWu9T73z/FqPKZ4XTmPE/Qfd7b7vJyGWY1zswIOQykBydufe3Job
         4YNJyfUror7LLVnccGCQAuNsQghIy7mGi1njyOUwWaDZXYz50S6c8r4M84/IWZy6Bcix
         0ZN1ehezFSI2HrdgDsIBZqY6kGzRsL1TwchYkAkNhJhE08YU969iFjEMAD4v9IKiG9OB
         iOeYrU59kRvkF5tYmY0YmyEmc2O9cYm7c7deHDkjN/gtqAR4trmf2YHgDqGyLxUWeq6R
         Dyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420745; x=1783025545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AKNe+HW/iOAU2SHoyF/WHAkP5lgz/mE/XVIjRk/zXs=;
        b=B/6BAstM0vuiFHupDDYzH+oqh/f7rALVQQanTj4QJS/tqOAiZqmAkXyuLOICNaRw3a
         aymJmFj0olJp42JD2Gs6RC44BF+Bksh0KEV62xH/rkEdN9vCEH1rhb+x5AOgelUyyeEz
         q3aT+NUJJln6XTmWBdbhPOxjZRieND0PTM/REr1JTIv9Kh/174HhNjuFZYHFjaA0mDdc
         4ylKTxhDZIB1skoQnUk0PsVyRLgFO/gYqu1+3mXJcsubKoinTUhgEwO3vmQE1PbuHHxp
         LDS/VAiDowdnLGge0WYsetmW8ICNAGoFY4ee7i5DP+xsOompWtpUI53iwL9HXzQ1oRi1
         Owwg==
X-Forwarded-Encrypted: i=1; AHgh+RoSKOMYr2260574LX02+4SWZPeURUP3W14qe+4hao06f8Xe0Ik2n8ilYo8Ld96cqAaEzX4PxO8xtoBXNxTXHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy21po6vsF6pmq6DkzBi8oP/2f4EO2ZHy9k3r8iDTXSlH5h3mYt
	P0ZAtTJ+gcF/e7+jIcMa7ZwLD89+YRNfNL0wm5iAdjY+eg1jT3bgGZF8PMauWpzb8HY=
X-Gm-Gg: AfdE7clvPPwiyzqOrmkoVAMLY845ATIp65MHOrCKg4uZByItkejmDvUBy+O9DMHeNwz
	SnmS3Po29vtzJzpDZqducDB1T0Hbbl2Q8JlitTy6mEU4JrcZIG4upnKneR4UIl4EdXRU0gvxKlo
	UZqjzqZx5fHHDm8/r64KntF8wHOCTbRYYqLzU0f5TplIab3DbXu5tAE9fvHdOIiv6If6/1uaTUd
	4s8V4ptxuleyD/ScHBBHd/uyV0p2/oLbdvsAXJrEHoq5h2BiJZUp/6+06E/42LKe+MmthdDP+Vs
	Yy/Sv9kbhn+MAGWHl/+JE+aN0sBbdRmXts4h4Ae/IwSGwE0GGsE78whdLfhWgmz5HJBhwVrWS2j
	wGNiGWdnc7eL7TrCWUyZPgaIxs9gyrNC1KIw84BhLyRCRXaMArGANtaPQkmQKdAZUKokZEbIFSM
	pFjjW+7STumfnWTq+LyTOg8sIy8g==
X-Received: by 2002:a05:7300:190e:b0:30c:4f01:2239 with SMTP id 5a478bee46e88-30c84d572f2mr4100921eec.9.1782420744677;
        Thu, 25 Jun 2026 13:52:24 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:24 -0700 (PDT)
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
Subject: [PATCH 1/7] drm/nova: use `zerocopy` in firmware.rs
Date: Thu, 25 Jun 2026 17:51:40 -0300
Message-Id: <20260625205146.5047-2-niyudi.honda@usp.br>
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

In firmware.rs, replace the following `transmute` traits with their
`zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`

Update call sites accordingly.

Note that the module `elf` is untouched, as the bindings generated by
bindgen do not implement `FromBytes` for the structs.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 drivers/gpu/nova-core/firmware.rs                | 16 ++++------------
 .../gpu/nova-core/firmware/fwsec/bootloader.rs   |  4 +++-
 drivers/gpu/nova-core/vbios.rs                   |  4 ++--
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 1e89390209f5..1eae03344a61 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -11,8 +11,7 @@
     device,
     firmware,
     prelude::*,
-    str::CString,
-    transmute::FromBytes, //
+    str::CString, //
 };
 
 use crate::{
@@ -88,7 +87,7 @@ pub(crate) struct FalconUCodeDescV2 {
 
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 pub(crate) struct FalconUCodeDescV3 {
     /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in OpenRM.
     hdr: u32,
@@ -119,10 +118,6 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use
-// interior mutability.
-unsafe impl FromBytes for FalconUCodeDescV3 {}
-
 /// Enum wrapping the different versions of Falcon microcode descriptors.
 ///
 /// This allows handling both V2 and V3 descriptor formats through a
@@ -351,7 +346,7 @@ fn no_patch_signature(self) -> FirmwareObject<F, Signed> {
 
 /// Header common to most firmware files.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BinHdr {
     /// Magic number, must be `0x10de`.
     bin_magic: u32,
@@ -367,9 +362,6 @@ struct BinHdr {
     data_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for BinHdr {}
-
 // A firmware blob starting with a `BinHdr`.
 struct BinFirmware<'a> {
     hdr: BinHdr,
@@ -385,7 +377,7 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
 
         fw.get(0..size_of::<BinHdr>())
             // Extract header.
-            .and_then(BinHdr::from_bytes_copy)
+            .and_then(|b| BinHdr::read_from_bytes(b).ok())
             // Validate header.
             .filter(|hdr| hdr.bin_magic == BIN_MAGIC)
             .map(|hdr| Self { hdr, fw })
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 039920dc340b..13af1c381df1 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -29,6 +29,8 @@
     },
 };
 
+use zerocopy::FromBytes as _;
+
 use crate::{
     driver::Bar0,
     falcon::{
@@ -154,7 +156,7 @@ pub(crate) fn new(
         let hdr = fw
             .data()
             .get(0..size_of::<BinHdr>())
-            .and_then(BinHdr::from_bytes_copy)
+            .and_then(|b| BinHdr::read_from_bytes(b).ok())
             .ok_or(EINVAL)?;
 
         let desc = {
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index c6e6bfcd6a1f..e6d144587c4e 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -935,8 +935,8 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
                 Ok(FalconUCodeDesc::V2(v2))
             }
             3 => {
-                let v3 = FalconUCodeDescV3::from_bytes_copy_prefix(data)
-                    .ok_or(EINVAL)?
+                let v3 = FalconUCodeDescV3::read_from_prefix(data)
+                    .map_err(|_| EINVAL)?
                     .0;
                 Ok(FalconUCodeDesc::V3(v3))
             }
-- 
2.34.1

