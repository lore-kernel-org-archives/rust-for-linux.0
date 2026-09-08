Received: from mail-oo2-f34.google.com (mail-oo2-f34.google.com [74.125.231.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC9D59E329
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 20:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788898138; cv=none; b=vEcNAcpqLuUN2rqX0TSopIOMtfI5QDnEOyoDCoxeRzyMGJ+qGGdqrEFb+HQlE+E78m5n9TXsxvzWPYTD81SDCje2ppanKyQorNJe4goi3PNUZpjIkMrJ3CBjA1qmpAYqTIpqDRgWeGENQyN3tVPWd21oDIPZX/GnES4LCEjgFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788898138; c=relaxed/simple;
	bh=/kMit8CUDaP2BflI6bC+09wX3fqJwv8fLnZxYfqIkgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyRy1jd3bVQMQFn0wdM6UmosRj4Rq5XjyYvwGJNi78JYNMI8nLcXrS1k63GLmwkMbDglGdy0cBP6LvLn+OpAWdfBeMlKTcWnVqI9FNwzxpN5keO9Z38kuv09HmGTzy/VJ+ZyjllfsUixfrUGgWmEeW4rD+d8G8TEBCjzx4DyqVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tamu.edu; spf=pass smtp.mailfrom=tamu.edu; dkim=pass (2048-bit key) header.d=tamu.edu header.i=@tamu.edu header.b=GzgtppxI; arc=none smtp.client-ip=74.125.231.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tamu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tamu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tamu.edu header.i=@tamu.edu header.b="GzgtppxI"
Received: by mail-oo2-f34.google.com with SMTP id 46e09a7af769-80032c08611so285336a34.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 13:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tamu.edu; s=google; t=1788898134; x=1789502934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cpZBZiNkX1boADxTuU2IVraCPujz/4cVmGXwbGYdtrg=;
        b=GzgtppxIDL/LhxXRbBfnTCRUpuvgQ9f9hlAu2dLKdN3vqY2Tk9jNIlNX11ACGrSXwQ
         FUNtmXfyRVRbo/qRL1Lxyd8sUb2mpmQzlAP3wHQbClgGDeuIZZTEPnxaogPLzaKJP44v
         kWGsvTNzbeNmPEjtf9J8Lv7Jqpt0kenHQV3zKWnylPYfDwZVajObpvUFJqGAzGTxe/2L
         M9978pleCh7C+Iw58Eh173jQPq9oIbq3KlaBbLeFP+qUVxZoKKQYwDgkyqjUEGNYlaNw
         11tXwDBn6t4e5pyM5pnPgx7DPN7AunkojkjaixANUlA1CnmqO84C0DJG8fCnq419otOn
         tvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788898134; x=1789502934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cpZBZiNkX1boADxTuU2IVraCPujz/4cVmGXwbGYdtrg=;
        b=hW28O5nozxeZSwSn5qGITyBVT0aXiwu3xf5zcmVrVPuHf2S0OPNfDMTMQ9/U4kw6Sr
         hUb2dhVbeQ9kqo/szbESoyGxg1O1oej/2J32R27qI0QjVPNGEefFFAEr+tcnBlzdm43Q
         uqKUIUqi8zYA7RSmM2cc3Y9SssPxuDBfTSeSzKg2jnFq3lY/dnOx+/b/RAwysApd/9L5
         33+sX4HPXSPyx09PKp0rfdMXfgqR1IqJ/LUO1+1Xiy31jEwHhcbftpQOmx0ELKHoPm8q
         XdDYqtdc50aCsXYtWr2EaIfxs1+0aCdQiUDR6aV19qdu7FcIHwIaVKKN7ocz22BjEJfc
         JUwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbjz7/8sXB4sshp7ywD4A/8thU9ne2b2RNwXmOCtsINY/gR2JkHdlM+/fAGKPRmwgwLPDdGpkJGE1zj6/mJA==@vger.kernel.org
X-Gm-Message-State: AFuF++ms548ZeSEDKKsC1cWOiI4qi4lpxEyMAYy6VNZ7bONKb/dPpisk
	ATn3WIS+UR+euruqxu8UaJPPNd9S7P9NTUKJWAMS5a5JuP+Ab4gVHp372BI7nixZOah4GlZfRQk
	u3INHQ76vdxqX
X-Gm-Gg: AYBFou3V8RlPNhxWd1Mt+GJPcKAEwJImOIMKHx6z4ZCjhURBBfVzats3NCant+skmHp
	CPGLHIkfR2m8I9621dLYI4t+UJnyjDC+YyyKSfT18VD4Ts0UxUJM2D0dl+yPMIR4yoIfGQ3l6fo
	xOLJi4jTLrXYE0JG6NUKoWFV9EtMAly7WyVEL7aYcI5hyTpq7YJTPSVnSPTxsIvAZhylst+va6K
	ISlfRzIsYZcaNJx2IOPr7uU9OWKWZSm5ogsgCwkUk5Ls6TxE5yPpQOgh2CNw1PQ2G9JP5v5MmfP
	okOKHo1rLSU8K1oDd9vjt5Z94p/DEm6wpQiaFLw7E9IeJxps9Ob7B/pG0wMZ/cymz9EfhvX5bLW
	4VBUebNcF/QQv9oCkXKoBDQPzZKEBg3l9nt9sWIqfXXjYi6C55fJoGPx8rxSSypeZBr4daiqUi1
	Ee/erkatX5FbJIYd7ELUPMAzu/jaCT3rdJXH3wvRbljWht97Xt9QM8EOCr5odLd+Ao9DiPvLq31
	4EOlvfBmMHqKG95YbdGi+pSX/eVREH6WSdRgZi8tdMwiMjED1N2t8gfkdCdbYgvqzU8+bA=
X-Received: by 2002:a05:6830:3499:b0:7f6:705b:ffe7 with SMTP id 46e09a7af769-800f1a35138mr1966540a34.14.1788898132377;
        Tue, 08 Sep 2026 13:08:52 -0700 (PDT)
Received: from fb.keuhufpvur4u1eezzhu5ttlizh.gx.internal.cloudapp.net ([20.106.51.18])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6793f5fsm17086281a34.8.2026.09.08.13.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:08:51 -0700 (PDT)
From: Qingxiao Xu <qingxiao@tamu.edu>
To: 
Cc: Qingxiao Xu <qingxiao@tamu.edu>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rnull: fix geometry store check-then-act across lock scopes
Date: Tue,  8 Sep 2026 20:08:43 +0000
Message-ID: <20260908200845.405112-1-qingxiao@tamu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocksize/rotational/capacity/irqmode stores check powered under one
Mutex acquisition, drop the guard, then update under a second acquisition.
A concurrent power-on can create the live disk from stale geometry in
between, leaving powered==true with config != live disk.

Hold one guard for the powered check and the field update.

Signed-off-by: Qingxiao Xu <qingxiao@tamu.edu>
---
 drivers/block/rnull/configfs.rs | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/configfs.rs
index 32c10c3f4..66ef91b3f 100644
--- a/drivers/block/rnull/configfs.rs
+++ b/drivers/block/rnull/configfs.rs
@@ -174,7 +174,8 @@ impl configfs::AttributeOperations<1> for DeviceConfig {
     }
 
     fn store(this: &DeviceConfig, page: &[u8]) -> Result {
-        if this.data.lock().powered {
+        let mut guard = this.data.lock();
+        if guard.powered {
             return Err(EBUSY);
         }
 
@@ -182,7 +183,7 @@ fn store(this: &DeviceConfig, page: &[u8]) -> Result {
         let value = text.parse::<u32>().map_err(|_| EINVAL)?;
 
         GenDiskBuilder::validate_block_size(value)?;
-        this.data.lock().block_size = value;
+        guard.block_size = value;
         Ok(())
     }
 }
@@ -204,11 +205,12 @@ impl configfs::AttributeOperations<2> for DeviceConfig {
     }
 
     fn store(this: &DeviceConfig, page: &[u8]) -> Result {
-        if this.data.lock().powered {
+        let mut guard = this.data.lock();
+        if guard.powered {
             return Err(EBUSY);
         }
 
-        this.data.lock().rotational = kstrtobool_bytes(page)?;
+        guard.rotational = kstrtobool_bytes(page)?;
 
         Ok(())
     }
@@ -225,14 +227,15 @@ impl configfs::AttributeOperations<3> for DeviceConfig {
     }
 
     fn store(this: &DeviceConfig, page: &[u8]) -> Result {
-        if this.data.lock().powered {
+        let mut guard = this.data.lock();
+        if guard.powered {
             return Err(EBUSY);
         }
 
         let text = core::str::from_utf8(page)?.trim();
         let value = text.parse::<u64>().map_err(|_| EINVAL)?;
 
-        this.data.lock().capacity_mib = value;
+        guard.capacity_mib = value;
         Ok(())
     }
 }
@@ -248,14 +251,15 @@ impl configfs::AttributeOperations<4> for DeviceConfig {
     }
 
     fn store(this: &DeviceConfig, page: &[u8]) -> Result {
-        if this.data.lock().powered {
+        let mut guard = this.data.lock();
+        if guard.powered {
             return Err(EBUSY);
         }
 
         let text = core::str::from_utf8(page)?.trim();
         let value = text.parse::<u8>().map_err(|_| EINVAL)?;
 
-        this.data.lock().irq_mode = IRQMode::try_from(value)?;
+        guard.irq_mode = IRQMode::try_from(value)?;
         Ok(())
     }
 }
-- 
2.43.0

