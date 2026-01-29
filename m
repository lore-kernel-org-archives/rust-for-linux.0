Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F73356A22
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769655248; cv=none; b=uEm2PKDX7rJ41pQUP4S1GAReLiAwG5poEdhmaiaj+jDdIywC/A5cbIAdyk+j3aho97DbaobJHXwB5VCRfqj5uK5DeJicFlDceu1XlpCJCUnkDpJkqPMZDIed9sRF0L8B+9TP2NaMEq+jCAm2VwZ9tusfIF53DfBfNCLipbkm1uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769655248; c=relaxed/simple;
	bh=wn1m+br1TBOR784BJGjVu5s+038ns3FcvJsywelK95E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9o0Tr11zftUsyinO2jKCsXy6jowejcHjX7hRA//H2cfP8L5hgv59ujaR/k3rPAh0oSHXRUwXd5vURPsZeanllrfowoXLn7sx+emc8wN+tZWNb+8XpU5bFrruHgUO/tPADTJPrSLvbxfnuo4ac61uKlMM0nvnpO+ZE/fNJ7jTEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZBg5v8V; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZBg5v8V"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124b117776fso394489c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 18:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769655241; x=1770260041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTjwIP2vgqxu7fxZeJC7bZQdu9aLDDe/pDZwtRq1Pfs=;
        b=XZBg5v8VL41X7mxNImL2N4JDtGrh5qYc4zGOQ+eAgVr1UzH0J8QLsRftVeHecvW0+Q
         9Ao0a6t3uS25AOk+5GjYjjcBvrfRLsmTDMe+whRDkuefBCRid9zm4haAzDIUWNypZ7Jh
         R23+Z5wie3pq+bAp/8YBvjLQjD5ZlyIeqPhjHHSd2DTmoD1JfLzd9NUsjW6K+0ovvdj+
         Sb3wmjA4XSNWhiwFH9pNmhKYf4raNGLaYU+QfulUwhOUNvFzIWlXDk0KX7BdrSzgS5fU
         HoYSgoxMQZ9ctKU9SjBDGdS8UoVJjklsg/iVWc+c38DhmIrgVanfdDSBQ+M+Ked72ZI0
         jxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769655241; x=1770260041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTjwIP2vgqxu7fxZeJC7bZQdu9aLDDe/pDZwtRq1Pfs=;
        b=NUqp6dzpqBqlAp2G+XOF4HqKMQR+yZRZ3Z/40EgxFpTINmIPtuccHtzjpE+yXBHjfq
         N39gQBjvxDJ2DZZ7MPKZnrd/V5ywLscmiyvs9p1JqWjobHRLZisGckqZDpK8DwSJ+rsb
         TjSoinRG5cwcJ3OXrilQ2hHlo2nXgoVDTFH8enc8ocvQDDuIzq2wp6svHCoFfxiptKDg
         djYpkL7Vr6Wukzzs5miVWfdm072BQrVKfyNfz46DQI1J7iQyMosKIt1qAE/ts4rKLThs
         NH1Wp6Pbk4wV0tAS3W0PxgTKh6m/Mbsh5SKiyMZprqArnVsAADQVNDi9Q0y6EDqbuSjy
         Ifog==
X-Forwarded-Encrypted: i=1; AJvYcCXXishBV0xUa2JzF9zWzqNkGwuvk1XlEB5Gnc3ZDToEOAq9aq2o9HsHmO4g+8GLEtc9P5YR742afO3DJ0hZ0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6SmL36bqdM7llOtJ8iixmvXu9YYMyJkDp8J/s5XB8YyQDm860
	I8KewVXiPCJYYare3dLtQoKEQQSNYilwmUo29+R6R4mH4Tzld2+1eZfnzPCvag==
X-Gm-Gg: AZuq6aLXeb1xYnV7XU7DTKgbkmtX924Mt2zhFHQYEmjhQo2eTS8kTi+2M5XV+JQMbee
	wljq98Teeniq0+tI+wRLVcjzJ9vqL5kzVJmOpTIOdNQIeVKpCPfuYSUnubApqRhrBeoHVpI1TyT
	ygJ2KB7vw8HFplcE7Q4kisgMEaBejZinGcLnVIDje2lgrMY3ffYDpKVrHz0HtQazH/JdD52ehr+
	JtqSDRaKKpPB5nuHPsm2jyWGHUmWLiOfnwtHfTfd6Lemg62KyoYeNUS3Fow9L7iC//A6dJf/fNz
	onpsqE3oIBpFBI2hD8zVEYUmhr9LocOeDlx9teEb8fbgF5r3BIL6g1+pHXu6v1qCCo4WcoGt2Fp
	bYwsaHkAdFbf9Noxw7fHrfdn022sSYl0DZGHbSY80ztWUBCewYYBXLwsO6pbFecsIh+puRQmqO5
	dlnbIhfcEsapQY4QGBlG9eCEsBa9pCmwNKRHYb5/Rtu8JkM+UeCETy5AvfGmvU8RDQGdOXQDAd
X-Received: by 2002:a05:7022:4399:b0:119:e56b:98b8 with SMTP id a92af1059eb24-124a00b1ae1mr3452454c88.31.1769655241339;
        Wed, 28 Jan 2026 18:54:01 -0800 (PST)
Received: from jason-hall-A520-B.. ([2600:8800:41a0:8000:4e1:6e5f:e09f:d45a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9df97d0sm4850753c88.13.2026.01.28.18.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 18:54:00 -0800 (PST)
From: Jason Hall <jason.kei.hall@gmail.com>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: lossin@kernel.org,
	boqun.feng@gmail.com,
	aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	linux-block@vger.kernel.org,
	Jason Hall <jason.kei.hall@gmail.com>
Subject: [PATCH] rust: block: use pin_init::zeroed
Date: Wed, 28 Jan 2026 19:53:55 -0700
Message-ID: <20260129025355.1066511-1-jason.kei.hall@gmail.com>
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

