Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A446B645
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Jun 2024 04:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717216644; cv=none; b=NEbW/A60fHqngqtFEQhX9NN7KkXM3fiNO2lakSkN0Hn1Yuro6tGIR8ZJ5Ht8ZWXTo9PnQce4tFGIV78jIir53MfDfSYniTgL9eEI1UMUy5qW0/ITG9ravi3FobgbbGf9AIIdDVin+/0u51J3v3GSg+80QrjMBz1c2GpjAAUnDYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717216644; c=relaxed/simple;
	bh=0J0sHOeRsJsMUwk/Wetbpdwxc+kcQN8LI9NTgsANV9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N5fxdPhiCaqQp8JB4KkAVyzGoJ5kv6J4Ky4ATpf2AC1XSW/8U94+0Rjx7oog7qoEJ3Z4Ls2LcPtYRZ8wclrGDoPbWK5BMsjfTeK7YR3O9CvUQUhdx998zicVth/Bvmb/LaK79DtVwgyWP/pC8j8Z4pgpeRItvmUzm0t8AfZKDP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7oAycNP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7oAycNP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2c2083b00cbso11289a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 21:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717216642; x=1717821442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9waayhtVqamT0mhH6QUkSX38bcTN7PWZwWLqr0fJPE=;
        b=c7oAycNPFuig0FAcVz9JHgsGD5JaAINwrSYj4YePuN2qkslVNDdTi3SOi8DodNwn3C
         AwU0Bcmahw87LjxAXT3OrSjAmcUjdyP5DX5pzlBCdqocn7jzkO6/r4QjCSEcZXPZJ0uI
         E5SoZgvZZk2pVxt5ceNP7PWe2MrwJ42MsvMMaBvW87WPVP8FUxvx95Kv6V1wEg0Wg8of
         K5ttDHw8Dp1xQIjshuGnmF9SE6h/4VdQC/j+ICsODQW/PTvHEG8aG9ZBK1xrjv3U14OQ
         cQ9svE/egs91kH4oXCsxDl6/9S3FfAi+1F6KIBfnZIEEFXh9P2gKItBQCwPrJgw5BAZ4
         Xo3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717216642; x=1717821442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9waayhtVqamT0mhH6QUkSX38bcTN7PWZwWLqr0fJPE=;
        b=iTeuMddVl1BwtMB8ToDv1rUFukrftlj3k3tglHCACwfWVtUlGjq5lIi1l2R5DKMe2/
         laoIACc7MF72doJ5202X5+kyGoBld9g7KF0TH3NbATdwSZSAWTOX7WeTOt6hD1q40ZEg
         NWcnEoJQTBq2sYZwp7LtGcqKdho0y56d1UWm8+JX9MoyhRMYS5kUubiHbdMjQVKhhQIw
         29vAvA3h4u1a8t3EShtSl0QfWsZF9/pcF9c3ayEsjltDVeGYcmRTd4HHazZ9TJvl5a56
         YzoWpUHDcpNW/d5LCfo4hwI3bsajKf53k90863f4+gi7znBFC3HO9PGyxMtShEVQWnvj
         fXDw==
X-Gm-Message-State: AOJu0YwXsMVSmRwS6dwOu8r7cKd5Gomh48nUuud6Mxt8GHacJgXxUs6L
	XKGCXYyPkMa+0XeXL91skmehMgG7+fuQCpT4z+SnADA5Ca/FxqgsYPJA8FTc
X-Google-Smtp-Source: AGHT+IE4Ahw85i4z2dOY7SHiVuA+25tSSA5hwkDJOymM3LijHrZn1Z99cPzKFz2V70p1zY27wp5KfQ==
X-Received: by 2002:a17:90a:5d82:b0:2bd:df8b:4ad7 with SMTP id 98e67ed59e1d1-2c1dc5ec1a0mr3391100a91.4.1717216641691;
        Fri, 31 May 2024 21:37:21 -0700 (PDT)
