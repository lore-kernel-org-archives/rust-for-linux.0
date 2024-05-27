Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF2264D
	for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716774423; cv=none; b=KpP3Go+sDyFKmAdG9APXlo9GlmVxmeupwpTGkJatPxAB43nzkWNN3Y1RakjSTuZ/LtGRoZ2Fk/MPNmFzGkQPJs8mYmMnYLS5p1X83qPJc/w42WTsTYd1TvltwHRdloRqUP4ZXUpoZS5iDI1Bj/0Py9MT33v0mfvw6W21cN1z4NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716774423; c=relaxed/simple;
	bh=VxzKzTgIMiGOsHlLhdyq33MiWvinfAFvUm3hcNwFLnA=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=h5W6D/Cx2x1r1dVgIcsHdHO/EWG5YH1ZZWqaQV+TkBCfgDsSujL1uxtEkVFl0AxHwqihM4G2W/ZXE2RJHFLIWwfmf09tH9OxYu8ddco0e5I1rVHEsTNN1n03qX1XwkYBdzRKpaZcfHxzQPEXgfnOA50y6tzVyacgHrGB4Y//axY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/uLVQvo; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/uLVQvo"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2bfc0b5e06fso108864a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 May 2024 18:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716774421; x=1717379221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:from:subject:cc:to
         :message-id:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q4FFJvhqGlJIW7hZ4ayMdm3DHX2K2AoIhnxqg1XTK6w=;
        b=k/uLVQvoAbemUNimX4Qzff5E289IwDe4TR1zmLNx0zRSAmsymcIjFLS7ed7qOfU95m
         yWZUdMNhK5jtHXFh0kzOqFhnPUiuGOfYbIBRH11FfiDj5a1T+sU9F35tCgGMmfCziBdS
         fuibDrlQTMHva+tvCsZTRpkg1kYqWo3teCs1qrfiH7noVQ7cHhyMtXGRMQ6vnPhNJe+g
         Uec+IiFLH6Ho4Z/YDknqlVBltWTdc/3rrdePU20ARU0iq6cV8SWf7++6kc5e2/VcGxLW
         W9cypSBmr8iF9ryoUyD0kL0FalmmWUk6cytxPCcFkdsUbppRVKRdIu2cEEIZsl+nJIMH
         yEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716774421; x=1717379221;
        h=content-transfer-encoding:mime-version:from:subject:cc:to
         :message-id:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4FFJvhqGlJIW7hZ4ayMdm3DHX2K2AoIhnxqg1XTK6w=;
        b=uoXGmXDXt2Ysbue3cvakR6Cvf7n4Ul8LB/f1CW7vgH0U0rcZEF9eI31EUSDr3ZNEqx
         vGXoyobPMgvCg5bGKdWl+E70GQmr1M/PUsGOCowPQhTJCoKL/yO3Ohr7qmrzCz58zFAE
         HtVjp92D7cVN5g80kXPTQ0tiI9v+NMjSbJXlbk1nRTxwrLkblDrCXorESmjLyq4VBOps
         Z6jqW23L7tIJYwOALOsZzIj7+nX0LqNQ8UczMHpU0i9gauuHavuh+3hVET8pzN3vQ75Y
         4NlNa/9Ideps1VEPJGEhDHz4AyQoxwvk1kp/yP4nHGV7sSfRvMgNtWhDWNhL9ub7cwgj
         IhYA==
X-Gm-Message-State: AOJu0YzVHEL+bqaTxipveLmbgzNyYicIoGItR3x1ibmB/KALyGO09Lpc
	XZFi6l7Iv4u/raoeJj+U9ETUZdo5dRf6RYCabuwSzy7G2egumT03ylkYOA==
X-Google-Smtp-Source: AGHT+IFzuZE5YvU9Vsv0ydsb2zao9jRI0hBwVHCEg2wdlnc/wJZXsI1tPSKGLZonTb8QWGjXvdHmjw==
X-Received: by 2002:a17:903:32c5:b0:1f4:b02d:bb61 with SMTP id d9443c01a7336-1f4b02dbe0amr216975ad.3.1716774421283;
        Sun, 26 May 2024 18:47:01 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f46cc0e0c9sm29978905ad.148.2024.05.26.18.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 18:47:00 -0700 (PDT)
Date: Mon, 27 May 2024 10:46:50 +0900 (JST)
Message-Id: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com>
To: andrew@lunn.ch, benno.lossin@proton.me, tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v1] rust: net::phy support to C45 registers access
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

After the discussion on C45 register support, I implemented a more rusty
solution based on Benno's idea (hopefully, I understand correctly):

https://lore.kernel.org/all/20240415104701.4772-3-fujita.tomonori@gmail.com/

I'm not sure so I sent a RFC patch to rust-for-linux only. Once I have
something that we could agree on, I'll send non RFC patch to netdev.


