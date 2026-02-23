Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AF637BE70
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 22:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884311; cv=none; b=T23Dr3I2uln7ywUnu+GBCFUQUEPRCEltclwRgElmlNyJ2rx161+2a5BaXejXI0UXYO1aRm/3mNPc0p8KlNyDZWmmEMxW2CU3yGWGFwVLIWlu2Aszcuz5oAr4j/8wG6zbZ5aUYHzLhdz5BS21lMROPRcWI548uXdNoriWbhcPzYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884311; c=relaxed/simple;
	bh=DLo8ybjKAeliYnp5FSPsB19NqPjD3Xu29SYo+c/oWr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQiMMOe6mPksE7FBWHTk8Xh2mZjKc/wGQryIgFJOx0L1E5flPeBLhh0td+sB66d+Rot1gXRnYH4/vmLkAVoKAY8zCchPebhbiuBx19VQp+zSQO7riCl/83cXEuscv1LvyXx4lvnb1RHx9FBBZEaPeKswbTBuHfFjobOvtYSo0Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mo4edKX+; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mo4edKX+"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8f7a30515aso561153166b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771884307; x=1772489107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqhn3ZOG/BZpB/hKPwpYI1TGTRMCqv7M1e3G0fpG16Q=;
        b=mo4edKX+xhX4FCeFSP+BjzVlzepc3vkeBnX3N3XPn65rdfIR0GXu04JMDkiUNe2bp8
         H0usNhBDT3fEWTcFz52eWPEOVfbVLGFawiYjPP2spIYvsjXVKdW+HZkkaN46SwC9Xn6x
         WAYf4QKpHkdaTxGM7eZPmVsrV0N+n6PfhdhDdZgaQH8IOdLso6JPKrfD3Cvy846CEMCg
         Kknmvlmj6T0GA6a3sr6zu+26lRjKAJ6xRqV2B0swzWq/W8zJPAbiNFdsvW8+fbTL6Vyv
         ez6LABtN0E7jkBerSaOSPPoNEDD0EFzXMjzpgUyTAd2dbiVYct0AVZM82TT+BAPbdoKH
         9Owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884307; x=1772489107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqhn3ZOG/BZpB/hKPwpYI1TGTRMCqv7M1e3G0fpG16Q=;
        b=MOjIrOfqvcu9gKOFvDmmMgKq9O/scV4jWx7IySG+Qpc1XiT0LvcK/8z2s5DOTozG0M
         nCX5m8Urb7NYFt4rMExOoHzNxwp/3p80FPePStemC+y5kJnxdwUMzZTe7Lx9hjS3V/Z8
         kV9ncTpQ8/xKC+hZFdrCRjDcWOFP6kLoGUpNyxcUXSgUiebusfyoOrj9lvdA3q08kx+J
         oUNdbCmhwkIwJ1XT2ltAnbJNoXYfsbSK4S69/s0MCKLgGWFHQt96RFxgtgP/s+wKdGuZ
         vej3MKyWw6o+7pweExbMH84JtQJsGFNgwboxLA99jKgzxJMOfGhG6EIF5WSBxCVD0JLc
         sCSg==
X-Forwarded-Encrypted: i=1; AJvYcCU3VkBiUGUN68UufXaWCxKAU7KjMhdF1iV/dIKHH8AziL1t1DD7mxaPimUQFdv669yZ+qVBE+7TQbIqKJNA5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bCx0Dol7zTGNXO+GEXQETUKGTgQH0im6vesx2vFErma7ItmA
	25lEoZpJ58WWjfjpHv7pUMFAJs/7wt3tbGD6aI4u+BdHi8a2S+a3KxcQ
