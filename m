Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81506258EF3
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 00:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765845823; cv=none; b=JlA0W98rF0RvDjbVEA/T5VmdOQWg4zJiRIMCoMlf8NTevttOMq2WoUsAMVuHxg3xVrb6Dxm0wsCqILNpgC3HigMc2IHvnIqm64BKMo+Y0u0Li6/kwH4ZaWFMSrRE6STLIhJ52voxNVVncxX7RkuexO6OLBBF3Fi3I6B8kCrifhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765845823; c=relaxed/simple;
	bh=fu4NDhxTN0vEcpv4FNXIV3vduXqLV7V5Xq8C3/HVXxc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RhuBE4SykQfsPnZqOLjSDmsBajFY6u2mKqWtzOspia/fAHXz9aJL+tIVz1jKpZja3HvNvZodfgpwETUgvRECBQwIkLZwYSgrn+LqWWVfXE+VNYs3lRMPbBhDQQnkw9hZXT/7/IE/WRzLAPsj8ajTfkoJCvgPHvJQhT7/B2hbKTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aqf3zzpD; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aqf3zzpD"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b9d73d57328so3918307a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 16:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765845820; x=1766450620; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n7LDngOMTvVQIllzb2Fwg2WMN04+Td6gaOqvNXOfbNU=;
        b=aqf3zzpDJCnN5iHxg5DeNMuuu9Bsei5/Kek0jy/zhChLQ1r1W7U6ldlB4Mq5IyhO3T
         7JvbxNpWoVir3h5I/szlpDa4EoFm+gsGMYX0ka3JSB1j2lEmWI4H0MRYF5ueeqSWJTNU
         izqfliG0dyok58Cb/W159cQ4RArAHTMx7yQs08uNYTrb7GxMkdwn9x900y8MzNTATJxC
         nHdz+e3s4ZcaCIM+UjUc0uR3DfM1J8vwvLSfI0/NFC2M4PP3a1qPKsSoLvq1jPyeRwxm
         z+5ZIoLFMZEcykKiywgsKaE654JTIQbeGD3OaX6zDcajme4xt2W3RiSLkfkcL6EDgshK
         lqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765845820; x=1766450620;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n7LDngOMTvVQIllzb2Fwg2WMN04+Td6gaOqvNXOfbNU=;
        b=kSknby9aNd+xa7zWXDSo/tmCZr0BB0zcZ3Qua5uFUCCDiwL0Dw105KUnlFty35Sk6G
         gZ+AtmYEbXEURnhY1BZaN/YQf2DRE/+BSb2tOVIXc3JfnuV3MlDmWRpJDLoZePS/BcZT
         ul8NBC7m8IULBBkStvJwJWN2fQdRQ3AAghWaKJ0DkweKqb1IiJN+aLcLqWumEPjQfW/5
         rVXBkakqjZIx4yvFuKbZWJCo5/QbybaXxcLvY05oeYrF8mhVzzUsWMLarELpTvjhMU8g
         x2IjvDEgcQjwghoWdbVpW+aCW9g10SUOwBoPB8Xwm/cHhBUCVapfd7QICMJU95rYEIDA
         PIiA==
X-Forwarded-Encrypted: i=1; AJvYcCVp3x7nqcKxiePzTBhnSHwoSDg0IAKK6uuVMK+5eFYZuLm06zFA8IeGDJGMG+eK+D/N8vX/K8mI7f/rB7FXRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7LFTmuC1iIGPiHFyRImul6YrBIwi7afDSJIR/greA3aia4tz0
	T24PjHgN8hz7dc1w9hnr5F1Vu+kAYZO06HIVUsnyTSkR9FVVXklBJHO7Llg0kI1/FfgXYb5MzHe
	LaEiVNhhIrQ==
X-Google-Smtp-Source: AGHT+IEpgLt2AHjnwwfV2EWOp+RGMgpkUD4QhWBb/tMFYvedkswQ0oBcRzRIkrA2/wTbNRjig8jxQfCBz+kp
X-Received: from dybnz37.prod.google.com ([2002:a05:7300:e8a5:b0:2ab:9468:d9cf])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:2524:b0:2a6:a099:b8de
 with SMTP id 5a478bee46e88-2ac303c91bfmr5786752eec.30.1765845819697; Mon, 15
 Dec 2025 16:43:39 -0800 (PST)
