Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799537105C;
	Wed, 28 Jan 2026 18:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624991; cv=none; b=f+TVAaRplU+FV3V86/NF1sOgnEWN/DtsS8J05kRW86XSOWFaq2lg51Pj7p3oZoUHhNtJf+TkQ5DvF7b740j9B+4nU1JM3oCgScw7l7JXWTkdKFkqMKwc+kXSUI+E9CaOQ3lFcY+LtRB6GNtzgW78GUso7lsB0iBA6ekeWqlgZoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624991; c=relaxed/simple;
	bh=enCdY+GUGxoQci/ulFuQFQ6dafNy8HAatx8DOExTxcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unQ0pqUmL1qgkQPJET0a1RgYeTDYs39+s85fd1JqAo+7VZaK3tH+4/OK/x2p+skFxSM9JqR5f9s/rmkTMZBcIok5tvDkGJScUTdBzBNsX8/GRGAO8wui0TVzNvWCbOtHk8Hk+Bvh+QGm7/KebkL0TVpbn016GuTRaYgdTsNgZnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 4FB08F43B1C; Wed, 28 Jan 2026 19:29:47 +0100 (CET)
From: Link Mauve <linkmauve@linkmauve.fr>
To: rust-for-linux@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Tamir Duberstein <tamird@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] =?UTF-8?q?nvmem:=20Replace=20the=20Wii=20and=20Wi?= =?UTF-8?q?i=E2=80=AFU=20OTP=20driver=20with=20a=20Rust=20one?=
Date: Wed, 28 Jan 2026 19:29:22 +0100
Message-ID: <20260128182925.13225-4-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128182925.13225-1-linkmauve@linkmauve.fr>
References: <20260128182925.13225-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I wrote this driver long ago, and wanted to try seeing how hard it would
be to convert it to Rust.

I don’t have access to my Wii U at the moment, so I’ve only tested that
this module builds without error or warning, but not tested it on the
hardware, hence the RFC status of this series.

It is a very simple driver, we write the address we want to read in one
memory address, and read the data from a second memory address.  A third
memory address can be used to disable all reads in a range until the
system has been rebooted, but I didn’t find any reason to expose that
feature.

I made sure to use no unsafe in this driver, to make sure the API
exposed in the previous commit is usable.

There is no function to read a 32-bit value in big-endian yet, but this
driver will exclusively run on big-endian PowerPC 32 anyway, so it
shouldn’t be an issue to use io.read32() and io.write32().

Ideally we wouldn’t have to impl the write() function in
NintendoOtpProvider, but currently the vtable requires both.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/Makefile        |   2 +-
 drivers/nvmem/nintendo-otp.c  | 122 ------------------------------
 drivers/nvmem/nintendo_otp.rs | 137 ++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+), 123 deletions(-)
 delete mode 100644 drivers/nvmem/nintendo-otp.c
 create mode 100644 drivers/nvmem/nintendo_otp.rs

diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 7252b8ec88d4..3d40a0a23f76 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -51,7 +51,7 @@ nvmem_mtk-efuse-y			:= mtk-efuse.o
 obj-$(CONFIG_NVMEM_MXS_OCOTP)		+= nvmem-mxs-ocotp.o
 nvmem-mxs-ocotp-y			:= mxs-ocotp.o
 obj-$(CONFIG_NVMEM_NINTENDO_OTP)	+= nvmem-nintendo-otp.o
-nvmem-nintendo-otp-y			:= nintendo-otp.o
+nvmem-nintendo-otp-y			:= nintendo_otp.o
 obj-$(CONFIG_NVMEM_QCOM_QFPROM)		+= nvmem_qfprom.o
 nvmem_qfprom-y				:= qfprom.o
 obj-$(CONFIG_NVMEM_QCOM_SEC_QFPROM)	+= nvmem_sec_qfprom.o
