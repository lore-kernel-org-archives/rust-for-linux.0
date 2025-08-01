Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CBB27AC35
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754063232; cv=none; b=p42ZvbP7dntyTWB/KiA/UQ7w6QLjL5YDLp0PmgwtooWniY81fnIpJk/qhVwzVaZLWHNO8mQdhgDdibDvvj61sHRvgjt5pPziqFTkJ6zW32K9XGBwiiOp6wV9a7GadDhI9spB9zdaVjBQmF4bpYegINfzykXGcWJzsF0IGg/9k/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754063232; c=relaxed/simple;
	bh=MsKdNvAQS5N0B4BBt1vJ4qLRDoGSp4r6XzG+Naaex9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQzhZ6Rco7zjE1yR0wLWLY8eIgpcCI7M6W5auo68i7OmbWwc2DUcA5ra+IJzV6p9N/yLpC400nDarpHzwEiWutrTBef3s6Nv/JpbcpgtcEs2B5dH0sCFn/UTZp6b50grff5L2LasXT0/0XsIWQnl3g5ZVogxsJ6R1p8jMjST6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mShe0f2u; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mShe0f2u"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-455b00339c8so13382425e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754063228; x=1754668028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIlQcLynpxZEfUrRHwBFfQIvo7QEtFXIeIO+rL2ecJI=;
        b=mShe0f2uzxdAVR+7BjlKkUFvP+bc2uLZLOnDpmqhIr+z1bj5wE+WfA4EHOTFaERi1y
         hYaXDYov1ikRV2vN8pc+9PmCmTP8H8dQQDrVXN+cuETWYCVQRoRPU/y4vyVPBL2kEUs7
         eA9W8qRopN2aLIBko11Aj4AyCYTxroa1a2kABOJqM2jQOwpH7AG+TsA6edPogPpRot5m
         2fKUe8QfxjmMl+SZ2vgZkAWNH4mzXrIfBCe/yboGYrmsPFfozZ+isvd7uqazK35y85Hw
         vCB+OcTM0f+khdvhQ+1guVLWT6YVrQ4V+Tgxh+oUKA2Ecu+mX+Cp1erLi2FdG2ZVHz/n
         0qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754063228; x=1754668028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UIlQcLynpxZEfUrRHwBFfQIvo7QEtFXIeIO+rL2ecJI=;
        b=VxPu1k8j3s5Jndjbcq39zuU44M/E7PhIOzOuJJ4UwFzc0Y91jeklZwiGJWCbL8PmZ3
         ocHco5V+89CVs3zuq23t4Ay4on5Qa8n6G7RzmuNZU/gheeMW8hCSTc4izrgnBm+oNe8D
         OTY3Aa7r/qqxFU7KnQvvTIlwgnIchxQqkPTLIWbmVcoEDW0pT9RrniEE8IOOCWDCW4HR
         2rHMe5BufctYu+Fwr3Q/H0Uir3GuIxZS/qXOFhEVH5k2Tw4Izfz0WuJoOnWh8WarEn4r
         UjvXJPyySV7koQVIyAmfzNPGpy2hPdWS81vLxl7m2zbLCA1TTXyQEIe1a8be2Ytct2A7
         e4wA==
X-Forwarded-Encrypted: i=1; AJvYcCUXj0KgTDghgFf573MTpzCRRpM42Ry0eEBQS9omyTKgLXo8J5/G1lsxcpGBMTyDQOfk7O9KPUpy82TnV8fA4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5gPumlCZkEsiqhtT+/Ncv/vj1Hfm+r8+zRhU10jYiRkS7POnL
	dPKoe/SfRs+6HlWui3aMkkN88oakxiJr9c0NFNlWH6Kh0aNYPCZwXT3s
X-Gm-Gg: ASbGncvAHo3KCqUP0eQYRCyj966fY2tRIJS8UkxdXub+KIFHnkJS3RbXja7uOGX4Jfe
	/qIbAWWbP4LMFfM/dxBvranhZujdHLATncSrLcy2dO1UIjejACvZCE3IIfyQmJADVeh/ZK5ZxiA
	skLD/QOdFRIcWMAMYDEIHUhypdE3V/BIywIE54Y5Pk62D7/QVFnwCKDXx/u/nuThiQuWuNvyJ2W
	tDe7uj4unnn1wCT8v1Cjc7erRbZU75NL+RlsPgRyXCPN0f1oI2vkdWkzTv+q4sULuKHL8FxmO+h
	obdlqZcgEqi8YizSNLolh0Mc5CgdtPWCDnEe96REsVnwegZDFiototZkmW9aoMHUFwx9g6LyZZi
	/xWQepvd3n+teprXRhruko/0/Pr9hY0MhDs+JHC0GXMPdMLJbUPhUZkyJR9MnpYW7ivzcz6WE
X-Google-Smtp-Source: AGHT+IG3jlDwcvpLI1ZcnPQU5yjnRJN5hwcirlJs0vT7IjjU1cMjP7RxleTZA+VlWxfuyMRwUyv7uA==
X-Received: by 2002:a5d:5d10:0:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3b8d94c2141mr189770f8f.49.1754063228160;
        Fri, 01 Aug 2025 08:47:08 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8d5ceb305sm2025452f8f.31.2025.08.01.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:47:07 -0700 (PDT)