Received: from rpi.. (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a776e212sm4013086a91.16.2024.05.31.21.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 21:37:21 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	benno.lossin@proton.me,
	tmgross@umich.edu
Subject: [RFC PATCH v2 1/2] rust: net::phy support for C45 register access
Date: Sat,  1 Jun 2024 13:35:34 +0900
Message-Id: <20240601043535.53545-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240601043535.53545-1-fujita.tomonori@gmail.com>
References: <20240601043535.53545-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for C45 register access. Instead of adding read/write_c45
methods, this unifies the API to access C22 and C45 registers with
trait.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs |   7 +-
 rust/kernel/net/phy.rs           | 192 +++++++++++++++++++++++++++----
 rust/uapi/uapi_helper.h          |   1 +
 3 files changed, 173 insertions(+), 27 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 5c92572962dc..8c7eb009d9fc 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -6,7 +6,7 @@
 //! C version of this driver: [`drivers/net/phy/ax88796b.c`](./ax88796b.c)
 use kernel::{
     c_str,
-    net::phy::{self, DeviceId, Driver},
+    net::phy::{self, reg::C22, DeviceId, Driver},
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
+    dev.write(C22::BMCR, 0)?;
     dev.genphy_soft_reset()
 }
 
@@ -55,7 +54,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
         }
         // If MII_LPA is 0, phy_resolve_aneg_linkmode() will fail to resolve
         // linkmode so use MII_BMCR as default values.
