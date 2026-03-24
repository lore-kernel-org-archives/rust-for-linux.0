Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4101637BE6B
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 15:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367594; cv=none; b=Dl8xSkjYU4RSsgMa3gMAinkbZFLkvIuMNHpZXKA/bECMVr1l8OSOdJToITHIuTC7ckpBqAJchrv8s0O1vZ0o6XGM4JusGhTLWMxIS6Fdc3lRHirkBI01HXyH9KbntosuZqnh/UslaJ0wnGn5Ag8Mit2dshFTzNbJ0cKHDdFny14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367594; c=relaxed/simple;
	bh=hrrNL+56mppOvmFvbOeCemjCcbpv9s0ZjUfDxVxrYvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ojU+mseHCLuTqaK2Cr1aeOS0Y5UMw/7bladyD+Tt4EAxdUXnSAu5v/AHeeUDGZX2+6m+FxPm3H2GAtK/helLEa/L7hpWOQWQkv31nd9PoZ7qq/O2lwPK7R0em3exOmZDMwlda41owbp5KpqEWR6MFmMyxTbpcaPbT4skyjeFt6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmYXnpOq; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmYXnpOq"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38ad26e3992so10484891fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367591; x=1774972391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88dwbvAjV65wqRTN/ZNYuvXuh2RhGbEcaTfrEwVcFKo=;
        b=jmYXnpOqXFNwfTIc89JXdtbNKwB4L118Qu99Zf3or47iIeW6WoabnuFDHhgJRx1fDJ
         FxBkulUPjPBxZ194fq128g96ZiXTqIakccgBjZvTsCuD+IfmCzT+glZdIHdWw8bgmB4N
         XbC0o7lmjaRoOHew+7GY/j7aiUOBGUCyrV6zCbmfqqoP0p7adec4F435K/GrrGrxZK0j
         qu+kotq6rfVmtuPY7w5AFlp7PmY3MFPyQqoVjp08xH8XX5mN3XQo3aDLaxWb6JQsXAKd
         6FfIB9m4Ev45oEHf1y+Q7hhSMqifZwRzWKyyOPwxp/Cq/B7SpXe95n3PPzspv6mBo0lR
         tRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367591; x=1774972391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88dwbvAjV65wqRTN/ZNYuvXuh2RhGbEcaTfrEwVcFKo=;
        b=ll4yqhmnyvsxA/rahPrC9n3VB7f/G47SKsBKSXGQ8ENyqPEw3KByWSMMT4zmOxU278
         jneE0wWny8ZGkDG0hB17czei7IWlKK0nCtHr98VUnUaaCGIeUW1TyajKSBciin3felU3
         +JxOBcW+uwUxw+fcQEW1aCoHAeFqsiBF2cAr5mZ1A21rP0eoogR7Y+XMBK3XaHfTLBcK
         e2+7krrFXc9KOJPxyvFHVjeMQfL/gPkICpmTVUUXwa6o9aH1Cpg4ty55LT6QKbmRyyxN
         Lf0oePwlXJm3WO9qMBzO2U3k9jXFg+3CX3VIdNN1+RFo13hOQG0d7usJj76ctbTf6gUr
         iSKw==
X-Forwarded-Encrypted: i=1; AJvYcCUTcRwddA4C8e+s+NTwsoUaurLlMqnkW/8DjeNMqyg/yTaJ9Vb7Kc0/6GH2aX65gfqG5O9StD1GMEgq4yNXiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFMRaSz+YgwVav323r5vRuLkfZXhL97Px1zcY2uHo/HWyWlQv5
	WQ6TPJwXuRxsPS2+iGbtgerBUPOgRGdZjYZEbQyuoYNz7YDiM6sIHTbN
X-Gm-Gg: ATEYQzxkp2Zu3YEgvfQYR0vwKwWuXH/8jI5epUhiC37wtdfoTKHqkbV1X9MwvQXnx7U
	p4GOw98RevgO/4mAC0mqrsCTXlTYpl+B7otcjeXHPLVPhN6z+Fp0U1/2wqIN9AYHjqraN6doCkj
	fu+xyvFEneDxx7cBgSJlIG5ER8hDL/HuVRe9lbDsHHDb4xw+vqCJrt1TYHIviNqDCupnCE0BjIy
	+l3cfPJcbUWduLHvRmD7lNbSBNA7bC4eIsI3Jde44d6N17nyLF/gWefNqGQF+538vgD9pUFbaRA
	O3uCiox3mZDz7JBGEvjFXK8iJmjgnFr132x5TeA2oIMjzVGvMIE9ARcsAXZGUm7oAB9JAgDt0tk
	1FfNCzdjr4JIJfHHUJ3nBrffK8/TzdifFeMG6+yC/oDv03Rq8JVf0+eMuPC0nVSb8PvdPFmk4MJ
	9Q/J6+m4Xfa7+oyCMFMxqkjaIZwbFIZoRhFZSw9/rdlzsGo7QLZJ4mFKo7WVN7hupfLvYwM+P6M
	TAju+la0ke5vedNPw==
X-Received: by 2002:a2e:a9a4:0:b0:38b:ffb1:4b5 with SMTP id 38308e7fff4ca-38bffb105b5mr47405991fa.8.1774367591159;
        Tue, 24 Mar 2026 08:53:11 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm32567841fa.32.2026.03.24.08.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:53:10 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH net-next v2 1/5] rust: phy: add read-only device field accessors
Date: Tue, 24 Mar 2026 18:52:45 +0300
Message-ID: <20260324155249.15098-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324155249.15098-1-iprintercanon@gmail.com>
References: <20260324155249.15098-1-iprintercanon@gmail.com>
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

