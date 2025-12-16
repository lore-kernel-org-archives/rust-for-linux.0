Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD331AF22
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 19:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765913083; cv=none; b=Z8gxmIzRnhjKu/3BhJgulL7nXHAPRZAnARZVowcW/OlmSS7XQ8luGfhFt5wy4vHbwmy1ltcgU7tCWGqir5OMP8dNaERWRYeKcffEDesW6syP023yUJdkICTk/DKbpCr8qln2Jo6w5MNVXESbQmpXJDLDoP5DwD40IQ+NTu3YsmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765913083; c=relaxed/simple;
	bh=/0kPZnK0q0pVyibhVyD4nZIlS2J5epiHCu2rpf5FvVI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XaC9XCCmI9+j96ORvNv8K5vrWdlqDqDncQ0IJ0FkvmLYOJwDd/W2PcFHGrJW0lWWDpa/wAWPyYNIfhz7C5PxA6lOmyepeOBxpI6vJA9IXcnfMJkDtbXjVgTKqldo8et7wy6ocjrmUQa777pm8WHUrsJDrNifiTTsVhO2gi/DCF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hxPqYQ76; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hxPqYQ76"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b98e6ff908aso12466665a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 11:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765913080; x=1766517880; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=caqD8hxyMyGOF0U4L0dCaQCZmRG662msU+mDI24JSo8=;
        b=hxPqYQ76uNoQwRmkztqL4FcJPBUnADdr2mkYNKdgGuM08YigGzb3VyM/5mGwa7QUUN
         yB3iARV2fYuEEcOckpiK+YN6bw2mia1drBPJUcP7GdwBbS2BeSL9HCOXkylnM1SAdzNA
         ds5gfzJxN/IT8ZdEV0zMuG9LtHkTOFCd7or/hjWUdX8MkVptgaYpm2yg0WnAImFG/reJ
         31KpmIFP9wLS/37DjFCjxBNmLOxqZi3KvYlUu0cqHc4R9mqHPMYddE/1f6ttqCkenbBh
         RxSZFR0XBgRZvdEOoo1goVfsy3TeTNkHAUmolFe5+uEeOyxoMWlSIAo0BlsdnavmQ310
         KCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765913080; x=1766517880;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=caqD8hxyMyGOF0U4L0dCaQCZmRG662msU+mDI24JSo8=;
        b=NDeVm6sP0C4khvwxhtxRbXTPeYstA0FZAl363wKuQBSZUZtttFHXOY+ZpdIz+D8mfy
         b56bXKuyFbrx6qbiUwSWq21e5rSEXPcMv0W75aeqQwR7BatT4r3DzmkeMavxuOP9qYhD
         Vrh04DyiwNfC7iSbToMv8p3jQsBGFULco360NQeFIH4tOmR+Grrz+7NefA19Tt9T/6AC
         hJ0vxFb/Ew05jeXqJIu55IdNHoGZXr/be3EdCjdI1Ww8+CAaQoPEkeu06BXEVy46+Bgd
         qLqh/qap3WJnRU1N33QveDuhMJ8blkf/wBqKBE3QGZrcOkrHX3+/1tJkgYzXb9GJJAnK
         09HA==
X-Forwarded-Encrypted: i=1; AJvYcCUaTAU6wsyBfOEjFiAiAWRoj+BLQSsLE+pMtxhf23FO+M56cMYe8uoXOYQZt3pGjd/UnI/fFXjm/40CzQ5SDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7x9aLVuNxZdn/asls79Zdl00TN0KuuHbQFdoU+3zssXFj76p
	BPGQcLbEPMRj6C+y+VljQPqg3hxa9SZSmrKtKz4ULP+R8/SZpuXM2fh0izQpyUT41w3E+1BRDG6
	CUTwXCf0EtQ==
X-Google-Smtp-Source: AGHT+IF8TY4ZLjIfQafruKxa7X/TC7lnilPDPi7zM3OchSNolmv+IxSySGMUVXDUR1dZzciWx9Cyp9XQs6dM
X-Received: from dybun12.prod.google.com ([2002:a05:7300:f3cc:b0:2ac:5d1f:eb20])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1a2:b0:2ab:9f55:d158
 with SMTP id 5a478bee46e88-2ac30384fc7mr7707217eec.37.1765913079982; Tue, 16
 Dec 2025 11:24:39 -0800 (PST)
Date: Tue, 16 Dec 2025 19:24:31 +0000
In-Reply-To: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765913070; l=4646;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=/0kPZnK0q0pVyibhVyD4nZIlS2J5epiHCu2rpf5FvVI=; b=12i2ttbSYrSgli205SA8tbyLjtEUs+rX+OjsMQXcrdZbLiqZ82bHHnHEx0IfjYv1w0zXOLs2G
 vrUePS72nDLCtBkwbA6c+vjL+LuuN/eRJ+K2m+TprmSbe4RNBimCLtY
X-Mailer: b4 0.14.2
Message-ID: <20251216-soc-bindings-v3-3-42ecdc8c117e@google.com>
Subject: [PATCH v3 3/3] rust: Add SoC Driver Sample
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
index 0000000000000000000000000000000000000000..33043b0ac8dadec36aebf369f0fb68dbb3b118ed
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
2.52.0.305.g3fc767764a-goog