diff --git a/drivers/nvmem/nintendo-otp.c b/drivers/nvmem/nintendo-otp.c
deleted file mode 100644
index 355e7f1fc6d5..000000000000
--- a/drivers/nvmem/nintendo-otp.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Nintendo Wii and Wii U OTP driver
- *
- * This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
- *
- * This memory contains common and per-console keys, signatures and
- * related data required to access peripherals.
- *
- * Based on reversed documentation from https://wiiubrew.org/wiki/Hardware/OTP
- *
- * Copyright (C) 2021 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
- */
-
-#include <linux/device.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/mod_devicetable.h>
-#include <linux/nvmem-provider.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
-
-#define HW_OTPCMD  0
-#define HW_OTPDATA 4
-#define OTP_READ   0x80000000
-#define BANK_SIZE  128
-#define WORD_SIZE  4
-
-struct nintendo_otp_priv {
-	void __iomem *regs;
-};
-
-struct nintendo_otp_devtype_data {
-	const char *name;
-	unsigned int num_banks;
-};
-
-static const struct nintendo_otp_devtype_data hollywood_otp_data = {
-	.name = "wii-otp",
-	.num_banks = 1,
-};
-
-static const struct nintendo_otp_devtype_data latte_otp_data = {
-	.name = "wiiu-otp",
-	.num_banks = 8,
-};
-
-static int nintendo_otp_reg_read(void *context,
-				 unsigned int reg, void *_val, size_t bytes)
-{
-	struct nintendo_otp_priv *priv = context;
-	u32 *val = _val;
-	int words = bytes / WORD_SIZE;
-	u32 bank, addr;
-
-	while (words--) {
-		bank = (reg / BANK_SIZE) << 8;
-		addr = (reg / WORD_SIZE) % (BANK_SIZE / WORD_SIZE);
-		iowrite32be(OTP_READ | bank | addr, priv->regs + HW_OTPCMD);
-		*val++ = ioread32be(priv->regs + HW_OTPDATA);
-		reg += WORD_SIZE;
-	}
-
-	return 0;
-}
-
-static const struct of_device_id nintendo_otp_of_table[] = {
-	{ .compatible = "nintendo,hollywood-otp", .data = &hollywood_otp_data },
-	{ .compatible = "nintendo,latte-otp", .data = &latte_otp_data },
-	{/* sentinel */},
-};
-MODULE_DEVICE_TABLE(of, nintendo_otp_of_table);
-
-static int nintendo_otp_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	const struct of_device_id *of_id =
-		of_match_device(nintendo_otp_of_table, dev);
-	struct nvmem_device *nvmem;
-	struct nintendo_otp_priv *priv;
-
-	struct nvmem_config config = {
-		.stride = WORD_SIZE,
-		.word_size = WORD_SIZE,
-		.reg_read = nintendo_otp_reg_read,
-		.read_only = true,
-		.root_only = true,
-	};
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(priv->regs))
-		return PTR_ERR(priv->regs);
-
-	if (of_id->data) {
-		const struct nintendo_otp_devtype_data *data = of_id->data;
-		config.name = data->name;
-		config.size = data->num_banks * BANK_SIZE;
-	}
-
-	config.dev = dev;
-	config.priv = priv;
-
-	nvmem = devm_nvmem_register(dev, &config);
-
-	return PTR_ERR_OR_ZERO(nvmem);
-}
-
-static struct platform_driver nintendo_otp_driver = {
-	.probe = nintendo_otp_probe,
-	.driver = {
-		.name = "nintendo-otp",
-		.of_match_table = nintendo_otp_of_table,
-	},
-};
-module_platform_driver(nintendo_otp_driver);
-MODULE_AUTHOR("Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>");
-MODULE_DESCRIPTION("Nintendo Wii and Wii U OTP driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/nvmem/nintendo_otp.rs b/drivers/nvmem/nintendo_otp.rs
new file mode 100644
index 000000000000..d1906c7348b3
--- /dev/null
+++ b/drivers/nvmem/nintendo_otp.rs
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Nintendo Wii and Wii U OTP driver
+//!
+//! This is a driver exposing the OTP of a Nintendo Wii or Wii U console.
+//!
+//! This memory contains common and per-console keys, signatures and
+//! related data required to access peripherals.
+//!
+//! Based on reversed documentation from https://wiiubrew.org/wiki/Hardware/OTP
+//!
+//! Copyright (C) 2021 Link Mauve <linkmauve@linkmauve.fr>
+
+use kernel::{
+    c_str,
+    device::Core,
+    io::Io,
+    nvmem::{self, NvmemConfig, NvmemProvider},
+    of::{DeviceId, IdTable},
+    platform,
+    prelude::*,
+    sync::aref::ARef,
+};
+
+const HW_OTPCMD: usize = 0;
+const HW_OTPDATA: usize = 4;
+const OTP_READ: u32 = 0x80000000;
+const BANK_SIZE: u32 = 128;
+const WORD_SIZE: u32 = 4;
+
+struct Info {
+    name: &'static CStr,
+    num_banks: u32,
+}
+
+const WII_INFO: Info = Info {
+    name: c_str!("wii-otp"),
+    num_banks: 1,
+};
+
+const WIIU_INFO: Info = Info {
+    name: c_str!("wiiu-otp"),
+    num_banks: 8,
+};
+
+struct NintendoOtpDriver {
+    pdev: ARef<platform::Device>,
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <NintendoOtpDriver as platform::Driver>::IdInfo,
+    [
+        (DeviceId::new(c_str!("nintendo,hollywood-otp")), WII_INFO),
+        (DeviceId::new(c_str!("nintendo,latte-otp")), WIIU_INFO),
+    ]
+);
+
+#[derive(Default)]
+struct NintendoOtpProvider;
+
+#[vtable]
+impl NvmemProvider for NintendoOtpProvider {
+    type Priv = Io<8>;
+
+    fn read(io: &Self::Priv, mut reg: u32, mut data: &mut [u8]) -> Result {
+        loop {
+            let Some(bytes) = data.split_off_mut(..4) else {
+                break;
+            };
+            let bank = (reg / BANK_SIZE) << 8;
+            let addr = (reg / WORD_SIZE) % (BANK_SIZE / WORD_SIZE);
+            io.write32(OTP_READ | bank | addr, HW_OTPCMD);
+            let elem = io.read32(HW_OTPDATA);
+            bytes.copy_from_slice(&elem.to_be_bytes());
+            reg += WORD_SIZE;
+        }
+
+        Ok(())
+    }
+
+    fn write(_context: &Self::Priv, _offset: u32, _data: &[u8]) -> Result {
+        Err(ENODEV)
+    }
+}
+
+impl platform::Driver for NintendoOtpDriver {
+    type IdInfo = Info;
+    const OF_ID_TABLE: Option<IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<Core>,
+        info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        let dev = pdev.as_ref();
+
+        let Some(Info { name, num_banks }) = info else {
+            return Err(EINVAL);
+        };
+
+        dev_info!(dev, "Probed as '{name}', num_banks = {num_banks}.\n");
+
+        let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
+        let iomem = request.iomap_exclusive_sized::<8>();
+        let iomem = KBox::pin_init(iomem, GFP_KERNEL)?;
+
+        let io = iomem.access(dev)?;
+
+        let mut config = NvmemConfig::<NintendoOtpProvider>::default();
+        config.set_name(name);
+        config.set_type(nvmem::Type::Otp);
+        config.set_size((num_banks * BANK_SIZE) as i32);
+        config.set_word_size(WORD_SIZE as i32);
+        config.set_stride(WORD_SIZE as i32);
+        config.set_read_only(true);
+        config.set_root_only(true);
+        config.set_priv(io);
+        config.set(dev);
+
+        Ok(Self { pdev: pdev.into() })
+    }
+}
+
+impl Drop for NintendoOtpDriver {
+    fn drop(&mut self) {
+        dev_dbg!(self.pdev.as_ref(), "Remove Rust Platform driver sample.\n");
+    }
+}
+
+kernel::module_platform_driver! {
+    type: NintendoOtpDriver,
+    name: "nintendo-otp",
+    authors: ["Link Mauve <linkmauve@linkmauve.fr>"],
+    description: "Nintendo Wii and Wii U OTP driver",
+    license: "GPL v2",
+}
-- 
2.52.0