X-Gm-Gg: AZuq6aIU92GRQySRcUjOyEPRhwbyTqPd8ZLi5kjRzYNsVS4kturWt1ddH0dkhjCXin8
	aIG1AjtFZo9ia3sKpoppevoBh4qqiINi+hkD7+7Sv+L2WbDVcDYtWruPV0Gip9LwyBKFCRWnAY6
	HHM4YQWTJi9tc7uL4cxXXkKxqmd+BbILJMSHcMHKTYFIhj2zF494A8o5+B3Qsiorx69jpvsTqbJ
	04CkUgHpJjDGi027atazTumtlXxGQSSsicg2G1sSTp7hvxDaU/tFXXNRqNDCeUKrMkB14BQlueR
	iflwstE8yj9azGDs4XSV/LUh07/t95/4LZQzY8pjunVSn4ZuhVMbJyOOQpWE1MH2Q8sTYZCNi38
	dHLMv53QqirD7jThrVgQt7psKCB9XpYtZ4iSZNdu3P7jm8QvGhvV9Mnu0FyYVXq4FsFVenVTLuG
	+MivUOtUCTACkLzFcSHfjS2ywctAAKX+PX+FgCxEAIPnIs7evjORpSc3LI0YGDqLceMRfuWHNte
	orcrh7QDsmMkNNrhPRrEgdg6j1stVzaXYIYuCALAPMWXoHrTtV0wTcF9fYyTZ3y+kZxUb8=
