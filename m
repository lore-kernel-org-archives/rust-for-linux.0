Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EEF2E1743
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293410; cv=none; b=is2I1aBY06JTMnEMWaFOuanrlbZ3uyoSBghc5ipw9X8+YF+Rja7c9mHyuujSt/JsCUhpPztWh+Fgkf4tFPkAtBDJeuT97nDfA9fVkwJ4yGFBndZeUqQnKTtCWpMx+cVSMM590uAYJBAyR3lTVybgI6xpBHlf+LK4Prh53G9FQdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293410; c=relaxed/simple;
	bh=Z6bedgK51CBvJ4hEvw/giMbNKrRoOi6itzY8zptBXHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQtplLox+LnQP+vQTaIc1cqVM3KJB5Ls7FtP91zuIvWTxmfcs+xG5/FRmTvUew8pLt1KLWHrZNr9ONBihgHF65rk+Ghj0sZf1ZmY1YV8JeuwvaRBxz+GcbMuDVTbLb2xSi+4jmWQMmwo0Iyjmkmi2KZWjXImQAFisP4wFN5ZBp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b9387df58cso8826650b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 07:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293407; x=1765898207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8YBPLTIPuifeI/iaA7PtMF+MfgsWHWjJVkyP/6nKlho=;
        b=HBTIIc6HUQ27tjuUOuH3eqoih8Hii5j1FKrkao5f97yYsP0PlsaT9fLbFb64V6mx2+
         EGqLQXZeuwZd7JCsC2hLsqaqFjl7nqSmlHxDV+8olGgGQ1+GYJSD8GGzchOkxoC1zgne
         YY1FEXMq6FkpOhIjhrwOhYRjzR+1hLBTBRmUgzP5yEPtQZnnwX5nyUb+X+hndpjvEbrf
         nYC8C72qZheDQWDbgM7YaHOxqfomyNHI/MdrUFsz+2yEARpHFWc1Q8RFWVLkCWy0DEHZ
         OlAXzQtOKZzeIHW2Jckok1K5sAlOMr4vUpXqfUVCK59ME2eRkJQQB5fBWMLgjv31RnLA
         YMTg==
X-Gm-Message-State: AOJu0YwHtt7HVK+EW0w/vZVy+/sLAYTtcPUOm0MQ4DLRQOcr0UFNzdA4
	fcAXs/GdqkPJrcaIqTod6pfDPJ170de+J6SomQP9KMMPnqMKaBNWSi1M
X-Gm-Gg: ASbGncsIEQXh/yK3dI19sy/or3xcPhdTnhvW7NEorG4a3HVi84UQuwdiODz962+NeUM
	iUiSw7iL+QqgDQuW8+eob4NgZtE+FOl1hBRX6OEQ44WLuOCvSUgU+mgPolxGDv19V67cpJ6NV0u
	QpXkwYvD/gJE2p0NKySn6ywCkt0+vj/oL4Q4W2f63j2yV/r8WYRnUDVrWXskm/iuVZHi2Qsnj9I
	Fz0vs7wWJp7dEEeX9h4hgwosyvaRMFIGfVZTfxJgxWvdqOnBEylr3qZPrvOwZv5SphDRHT1A0xV
	qk6rWeITGOK2TJ0Vl4lxiI2cL6hyrxFAwwfoQOhCBUP6hmog4vHtAbU3URbY7EmFXvlhHHUfhr4
	vrPpzehGbAj2/PDomKm1c9LtboMzJfT+x299WFttUTiO8/VOmATkhQJGXmQszvn3mKAgU3Ew0QQ
	tPdC4hvJ3n3JuQsW4kJ3PdKXWvWu3vQTRz
X-Google-Smtp-Source: AGHT+IGkFw14uZ3TdEONs1jLIa6ABUOhvC387PBq4jo5ARkfj4B9JhpQJha2DTtEd/VgJcIBM5u+Gw==
X-Received: by 2002:a05:6a00:1988:b0:7b9:d7c2:fdf6 with SMTP id d2e1a72fcca58-7e8c390eb6dmr11022755b3a.24.1765293406514;
        Tue, 09 Dec 2025 07:16:46 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2aedb474fsm16538952b3a.52.2025.12.09.07.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:16:45 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: ojeda@kernel.org,
	linux@armlinux.org.uk
Cc: rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH 2/2] rust: samples: add AMBA driver sample
Date: Tue,  9 Dec 2025 23:16:16 +0800
Message-ID: <20251209151616.2491085-3-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209151616.2491085-1-sunke@kylinos.cn>
References: <20251209151616.2491085-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a sample AMBA driver demonstrating how to use the AMBA bus abstractions.

