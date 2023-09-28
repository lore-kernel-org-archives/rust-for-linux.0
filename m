Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E8C17722
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 22:58:11 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C4119F
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 15:58:07 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-69361132a60so89216b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Sep 2023 15:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695941887; x=1696546687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQTTlYYsnz8FL8Zy6c22htG1c4iCQ1YYL+g38bjpDds=;
        b=DyuIEWkceytYVNT678Bi+q51ya0y9525LuFP8Pqok2+iW4+Td5wm2ENJDlVw9AZBAK
         IW0mXgwo2Y0lHHwrFQ5NGBra6OkYwjoIyAiMXkBsyuER0ACeyZe+OMubSgF/ZtrZmHdH
         H0xBNiYClv8KGk3fOaRKz3+Cvgp6+OhDf+FxPXnRQSYPYv+AuVOc7+GpeHSLGbbnnrr1
         wIxg6ofQjMoY+BdIqiZ1NPlop/wjqm8GtXhyrbn66b+R48NFDTD+HPR13sgp+F3/FnT9
         qYbcThaGhh3G3UdFsUPOoXXuMfHU9V5IMVf4tcQHYcIBFH+nGMTpY3W3OPOAcVnlrBG5
         CVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695941887; x=1696546687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQTTlYYsnz8FL8Zy6c22htG1c4iCQ1YYL+g38bjpDds=;
        b=M/nrjKHnaJND8X7nfmh0MZmjDyG/AlrdJ2ubldTcAsavtHmG3O3Xk9SH4NpN1YpeBK
         lLGYa776pfHKlpsb4ZHDQUnvSvvU319snLhqQ6nILjbIRye/GIutdkN7JYHkxqqmImX9
         KMWgD3mRFvTzXa+/zraHG8nJwje24LLBtNw1AHcogYvbxUXBI9KKo4S4gClJ1PnxnAgl
         JPSo0XXPBlXcyaYFl+6Q1BJ9pXtOvORfFYAsq6Jmmg1R2MSwIgCE6ZnQXd/icClvNMYz
         xBjZyW/qE+Sf/D1PG1iMRg8rLB+QkwR9xwiZSPgqyfgEZyyQf7oci0TvdyPK+jqKCWYI
         Pnmg==
X-Gm-Message-State: AOJu0YwkhFvgxAScNjLPFWPJaUSEfFNxutmlCgAcrXTs1R7InlcJBkY+
	pahLC9gg5DGxv8F76a+xTRIbHpVH0Obepg==
X-Google-Smtp-Source: AGHT+IED7uIhQuslXqDvFxZBX/VVS7nQ2N779jD+UnJS/KtxbHcFxPh8oor7CCUDGVm7jjfylns/jw==
X-Received: by 2002:a05:6a20:8f11:b0:123:149b:a34f with SMTP id b17-20020a056a208f1100b00123149ba34fmr2244768pzk.1.1695941886828;
        Thu, 28 Sep 2023 15:58:06 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id du7-20020a056a002b4700b0068e4c5a4f3esm6355282pfb.71.2023.09.28.15.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:58:06 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch,
	tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com,
	benno.lossin@proton.me,
	wedsonaf@gmail.com
Subject: [RFC PATCH v3 3/3] net: phy: add Rust Asix PHY driver
Date: Fri, 29 Sep 2023 07:55:18 +0900
Message-Id: <20230928225518.2197768-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This is the Rust implementation of drivers/net/phy/ax88796b.c.  The
features are equivalent. You can choose C or Rust versionon kernel
configuration.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 drivers/net/phy/Kconfig          |   7 ++
 drivers/net/phy/Makefile         |   6 +-
 drivers/net/phy/ax88796b_rust.rs | 129 +++++++++++++++++++++++++++++++
 rust/uapi/uapi_helper.h          |   1 +
 4 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/ax88796b_rust.rs

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 107880d13d21..e4d941f0ebe4 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -107,6 +107,13 @@ config AX88796B_PHY
 	  Currently supports the Asix Electronics PHY found in the X-Surf 100
 	  AX88796B package.
 
+config AX88796B_RUST_PHY
+	bool "Rust reference driver"
+	depends on RUST && AX88796B_PHY
+	default n
+	help
+	  Uses the Rust version driver for Asix PHYs.
+
 config BROADCOM_PHY
 	tristate "Broadcom 54XX PHYs"
 	select BCM_NET_PHYLIB
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index c945ed9bd14b..58d7dfb095ab 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -41,7 +41,11 @@ aquantia-objs			+= aquantia_hwmon.o
 endif
 obj-$(CONFIG_AQUANTIA_PHY)	+= aquantia.o
 obj-$(CONFIG_AT803X_PHY)	+= at803x.o
-obj-$(CONFIG_AX88796B_PHY)	+= ax88796b.o
+ifdef CONFIG_AX88796B_RUST_PHY
+  obj-$(CONFIG_AX88796B_PHY)	+= ax88796b_rust.o
+else
+  obj-$(CONFIG_AX88796B_PHY)	+= ax88796b.o
+endif
 obj-$(CONFIG_BCM54140_PHY)	+= bcm54140.o
 obj-$(CONFIG_BCM63XX_PHY)	+= bcm63xx.o
 obj-$(CONFIG_BCM7XXX_PHY)	+= bcm7xxx.o
diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
new file mode 100644
index 000000000000..d11c82a9e847
--- /dev/null
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -0,0 +1,129 @@
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
+struct RustAsixPhy;
+
+// Performs a software PHY reset using the standard
+// BMCR_RESET bit and poll for the reset bit to be cleared.
+// Toggle BMCR_RESET bit off to accommodate broken AX8796B PHY implementation
+// such as used on the Individual Computers' X-Surf 100 Zorro card.
+fn asix_soft_reset(dev: &mut phy::Device) -> Result {
+    dev.write(uapi::MII_BMCR as u16, 0)?;
+    dev.genphy_soft_reset()
+}
+
+struct PhyAX88772A;
+
+#[vtable]
+impl phy::Driver for PhyAX88772A {
+    const FLAGS: u32 = phy::flags::IS_INTERNAL;
+    const NAME: &'static CStr = c_str!("Asix Electronics AX88772A");
+    const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x003b1861);
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
+        asix_soft_reset(dev)
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
+#[vtable]
+impl Driver for PhyAX88772C {
+    const FLAGS: u32 = phy::flags::IS_INTERNAL;
+    const NAME: &'static CStr = c_str!("Asix Electronics AX88772C");
+    const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_exact_mask(0x003b1881);
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
+        asix_soft_reset(dev)
+    }
+}
+
+struct PhyAX88796B;
+
+#[vtable]
+impl Driver for PhyAX88796B {
+    const NAME: &'static CStr = c_str!("Asix Electronics AX88796B");
+    const PHY_DEVICE_ID: phy::DeviceId = phy::DeviceId::new_with_model_mask(0x003b1841);
+
+    fn soft_reset(dev: &mut phy::Device) -> Result {
+        asix_soft_reset(dev)
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

