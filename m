Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9E1DDC8
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 13:36:18 +0000 (UTC)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E685819B6
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 06:36:17 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a9cedb9c8cso414144b6e.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694612177; x=1695216977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7MRq1KBcU07aRbgW+PduDr6zR1MoTGFDjlEtLqdaWM=;
        b=qHa2Vn/Y2bmuBmlYgecbMC273oY/Jcr73FO+X6MsqRsZfswBQSdm116Z3zyAQ4Kew7
         7TglqwObr8fonJ1xZw95xDvP53UzCmSwgsbU9B5qw09hPGddwXyuNXLHymgq+zjtqMEq
         6LxkY3QUCKmLmgdb3YEXC5DODypKqQz+9+tp0oVxId+EDvwglNOTh+9DPp1HPP7jhpp3
         DFH8yILgELPs+ELpdasK4lGGjdeiw96NFwEKiShSc1ReuC0oiRdJLQXsPaPBzryLx28m
         cA5tJ8t+VeF+zpqVZi9s1uaXCujjqoOMhkIJAvNAY9eaxr/rBQqUfppdjay4d6wX5clp
         jC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694612177; x=1695216977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7MRq1KBcU07aRbgW+PduDr6zR1MoTGFDjlEtLqdaWM=;
        b=gMstmgQ57557lLAc6Vsrgvtohrx6FuMVXIhO/RRaPwdwfa1oI4YZMMo/0/agMQAr1d
         0oFIGHcxgpvizEUnq/pcT+fQqXCV7ZgtSuOPG4j57kdNVtQPETLysO59Zwg0qJwhgQP8
         8oo75bTL7Wi3FK7/tipMEfs+tvflxPhBfXdjOh7m14T1XVmsSLHSXvZQ2HemQgchqmjK
         FN9RSlMNYV3/E5TH2ecjT6UIhY2ve8kDV2+HP/cR/8v2Jc8CDrNwoI3D6ySBPgxguo8z
         a/B6wOUug75OpccDJOyplmnxKvYQqGQlwcEyaXwblB8db9GyIvoxSO/I8K/JTvCz5caK
         cudQ==
X-Gm-Message-State: AOJu0YykckZjiKDVJeI4zMA90sREPqddDJCMPcbizYsl/Bgu5cBxY9ka
	d4i3xE2H0ndm3kdiol74bXX+4NCGfcdpsw==
X-Google-Smtp-Source: AGHT+IG12DGl6Rt4XeUpB+Iz6Av8zyZ/8UXJM6p6fT9u0bQsvLWg5csrxQ0Oj7HT5mgpB3utdCdvpg==
X-Received: by 2002:a05:6808:3247:b0:3a9:e8e2:579d with SMTP id cc7-20020a056808324700b003a9e8e2579dmr2588231oib.2.1694612177017;
        Wed, 13 Sep 2023 06:36:17 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id l14-20020a63700e000000b00573f82bb00esm8866602pgc.2.2023.09.13.06.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 06:36:16 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: andrew@lunn.ch
Subject: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Date: Wed, 13 Sep 2023 22:36:09 +0900
Message-Id: <20230913133609.1668758-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the simpler version of drivers/net/phy/ax88796b.c. The C
driver implements three PHY drivers but this implements only one,
AX88772A PHY. This provides educational information for Rust
abstractions for network PHY drivers.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 samples/rust/Kconfig          |  13 +++++
 samples/rust/Makefile         |   1 +
 samples/rust/rust_ax88796b.rs | 105 ++++++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 samples/rust/rust_ax88796b.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b0f74a81c8f9..c1057f0d26f6 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -30,6 +30,19 @@ config SAMPLE_RUST_PRINT
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_NET_AX88796B_PHY
+	tristate "Asix PHYs"
+	help
+	  This is the simpler version of drivers/net/phy/ax88796b.c.
+	  Currently supports only AX88772A PHY. This provides
+	  educational information for Rust abstractions for network PHY drivers.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_print.
+
+	  If unsure, say N.
+
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 03086dabbea4..0f296e1c5efc 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_NET_AX88796B_PHY)	+= rust_ax88796b.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/rust_ax88796b.rs b/samples/rust/rust_ax88796b.rs
new file mode 100644
index 000000000000..0857329d8133
--- /dev/null
+++ b/samples/rust/rust_ax88796b.rs
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust Asix PHYs driver
+use kernel::c_str;
+use kernel::net::phy;
+use kernel::prelude::*;
+
+module! {
+    type: RustAsixPhy,
+    name: "rust_asix_phy",
+    author: "Rust for Linux Contributors",
+    description: "Rust Asix PHYs driver",
+    license: "GPL",
+}
+
+const MII_BMCR: u32 = 0x00;
+const BMCR_SPEED100: u32 = 0x2000;
+const BMCR_FULLDPLX: u32 = 0x0100;
+
+struct PhyAx88772A {}
+
+impl PhyAx88772A {
+    const PHY_ID_ASIX_AX88772A: u32 = 0x003b1861;
+}
+
+#[vtable]
+impl phy::Driver for PhyAx88772A {
+    const FLAGS: u32 = phy::PHY_IS_INTERNAL;
+
+    fn match_phy_device(dev: &mut phy::Device) -> bool {
+        dev.id() == Self::PHY_ID_ASIX_AX88772A
+    }
+
+    fn read_status(dev: &mut phy::Device) -> Result {
+        dev.update_link()?;
+        if !dev.link() {
+            return Ok(());
+        }
+        let ret = dev.read(MII_BMCR)?;
+
+        if ret as u32 & BMCR_SPEED100 != 0 {
+            dev.set_speed(100);
+        } else {
+            dev.set_speed(10);
+        }
+
+        let duplex = ret as u32 & BMCR_FULLDPLX != 0;
+        dev.set_duplex(duplex);
+
+        dev.read_lpa()?;
+
+        if dev.is_autoneg_enabled() && dev.is_autoneg_completed() {
+            dev.resolve_aneg_linkmode();
+        }
+
+        Ok(())
+    }
+
+    fn suspend(dev: &mut phy::Device) -> Result {
+        dev.suspend()
+    }
+
+    fn resume(dev: &mut phy::Device) -> Result {
+        dev.resume()
+    }
+
+    fn soft_reset(dev: &mut phy::Device) -> Result {
+        dev.write(MII_BMCR, 0)?;
+        dev.soft_reset()
+    }
+
+    fn link_change_notify(dev: &mut phy::Device) {
+        if dev.state() == phy::DeviceState::NoLink {
+            let _ = dev.init_hw();
+            let _ = dev.start_aneg();
+        }
+    }
+}
+
+struct RustAsixPhy {
+    _reg: phy::Registration<1>,
+}
+
+impl kernel::Module for RustAsixPhy {
+    fn init(module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Rust Asix phy driver\n");
+        let mut reg: phy::Registration<1> = phy::Registration::new(module);
+
+        reg.register(&phy::Adapter::<PhyAx88772A>::new(c_str!(
+            "Asix Electronics AX88772A"
+        )))?;
+        Ok(RustAsixPhy { _reg: reg })
+    }
+}
+
+impl Drop for RustAsixPhy {
+    fn drop(&mut self) {
+        pr_info!("Rust Asix phy driver (exit)\n");
+    }
+}
+
+kernel::phy_module_device_table!(
+    __mod_mdio__asix_tbl_device_table,
+    [(PhyAx88772A::PHY_ID_ASIX_AX88772A, 0xffffffff)]
+);
-- 
2.34.1

