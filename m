Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601B30DD3D
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763310130; cv=none; b=paOmmur3ZSd4832qXt53K4tax18se6mtAzXQTpcB4x+x8W9jDGIbTvJbCm8cGH/soCeZ2m2+6QzCAd/eC2+XonLH7VTQSQeIfjIQe8iqmYrrMvSlP7tQxAMCLWXhNZpz1cgq36595tYN9+rsaoJaiGhUguE2RChh5/YKhC5Hfbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763310130; c=relaxed/simple;
	bh=m8f3ckNXVWpfmWRTR65J04ac7rJbNT4myeZEqsLDmlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5cT2ClSdO/xPukHV2ySxubhETwF5yijBPZuROROU+mnQng4D4CJHihH7heLZS7nktXXtOcWw1YAwiCMxZfmcK50pvbdC6woe2Y4Xn9m/JYAPo/dgH4JmFHKevIRlI+6DS2EUz0jycS279ctVfyhlrkWVsXS2A+hq1crfWpknJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OW0gorWM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OW0gorWM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779a637712so6571955e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 08:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763310125; x=1763914925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtDZX1ikVCwszhOceYAYwxwSSyFYEhe/dmSKKTM3uq8=;
        b=OW0gorWMULlV8KSt6lJUzQG0FER2xkqfyAX0+E8qoJt5NwJ2J90OOj2EVDlOQgB4Gd
         /ribQm9AKCUPo3UPsGrMX4cK9CvwASr9fSSXujovHLIfhetO5Npqcw+HEGmtXfSKpXon
         2SNC6VuTrVLMbY3oPWIK3gGG2t5dKRmn2kor1hlMDPuMiMXT26L6IDMzVFGtHcdUP2Tp
         5KzYQhvN9ji5N8QQGlp+MxFvAVqGp9ggRveEDFzzGbZlhS1fEZ3BloqznRzmZiEo7p6E
         2bwEkH99IVpG4Sn5Rwtwd4O2dlGcSgdNQOC8wyA4S6m0za8pLjlMPHfh8Rj8XLZZMrDR
         2vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763310125; x=1763914925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtDZX1ikVCwszhOceYAYwxwSSyFYEhe/dmSKKTM3uq8=;
        b=k8E3pbLdxeLsimQm6c7wCnGaTT5ri8UnjoRFH+ydOrWrYKZNOXq5yZJyAuunxi6v0p
         B1VtmPQlXZt2uDltte7hFjCPwN8sorGT34BEjUutH4QypCPjCs52yV4nvZUj29GSc2tk
         bbYyX1ValKT7xKUKfjBlJncqjqhHQmTjDSMgu3U+SQAEYhap81wovsYniLH8PrtaLyBF
         PP6i8n47YT7C47+v6VHBJTsCCHU3k3o8jvvbnYkE6kufaG2WvnDT9/3rAKWU03YzE372
         /AsX+/xVYGXSW7pNLp5RyWYM7wyRk451ilmIxuFSVrEQVFUytmkCeM+Qcpnel0cNz9Wl
         XhUg==
X-Forwarded-Encrypted: i=1; AJvYcCV78Hs3NJDv8ll9KhpDU/6usAdIE2D7nKYqIEzIwuAe9pO000yHlTpWCvqe5N2t8fvAAScanhXvj2wSZxzsvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1HGlxhQrCF9Q9caQqMKdx4cb+guke4O2v2c+kw+zeY+VTXNkb
	BVe6jCXdVAmTgi3X4cy/w77jloc2X40IJlHPNxlSNnOFuf25Hfa8Ny3u
