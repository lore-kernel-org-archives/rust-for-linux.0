Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995325;
	b=iHghcgxnIh0MH1zX+0SrX8lDId6Ao45psmEPvKPedJC56MrNSvsXT0mI26CB0Eub6AVk
	 QYy1CfJ57bZGvXVFz84j7uDIsWrBPVfOWUJUY3G20AGmBK5FosakPc8QG5odblDahVPIL
	 4KsTvdwCIIUSEvha5YQcVekBRmdwCvo/CMBpnxWs7oCqhA0SdhRCbJ109q+O0Yk9MgX9B
	 +kkJE9OidT0aD9C6u2XCdv2TDAoinmIbKJKa1QOHuLaJwifdXZol3a69azMlk4JdbjcwO
	 avGkp4W2A6UqZ7+13xgWHKFK1V4WH+wOE6RhJsdVOgGZvNxYOscAqp4m9lWwcUEcPxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995325;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UIOLNzeNMeOGOabzPa1El9g7evCOREjpW/YIP8YMHZA=;
	b=ZEXLQ1NuoePPCuVxxVdtiUl03e2j1mif8cQIGbNl2qDuMFDOj3Rr0TDFlFCQ3xv6AVL7
	 p3sMB3buvIK2rP9EFK/ELFX311jk/ijPNCdj2KwGXI2GINZG3JgXzV48VtsMtDfy1pv98
	 3CHq6XJdHAnAz7GP8JMDkrh3QCBKAzM4pTxTGhiFpgUvTgdD/QbQ85mJtoKdIXqO6z9lZ
	 3FM4RJXrwlMXy+dCCkwl9NmvgbKEDW5MBaeGA+vcp6Vryu/8nSNkJSEZsAZscBbbs151G
	 Gcy17vufV0UQjqScXBZACnKTVyrC+OMScVN4nCNCly47A/cFuU3hiSqc16QwowWhqxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=JnqsjPxn;
	arc=none smtp.remote-ip=162.62.57.210
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC6C606A31E;
	Mon, 26 Oct 2026 06:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC6C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=JnqsjPxn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792995318; bh=UIOLNzeNMeOGOabzPa1El9g7evCOREjpW/YIP8YMHZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JnqsjPxn2FqH0oR38w1WoAbphqPpfb+hbW7R4yZBOvj/vlS56vZ5qXNBKtNk1jnBE
	 3MGQp5BKoxcmOMRs8VovDx/6p69fMqGux9mDbxfgrTpR4fWTFCk+53ahzJXAG+Hwu0
	 WQYlV69DKBEi+BbY9ofNZa4oSJ3i2c6/RxvOrfC8=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3CC94AE4; Mon, 26 Oct 2026 14:15:12 +0800
X-QQ-mid: xmsmtpt1792995316t7s35r5a7
Message-ID: <tencent_AE55FEAA6903D75FAC74A2CB1D4A5A9B2505@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uDTLJV33ebXEMOT6Gr24RSFj0FnNBJtRxv2Xt1be+PTl1+GJU8w
	 7iLyScl6SCrfyyYs+72hNQflgtegwOjePkQ3FdAHaUAJBXrrFb0RAOdu0uC6leDWnlz3Fqds8684
	 nm/Oe4e1aJ1kj93kua/IDEby5Oh/8UT/ZM+uZPGgUQ7N/RC5VD3OyrNG/4k8e72mZBS+cJozT2L2
	 5gslgAD5wSuwyfN2XauP/IfHoUWh2EIQN8cNfzFRx3cihxnfc1M4MwqwpCKIkOowXVgm7LgaXV0Z
	 Upb5aAjlNEPyqw7gycGSVeOMkNjAo+4Xv7iL7of1qhUPEXNzc+SRinerWCEZ+N7hiI2LM1dyGDke
	 b05vShkX52kkIi8L0Dyusw8jmzuZL0RU4voSfPkenxEIU0wvwYypYZ7hdaE9kNnKe/t+fYMmVEXT
	 ITa5/5GOB4rUGToqEcDJhmWuIobh8VjunnhQ0MxVpw9pRsskzb19JGl6uVgLUw3/NL/ObpGg9JbV
	 GSbV1coHB0PFbVsul6h2sz20XaKnE/2jW9H8icQtgzoNuwMjzwTtY995onmjty1wb2b/4T5GGEdh
	 0fIPHY8+lOzyxWWRfiz8mcD0MviWN7yZeb4nGE4oc8j9CZmhlRQO+kFXVuCM4Jq8S6ajprcVLVz5
	 Qq7CHtO5UWV+biKolWRNNCEd6Og47g6OSEujrO+yV9pW+74AWgkuZySkQFWqIixo5l+78ki3BmbB
	 rpuZPmId8Y2aGwDxHegJOclmhsTC/NEqRS1bg+LITQXMDu/u5HXJbsh654n9ZnnpF9azQ2mMiLIM
	 n0LD6Lq4Mzq2JU5QVPfsurm+Wh+YSvG7VsednbiyHVCRXCyo6dGINY5a5tWE8V7xlN83B+4gz7vW
	 NEVHxayBWCqyKyd5jAX4oiazbHnryKYFnb6PwEl4njlNTQVhA5oDnq5D3sdGfO/oSKwv0qmM4Dhr
	 5lmXm/VAr1hCEzfgkvX4vDd8NBi9KiLTnvfEAuQxJtOXM8cJmpAMFn/Nn0fqp3/rAry7+oOoJYi/
	 6Muo5+bwlbxYBc9qrNm5QXEMWDmbOlLJs6jjQujSWjuE+SPeX9eJn9LxG2yP2TGVBNPXEo2x14R6
	 1qMD3htq3KZRKf0qHdYrZ5oQlDpg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Shuai Liu <847807867@qq.com>
