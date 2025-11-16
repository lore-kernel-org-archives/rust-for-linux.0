Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9BF30E82C
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310136; cv=none; b=LVo7Ga/Lhoc0mLEDMMb6rQXvnZKYSr6bC1LnfIUi4qU6/8sn1EAUH+aduiFmdmZyi92QH6zUpw8FGoCQ9Uqy766nqDTfBbGKFoWrYnXsVZlulYTWC1Q7c3VO5QpLwSOEAKANzqUSLkl9BfaI/kqDkrCjo6KwqkiaagtRBweqGEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310136; c=relaxed/simple;
	bh=ay/kFlt2hyjWWJHcLDxvEmG2/0U+MsyM6pQh6nbnX+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9YSfMoqWVTKq07d1prkN4QZ1Sys8hjRbyFrTM403yNsiB+IUUDhYS6KQc5iUHro4uzcv1vjYVWconTwOSeDA6AEJWvV1DwLOZ+O8zA3lA1fxoUg1xUNQ+LXYUhoKQARKHyE9bXCbYgpYgDKYuGrM1Owljcuy/n25skkqaXPNss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3/sAGSG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3/sAGSG"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3108f41fso2044724f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 08:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763310132; x=1763914932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT82M3k+N9m/xVxJSoUUBoXfZ26HFZn2kkhwu/Rn1Dk=;
        b=O3/sAGSGtHjgkAsEhq/FznOD0MbLb5ZCceRqyf8HPYUj8kMgk5fHgE7pY107FY8vS4
         rAX3ZvtwDESND+nbcztBpEA4WMdFDGN75LAnK687HxfjJQFK4CIeDfz/5rYSILX7BXSr
         MVgW+JqKKrDlGfgpleGfCnoF6ZWIUGSUeZGEwzzDX3u32DxPgMtylWzD8TSsXoAQjs2y
         Fe+8/iFTijx0RGs4sQnmL/5QWoVjR76ki/kyCrpzTeXXwHOBjjiZnEqGfw3oFAzzMlFn
         b/8x6NH+Qxx7a7luHxtTlkpAhX4VUhu0dG1JKOYvnPlDXhqP2CKUH5ya4gDQNe2GQBiU
         hR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310132; x=1763914932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hT82M3k+N9m/xVxJSoUUBoXfZ26HFZn2kkhwu/Rn1Dk=;
        b=NKkOv0ym1KX9PkrFT2pt6/S6kH0dSUAw3p07B7AiYyX4fj0UUheq49xGTwoXqnoEKq
         61aLR0d8leIAFMtgSFbhGyKRoZjupsggRnc2s/t3ZrJ+n+k1wHKofdDit59VrVb/YHUF
         uPAhwzT83Io4YKQnVyRhNZNaznTr24Mk6pcfSYSWbV8jYt5hY4buYFeh70BIyVp+QeoP
         kf5cGrggVAS40Z1GDdRrx0h00R28KKhS2mZiw9zeBFIeHywd30uc4543oqqDP2br0mrb
         m3O/1aYZsWQO4TT/cKmLkV+B9uoFrxnu021REKweunvQp67yzA/Umv3epf4wS8sRhEcE
         QHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6UYFQ6338wweG/MEvsJbPAsc7cxy2bUMWxU2QT9XV1raEUDfWbBRF4vH2pD0RywhYCoOgzr7p20Rnj/ApdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOp5wkc4/5qIovzRlSxgLHMw3ybf60Ye0WQu8x5bWiukn7l8EH
	u7/RxKkkva2O/di4qJA/HB1PkYzgrrWDTUOQMY75/fIH5iijgL7sx9pO
X-Gm-Gg: ASbGncuHX7C4GzGPq2W8Ww6MdQ6uMcv/RqJvNVSQeP5WD5cNzVJMOS90bbAHp8IRCyq
	dd7cC6sSjKPz03uCAnpYVvvyMIBusJW5XxNMiV8m+DEFvBMLND13/Wp7kKJBbfJDVbslvyqESRM
	Kh6Ii/rr7nRG3wiwcbzcLAqiKy6lwDeGuUUwQc8IiD+u5wxbVKAM0k70AkA+Uq1SosSnAa1Exco
	IRTiRyAJn15WBlsz8dKsQqECxle9xlUTFBEt1QXAEG8v9InIf3CyYI3rSAL7Gfkev+GGpaH+DPB
	XMy9H1oWsOIv8BB9WC86Gr9T7ge87486wDsnf8U2VN8JRaRMVq7skx3mGFR5NPQKKoJ7+E+RdKB
	yMLLso3qnwedV/TglAmRUFMib7AgGuK0xGMgL6ww4CX21Q7JxFsuhcBFOkN7GuGzLGfLqHNMSZJ
	1fNMGeGSdTVv65mOA=
X-Google-Smtp-Source: AGHT+IG1CU+chF+Dmwtlb+tkH6qNZDcuWAHz+1IuGrX6SBCEIbWbJOD3ZVK4miRXaTzFm0efYX3CMg==
X-Received: by 2002:a05:6000:1a8d:b0:429:dde3:659d with SMTP id ffacd0b85a97d-42b59388831mr8674544f8f.47.1763310132195;
        Sun, 16 Nov 2025 08:22:12 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b617sm21344772f8f.31.2025.11.16.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 08:22:11 -0800 (PST)
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Hung <alex.hung@amd.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v8 4/4] samples: rust: add Rust I2C client registration sample
Date: Sun, 16 Nov 2025 16:22:10 +0000
Message-ID: <20251116162210.171542-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new `rust_i2c_client` sample, showing how to create a new
i2c client using `i2c::Registration`

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 samples/rust/Kconfig            |  12 +++
 samples/rust/Makefile           |   1 +
 samples/rust/rust_i2c_client.rs | 157 ++++++++++++++++++++++++++++++++
 3 files changed, 170 insertions(+)
 create mode 100644 samples/rust/rust_i2c_client.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 181466319588..a952220cdff7 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -95,6 +95,18 @@ config SAMPLE_RUST_DRIVER_I2C
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_I2C_CLIENT
+	tristate "Manual I2C Client"
+	depends on I2C && I2C_CHARDEV
+	help
+	  This option builds the Rust I2C client manual creation
+	  sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_i2c_client.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_PCI
 	tristate "PCI Driver"
 	depends on PCI
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index aec865e2adef..f65885d1d62b 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_SAMPLE_RUST_DEBUGFS)		+= rust_debugfs.o
 obj-$(CONFIG_SAMPLE_RUST_DEBUGFS_SCOPED)	+= rust_debugfs_scoped.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
+obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
diff --git a/samples/rust/rust_i2c_client.rs b/samples/rust/rust_i2c_client.rs
new file mode 100644
index 000000000000..abc6323a5817
--- /dev/null
+++ b/samples/rust/rust_i2c_client.rs
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C client registration sample.
+//!
+//! An I2C client in Rust cannot exist on its own. To register a new I2C client,
+//! it must be bound to a parent device. In this sample driver, a platform device
+//! is used as the parent.
+//!
+
+//! ACPI match table test
+//!
+//! This demonstrates how to test an ACPI-based Rust I2C client registration driver
+//! using QEMU with a custom SSDT.
+//!
+//! Steps:
+//!
+//! 1. **Create an SSDT source file** (`ssdt.dsl`) with the following content:
+//!
+//!     ```asl
+//!     DefinitionBlock ("", "SSDT", 2, "TEST", "VIRTACPI", 0x00000001)
+//!     {
+//!         Scope (\_SB)
+//!         {
+//!             Device (T432)
+//!             {
+//!                 Name (_HID, "LNUXBEEF")  // ACPI hardware ID to match
+//!                 Name (_UID, 1)
+//!                 Name (_STA, 0x0F)        // Device present, enabled
+//!                 Name (_CRS, ResourceTemplate ()
+//!                 {
+//!                     Memory32Fixed (ReadWrite, 0xFED00000, 0x1000)
+//!                 })
+//!             }
+//!         }
+//!     }
+//!     ```
+//!
+//! 2. **Compile the table**:
+//!
+//!     ```sh
+//!     iasl -tc ssdt.dsl
+//!     ```
+//!
+//!     This generates `ssdt.aml`
+//!
+//! 3. **Run QEMU** with the compiled AML file:
+//!
+//!     ```sh
+//!     qemu-system-x86_64 -m 512M \
+//!         -enable-kvm \
+//!         -kernel path/to/bzImage \
+//!         -append "root=/dev/sda console=ttyS0" \
+//!         -hda rootfs.img \
+//!         -serial stdio \
+//!         -acpitable file=ssdt.aml
+//!     ```
+//!
+//!     Requirements:
+//!     - The `rust_driver_platform` must be present either:
+//!         - built directly into the kernel (`bzImage`), or
+//!         - available as a `.ko` file and loadable from `rootfs.img`
+//!
+//! 4. **Verify it worked** by checking `dmesg`:
+//!
+//!     ```
+//!     rust_driver_platform LNUXBEEF:00: Probed with info: '0'.
+//!     ```
+//!
+
+use kernel::{
+    acpi,
+    c_str,
+    device,
+    devres,
+    i2c,
+    of,
+    platform,
+    prelude::*,
+    sync::aref::ARef, //
+};
+
+#[pin_data(PinnedDrop)]
+struct SampleDriver {
+    parent_dev: ARef<platform::Device>,
+    #[pin]
+    idev: devres::Devres<i2c::Registration>,
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SampleDriver as platform::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("test,rust-device")), ())]
+);
+
+kernel::acpi_device_table!(
+    ACPI_TABLE,
+    MODULE_ACPI_TABLE,
+    <SampleDriver as platform::Driver>::IdInfo,
+    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), ())]
+);
+
+const SAMPLE_I2C_CLIENT_ADDR: u16 = 0x30;
+const SAMPLE_I2C_ADAPTER_INDEX: i32 = 0;
+const BOARD_INFO: i2c::I2cBoardInfo =
+    i2c::I2cBoardInfo::new(c_str!("rust_driver_i2c"), SAMPLE_I2C_CLIENT_ADDR);
+
+impl platform::Driver for SampleDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<device::Core>,
+        _info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        dev_info!(
+            pdev.as_ref(),
+            "Probe Rust I2C Client registration sample.\n"
+        );
+
+        kernel::try_pin_init!( Self {
+            parent_dev: pdev.into(),
+
+            idev <- {
+                let adapter = i2c::I2cAdapter::get(SAMPLE_I2C_ADAPTER_INDEX)?;
+
+                i2c::Registration::new(&adapter, &BOARD_INFO, pdev.as_ref())
+            }
+        })
+    }
+
+    fn unbind(pdev: &platform::Device<device::Core>, _this: Pin<&Self>) {
+        dev_info!(
+            pdev.as_ref(),
+            "Unbind Rust I2C Client registration sample.\n"
+        );
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for SampleDriver {
+    fn drop(self: Pin<&mut Self>) {
+        dev_info!(
+            self.parent_dev.as_ref(),
+            "Remove Rust Platform driver for I2C Client registration sample.\n"
+        );
+    }
+}
+
+kernel::module_platform_driver! {
+    type: SampleDriver,
+    name: "rust_device_i2c",
+    authors: ["Danilo Krummrich", "Igor Korotin"],
+    description: "Rust Platform driver",
+    license: "GPL v2",
+}
-- 
2.43.0

