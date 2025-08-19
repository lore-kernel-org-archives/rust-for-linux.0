Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9BF258EE6
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 23:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755645164; cv=none; b=XCGljPvGjx4yqTfWfBPvIWSkmlQfeqUA7Jid52FsHuYt0QmjFQ+4foihEav//ThI9dsi3voBMAnjQctzjmtqdcWLUN75PNPNINgsMVzQ7Y6uLezKNE0pP7jqdgG3RXyYDSoM8eu6EXG19XMJPI38jpfqitmQXcIooHU31zRZW50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755645164; c=relaxed/simple;
	bh=/sQtIBYFoOnpF5rNBeNufGj8k1f/8wsUIbzjXDdvRH4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yv5s/nTFexhmcswjgZ6It/IKQ90oZzkt7Pr9rLMEmCJR4iEVca73oRAuIN7bjcWQKJXiJwvJ42/vQu+K0C78MyYNI1qrTQCP5JCKQv1ZV5JZ1bpYKl4vanqeZgAIKsEZOLJ+t7SDvU0JP3M2lBPE7uJ/3qB2nWNed48T+hI122A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eO4WyzMA; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eO4WyzMA"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b4761f281a8so507140a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 16:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755645161; x=1756249961; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYRu41w7P7laHNqkDjkFmEfy6zg8q08IlScnpwVSpE8=;
        b=eO4WyzMAWB7i5Xf8SGTwBo8mwGdG/ldrVqp/X5tqJe/zWqc55LVb1334zopivk5yCr
         9q8+cWdK+ObZbyjCRrhwaPxBcK6eCFhMQfhcmvJ0COo78vNeMf1/ns82SIv50167t0OU
         d7OFXf4gKJP/A/bKvLj22Hd2uiJntzBr9Emzfx84R2x8Jsi+e1+Ky80qgeRcPdUOwacz
         5+CGR8xGDC3Oah8I7GG2xV+1roGaof+ilyl//jTkI24K32VY4T5hEfBnVXfJPCW4gwhk
         JaRWe5PxGSqa72v/rncDQw47GJc0hwu3aM6Pp5c9ieRfKn4QZMS3mdthZIEUcQktSUGb
         MlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755645161; x=1756249961;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYRu41w7P7laHNqkDjkFmEfy6zg8q08IlScnpwVSpE8=;
        b=V6SSzNb76NfTc8Gflf8f4cYAupA0eiq66+zHBut0XUZtmUVI6AhxNnGAIkz/NWEu8Y
         aeb21tFmsVFZ4TSgJ2zLs1y5TLMTl92UcB6Jay9CYiVgJXqllXrjL7k2PZwbypOHF9IO
         TnmiNGFaIce69F1Hk6QLPAzm6dLBw75q554pCQ094TZAQzkadEG9lMgcQJp601BD/OWR
         aDzWxYC9Q3T/PRgM7DuAdLC3Py2DeSzZfbLSj+Pwa3a/0jb0P1raf9qxUhmbV2XzU+hw
         Sk9bpcS1/z3o0L26pI2n3NwNkEJYuijc66qvQHSsvto9z40WoGzeICZatJk4cWuIaaao
         DJdw==
X-Forwarded-Encrypted: i=1; AJvYcCWvHaXT6mFAdz+mm5dWEUVZOLQXempa1UWs1wmS5Zin9+Qz2gNDqA7o9IqPJ5eD3u5etViMCL+kQY28aNCmHg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe///WtbKySiCmNn13IYidW/rYmR0n+81HrVXhVaxL4jYAG/rZ
	nqFxvklXO5z8nBb+Kbh7TwMXR2L9N7/t1OurhuhgpsfS+wqRa/D9TNc4edyFtE25tcLr4WYM9vR
	5AEeb2wrpRA==
