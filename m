Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB4117557C
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Jun 2024 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718873887; cv=none; b=ZFaqKh9jwsumzvL4EaDil2KDGGzSxbrV9q6r5V5EVTIZptWW65bFfaMtMl+ltKBNjaBUw2Y7l1OvXQgU7Ciuszkf1SgqEMKEFlWEK7TTQ5eQFRLU4FMwLdkmYWaq1wgVE0A1i2Bx0MTren5gmolIWGJ/1hTDdPp18d5LEXwseYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718873887; c=relaxed/simple;
	bh=R2m1iTMgAAfEnaRxsHj5OU4tT6yTo3Fl0TJXfy9fNwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DjzMAVYI+UdZfuHKarcl+G6F4IFDxk1gFClEHq7VqP2ET240xZPUe59CMEWEaLCxdkqbTBFIy6FQi2Iol0scZ4WwWRtBhNxo5iGgsx0K/7nQmTCP8P5/aLt7yKiBqcneD5jqeyaNaNXAuqJfE+DWVb2rZsI2MLOazH+3pQ2KPN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=zPn3+QHG; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="zPn3+QHG"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57a4d7ba501so579665a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Jun 2024 01:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1718873881; x=1719478681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxlm73kuKE2XKIMoWmSTWrBbAjROgxfrZ4Cghh1emzY=;
        b=zPn3+QHGH3mGdt4J/BB0b0OjbkzZCjpMZIuXAHBEUuyMO46jcv/us/VID/LQQmu53x
         ttG6miwEvnq3TFTJX489y3q/VQ8fcemswjZjqWPxnaV2xNgkF6U4+C2woh07pjgwamTp
         a5M3/vTdTwc265yfigTzTOM1cLLej1d7OhC2q0ESPkR/pEpS9we3C5T/hV7SIViaRPKb
         i2xrAnR5X+CSfbyvjmuKqdTvEpBzBbBmcYDHapJnxF37T2R9mKCGDdPlSxqBwpdWVCq1
         UF5LP8qO8CKCy8bEqEHAuL1OWYAHEs6K0UWR2qG4Zj8PW8fng3u0o8AVtWSXkUaGMVA7
         5Eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873881; x=1719478681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxlm73kuKE2XKIMoWmSTWrBbAjROgxfrZ4Cghh1emzY=;
        b=SG1+TgF8weeq8h0shsqpmgwMKk/vfqW0TK/Ej07s4xmCgPKAhsKRGvZbZRpRQ1p8aW
         4wcroZpxCezCOIuGJm6QasOACSn1bbjpB+PWmAa+jpYqBXiqeZgmw//doLXHULC9QC1Z
         BrPQ8tGX7Zt/9B1ZGrr66jFCO3+nW5KGOoRa4tEDVfs3HQw7VEe01a6gH7QiBkhmO+JP
         dxmcaNp1VFmsCBWjanuOxjNMvUt4ydA0SI9men3+PsAx1Lb8NleP74/sNLbbmCl7FumD
         Ywj5cxZZfGS61LM/z/U4b8aRZ9nDbyLJz8rNojocjyLpbwGMFlPUqmgV9y8nPxj+3GR9
         6Bjw==
X-Forwarded-Encrypted: i=1; AJvYcCUhzyR3LlW+wtCgfVlY7kSjlSbyPmE3/PUhUN9ZX7xiGsigFX2YAo0KHS/bUDTLuJvLfpzkbFMl/ohHkJ9LnZqZR/ruoPvdUzrJehjINIw=
X-Gm-Message-State: AOJu0YwWLcmcNKkPdlI6NSciOeq4LAk2G8Lnfmw8COTn+hysRAfHSxRK
	vF9bxMOuTM3cDamNSsS/s4NBAG9gu3fVk80qw6XBgdpuHkAZeeM8LE6osjMHbwE=
X-Google-Smtp-Source: AGHT+IFNBPfPRC5d3WpzjNOlLtaGNXM1BXKDPBXyHCQb4RbbNdBlIV04IVIbPwWrAX9/Zw92/CFflw==
X-Received: by 2002:a50:8d5a:0:b0:57c:6740:f47c with SMTP id 4fb4d7f45d1cf-57d07eabd35mr2962176a12.27.1718873881269;
        Thu, 20 Jun 2024 01:58:01 -0700 (PDT)
Received: from localhost ([194.62.217.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cbe89005asm8226647a12.10.2024.06.20.01.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 01:58:00 -0700 (PDT)
From: Andreas Hindborg <nmi@metaspace.dk>
To: Jens Axboe <axboe@kernel.dk>,
	"linux-block @ vger . kernel . org" <linux-block@vger.kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Andreas Hindborg <nmi@metaspace.dk>,
	Andreas Hindborg <a.hindborg@samsung.com>
Subject: [PATCH] rust: block: do not use removed queue flag API
Date: Thu, 20 Jun 2024 10:57:21 +0200
Message-ID: <20240620085721.1218296-1-nmi@metaspace.dk>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andreas Hindborg <a.hindborg@samsung.com>

`blk_queue_flag_set` and `blk_queue_flag_clear` was removed in favor of a
new API. This caused a build error for Rust block device abstractions.
Thus, use the new feature passing API instead of the old removed API.

Fixes: bd4a633b6f7c ("block: move the nonrot flag to queue_limits")
Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
---
 rust/kernel/block/mq/gen_disk.rs | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index e06044b549e0..f548a6199847 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -100,6 +100,9 @@ pub fn build<T: Operations>(
 
         lim.logical_block_size = self.logical_block_size;
         lim.physical_block_size = self.physical_block_size;
+        if self.rotational {
+            lim.features = bindings::BLK_FEAT_ROTATIONAL;
+        }
 
         // SAFETY: `tagset.raw_tag_set()` points to a valid and initialized tag set
         let gendisk = from_err_ptr(unsafe {
@@ -152,20 +155,6 @@ pub fn build<T: Operations>(
         // operation, so we will not race.
         unsafe { bindings::set_capacity(gendisk, self.capacity_sectors) };
 
-        if !self.rotational {
-            // SAFETY: `gendisk` points to a valid and initialized instance of
-            // `struct gendisk`. This operation uses a relaxed atomic bit flip
-            // operation, so there is no race on this field.
-            unsafe { bindings::blk_queue_flag_set(bindings::QUEUE_FLAG_NONROT, (*gendisk).queue) };
-        } else {
-            // SAFETY: `gendisk` points to a valid and initialized instance of
-            // `struct gendisk`. This operation uses a relaxed atomic bit flip
-            // operation, so there is no race on this field.
-            unsafe {
-                bindings::blk_queue_flag_clear(bindings::QUEUE_FLAG_NONROT, (*gendisk).queue)
-            };
-        }
-
         crate::error::to_result(
             // SAFETY: `gendisk` points to a valid and initialized instance of
             // `struct gendisk`.

base-commit: 43ccacc7be96b71bf8c1461036034f1174be2f4d
-- 
2.45.2