To: spi-devel-general@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: broonie@kernel.org,
	ojeda@kernel.org,
	dakr@kernel.org,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH 3/3] samples: rust: add SPI driver sample
Date: Mon, 26 Oct 2026 14:15:12 +0800
X-OQ-MSGID: <20261026061512.4180202-4-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026061512.4180202-1-847807867@qq.com>
References: <20261026061512.4180202-1-847807867@qq.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a sample driver for the Rust SPI abstractions to demonstrate their
usage.

Signed-off-by: Shuai Liu <847807867@qq.com>
---
 samples/rust/Kconfig            | 11 ++++++
 samples/rust/Makefile           |  1 +
 samples/rust/rust_driver_spi.rs | 66 +++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 samples/rust/rust_driver_spi.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 31d62533ef25..f99bf52654a1 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -84,6 +84,17 @@ config SAMPLE_RUST_DEBUGFS_SCOPED
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_SPI
+	tristate "SPI Driver"
+	depends on SPI=y
+	help
+	  This option builds the Rust SPI driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_spi.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_I2C
 	tristate "I2C Driver"
 	depends on I2C=y
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index b986b681cde5..efe04638a990 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SAMPLE_RUST_DEBUGFS)		+= rust_debugfs.o
 obj-$(CONFIG_SAMPLE_RUST_DEBUGFS_SCOPED)	+= rust_debugfs_scoped.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_SPI)		+= rust_driver_spi.o
 obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
diff --git a/samples/rust/rust_driver_spi.rs b/samples/rust/rust_driver_spi.rs
new file mode 100644
index 000000000000..7eee7b735794
--- /dev/null
+++ b/samples/rust/rust_driver_spi.rs
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust SPI driver sample.
+
+use kernel::{
+    device::Core,
+    of,
+    prelude::*,
+    spi, //
+};
+
+struct SampleDriver;
+
+kernel::spi_device_table! {
+    SPI_TABLE,
+    <SampleDriver as spi::Driver>::IdInfo,
+    [(spi::DeviceId::new(c"rust_driver_spi"), 0)]
+}
+
+kernel::of_device_table! {
+    OF_TABLE,
+    <SampleDriver as spi::Driver>::IdInfo,
+    [(of::DeviceId::new(c"test,rust_driver_spi"), 0)]
+}
+
+impl spi::Driver for SampleDriver {
+    type IdInfo = u32;
+    type Data<'bound> = Self;
+
+    const SPI_ID_TABLE: Option<spi::IdTable<Self::IdInfo>> = Some(&SPI_TABLE);
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe<'bound>(
+        sdev: &'bound spi::SpiDevice<Core<'_>>,
+        info: Option<&'bound Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> + 'bound {
+        let dev = sdev.as_ref();
+
+        dev_info!(dev, "Probe Rust SPI driver sample.\n");
+        dev_info!(dev, "max_speed_hz: {}.\n", sdev.max_speed_hz());
+        dev_info!(dev, "bits_per_word: {}.\n", sdev.bits_per_word());
+        dev_info!(dev, "mode: {:#x}.\n", sdev.mode());
+
+        if let Some(info) = info {
+            dev_info!(dev, "Probed with info: '{}'.\n", info);
+        }
+
+        Ok(Self)
+    }
+
+    fn shutdown<'bound>(sdev: &'bound spi::SpiDevice<Core<'_>>, _this: Pin<&Self>) {
+        dev_info!(sdev.as_ref(), "Shutdown Rust SPI driver sample.\n");
+    }
+
+    fn unbind<'bound>(sdev: &'bound spi::SpiDevice<Core<'_>>, _this: Pin<&Self>) {
+        dev_info!(sdev.as_ref(), "Unbind Rust SPI driver sample.\n");
+    }
+}
+
+kernel::module_spi_driver! {
+    type: SampleDriver,
+    name: "rust_driver_spi",
+    authors: ["Shuai Liu"],
+    description: "Rust SPI driver",
+    license: "GPL v2",
+}
-- 
2.43.0

