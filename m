Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999370;
	b=DQU+wFpNdTGPLehDR4/PxKvEo+USk9DCk7yf6O1qj++ZNah9Bd9UZAc97/hWXcdwBYoT
	 9iusTyM1Mk4hvHSQe+5askkaPXfopWrRBhGKowjT9Bco2hNmIvlNuKPst/sgPluHT9M7i
	 9vFbbPPbOf9kC+90vr4aW9jH8oxr70GtEJJD/a76Zs7OnNpiFxgahb4Ke0zG0twGgmprf
	 HXBzz52d8OsRQHrX4V92fYDUuBrFvGEizufuO0asBMNpr2azIeCSFd4kfcbk+G7PTITqL
	 T3CokygE/3tFTjAg8pYflwLBvUrGkb77O73wzKBCQdKyM81MbBrDjJLHwKiATKx2pDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IN879SLlnbKDx+IQRdl4OB8xJqPQf4M3p3iCVyXzytc=;
	b=AvzUsLjrt9zJfYrARhnQvr1bqB+Qvf+JpFHLrU20yH7gHrNgi7dffAf0dtTLmPcAjZUM
	 64S/PXupPItJjgSYp/2YVR7AV0zABDFnKRr5dnVBcN3qhgdr6s4K9kBBjSC6UeQggc3o9
	 CEzyTD9rpvo/wAeUmGVLPIxw5/UsO6rkj3gO6Xv4kemdowB0fOEe2+/ddHyd/bWuFPwVJ
	 zdDtpSTrLZPy8fB95jPB7BtrXgRYgrAfrLUn/5zaNdzGXb7RAj4PO8FBgSKgBDVy29LRX
	 jsIZINTtXoR6fYqvGyZRjdw2y/bckxeyBgfsx2WlKN9/afEGAfet/wWXtzai0nA+CQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQZgj2H2;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825C3606A33D
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 10:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 825C3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZQZgj2H2
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1249536eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 02:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999369; x=1795604169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IN879SLlnbKDx+IQRdl4OB8xJqPQf4M3p3iCVyXzytc=;
        b=ZQZgj2H2Ug4J/BjoFFQj3oaS4AIXLU2XZrLKYsgRWQqGw59sRtgQQ5sF5cMImoMtTk
         GJ5elSuYUxQMTEeIBBdTA0JB+xEFFoyMMgQOMmmQ0crUkKErIznub3/ZmkRyuC2yK7N1
         oGiycLGfkfSh9XhMVngIaWzZu88hikyrhRUwLXsYRLIc/Cp+JBKQbvldo3OEEhJtuqqL
         AuM+PhT1H4k4e2RGw+7Ze/lYJVtqxM5EMUegPoDynjjgh3Q/3jKVyUZs28VnTC0kdZZi
         fgMDU48M5/HuIPOQbnq1r/D/+mIGJ4svhbQpPyA7VgAbq7XvLjJaDqLpaOo70MtxI97r
         E3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999369; x=1795604169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IN879SLlnbKDx+IQRdl4OB8xJqPQf4M3p3iCVyXzytc=;
        b=Q+GcnQW6xcRZCRy8h58qzJdLyNkKv+U1qEhWZ8eaq5JHcWKWNYkVaKxD2wwl7jATeQ
         jYkqNpBccq6N5WFwCCs+cd3DqiqVXsXmYuLD0U6PhfGmwT+orcR3jtYuC4mjE2rt2us6
         3k45B0DGILuQdA7E2IK1VwRPFUOT4z+Hx+k3ld4YXoRI2b5uTclauSynLcDoEv/5y1Y5
         EBiFzr1TATeDqAmki+rSEfMc1hXnuwDdydIJhaAcWeouyYUBmMwJJW/paGAzRdPJIVU4
         oGkOHpxkvHCj4p7CCqdyqH7+j/xFNoaYVvEYZB0Z0zTB9Xa29apZsUMbLWm+AjPqsTWS
         jJCw==
X-Forwarded-Encrypted: i=1; AL+hErGoqT/GCU52TVDRJYIZgOqA4A4eDxKwaWe9wLTQAZLB5fOSdNI9lohNu0wNR/JSKIYFPXOm3j61XqxTwEH0Eg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/GueuJySTkER6v+l1vKDqJNivEAEvbdXBmyBVv8aRNJ5Nu1pgg
	U7QnQ+PAzvvU4c8EWqm2SQIs8gTJu42MboYaTwkYH4elWANT7Z1nXlF0JTFmqw==
X-Gm-Gg: AZFdTZfDfR7c9udiQzVQhNjnRh8HsrS4gxwwdZXDn4zdbf+rNqgjYk2Xotef4s59S2z
	+DMDNdAiHpqUMURWrXyDXlJMka9e6Otid821akWWuLKD2a5Ke09BBTvHBJcwn0qxp5a6+oVwI6H
	CLN8IvGq6NzMMqjvfqZsIeLUBN3TBq1vXOFj2jvpAam1CkyEU4Up14wD0IQ8VExZaBBEFG/2Aa9
	E4R85YD9nv8f7pfdabxYooVLFWqhPMyujQ4SjQXztmZaFy2bqvUI2UMHavlKNFjZAGlu0Aowerw
	QC7k11b2BL4v1h8yehrtZVu26m5HTYQ87W+sxgUW0HtUKFMWVbeIZ+hFaIDxfvHxrVtyDQ/WMkj
	t8+JJsezGA/zPRaDE3TRH3g9wBIeXwqGUuHQbCNMNuoiJwYA2UJWl4icQTI3f1Egv90ew+kWkHc
	UlXrsmEbLpaW0MKhc43pTHd/LEc0nRf0csiwXD0lff0+1/fYl0Iuv3ClFvvZqBBJ7DBljI/2hbz
	/R90KkiwH2jLpmWoUEBznAJkXvOpvdEjB8EnK8QDzxX7fwtzllKhHDKMn+mxqzWiABe/RPzSDnD
	nWN336TwWNcH+w0b3vMqHuR1s6Zb3gTIe70ETw0+wmqXKTsG/gX3+OTritMmWjE=
