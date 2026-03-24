Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D15B386568
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367598; cv=none; b=Z05rMDCIa6KDTzsbpQVI24qRcSC+sls6jelkTZW4aIeI1+GL9Us1eY/lUfsQZqQC4nCunEA6vR0UMG/MIFBQURm/Oib1u+haAB6BqZ9EO5Gj4JdN9naaa7o54BR+fw5pd0R8FA+U4AKi4xyw3hVeFPWDqonaZDUecanWGVf9WZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367598; c=relaxed/simple;
	bh=f2fhNgEZ9mq/NMTTBc2nagEfYfPtdMldazchFYecDeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpcBEnv7En4CQFVY96FrX0EGVwTuo9tm2VVyZgZcy63OqWECFlQbwriL19Gspak8tuIlRk0QI8GVg8A6HOStMpVnKpHiR6pe1JOekPIQ2QV68lj2jzd7sP6yRFfFfu/HZ0ogj17FGR4gTU8ElkXX0O3iPSRsfmRrKVkRIE94FR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHU237Dg; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHU237Dg"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38b50c79f2fso53668661fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367595; x=1774972395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfeAjXMVYCj1aDUUjyZzfRg1uUQ9OgRu51XWUh4xZSo=;
        b=cHU237DgfFPOuV/Oll6ioEVrCW1poKc4Lvsacv71LSG8Bi1vbSWCxiy8a9xWLfi5ja
         B4Hqi9NaQRcMDd2NpNkj/Mo4q0z+6yMAOW4REm0huuFoA5nNsddxZy5M5TppgfOzaqQt
         l+6kwvZuWxsurAXI3+iu48GDFKSQ+2/g14UvIHYjTTewEIZr0a0qOPsDhk4cCaGclLr0
         MBZ6y6OpnGhNStmoX/58Q564Ql7g6ZeUXNdZoiniwyUE1kE/NqEMCE7rV2yVEG/9UDEA
         kJIGlktzdL33mYcSGD3KTKwA//D4GBDNIDiRORtNFU2uzMOTKvqSyfavBYg3gYLBZdn8
         9oUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367595; x=1774972395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FfeAjXMVYCj1aDUUjyZzfRg1uUQ9OgRu51XWUh4xZSo=;
        b=ZDDJg7uhkGrrgPLORYyLC6lXa1h+m35kJIkKSiFSv8wRWt8t0FjAwO6Qd6MxFQJvbp
         hgJKlhTpfkQweO+e2MH2jw4QxfwiXY+zrXObtwp90qRZ3Tva/GB/sktPrwlKi2JQrUm8
         23peHRPHWKiXu0C4bN0rpRecKQKoeLnByp9q8+qiecB+9Ora1OAWWRiy+F5SWKVrEJTq
         EnkOaBpG8JenKlL1eh2C8xnDVoEL3Aq7S3h3aB0v3zZAbITvqb9pstInWdgVXFWdAtEC
         o1MSVmC/iE+LKKb6Awk7oTMBRmAtGyz0k6xo1DVrQAevsH1+8TgcwpwbCT4YN1Vuecz9
         u58Q==
X-Forwarded-Encrypted: i=1; AJvYcCU832YWGQTJnBNPyHE8ERdnj/9cFhT0QuHFGiXbkHt74uG4E1pNrkyrokycGyiybKIAeFzDBqBC3JLDk6gs9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpyhN/axpduHyMAywpOGnPkASp2MkFEw+Qgrvob1PAF1jPsRM8
	JXUJRMsnkxz/gOJOdx5mBIU07WsX7LNP5GuahdmGcU5UGK3VRJH6eB4K
X-Gm-Gg: ATEYQzzztZUG03gLJregvRJDI+pKoc4djh35h61yZrRgrQfIpIccc2Wvn71LV5fN9Zu
	Y+ew3UsvoaX/gjcuBkEMP7fXuqNU4IdCWYAF5Bhtl7SFCxQWDtW0pDZt3Ibz5JL1Er+LW3Zjb4h
	Sd5CeP1f1f98HmTYoVlQIpSmBtsANXS4NUGLwolEL9Yw4CCqkatDJWYVCpuepVZfJVynDqOQefW
	DKlNj79mUDHJZfbJN78EDaoe+2DMYjs+pG3wnIwRpAtmX1/cMdJmtdGpCQ+t1IwKUylrcCOSYMz
	3Q/UEYf+z0JzGH71+Kt229BHjubKS6o9K3CxBaLkwjbRKeVkNBKYBqVnkwlCELSa7J+XZilPvo+
	P79FL+m7R2ZLkwSD6uHHOdbL1vGQDjDvhVII2Qo1SjHwh1S5CPJ7yKeH5Yy0YV2nX7cQbSK2lK+
	9QYIdnaUrtpxbnJE6IcP/mhVyuJq7Qq+MsmwCf76l/uWL3Kark+xZeO5n4ZVDj7SLjHK21dfonh
	5Eycaw0fC/6OrbJceCVF9x8bKKI
