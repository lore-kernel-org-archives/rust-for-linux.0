Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050B833FE27
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 19:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773775986; cv=none; b=dHrbDBI0tEp9imTVMb6jLl0hJjy6wPiCTnA12I1l8QiQUYQ8Ngllo2S8m8tyYNnlETlL1Z8KiVpbukpySuqlXhp2C7tTPOoW6z3LmF+mGlAHaohSCzs8wb3TZ1ksHFLRsWYADLjivqRqiyZsjs/b5BHEG77wIBguNZMKz29wqbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773775986; c=relaxed/simple;
	bh=dqp1zvmx65EDKVVEH6MHWp/Qx+PR2wL3UG9MY8FVJQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XawNj/+cnUaXtpiQk4JH+jqm73a6OXkx9cqnKRr28HH4FBERTPl2BAf0+4jAay3F5FMJEYEdftcR1wFaSfbkHXs/kMRwxhKy4prZCZrY0/km7FXW6ogwuoZULwAPEP+dV5CFLCm61qIg4iofbgugM1TqXjN6w+yYvcpBkXNfUMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhL+DQxO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhL+DQxO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48541edecf9so66935665e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 12:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773775983; x=1774380783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hglc4bApGbsTPm3VNAsufBTglatoDFtPjLPG0pQ/WOA=;
        b=hhL+DQxOPzN+IH6Jd7pet6G2VSbk1lENSofHr/BDEzptrrmmURgMhXh1tX16a/RMse
         bBzbpitQUWILbRNlt5ND9nQFILWAdB6FMC/q7mhEWbIro7sQAhFrFUCMAxZfDxJFB3Y5
         b2/QgTb7oyZYHHnsHpnqYBZcct5RidFWrhuJ0G6OWdmKJvq1ZF0f5YEjM81zCwhokDzi
         U9tSWTA6IuJuha7/4tP43KFu+zUsCb8asMk8oO1l6NEe3oPzjQoaRlpd/H3PSIemidaY
         SsDPgfgb+p/A7/dVtgZFpCMBC10BynN9vHi9bUhHyOKkkGsrZ8S4rNjblw4DcWuKFqWq
         dqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773775983; x=1774380783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hglc4bApGbsTPm3VNAsufBTglatoDFtPjLPG0pQ/WOA=;
        b=ANJuIVDUpP0C4Hohv+w9EH+QfoNxVNt7g46IhXnENNbjrenikJZaJntAxnt7JTqUJH
         btBqZbSG674nizFCyZu8aaZKI8LsEAHEwPwsIPU6tIAMdTnuzR59MrxziCNqb+/KvT8w
         bXNO911OBWGH4/QMDoHMKAqNv8+rgLcWsGzAznTWDYHymF7jnAt/dNYzJoVjzjV2ZOXv
         VdEljUPVBuOHrk7IhWli/JvqntN/X4+CD4Ld39CRCFrNpRoAyJVf9dPWyF2L3xgPCzxX
         PGENsG8mG8UqWU0pqVQwlOJhgZQX6EwBwNwzEzD+kv4qQzpClzsWsEujdqatjR2bWUrm
         K3JA==
X-Forwarded-Encrypted: i=1; AJvYcCWST7ViX80VRlFZXYAqQ4bSOa8RV0j9A0kAp1p2fkVcQjpnv08pwF5oVkOcS1870HFx5hdvHbgWi/vU/+fuDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyG03UmPJRNIvlemogfnbdWboiOMRoJv1o9dObzYqdT2w6B+dAB
	Bm3bt4o+l6NUlqv8EHVLCd4hqLWYjuSXZCwHO/BDDFJNLtMWGLTaM6Ko
X-Gm-Gg: ATEYQzxhGyCS5tBnW8H21z9qF94uvhY3ILEu0SODC2jztNKrRtjOKvNfGPT0RfJ4WGf
	2ve2ck7YsB2IQ66q/7r8QFdO9OmklQbtHl0JUjgsMLP8CFdqlkOn9JDI19rjZlm0S70LHxYe1MX
	SH6cGfELs/qCMUqkGFbz2do3UNMDfcmbOLR1w5Aab6DKWhnVMXs7aXYKiG3wSMkl5dkJXBwGNTV
	1XDl1tx6eFUQ2PguTGzx18j34etml2Dg9i0bZyI0ozcsPCsvdhCDZgYxK5+6EHILAJAAWyBrS7M
	LMcH7NJzY8bQHU6d76aHnnw3OWi/e1UsK6I2NG61uLvkGSKtUJs6DUzZDvcmbhxOIpHTkm8qy/c
	CqHuaoKSBl4dJAQiclQh31x9bGdoIh1wOiOuNF3DqXSiXsly/G84mHQWLLnGYrAN06VnLjs7awp
	nY4JIlRtkOt8YlBMqNwEsE+ULjjSjNVYwQug==
X-Received: by 2002:a05:600c:34d5:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-486f4457b0fmr12446185e9.26.1773775983122;
        Tue, 17 Mar 2026 12:33:03 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac93sm70833395e9.2.2026.03.17.12.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:33:02 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: Boqun Feng <boqun@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v4] rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
Date: Tue, 17 Mar 2026 20:32:57 +0100
Message-ID: <20260317193257.13848-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Utilize the pin_init! macro for QueueData initialization to correctly support in-place initialization patterns. This aligns the driver with standard Rust-for-Linux pinning practices for driver-specific queue data.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 drivers/block/rnull/rnull.rs | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/rnull/rnull.rs b/drivers/block/rnull/rnull.rs
index 0ca8715fe..11ea0696d 100644
--- a/drivers/block/rnull/rnull.rs
+++ b/drivers/block/rnull/rnull.rs
@@ -54,7 +54,7 @@ fn new(
     ) -> Result<GenDisk<Self>> {
         let tagset = Arc::pin_init(TagSet::new(1, 256, 1), GFP_KERNEL)?;
 
-        let queue_data = Box::new(QueueData { irq_mode }, GFP_KERNEL)?;
+        let queue_data = Box::pin_init(pin_init!(QueueData { irq_mode }), GFP_KERNEL)?;
 
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

