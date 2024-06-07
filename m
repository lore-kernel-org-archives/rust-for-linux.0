Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD29D1BC4F
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 05:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717737715; cv=none; b=bM9BQdEYTAIra73yjjNIp5tFYL5VX+vz97XdOSvOXjbnVAf40wWnhSpbCKfyfuCSgIsd/KqSRM9NJn9pwJRJdRqDy2XeUsiojSh3TylIXEaNz2rkvgAzu5ZmM+WiCVEPMOgCDIRbbvgv8v5PzuK+LGKDSf3x9vZ1nlN6BFPzx9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717737715; c=relaxed/simple;
	bh=aYk2xfoA6YivZbjIXzu4eGpg+pT85XyYUV9vHOIGTAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KmUZ82sMPs5KX7HxhMC+ZOz0F8O17E9pJawh+tqjgxTxjdjAXUEtxSUKbjUBOn6BKPeOnNbYxsLEkX5dQPGoCn1fvAedQhi/x/hLHqcSiPH/h9CgnAwOwmmXHk4Ggx3prknBcMfaTD5KemkCl9Y64R8bp9zwiGf4wtH3u+XYEwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0zuP8sL; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0zuP8sL"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-6e3341c8767so6696a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 22:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717737712; x=1718342512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRm7Js5NCebFHrEbcgyPR1HnEuANZUqfja2CtKxD1Cc=;
        b=e0zuP8sL1j4Tw/kbn0kHYr+duX20ns8MoPS1MPliWvGC0wxlxbWFT37jgrx8fgfZCZ
         MTCsFrXr2GkKIDHfq1fq3dbYdGpjHaxG9rGNf2zGwra5cm/T1zEG6N3X9JF6RRhRvuGH
         z9OvA/M+3S8DmJpJQZ7AnelESeRXAP3xeDTzwZ2Kj+uyB/EOGkuFnrIbmikGb4Kpppg+
         +jolXSahx/2AFjoRST86Bl1VEPI0VA4ZLiVcm4kw79qmtpVYEnyGIKHtQVMMqkLO+wPJ
         Q6MvFmd7XBWPm9UGCU6aVAEkIDbrCkIk5hYlaC6DKCObAmg2qEX7CF3FwW4nJi62EO4M
         CrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717737712; x=1718342512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRm7Js5NCebFHrEbcgyPR1HnEuANZUqfja2CtKxD1Cc=;
        b=SMkw6sxfqNMEqvHUAYRXxTzYcbNecHRXE1adkqix2PY8HzwbCotozbh+3iQDk5zIsk
         0m79fEu8YJ6pcxP+NweX4HPVorR1ffllzcqefux4R2Vy+8eLO0m/lNjxJ2Gp9Vp7TbRZ
         ErPxbN7yeWWzHwP7+YloJBY12hv8wPMNsiZiin6UDkqSdoIqxHWhdkL4z6NUovsdKsHE
         Uad4rXcpmj/UDMFIWEO42hzajzO8I3+OW8aoodSkktI3SsCK8tD2dfl61TlruYO8JQh/
         mHNNhWdwBUvGRIqHkvfMXUu8hU8pegMhrvk1z1HHs4l1hxiEZdTGJ3fNWMQk9QeThFDw
         mA+g==
X-Gm-Message-State: AOJu0YxpL/b7+/PdCSIyHLxwCanSSzAQtE0PIZdoM2+Py1IUL9MDuteU
	q+nqydYrZo9NtiNateF8nt4BAZRuNtI+7OemBpokWqXOyBe+iZtFkJmN3Q==
X-Google-Smtp-Source: AGHT+IG6x0xCxlDFxCDo0Tf3q2ia77GdlW+3a0yIZGFy+VuzqjOplQ08fghfjj0ldkYjW4g4vmOTKA==
X-Received: by 2002:a05:6a20:9741:b0:1b0:1ce1:e7b2 with SMTP id adf61e73a8af0-1b2f9dcc7b4mr1591646637.4.1717737711995;
        Thu, 06 Jun 2024 22:21:51 -0700 (PDT)
Received: from rpi.. (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd6c30a6sm25106215ad.0.2024.06.06.22.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 22:21:51 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	tmgross@umich.edu,
	benno.lossin@proton.me
Subject: [RFC PATCH v4 2/2] rust: net::phy unified genphy_read_status function for C22 and C45 registers
Date: Fri,  7 Jun 2024 14:21:13 +0900
Message-Id: <20240607052113.69026-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607052113.69026-1-fujita.tomonori@gmail.com>
References: <20240607052113.69026-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add unified genphy_read_status function for C22 and C45
registers. Instead of having genphy_c22 and genphy_c45 methods, this
unifies genphy_read_status functions for C22 and C45.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/net/phy.rs     | 12 ++----------
 rust/kernel/net/phy/reg.rs | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index 9b4c4d24b231..ff16d44c7bb0 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -249,16 +249,8 @@ pub fn genphy_suspend(&mut self) -> Result {
     }
 
     /// Checks the link status and updates current link state.
-    pub fn genphy_read_status(&mut self) -> Result<u16> {
-        let phydev = self.0.get();
-        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call.
-        let ret = unsafe { bindings::genphy_read_status(phydev) };
-        if ret < 0 {
-            Err(Error::from_errno(ret))
-        } else {
-            Ok(ret as u16)
-        }
+    pub fn genphy_read_status<R: reg::Register>(&mut self) -> Result<u16> {
+        R::read_status(self)
     }
 
     /// Updates the link status.
diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
index 91f73179315e..4cf47335539b 100644
--- a/rust/kernel/net/phy/reg.rs
+++ b/rust/kernel/net/phy/reg.rs
@@ -30,6 +30,11 @@ pub trait Sealed {}
 ///     dev.read(C22::BMCR);
 ///     // read C45 PMA/PMD control 1 register
 ///     dev.read(C45::new(Mmd::PMAPMD, 0));
+///
+///     // Checks the link status and updates current link state via C22.
+///     dev.genphy_read_status::<phy::C22>();
+///     // Checks the link status and updates current link state via C45.
+///     dev.genphy_read_status::<phy::C45>();
 /// }
 /// ```
 pub trait Register: private::Sealed {
@@ -38,6 +43,9 @@ pub trait Register: private::Sealed {
 
     /// Writes a PHY register.
     fn write(&self, dev: &mut Device, val: u16) -> Result;
+
+    /// Checks the link status and updates current link state.
+    fn read_status(dev: &mut Device) -> Result<u16>;
 }
 
 /// A single MDIO clause 22 register address (5 bits).
@@ -111,6 +119,15 @@ fn write(&self, dev: &mut Device, val: u16) -> Result {
             bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into(), val)
         })
     }
+
+    fn read_status(dev: &mut Device) -> Result<u16> {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        let ret = unsafe { bindings::genphy_read_status(phydev) };
+        to_result(ret)?;
+        Ok(ret as u16)
+    }
 }
 
 /// A single MDIO clause 45 register device and address.
@@ -190,4 +207,13 @@ fn write(&self, dev: &mut Device, val: u16) -> Result {
             bindings::phy_write_mmd(phydev, self.devad.0.into(), self.regnum.into(), val)
         })
     }
+
+    fn read_status(dev: &mut Device) -> Result<u16> {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
+        // So it's just an FFI call.
+        let ret = unsafe { bindings::genphy_c45_read_status(phydev) };
+        to_result(ret)?;
+        Ok(ret as u16)
+    }
 }
-- 
2.34.1

