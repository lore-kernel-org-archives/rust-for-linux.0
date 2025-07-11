Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AA4146585
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752233658; cv=none; b=iPAeCpeLe19DQRqkCb/yVw3CE+h7v9fkd+fgDB0zw7+v1/T9tassofFt1Yf4akZyRJ0YGCvplQ1Q5zCobpkeGzAmnKu06x32ySZVVlmDU+BtVnKR0qR6SY4h8itq51S301oJVCgpjGDisSWw4l8xKRZaYwEsmaE+rOd9c5vp9GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752233658; c=relaxed/simple;
	bh=273r/EkrmyFgvjq2eddTpmIrLwHZixqBi8aD3JsodNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fB+c/K2cuLubM+adlGVvMHRWW32fLWDDxJoykrtR4VTC0buIHGeGldItITFuBWOZG/4hSKuWv+kjDeaTG/Nm7ewtdFXMAUMp+JeSzOCs5TrILWnvrjo88soyoVU75Hebu5ZSux8eXZY5mIPP9sewKtCjnrz+wQqthTYAgifiofo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnD3qFnM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnD3qFnM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23c703c471dso26907755ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 04:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752233656; x=1752838456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wFTFvOPl9z0oMG+Q2qe8rihqJLxAx1U3xn0MBTrYNM=;
        b=YnD3qFnMllgVj+hKtKD7uBD8iQWuOUNLi6q+eNKenU+N6/AoKx83etMEbEtceNyz2F
         rpTEe/aYtdfWtmihgKyNPIaeoMQY1gtE0qR8tZDThCrrcadBlNgcpFyUw92KEiS2Dnjo
         i/3cOVbTMqCk/hthrq1l99Y5YOZiCzmqkpFBoAoCC0r4lyrCfb+IGv36MIzJx445y0Mi
         ClRrxt5X78/aRfEbSOqSMyjJyUzerT9pCugyS2+Q5Ul5O0F+/0w6Un0upmCu1BtySTKt
         vg0lhs5H89kCBgEx2zdJwadcFVKXLvU71PEVXym0bfmyiZbPzxC8wuwEVpL4zo0kTQ4k
         M/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752233656; x=1752838456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wFTFvOPl9z0oMG+Q2qe8rihqJLxAx1U3xn0MBTrYNM=;
        b=o0eZFgrNl+9uo4StD8iT8OX7TTu0bY/rF7Y37VGVDjFkLHB+Dk4YGqaDJFKdT0+NL7
         Wbv969hL/B+mjc/8L24T4sZdo0l9wIHSaxiROFpMhRUNkwnG/3yILqUbR1/wIc2KBNTe
         AjmlAIItNEHwORvvihWOvtRC3F4DXpmLwWBm568crvOgSme4dcav4yryd1oXWbrPZg+n
         661bcO+kuwMP+UW+Nan7Ghljp79iIcjhZJg+Hy+04B6oxtn7aFIFhB4RFqhcrb6sSMAA
         wqvPEWcJo9HKon1GTxk7ojgFx9DAj2ngMqQnlzYpG9cG/3r0LmhpcckF5W0Er41lM3qk
         qMig==
X-Gm-Message-State: AOJu0Yywlczs65h7o4ZNiQ2HM2ZWdBVhiVCVL7QBFje5wgbMZ1qoWlWy
	bv1OJlwxz/er4ERCrMU7dZ6O2T3y30YakmARf9YImTH3gLGYznT4pCvL
X-Gm-Gg: ASbGncvE2Mp2VHtK2879E80Su/WP6ZW0rB00HQd/VJXet2/enLDPzz2Oly2RfOb/2Gs
	B4HvmAVDTlLKulW7j8iz5d9DKqmIzikk63RdGxW+HAZVeBmgscVb+zv2kWcyK2Kc6mn62duUnby
	pTu67GazxnI3aZGHhlilNMbE6bgsZnttS/n2AqX32tN91s56F4k4nJAPxWFxnJXRVelpuBOEguR
	sik8e8AFyhGHQtluKKkFXj7DBNg+BlvvmUBNuN84SAGa+2yYKms6Nj4yH+tao86ruexwMQ44gSB
	sY9pe1NA/b+7wOI/wGWwfIkSat5Bk9j6FadMGoxZymztMne04h27vCJZPCgZT2haEjo8mnWIjYM
	om5ATTOImYT+5zqAUjLwppj4i
X-Google-Smtp-Source: AGHT+IHi/2v3d4D0niLSXVfJBurK7ik6yfS2C/Nk2uOVVVzuNXttGT4YdRjf4pKn117w/IWULOA2qw==
X-Received: by 2002:a17:903:230d:b0:21f:5063:d3ca with SMTP id d9443c01a7336-23de2fc7394mr105884465ad.16.1752233656319;
        Fri, 11 Jul 2025 04:34:16 -0700 (PDT)
Received: from quat-desktop ([2001:569:514a:9100:3f23:7b0f:f6a2:1ebd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm45480825ad.158.2025.07.11.04.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:34:16 -0700 (PDT)
From: Quaternions <krakow20@gmail.com>
To: acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Quaternions <krakow20@gmail.com>
Subject: [PATCH] gpu: nova-core: fix bounds check In PmuLookupTableEntry::new, data is sliced from 2..6, but the bounds check data.len() < 5 does not satisfy those bounds.
Date: Fri, 11 Jul 2025 04:33:26 -0700
Message-ID: <20250711113327.39201-1-krakow20@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
---
 drivers/gpu/nova-core/vbios.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 663fc50e8b66..5b5d9f38cbb3 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -901,7 +901,7 @@ struct PmuLookupTableEntry {

 impl PmuLookupTableEntry {
     fn new(data: &[u8]) -> Result<Self> {
-        if data.len() < 5 {
+        if data.len() < 6 {
             return Err(EINVAL);
         }

--
2.50.1