X-Received: by 2002:a2e:894b:0:b0:389:fb7f:3def with SMTP id 38308e7fff4ca-38bf96ee30fmr42392691fa.23.1774367594407;
        Tue, 24 Mar 2026 08:53:14 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm32567841fa.32.2026.03.24.08.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:53:14 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: fujita.tomonori@gmail.com,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	tmgross@umich.edu,
	ojeda@kernel.org,
	dakr@kernel.org
Subject: [PATCH net-next v2 5/5] net: phy: realtek: add Rust RTL8211F PHY driver
Date: Tue, 24 Mar 2026 18:52:49 +0300
Message-ID: <20260324155249.15098-6-iprintercanon@gmail.com>
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

Add a Rust implementation of the Realtek RTL8211F Gigabit Ethernet PHY
driver. This exercises the extended Rust PHY abstraction with
config_init, read_page/write_page, and interrupt support callbacks.

The driver implements:
  - config_init: Configures RGMII TX/RX internal delays based on the
    PHY interface mode, and disables PHY-level EEE so LPI is passed
    to the MAC. This matches the C driver's essential initialization.
    ALDPS and CLKOUT are left at hardware defaults since they depend
    on device tree properties and per-device private data not yet
    supported by the Rust PHY abstraction.
  - read_page / write_page: Standard RTL821x page select register.
  - config_intr: Enables/disables link status change interrupts.
  - handle_interrupt: Reads INSR and triggers the state machine on
    link change. PME/WoL interrupts are documented as unsupported.

The PHY ID 0x001cc916 matches the RTL8211F specifically.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/net/phy/realtek/Kconfig          |  12 +++
 drivers/net/phy/realtek/Makefile         |   1 +
 drivers/net/phy/realtek/rtl8211f_rust.rs | 127 +++++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 drivers/net/phy/realtek/rtl8211f_rust.rs

diff --git a/drivers/net/phy/realtek/Kconfig b/drivers/net/phy/realtek/Kconfig
index b05c2a1e90243..4cc880683367d 100644
--- a/drivers/net/phy/realtek/Kconfig
+++ b/drivers/net/phy/realtek/Kconfig
@@ -13,3 +13,15 @@ config REALTEK_PHY_HWMON
 	  Optional hwmon support for the temperature sensor
 
 endif # REALTEK_PHY
+
+config REALTEK_RTL8211F_RUST_PHY
+	tristate "Rust Realtek RTL8211F PHY driver"
+	depends on RUST && RUST_PHYLIB_ABSTRACTIONS && !REALTEK_PHY
+	help
+	  Rust driver for the Realtek RTL8211F Gigabit Ethernet PHY.
+	  This is a Rust implementation demonstrating the extended PHY
+	  abstraction with config_init, paged register access, and
+	  interrupt support.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rtl8211f_rust.
diff --git a/drivers/net/phy/realtek/Makefile b/drivers/net/phy/realtek/Makefile
index dd21cf87f2f18..56ae5d2e39f65 100644
--- a/drivers/net/phy/realtek/Makefile
+++ b/drivers/net/phy/realtek/Makefile
@@ -2,3 +2,4 @@
 realtek-y			+= realtek_main.o
 realtek-$(CONFIG_REALTEK_PHY_HWMON) += realtek_hwmon.o
 obj-$(CONFIG_REALTEK_PHY)	+= realtek.o