-        let ret = dev.read(MII_BMCR)?;
+        let ret = dev.read(C22::BMCR)?;
 
         if ret & BMCR_SPEED100 != 0 {
             dev.set_speed(uapi::SPEED_100);
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index fd40b703d224..286fd5a7ec91 100644
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
+    pub fn read<R: reg::Access>(&mut self, reg: R) -> Result<u16> {
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
+    pub fn write<R: reg::Access>(&mut self, reg: R, val: u16) -> Result {
+        reg.write(self, val)
     }
 
     /// Reads a paged register.
@@ -302,6 +285,169 @@ pub fn genphy_read_abilities(&mut self) -> Result {
     }
 }
 
+/// Defines PHY registers.
+pub mod reg {
+    use super::Device;
+    use crate::build_assert;
+    use crate::error::*;
+    use crate::uapi;
+
+    /// Reads and writes PHY registers.
+    ///
+    /// This trait is used to implement multiple ways to read and write
+    /// PHY registers.
+    pub trait Access {
+        /// Reads a PHY register.
+        fn read(&self, dev: &mut Device) -> Result<u16>;
+
+        /// Writes a PHY register.
+        fn write(&self, dev: &mut Device, val: u16) -> Result;
+    }
+
+    /// C22 registers.
+    pub struct C22(u8);
+
+    impl C22 {
+        /// Basic mode control.
+        pub const BMCR: Self = C22(0x00);
+        /// Basic mode status.
+        pub const BMSR: Self = C22(0x01);
+        /// PHY identifier 1.
+        pub const PHYSID1: Self = C22(0x02);
+        /// PHY identifier 2.
+        pub const PHYSID2: Self = C22(0x03);
+        /// Auto-negotiation advertisement.
+        pub const ADVERTISE: Self = C22(0x04);
+        /// Auto-negotiation link partner base page ability.
+        pub const LPA: Self = C22(0x05);
+        /// Auto-negotiation expansion.
+        pub const EXPANSION: Self = C22(0x06);
+        /// Auto-negotiation next page transmit.
+        pub const NEXT_PAGE_TRANSMIT: Self = C22(0x07);
+        /// Auto-negotiation link partner received next page.
+        pub const LP_RECEIVED_NEXT_PAGE: Self = C22(0x08);
+        /// Master-slave control.
+        pub const MASTER_SLAVE_CONTROL: Self = C22(0x09);
+        /// Master-slave status.
+        pub const MASTER_SLAVE_STATUS: Self = C22(0x0a);
+        /// PSE Control.
+        pub const PSE_CONTROL: Self = C22(0x0b);
+        /// PSE Status.
+        pub const PSE_STATUS: Self = C22(0x0c);
+        /// MMD access control.
+        pub const MMD_CONTROL: Self = C22(0x0d);
+        /// MMD access address data.
+        pub const MMD_DATA: Self = C22(0x0e);
+        /// Extended status.
+        pub const EXTENDED_STATUS: Self = C22(0x0f);
+
+        /// Creates a new instance of `C22` with a vendor specific register.
+        pub const fn vendor_specific<const N: u8>() -> Self {
+            build_assert!(N > 0x0f && N < 0x20);
+            C22(N)
+        }
+    }
+
+    impl Access for C22 {
+        /// Reads a given C22 PHY register.
+        fn read(&self, dev: &mut Device) -> Result<u16> {
+            let phydev = dev.0.get();
+            // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+            // So it's just an FFI call, open code of `phy_read()` with a valid `phy_device` pointer
+            // `phydev`.
+            let ret = unsafe {
+                bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into())
+            };
+            if ret < 0 {
+                Err(Error::from_errno(ret))
+            } else {
+                Ok(ret as u16)
+            }
+        }
+
+        /// Writes a given C22 PHY register.
+        fn write(&self, dev: &mut Device, val: u16) -> Result {
+            let phydev = dev.0.get();
+            // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+            // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
+            // `phydev`.
+            to_result(unsafe {
+                bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into(), val)
+            })
+        }
+    }
+
+    /// MDIO manageable devices.
+    pub struct Mmd(u8);
+
+    impl Mmd {
+        /// Physical Medium Attachment/Dependent.
+        pub const PMAPMD: Self = Mmd(uapi::MDIO_MMD_PMAPMD as u8);
+        /// WAN interface sublayer.
+        pub const WIS: Self = Mmd(uapi::MDIO_MMD_WIS as u8);
+        /// Physical coding sublayer.
+        pub const PCS: Self = Mmd(uapi::MDIO_MMD_PCS as u8);
+        /// PHY Extender sublayer.
+        pub const PHYXS: Self = Mmd(uapi::MDIO_MMD_PHYXS as u8);
+        /// DTE Extender sublayer.
+        pub const DTEXS: Self = Mmd(uapi::MDIO_MMD_DTEXS as u8);
+        /// Transmission convergence.
+        pub const TC: Self = Mmd(uapi::MDIO_MMD_TC as u8);
+        /// Auto negotiation.
+        pub const AN: Self = Mmd(uapi::MDIO_MMD_AN as u8);
+        /// Clause 22 extension.
+        pub const C22_EXT: Self = Mmd(uapi::MDIO_MMD_C22EXT as u8);
+        /// Vendor specific 1.
+        pub const VEND1: Self = Mmd(uapi::MDIO_MMD_VEND1 as u8);
+        /// Vendor specific 2.
+        pub const VEND2: Self = Mmd(uapi::MDIO_MMD_VEND2 as u8);
+
+        /// Creates a new instance of `Mmd` with a specific device address.
+        pub fn new(devad: u8) -> Self {
+            Mmd(devad)
+        }
+    }
+
+    /// C45 registers.
+    pub struct C45 {
+        devad: Mmd,
+        regnum: u16,
+    }
+
+    impl C45 {
+        /// Creates a new instance of `C45`.
+        pub fn new(devad: Mmd, regnum: u16) -> Self {
+            Self { devad, regnum }
+        }
+    }
+
+    impl Access for C45 {
+        /// Reads a given C45 PHY register.
+        fn read(&self, dev: &mut Device) -> Result<u16> {
+            let phydev = dev.0.get();
+            // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+            // So it's just an FFI call.
+            let ret =
+                unsafe { bindings::phy_read_mmd(phydev, self.devad.0.into(), self.regnum.into()) };
+            if ret < 0 {
+                Err(Error::from_errno(ret))
+            } else {
+                Ok(ret as u16)
+            }
+        }
+
+        /// Writes a given C45 PHY register.
+        fn write(&self, dev: &mut Device, val: u16) -> Result {
+            let phydev = dev.0.get();
+            // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+            // So it's just an FFI call.
+            to_result(unsafe {
+                bindings::phy_write_mmd(phydev, self.devad.0.into(), self.regnum.into(), val)
+            })
+        }
+    }
+}
+
 /// Defines certain other features this PHY supports (like interrupts).
 ///
 /// These flag values are used in [`Driver::FLAGS`].
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 08f5e9334c9e..76d3f103e764 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -7,5 +7,6 @@
  */
 
 #include <uapi/asm-generic/ioctl.h>
+#include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>
-- 
2.34.1