Date: Tue, 16 Dec 2025 00:43:33 +0000
In-Reply-To: <20251216-soc-bindings-v2-0-1fb394cc921a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-soc-bindings-v2-0-1fb394cc921a@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765845816; l=8357;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=fu4NDhxTN0vEcpv4FNXIV3vduXqLV7V5Xq8C3/HVXxc=; b=I2UkfhO4bT9fSFWXABdqRNjvZBD7KaRjfJ4AnFifEtl8bQkkPYKH5W4/1JGapK84qibS2NTzj
 0Uq/nvLWI72BQMrJawkD7iJQRCfNWEtz6hCcx3fFwrBTcasqWhypQWT
X-Mailer: b4 0.14.2
Message-ID: <20251216-soc-bindings-v2-1-1fb394cc921a@google.com>
Subject: [PATCH v2 1/3] rust: Add soc_device support
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Allow SoC drivers in Rust to present metadata about their devices to
userspace through /sys/devices/socX and other drivers to identify their
properties through `soc_device_match`.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/soc.rs              | 145 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 149 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c5a7cda26c600e49c7ab0d547306d3281333f672..4ff01fb0f1bda27002094113c0bf9d074d28fdb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7700,6 +7700,7 @@ F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
 F:	rust/kernel/faux.rs
 F:	rust/kernel/platform.rs
+F:	rust/kernel/soc.rs
 F:	samples/rust/rust_debugfs.rs
 F:	samples/rust/rust_debugfs_scoped.rs
 F:	samples/rust/rust_driver_platform.rs
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b422b4256f4a2b75fe644d47e6e82c8..9fdf76ca630e00715503e2a3a809bedc895697fd 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -80,6 +80,7 @@
 #include <linux/sched.h>
 #include <linux/security.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 #include <linux/task_work.h>
 #include <linux/tracepoint.h>
 #include <linux/usb.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf12004286962985a068665443dc22c389a2..6d637e2fed1b605e2dfc2e7b2247179439a90ba9 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -138,6 +138,8 @@
 pub mod seq_file;
 pub mod sizes;
 pub mod slice;
