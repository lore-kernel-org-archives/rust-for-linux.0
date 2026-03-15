Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B637754E
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 17:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773595681; cv=none; b=Q4/p5J4LW4s8MVfVdXokud9pkE3cqgLGxm/C/fh+MTuhsK3QI7+b7ugqDYCUvMLZ0B37d/R+FFcNShNMhde1YGeCj7f3mVJDi8j+c6uFB6G5DdPT6+ipW2pRM4FNafm9w3lJerjYp7uPlxu4sj92X6j7DkpnmPfRI4YmD3Ymwa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773595681; c=relaxed/simple;
	bh=y8Mtr9pcqnP0vzscG2RNUti3BiDjvt7BhqDCfc6+Xhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qYXHs1OqmYE39v3Cv0xNUonoCDFNynhqcBsxN7GdncFXhc4iND35HLvxsv5TC47jfQXpdM4uW2luvP1Q3Jo9zBrrBbM9x58MaYBZGiYDmcIdqY8r0J2YYQtGiZcOSeGkLyDI3boqr7qSHCBsRawI1NrmGsYQX4DdzxPb8AW7X94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7IjVq2h; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7IjVq2h"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48540355459so34351675e9.3
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Mar 2026 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595678; x=1774200478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dhH5M5FJNqVSup5S7MKNqMM3K7FwdoGd3zPkVDPQec=;
        b=B7IjVq2he/R/gxoyzIozDS4TOhCTh7tA/GbsLWYGRrUopXDRznIt7PMswdCUQaWC8T
         7Zav6qEKDiIrmBGDD6LV1VCs+MZo2OWSsvEz4uZsmUkPVZWyLJRI9dube/GW7qWVrBII
         OQRvgGYKtlzb/JfbDB70hRrP6WkNmAGhwXSV2G/DfK+RPXDD1gqcOxgUMDQf7ClGk65T
         v6SnNpJviw7xWXAdzNX2a1J8R7qTLVQGDdDrs4f9uKP7wL7m+0sgxEf/PnRCgqtVRWHb
         MZA82adK5DHXIq1KCmVWTxw5FYZ1Ar+Y8QziwfQPIaoX6dpa3UL2Ai2gMbhes6/MisG5
         3yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595678; x=1774200478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dhH5M5FJNqVSup5S7MKNqMM3K7FwdoGd3zPkVDPQec=;
        b=FUsfM4DNa+0BDia9m+yHpiK4I+ZXv50eS68VjOoPtAhp3gOkw8SlZQAYGFkYm2HkLE
         pcXe8yLPVp/6rsmn9Ne4xNuzxGrVIWHj6DGjRupIMLuCETFN69R6faKmPhlNp6eMQOEb
         wlRTmBq8wm/1ny6gSi3vpz55/mHSAgHZWIWz05xgVqnOZm0ahLda4ue5Nc7dIRCb7BSW
         1wdAddeZ1asVkQxl1yby7fbgzKeYI3FtjnRWA7HriTCt1GZbcqvT7EjYvtew2hHFEf2k
         nqthj3XH3EuniSxLTUp7dJ+V5XxYnDG4BT2Sz/TCCj+L2G12hajatVVvG4lBNejZZ9cQ
         +UYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCtFk5NIzf1p2SMrdHjieS68biov646/gPacGCZsSS/DvNnsUpX9kl0U9eT7dDWfRvR6kjopn/a3UnIEpR/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7F8GUjEfRcJCf5b8JVkgF2TDVHiVM1KRBAYvdIt0e7jC77Dl
	Xoed5UWjJ4a1+3PIBnYWaS9Oe4g1alqTeyAuT9rvYdufK3kcyaGSWup7
