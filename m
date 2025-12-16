Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264273242D8
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 19:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765913079; cv=none; b=hTOMgunK/dwls7icXC5YS/lgWh1v9RICPyA64PxdWqAdFzz1ybQN6lHIM+sgiMQu7VLgeegM/hsABhTAVrDL/QcbEnKqAmwFQ6EgLG+qiycabUmXbEjGjI1ySbBZPV8JaZ1nlnt+RZrpndKF2or9nKm+ZoowZii3q5wS7LBIAN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765913079; c=relaxed/simple;
	bh=God7snImE/2RjSSFJGBdoE/GLr+qwzbcgfa5v+DUTBM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uu4NXITiFcAb3SqApdz962cxvpAs/y+gQ7szCVxR+C371ivbrTqZFoXJFoAghC27ePcv9qb8VmYw1L5ZTs8c8B+uwKnmPIJ7zaFByBzN33A+bPJaH9OuHuPsR+KlofuKi5CSl6cGV6aDuVOHHJWcdxEv55xR76y9lcEDZ4kiEdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PQ4PXVHA; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PQ4PXVHA"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b630753cc38so8155567a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 11:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765913075; x=1766517875; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYNzeEWkQrNZCPjMaj2SJhUyBdynXwycEj28gkBG7Us=;
        b=PQ4PXVHAOlMDOt6WXIb2lq8LIY23tdSjs9/zGWUZrLlJLxfhlF8kcm0pc5+KZ0havd
         2ZMWzx1UCoNzeXhgKnqi762cu/OnKxZpBzPWjqoebHFvQZqWQ39s4pQ4doZm94fbt5gm
         Q05snUrkHPlEhqqLboO+5IjfOMu83olK9fAsxAD4tVAacGWf62tpoz8VtI/0EyKpswJQ
         DXhL0oCzbaO2lEbpNoRzURC5ip3EAba4+QC9wl1SqiDfUS/aMsRElxPdzht2YyDaCwcg
         uircWZx3VDRTnIp3zBlhu+OAj2bb+XtDVO5/3KySUzzbGlOdqgFDWAGJ1WLpqsmtz5wx
         MZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765913075; x=1766517875;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gYNzeEWkQrNZCPjMaj2SJhUyBdynXwycEj28gkBG7Us=;
        b=JqDMESzN6mrabNA6YUlCPs9PKrsZ7TxgDaLnuc2cY7ZAIsv1AEvfP8AimgMcpJ9U+R
         S6vL8A8Cx9EmAbQp8SxPXa02kBXOzzdXAD1T9d1/U3RQ6QrkHaTALlb36ke4vr6DXQIc
         X6i+ELcanxwOkZL5EjJn9du6JzglM+2fFdE8HRvybVS3pBz+GnRw8wEZjcX6VmRJpGYN
         1FGTZk5Rj7lwMfn37FjFiMMKFR7DaoxgAcMuP76+NuehnWhb9X22Fnwh1epc/ib3+th9
         82vOVmiXpXqh9wRRtQbDldXWFNckvBTTRLXVvsPRJz3CvKz2ZXPGf/gQPx3ri1vKnHLS
         a1GA==
X-Forwarded-Encrypted: i=1; AJvYcCUqYZJ9Y4CgBP7wGTxrTnPZr761jToYsjUN7LHoMPx2R8topFc5Izwhz1CjK9kfsnSsoOhSUe1phBCgEI6oeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycG/0leerK3i5XPBRZgBPS73C6unQebeEn0LiuM+J7N149NmSD
	kxmdPykLXd+Oh/Fx/z6K5oDJeCZNRK5hDxKA8ic+h62WGmRFvTxo3BU9iXiTivYONZC7Ea+we43
	8Vdy1khRmJQ==
X-Google-Smtp-Source: AGHT+IEqa4HSnXwXmznEGtV0MuVS4XT84S48mFC2iVd2WV41B6M+Ui3Mh1qclHH3haOf4kxh7G7hqkG0K4Mv
X-Received: from dycmf11.prod.google.com ([2002:a05:693c:248b:b0:2ae:3278:d74f])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:425:b0:2ab:9b40:fc78
 with SMTP id 5a478bee46e88-2ac300fd0a3mr7584436eec.20.1765913075320; Tue, 16
 Dec 2025 11:24:35 -0800 (PST)
Date: Tue, 16 Dec 2025 19:24:29 +0000
In-Reply-To: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216-soc-bindings-v3-0-42ecdc8c117e@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765913070; l=7565;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=God7snImE/2RjSSFJGBdoE/GLr+qwzbcgfa5v+DUTBM=; b=gYixZ9A3KPhDzvm3fxdpfDdtABHWEFy3q6CPr1/fsZfpCw6Tahwp0DLhRPqGrlreI62oI92Oq
 w4q79snJtdzAb+2HNw+yL20dU3SdfamJCM+J+JEESg1gHY5qGE2XxSI
X-Mailer: b4 0.14.2
Message-ID: <20251216-soc-bindings-v3-1-42ecdc8c117e@google.com>
Subject: [PATCH v3 1/3] rust: Add soc_device support
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
2.52.0.305.g3fc767764a-goog

