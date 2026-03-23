Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F539A7FB
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774297191; cv=none; b=TbVWiimoYwvRNEoXAgRB9I8Ufy7YT7w4eYtUx4U8h9rPUg01NxbU4Sgz2NHEq7ezJYCsw7TZIgLKufj+g/cn6gzACounaH2GW6Xv+4yur7poJ5xJTD75udzmUywtC9X12GbHc2uEWim3EhzNIuTH7sDPdoGWRZ2S5UugbL+52UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774297191; c=relaxed/simple;
	bh=hrrNL+56mppOvmFvbOeCemjCcbpv9s0ZjUfDxVxrYvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sofhC5ncAANzLRmKLMyPva9pCmlPKEMGOp4nUT0irSo7ZhcIl7F70DW7rViC/+di6Usqj5EoGzTIr1qGFnXOshFTTFX2jQVPuKwukkC6H7cw6d0RMBTYR5PEUpucE2SQXOKqL7LMBhz5CNtqsV7fCtU9GsqA8XnrumDW1uyHPmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nz3EmZRj; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nz3EmZRj"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dcdf60427so554780e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 13:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774297188; x=1774901988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88dwbvAjV65wqRTN/ZNYuvXuh2RhGbEcaTfrEwVcFKo=;
        b=Nz3EmZRjXYEFPCjKTRBiWqgc/Y2SZEddUCXSvmAW9w/hPD5FmYMKp3K1Ww5DkBrBx2
         vEWY/a11vLzs7i7WgZf3z68aHbKyfwJt9eyVXof/CyywWi6Bjp56EPbtFr+LqMs0+CX6
         IyfztQsRsxEJxB13nM/GWjrZXO1FARNJLDrxGjoEs28QmNAPQCY65AETbSD8cqZwOcw7
         xPADmOoO5pLEFPe/IBhaz8AmWGdFn3RUkG4z5oLMXDFKeRYgmhExocBIeQ5DiwrdLKnr
         ZNabAJHNvncYvGglefb0I5B9Sz9e7SsbUyIKa/lXELhLBlIUWKYTjm7YnGWg0y3lY/Mq
         ATCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774297188; x=1774901988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88dwbvAjV65wqRTN/ZNYuvXuh2RhGbEcaTfrEwVcFKo=;
        b=ml9I+Cxy0q9UOboT+5J5iUmH3KXbZGgXwdIv2uJ2/WRU1U89mAO8ACuFkWCSJ5cA9/
         Q/YsqCShPffZml0HvboESbhWJvZdHp/k9u8JLvC4dOSXYXxwYCcvDLjAbI5bE3pIpOOP
         aRGyv6I8clvFWrqDv54cl/46qnWPVGI9M1vfY1sPRsZbzd/N8oKh3ISd0EHsj/kMGSZT
         O21a2+PcKNb8r/zbJI8iywCt+mMM0lGJmpOZfnF0Pc/0c+gDpwLFHYiU5vtjPPdm+pnD
         SN936vU4NzFC+Xy/52FwxqzXepPWtH5U71vAx5mpuLsrjOcIEJuNTnYf2Jcs84hn2omM
         EeKg==
X-Forwarded-Encrypted: i=1; AJvYcCW6QtAH4lTkXp6ASy3vTi/T4bacNvKqzHgKN481WNCHTiYQ+8nHpqtIGcFNp1wNeRPv5ytKflCai3zFjj4cLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhtLB9U9nGEaQCb+z6GLavELMVL29cBveahxH56JCjo03j+LxY
	MyDria6QfaZ6v7TVuVKgN8K5SubAoVeWeRiLDnU3xBNSt1EnpnA3WOWw
