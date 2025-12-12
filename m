Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB317DFE7
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 23:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765581312; cv=none; b=ZG2IqMwMmdzuWQnaYu4iFZMGrrgOvkIRqefK4XroeHcWjZOOWirDjXtG0G0KdYruAX6ORSh7Z3YuVQ4G7SYkIU90PjDIUmVHnugPj6PzPjQEpTCJeOaOmh0T1qtOVe2GUky8PWlsqOjfRWD2gdPBJvNLPu06dnfUphxuHJg0FSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765581312; c=relaxed/simple;
	bh=AQz7A04h1bgLBtHKWjo2r4fkCOjEQnkQFoWC2phwYWs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RamF9UGycYhkUTPKL/5Kaltlm0uYvEQmKLsycvBXupDoMlGbSlB21WGXa6keVL5fpEfVysQ8Uu+asnH2t3S6tH3zvn6kNpS8fv5YRpRbBQhIKnp2zjmhRLhqW0h6V0nTjenRacVBOPYLZHx68GaPeSLqOpZOjZz28Wyjtvy6p70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=anv04UdF; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="anv04UdF"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-bc09a8454b9so3333386a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 15:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765581309; x=1766186109; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ITRsrBfFLPXeEMYmsYqDsrHYJ78/qjByazuVizcrhmQ=;
        b=anv04UdF3RnaU7LmoM7Ascnd3l4FKSS2zclh+c9eAiAxThslrAbowz8fjxbPQGrGSl
         V5Z965bjIK/R3C1EsHz7YT6hDuIxhLOTj6LWtFTvLnMiy6+BdgkjUJFY9jnzgITEnLrP
         b8Mmx8acj2Ey4WgjKu3GZNpP+dL7lOYCQ6G5tc2tRimffRsrHBl6OEFZhYZSgAlSUkCJ
         ryZGR2Nr+t5ZeXUpe4mhxaG7pW1MhnngXpXtZ3bzXA0kIzZKsOw+MXZCnE1TNl1SzRFu
         GMxpPTWwnWi35/qi5PJftm3pzMx6a2UzGrrtizRPJhbBSMzHuXb9wJ0OzAdw7l2sUYXq
         gDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765581309; x=1766186109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITRsrBfFLPXeEMYmsYqDsrHYJ78/qjByazuVizcrhmQ=;
        b=g3Pdl2qmDNsBQ83R5FeWil8BBw52oTh+S2pdU5Myi/k13mA1YBk+n105Hl69qhe4yU
         gGs9m5AiTx7RfTtdgbXefvugfwpj8t5Za1wzyxm6uxqYTzm3kTNOoLcyEGmGMh+SDbU3
         2Wcgy5eJb3EYodkp02UIWqIJG4m8udPcum6j2Wmia4prNCrV6XvMYwBEdjwMCM/WCiDl
         ohSH2u5a5xNQ79kx6kvSpmfjj9vBHJY+LJ2zr4B57YSaXXvCKj5+37EzU2hJj1XSy4qP
         o2pTzFPbdcESO/+TKlNqlxT5oZazGbddjngk+uoIraiulgK6WhdFpx0YZ1uTZ81btnrR
         UOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNj1bB44XcAwxqHY6VUHmOkK1D2OQSoxoAptFGaHi8SLgjiZi15kbVA1EXdX6FTSW8JE/GV/MphBBykch2ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoTDRgRXkRcihYFlZH7wOg+CFSxmAyVao+YXvDjEP3GcSU/lu7
	xShR8IrYue9jX6iTdTq5q0K64SY0PewHuqd/ap//AjWdbYgvyIEv56zKWToF34/aUYivmS8xJHp
	yECd1XgJJIw==
X-Google-Smtp-Source: AGHT+IH2FAFHDmZscleFJuxwBaCJeQNIlsiysJoXrY1tEUcgzyr/DK3TBhmPpSnM5HkhHW1QyNBRhdP0yIGJ
X-Received: from dybcq12.prod.google.com ([2002:a05:7300:a10c:b0:2a4:6577:68f1])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7b07:b0:2a4:3592:cf60
 with SMTP id 5a478bee46e88-2ac3018c36bmr2323371eec.4.1765581309423; Fri, 12
 Dec 2025 15:15:09 -0800 (PST)
Date: Fri, 12 Dec 2025 23:14:56 +0000
In-Reply-To: <20251212-soc-bindings-v1-0-db51044ce805@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251212-soc-bindings-v1-0-db51044ce805@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765581303; l=4640;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=AQz7A04h1bgLBtHKWjo2r4fkCOjEQnkQFoWC2phwYWs=; b=35cWEktAnNrcaDwjo6AUDaAdjvcnCNtHIsKKlB3IxUTeLWsyDmnQjx/zfUQZjy9OS3MCZpPe4
 fz3KpgonsEEC/N1R1xwNHDIgwKPLTAvacYJof1wkjzSzALJvAQV3qch
X-Mailer: b4 0.14.2
Message-ID: <20251212-soc-bindings-v1-2-db51044ce805@google.com>
Subject: [PATCH 2/2] rust: Add SoC Driver Sample
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
 samples/rust/rust_soc.rs | 74 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)

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
index 0000000000000000000000000000000000000000..ca0294819f100fa7b713c6b41c5b8a9b3906b863
--- /dev/null
+++ b/samples/rust/rust_soc.rs
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust SoC Platform driver sample.
+
+use kernel::{
+    acpi, c_str, device::Core, of, platform, prelude::*, soc, str::CString, sync::aref::ARef,
+};
+use pin_init::pin_init_scope;
+
+#[pin_data]
+struct SampleSocDriver {
+    pdev: ARef<platform::Device>,
+    #[pin]
+    _dev_reg: soc::DeviceRegistration,
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
+            let machine = CString::try_from(c_str!("Rust Machine"))?;
+            let family = CString::try_from(c_str!("Rust Family"))?;
+            let revision = CString::try_from(c_str!("Rust Revision"))?;
+            let serial_number = CString::try_from(c_str!("Rust Serial Number"))?;
+            let soc_id = CString::try_from(c_str!("Rust SoC ID"))?;
+
+            let attr = soc::DeviceAttribute {
+                machine: Some(machine),
+                family: Some(family),
+                revision: Some(revision),
+                serial_number: Some(serial_number),
+                soc_id: Some(soc_id),
+            };
+
+            Ok(try_pin_init!(SampleSocDriver {
+                pdev: pdev,
+                _dev_reg <- soc::DeviceRegistration::register(attr),
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