X-Google-Smtp-Source: AGHT+IH1pH191A63Rhbgyri0LWOTl9R3+yumdoXIlkp89Db8xkaKvpm7+k+4T2kqoW/nSRXKvxKrM/RTk/bE
X-Received: from pjx7.prod.google.com ([2002:a17:90b:5687:b0:311:ef56:7694])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5405:b0:312:e8ed:758
 with SMTP id 98e67ed59e1d1-324e12d6bffmr1005537a91.13.1755645161597; Tue, 19
 Aug 2025 16:12:41 -0700 (PDT)
Date: Tue, 19 Aug 2025 23:12:32 +0000
In-Reply-To: <20250819-qcom-socinfo-v1-0-e8d32cc81270@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250819-qcom-socinfo-v1-0-e8d32cc81270@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755645158; l=6997;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=/sQtIBYFoOnpF5rNBeNufGj8k1f/8wsUIbzjXDdvRH4=; b=KBVrJ6ZJZK5H5PxPRzqmcbVwzyAJFZliSRPMJb0XsfWslq30dvXv5hue0VyqxvXmgtqKhB8iY
 AEK0KdQs6uGBQyy9BH/Qm/dZI8q1zF7kOkHXyECwGNf9Utmj2U3QMMg
X-Mailer: b4 0.14.2
Message-ID: <20250819-qcom-socinfo-v1-1-e8d32cc81270@google.com>
Subject: [PATCH WIP 1/5] rust: Add soc_device support
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	Dirk Beheme <dirk.behme@de.bosch.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds the ability to register SoC devices.

(This will be sent upstream in a separate request, it's uploaded now as
a dependency of the example driver.)

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/soc.rs              | 137 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 141 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2cbe890085dbb6a652623b38dd0eadeeaa127a94..e0ff2731f1c2ae4bb01d361e99c1f4517fbd45d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7481,6 +7481,7 @@ F:	rust/kernel/devres.rs
 F:	rust/kernel/driver.rs
 F:	rust/kernel/faux.rs
 F:	rust/kernel/platform.rs
+F:	rust/kernel/soc.rs
 F:	samples/rust/rust_debugfs.rs
 F:	samples/rust/rust_scoped_debugfs.rs
 F:	samples/rust/rust_driver_platform.rs
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index e847820dc807fdda2d682d496a3c6361bb944c10..140e2f4e60c0b745ac5d5c7456d60af28e21f55a 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -72,6 +72,7 @@
 #include <linux/sched.h>
 #include <linux/security.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 #include <linux/tracepoint.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 828620c8441566a638f31d03633fc1bf4c1bda85..045f1088938cf646519edea2102439402fb27660 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -117,6 +117,8 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