X-Gm-Gg: ATEYQzzGvLITYFAtQHx1Sknt00PsNGlpN5gSioFzgjVPtQsB1l7Hgp4XMUt8npcqnzS
	7jC2U49nTMd1vRBmxOOIsGt1/2Ku1bLeOiUoZWTgFjpwP2IvylTxuuRAW6byA8TQxFBRY1xdJYb
	LaFFGhfqW5kg7oXLAxO3E2dx4NDZTzw85OYNHw5ae7b84nfLIou+OGDJ+vus7y9p+uxf1+XE4BX
	oX+SyUNIHsfGDheCjxwNkd8b+AmtBvxAsWaxvmA+u050BKNmV1f7XHp70eu+zLw4V+HPkHI+1/E
	UhmQrPAAl2jnueZVAKDvsirHkukho6ZpM+4jC1ZYbjSjnTQS/KnsIN1MKwHZgo4FZNZd/tDe/SH
	5G+xh7b6QB7qrw8uMYjIWlTmixl7Eq0HTx2ExxKaiWEz+jSIaVXtmUmp3pebmBfTg4haoxxkQAt
	QVkdleGAu74mBrWC73+stSZeWpgzQUEN3zvk0T5OcQKK7hirkO4qoPS8i35ct51KfqyPtX7aGzo
	+N/56YL7e2PbPPJwQ==
X-Received: by 2002:a05:6512:3ba9:b0:5a1:407e:1207 with SMTP id 2adb3069b0e04-5a285b910bamr4659921e87.38.1774297187905;
        Mon, 23 Mar 2026 13:19:47 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207365sm2720623e87.42.2026.03.23.13.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:19:47 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH 1/4] rust: phy: add read-only device field accessors
Date: Mon, 23 Mar 2026 23:19:22 +0300
Message-ID: <20260323201925.8405-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add getter methods for commonly needed PHY device fields:

  - speed(): Returns the current link speed as i32, matching the
    C struct field type (int speed).
  - duplex(): Returns the current duplex mode as DuplexMode enum.
    Only the setter (set_duplex) existed previously.
  - interface(): Returns the PHY interface mode (RGMII, SGMII, etc.)
    as a raw phy_interface_t value. A typed Rust enum is future work
    since phy_interface_t has 40+ variants tied to DT bindings.
  - irq(): Returns the PHY's IRQ number.

These accessors are needed by Rust PHY drivers that must inspect
hardware state, particularly during config_init and read_status
callbacks.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/kernel/net/phy.rs | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 3ca99db5cccf2..646b2a78a2710 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -179,6 +179,47 @@ pub fn set_duplex(&mut self, mode: DuplexMode) {
         unsafe { (*phydev).duplex = v as c_int };
     }
 
+    /// Gets the current speed setting.
+    pub fn speed(&self) -> i32 {
+        let phydev = self.0.get();
+        // SAFETY: The struct invariant ensures that we may access
+        // this field without additional synchronization.
+        unsafe { (*phydev).speed }
+    }
+
+    /// Gets the current duplex mode.
+    pub fn duplex(&self) -> DuplexMode {
+        let phydev = self.0.get();
+        // SAFETY: The struct invariant ensures that we may access
+        // this field without additional synchronization.
+        let v = unsafe { (*phydev).duplex };
+        match v as u32 {
+            bindings::DUPLEX_FULL => DuplexMode::Full,
+            bindings::DUPLEX_HALF => DuplexMode::Half,
+            _ => DuplexMode::Unknown,
+        }
+    }
+
+    /// Gets the PHY interface mode as a raw `phy_interface_t` value.
+    ///
+    /// Common values include `bindings::phy_interface_t_PHY_INTERFACE_MODE_RGMII`,
+    /// `bindings::phy_interface_t_PHY_INTERFACE_MODE_SGMII`, etc.
+    /// A typed Rust enum is planned for future work.
+    pub fn interface(&self) -> u32 {
+        let phydev = self.0.get();
+        // SAFETY: The struct invariant ensures that we may access
+        // this field without additional synchronization.
+        unsafe { (*phydev).interface }
+    }
+
+    /// Gets the PHY's IRQ number.
+    pub fn irq(&self) -> i32 {
+        let phydev = self.0.get();
+        // SAFETY: The struct invariant ensures that we may access
+        // this field without additional synchronization.
+        unsafe { (*phydev).irq }
+    }
+
     /// Reads a PHY register.
     // This function reads a hardware register and updates the stats so takes `&mut self`.
     pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16> {
-- 
2.43.0

