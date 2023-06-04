Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BED9C77B7A
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 02:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjFDCV5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 3 Jun 2023 22:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjFDCV4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 3 Jun 2023 22:21:56 -0400
X-Greylist: delayed 242 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Jun 2023 19:21:55 PDT
Received: from a27-27.smtp-out.us-west-2.amazonses.com (a27-27.smtp-out.us-west-2.amazonses.com [54.240.27.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA14DD
        for <rust-for-linux@vger.kernel.org>; Sat,  3 Jun 2023 19:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685845073;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=0Xd2aNe9dvY96m8S6vHUSucd9iL7fAdC4LRw1grit/8=;
        b=EMmFzx2hauoG3WnTFin6TH1/ZwuE0fRuNS73QxX0g0qBXUfiV/fnEHY5Fdx1AEb7
        u9sZtDavw4Gru8JKK50R11jY0Mj3StBe9qcQiMjbXQpvsqwvnbkgnVF1ieZ8LkQ7VUO
        Kxhvl+rEIvw/as2MBuonhA6pnxxk/OsFanykHH4o1kQsYp5AKnrrhVqNhMcSCL4VH+9
        k8Fe9TlD2U74p40ltwOtYQApFCefZjwH4rUfXU3ZBanrmzxwdEGejI5s3qbHaCcTCBG
        K7h8WKmN7Y8bbn5YbWoJaSW8F1EfCjuzb564SyLVU6dSB+siTUHFG1I7mIhjmFfF0ti
        65rsF1iRkg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685845073;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=0Xd2aNe9dvY96m8S6vHUSucd9iL7fAdC4LRw1grit/8=;
        b=csO3Q3LP57/75vtejuUT3ofoB4wPFNlJgrqNISz7roTkktag+A84QQ95Qa4y/hb8
        KJyFzD4PkXFT6oUzzyBD7/SJJGxCPnypOZlYh21d0u9O+ha259W7Hs/JBU/V5BwQKIh
        bTVAG+Mk/I8h20YOw1D3lhp9/sjvCAA+mso1vKtc=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 5/5] samples: rust: add dummy network driver sample
Date:   Sun, 4 Jun 2023 02:17:53 +0000
Message-ID: <0101018884325c60-be28742a-0be9-4cad-b098-0d0a20d8a5b0-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604021736.3392963-1-tomo@exabit.dev>
References: <20230604021736.3392963-1-tomo@exabit.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.04-54.240.27.27
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This is a simpler version of drivers/net/dummy.c.

This demonstrates the usage of abstractions for network device drivers.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 samples/rust/Kconfig       | 11 +++++
 samples/rust/Makefile      |  1 +
 samples/rust/rust_dummy.rs | 98 ++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.build     |  2 +-
 4 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 samples/rust/rust_dummy.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b0f74a81c8f9..0b528c0bed3e 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -30,6 +30,17 @@ config SAMPLE_RUST_PRINT
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DUMMY
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
index 03086dabbea4..c01994baaf8a 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_DUMMY)			+= rust_dummy.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/rust_dummy.rs b/samples/rust/rust_dummy.rs
new file mode 100644
index 000000000000..b551e7d3331e
--- /dev/null
+++ b/samples/rust/rust_dummy.rs
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+//! Rust dummy netdev.
+
+use core::sync::atomic::{AtomicU64, Ordering};
+use kernel::{
+    bindings, c_str,
+    net::dev::{
+        ethtool_op_get_ts_info, Device, DeviceOperations, DriverData, EtherOperations,
+        EtherOperationsAdapter, EthtoolTsInfo, Registration, RtnlLinkStats64, SkBuff, TxCode,
+    },
+    prelude::*,
+};
+
+struct DevOps {}
+
+#[vtable]
+impl<D: DriverData<Data = Box<Stats>>> DeviceOperations<D> for DevOps {
+    fn init(_dev: &mut Device, data: &Stats) -> Result {
+        data.packets.store(0, Ordering::Relaxed);
+        data.bytes.store(0, Ordering::Relaxed);
+        Ok(())
+    }
+
+    fn start_xmit(_dev: &mut Device, data: &Stats, mut skb: SkBuff) -> TxCode {
+        data.packets.fetch_add(1, Ordering::Relaxed);
+        skb.tx_timestamp();
+        TxCode::Ok
+    }
+
+    fn get_stats64(_dev: &mut Device, data: &Stats, stats: &mut RtnlLinkStats64) {
+        stats.set_tx_stats(data.packets.load(Ordering::Relaxed), 0, 0, 0);
+    }
+}
+
+#[allow(dead_code)]
+struct Stats {
+    packets: AtomicU64,
+    bytes: AtomicU64,
+}
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
+        const NAME: &'static CStr = c_str!("dummy%d");
+        let data = Box::try_new(Stats {
+            packets: AtomicU64::new(0),
+            bytes: AtomicU64::new(0),
+        })?;
+        let mut r = Registration::<DevOps, Stats>::try_new(1, 1, data)?;
+        r.set_ether_operations(EtherOperationsAdapter::<EtherOps, Stats>::new())?;
+
+        let netdev = r.dev_get();
+        netdev.set_name(NAME)?;
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
+    name: "rust_dummy",
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

