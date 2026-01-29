Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DD4261388
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 03:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769656059; cv=none; b=KeMhveSLZol5fiy2mhgobwTnphdzRvDcUUBLZvESqaZDawrSBO85Q2ggThwIASbOWWbGBfii3XTndG3yvajjVvzM3F8Mz5GQTvy2J2efq5WU6sKRT3pRTDSjHPw0kVDNd+BXnETZeNjfJ6Pz4fABBbCuSf5Kkf71K8V1D5ShZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769656059; c=relaxed/simple;
	bh=D5HvBwq9KBBQtckyDJ0vATtGRTcFt8eQ11FoGa6LSMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cCHKRB2+Du4t3SFMMKXi9CWsKYUsThgX/nVh4zEo7xyMp5ctphNGrr/dpdHe7xfnjdVtLOcF5S9KzaWCCEfNyw4O89OV7gAz9EhtkJkCkaEd4NeQuvzY7jYHmtPGuqFA8mRhdwsZhohKcW4vU90N/NtlPQNUh5pHyot6kbBEd5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSRk3aFf; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSRk3aFf"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124a635476fso733876c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 19:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769656056; x=1770260856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idXYF6OFRh6A7qWjhos4p7dP5Z9noDDpuntJy2Lqy8M=;
        b=RSRk3aFfAz2AuqzfDRtuYjC3W5nKLI8HfvVaBvYtTKQeJh7DZjKHGKCMrcUDWBGhiO
         WmODnN+eai5a8E0eRlKasM8Er1FGFFONBPK5o4PDEURUs86jxYoEQUZJxcvw9TbZdshQ
         hjFukFeISdM83t/h3Au4JafG74xOO/ND/Qp1MaJAy0LPkKfodTNBpz815jfWIH6yq9Hk
         fxuCYT4Kqsm7o8Uut+4+HfXCxNVSc8Rz8dUmRoVVFCc7248IEM7SrNHGhQtC93y3LWPn
         lPJXUGdtoYzX3k7CiaX+fBKjVjmAVasmmONaUmn9RbKp863llQ/dwfBRVo+7gB/gI78b
         lHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769656056; x=1770260856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idXYF6OFRh6A7qWjhos4p7dP5Z9noDDpuntJy2Lqy8M=;
        b=W5AmK0ImNVF69hkfiaA1TwVReANod1D4i5ba3zvbZWgVfBbnJ34pZvtM7PQ4MSRnA0
         kmDeVGFabgcm8+3fhByUxtcVF/mlXZ8p2HOEiKu8mRQayPfIwNuynCnSHWyL7NcrmMZO
         wPutfmwjaE0J1CkPxEWD6/A+yN1J7KB+NvwSqDI4/iEhYfXftJ0HgiF3lIuN5ba52REt
         ngDDjCZfTyAgoSQ2Zo4VUIn3o807+RUkEDk+zn3U4lUNVBQHeRSV3NtR/MO3zlconp2y
         bbfI2CHJr9NS39VF1dXKWevTX496l0fUaqMdf8tz5i2SDG0fGLQSLCWObmB/uXiejfKT
         mFPA==
X-Forwarded-Encrypted: i=1; AJvYcCVWXv7CYn3tNb3BDkhdTUo2xfE9QCcnkl+U8EbQOlYLh6YLYAVpB/hnGPPMiyq2PbiCDtN4yQpJkULIy8po5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxMG/WjChKbJqdUEm4RGFQgXsxmhfYjza1OAlUqv6COgkGjI5A
	JIycpTo96jFaKXUKUB+luQ0jDp1cwKAxjMHyedZBlalr9WKbui9lD9jJ
X-Gm-Gg: AZuq6aLRqOGt0GEcMdAUsb1vToRHnaW/PIFyXdBfrAx07kzX8xDxPacznwRL8Hw9PNo
	ZkUFPxohJRkv2IpfOMbPjXx8j/xpe6R7bHHlQIAsmkHF83R+G58EOGrIXCpxw3LwDfvtL3C8npC
	4KCmoAQt2iMfE8VP15fokjdNCtGFLoeHnctE+e86Bd+vn75qcgKRt+owxLqCZ1UlTwT/1CeQ+lk
	+h+mbJ+MGdSiO9oa7D8UIoc6zgvbrFAb/2skMri2qmFV8gbaOo+e14OJEQWBhGp9GPcFwX0YzS0
	nLtJm2idv4mJONQrKJPDtegxfixDM/J9oaqwzoCBt5dw4v+/E5rLe+xG04frC4uWZV8rfWkpXsf
	SlZ5wgR/BeYYZnlG97rHotAUUOMba2xCiQ/B/7hzzvQGPryXZ0rZy0fa+ediamv27PGvZ0FB7nR
	tq90ON/OY2rVPrxsbbMC9FIRW9d5iHahq9TxPnnwsp0NPi2xczAk3N2pI/ESnpLAL+rpcWa42S
X-Received: by 2002:a05:7022:68b:b0:11e:528:4185 with SMTP id a92af1059eb24-124a0119a2cmr4602564c88.38.1769656056476;
        Wed, 28 Jan 2026 19:07:36 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:4e1:6e5f:e09f:d45a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f597sm4855682c88.5.2026.01.28.19.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 19:07:35 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: lossin@kernel.org,
	boqun.feng@gmail.com,
	aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	linux-block@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH v2] rust: block: use pin_init::zeroed
Date: Wed, 28 Jan 2026 20:07:32 -0700
Message-ID: <20260129030732.1072223-1-jason.kei.hall@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual unsafe zeroing of block structures with the safe
pin_init::zeroed() helper.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1189
Signed-off-by: Jason Hall <jason.kei.hall@gmail.com>
---
 rust/kernel/block/mq/gen_disk.rs | 4 +---
 rust/kernel/block/mq/tag_set.rs  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index 1ce815c8cdab..649c3d9b1ff9 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -106,9 +106,7 @@ pub fn build<T: Operations>(
             // SAFETY: T::QueueData was created by the call to `into_foreign()` above
             drop(unsafe { T::QueueData::from_foreign(data) });
         });
-
-        // SAFETY: `bindings::queue_limits` contain only fields that are valid when zeroed.
-        let mut lim: bindings::queue_limits = unsafe { core::mem::zeroed() };
+        let mut lim: bindings::queue_limits = pin_init::zeroed();
 
         lim.logical_block_size = self.logical_block_size;
         lim.physical_block_size = self.physical_block_size;
diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_set.rs
index c3cf56d52bee..dae9df408a86 100644
--- a/rust/kernel/block/mq/tag_set.rs
+++ b/rust/kernel/block/mq/tag_set.rs
@@ -38,9 +38,7 @@ pub fn new(
         num_tags: u32,
         num_maps: u32,
     ) -> impl PinInit<Self, error::Error> {
-        // SAFETY: `blk_mq_tag_set` only contains integers and pointers, which
-        // all are allowed to be 0.
-        let tag_set: bindings::blk_mq_tag_set = unsafe { core::mem::zeroed() };
+        let tag_set: bindings::blk_mq_tag_set = pin_init::zeroed();
         let tag_set: Result<_> = core::mem::size_of::<RequestDataWrapper>()
             .try_into()
             .map(|cmd_size| {
-- 
2.43.0