The sample driver shows:
* How to define an AMBA device ID table using amba_device_table! macro
* How to implement the amba::Driver trait
* How to access device resources (memory and IRQ)
* How to use module_amba_driver! macro to declare the driver module

This follows the same pattern as other Rust driver samples (platform, i2c, etc.)
and serves as a reference for developers writing AMBA drivers in Rust.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 samples/rust/Kconfig             | 11 ++++
 samples/rust/Makefile            |  1 +
 samples/rust/rust_driver_amba.rs | 86 ++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 samples/rust/rust_driver_amba.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 3efa51bfc8efc..9d11eb297a01c 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -128,6 +128,17 @@ config SAMPLE_RUST_DRIVER_PLATFORM
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_AMBA
+	tristate "AMBA Driver"
+	depends on ARM_AMBA = y
+	help
+	  This option builds the Rust AMBA driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_amba.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_USB
 	tristate "USB Driver"
 	depends on USB = y
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index f65885d1d62bf..fbe6ee6106c83 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_AMBA)		+= rust_driver_amba.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
diff --git a/samples/rust/rust_driver_amba.rs b/samples/rust/rust_driver_amba.rs
new file mode 100644
index 0000000000000..82cc6763183f6
--- /dev/null
+++ b/samples/rust/rust_driver_amba.rs
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust AMBA driver sample.
+//!
+//! This demonstrates how to write a Rust AMBA driver.
+//!
+//! AMBA (Advanced Microcontroller Bus Architecture) is a bus protocol
+//! used in ARM-based systems. This sample shows:
+//!
+//! - How to define an AMBA device ID table
+//! - How to implement the AMBA driver trait
+//! - How to access device resources (memory and IRQ)
+//!
+//! To test this driver, you need an AMBA device with a matching device ID.
+//! For example, you can use QEMU with an ARM platform that has AMBA devices.
+
+use kernel::{amba, device::Core, error::Error, prelude::*, sync::aref::ARef};
+
+struct SampleDriver {
+    adev: ARef<amba::Device>,
+}
+
+struct Info(u32);
+
+kernel::amba_device_table!(
+    AMBA_TABLE,
+    MODULE_AMBA_TABLE,
+    <SampleDriver as amba::Driver>::IdInfo,
+    [
+        // Example: Match device ID 0x00041031 with mask 0x000fffff
+        // This is a common pattern for ARM PrimeCell devices
+        (amba::DeviceId::new(0x00041031, 0x000fffff), Info(1)),
+        // You can add more device IDs here
+        // (amba::DeviceId::new(0x00041032, 0x000fffff), Info(2)),
+    ]
+);
+
+impl amba::Driver for SampleDriver {
+    type IdInfo = Info;
+    const AMBA_ID_TABLE: Option<amba::IdTable<Self::IdInfo>> = Some(&AMBA_TABLE);
+
+    fn probe(adev: &amba::Device<Core>, info: Option<&Self::IdInfo>) -> impl PinInit<Self, Error> {
+        let dev = adev.as_ref();
+
+        dev_dbg!(dev, "Probe Rust AMBA driver sample.\n");
+
+        if let Some(info) = info {
+            dev_info!(dev, "Probed with info: '{}'.\n", info.0);
+        }
+
+        // Access device resource
+        if let Some(resource) = adev.resource() {
+            let start = resource.start();
+            let size = resource.size();
+            dev_info!(
+                dev,
+                "Device resource: start={:#x}, size={:#x}\n",
+                start,
+                size
+            );
+        }
+
+        // Try to access IRQ (if available)
+        if let Ok(irq_request) = adev.irq_by_index(0) {
+            dev_info!(dev, "IRQ available: {}\n", irq_request.irq());
+        } else {
+            dev_info!(dev, "No IRQ available at index 0\n");
+        }
+
+        Ok(Self { adev: adev.into() })
+    }
+}
+
+impl Drop for SampleDriver {
+    fn drop(&mut self) {
+        dev_dbg!(self.adev.as_ref(), "Remove Rust AMBA driver sample.\n");
+    }
+}
+
+kernel::module_amba_driver! {
+    type: SampleDriver,
+    name: "rust_driver_amba",
+    authors: ["Ke Sun"],
+    description: "Rust AMBA driver sample",
+    license: "GPL v2",
+}
-- 
2.43.0

