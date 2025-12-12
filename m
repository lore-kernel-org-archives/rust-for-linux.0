Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9477030F534
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 23:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765581309; cv=none; b=uw270piJ3icjo6JJtQX1Jgco6DTdl4B77uArriDzs7XJPTJ5atLh6eeIOhg1ok3+Blox1v5AQK/RtBxGiPrkSs2mYcO/ZgAEU8ilgUSECcodCJnAx8/N/w9gBatKO8VzmIIJ0Jp7eu9RdXxnjQ9qyDffJVS49B7pHJfsceD1dLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765581309; c=relaxed/simple;
	bh=BB+Eg8n+4O9ZedIQbOqF11dMdqp9IJcEk7Jpmsg8upI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oM4asnGMjIVl1l2EzoeSGV1KK4rpCcueSxwYFkJB61YyhJwUEEiKcTwYjdCrmbZ9n8YP6FRrEDW7DVUzVMfKJjSlFviXVhW2PqLu4/z2NAZq4L1Q4llb/Naxau108qEdfy+CuzLX9r7z6UEn8wxQH45XFoAy9thFZfchoXBDgi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=33Yiwnm0; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="33Yiwnm0"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1859385a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 15:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765581307; x=1766186107; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QX553GJLvlV7oXg2YdBVQASii+8KSTzYKv8qfYedNdg=;
        b=33Yiwnm0B4RiQF+NObt/L5E0mt1UDf053pxQELsbSSUkkra7tM2db8j/Dzc811hVeh
         BoY+YlVytfbBRZ1fFDat/NjnD3zEa0UnSX/qSqJz6334AS4cOwsd/+tvWH3SctrcGjAt
         KIzoVyHZ19IQTFUpauLvQPH96xQdRl8Sl31JfNZIYDQeiQUfVY4KG8uIWNzqtYA9xSPM
         Y2VfsvBu/PcAvpF+9y0Sd6oyK5NCkaLVI2OTgR1LfAeCwAgv95JqKJXFC0oIseSvG7Dc
         LwaPv9iPScFdBnu4y5DxLDwjJEUlpmbq6c7xhPFKwZ2hl/CjHB0n1O101xQC45w5lBZI
         09FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765581307; x=1766186107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QX553GJLvlV7oXg2YdBVQASii+8KSTzYKv8qfYedNdg=;
        b=guY6YnHrmjtodG14DTTCwIA1xEh+cMmuMmnAKKBejX6PA7+FTywgtmLmnJ2P+BvPuT
         VM28NTMdX+/JVpcz8RdEjLcv9J+qeunB3vmkvg6UHrNJwdB8FPJpIjaahGso6l6pJKZX
         oh0uYOfqPPX6B47Wy+LLDpCmBh61IYAvj6A6WuGbblXIheyLmLIIXEGoS4ADGJAih+0Y
         LlfZJs6ufsTAtRdNplm4k7LuoKbf1eg9OM9E2fGYDSSeFXekGUuEDpalwJii//1ElLyC
         5cb+evMa6mKA6WWND1SCRxlYWhvqLNz2jYTBQsGbTskhs+yIm56WhWhOw3duaKpU1PI5
         o9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLAvt/+fsXWgRzV7us2+OHkCsBQgCBldRKgUGCb+c/B29gVYHVz15V7Vm599gXu2GAwZeY1o0SGahi4kfzBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YztFKP6i/BomQ9TLutaM2TBPz3tAqKOZoqd5cBN1W+R2c9zbmad
	04lte8zGXDjeFsz/xlF/8+acUIz3M19s3F3OJ9kKzHOehrHhot31bzCJLqP63cxLvJps0vTgrgy
	73c+yp+HXLQ==
X-Google-Smtp-Source: AGHT+IF9LnQXtjA599msQYqIJ97ArWAA7r5j7LWzMKTbd3Ox6en5Nxc/AEMs8ti50UoeRuf+ObVybQ40bQQq
X-Received: from dyaa9.prod.google.com ([2002:a05:693c:40c9:b0:2a6:a19b:9a22])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:f144:b0:2a4:6a87:7285
 with SMTP id 5a478bee46e88-2ac3014dc4fmr2165890eec.39.1765581306758; Fri, 12
 Dec 2025 15:15:06 -0800 (PST)
Date: Fri, 12 Dec 2025 23:14:55 +0000
In-Reply-To: <20251212-soc-bindings-v1-0-db51044ce805@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251212-soc-bindings-v1-0-db51044ce805@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765581303; l=6876;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=BB+Eg8n+4O9ZedIQbOqF11dMdqp9IJcEk7Jpmsg8upI=; b=lu50R0mQBljHaheW/ktEJbF5o08ArK46LmiiwgMs9soVPjx2r1Bn3bEKoqUT3sLyh+FHzc3Qi
 EXEZ7lxG9cICNYy/1G5+FWmRMPvPcMw2hjxCpw1Vm7vdHhQn4JiQi8d
X-Mailer: b4 0.14.2
Message-ID: <20251212-soc-bindings-v1-1-db51044ce805@google.com>
Subject: [PATCH 1/2] rust: Add soc_device support
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds the ability to register SoC devices.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/soc.rs              | 137 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 141 insertions(+)

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
2.52.0.305.g3fc767764a-goog

