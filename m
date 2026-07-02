Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F4048B39A
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993961; cv=none; b=mip5RrC80EyWIgoR7iQJrku3iyY3FGxXZ/+qIJRwZ6+iCyWVFuEOXhppsPc4eFao1n7g8TZn7jJnvWLXjGunCIeyUvR5sQuz8NwJetZ8I9OeX4X4vWjk3X/FRQel8kpGeJgq0AP1XPYDF/oqWHm1kEeAVIu5d3vHMZHjQxO9MTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993961; c=relaxed/simple;
	bh=g7R8tEi4i6Q6H+mFQbeH+wY/GGgNqL+C96OYgFFuf/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nc3LrKGGZ+Odr/cSwBFHoDlAioizWlADEfSS4ilG8WgZMr4B8yTnt+U17yhE+2hZnm8CwMspksx9qKJevnGIPzAziiaB1lAr+xtgacNkt/Qb6EMZGAfQiwirwjorEOo+eoLTsiHplkgu7ZJdhIeksJO9NTnPXyDLPa3ZaETeYAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=JfHk2BHA; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="JfHk2BHA"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-969524c1a63so1061708241.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 05:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993956; x=1783598756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UGgdNIxUjLSQ4UNZW/FdSoJV4OLj/5NQZw2raQ+vfnI=;
        b=JfHk2BHASpp8yBLkIZwHAkbgteQVlsEwz9wr88oxQWA2x/eSXAoxwqMpoVnpFnE+pm
         4ZtnfsOJPJ6gGydFapx6pOr9aoV79Jheb5/MEOZDM7hzKwdoisLkeJneT1vKwHEW1YIb
         r8hGnG9Syiy06jz1qabzKvCNQ0/iUCnC4rNVBZ9NV7f4TNaKk3WmVu44L4/7d65/njmr
         uWowDAQJROkGvmjVmd6x0u7wn6PfakEeGv+V641yrJdNC8fjdTncrnrzQque123T6liI
         rLCj9hhoUGxFXtVFz278JBLYmQpFkX+45LLD2Cgy1iLZ0zeaNSDEPVRT94sq9MJ4yvf2
         ahDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993956; x=1783598756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UGgdNIxUjLSQ4UNZW/FdSoJV4OLj/5NQZw2raQ+vfnI=;
        b=ElirL2Rrs2jH95knmfG3cAIvIlZ9oedDuBeMKVN9taaFwVLc9uqlSP/+jW/bv10thk
         sBe+CEi3aTBDySE/jOatCdz5/FoO8+WLkKd+UQbA4H0LQkzi2Zx1eyJ10WYtpFhP7Gi3
         qFNZp+zD5pHoOK04yZGPxD80bn9m2bn3yNq+iCRhmSPzOv8fItVdc0i+q02eZCNkb7xh
         wumyTxJW1hscqtyQMQw9mdmRGS8+6b63GpXWt8dq6Z6hZcFXc4R9DZquBEfGOkfpOCCH
         t6DuGE8w0/j99hTUirNkr7wLa/axXLqCafFhHrYOpt6AVsr4NGNemjDaP1DGwERiG0EV
         +HgA==
X-Forwarded-Encrypted: i=1; AHgh+RrOxoT436MjxNPNX3Nph6tRNHhAJmJffkVz1fwCaNTGvCrf0Mbo50dUc22BkSr7zvXnY4+icDSt6gnG6ar03Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDapO2wF1bjp+Av90O9apNNBDEDPHdaK35EB521Bs1FaTMi0Jy
	6FJWGG4Y8WL8tQXyaLYH/TfowSj0FGvd9Aj1wRAJillGgc6lSI28DVXOLP9zhq36afA=
X-Gm-Gg: AfdE7clEjO91HqVgcS3J0fsACbG6+jz8KZjb57AESJ3gjtJ15YqEkwHfPkPCUzi75Ni
	I/L8x6kMyDMG5KTtV62p53F+CZ+zdE0zak91I/9mOysP+ZvK2V3cYcuenRt9k4T2iFwoEQlQDBb
	De1p2UG4iDrmn9aPBAme0Yuc1EpDJraMd+iKOb6BZ+/ey5NtdLHlX0PERKlb9/ZImhJFesEe9kY
	A7G/40uJRfsV5mHabbKJOWeqNA0XJ7XmAPbxf0z8ZUxJPy17IsI+7b4n1JljtbMhNso5rQ6m0El
	fx1RVAy0+XP2OKwXbzsyU5xfcDF8vAPacqeYAOoOhrF5qfxu5CkuYdSCWaW1mTh8kTErQlhEkfL
	V3c1bP0RUODSq9gq8AAs/Wj7cQFVrrjxE7Sl6BfqTrYENww37fdZ6sn5TPTRpmr/HAo6Vj2nKEB
	HT7ZwwMmTCvPIxb6U=
X-Received: by 2002:a67:e95b:0:b0:73e:8694:c6da with SMTP id ada2fe7eead31-73e8694ccf7mr500231137.24.1782993956039;
        Thu, 02 Jul 2026 05:05:56 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:05:55 -0700 (PDT)
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
Subject: [PATCH v2 4/5] drm/nova: use `zerocopy` in bootloader.rs
Date: Thu,  2 Jul 2026 09:03:23 -0300
Message-Id: <20260702120324.40388-5-niyudi.honda@gmail.com>
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

In firmware/fwsec/bootloader.rs, replace the following `transmute`
traits with their `zerocopy` equivalents:

- `transmute::FromBytes` -> `zerocopy::FromBytes`
- `transmute::AsBytes` -> `zerocopy::IntoBytes`
- add `zerocopy::Immutable` where necessary

Update call sites accordingly.

Signed-off-by: Pedro Yudi Honda <niyudi.honda@usp.br>
---
 .../gpu/nova-core/firmware/fwsec/bootloader.rs | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 66b9f4d1b41c..03d3090bd9ef 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -18,15 +18,9 @@
         Alignable,
         Alignment, //
     },
-    sizes,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
+    sizes, //
 };
 
-use zerocopy::FromBytes as _;
-
 use crate::{
     driver::Bar0,
     falcon::{
@@ -57,7 +51,7 @@
 ///
 /// Most of its fields appear to be legacy and carry incorrect values, so they are left unused.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 struct BootloaderDesc {
     /// Starting tag of bootloader.
     start_tag: u32,
@@ -73,15 +67,13 @@ struct BootloaderDesc {
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
@@ -120,8 +112,6 @@ struct BootloaderDmemDescV2 {
     /// Arguments to be passed to the target firmware being loaded.
     argv: u32,
 }
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
 
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
@@ -160,7 +150,7 @@ pub(crate) fn new(
 
             fw.data()
                 .get(desc_offset..)
-                .and_then(BootloaderDesc::from_bytes_copy_prefix)
+                .and_then(|b| BootloaderDesc::read_from_prefix(b).ok())
                 .ok_or(EINVAL)?
                 .0
         };
-- 
2.34.1

