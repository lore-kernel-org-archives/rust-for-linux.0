Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF9F1C290
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Jun 2024 05:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717737713; cv=none; b=cB7yhCjUmBTth2qZI6ViQPogiNgooSqjoAD6hzlSUUfzDjzLZEtuwaO6mwyi/KxZsrFsxv/4yTU9fdyfq9QlMlMcTkh7jsP7PD657ecNQQ07dsK+ezXIqUrLju9vKuK5vB9WM+6hl5CsZHPqxUGUdV3kuwOf0VfYZzQBCVk7xn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717737713; c=relaxed/simple;
	bh=wnargSR4vzSWAJ8ipAQq/6t5T07kYDzIEzl2akenV0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hLyNlH89LyaWxnNTd7xUPeS/h03PudGUb8y7B3FkfomOKdc3qvuD0cNau3sNe0RWwBieSVUyHPmLkd63wj55HYcHb+ll7rfkl35qpcTxFTdscFdrPO4U+cLij3pP4tarNpJ1ZngxhMqRltzLr0k33sAZ4KhS+geY01QjKJ2pJcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ogea+pGl; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ogea+pGl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-6c46ed74937so135510a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 22:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717737710; x=1718342510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Jsc7q748+7nzz0jNlp+wr6HFhlxaB246gSUFtWgdow=;
        b=Ogea+pGlOhcmnD1WHVHfPTtCW9ZwT/k5M14hcZp/HNPA4D7ukPq21I4zp4YyO/CFvv
         CzpFtU524Hkt2qXHxN3gKtvlyK7Y+OLohsPJ0BhfOORzqmbv7EnzxPS/f1kn9OF1WfS9
         BifmCUI7XDok9eF7gY/GTx3y6QdYkt3Y6G+4zsXDNg8VsmFtYGYBO4wQEatb+NSrFZCI
         3qtMbNfAqK1AjW6thKwUyzcKNj/jwFds9KQ3nio+kiszgfgKM4kKijUbzcOHb4DoL7V9
         O5b9Uik7/rH+PJZXQm6pXsArNz5tHqB7YgtB7KdHuCxWmoDq/OU2bZLpn6IXvHK++Nym
         K4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717737710; x=1718342510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Jsc7q748+7nzz0jNlp+wr6HFhlxaB246gSUFtWgdow=;
        b=MiU6P1/O570AKwjjhMIdlGsk7UlhBGg4+gYcjw0lNXPsy/NAzA0lYms7a3q4qCp+f0
         q0qh677TSFQpriKNAtRJeN7YvvcvOnHWfIRVGt9MgsEeKpUHt4aJzUmPclLmYFi+IFQ0
         iwpkZGHzcw+fQPy/DNZ7qvV/fbh6HaiHrLEIU9ZhoZmYc2igyyp5TzJQu7YL/4lCZe5a
         IBWt8xResNF+a8HZjgEsnd4t+kixDYZU2WJOEXQOfYx9pOwAPj6jAASgi0kXBz1b6XPm
         9PcsjjC1ueFnHUHL+vKxv5tMapl1cznwUPVjgll/BHqie4LJ5fjZne5eUHsYS5iUS0fW
         HIBw==
X-Gm-Message-State: AOJu0YxUpqwUhkhrcKLOg510Q1+lF/nJFieFOdwrZwzHy2d93+ft6sWD
	pRTVjMGIU062Dl6+5axl3xYa94Y5RDb0gHTk5qrcwa5qPdxdlzHS0xU1tg==
X-Google-Smtp-Source: AGHT+IE/Oi4OR/dabE9fAZjDY2hffVstQ0ZuOfcBqAaorlU83rfrfDZltNYf+lYQNeUHjP5gfh5Vzw==
X-Received: by 2002:a17:902:d4d2:b0:1f5:e635:21eb with SMTP id d9443c01a7336-1f6d0221838mr18021335ad.0.1717737710250;
        Thu, 06 Jun 2024 22:21:50 -0700 (PDT)