Adds support for C45 registers access. C45 registers can be accessed
in two ways: either C45 bus protocol or C45 over C22. Normally, a PHY
driver shouldn't care how to access. PHYLIB chooses the appropriate
one. But there is an exception; PHY hardware supporting only C45 bus
protocol.

This adds two ways to access C45; RegC45 and RegC45Direct. Normally, a
driver should use the former; let the PHYLIB take care of how to
access (by calling phy_read_mmd/phy_write_mmd). The latter calls
mdiobus_c45_read/mdiobus_c45_write; C45 over C22 isn't used.

The API to access to C22 registers is also updated to align with the
above changes.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs |   7 +-
 rust/kernel/net/phy.rs           | 218 +++++++++++++++++++++++++++----
 2 files changed, 198 insertions(+), 27 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 5c92572962dc..9526729dc35a 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -6,7 +6,7 @@
 //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.c)
 use kernel::{
     c_str,
-    net::phy::{self, DeviceId, Driver},
+    net::phy::{self, DeviceId, Driver, RegC22},
     prelude::*,
     uapi,
 };
@@ -24,7 +24,6 @@
     license: "GPL",
 }
 
-const MII_BMCR: u16 = uapi::MII_BMCR as u16;
 const BMCR_SPEED100: u16 = uapi::BMCR_SPEED100 as u16;
 const BMCR_FULLDPLX: u16 = uapi::BMCR_FULLDPLX as u16;
 
@@ -33,7 +32,7 @@
 // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implementation
 // such as used on the Individual Computers' X-Surf 100 Zorro card.
 fn asix_soft_reset(dev: &mut phy::Device) -> Result {
-    dev.write(uapi::MII_BMCR as u16, 0)?;
+    dev.write(RegC22::Bmcr, 0)?;
     dev.genphy_soft_reset()
 }
 
@@ -55,7 +54,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
         }
         // If MII_LPA is 0, phy_resolve_aneg_linkmode() will fail to resolve
         // linkmode so use MII_BMCR as default values.
-        let ret = dev.read(MII_BMCR)?;
+        let ret = dev.read(RegC22::Bmcr)?;
 
         if ret & BMCR_SPEED100 != 0 {
             dev.set_speed(uapi::SPEED_100);
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index fd40b703d224..5bb4a8c9e493 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -175,32 +175,15 @@ pub fn set_duplex(&mut self, mode: DuplexMode) {
         unsafe { (*phydev).duplex = v };
     }
 
-    /// Reads a given C22 PHY register.
+    /// Reads a PHY register.
     // This function reads a hardware register and updates the stats so takes `&mut self`.
-    pub fn read(&mut self, regnum: u16) -> Result<u16> {
-        let phydev = self.0.get();
-        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call, open code of `phy_read()` with a valid `phy_device` pointer
-        // `phydev`.
-        let ret = unsafe {
-            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, regnum.into())
-        };
-        if ret < 0 {
-            Err(Error::from_errno(ret))
-        } else {
-            Ok(ret as u16)
-        }
+    pub fn read<R: RegAccess>(&mut self, reg: R) -> Result<u16> {
+        reg.read(self)
     }
 
-    /// Writes a given C22 PHY register.
-    pub fn write(&mut self, regnum: u16, val: u16) -> Result {
-        let phydev = self.0.get();
-        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
-        // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
-        // `phydev`.
-        to_result(unsafe {
-            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, regnum.into(), val)
-        })
+    /// Writes a PHY register.
+    pub fn write<R: RegAccess>(&mut self, reg: R, val: u16) -> Result {
+        reg.write(self, val)
     }
 
     /// Reads a paged register.
@@ -302,6 +285,195 @@ pub fn genphy_read_abilities(&mut self) -> Result {
     }
 }
 
