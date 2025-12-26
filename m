Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E199120125F
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766780233; cv=none; b=UtjLt4rGbekz6oMfFLz+PajdTa+MKIhZmIwitNd2Detds2EuokQpKqWHP52XSiMvpmxsbuxydYsijFkcnjiIF5/qtTlvFaT7OBG5HBGFS0X0RRTQ94S8oBWxMy6QBrXHHS0naJXYnRH6p1goY3bIJhAS1/UgJUXFgwaXVOHnFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766780233; c=relaxed/simple;
	bh=vp8Yy4uf2L8v2nN/BjXes/BY2UojDEtB2beFPE4/Dq8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cKgyQsUz+z5w/YlVYNfqm778vtdSbr4A/pP8Z+HzGGwmvSG612Oz/xhaneK1lLuw67gB/jblgVQ6AlLlcSn0GqC+knMtdI3fTJj3XSxBtZ3/ZUAA3286c2fh6M1P8aJXJxlZHwDJLv+BwQN6GsPqSgMRSXR0K1Pk/lx0do8qRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L9MOoQvQ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L9MOoQvQ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2a08cbeb87eso125797075ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 12:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766780231; x=1767385031; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zz3ZyeBmKBt2y6OI3g9KdB1vakMP9sSbCkDeJ9UcYu8=;
        b=L9MOoQvQilogQ4GEGwioNoz7lhN68+jxOlhivstluahXBdb/LLoPM9T81guwn2Dxxt
         +YRqEfb+k46Zf+eNslYNgMOTv1JJvmO6bLLj8xiDA98mTajMjwvig/QxlXBFr5ebZgaE
         FRwzccSWkmS5f5wKZbTGo4obheGSGzy5FXDzeNxwwFBWo6/L620Ur0GfZXTTkY8tJZt+
         6cumOwKnc0FYCsaj6RXd3U61blszSb+uUOHavS6EKN6VcSVX5wdlXVd7AlGcMZVciI0h
         LxdyCr+OnJ3sXw7FYQ998mvrZ69IXFzFEUgWw2JSuuYN0a6LVmNPhiktj9AmTO7iP/+k
         4hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766780231; x=1767385031;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zz3ZyeBmKBt2y6OI3g9KdB1vakMP9sSbCkDeJ9UcYu8=;
        b=VSXUJiH6AJuePywSvDMVecz/Px53maC2juZCRTWASlyOegoY9daZHPT9ZyYQiuniGh
         oZW15Kjn8Ne4ayyStQdBAMjR/e4hBE8vY2F3hofLVcf7AE5rN8zpUrHfb7Zjtey70uoV
         maR4xWABIFCDSKD1RQlFjcbBL37jkzVJQow3A53xNstyQtQ7oVNp+q7lTeBg/XFR92tU
         yDDL/9zh/Ir8ZnQxMDqZAfxNgJ4RocOLJ/IzkyQ0y0x55HSgXdspveTRxELPfQfAkJB4
         QfkupiA5I27WMgNCIjxHzx/p72u+6w1gWMCZdTwqtKVdLPAfoScifD5hQeBSreFszYI9
         95Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXF9Yi8BYqPU3rSMbVZyBqp1pBdz7rm8Gpb5ZunBXG+tUzIe6xRnU2uCx07PrksXc9LqiTUEotzFvGy3iwRUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVrCEmeuwRcTOGOsRiJF7wwgJ90NrPg57J9OZ4CFLCYNywlqSM
	k3Qqu70Uyh9Bet3eq9GkyixeQ01AHt4hq6KPv1r4poDyZWMd6cVYjjip2atBm0Xw2uKHT92Thjm
	e4aRZw6DULQ==
X-Google-Smtp-Source: AGHT+IFxfDKXFW0xczZqBz1TfOO0JXiQRbmEXCyKtHbQRkKzMctPSWfj+RUKPqvkQlC1pLlxWLJ3SN0LPX4R
X-Received: from dlbpy24.prod.google.com ([2002:a05:7022:e998:b0:120:5c35:c798])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2404:b0:11b:923d:773f
 with SMTP id a92af1059eb24-121721aae47mr17916261c88.5.1766780231141; Fri, 26
 Dec 2025 12:17:11 -0800 (PST)
Date: Fri, 26 Dec 2025 20:17:07 +0000
In-Reply-To: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251226-soc-bindings-v4-0-2c2fac08f820@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766780228; l=7565;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=vp8Yy4uf2L8v2nN/BjXes/BY2UojDEtB2beFPE4/Dq8=; b=ST0hIqnSMdJv0UsgcrYBqIlKA6oWPcxHCROn0eFgpNseRUVsviiUVho7iVN1uLvAQOKsGwNeC
 TkuorY7m6HeDcbf+u4SHoql17GGCwNZhsgwWyM16kacGzBjNRMlPibd
X-Mailer: b4 0.14.2
Message-ID: <20251226-soc-bindings-v4-1-2c2fac08f820@google.com>
Subject: [PATCH v4 1/3] rust: Add soc_device support
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
 rust/kernel/soc.rs              | 135 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 139 insertions(+)

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
index 0000000000000000000000000000000000000000..0d6a36c83cb67ef20dc1e3d3995752f36e25ac9f
--- /dev/null
+++ b/rust/kernel/soc.rs
@@ -0,0 +1,135 @@
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
+    pub fn new(attr: Attributes) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            attr: attr.build(),
+            soc_dev: {
+                // SAFETY:
+                // * The struct provided through attr is backed by pinned data next to it,
+                //   so as long as attr lives, the strings pointed to by the struct will too.
+                // * `attr` is pinned, so the pinned data won't move.
+                // * If it returns a device, and so others may try to read this data, by
+                //   caller invariant, `attr` won't be released until the device is.
+                let raw_soc = error::from_err_ptr(unsafe {
+                    bindings::soc_device_register(attr.as_mut_ptr())
+                })?;
+
+                NonNull::new(raw_soc).ok_or(EINVAL)?
+            },
+        }? Error)
+    }
+}

-- 
2.52.0.351.gbe84eed79e-goog