Received: from rpi.. (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd6c30a6sm25106215ad.0.2024.06.06.22.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 22:21:49 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	tmgross@umich.edu,
	benno.lossin@proton.me
Subject: [RFC PATCH v4 1/2] rust: net::phy unified read/write API for C22 and C45 registers
Date: Fri,  7 Jun 2024 14:21:12 +0900
Message-Id: <20240607052113.69026-2-fujita.tomonori@gmail.com>
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

Add the unified read/write API for C22 and C45 registers. The
abstractions support access to only C22 registers now. Instead of
adding read/write_c45 methods specifically for C45, a new reg module
supports the unified API to access C22 and C45 registers with trait,
by calling an appropriate phylib functions.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 MAINTAINERS                      |   1 +
 drivers/net/phy/ax88796b_rust.rs |   7 +-
 rust/kernel/net/phy.rs           |  32 ++---
 rust/kernel/net/phy/reg.rs       | 193 +++++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h          |   1 +
 5 files changed, 206 insertions(+), 28 deletions(-)
 create mode 100644 rust/kernel/net/phy/reg.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 7538152be2f1..4c7d3c303dbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8210,6 +8210,7 @@ L:	netdev@vger.kernel.org
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 F:	rust/kernel/net/phy.rs
+F:	rust/kernel/net/phy/reg.rs
 
 EXEC & BINFMT API, ELF
 R:	Eric Biederman <ebiederm@xmission.com>
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
index fd40b703d224..9b4c4d24b231 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -7,9 +7,10 @@
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
 use crate::{error::*, prelude::*, types::Opaque};
-
 use core::marker::PhantomData;
 
+pub mod reg;
+
 /// PHY state machine states.
 ///
 /// Corresponds to the kernel's [`enum phy_state`].
@@ -175,32 +176,15 @@ pub fn set_duplex(&mut self, mode: DuplexMode) {
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
+    pub fn read<R: reg::Register>(&mut self, reg: R) -> Result<u16> {
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
+    pub fn write<R: reg::Register>(&mut self, reg: R, val: u16) -> Result {
+        reg.write(self, val)
     }
 
     /// Reads a paged register.
diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
new file mode 100644
index 000000000000..91f73179315e
--- /dev/null
+++ b/rust/kernel/net/phy/reg.rs
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 FUJITA Tomonori <fujita.tomonori@gmail.com>
+
+//! PHY register interfaces.
+//!
+//! This module provides support for accessing PHY registers via Ethernet
+//! management interface clause 22 and 45, as defined in IEEE 802.3.
+
+use super::Device;
+use crate::build_assert;
+use crate::error::*;
+use crate::uapi;
+
+mod private {
+    /// Marker that a trait cannot be implemented outside of this crate
+    pub trait Sealed {}
+}
+
+/// Accesses PHY registers.
+///
+/// This trait is used to implement the unified interface to access
+/// C22 and C45 PHY registers.
+///
+/// # Examples
+///
+/// ```ignore
+/// fn link_change_notify(dev: &mut Device) {
+///     // read C22 BMCR register
+///     dev.read(C22::BMCR);
+///     // read C45 PMA/PMD control 1 register
+///     dev.read(C45::new(Mmd::PMAPMD, 0));
+/// }
+/// ```
+pub trait Register: private::Sealed {
+    /// Reads a PHY register.
+    fn read(&self, dev: &mut Device) -> Result<u16>;
+
+    /// Writes a PHY register.
+    fn write(&self, dev: &mut Device, val: u16) -> Result;
+}
+
+/// A single MDIO clause 22 register address (5 bits).
+pub struct C22(u8);
+
+impl C22 {
+    /// Basic mode control.
+    pub const BMCR: Self = C22(0x00);
+    /// Basic mode status.
+    pub const BMSR: Self = C22(0x01);
+    /// PHY identifier 1.
+    pub const PHYSID1: Self = C22(0x02);
+    /// PHY identifier 2.
+    pub const PHYSID2: Self = C22(0x03);
+    /// Auto-negotiation advertisement.
+    pub const ADVERTISE: Self = C22(0x04);
+    /// Auto-negotiation link partner base page ability.
+    pub const LPA: Self = C22(0x05);
+    /// Auto-negotiation expansion.
+    pub const EXPANSION: Self = C22(0x06);
+    /// Auto-negotiation next page transmit.
+    pub const NEXT_PAGE_TRANSMIT: Self = C22(0x07);
+    /// Auto-negotiation link partner received next page.
+    pub const LP_RECEIVED_NEXT_PAGE: Self = C22(0x08);
+    /// Master-slave control.
+    pub const MASTER_SLAVE_CONTROL: Self = C22(0x09);
+    /// Master-slave status.
+    pub const MASTER_SLAVE_STATUS: Self = C22(0x0a);
+    /// PSE Control.
+    pub const PSE_CONTROL: Self = C22(0x0b);
+    /// PSE Status.
+    pub const PSE_STATUS: Self = C22(0x0c);
+    /// MMD Register control.
+    pub const MMD_CONTROL: Self = C22(0x0d);
+    /// MMD Register address data.
+    pub const MMD_DATA: Self = C22(0x0e);
+    /// Extended status.
+    pub const EXTENDED_STATUS: Self = C22(0x0f);
+
+    /// Creates a new instance of `C22` with a vendor specific register.
+    pub const fn vendor_specific<const N: u8>() -> Self {
+        build_assert!(
+            N > 0x0f && N < 0x20,
+            "Vendor-specific register address must be between 16 and 31"
+        );
+        C22(N)
+    }
+}
+
+impl private::Sealed for C22 {}
+
+impl Register for C22 {
+    fn read(&self, dev: &mut Device) -> Result<u16> {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call, open code of `phy_read()` with a valid `phy_device` pointer
+        // `phydev`.
+        let ret = unsafe {
+            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into())
+        };
+        to_result(ret)?;
+        Ok(ret as u16)
+    }
+
+    fn write(&self, dev: &mut Device, val: u16) -> Result {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call, open code of `phy_write()` with a valid `phy_device` pointer
+        // `phydev`.
+        to_result(unsafe {
+            bindings::mdiobus_write((*phydev).mdio.bus, (*phydev).mdio.addr, self.0.into(), val)
+        })
+    }
+}
+
+/// A single MDIO clause 45 register device and address.
+pub struct Mmd(u8);
+
+impl Mmd {
+    /// Physical Medium Attachment/Dependent.
+    pub const PMAPMD: Self = Mmd(uapi::MDIO_MMD_PMAPMD as u8);
+    /// WAN interface sublayer.
+    pub const WIS: Self = Mmd(uapi::MDIO_MMD_WIS as u8);
+    /// Physical coding sublayer.
+    pub const PCS: Self = Mmd(uapi::MDIO_MMD_PCS as u8);
+    /// PHY Extender sublayer.
+    pub const PHYXS: Self = Mmd(uapi::MDIO_MMD_PHYXS as u8);
+    /// DTE Extender sublayer.
+    pub const DTEXS: Self = Mmd(uapi::MDIO_MMD_DTEXS as u8);
+    /// Transmission convergence.
+    pub const TC: Self = Mmd(uapi::MDIO_MMD_TC as u8);
+    /// Auto negotiation.
+    pub const AN: Self = Mmd(uapi::MDIO_MMD_AN as u8);
+    /// Separated PMA (1).
+    pub const SEPARATED_PMA1: Self = Mmd(8);
+    /// Separated PMA (2).
+    pub const SEPARATED_PMA2: Self = Mmd(9);
+    /// Separated PMA (3).
+    pub const SEPARATED_PMA3: Self = Mmd(10);
+    /// Separated PMA (4).
+    pub const SEPARATED_PMA4: Self = Mmd(11);
+    /// OFDM PMA/PMD.
+    pub const OFDM_PMAPMD: Self = Mmd(12);
+    /// Power unit.
+    pub const POWER_UNIT: Self = Mmd(13);
+    /// Clause 22 extension.
+    pub const C22_EXT: Self = Mmd(uapi::MDIO_MMD_C22EXT as u8);
+    /// Vendor specific 1.
+    pub const VEND1: Self = Mmd(uapi::MDIO_MMD_VEND1 as u8);
+    /// Vendor specific 2.
+    pub const VEND2: Self = Mmd(uapi::MDIO_MMD_VEND2 as u8);
+}
+
+/// A single MDIO clause 45 register device and address.
+///
+/// Clause 45 uses a 5-bit device address to access a specific MMD within
+/// a port, then a 16-bit register address to access a location within
+/// that device. `C45` represents this by storing a [`Mmd`] and
+/// a register number.
+pub struct C45 {
+    devad: Mmd,
+    regnum: u16,
+}
+
+impl C45 {
+    /// Creates a new instance of `C45`.
+    pub fn new(devad: Mmd, regnum: u16) -> Self {
+        Self { devad, regnum }
+    }
+}
+
+impl private::Sealed for C45 {}
+
+impl Register for C45 {
+    fn read(&self, dev: &mut Device) -> Result<u16> {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call.
+        let ret =
+            unsafe { bindings::phy_read_mmd(phydev, self.devad.0.into(), self.regnum.into()) };
+        to_result(ret)?;
+        Ok(ret as u16)
+    }
+
+    fn write(&self, dev: &mut Device, val: u16) -> Result {
+        let phydev = dev.0.get();
+        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Device`.
+        // So it's just an FFI call.
+        to_result(unsafe {
+            bindings::phy_write_mmd(phydev, self.devad.0.into(), self.regnum.into(), val)
+        })
+    }
+}
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

