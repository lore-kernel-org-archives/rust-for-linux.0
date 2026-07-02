Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EC548BD45
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782993966; cv=none; b=ckUOg0rcBZixOpem+Q1+sTa6+j/Lmbt8YOkejFRSZUpFPlwf6gR3DhEFALyqUr79anjkvJTi/pMoYRwiOhGQJf2z34Un1ChxGfwsr9d688APw0VWASEfOjfXa+ulesKXDtkb4ReHyPt9LAq2e1xG5Lymb7mmb/aD+VovLKPlOhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782993966; c=relaxed/simple;
	bh=t2q8xrLgb+cVvPOt0w87a6e9ZSmUQFB6Nqn9L1La7ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EJk6BCPO7pQpjBrIPWIXNaXsqXP37VOtRNHocDLcKw05SykRYtQn/FAEynKVncy8iDViwqYkz5+UBIVg1dZrdDCeemYXEdakEdXmCTEtOV9W2YzdLJ8s+AO8extaJ6RJH/2zB5DZRN3UCNnuVIjro4I1aALo3H9N/DGFr8McwZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br; spf=pass smtp.mailfrom=usp.br; dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b=r/+o0rgI; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=usp.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=usp.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=usp.br header.i=@usp.br header.b="r/+o0rgI"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-969524c1a63so1061749241.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 05:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1782993961; x=1783598761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=r/+o0rgIb6fRkErhCwmHWdlnOctpq2gA0Ca5A5zn3HE7iFr6oDFWopkRuPYBFHB7z0
         k8/RViRpUJYaKPEw3dft+d47j8C5gWQNCCtvb+qgV8yJLe33YSvZ4UpEOWGmeGH12KMr
         YmAQd1Ijs/uHpzoxfmo7iYdrJ+FjtGqz9jMThuMGr5fau3HXh2V1t81eRni7udissNFJ
         AktBsI1AXioxKwKkedwRdGux0/VvbfETmhbXiGxh4JZxn+IC6djcYFTxdUwzBW2Ub2Ay
         SirYMk+UICMlPAzWSgNluZ+DwN2e8RBrrzc+OVTdQ8jeOqtqcK4LbvVw/8jtE9VLc3W9
         UxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782993961; x=1783598761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cVZWX31i00/Q+AQyz7DVfvfVMzM7hxRZQOP4HWyMgo=;
        b=gA71d3SJIzsg0q2jRsvxmZB/DGiV8TAjhCGT59v8Csmwkqq5sAzSbqczUWiCUFDjgh
         lZmzchkKxuoXFaOSHW/icYr0VBrqUWwmPYk5ximvVPnI6+T5TRiDzfWW6YMSiKV4kcAX
         9GQH1wfllGgBN/q4SOO+s0B8OsbgU3mwQ9VGCzS4B0nkhErTcbqDikVmAWXbLu2OuLwx
         2loECfLkggt570EAZZzumDnencHVzaEsm4R4dujCY65+wfC3eVq5MbZ3Tdx6/hddhiqe
         0INAndfiqeCAzSrrWD0xOwKzbAaow9o7rkY2r+G/ZH6rmGsu9EEfKJvJdmRLg65B+Mhi
         n4eQ==
X-Forwarded-Encrypted: i=1; AHgh+RqxLQoEnQu6d76BB9J1V2xJ8og2qbxVX6dqd8iXWUB2W9ohjMHaJbEOdQOoE6T8FToBr50R6m9HCoTJn2yOOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7+SDhy23vegF8B6JhVhGHBfrc11XWuH1ChghGjD+7CQvplq13
	2v4ukfCnko8Ux9kRZHBHCt034fRuJhs3S/F53Dd6CNGsOEEx9G1MVdaSDETivfNbu0w=
X-Gm-Gg: AfdE7cnlHDnFIpfSzlxTVHa0/4VuZ0JRyG5vliHk5PsPFrQqGEROMTGMk9T0tCuz3Ow
	iJBlj4t98J1M9aZdJV1JHriZKX24jJQxNlMBOH/QA3rGWNXZK++cQhqCCL2nlNU8bUtm/oJPpXs
	wVxlh5K9e5lCq9tbEO34bZPqiaGrsFaLAkSjZjhqX4uDlcN+19YYhz/aivgfa35+ofwslfMPeh4
	jhDnnF6xReTQ5iwlw37gCvJHepacLh7O7mR9VVI9/BlvecmyhA11irTQevBh4D1ijyCFEM7mFKp
	isAY1WFJzlthQxNPMiJ6X1sjT3Ap86O2V6xAX7zzqI1plGUV6HwcHTG+521z2EsUMZGFzmhLrkw
	nwCFAv8oRRg2cr0stiPXrc3U9sbZ1izysPjegG6PKV2xvS5YfnOUNoFA83UCb1bkj31E1K8WUcB
	/yAkeE5G7gqqvv42A=
X-Received: by 2002:a05:6102:304c:b0:737:783d:1912 with SMTP id ada2fe7eead31-73dbe560d03mr2566154137.12.1782993960866;
        Thu, 02 Jul 2026 05:06:00 -0700 (PDT)
Received: from niyudi-linux.semfio.usp.br (nat.ime.usp.br. [143.107.45.1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73e1caf43casm1182470137.11.2026.07.02.05.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:06:00 -0700 (PDT)
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
Subject: [PATCH v2 5/5] drm/nova: use `zerocopy` in riscv.rs
Date: Thu,  2 Jul 2026 09:03:24 -0300
Message-Id: <20260702120324.40388-6-niyudi.honda@gmail.com>
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

