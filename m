Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996188;
	b=hW/qt873ayp2LsdS+NczouGo30EKbyAQL1awWGY+xX9zM9r5qM0d7LFsVamQQH7RZWlT
	 RcWNNLMxe2XaXBRS6auanHCR4y5eYGGemiHdz5IF5otdxeEyVepEJHkTHg9PzkM/OTWZ9
	 HeXaOyOG/F9+CbW1qwZcFzRa4N5y1yjPDyXB92OOucm10en7ULPc5FUiS4KBNDRg+fmUJ
	 AcTSNqn8dozmvlluI0rbD0/nVEmAenAiWok3n8BtcM7x3ckv5bACWXxFy8Q+30UgdcrHM
	 II6cZM3Mds8w1KZrKZTRYYvLESX0NevHaYRMX9ugXZWY7C33/GEREAOHFLTEciFb0ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=u96v/l1+xXJ2MV/8Ktn1lnD96esk0JZnnP96V1E2tac=;
	b=vNljq37QFwOmW70tGLKSkTMBqmUSrv0nppo1t01FB+KCcFcj881LATudOvXrt0gZP0Cr
	 f3TEocj6+RUMlxjr72EQL9+nFrFfYqBukzdBeMU+IW45p+aPnESNszo0za053v8NUUtUt
	 VgLBqAROIL0IQsU4Z9Dujm9EcPaHILNj8lKzcnxMe08vttks4nHNuRA4kF+C8b+by40db
	 +YRtSrmd4DglleYQ/P5QcuVvrJ5Pr86u2E+0rjN+cBTpKOPMmebAmH6Znk57tFbVZlXvM
	 xhWub6+D/ho2Bujiwh7BoHqjVA72wd3SWYph0Uki9vxgRFnQpDF/GofoS+8vc6BR1Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gb2BWq23;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D631606A32D
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 20:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D631606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gb2BWq23
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10012385e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 12:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793996186; x=1794600986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u96v/l1+xXJ2MV/8Ktn1lnD96esk0JZnnP96V1E2tac=;
        b=gb2BWq23VTGwtOkewQgTIO8/qAv5pyYkWXkyhtMjA950ErrbCN3lwb8cIxCTEp/lkt
         j2HlSowOWP5TP0twDa5Y8P0ZtR2drK2hOs36NzmS4YeE1N/xNGa7S7TTBYY9ytLTk7gD
         tYtcCrQHQ1cRLRXliXYvGJrqE+CuaqrJ9gcFZQS3bYFOi/sIr6tpNCoqOxvnjqWKFS/7
         k1I/kA2mLVun+dzUFLVp5tKajCVgr1nQKIutfcEGJafj73oj6nnVw0EE5ymDHf2zXrNK
         V2yBx3tXJdfFk+5yI3/qOYYLyIldXM81qJjm4vt3dyInKatNT2WyoB35DYvXOaUWjdlo
         rI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793996186; x=1794600986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u96v/l1+xXJ2MV/8Ktn1lnD96esk0JZnnP96V1E2tac=;
        b=BRXesNbv6h3+8NfRa1wHIbPD6yERcDoqepAD/+waCCHblP+dAtRhofYqnkSqV8nZRB
         +3tQr/3c/EigMrZt0biFg7F/25uqr9OkwuUoHDsUur62RUlshZnPMXoluUJAW74RI0cH
         jx1AkPNrchuk5CzGcMoxD3oQQ8MdBOAm9LuYr754IHYl+ok9w2UwSB4h8dO4xDsfevnE
         WZMOKXsl6+jeIIwG86Bdm958eEtRLH+0AcZ0UBHD6ZZ5BBIBLg78TJ3ASp/YQjSETgxq
         6iXWU2cr1Ck926XQ7A1auqVyLVIaEllO7aUQURhNvSb1mkAh15+7Lnm+0rV4bTXc6dqB
         2pWQ==
X-Gm-Message-State: APuU4Z/UTc+O8H4lpEWpNo80ryeBgFH1Say2RhW1K3lCUWzQK9+uTV3P
	8Iib1xl++IWryzJ9jclOiRZDdqWL2xDOOw7q7ym/r4YOZHmNeCzddHtQ
