Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0970283141
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752233675; cv=none; b=gDsR+7CfgyhRj202Z5bJTRP0gN2lVkL+WSyI85ZbVbteEgjJcTGWjGQhqT2LohfvFWVG6UWYXYA2vQ/O3ZK5JeTTXXTNnGWVZb2CQz5QOO/Lt+QxFk6lkVyjRgn8Ki6CmBy93EkyEgU17RFp1+CwGTbCk0cL/EtGjYheC4MaF9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752233675; c=relaxed/simple;
	bh=ZrPry9dibIB1e6E2fTbzDxhn7O5lslZh8d2sy47SFP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1ZfJDDybyYXZ7i3UkKo3cACsQpOn88RKA+aO7hsGIlf41cMeSeob3lGFzR3EhZ5gYvVNwaan5ogdiTLxrK+O/ROsMb2l73i6WR3BIhzSVe/HKT/ztIMeu2AxZK4qzMAZa4rGVpahszUZ4LY2ODG72C+WxHeYi/HNwu7goOh354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TR1+fB0L; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TR1+fB0L"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234fcadde3eso25410655ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 04:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752233673; x=1752838473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5iCt+AL9f4UNEya1UkmziIpzAIFx+Cs0OtkGEYlA34=;
        b=TR1+fB0LCHtyrh0EQn/9OMRfAB1BiXr04X6brauUS9LczHZOVGrLI11VwNtKpGJCYA
         HjGem3iHJvRodcq5qpZP8fmkRU6JrpT7UpoPM4o24a5r49tHYL14xll6YgmkIoNpXiSs
         CJflZT72BZLWptiot9IL5Rht4inFlYzYLyvF999yJp2G0Ls8L0CxzWgSZmVXg6dX9SSl
         tNPWcoArm1CB+wIqrcSm9N7QiHdIro6wXItNtCx/1cLUaz3nQo549J7CXH+hXukv0qqh
         WwV38YL734VLyWNfe8xEVlFCQWzxmpkbsUEx/nlWC0AC5EQcTzelLTaaC6jYoFN1G9dE
         Orgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752233673; x=1752838473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5iCt+AL9f4UNEya1UkmziIpzAIFx+Cs0OtkGEYlA34=;
        b=jzDs7xHXnk8EgeFCQVxB4U/tF4WkkCn9iyjR9EMjCLkJHx1CkJwoyfKadhSlAOmnpA
         6LDFGgz/rgKXoAQRuBelWLmuvb55D60fIhnP52OdFolVqXfV4msWopU3/sN/BdG960Q8
         /s9gw9ge1NXdKzC2DGjwhC8qUdznsbVv75PBEttYhET0G3pbyOjP9Xf0h8vRPJscPHiN
         wloiDlqsSBTYlLHbvkLTcdKo/91ftoKGthvXTHS4dWnoE5XYcrexzD/g0tLkrUz72o7g
         nKI1SF5C7RfVylUh8tBsEY+kIvHwp2xhYhKzCYrYlbYPmY6hcfdKuxJay/s705KcSxLZ
         PaVg==
X-Gm-Message-State: AOJu0YwduXLGyVNmqSQKFmxziI+fV+h4y3xMzRHG7p/cofv6XcEIXGAi
	UTrA0WSpUZgCbOXKqrNQDKMDFrIp8oIGIOVXbaab824gORm0PGus9GUU
X-Gm-Gg: ASbGnctcFbAe3ANifosWr0pROW/PBSdF65nA/zwVlJIKkVSiOjISVsc1Jyn3sgAVCId
	TD4WhmKwy7R6Kj8ulrbgl3B9w7V3Wt+hyXGEjlCojqdLbDfwqzNuwy6f20h4XIO0GLw7/jY+EQ+
	9MltKf0WmehEnLYeRWMA6twqu1pzFkmh0jxcr0va/ZX3p7fe/sF30jqolVFdLD+s2wRKtGZ4xjS
	rSF8vNSs++wb4UgA71EjuVfXJ9O1sFdeKlKeEgz2RR/l1a07oOGy+ZODonaFXbgLM7yKSqQKlaY
	0RGyFe09DhXLo0kELH/EqfO0H4lmDgRgsqtiQA4QN42hdDeCoRbwM8olT9qixeV+IKc9kSInhTq
	VPxdCXXwi+RHRjewKL06NfiH69XpfENEo5pU=
X-Google-Smtp-Source: AGHT+IGi+Vvmr97ZvJ+Y5+BpKBpsR883hN1robqRgupXWnlJMU7lHHhGpyhS5NtkWHY7cZdz/WPcBQ==
X-Received: by 2002:a17:902:fc87:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-23dee263c5emr38401515ad.37.1752233673009;
        Fri, 11 Jul 2025 04:34:33 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm45480825ad.158.2025.07.11.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:34:32 -0700 (PDT)
From: Quaternions <krakow20@gmail.com>
To: acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Quaternions <krakow20@gmail.com>
Subject: [PATCH] gpu: nova-core: define named constants for magic numbers
Date: Fri, 11 Jul 2025 04:33:27 -0700
Message-ID: <20250711113327.39201-2-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250711113327.39201-1-krakow20@gmail.com>
References: <20250711113327.39201-1-krakow20@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
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

--
2.50.1