X-Received: by 2002:a05:7300:ff43:b0:369:5583:bf4c with SMTP id 5a478bee46e88-382820de610mr1965626eec.28.1794999368563;
        Wed, 18 Nov 2026 02:56:08 -0800 (PST)
Received: from deepak-80tv ([2405:201:a40c:e0d8:ae82:1cfd:7bfd:2676])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6def9e2sm7186657eec.13.2026.11.18.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:56:08 -0800 (PST)
From: Deepak Pandey <deepak.os.system@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: nova-gpu@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	Deepak Pandey <deepak.os.system@gmail.com>
Subject: [PATCH] gpu: nova-core: falcon: make pfalcon field private
Date: Wed, 18 Nov 2026 16:25:57 +0530
Message-ID: <20261118105557.140069-1-deepak.os.system@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, `Falcon::pfalcon` is marked as `pub(crate)` with a `TODO: make
private` comment. The only use of `pfalcon` outside of the `falcon`
module hierarchy is in `fwsec::bootloader`, which updates the FBIF
transaction configuration register (`NV_PFALCON_FBIF_TRANSCFG`) during
firmware DMA setup.

Introduce a dedicated helper method `Falcon::set_fbif_transcfg()` to
encapsulate configuring FBIF transaction parameters for a DMA context,
use it in `Falcon::dma_load()` and `fwsec::bootloader`, and make `pfalcon`
private. In addition, clean up unused register and I/O imports in
`bootloader.rs`.

Signed-off-by: Deepak Pandey <deepak.os.system@gmail.com>
---
 drivers/gpu/nova-core/falcon.rs               | 27 ++++++++++++++-----
 .../nova-core/firmware/fwsec/bootloader.rs    | 18 ++++---------
 2 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 9015de965a53..507f638e8936 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -364,8 +364,7 @@ pub(crate) struct Falcon<'a, E: FalconEngine> {
     hal: KBox<dyn FalconHal<E>>,
     dev: &'a device::Device<device::Bound>,
     bar: Bar0<'a>,
-    // TODO: make private
-    pub(crate) pfalcon: Mmio<'a, PFalconRegisters>,
+    pfalcon: Mmio<'a, PFalconRegisters>,
     pfalcon2: Mmio<'a, PFalcon2Registers>,
 }
 
@@ -395,6 +394,24 @@ pub(crate) fn dma_reset(&self) {
             .write_reg(regs::NV_PFALCON_FALCON_DMACTL::zeroed());
     }
 
+    /// Configures FBIF transaction parameters for a DMA context.
+    pub(crate) fn set_fbif_transcfg(
+        &self,
+        ctx_dma: usize,
+        target: FalconFbifTarget,
+        mem_type: FalconFbifMemType,
+    ) -> Result {
+        self.pfalcon.update(
+            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(ctx_dma).ok_or(EINVAL)?,
+            |v| {
+                v.with_target(target)
+                    .with_mem_type(mem_type)
+            },
+        );
+
+        Ok(())
+    }
+
     /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
     pub(crate) fn reset(&self) -> Result {
         self.hal.reset_eng(self)?;
@@ -614,11 +631,7 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
         };
 
         self.dma_reset();
-        self.pfalcon
-            .update(regs::NV_PFALCON_FBIF_TRANSCFG::at(0), |v| {
-                v.with_target(FalconFbifTarget::CoherentSysmem)
-                    .with_mem_type(FalconFbifMemType::Physical)
-            });
+        self.set_fbif_transcfg(0, FalconFbifTarget::CoherentSysmem, FalconFbifMemType::Physical)?;
 
         self.dma_wr(&dma_obj, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
         self.dma_wr(&dma_obj, FalconMem::Dmem, fw.dmem_load_params())?;
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index a87878fe2aec..db1cb4498acd 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -12,10 +12,6 @@
         Device, //
     },
     dma::Coherent,
-    io::{
-        register::Array,
-        Io, //
-    },
     prelude::*,
     ptr::{
         Alignable,
@@ -48,7 +44,6 @@
     },
     gpu::Chipset,
     num::FromSafeCast, //
-    regs,
 };
 
 /// Structure used by the boot-loader to load the rest of the code.
@@ -247,14 +242,11 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
 
         // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
-        falcon.pfalcon.update(
-            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma))
-                .ok_or(EINVAL)?,
-            |v| {
-                v.with_target(FalconFbifTarget::CoherentSysmem)
-                    .with_mem_type(FalconFbifMemType::Physical)
-            },
-        );
+        falcon.set_fbif_transcfg(
+            usize::from_safe_cast(self.dmem_desc.ctx_dma),
+            FalconFbifTarget::CoherentSysmem,
+            FalconFbifMemType::Physical,
+        )?;
 
         let (mbox0, _) = falcon
             .boot(Some(0), None)
-- 
2.56.1