X-Gm-Gg: AYBFou3P2Mh3+KAy1f0/CWMRved58TGiVtv8cDqI+AhKA9ZTugMsFc1KhcImtmCSey2
	nXwwZsFK6TqgqbxJnM5Vfa49/Hf4lGhC4UNxk6/qcGqdJN7kDSaMDVUcuCTr1sLk1D7I+tKZuGK
	Qoh37/juUfZiWLmSLQ3GzaUAxldxO182X/v/audGMT08ATGnPUV1yGl/kE0hycv2qcegbLtg31W
	/g6U5mCn8JDHX5BX0W2stjomG4Pc8vMA0Ahz80v+BcohO6nuBzi0RMMC+8M1Dc9NYdIiozUUFyO
	135wkvbCDWzh9/ztlwK93uD7xCQH1hyBPpoNwKGMJy87j4O3xZLPYSIw4qgXvLuGZvcf1TxYKKm
	cazw/2CYY8sKwEIxDVWCLDDkbrXhUzvo7dsui422wrNfy2q8lcTZO/5uxyMqdmhtrPuWwBaBy7j
	Es3teyECMPE+jq0uy4tsWkiNwxQA2v3917Rwamr7ghUOiH1/Xkb8uHLGW3RvaqWZ/lKChKsJ5L8
	dWJ6wx/B4/lo2Ruy2u2i3t8QiHNHnDq92AfSEZz+2PF+LsiTygtzwEG4/urU06O/SadhWXiGJXt
	iGN05Pd9GnHL5h62cCNyOwElSV3cqW9TM59LuzwuDw1qf+Dp3riaPRpSZve9SWH8w/MfhB/+JMe
	ME1uShWEwcUZ3YMp8i1wUyip1g6Tvd9GKWeKQtDHiaQjBpQP4
X-Received: by 2002:a05:600c:1d0b:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4b6e0170a5cmr62501085e9.27.1793996185393;
        Fri, 06 Nov 2026 12:16:25 -0800 (PST)
