Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCD0332EC1
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 20:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782420764; cv=none; b=Q69kA9wsA5AAai+Xi4VHoBrnEoiOdDGhwhzzg9u8xFCIycwOm+sG2MqY8IM+kZgYkPYXe2ewqzW5oQTNwTDMEWbUgVG6p+U/o2PrjjaOOf67bfZLDqwKBR5wtCireHNsqagAL4I1bFihAu8SqxgriqigUzRHkerLUe7L793DpMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782420764; c=relaxed/simple;
	bh=NyodPeAoXJkshO63ZieYwDDpKeKcY/c8I+oDV4TLxr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PiZ/mrw+sTLWH9cJHdySwkrekh2mpTBZqB0aQb1ypLKurr5egxiTBMwubns+8JwUQapHi7YHJpJoBet7aS8P5BjzqSU0dBHYYAVZRSFwUvAa+LaAn6fkoJO1LPaKXKqSAXHggUqQdvc4hnAPIROhizs6AVjL2SY2XhG6UyToS2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=x6bNIvsw; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="x6bNIvsw"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30c591fb1cbso471834eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Jun 2026 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782420762; x=1783025562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzC7fmG1jZ13lVBNr652TT3bsOKLyvGJ+KuwuiC1EcU=;
        b=x6bNIvsw7xqbJ3hT62y4+3YRuL/dYN7g41oz2RTcfD+3lwI8r6BO5qTHR6kqri6/o+
         9KHDkEGi8pqKKUSqCqm3/UTqat2zgezTKkXDgUtJmSoY/UhvZwZWb+IJ86kEfu93yUiP
         w9iotKLMTe9dHOFu/967dOR/Safr7aKtxod33kAWODjwOGSnONxII3M7XgXa5KRHFzh1
         yHrEUMEUWcjcVjEjZOltmlbQL5AMJ5NM4YSo+Fr/8cSykpU/MEi7ArTRWfxtgK9ciAxs
         mpBJkVXaHIp6SAhKUqzeBDrEWpiI5TZ1B2ejJDb8sK0G7F16DTfh7Ss8V2mDz6GUU4Yz
         3ecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782420762; x=1783025562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZzC7fmG1jZ13lVBNr652TT3bsOKLyvGJ+KuwuiC1EcU=;
        b=SyJdn/rXpximlbUjhK9UY89bBNXHkGgPd3mRTxv3F3JGwbQCwkdTDI877LAHOW4zb1
         sD2L/VhetM4kj98Ck8YstMxn9KRwfUQZQyoGlvVP5KUAZRSKwK8qc1ngWjJhpJxcFp7S
         iGA3YJj7HEvGaSf8WrAbiTOcfmkwKprmPMYaGmQTjJyL8G4TY0zefMLl8VJx4tjgsepD
         1A3sxfReNf8LG+xpzPpm4RUxKtcvRPeIbVpGnmBqQYZAAb/uaX0bchlTdB1kWVM4Mchg
         rXCXWL/K6JIv5a35E99IA/QMnmX+oUtq3Px7odCCB4hxtYhGbj5jM2ojyYN+4V/uxUZ1
         DCQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpM6hDBx/fVljbYRQqosHig7RFBucvvW4HFNpXMiaXeJseAyAs19+pZ7BwCpazeZtQj8Sn6LomSLgT27F4ZeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJFNsQskGWmZWcI/ebEocw2OL7NrZndXUkeHdoHSO/aWR1Vt/W
	44LDdA9iHimrKaADyLFMEM1e4eIbeQAN2h6ei4Oi+wLUPQ5M7n/FBrJxNKFOY6cYMvo=
X-Gm-Gg: AfdE7ckCwnweaim7F2rByJyPRyQEJ3PZ/mZK5yLgWXNHgTeHMSrT4SHSfsvZXPfljqT
	k0qih6qUps6a/+y0oQgS1PPVEh/z/bnyg0rdKXLY2kxkOilUzXcA2YMwTBM0tDFpIjAOX51IWI6
	3Kok/0HmJF5f6bfX47EWj/xx/4HcgOmVrrAQI4q171qZD7MsvbC1Iv5yetxKPQoijaZrzqvy6d2
	Ceb7G5cuXVaeuDG0C4MEPCQJ20kBInr2Co/+Gd/O9DWAfx3ndkGh41WX+Ms+y5CGY/ByqbfbKkf
	tU2KtbJvJ/969oo6EUpSnWNxz+Y/n+YVWDHV96rFUZGjrM2dGlNndHkaVUH4PFGY7zC4K1mXnZo
	wc/PhZte0fRKiFLz6bYczLipoytJ0C7Uon503k2gXpZs+bob31h0DOWLK3un5wNukDSD3c60Gys
	Y7MI9vm1j6LDN8SmqABxJRoL3Cfg==
X-Received: by 2002:a05:7301:2f8f:b0:2cb:4b8f:b2bd with SMTP id 5a478bee46e88-30c84b1d6f7mr4694957eec.6.1782420761769;
        Thu, 25 Jun 2026 13:52:41 -0700 (PDT)
Received: from niyudi-linux.. (179-242-249-142.3g.claro.net.br. [179.242.249.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm10981525eec.5.2026.06.25.13.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:52:41 -0700 (PDT)
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
Subject: [PATCH 5/7] drm/nova: use `zerocopy` in bootloader.rs
Date: Thu, 25 Jun 2026 17:51:44 -0300
Message-Id: <20260625205146.5047-6-niyudi.honda@usp.br>
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

In firmware/fwsec/bootloader.rs, replace the following `transmute`
traits with their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`
- `transmute::AsBytes` -> `zerocopy::IntoBytes`
- add `zerocopy::Immutable` where necessary

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 .../gpu/nova-core/firmware/fwsec/bootloader.rs   | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 13af1c381df1..6f1c8daad7d3 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -23,14 +23,8 @@
         Alignment, //
     },
     sizes,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
 };
 
-use zerocopy::FromBytes as _;
-
 use crate::{
     driver::Bar0,
     falcon::{
@@ -61,7 +55,7 @@
 ///
 /// Most of its fields appear to be legacy and carry incorrect values, so they are left unused.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BootloaderDesc {
     /// Starting tag of bootloader.
     start_tag: u32,
@@ -77,15 +71,13 @@ struct BootloaderDesc {
     /// Size of data section in the image. Unused as we build the data section ourselves.
     _data_size: u32,
 }
-// SAFETY: any byte sequence is valid for this struct.
-unsafe impl FromBytes for BootloaderDesc {}
 
 /// Structure used by the boot-loader to load the rest of the code.
 ///
 /// This has to be filled by the GPU driver and copied into DMEM at offset
 /// [`BootloaderDesc.dmem_load_off`].
 #[repr(C, packed)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, IntoBytes, zerocopy_derive::Immutable)]
 struct BootloaderDmemDescV2 {
     /// Reserved, should always be first element.
     reserved: [u32; 4],
@@ -124,8 +116,6 @@ struct BootloaderDmemDescV2 {
     /// Arguments to be passed to the target firmware being loaded.
     argv: u32,
 }
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
 
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
@@ -164,7 +154,7 @@ pub(crate) fn new(
 
             fw.data()
                 .get(desc_offset..)
-                .and_then(BootloaderDesc::from_bytes_copy_prefix)
+                .and_then(|b| BootloaderDesc::read_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0
         };
-- 
2.34.1

