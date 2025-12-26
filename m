Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B0F275AFD
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 20:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766780236; cv=none; b=dWn/sq/D5/JjO5bIqDJaRKhwk0I5V814GN/AdKoGCwXWckw4cEeLIRQixsr+PYKMEXgQnqd1GBqt1aO3norMpRmaG//LWQC6X0lfpK9TRJ7d8jotZXY2HWSmnrGI0/i0oRPhHE+uKC71M+rAGqIRVVqOiDQjZEg8gvVR1jJHDHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766780236; c=relaxed/simple;
	bh=duw+JCtdCh0rRhbXurcNe0zOIZAVRIyHLJEjn/39DHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ICXo2ITsIathCOa3UanUocYe8/mze6nB3/S78JZ7SaweUyESaNAN9CiQ3R2cam4E2Zt5r5Q3jo8OgoebhhR/XZPzrRk18oes+YksxJT8wA626Uki9Szt1P1tdo5gI+mHM7h7KLq6jZzNQmeLQcmvoMRFSGyhhn0jQHDebQZhjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6iA0jV6; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6iA0jV6"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a377e15716so16078715ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 12:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766780234; x=1767385034; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QSJpfbIfAXnd+EuNkoaHygWty3plypdqNIVg+qLRiRc=;
        b=t6iA0jV6Op+jCvGanVKJPeCq+Hzh4JfTBX+vDKejL1sr/6rZxcWdmc9SnFDmxSmPlX
         PkNG87+w6jklXgCnMa+dSiRwhFA5Z03S85hAyU7VJiUS+T1wDXLK8PRhHsX+6seuyYbe
         RxTO3cms8WH8UD6U4cMoHlq1skfGv/uREprBL+ciAGJXhthqjEt4Tf7F66q7z9ivyfcP
         9C3y967Op4oRtuJS/hDHfMGQOZ84ut9e0ABR6wF41XxfRfugicQ7swkESfmZI/oJA6Vv
         3Q5H+thfiwsUJ/hjofVDfGMPDhG+4rEutLdOJu245VDAHjXLf3cueQlJuKk+TfpbEzoN
         e0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766780234; x=1767385034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSJpfbIfAXnd+EuNkoaHygWty3plypdqNIVg+qLRiRc=;
        b=X2pLHhNLt/lf0nG6HiacnEuKtE37YnIoTpF4QRjj2OC0QIZOZeSt+nLCTcZC21dCOs
         5saSFT8FctNp5/wLhfN0b0vX33zmwoxeXAgrVdzOyiwFnlLJUALqGyPYi1fhLcRVsBat
         EyohbmW2ihTD6y7Kzh1hdbMQrj5R5qkmC6DUV+QGGBES/tQuKLHoSo1ot+m8Isl+B+Wn
         s9LhnT7QQH39hLEeC5Ck6KLg713F9JRxeG7fgUAyDG3dpmY3raAkmfWl2XRJyM6KE+6y
         XqKdqKZQcFCbZelW9bY08re++xGY7y9ubzSxT4H9KG3RB2mdfJAoA8GXids4tjqyYBBc
         SrnA==
X-Forwarded-Encrypted: i=1; AJvYcCUPbbfFP5d8TUDb2XQTaqBH1z22S/gYqtYd0R79i3PXqEh0SVTzBwQUo+Vb97Q6zX4eQ676U/X9OnNzdN63KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ8VaiFdKv3n/cdJYZzrxpyQQJy4VWPjnlift6AZKl4ft5xzC9
	OTCFAZHprVwSWhyVNBj5HzzGhrq6PMOzfvGuSKmjKjPeROsBhciGm509rKegijcjCg29wOVTXiS
	GhkihFWbrfA==
X-Google-Smtp-Source: AGHT+IG6WVP7Yusc+K6z2Cavb5gcTtQLqohC7qQUfIVAEJG0hg0r2tbZS+6fuyxiCb7el6POmJYz9jja3p6B
X-Received: from dybsy4.prod.google.com ([2002:a05:7301:7004:b0:2ab:f916:f31f])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6290:b0:11a:4016:4491
 with SMTP id a92af1059eb24-121722e1205mr30653400c88.24.1766780234244; Fri, 26
 Dec 2025 12:17:14 -0800 (PST)
Date: Fri, 26 Dec 2025 20:17:09 +0000
In-Reply-To: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766780228; l=4584;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=duw+JCtdCh0rRhbXurcNe0zOIZAVRIyHLJEjn/39DHQ=; b=daHoYFC7mub2v8W0QBBQW4ocK6pW/0v+xG+GzkCJKrSBeYmWGWjPvBWhBDQ9vrxC8h9BxVDXT
 V6UKAjoO/KvA8QlXzB0p2OVRUQ1yECa6aNQyWHMsxA+z3mBQPOkRWzL
X-Mailer: b4 0.14.2
Message-ID: <20251226-soc-bindings-v4-3-2c2fac08f820@google.com>
Subject: [PATCH v4 3/3] rust: Add SoC Driver Sample
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
 samples/rust/rust_soc.rs | 81 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+)

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
index 0000000000000000000000000000000000000000..403c1137af779d3c660786959d6f5160f934f4ae
--- /dev/null
+++ b/samples/rust/rust_soc.rs
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust SoC Platform driver sample.
+
+use kernel::{
+    acpi,
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
+    [(of::DeviceId::new(c"test,rust-device"), ())]
+);
+
+kernel::acpi_device_table!(
+    ACPI_TABLE,
+    MODULE_ACPI_TABLE,
+    <SampleSocDriver as platform::Driver>::IdInfo,
+    [(acpi::DeviceId::new(c"LNUXBEEF"), ())]
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
+            let machine = CString::try_from(c"My cool ACME15 dev board")?;
+            let family = CString::try_from(c"ACME")?;
+            let revision = CString::try_from(c"1.2")?;
+            let serial_number = CString::try_from(c"12345")?;
+            let soc_id = CString::try_from(c"ACME15")?;
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
+                _dev_reg <- soc::Registration::new(attr),
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
2.52.0.351.gbe84eed79e-goog

