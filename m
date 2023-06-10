Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27465C77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 07:20:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjFJHUS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 03:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjFJHUR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 03:20:17 -0400
Received: from a27-24.smtp-out.us-west-2.amazonses.com (a27-24.smtp-out.us-west-2.amazonses.com [54.240.27.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1333A9B
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 00:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=q6zI4D3AUI6hwl7pOIuPi1oVdrJCnav1p6esQj47JGc=;
        b=HRgS5HI6ORWxXjmGBhQhLny0kGpcN5Z6PbnxR1mKVQP4bUYnA6QaUu3jAoyxNnaa
        zn8tQhX/5AM8gaJk5KQroAgoQgQE6RQ560hsvS5tTKqet8/y7GEcMDID0u4jHkIUE2W
        QTJAlPAfQCXhC8bxwy1oiKPD1ALfpAHVJdNxIzBCfzT4OBpkBZNUgcKJ8MQ/0/6imCu
        MsdhI2J85UnBsTKste92vyx23fX381wklbasysZaoy/8P4KDKm8SObzgDUFTWwX279R
        kfwWV52tB2DUyv1TR3unrJexJGszQSKeYnqLj4m9V0Yedr9ho8d6HT2Ydbwvt1hQUIF
        evFsmxmQow==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686381614;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=q6zI4D3AUI6hwl7pOIuPi1oVdrJCnav1p6esQj47JGc=;
        b=U+Hk3NhvM2qsesgTNJRaRs5Hk3Vt09BnD3QK3Ja5DSE5f0yyE8je1WpieJBrMYBz
        smT4RXE8sTRU85TxmjuNgRSeqmZyB6c6h3t7DMDn9y02fcWekb5tr1m8kbLC1pUgrCE
        AowcRWPPfd9uGPqoKsehDBpNbYpCrPPE+WzzKPYA=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     aliceryhl@google.com, andrew@lunn.ch,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2 5/5] samples: rust: add dummy network driver
Date:   Sat, 10 Jun 2023 07:20:14 +0000
Message-ID: <01010188a42d5620-fdafc00a-8aad-4c5e-a0b7-1fb83da6ba03-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230610071848.3722492-1-tomo@exabit.dev>
References: <20230610071848.3722492-1-tomo@exabit.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.10-54.240.27.24
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This is a simpler version of drivers/net/dummy.c.

This demonstrates the usage of abstractions for network device drivers.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 samples/rust/Kconfig           | 11 +++++
 samples/rust/Makefile          |  1 +
 samples/rust/rust_net_dummy.rs | 85 ++++++++++++++++++++++++++++++++++
 scripts/Makefile.build         |  2 +-
 4 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 samples/rust/rust_net_dummy.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b0f74a81c8f9..d631419b0d2a 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -30,6 +30,17 @@ config SAMPLE_RUST_PRINT
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_NET_DUMMY
+	tristate "Dummy network driver"
+	help
+	  This is the simpler version of drivers/net/dummy.c. No intention to replace it. This provides educational information for Rust
+	  abstractions for network drivers.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_minimal.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 03086dabbea4..440dee2971ba 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_NET_DUMMY)		+= rust_net_dummy.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/rust_net_dummy.rs b/samples/rust/rust_net_dummy.rs
new file mode 100644
index 000000000000..b5278e26e447
--- /dev/null
+++ b/samples/rust/rust_net_dummy.rs
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+//! Rust dummy netdev.
+
+use kernel::{
+    bindings, c_str,
+    net::dev::{
+        ethtool_op_get_ts_info, Device, DeviceOperations, DriverData, EtherOperations,
+        EthtoolTsInfo, Registration, RtnlLinkStats64, SkBuff, TxCode,
+    },
+    prelude::*,
+};
+
+struct DevOps {}
+
+#[vtable]
+impl<D: DriverData<Data = Box<Stats>>> DeviceOperations<D> for DevOps {
+    fn init(_dev: &mut Device, _data: &Stats) -> Result {
+        Ok(())
+    }
+
+    fn start_xmit(_dev: &mut Device, _data: &Stats, mut skb: SkBuff) -> TxCode {
+        skb.tx_timestamp();
+        TxCode::Ok
+    }
+
+    fn get_stats64(_dev: &mut Device, _data: &Stats, _stats: &mut RtnlLinkStats64) {}
+}
+
+// device driver specific information
+struct Stats {}
+
+impl DriverData for Stats {
+    type Data = Box<Stats>;
+}
+
+struct DummyNetdev {
+    _r: Registration<DevOps, Stats>,
+}
+
+struct EtherOps {}
+
+#[vtable]
+impl<D: DriverData<Data = Box<Stats>>> EtherOperations<D> for EtherOps {
+    fn get_ts_info(dev: &mut Device, _data: &Stats, info: &mut EthtoolTsInfo) -> Result {
+        ethtool_op_get_ts_info(dev, info)
+    }
+}
+
+impl kernel::Module for DummyNetdev {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        let data = Box::try_new(Stats {})?;
+        let mut r = Registration::<DevOps, Stats>::try_new(1, 1, data)?;
+        r.set_ether_operations::<EtherOps>()?;
+
+        let netdev = r.dev_get();
+        netdev.set_name(c_str!("dummy%d"))?;
+
+        netdev.set_flags(
+            netdev.get_flags()
+                | bindings::net_device_flags_IFF_NOARP & !bindings::net_device_flags_IFF_MULTICAST,
+        );
+        netdev.set_priv_flags(
+            netdev.get_priv_flags()
+                | bindings::netdev_priv_flags_IFF_LIVE_ADDR_CHANGE
+                | bindings::netdev_priv_flags_IFF_NO_QUEUE,
+        );
+        netdev.set_random_eth_hw_addr();
+        netdev.set_min_mtu(0);
+        netdev.set_max_mtu(0);
+
+        r.register()?;
+
+        pr_info!("Hello Rust dummy netdev!");
+        Ok(DummyNetdev { _r: r })
+    }
+}
+
+module! {
+    type: DummyNetdev,
+    name: "rust_net_dummy",
+    author: "Rust for Linux Contributors",
+    description: "Rust dummy netdev",
+    license: "GPL v2",
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 78175231c969..1404967e908e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -277,7 +277,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := new_uninit
+rust_allowed_features := allocator_api,new_uninit
 
 rust_common_cmd = \
 	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
-- 
2.34.1