X-Gm-Gg: ATEYQzw4ZMuEpyPcaGGjWv6NuZ0nevxukAC7mfyPG5OvysKaosYGM4xZhk4nFy8t1hc
	5rVyhEto3LyqJTKAZYJ8MAultWJrXlvKwHXxdB2fQ01qgyWNNG3AFqJn5LLsxgoSitBXXb7xGRH
	ndkAZIGik+ccp/VjZOSUD2MV4x2mWcWyE/ajaL1e9DyGRNBTg+fOb503BH0C5EJXXj1PvmPAw5q
	sGlqTbV9ivuFxXokteqQW91bEplNmG9jC/6SQNJbu72NguRhxtuaMnWkYjHc0j02oCeCDXz1U2O
	LAg0BTWJN3IagpqqbR2zzTtWJ3od/LLZzyUoo+GPTdhxoT4ym4ZyHwJWuDkqxwTRoJRT99nn67u
	AWTB3h39ZLT6WcYqn8Lsc+Kr6TryXcF70v/V2J3AUp6D1a3pDdXH0QhKwhrI/k2PRuWk5uzaafm
	Rj7un1zRkO2esKfWDo5eiXnajAnWCiKeaUdS4=
X-Received: by 2002:a05:600c:c162:b0:485:3fd1:992c with SMTP id 5b1f17b1804b1-485566d2fe7mr159704575e9.1.1773595677669;
        Sun, 15 Mar 2026 10:27:57 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:27:56 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 2/3] rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
Date: Sun, 15 Mar 2026 18:26:39 +0100
Message-ID: <20260315172746.270734-3-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
References: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the Rust rnull driver to use Pin<KBox<QueueData>> for queue data
allocation. This aligns the driver with the latest PinInit zero-copy
initialization abstractions in kernel 7.0 and fixes a type mismatch
with GenDiskBuilder::build().

Signed-off-by: Adrián García Casado <adriangarciacicuelo@gmail.com>
---
 drivers/block/rnull/rnull.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnull/rnull.rs b/drivers/block/rnull/rnull.rs
index 0ca8715fe..23df23936 100644
--- a/drivers/block/rnull/rnull.rs
+++ b/drivers/block/rnull/rnull.rs
@@ -54,7 +54,7 @@ fn new(
     ) -> Result<GenDisk<Self>> {
         let tagset = Arc::pin_init(TagSet::new(1, 256, 1), GFP_KERNEL)?;
 
-        let queue_data = Box::new(QueueData { irq_mode }, GFP_KERNEL)?;
+        let queue_data = Box::pin_init(QueueData { irq_mode }, GFP_KERNEL)?;
 
         gen_disk::GenDiskBuilder::new()
             .capacity_sectors(capacity_mib << (20 - block::SECTOR_SHIFT))
@@ -65,16 +65,21 @@ fn new(
     }
 }
 
+#[pin_data]
 struct QueueData {
     irq_mode: IRQMode,
 }
 
 #[vtable]
 impl Operations for NullBlkDevice {
-    type QueueData = KBox<QueueData>;
+    type QueueData = Pin<KBox<QueueData>>;
 
     #[inline(always)]
-    fn queue_rq(queue_data: &QueueData, rq: ARef<mq::Request<Self>>, _is_last: bool) -> Result {
+    fn queue_rq(
+        queue_data: Pin<&QueueData>,
+        rq: ARef<mq::Request<Self>>,
+        _is_last: bool,
+    ) -> Result {
         match queue_data.irq_mode {
             IRQMode::None => mq::Request::end_ok(rq)
                 .map_err(|_e| kernel::error::code::EIO)
@@ -87,7 +92,7 @@ fn queue_rq(queue_data: &QueueData, rq: ARef<mq::Request<Self>>, _is_last: bool)
         Ok(())
     }
 
-    fn commit_rqs(_queue_data: &QueueData) {}
+    fn commit_rqs(_queue_data: Pin<&QueueData>) {}
 
     fn complete(rq: ARef<mq::Request<Self>>) {
         mq::Request::end_ok(rq)
-- 
2.47.3