Sender: Igor Korotin <igorkor.3vium@gmail.com>
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 3/3] samples: rust: add Rust I2C sample driver
Date: Fri,  1 Aug 2025 16:45:06 +0100
Message-ID: <20250801154506.14810-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new `rust_driver_i2c` sample, showing how to create a new
i2c client using `i2c::Registration` and bind a driver to it
via legacy I2C-ID table.

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |   1 +
 samples/rust/Kconfig            |  11 ++++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_driver_i2c.rs | 106 ++++++++++++++++++++++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 samples/rust/rust_driver_i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 767beaa0f7c2..69312298ea01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11520,6 +11520,7 @@ R:	Danilo Krummrich <dakr@kernel.org>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 F:	rust/kernel/i2c.rs
+F:	samples/rust/rust_driver_i2c.rs
 
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 7f7371a004ee..28dae070b365 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -62,6 +62,17 @@ config SAMPLE_RUST_DMA
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_I2C
+	tristate "I2C Driver"
+	depends on I2C=y
+	help
+	  This option builds the Rust I2C driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_i2c.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_PCI
 	tristate "PCI Driver"
 	depends on PCI
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index bd2faad63b4f..141d8f078248 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
diff --git a/samples/rust/rust_driver_i2c.rs b/samples/rust/rust_driver_i2c.rs
new file mode 100644
index 000000000000..20815efc933e
--- /dev/null
+++ b/samples/rust/rust_driver_i2c.rs
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C driver sample.
+//!
+//! This module shows how to:
+//! 1. Manually create an `i2c_client` at address `SAMPLE_I2C_CLIENT_ADDR`
+//!    on the adapter with index `SAMPLE_I2C_ADAPTER_INDEX`.
+//! 2. Register a matching Rust-based I2C driver for that client.
+//!
+//! # Requirements
+//! - The target system must expose an I2C adapter at index
+//!   `SAMPLE_I2C_ADAPTER_INDEX`.
+//! - To emulate an adapter for testing, you can load the
+//!   `i2c-stub` kernel module.
+//!
+
+use kernel::{acpi, c_str, device::Core, i2c, of, prelude::*, types::ARef};
+
+const SAMPLE_I2C_CLIENT_ADDR: u16 = 0x30;
+const SAMPLE_I2C_ADAPTER_INDEX: i32 = 0;
+const BOARD_INFO: i2c::I2cBoardInfo =
+    i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), SAMPLE_I2C_CLIENT_ADDR);
+
+struct SampleDriver {
+    pdev: ARef<i2c::Device>,
+}
+
+kernel::acpi_device_table! {
+    ACPI_TABLE,
+    MODULE_ACPI_TABLE,
+    <SampleDriver as i2c::Driver>::IdInfo,
+    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), 0)]
+}
+
+kernel::i2c_device_table! {
+    I2C_TABLE,
+    MODULE_I2C_TABLE,
+    <SampleDriver as i2c::Driver>::IdInfo,
+    [(i2c::DeviceId::new(c_str!("rust_driver_i2c")), 0)]
+}
+
+kernel::of_device_table! {
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SampleDriver as i2c::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("test,rust_driver_i2c")), 0)]
+}
+
+impl i2c::Driver for SampleDriver {
+    type IdInfo = u32;
+
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
+    const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(pdev: &i2c::Device<Core>, info: Option<&Self::IdInfo>) -> Result<Pin<KBox<Self>>> {
+        let dev = pdev.as_ref();
+
+        dev_dbg!(dev, "Probe Rust I2C driver sample.\n");
+
+        if let Some(info) = info {
+            dev_info!(dev, "Probed with info: '{}'.\n", info);
+        }
+
+        let drvdata = KBox::new(Self { pdev: pdev.into() }, GFP_KERNEL)?;
+
+        Ok(drvdata.into())
+    }
+    fn shutdown(pdev: &i2c::Device<Core>) {
+        dev_dbg!(pdev.as_ref(), "Shutdown Rust I2C driver sample.\n");
+    }
+}
+
+impl Drop for SampleDriver {
+    fn drop(&mut self) {
+        dev_dbg!(self.pdev.as_ref(), "Remove Rust I2C driver sample.\n");
+    }
+}
+
+// NOTE: The code below is expanded macro module_i2c_driver. It is not used here
+//       because we need to manually create an I2C client in `init()`. The macro
+//       hides `init()`, so to demo client creation on adapter SAMPLE_I2C_ADAPTER_INDEX
+//       we expand it by hand.
+type Ops<T> = kernel::i2c::Adapter<T>;
+#[kernel::prelude::pin_data]
+struct DriverModule {
+    #[pin]
+    _driver: kernel::driver::Registration<Ops<SampleDriver>>,
+    _reg: i2c::Registration,
+}
+
+impl kernel::InPlaceModule for DriverModule {
+    fn init(
+        module: &'static kernel::ThisModule,
+    ) -> impl ::pin_init::PinInit<Self, kernel::error::Error> {
+        let adapter = i2c::I2cAdapterRef::get(SAMPLE_I2C_ADAPTER_INDEX);
+
+        kernel::try_pin_init!(Self {
+            _reg <- i2c::Registration::new(&adapter.unwrap(), &BOARD_INFO),
+            _driver<-kernel::driver::Registration::new(<Self as kernel::ModuleMetadata>::NAME,module,),
+        })
+    }
+}
+kernel::prelude::module! {
+    type:DriverModule,name:"rust_driver_i2c",authors:["Igor Korotin"],description:"Rust I2C driver",license:"GPL v2",
+}
-- 
2.43.0