Received: from DESKTOP-KHFMJSR ([194.9.62.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d609a3sm5849954f8f.7.2026.11.06.12.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:16:25 -0800 (PST)
From: clicedvly768 <harepro29@gmail.com>
To: ojeda@kernel.org,
	dmitry.torokhov@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-input@vger.kernel.org,
	clicedvly768 <harepro29@gmail.com>
Subject: [PATCH v2 1/2] rust: input: add input device abstractions
Date: Sat,  7 Nov 2026 01:14:28 +0500
Message-ID: <20261106201429.376997-2-harepro29@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106201429.376997-1-harepro29@gmail.com>
References: <20261106201429.376997-1-harepro29@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add safe Rust abstractions for Linux input devices (struct input_dev).

This provides:
- `AllocatedDevice`: a newly allocated, unregistered input device handle
  that allows configuring capabilities (keys, absolute axes limits, parent
  device) before registration.
- Safe string methods: `set_name` and `set_phys` accept `&'static CStr`
  to prevent use-after-free since the input core does not copy strings.
- Bounds-checked `set_abs_params` validating `axis < ABS_CNT` (0x40)
  to prevent memory corruption in `dev->absinfo`.
- `RegisteredDevice`: a registered input device handle providing safe,
  inlined methods to report keys, absolute coordinates, and synchronization
  events. Automatically calls `input_unregister_device` on drop (RAII).
- Constants for bus types (`bus::*`) and event types (`event_type::*`).
- Alphabetically sorted imports and module entries gated with
  `#[cfg(CONFIG_INPUT = "y")]` and `#if IS_REACHABLE(CONFIG_INPUT)`
  to avoid link failures when CONFIG_INPUT is disabled or modular.

Signed-off-by: clicedvly768 <harepro29@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/input.c            |  22 ++++
 rust/kernel/input.rs            | 214 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 5 files changed, 240 insertions(+)
 create mode 100644 rust/helpers/input.c
 create mode 100644 rust/kernel/input.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc7..4b09d3980e10 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -64,6 +64,7 @@
 #include <linux/fwctl.h>
 #include <linux/fs.h>
 #include <linux/i2c.h>
+#include <linux/input.h>
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
 #include <linux/ioport.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d62c7be1ca7b..77cec85ad153 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -67,6 +67,7 @@
 #include "fs.c"
 #include "fwctl.c"
 #include "gpu.c"
+#include "input.c"
 #include "interrupt.c"
 #include "io.c"
 #include "irq.c"
diff --git a/rust/helpers/input.c b/rust/helpers/input.c
new file mode 100644
index 000000000000..f43a06acfdc3
--- /dev/null
+++ b/rust/helpers/input.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/input.h>
+
+#if IS_REACHABLE(CONFIG_INPUT)
+
+__rust_helper void rust_helper_input_report_key(struct input_dev *dev, unsigned int code, int value)
+{
+	input_report_key(dev, code, value);
+}
+
+__rust_helper void rust_helper_input_report_abs(struct input_dev *dev, unsigned int code, int value)
+{
+	input_report_abs(dev, code, value);
+}
+
+__rust_helper void rust_helper_input_sync(struct input_dev *dev)
+{
+	input_sync(dev);
+}
+
+#endif /* IS_REACHABLE(CONFIG_INPUT) */
diff --git a/rust/kernel/input.rs b/rust/kernel/input.rs
new file mode 100644
index 000000000000..bef0c3a07da0
--- /dev/null
+++ b/rust/kernel/input.rs
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Input subsystem abstractions for safe Rust drivers.
+//!
+//! Provides a safe Rust object-oriented interface around Linux `struct input_dev`,
+//! ensuring safe allocation, capability configuration, registration, and RAII cleanup.
+
+use crate::{
+    bindings, device,
+    error::{
+        code::{EINVAL, ENOMEM},
+        Result,
+    },
+    prelude::*,
+    str::CStr,
+};
+use core::ptr::NonNull;
+
+/// Bus types for input devices.
+pub mod bus {
+    use super::*;
+
+    /// PCI bus.
+    pub const PCI: u16 = bindings::BUS_PCI as u16;
+    /// USB bus.
+    pub const USB: u16 = bindings::BUS_USB as u16;
+    /// RS232 serial bus.
+    pub const RS232: u16 = bindings::BUS_RS232 as u16;
+}
+
+/// Event types reported by input devices.
+pub mod event_type {
+    use super::*;
+
+    /// Key or button press/release events.
+    pub const KEY: u32 = bindings::EV_KEY;
+    /// Absolute axis movement events.
+    pub const ABS: u32 = bindings::EV_ABS;
+}
+
+/// An allocated input device being configured prior to registration.
+pub struct AllocatedDevice {
+    ptr: NonNull<bindings::input_dev>,
+}
+
+impl AllocatedDevice {
+    /// Allocates a new input device.
+    pub fn new() -> Result<Self> {
+        // SAFETY: `input_allocate_device` returns either a valid pointer or NULL.
+        let ptr = unsafe { bindings::input_allocate_device() };
+        let ptr = NonNull::new(ptr).ok_or(ENOMEM)?;
+
+        Ok(Self { ptr })
+    }
+
+    /// Sets the human-readable device name.
+    #[inline]
+    pub fn set_name(&mut self, name: &'static CStr) {
+        // SAFETY: `self.ptr` is valid and `name` has static lifetime.
+        unsafe {
+            (*self.ptr.as_ptr()).name = name.as_char_ptr().cast();
+        }
+    }
+
+    /// Sets the physical location string.
+    ///
+    /// The input core does not copy the string and requires it to remain valid
+    /// throughout the device's lifetime, so a static NUL-terminated C string is required.
+    #[inline]
+    pub fn set_phys(&mut self, phys: &'static CStr) {
+        // SAFETY: `self.ptr` is valid and `phys` has static lifetime.
+        unsafe {
+            (*self.ptr.as_ptr()).phys = phys.as_char_ptr().cast();
+        }
+    }
+
+    /// Sets device identifier (bus type, vendor, product, version).
+    #[inline]
+    pub fn set_id(&mut self, bustype: u16, vendor: u16, product: u16, version: u16) {
+        // SAFETY: `self.ptr` is valid.
+        unsafe {
+            let dev = self.ptr.as_ptr();
+            (*dev).id.bustype = bustype;
+            (*dev).id.vendor = vendor;
+            (*dev).id.product = product;
+            (*dev).id.version = version;
+        }
+    }
+
+    /// Sets the parent device for this input device.
+    #[inline]
+    pub fn set_parent(&mut self, parent: &device::Device) {
+        // SAFETY: `self.ptr` is valid, and `parent.as_raw()` returns a valid `struct device`.
+        unsafe {
+            (*self.ptr.as_ptr()).dev.parent = parent.as_raw();
+        }
+    }
+
+    /// Enables support for a capability (e.g. key or axis).
+    #[inline]
+    pub fn set_capability(&mut self, type_: u32, code: u32) {
+        // SAFETY: `self.ptr` is valid and type/code are valid capability values.
+        unsafe {
+            bindings::input_set_capability(self.ptr.as_ptr(), type_, code);
+        }
+    }
+
+    /// Sets parameter limits for an absolute axis.
+    ///
+    /// Bounds-checks `axis < ABS_CNT` (0x40) to prevent out-of-bounds writes
+    /// to the `absinfo` array in `struct input_dev`.
+    pub fn set_abs_params(
+        &mut self,
+        axis: u32,
+        min: i32,
+        max: i32,
+        fuzz: i32,
+        flat: i32,
+    ) -> Result {
+        if axis >= bindings::ABS_CNT {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `self.ptr` is valid and `axis` has been verified within bounds.
+        unsafe {
+            bindings::input_set_abs_params(self.ptr.as_ptr(), axis, min, max, fuzz, flat);
+        }
+        Ok(())
+    }
+
+    /// Registers the input device with the kernel input core.
+    ///
+    /// Consumes the `AllocatedDevice` and returns a [`RegisteredDevice`].
+    pub fn register(self) -> Result<RegisteredDevice> {
+        let ptr = self.ptr;
+        // Don't run the AllocatedDevice drop destructor, registration takes ownership.
+        core::mem::forget(self);
+
+        // SAFETY: `ptr` is valid and was allocated by `input_allocate_device`.
+        let ret = unsafe { bindings::input_register_device(ptr.as_ptr()) };
+        if ret != 0 {
+            // SAFETY: Free the allocated device if registration failed.
+            unsafe {
+                bindings::input_free_device(ptr.as_ptr());
+            }
+            return Err(crate::error::Error::from_errno(ret));
+        }
+
+        Ok(RegisteredDevice { ptr })
+    }
+}
+
+impl Drop for AllocatedDevice {
+    fn drop(&mut self) {
+        // SAFETY: `self.ptr` was allocated by `input_allocate_device` and has not been registered.
+        unsafe {
+            bindings::input_free_device(self.ptr.as_ptr());
+        }
+    }
+}
+
+// SAFETY: `AllocatedDevice` exclusively owns its `input_dev` pointer and can be transferred
+// across threads.
+unsafe impl Send for AllocatedDevice {}
+
+/// A registered input device capable of reporting events to userspace.
+pub struct RegisteredDevice {
+    ptr: NonNull<bindings::input_dev>,
+}
+
+impl RegisteredDevice {
+    /// Reports a binary button or key state event.
+    #[inline]
+    pub fn report_key(&self, code: u32, value: bool) {
+        // SAFETY: `self.ptr` is valid and registered with the input core.
+        unsafe {
+            bindings::input_report_key(self.ptr.as_ptr(), code, if value { 1 } else { 0 });
+        }
+    }
+
+    /// Reports an absolute axis position value.
+    #[inline]
+    pub fn report_abs(&self, code: u32, value: i32) {
+        // SAFETY: `self.ptr` is valid and registered with the input core.
+        unsafe {
+            bindings::input_report_abs(self.ptr.as_ptr(), code, value);
+        }
+    }
+
+    /// Flushes and synchronizes all reported events into a single input packet.
+    #[inline]
+    pub fn sync(&self) {
+        // SAFETY: `self.ptr` is valid and registered with the input core.
+        unsafe {
+            bindings::input_sync(self.ptr.as_ptr());
+        }
+    }
+}
+
+impl Drop for RegisteredDevice {
+    fn drop(&mut self) {
+        // SAFETY: `self.ptr` was successfully registered with `input_register_device`.
+        // Unregistering automatically unbinds and frees the device.
+        unsafe {
+            bindings::input_unregister_device(self.ptr.as_ptr());
+        }
+    }
+}
+
+// SAFETY: `RegisteredDevice` can be safely transferred across threads.
+unsafe impl Send for RegisteredDevice {}
+// SAFETY: Event reporting on `input_dev` is thread-safe (protected by internal locks in the
+// input core).
+unsafe impl Sync for RegisteredDevice {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1ab41129d557..ff5c978758d0 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -88,6 +88,8 @@
 #[doc(hidden)]
 pub mod impl_flags;
 pub mod init;
+#[cfg(CONFIG_INPUT = "y")]
+pub mod input;
 pub mod interop;
 pub mod interrupt;
 pub mod io;
-- 
2.56.0