X-Received: by 2002:a17:906:c153:b0:b90:bc06:2abf with SMTP id a640c23a62f3a-b90bc063f00mr168485366b.4.1771884306385;
        Mon, 23 Feb 2026 14:05:06 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (230.86.12.34.bc.googleusercontent.com. [34.12.86.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm359394666b.67.2026.02.23.14.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:05:06 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH net-next 2/2] net: phy: add Rust reference driver for ET1011C
Date: Mon, 23 Feb 2026 22:05:02 +0000
Message-ID: <20260223220504.2102-4-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223220504.2102-1-iprintercanon@gmail.com>
References: <20260223220504.2102-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Rust implementation of the LSI ET1011C PHY driver, equivalent
to the existing C driver in drivers/net/phy/et1011c.c. The driver
implements config_aneg and read_status callbacks using the Rust PHY
abstraction.

The Rust driver can be selected via the ET1011C_RUST_PHY Kconfig
option, following the same pattern as AX88796B_RUST_PHY.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/net/phy/Kconfig         |  9 +++++
 drivers/net/phy/Makefile        |  6 ++-
 drivers/net/phy/et1011c_rust.rs | 70 +++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/phy/et1011c_rust.rs

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 7b73332a13d9..5271898a38f7 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -254,6 +254,15 @@ config LSI_ET1011C_PHY
 	help
 	  Supports the LSI ET1011C PHY.
 
+config ET1011C_RUST_PHY
+	bool "Rust reference driver for LSI ET1011C PHY"
+	depends on RUST_PHYLIB_ABSTRACTIONS && LSI_ET1011C_PHY
+	help
+	  Uses the Rust reference driver for LSI ET1011C PHY
+	  (et1011c_rust.ko). The features and behavior are
+	  equivalent to the C driver. Selecting this option builds
+	  the Rust version instead of the C version.
+
 config MARVELL_PHY
 	tristate "Marvell Alaska PHYs"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 3a34917adea7..491469457a67 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -62,7 +62,11 @@ obj-$(CONFIG_DP83TG720_PHY)	+= dp83tg720.o
 obj-$(CONFIG_FIXED_PHY)		+= fixed_phy.o
 obj-$(CONFIG_ICPLUS_PHY)	+= icplus.o
 obj-$(CONFIG_INTEL_XWAY_PHY)	+= intel-xway.o
-obj-$(CONFIG_LSI_ET1011C_PHY)	+= et1011c.o
+ifdef CONFIG_ET1011C_RUST_PHY
+  obj-$(CONFIG_LSI_ET1011C_PHY)	+= et1011c_rust.o
+else
+  obj-$(CONFIG_LSI_ET1011C_PHY)	+= et1011c.o
+endif
 obj-$(CONFIG_LXT_PHY)		+= lxt.o
 obj-$(CONFIG_MARVELL_10G_PHY)	+= marvell10g.o
 obj-$(CONFIG_MARVELL_PHY)	+= marvell.o
diff --git a/drivers/net/phy/et1011c_rust.rs b/drivers/net/phy/et1011c_rust.rs
new file mode 100644
index 000000000000..57aa50caca47
--- /dev/null
+++ b/drivers/net/phy/et1011c_rust.rs
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2026 Artem Lytkin <iprintercanon@gmail.com>
+
+//! Rust LSI ET1011C PHY driver
+//!
+//! C version of this driver: [`drivers/net/phy/et1011c.c`](./et1011c.c)
+
+use kernel::{
+    net::phy::{self, reg::C22, DeviceId, Driver},
+    prelude::*,
+    uapi,
+};
+
+kernel::module_phy_driver! {
+    drivers: [PhyET1011C],
+    device_table: [
+        DeviceId::new_with_driver::<PhyET1011C>()
+    ],
+    name: "rust_et1011c_phy",
+    authors: ["Artem Lytkin <iprintercanon@gmail.com>"],
+    description: "Rust LSI ET1011C PHY driver",
+    license: "GPL",
+}
+
+const ET1011C_STATUS_REG: C22 = C22::vendor_specific::<0x1A>();
+const ET1011C_CONFIG_REG: C22 = C22::vendor_specific::<0x16>();
+
+const ET1011C_SPEED_MASK: u16 = 0x0300;
+const ET1011C_GIGABIT_SPEED: u16 = 0x0200;
+const ET1011C_TX_FIFO_MASK: u16 = 0x3000;
+const ET1011C_TX_FIFO_DEPTH_16: u16 = 0x1000;
+const ET1011C_GMII_INTERFACE: u16 = 0x0002;
+const ET1011C_SYS_CLK_EN: u16 = 0x0010;
+
+const BMCR_FULLDPLX: u16 = uapi::BMCR_FULLDPLX as u16;
+const BMCR_SPEED100: u16 = uapi::BMCR_SPEED100 as u16;
+const BMCR_SPEED1000: u16 = uapi::BMCR_SPEED1000 as u16;
+const BMCR_ANENABLE: u16 = uapi::BMCR_ANENABLE as u16;
+const BMCR_RESET: u16 = uapi::BMCR_RESET as u16;
+
+struct PhyET1011C;
+
+#[vtable]
+impl Driver for PhyET1011C {
+    const NAME: &'static CStr = c"ET1011C";
+    const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_model_mask(0x0282f014);
+
+    fn config_aneg(dev: &mut phy::Device) -> Result {
+        let ctl = dev.read(C22::BMCR)?;
+        let ctl = ctl & !(BMCR_FULLDPLX | BMCR_SPEED100 | BMCR_SPEED1000 | BMCR_ANENABLE);
+        dev.write(C22::BMCR, ctl | BMCR_RESET)?;
+        dev.genphy_config_aneg()
+    }
+
+    fn read_status(dev: &mut phy::Device) -> Result<u16> {
+        dev.genphy_read_status::<C22>()?;
+
+        let val = dev.read(ET1011C_STATUS_REG)?;
+        if (val & ET1011C_SPEED_MASK) == ET1011C_GIGABIT_SPEED {
+            let cfg = dev.read(ET1011C_CONFIG_REG)?;
+            let cfg = cfg & !ET1011C_TX_FIFO_MASK;
+            dev.write(
+                ET1011C_CONFIG_REG,
+                cfg | ET1011C_GMII_INTERFACE | ET1011C_SYS_CLK_EN | ET1011C_TX_FIFO_DEPTH_16,
+            )?;
+        }
+
+        Ok(0)
+    }
+}
-- 
2.43.0