+#[cfg(CONFIG_SOC_BUS)]
+pub mod soc;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
new file mode 100644
index 0000000000000000000000000000000000000000..fb9e461218787b5546805c0f04fadbc5e3e054a6
--- /dev/null
+++ b/rust/kernel/soc.rs
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! SoC Driver Abstraction.
+//!
+//! C header: [`include/linux/sys_soc.h`](srctree/include/linux/sys_soc.h)
+
+use crate::{
+    bindings,
+    error,
+    prelude::*,
+    str::CString,
+    types::Opaque, //
+};
+use core::ptr::NonNull;
+
+/// Attributes for a SoC device.
+///
+/// These are both exported to userspace under /sys/devices/socX and provided to other drivers to
+/// match against via `soc_device_match` (not yet available in Rust) to enable quirks or
+/// device-specific support where necessary.
+///
+/// All fields are freeform - they have no specific formatting, just defined meanings.
+/// For example, the [`machine`](`Attributes::machine`) field could be "DB8500" or
+/// "Qualcomm Technologies, Inc. SM8560 HDK", but regardless it should identify a board or product.
+pub struct Attributes {
+    /// Should generally be a board ID or product ID. Examples
+    /// include DB8500 (ST-Ericsson) or "Qualcomm Technologies, inc. SM8560 HDK".
+    ///
+    /// If this field is not populated, the SoC infrastructure will try to populate it from
+    /// `/model` in the device tree.
+    pub machine: Option<CString>,
+    /// The broader class this SoC belongs to. Examples include ux500
+    /// (for DB8500) or Snapdragon (for SM8650).
+    ///
+    /// On chips with ARM firmware supporting SMCCC v1.2+, this may be a JEDEC JEP106 manufacturer
+    /// identification.
+    pub family: Option<CString>,
+    /// The manufacturing revision of the part. Frequently this is MAJOR.MINOR, but not always.
+    pub revision: Option<CString>,
+    /// Serial Number - uniquely identifies a specific SoC. If present, should be unique (buying a
+    /// replacement part should change it if present). This field cannot be matched on and is
+    /// solely present to export through /sys.
+    pub serial_number: Option<CString>,
+    /// SoC ID - identifies a specific SoC kind in question, sometimes more specifically than
+    /// `machine` if the same SoC is used in multiple products. Some devices use this to specify a
+    /// SoC name, e.g. "I.MX??", and others just print an ID number (e.g. Tegra and Qualcomm).
+    ///
+    /// On chips with ARM firmware supporting SMCCC v1.2+, this may be a JEDEC JEP106 manufacturer
+    /// identification (the family value) followed by a colon and then a 4-digit ID value.
+    pub soc_id: Option<CString>,
+}
+
+struct BuiltAttributes {
+    // While `inner` has pointers to `_backing`, it is to the interior of the `CStrings`, not
+    // `backing` itself, so it does not need to be pinned.
+    _backing: Attributes,
+    // `Opaque` makes us `!Unpin`, as the registration holds a pointer to `inner` when used.
+    inner: Opaque<bindings::soc_device_attribute>,
+}
+
+fn cstring_to_c(mcs: &Option<CString>) -> *const kernel::ffi::c_char {
+    mcs.as_ref()
+        .map(|cs| cs.as_char_ptr())
+        .unwrap_or(core::ptr::null())
+}
+
+impl BuiltAttributes {
+    fn as_mut_ptr(&self) -> *mut bindings::soc_device_attribute {
+        self.inner.get()
+    }
+}
+
+impl Attributes {
+    fn build(self) -> BuiltAttributes {
+        BuiltAttributes {
+            inner: Opaque::new(bindings::soc_device_attribute {
+                machine: cstring_to_c(&self.machine),
+                family: cstring_to_c(&self.family),
+                revision: cstring_to_c(&self.revision),
+                serial_number: cstring_to_c(&self.serial_number),
+                soc_id: cstring_to_c(&self.soc_id),
+                data: core::ptr::null(),
+                custom_attr_group: core::ptr::null(),
+            }),
+            _backing: self,
+        }
+    }
+}
+
+/// # Safety
+/// If a device is returned (e.g. no error), `attr` must remain valid for reads until the
+/// returned pointer is released through `soc_device_unregister`.
+unsafe fn register_device(attr: Pin<&BuiltAttributes>) -> Result<NonNull<bindings::soc_device>> {
+    let raw_soc =
+            // SAFETY:
+            // * The struct provided through attr is backed by pinned data next to it, so as
+            //   long as attr lives, the strings pointed to by the struct will too.
+            // * `attr` is pinned, so the pinned data won't move.
+            // * If it returns a device, and so others may try to read this data, by caller
+            //   invariant, `attr` won't be released until the device is.
+            error::from_err_ptr(unsafe { bindings::soc_device_register(attr.as_mut_ptr()) })?;
+    // `soc_device_register` should not return NULL, but it doesn't hurt to be paranoid.
+    NonNull::new(raw_soc).ok_or(EINVAL)
+}
+
+#[pin_data(PinnedDrop)]
+/// Registration handle for your soc_dev. If you let it go out of scope, your soc_dev will be
+/// unregistered.
+pub struct Registration {
+    #[pin]
+    attr: BuiltAttributes,
+    soc_dev: NonNull<bindings::soc_device>,
+}
+
+// SAFETY: We provide no operations through `&Registration`.
+unsafe impl Sync for Registration {}
+
+// SAFETY: All pointers are normal allocations, not thread-specific.
+unsafe impl Send for Registration {}
+
+#[pinned_drop]
+impl PinnedDrop for Registration {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: Device always contains a live pointer to a soc_device that can be unregistered
+        unsafe { bindings::soc_device_unregister(self.soc_dev.as_ptr()) }
+    }
+}
+
+impl Registration {
+    /// Register a new SoC device
+    pub fn register(attr: Attributes) -> impl PinInit<Self, Error> {
+        try_pin_init!(&this in Self {
+                    attr: attr.build(),
+                    // SAFETY: We have already initialized attr, and we are inside PinInit and Self
+                    // is !Unpin, so attr won't be moved and is valid. If it returns success, attr
+                    // will not be dropped until after our `PinnedDrop` implementation runs, so the
+                    // device will be unregistered first.
+                    soc_dev: unsafe {
+                        register_device(Pin::new_unchecked(&(*this.as_ptr()).attr))?
+                    },
+        }? Error)
+    }
+}

-- 
2.52.0.305.g3fc767764a-goog