+#[cfg(CONFIG_SOC_BUS)]
+pub mod soc;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b8412751a5ca8839e588cf5bd52f2e6a7f33d457
--- /dev/null
+++ b/rust/kernel/soc.rs
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2025 Google LLC.
+
+//! SoC Driver Abstraction
+//!
+//! C header: [`include/linux/sys_soc.h`](srctree/include/linux/sys_soc.h)
+
+use crate::bindings;
+use crate::error;
+use crate::prelude::*;
+use crate::str::CString;
+use core::marker::PhantomPinned;
+use core::ptr::addr_of;
+
+/// Attributes for a SoC device
+pub struct DeviceAttribute {
+    /// Machine
+    pub machine: Option<CString>,
+    /// Family
+    pub family: Option<CString>,
+    /// Revision
+    pub revision: Option<CString>,
+    /// Serial Number
+    pub serial_number: Option<CString>,
+    /// SoC ID
+    pub soc_id: Option<CString>,
+}
+
+// SAFETY: We provide no operations through `&BuiltDeviceAttribute`
+unsafe impl Sync for BuiltDeviceAttribute {}
+
+// SAFETY: All pointers are normal allocations, not thread-specific
+unsafe impl Send for BuiltDeviceAttribute {}
+
+#[pin_data]
+struct BuiltDeviceAttribute {
+    #[pin]
+    backing: DeviceAttribute,
+    inner: bindings::soc_device_attribute,
+    // Since `inner` has pointers to `backing`, we are !Unpin
+    #[pin]
+    _pin: PhantomPinned,
+}
+
+fn cstring_to_c(mcs: &Option<CString>) -> *const kernel::ffi::c_char {
+    mcs.as_ref()
+        .map(|cs| cs.as_char_ptr())
+        .unwrap_or(core::ptr::null())
+}
+
+impl BuiltDeviceAttribute {
+    fn as_mut_ptr(&self) -> *mut bindings::soc_device_attribute {
+        core::ptr::from_ref(&self.inner).cast_mut()
+    }
+}
+
+impl DeviceAttribute {
+    fn build(self) -> impl PinInit<BuiltDeviceAttribute> {
+        pin_init!(BuiltDeviceAttribute {
+            inner: bindings::soc_device_attribute {
+                machine: cstring_to_c(&self.machine),
+                family: cstring_to_c(&self.family),
+                revision: cstring_to_c(&self.revision),
+                serial_number: cstring_to_c(&self.serial_number),
+                soc_id: cstring_to_c(&self.soc_id),
+                data: core::ptr::null(),
+                custom_attr_group: core::ptr::null(),
+            },
+            backing: self,
+            _pin: PhantomPinned,
+        })
+    }
+}
+
+// SAFETY: We provide no operations through &Device
+unsafe impl Sync for Device {}
+
+// SAFETY: Device holds a pointer to a `soc_device`, which may be sent to any thread.
+unsafe impl Send for Device {}
+
+/// A registered soc device
+#[repr(transparent)]
+pub struct Device(*mut bindings::soc_device);
+
+impl Device {
+    /// # Safety
+    /// * `attr` must be pinned
+    /// * `attr` must be valid for reads during the function call
+    /// * If a device is returned (e.g. no error), `attr` must remain valid for reads until the
+    ///   returned `Device` is dropped.
+    unsafe fn register(attr: *const BuiltDeviceAttribute) -> Result<Device> {
+        let raw_soc =
+            // SAFETY: The struct provided through attr is backed by pinned data next to it, so as
+            // long as attr lives, the strings pointed to by the struct will too. By caller
+            // invariant, `attr` is pinned, so the pinned data won't move. By caller invariant,
+            // `attr` is valid during this call. If it returns a device, and so others may try to
+            // read this data, by caller invariant, `attr` won't be released until the device is.
+            error::from_err_ptr(unsafe { bindings::soc_device_register((*attr).as_mut_ptr()) })?;
+        Ok(Device(raw_soc))
+    }
+}
+
+#[pin_data(PinnedDrop)]
+/// Registration handle for your soc_dev. If you let it go out of scope, your soc_dev will be
+/// unregistered.
+pub struct DeviceRegistration {
+    #[pin]
+    attr: BuiltDeviceAttribute,
+    soc_dev: Device,
+    // Since Device transitively points to the contents of attr, we are !Unpin
+    #[pin]
+    _pin: PhantomPinned,
+}
+
+#[pinned_drop]
+impl PinnedDrop for DeviceRegistration {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: Device always contains a live pointer to a soc_device that can be unregistered
+        unsafe { bindings::soc_device_unregister(self.soc_dev.0) }
+    }
+}
+
+impl DeviceRegistration {
+    /// Register a new SoC device
+    pub fn register(attr: DeviceAttribute) -> impl PinInit<Self, Error> {
+        try_pin_init!(&this in Self {
+                    attr <- attr.build(),
+                    // SAFETY: We have already initialized attr, and we are inside PinInit and Self
+                    // is !Unpin, so attr won't be moved and is valid. If it returns success, attr
+                    // will not be dropped until after our `PinnedDrop` implementation runs, so the
+                    // device will be unregistered first.
+                    soc_dev: unsafe { Device::register(addr_of!((*this.as_ptr()).attr))? },
+                    _pin: PhantomPinned,
+        }? Error)
+    }
+}

-- 
2.51.0.rc1.167.g924127e9c0-goog