X-Gm-Gg: ASbGncsL302L6i9YVCtRZIaocYyGiFFWCeCYMI7rD2wqN5QMN0TfiS55JXJk5O4Ev+f
	67Zz9ZgqBxwnuzhA55ACABZMKjiJmTh48k6gVAH4uhATX2yNW9mB8VZ5b1Eyy0aL9E3jxqz/AKI
	cxh5Cfq1II0UW5uyvFnQX7X99gPZQw8hS5agyztiz7zbMTEcxlTPEjk1dS2ZlvA/nk8XcduHY8I
	133y1QVzg7vQsZ0uZlhXChmgr8z4EC3xE3nsiqEntQvKDQVqio53MGolqSmLk4jXuvX28mdbmYq
	VA6H3XDubF1U23SDkYTxYXi8LVbkjSK5B7UrYAnYAPiNLf7a6IQ988LPPnvpDdbKToCqucqDWQB
	5NOJ/wK8evZYYAiTEsABdR8Wx5gCWNCFFLH3dm2p5HjbeA1Az9KbvX0mh7qsdz0GBWoxqCF5aUS
	EroHGuuXGyhQ7GSnv2JMznG2x0kg==
X-Google-Smtp-Source: AGHT+IFne8WEvuURcGzvWOrK3ZiYWL2jvr+Mjmjsc7BjUh6RIZCWEhIQsOUMDSCMBHFaYHy2tGiZeA==
X-Received: by 2002:a05:600c:45d5:b0:477:7af8:c88b with SMTP id 5b1f17b1804b1-4778fe57241mr89311205e9.11.1763310125155;
        Sun, 16 Nov 2025 08:22:05 -0800 (PST)
Received: from Vasilio.Home ([176.26.203.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a0f4ff42sm28419445e9.12.2025.11.16.08.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 08:22:04 -0800 (PST)
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
Subject: [PATCH v8 3/4] samples: rust: add Rust I2C sample driver
Date: Sun, 16 Nov 2025 16:22:04 +0000
Message-ID: <20251116162204.171518-1-igor.korotin.linux@gmail.com>
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

Add a new `rust_driver_i2c` sample, showing how to create a new
i2c driver using ACPI/OF/Legacy ID tables.

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |  1 +
 samples/rust/Kconfig            | 11 +++++
 samples/rust/Makefile           |  1 +
 samples/rust/rust_driver_i2c.rs | 74 +++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 samples/rust/rust_driver_i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index a8dfde2f5633..8133987c4b54 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11750,6 +11750,7 @@ R:	Daniel Almeida <daniel.almeida@collabora.com>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 F:	rust/kernel/i2c.rs
+F:	samples/rust/rust_driver_i2c.rs
 
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c376eb899b7a..181466319588 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -84,6 +84,17 @@ config SAMPLE_RUST_DEBUGFS_SCOPED
 
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
index cf8422f8f219..aec865e2adef 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
 obj-$(CONFIG_SAMPLE_RUST_DEBUGFS)		+= rust_debugfs.o
 obj-$(CONFIG_SAMPLE_RUST_DEBUGFS_SCOPED)	+= rust_debugfs_scoped.o
 obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust_dma.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
diff --git a/samples/rust/rust_driver_i2c.rs b/samples/rust/rust_driver_i2c.rs
new file mode 100644
index 000000000000..ecefeca3e22f
--- /dev/null
+++ b/samples/rust/rust_driver_i2c.rs
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust I2C driver sample.
+
+use kernel::{
+    acpi,
+    c_str,
+    device::Core,
+    i2c,
+    of,
+    prelude::*, //
+};
+
+struct SampleDriver;
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
+    fn probe(
+        idev: &i2c::I2cClient<Core>,
+        info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        let dev = idev.as_ref();
+
+        dev_info!(dev, "Probe Rust I2C driver sample.\n");
+
+        if let Some(info) = info {
+            dev_info!(dev, "Probed with info: '{}'.\n", info);
+        }
+
+        Ok(Self)
+    }
+
+    fn shutdown(idev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
+        dev_info!(idev.as_ref(), "Shutdown Rust I2C driver sample.\n");
+    }
+
+    fn unbind(idev: &i2c::I2cClient<Core>, _this: Pin<&Self>) {
+        dev_info!(idev.as_ref(), "Unbind Rust I2C driver sample.\n");
+    }
+}
+
+kernel::module_i2c_driver! {
+    type: SampleDriver,
+    name: "rust_driver_i2c",
+    authors: ["Igor Korotin"],
+    description: "Rust I2C driver",
+    license: "GPL v2",
+}
-- 
2.43.0

