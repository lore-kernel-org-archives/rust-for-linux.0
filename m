Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3C27877D
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845825; cv=none; b=o8o3ZL4E8z5wkgtCAFQ2dxuDbRNYpUWiLIzboxYGkKFGEYnZeD6qK6hjDazSsPFs+/BMDAkl+hRbfGnXThwsHv3p6mFOzMbdGSkfvLoLH/Mi/apCMScNY36nNhy99eOikUhgP5hdkpHXUv3MMnjPKdoTZdzVmZH7x4pBoVKIJRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845825; c=relaxed/simple;
	bh=dlSPSXUUuZTBuEOMuLNhyCqtNK/4BnjWXzaGUCDWza8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QAk5r4sY15EFBgB0NyUKL4l7i4V0k7aL3nO4PUSYqB5NxlpWL2HJRUKilUtvhdv5tzIJYVYUjiodXo5SCjofXtGXa/zHzvqiIt/a2j5Lv9CSL7NGZaVbImJXpmjSno0WZe4mevl4U/ihFXVmgoc77KvKHXhiVMm264RvuuVMs3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vb6gezk2; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vb6gezk2"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-ba4c6ac8406so3508139a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765845823; x=1766450623; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Olua55894s+jmELlwPHr+E0dxrcMSc3VbYbbTrCR7w=;
        b=Vb6gezk2rGCiMrcofRtx8XZdOC4vTwivv654yxjYZEE5JUSLq7dB2C5q/8FlnZyS8e
         uuZ0WJjlKExOl3ZZ+bcrU/YAgPmlc8CDqlcqmOUxG5Xz7TiOI6aMqblkcMmJnDYwVmWE
         2gmKFgAIrXuJtI6mbvQ9LFa7z6Vp3/oK+TwV2Lq208fQMAswqjrafgV8o4PPSfQeU5VZ
         5NvPiQwIlWR80KJX06KpSnWZFFEb1fUiLjfgDS5CGmO7hkLkqkGQ9oXBi1TFMXwQtAhj
         fiExBXgbtWlFWDX8HoGaXjENGb9Qa8BF1pu/dUsMoS5ec9Tjzgl/EsMkI0xVbT/L17AL
         cbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765845823; x=1766450623;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Olua55894s+jmELlwPHr+E0dxrcMSc3VbYbbTrCR7w=;
        b=mDjfe93DJXfTsWEho5+v8BOM7dHxajGQHXg+y0Xfkme1WHBqbw7dCoSwBgZ8Vtdta/
         IksDZ09l5Hy7UANk1Z3I7GvzT2Ixhj73MktTZAIcn9e0/bbbGUquuphhkFur5nTcMrIe
         nMa/U+NIMayc/3P7QDOMo+5WcwUUgI/ruM9X717EaWUNhlbFEwr5M2/xt1ppef8L1Pe3
         IhUEgNHGfIxGTZf2lvwPTYObIsvbYEa/Zu4U+7zTeH95K5T8kPPzOXjxNnxHBJGMvHUs
         /JSgy9ZdnbhrlgUtUwxPPv9xFfIz/rio9z5f+NhuxkfjKO/oG5WVOks4vGzUqvYSz7Oy
         xG9g==
X-Forwarded-Encrypted: i=1; AJvYcCWR8IdRtz3uWArWYmr3LwhiUV74MXVvPBAaEYt+ONpxpwBI+JiQA7wC9CMe5X3DfiEGbr374Z42h2EsEzAdGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvo2NL4PoAbQGDZq6UqbEzgUQqH/IIz6NtetN4sqw3qaHQtGz9
	vwGDdWQ8Ve38dGFWEjT7k3mU7PParURafr9MiasPy/Zs3h9oYDqefIBszEW8xo+rzi7sLuS9feH
	NuNL3X49SMw==
X-Google-Smtp-Source: AGHT+IH+ymPrOT1h5JIPRnSJM5lyJ2b9Fm0qR4sSOUJjyf+BigLD0Z1ajkarMPK8rLvZk6Ef4dWCViCHuGcg
X-Received: from dyz27.prod.google.com ([2002:a05:693c:409b:b0:2a4:6b08:61f1])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d108:b0:2ac:1caa:8705
 with SMTP id 5a478bee46e88-2ac3012bc6emr7751641eec.36.1765845822958; Mon, 15
 Dec 2025 16:43:42 -0800 (PST)
