Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661C5806
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 06:49:21 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5DD10D
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 23:49:19 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68cc1b70e05so1135128b3a.1
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 23:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695538158; x=1696142958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyyOzfezvLPoX2A5s2Cx3d/BXBPi7Ab5bjr0DnkQwRc=;
        b=YUcGfUUjKsVbSyLiwGDG3y26CY2b4lobzocpb7DVz35LoVfaWlDnWVSCrXHnVncLwS
         qVVko14bwL69/swYXsgPAXwbkshNh7X+/t3G4lq7RpsrGyKC4RB3kgCrPZUtht5/MSTL
         60gxujd4XvcHFt49/NFPHRlzEDPTuxc9Y66bAc6/4Fb/IOnKj3q1qUHeEnDxG8wyhZHW
         oD4XuHKSTkJcm99pUwhMRBlj3IjD/zKqdG7Zou+BKWVPouh9h22MmQ73CQditkEGlA4m
         u+Lpe0BIey22DcuT553ldxgvA5i7QYILkNe3CXk3VO+27MqCucw+iJGwY+XChbHzmYf5
         mmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695538158; x=1696142958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyyOzfezvLPoX2A5s2Cx3d/BXBPi7Ab5bjr0DnkQwRc=;
        b=otOieRGtHpnqK0/krhIevyFKcRoEQToX4X/LIMBTAI7UTxrCKWtatt1V/bxRY7v0qs
         wbdCzkka+J6TB+AmkWXNV45oBcDbYAIQb0268qZZ6joHyVNijYiX/P3iil4Z8BmcnbS0
         YxzEK555IeWcBkBKR0smkEJy+9wtC98iidXqEKgMcUjSPcKBnlKD0mQC4Qzb0LdpMdbU
         byEbb5KAOQtm97dQvZ8dX7031sluS8sgS0ozEWp1QgR32mECwnEyb0j8Fv93GsU2DJzc
         clRbjZElVpurv9lW5VpiKF8eJYjoZdRRrpD6MNKhlabJxzQFozFFmdojI7cOjNjrjEoF
         PXrA==
X-Gm-Message-State: AOJu0YwByu5l/o+ErYEivkjzmfFdA7ZOCD9OPXFjfvvXShRnnh9YFGSG
	DHzXXLLNgMcgrUTOCeOIYdIqFfcrfIxi2kGn
X-Google-Smtp-Source: AGHT+IHeGwyU1Eeet9M4yB2LdVMCD1Vt712vr70IkmhiMS9qj3cTpQGHZAJikxDjyJiW9pFGSkOvug==
X-Received: by 2002:a05:6a20:5481:b0:15a:4634:e4c with SMTP id i1-20020a056a20548100b0015a46340e4cmr6040778pzk.5.1695538158185;
        Sat, 23 Sep 2023 23:49:18 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id y5-20020aa78545000000b0068fd653321esm5827711pfn.58.2023.09.23.23.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 23:49:17 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com
Subject: [RFC PATCH v2 3/3] net: phy: add Rust Asix PHY driver
Date: Sun, 24 Sep 2023 15:49:02 +0900
Message-Id: <20230924064902.1339662-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This is the Rust implementation of drivers/net/phy/ax88796b.c.  The
features are equivalent. You can choose C or Rust on kernel
configuration.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/net/phy/Kconfig          |  16 ++++
 drivers/net/phy/Makefile         |   8 +-
 drivers/net/phy/ax88796b_rust.rs | 147 +++++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h          |   1 +
 4 files changed, 171 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/ax88796b_rust.rs

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 107880d13d21..47576c905837 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -107,6 +107,22 @@ config AX88796B_PHY
 	  Currently supports the Asix Electronics PHY found in the X-Surf 100
 	  AX88796B package.
 
+choice
+	prompt "Implementation options"
+	depends on AX88796B_PHY
+	help
+	  There are two implementations for a driver for Asix PHYs; C and Rust.
+	  If not sure, choose C.
+
+config AX88796B_C_PHY
+	bool "C driver for Asix PHYs"
+
+config AX88796B_RUST_PHY
+	bool "Rust driver for Asix PHYs"
+	depends on RUST
+
+endchoice
+
 config BROADCOM_PHY
 	tristate "Broadcom 54XX PHYs"
 	select BCM_NET_PHYLIB
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index c945ed9bd14b..4bdefa90e4dc 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -41,7 +41,13 @@ aquantia-objs			+= aquantia_hwmon.o
 endif
 obj-$(CONFIG_AQUANTIA_PHY)	+= aquantia.o
 obj-$(CONFIG_AT803X_PHY)	+= at803x.o
-obj-$(CONFIG_AX88796B_PHY)	+= ax88796b.o
+ifdef CONFIG_AX88796B_PHY
+  ifdef CONFIG_AX88796B_C_PHY
+    obj-$(CONFIG_AX88796B_PHY)	+= ax88796b.o
+  else
+    obj-$(CONFIG_AX88796B_PHY)	+= ax88796b_rust.o
+  endif
+endif
 obj-$(CONFIG_BCM54140_PHY)	+= bcm54140.o
 obj-$(CONFIG_BCM63XX_PHY)	+= bcm63xx.o
 obj-$(CONFIG_BCM7XXX_PHY)	+= bcm7xxx.o
diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
new file mode 100644
index 000000000000..88386b8196e9
--- /dev/null
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust Asix PHYs driver
+use kernel::c_str;
+use kernel::net::phy::{self, DeviceId, Driver};
+use kernel::prelude::*;
+use kernel::uapi;
+
+kernel::module_phy_driver! {
+    drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
+    device_table: [
+        DeviceId::new_with_driver::<PhyAX88772A>(),
+        DeviceId::new_with_driver::<PhyAX88772C>(),
+        DeviceId::new_with_driver::<PhyAX88796B>()
+    ],
+    type: RustAsixPhy,
+    name: "rust_asix_phy",
+    author: "FUJITA Tomonori <fujita.tomonori@gmail.com>",
+    description: "Rust Asix PHYs driver",
+    license: "GPL",
+}
+
+struct PhyAX88772A;
+
+impl PhyAX88772A {
+    const PHY_ID: u32 = 0x003b1861;
+}
+
+#[vtable]
+impl phy::Driver for PhyAX88772A {
+    const FLAGS: u32 = phy::PHY_IS_INTERNAL;
+    const NAME: &'static CStr = c_str!("Asix Electronics AX88772A");
+    const PHY_ID: u32 = Self::PHY_ID;
+    const PHY_ID_MASK: u32 = !0;
+
+    // AX88772A is not working properly with some old switches (NETGEAR EN 108TP):
+    // after autoneg is done and the link status is reported as active, the MII_LPA
+    // register is 0. This issue is not reproducible on AX88772C.
+    fn read_status(dev: &mut phy::Device) -> Result<u16> {
+        dev.genphy_update_link()?;
+        if !dev.get_link() {
+            return Ok(0);
+        }
+        // If MII_LPA is 0, phy_resolve_aneg_linkmode() will fail to resolve
+        // linkmode so use MII_BMCR as default values.
+        let ret = dev.read(uapi::MII_BMCR as u16)?;
+
+        if ret as u32 & uapi::BMCR_SPEED100 != 0 {
+            dev.set_speed(100);
+        } else {
+            dev.set_speed(10);
+        }
+
+        let duplex = if ret as u32 & uapi::BMCR_FULLDPLX != 0 {
+            phy::DuplexMode::Full
+        } else {
+            phy::DuplexMode::Half
+        };
+        dev.set_duplex(duplex);
+
+        dev.genphy_read_lpa()?;
+
+        if dev.is_autoneg_enabled() && dev.is_autoneg_completed() {
+            dev.resolve_aneg_linkmode();
+        }
+
+        Ok(0)
+    }
+
+    fn suspend(dev: &mut phy::Device) -> Result {
+        dev.genphy_suspend()
+    }
+
+    fn resume(dev: &mut phy::Device) -> Result {
+        dev.genphy_resume()
+    }
+
+    fn soft_reset(dev: &mut phy::Device) -> Result {
+        RustAsixPhy::soft_reset(dev)
+    }
+
+    fn link_change_notify(dev: &mut phy::Device) {
+        // Reset PHY, otherwise MII_LPA will provide outdated information.
+        // This issue is reproducible only with some link partner PHYs.
+        if dev.state() == phy::DeviceState::NoLink {
+            let _ = dev.init_hw();
+            let _ = dev.start_aneg();
+        }
+    }
+}
+
+struct PhyAX88772C;
+
+impl PhyAX88772C {
+    const PHY_ID: u32 = 0x003b1881;
+}
+
+#[vtable]
+impl Driver for PhyAX88772C {
+    const FLAGS: u32 = phy::PHY_IS_INTERNAL;
+    const NAME: &'static CStr = c_str!("Asix Electronics AX88772C");
+    const PHY_ID: u32 = Self::PHY_ID;
+    const PHY_ID_MASK: u32 = !0;
+
+    fn suspend(dev: &mut phy::Device) -> Result {
+        dev.genphy_suspend()
+    }
+
+    fn resume(dev: &mut phy::Device) -> Result {
+        dev.genphy_resume()
+    }
+
+    fn soft_reset(dev: &mut phy::Device) -> Result {
+        RustAsixPhy::soft_reset(dev)
+    }
+}
+
+struct PhyAX88796B;
+
+impl PhyAX88796B {
+    const PHY_ID: u32 = 0x003b1841;
+    const PHY_ID_MASK: u32 = 0xfffffff0;
+}
+
+#[vtable]
+impl Driver for PhyAX88796B {
+    const NAME: &'static CStr = c_str!("Asix Electronics AX88796B");
+    const PHY_ID: u32 = Self::PHY_ID;
+    const PHY_ID_MASK: u32 = Self::PHY_ID_MASK;
+
+    fn soft_reset(dev: &mut phy::Device) -> Result {
+        RustAsixPhy::soft_reset(dev)
+    }
+}
+
+struct RustAsixPhy;
+
+impl RustAsixPhy {
+    // Performs a software PHY reset using the standard
+    // BMCR_RESET bit and poll for the reset bit to be cleared.
+    // Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implementation
+    // such as used on the Individual Computers' X-Surf 100 Zorro card.
+    fn soft_reset(dev: &mut phy::Device) -> Result {
+        dev.write(uapi::MII_BMCR as u16, 0)?;
+        dev.genphy_soft_reset()
+    }
+}
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 301f5207f023..d92abe9064c2 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -7,3 +7,4 @@
  */
 
 #include <uapi/asm-generic/ioctl.h>
+#include <uapi/linux/mii.h>
-- 
2.34.1