+/// Reads and writes C22 and C45 registers.
+///
+/// This trait is used to implement multiple ways to read and write
+/// PHY registers.
+pub trait RegAccess {
+    /// Reads a PHY register.
+    fn read(&self, dev: &mut Device) -> Result<u16>;
+
+    /// Writes a PHY register.
+    fn write(&self, dev: &mut Device, val: u16) -> Result;
+}
+
+/// Accesses to C22 registers.
+#[derive(Clone, Copy)]
+pub enum RegC22 {
+    /// Basic mode control.
+    Bmcr = uapi::MII_BMCR as isize,
+    /// Basic mode status.
+    Bmsr = uapi::MII_BMSR as isize,
+    /// PHY identifier 1.
+    PhysId1 = uapi::MII_PHYSID1 as isize,
+    /// PHY identifier 2.
+    PhysId2 = uapi::MII_PHYSID2 as isize,
+    /// Auto-negotiation advertisement.
+    Advertise = uapi::MII_ADVERTISE as isize,
+    /// Auto-negotiation link partner base page ability.
+    Lpa = uapi::MII_LPA as isize,
+    /// Auto-negotiation expansion.
+    Expansion = uapi::MII_EXPANSION as isize,
+    /// 1000BASE-T control.
+    Ctrl1000 = uapi::MII_CTRL1000 as isize,
+    /// 1000BASE-T status.
+    Stat1000 = uapi::MII_STAT1000 as isize,
+    /// MMD access control.
+    MmdCtrl = uapi::MII_MMD_CTRL as isize,
+    /// MMD access data.
+    MmdData = uapi::MII_MMD_DATA as isize,
+    /// Extended status.
+    Estatus = uapi::MII_ESTATUS as isize,
+    /// Disconnect counter.
+    Dcounter = uapi::MII_DCOUNTER as isize,
+    /// False carrier sense counter.
+    Fcscounter = uapi::MII_FCSCOUNTER as isize,
+    /// N-way auto-negotiation test.
+    Nwaytest = uapi::MII_NWAYTEST as isize,
+    /// Receive error counter.
+    Rerrcounter = uapi::MII_RERRCOUNTER as isize,
+    /// Silicon revision.
+    Srervision = uapi::MII_SREVISION as isize,
+    /// Reserved.
+    Resv1 = uapi::MII_RESV1 as isize,
+    /// Lpback, rx, bypass error.
+    Lbrerror = uapi::MII_LBRERROR as isize,
+    /// PHY address.
+    Phyaddr = uapi::MII_PHYADDR as isize,
+    /// Reserved.
+    Resv2 = uapi::MII_RESV2 as isize,
+    /// TPI status for 10Mbps.
+    TpiStatus = uapi::MII_TPISTATUS as isize,
+    /// Network interface configuration.
+    Nconfig = uapi::MII_NCONFIG as isize,
+}
+
+impl RegAccess for RegC22 {
+    /// Reads a given C22 PHY register.
+    fn read(&self, dev: &mut Device) -> Result<u16> {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call, open code of `phy_read()` with a valid `phy_device` pointer
+        // `phydev`.
+        let ret = unsafe {
+            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, *self as u32)
+        };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
+
+    /// Writes a given C22 PHY register.
+    fn write(&self, dev: &mut Device, val: u16) -> Result {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
+        // `phydev`.
+        to_result(unsafe {
+            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, *self as u32, val)
+        })
+    }
+}
+
+/// Accesses to C45 registers.
+///
+/// C45 registers can be accessed in two ways: either C45 bus protocol or
+/// C45 over C22 bus protocol. Normally, a PHY driver shouldn't care how to
+/// access. `PHYLIB` chooses the appropriate one. `RegC45` is preferred over
+/// `RegC45Direct`.
+pub struct RegC45 {
+    devad: u8,
+    regnum: u16,
+}
+
+impl RegC45 {
+    /// Creates a new instance of `RegC45`.
+    pub fn new(devad: u8, regnum: u16) -> Self {
+        Self { devad, regnum }
+    }
+}
+
+impl RegAccess for RegC45 {
+    /// Reads a given C45 PHY register.
+    fn read(&self, dev: &mut Device) -> Result<u16> {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call.
+        let ret = unsafe { bindings::phy_read_mmd(phydev, self.devad.into(), self.regnum.into()) };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
+
+    /// Writes a given C45 PHY register.
+    fn write(&self, dev: &mut Device, val: u16) -> Result {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call.
+        to_result(unsafe {
+            bindings::phy_write_mmd(phydev, self.devad.into(), self.regnum.into(), val)
+        })
+    }
+}
+
+/// Accesses to C45 registers with C45 bus protocol.
+///
+/// This struct is used to access C45 registers with C45 bus protocol;
+/// C45 over C22 bus protocol isn't used.
+pub struct RegC45Direct {
+    devad: u8,
+    regnum: u16,
+}
+
+impl RegC45Direct {
+    /// Creates a new instance of `RegC45Direct`.
+    pub fn new(devad: u8, regnum: u16) -> Self {
+        Self { devad, regnum }
+    }
+}
+
+impl RegAccess for RegC45Direct {
+    /// Reads a given C45 PHY register.
+    fn read(&self, dev: &mut Device) -> Result<u16> {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call.
+        let ret = unsafe {
+            bindings::mdiobus_c45_read(
+                (*phydev).mdio.bus,
+                (*phydev).mdio.addr,
+                self.devad.into(),
+                self.regnum.into(),
+            )
+        };
+        if ret < 0 {
+            Err(Error::from_errno(ret))
+        } else {
+            Ok(ret as u16)
+        }
+    }
+
+    /// Writes a given C45 PHY register.
+    fn write(&self, dev: &mut Device, val: u16) -> Result {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call.
+        to_result(unsafe {
+            bindings::mdiobus_c45_write(
+                (*phydev).mdio.bus,
+                (*phydev).mdio.addr,
+                self.devad.into(),
+                self.regnum.into(),
+                val,
+            )
+        })
+    }
+}
+
 /// Defines certain other features this PHY supports (like interrupts).
 ///
 /// These flag values are used in [`Driver::FLAGS`].
-- 
2.34.1