Date: Tue, 16 Dec 2025 00:43:35 +0000
In-Reply-To: <20251216-soc-bindings-v2-0-1fb394cc921a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-soc-bindings-v2-0-1fb394cc921a@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765845816; l=4651;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=dlSPSXUUuZTBuEOMuLNhyCqtNK/4BnjWXzaGUCDWza8=; b=94gYXanIz0Zch8KbyTo4cc5XHwovDBPm6fGGq1FyhXmwL66sdRQgeLtidpSlqL2Np/Uscp849
 /jPSboPOaGmDtX66/0Tw6Oci6/XPIzDVM8jvPCl9CVwkuwqBwpodxYV
X-Mailer: b4 0.14.2
Message-ID: <20251216-soc-bindings-v2-3-1fb394cc921a@google.com>
Subject: [PATCH v2 3/3] rust: Add SoC Driver Sample
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Shows registration of a SoC device upon receipt of a probe.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS              |  1 +
 samples/rust/Kconfig     | 11 +++++++
 samples/rust/Makefile    |  1 +
 samples/rust/rust_soc.rs | 82 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ff01fb0f1bda27002094113c0bf9d074d28fdb6..bb2e710277cc84dd6042d4d46076e665d9f68752 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7705,6 +7705,7 @@ F:	samples/rust/rust_debugfs.rs
 F:	samples/rust/rust_debugfs_scoped.rs
 F:	samples/rust/rust_driver_platform.rs
 F:	samples/rust/rust_driver_faux.rs
+F:	samples/rust/rust_soc.rs
 
 DRIVERS FOR OMAP ADAPTIVE VOLTAGE SCALING (AVS)
 M:	Nishanth Menon <nm@ti.com>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 3efa51bfc8efccd91d9ee079ccd078ed1a6e8aa7..c49ab910634596aea4a1a73dac87585e084f420a 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -161,6 +161,17 @@ config SAMPLE_RUST_DRIVER_AUXILIARY
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_SOC
+	tristate "SoC Driver"
+	select SOC_BUS
+	help
+	  This option builds the Rust SoC driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_soc.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index f65885d1d62bf406b0db13121ef3e5b09829cfbc..6c0aaa58ccccfd12ef019f68ca784f6d977bc668 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
 obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
+obj-$(CONFIG_SAMPLE_RUST_SOC)			+= rust_soc.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
 
diff --git a/samples/rust/rust_soc.rs b/samples/rust/rust_soc.rs
new file mode 100644
index 0000000000000000000000000000000000000000..696c38a2ac9d030a7dc8928fd3ef4cafc0d6ace2
--- /dev/null
+++ b/samples/rust/rust_soc.rs
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust SoC Platform driver sample.
+
+use kernel::{
+    acpi,
+    c_str,
+    device::Core,
+    of,
+    platform,
+    prelude::*,
+    soc,
+    str::CString,
+    sync::aref::ARef, //
+};
+use pin_init::pin_init_scope;
+
+#[pin_data]
+struct SampleSocDriver {
+    pdev: ARef<platform::Device>,
+    #[pin]
+    _dev_reg: soc::Registration,
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <SampleSocDriver as platform::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("test,rust-device")), ())]
+);
+
+kernel::acpi_device_table!(
+    ACPI_TABLE,
+    MODULE_ACPI_TABLE,
+    <SampleSocDriver as platform::Driver>::IdInfo,
+    [(acpi::DeviceId::new(c_str!("LNUXBEEF")), ())]
+);
+
+impl platform::Driver for SampleSocDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<Core>,
+        _info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error> {
+        let dev = pdev.as_ref();
+
+        dev_dbg!(dev, "Probe Rust SoC driver sample.\n");
+
+        let pdev = pdev.into();
+        pin_init_scope(move || {
+            let machine = CString::try_from(c_str!("My cool ACME15 dev board"))?;
+            let family = CString::try_from(c_str!("ACME"))?;
+            let revision = CString::try_from(c_str!("1.2"))?;
+            let serial_number = CString::try_from(c_str!("12345"))?;
+            let soc_id = CString::try_from(c_str!("ACME15"))?;
+
+            let attr = soc::Attributes {
+                machine: Some(machine),
+                family: Some(family),
+                revision: Some(revision),
+                serial_number: Some(serial_number),
+                soc_id: Some(soc_id),
+            };
+
+            Ok(try_pin_init!(SampleSocDriver {
+                pdev: pdev,
+                _dev_reg <- soc::Registration::register(attr),
+            }? Error))
+        })
+    }
+}
+
+kernel::module_platform_driver! {
+    type: SampleSocDriver,
+    name: "rust_soc",
+    authors: ["Matthew Maurer"],
+    description: "Rust SoC Driver",
+    license: "GPL",
+}

-- 
2.52.0.305.g3fc767764a-goog

