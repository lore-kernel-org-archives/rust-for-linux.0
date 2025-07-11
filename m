Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1A012CD88
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752244400; cv=none; b=FJTZRP4ZbtVYtEaiwxYth2y+++bmN2l2cinZamu4VdiW2Lr5Sm3jCNvmgWTaNWjrmR0WUt9d0nHdyokG5p7HcL2iAF953dw/Su3kaN7l6R0DZtxiN6AO76et8MnP0EMKn6VCzgRQ14E/1KzrGAEdxR5zFer7X6n/ChMpuRZVP2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752244400; c=relaxed/simple;
	bh=00ZyH3aMujfB1olxVlERxejkAi5mSITlmaj3KArXwhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncWnWj3ATuI60tknPcGKjo4uGP7eja19FzteTNNqqSI+PvVJsPoM1JOaicWbNC/aMW9RwZHVbXUKgVAhXir2qqg3Pu3qbsUoOqe01DFNyvjlKqNKRUUaHEpJSAgjUQWyX8wm5KAisbuhg9C6gOm1vlO6iTouNfQlsgs6botHyco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9cVS99w; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9cVS99w"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7426c44e014so2122431b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 07:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752244398; x=1752849198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BjtA+38PaXu4R7KEWbDJSP4mSWUP1v/3PF8r8C6k8w=;
        b=c9cVS99wFPfL9IY0xV3MwTbjGbHnMsLERy+ESOWOO1fDC7Pc/Uq6czjn78xaLKwBtf
         w7w1Kqspoaub4dy+OgmpPUCf71B+HHhTQjrkFKDiDjHEn+rr/KOxACEf04mSfRadbYrs
         QgFAYaf5S9OzpKAe+XWTkwFOxZWWbqT6WryJEvPpVWQC1QIKeIcrGpaU9rmk8hW8hS6l
         pvcA1g8wPyRlMWlb31fq/37C6o128radbb4kiVNavHDqMz6Geyr0PJ1Gau+M1FQAHiGe
         dtkszEaCRfonBwrw4n2V02PS/lrrPBgSJnp83OAy3VQQvWWdvU1YBhP6t9SjdkBlnsO9
         p8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244398; x=1752849198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6BjtA+38PaXu4R7KEWbDJSP4mSWUP1v/3PF8r8C6k8w=;
        b=S/xObljPYRnE6lwRG8IzHIXS93Uf+GFkv3xfAgoQeJLNFGdNurekYFaHXeEwWRCDes
         UrADmmCd7ePAYdW5MU2aSALUCggdextrsTxKOJIAbkzJgPPAB5I/3F/u9ODC71pbuGVu
         qCzHRfarQqdcZcy4jQIsphZpiqxTzyWByHC/Tb3vcZMpw2Fy8rgZyGf82DCC+LTX9paD
         W5mKG7x8EodbbEBIMcegc02C6317vR5x+5+xIMJbN+b3OrKKrroDt3Oz4rcHM1jX6+u3
         QKQ+98BDel33Newuy7Jt0Y+nIwVgHMV6+4CJQTO1Os80thUWEtFBWhRaw2D6khyk8BEj
         a66g==
X-Forwarded-Encrypted: i=1; AJvYcCWMhO5/8ReVCl2P4aRp3th4WcBnpDaEJ0mg7A5CgzolpLuLKM3iow8CSYfSPD1tizDT0QcnEjXyVhMGexZfhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfjHb3vmded46hB1u6XbnLwABhpE7kWx51Lrhf4KUsZbRHfihk
	0ALFslL+/pu/SNpZUNcvnC7ScDt89QkizqHrMhXkvBqJTClAJmyTV/1e
X-Gm-Gg: ASbGncv2a5Qu8ZEu64nAa46H5wsD3yqkgZ29A9slg3RRG7xoLrU7pFRTP2ZO5NJytOT
	3P309CMAFGTpKn2RbXa74JQafsA1j5tQ2YWWQc/aKVT7XJmTGVCoBaPRbPsJwzQPJDclh9bdO0W
	waD1WAGbaWmx8PVlnrv2cEOrYOytDcAIJkjz5C9jj5slCuYGCIzw45jCCE1Hoyns403k4cYlfuP
	iZ12q9ywHon2FM+hVWwFt8EPe79xhHccYyCNm15itpTJTLH3WwURCFpf76h2ic1VIW9DONiZpb0
	tDtBX7qFempCCHOyoaunFEjUzOXqB+rtKXQ9nyC0xhrWVLNFQAImJhzwTv+G511AQIcD81M8QGQ
	J1n2bFxjMQlx0phTgsc1o5ugC
X-Google-Smtp-Source: AGHT+IEWk0PoiG65zbb5LAHsrxNW93+2hjG60rX2eikJm55g+N2RihWLZcaZGoULEOv+4Gryzge/Sg==
X-Received: by 2002:a05:6a21:6d83:b0:215:e43a:29b9 with SMTP id adf61e73a8af0-2317fdb078dmr3831427637.33.1752244398112;
        Fri, 11 Jul 2025 07:33:18 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f22c01sm5975883b3a.101.2025.07.11.07.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 07:33:17 -0700 (PDT)
From: Rhys Lloyd <krakow20@gmail.com>
To: acourbot@nvidia.com
Cc: Rhys Lloyd <krakow20@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] gpu: nova-core: define named constants for magic numbers
Date: Fri, 11 Jul 2025 07:29:52 -0700
Message-ID: <20250711143141.9690-2-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711143141.9690-1-krakow20@gmail.com>
References: <20250711143141.9690-1-krakow20@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce an associated constant `MIN_LEN` for each struct that checks
the length of the input data in its constructor against a magic number.

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
Changes in v2:
- Add commit description
- Fix author to match SoB
- Add base commit

---
 drivers/gpu/nova-core/vbios.rs | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 5b5d9f38cbb3..d456c494374d 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -364,8 +364,9 @@ struct BitHeader {
 }
 
 impl BitHeader {
+    const MIN_LEN: usize = 12;
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 12 {
+        if data.len() < Self::MIN_LEN {
             return Err(EINVAL);
         }
 
@@ -467,8 +468,9 @@ struct PciRomHeader {
 }
 
 impl PciRomHeader {
+    const MIN_LEN: usize = 26;
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
-        if data.len() < 26 {
+        if data.len() < Self::MIN_LEN {
             // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock.
             return Err(EINVAL);
         }
@@ -772,10 +774,11 @@ fn into_image(self) -> Result<BiosImage> {
         BiosImage::try_from(self)
     }
 
+    const MIN_LEN: usize = 26;
     /// Creates a new BiosImageBase from raw byte data.
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
         // Ensure we have enough data for the ROM header.
-        if data.len() < 26 {
+        if data.len() < Self::MIN_LEN {
             dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
             return Err(EINVAL);
         }
@@ -900,8 +903,9 @@ struct PmuLookupTableEntry {
 }
 
 impl PmuLookupTableEntry {
+    const MIN_LEN: usize = 6;
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 6 {
+        if data.len() < Self::MIN_LEN {
             return Err(EINVAL);
         }
 
@@ -928,8 +932,9 @@ struct PmuLookupTable {
 }
 
 impl PmuLookupTable {
+    const MIN_LEN: usize = 4;
     fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
-        if data.len() < 4 {
+        if data.len() < Self::MIN_LEN {
             return Err(EINVAL);
         }
 

base-commit: 215a3f91713383a3c0d2da82d223a608a3c17ac1
prerequisite-patch-id: d80f92d314a0693d4c89ffb7810d9ab6990336fa
-- 
2.50.1