+obj-$(CONFIG_REALTEK_RTL8211F_RUST_PHY) += rtl8211f_rust.o
diff --git a/drivers/net/phy/realtek/rtl8211f_rust.rs b/drivers/net/phy/realtek/rtl8211f_rust.rs
new file mode 100644
index 0000000000000..f89f2fa55c677
--- /dev/null
+++ b/drivers/net/phy/realtek/rtl8211f_rust.rs
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2026 Artem Lytkin <iprintercanon@gmail.com>
+
+//! Rust Realtek RTL8211F Gigabit Ethernet PHY driver.
+
+use kernel::irq::IrqReturn;
+use kernel::net::phy::{self, reg::C22, DeviceId};
+use kernel::prelude::*;
+
+// Page select register (vendor-specific, register 0x1f).
+const PAGE_SELECT: C22 = C22::vendor_specific::<0x1f>();
+
+// Interrupt status register (vendor-specific, register 0x1d).
+const INSR: C22 = C22::vendor_specific::<0x1d>();
+
+// Interrupt enable register number (used with paged access on page 0xa42).
+const INER_REG: u16 = 0x12;
+const INER_LINK_STATUS: u16 = 1 << 4;
+
+// RGMII TX delay register on page 0xd08.
+const TX_DELAY_REG: u16 = 0x11;
+const TX_DELAY_EN: u16 = 1 << 8;
+
+// RGMII RX delay register on page 0xd08.
+const RX_DELAY_REG: u16 = 0x15;
+const RX_DELAY_EN: u16 = 1 << 3;
+
+// PHY EEE enable bit in PHYCR2 (default page, register 0x19).
+const PHYCR2: u16 = 0x19;
+const PHYCR2_PHY_EEE_ENABLE: u16 = 1 << 5;
+
+kernel::module_phy_driver! {
+    drivers: [Rtl8211f],
+    device_table: [
+        DeviceId::new_with_driver::<Rtl8211f>(),
+    ],
+    name: "rtl8211f_rust",
+    authors: ["Artem Lytkin"],
+    description: "Rust Realtek RTL8211F PHY driver",
+    license: "GPL",
+}
+
+struct Rtl8211f;
+
+#[vtable]
+impl phy::Driver for Rtl8211f {
+    const NAME: &'static CStr = c"RTL8211F Gigabit Ethernet (Rust)";
+    const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x001cc916);
+
+    fn config_init(dev: &mut phy::Device) -> Result {
+        // Configure RGMII delays based on the PHY interface mode.
+        // This matches the C driver's rtl8211f_config_rgmii_delay().
+        let iface = dev.interface();
+        let tx_delay = iface == bindings::phy_interface_t_PHY_INTERFACE_MODE_RGMII_ID
+            || iface == bindings::phy_interface_t_PHY_INTERFACE_MODE_RGMII_TXID;
+        let rx_delay = iface == bindings::phy_interface_t_PHY_INTERFACE_MODE_RGMII_ID
+            || iface == bindings::phy_interface_t_PHY_INTERFACE_MODE_RGMII_RXID;
+
+        dev.modify_paged(
+            0xd08,
+            TX_DELAY_REG,
+            TX_DELAY_EN,
+            if tx_delay { TX_DELAY_EN } else { 0 },
+        )?;
+        dev.modify_paged(
+            0xd08,
+            RX_DELAY_REG,
+            RX_DELAY_EN,
+            if rx_delay { RX_DELAY_EN } else { 0 },
+        )?;
+
+        // Disable PHY-level EEE so LPI is passed up to the MAC layer.
+        // PHYCR2 is on the default page, no page switch needed.
+        dev.modify(PHYCR2, PHYCR2_PHY_EEE_ENABLE, 0)?;
+
+        // Note: ALDPS and CLKOUT configuration are omitted because they
+        // depend on device tree properties and per-device private data,
+        // which are not yet supported by the Rust PHY abstraction.
+        // The hardware defaults are preserved for these settings.
+
+        Ok(())
+    }
+
+    fn read_page(dev: &mut phy::Device) -> Result<u16> {
+        dev.read(PAGE_SELECT)
+    }
+
+    fn write_page(dev: &mut phy::Device, page: u16) -> Result {
+        dev.write(PAGE_SELECT, page)
+    }
+
+    fn config_intr(dev: &mut phy::Device) -> Result {
+        if dev.is_interrupts_enabled() {
+            // Acknowledge any pending interrupt.
+            dev.read(INSR)?;
+            // Enable link status change interrupt.
+            dev.write_paged(0xa42, INER_REG, INER_LINK_STATUS)?;
+        } else {
+            // Disable all interrupts.
+            dev.write_paged(0xa42, INER_REG, 0)?;
+            // Acknowledge any pending interrupt.
+            dev.read(INSR)?;
+        }
+        Ok(())
+    }
+
+    fn handle_interrupt(dev: &mut phy::Device) -> IrqReturn {
+        let irq_status = match dev.read(INSR) {
+            Ok(val) => val,
+            Err(_) => {
+                dev.phy_error();
+                return IrqReturn::None;
+            }
+        };
+
+        if irq_status & INER_LINK_STATUS != 0 {
+            dev.trigger_machine();
+            return IrqReturn::Handled;
+        }
+
+        // Note: PME/Wake-on-LAN interrupt (bit 7) is not handled because
+        // WoL support requires pm_wakeup_event() binding and per-device
+        // private data, which are not yet available.
+
+        IrqReturn::None
+    }
+}
-- 
2.43.0

