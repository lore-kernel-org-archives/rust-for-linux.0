Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259193DDDA2
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774295526; cv=none; b=O1QvCTpqMf3uw+2SEAEVqdHTwwJ2ILOGwgqwXvqyCZcVut1nv4s06Vv0zwQ2azJUIlFtOYUDSAW6nFzcXMyA9ZGLpNrbv5/Ue3gxkqUUNNdFYlTtpjFB82gEQQ/1zhZ3elE/ihCPq7BbkVM1pjwhL1BZDtvO/pSnUkKgg9243UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774295526; c=relaxed/simple;
	bh=tKw51w6DAtP6sT2Nw5qJcEgJiVYZChneAHfolCmNXBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfANtHR254aX88badwRmHpAKFgQAxbF6vmkedO4/Jt8c3P21LcW9cjDF4GoiNGrrVk5sRZJ4qXXSSqpy+lz+JuJLa46ZcjGcLotpAwKlPzpfNPKjkyhdDOPx2VcnNcewh+JrHaQHej7WR2it0LAZZ6RUhfxq5C5PJaD0WTUBQBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6hPGfln; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6hPGfln"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a278e0f7f6so641273e87.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295522; x=1774900322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKouc+qGgGKCL4jWF0ezEEdpSbdgPjSFLMiZGkwTb4k=;
        b=c6hPGflnFkCXNVLU/NEGMrxhFhe+eqMkVnUNbXTgWYl+LStTfgvFBtblwtiN0OWWHK
         Zh/fMlDVNksXkuMjFGejel2CPRIZctL0YqWKAg4bhaiLcNksAjZajOB6lhvFl27ebk0Z
         mdCGRQLU53XVy7aptBtMs4uAoDJc886qiSc5X7KSg+mZpFSirBeyz6qY9jY6UgQFnGWa
         VG9ZXGXEhZNCDC3nWeJNcJ6im7J/bInB2+uf0sO8L6xuJpGgrw5fTK0KeUDEfgAYaYrH
         WS2xulE4t9diIBb8uoSBGLuMILrQrnMjwIY/M+BKlVLPLFusIun+MzDqjHE3g1wfrDw/
         uNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295522; x=1774900322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKouc+qGgGKCL4jWF0ezEEdpSbdgPjSFLMiZGkwTb4k=;
        b=tWYN/fkVpjeCasfrz0ae24x89vJQ4gcKL2iF1a2R67treOLf7vENiq/gOCLitUTS/S
         NEV695V6LNEoH2EDm/WneJ/AsTvBZJIn/a2NbEXVweCcsksJpKnqX94cc+Xs838EH1JE
         u4Wg6mGfJnWZoVBwGPDPgtheEnDZtU7xrXLNR/Crqs00scW3MAQcK8X2HeAe3kxk9rl0
         YqMezaew5RpDEj1tS9qb9z0TjI/bbjvKbV39FpF2d+st/18ftdPtLOoPhNxSM4ZP8MHf
         PQhpj+/JCQz6cyUmJaG95DQyHCHGjLrCituoRJOXFrDMoS3oLooKB2BXQie4vQ6XvvTz
         5HVw==
X-Forwarded-Encrypted: i=1; AJvYcCWIlFfM0ua0v/+21vUqE9w8KyKuysc4N1iVDXvgZchC0FWW2E5XtuGFs0M3qCgU6K1TWSDBOcTik2A3PkUTQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmcTJJH+8ykOYyvz3zS4hnEbBXY+amJgMdnTb+TZr5xPHtZEem
	pPWs2WIiAXYNcGrVOvDBQI3Qc2xLBmlaP+8WSkXyp3JpU/IDcKRvhQxc
X-Gm-Gg: ATEYQzxvGCbTNbGnKh70CyZjwvjQQdAij8Jpnvc7uu7uipHo/C7KEYeCed+ggngN5i1
	Cy16BKsdHIOYI7jyCVA+BCYIlW0USOpqAzhOnHmfyhniqXuFrOVMSlN3knLbuypxrnpsMs1b5jo
	4wF46hgV5k4wUMIMIIgD9BUeHeKUs1aEAfsceI2USzePIxtW8cjjN6ufCeBqd/QDLFZ+V1Ckt2e
	BQH54EM2GZ/VQz0ytFwr8B9znjD3xFk1VAqPjpqochUcKWx4I5OZBT4uoP4j7R88YpJcXICZ0fx
	aU6fOlPD9/EW+Ok3lJMryIb43XjfHUwFCjutHbtCaWjwrMNlSkhg53Jlap3ygvwJ4sX28hZFokI
	tKgwtk81tso9woiTZ8YqwX89Gqv9xxXcCLvSo1rWwGpFs72Iyd5jrNV1LfYWflf0UJSZy2ljYXu
	d+hVDgnbZzTIz3c2HcNYaOXtJIGNX1SYAexisjgotV66q6+eWR9krg/OwJiA0LdVzAnKTIzlop7
	YejmUXO0Y8ufg80NQ==
X-Received: by 2002:a05:6512:3d0b:b0:5a1:d349:d23d with SMTP id 2adb3069b0e04-5a285b5d3d3mr4069730e87.38.1774295521875;
        Mon, 23 Mar 2026 12:52:01 -0700 (PDT)
Received: from localhost.localdomain (46-138-191-69.dynamic.spd-mgts.ru. [46.138.191.69])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28520734csm2753527e87.53.2026.03.23.12.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:52:01 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: linux-watchdog@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: wim@linux-watchdog.org,
	linux@roeck-us.net,
	ojeda@kernel.org,
	dakr@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	lossin@kernel.org
Subject: [PATCH 1/2] rust: watchdog: add watchdog device abstraction
Date: Mon, 23 Mar 2026 22:51:37 +0300
Message-ID: <20260323195138.5541-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Rust abstractions for the Linux watchdog subsystem, enabling
watchdog drivers to be written in Rust.

The abstraction follows the pattern established by the PHY driver
abstraction (rust/kernel/net/phy.rs):

  - A `Device` wrapper around `struct watchdog_device` providing safe
    accessors for timeout, pretimeout, and status fields.

  - A `#[vtable] WatchdogOps` trait where `start()` is mandatory and
    `stop()`, `ping()`, `set_timeout()`, `set_pretimeout()`, and
    `get_timeleft()` are optional.

  - An `Adapter` struct with `unsafe extern "C" fn` callbacks that
    bridge the C watchdog core to Rust trait methods.

  - A `create_watchdog_ops()` const function that populates the C
    `watchdog_ops` struct at compile time.

  - A `Registration` type that heap-allocates the `watchdog_device`
    via `KBox` to ensure pointer stability (the C core stores
    back-pointers into the device struct), and wraps
    `watchdog_register_device` / `watchdog_unregister_device` with
    RAII semantics.

The `Registration::register` method takes a `&'static ThisModule`
parameter to set the `owner` field in `watchdog_ops`, ensuring
correct module reference counting when userspace opens /dev/watchdog.

Also add C helper functions for inline watchdog functions that bindgen
cannot handle and include `linux/watchdog.h` in the bindings header.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/watchdog.c         |  38 ++++
 rust/kernel/lib.rs              |   2 +
 rust/kernel/watchdog.rs         | 348 ++++++++++++++++++++++++++++++++
 5 files changed, 390 insertions(+)
 create mode 100644 rust/helpers/watchdog.c
 create mode 100644 rust/kernel/watchdog.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b422..df53d03846808 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -84,6 +84,7 @@
 #include <linux/tracepoint.h>
 #include <linux/usb.h>
 #include <linux/wait.h>
+#include <linux/watchdog.h>
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
 #include <trace/events/rust_sample.h>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c4..e53e9977fd3e7 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -60,5 +60,6 @@
 #include "usb.c"
 #include "vmalloc.c"
 #include "wait.c"
+#include "watchdog.c"
 #include "workqueue.c"
 #include "xarray.c"
diff --git a/rust/helpers/watchdog.c b/rust/helpers/watchdog.c
new file mode 100644
index 0000000000000..175cebbeb1b36
--- /dev/null
+++ b/rust/helpers/watchdog.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/watchdog.h>
+
+bool rust_helper_watchdog_active(struct watchdog_device *wdd)
+{
+	return watchdog_active(wdd);
+}
+
+bool rust_helper_watchdog_hw_running(struct watchdog_device *wdd)
+{
+	return watchdog_hw_running(wdd);
+}
+
+void rust_helper_watchdog_set_nowayout(struct watchdog_device *wdd, bool nowayout)
+{
+	watchdog_set_nowayout(wdd, nowayout);
+}
+
+void rust_helper_watchdog_stop_on_reboot(struct watchdog_device *wdd)
+{
+	watchdog_stop_on_reboot(wdd);
+}
+
+void rust_helper_watchdog_stop_on_unregister(struct watchdog_device *wdd)
+{
+	watchdog_stop_on_unregister(wdd);
+}
+
+void rust_helper_watchdog_set_drvdata(struct watchdog_device *wdd, void *data)
+{
+	watchdog_set_drvdata(wdd, data);
+}
+
+void *rust_helper_watchdog_get_drvdata(struct watchdog_device *wdd)
+{
+	return watchdog_get_drvdata(wdd);
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf1200428..e65b8bd721978 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -149,6 +149,8 @@
 pub mod transmute;
 pub mod types;
 pub mod uaccess;
+#[cfg(CONFIG_WATCHDOG)]
+pub mod watchdog;
 #[cfg(CONFIG_USB = "y")]
 pub mod usb;
 pub mod workqueue;
diff --git a/rust/kernel/watchdog.rs b/rust/kernel/watchdog.rs
new file mode 100644
index 0000000000000..e65438f004109
--- /dev/null
+++ b/rust/kernel/watchdog.rs
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Watchdog device support.
+//!
+//! C headers: [`include/linux/watchdog.h`](srctree/include/linux/watchdog.h).
+
+use crate::{bindings, device, error::*, prelude::*, types::Opaque};
+use core::marker::PhantomData;
+
+/// A watchdog device.
+///
+/// Wraps the kernel's [`struct watchdog_device`].
+///
+/// # Invariants
+///
+/// The pointer is valid and the watchdog core serialises access to the device
+/// during callback execution.
+///
+/// [`struct watchdog_device`]: srctree/include/linux/watchdog.h
+#[repr(transparent)]
+pub struct Device(Opaque<bindings::watchdog_device>);
+
+impl Device {
+    /// Creates a new [`Device`] reference from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must point at a valid `watchdog_device`.
+    /// - The caller must be in a callback context where the watchdog core
+    ///   serialises access.
+    /// - The returned reference must not outlive the callback invocation.
+    unsafe fn from_raw<'a>(ptr: *mut bindings::watchdog_device) -> &'a mut Self {
+        // CAST: `Self` is a `repr(transparent)` wrapper around `bindings::watchdog_device`.
+        let ptr = ptr.cast::<Self>();
+        // SAFETY: By the function requirements the pointer is valid and we have
+        // exclusive access for the duration of the callback.
+        unsafe { &mut *ptr }
+    }
+
+    /// Returns a raw pointer to the underlying `watchdog_device`.
+    fn as_raw(&self) -> *mut bindings::watchdog_device {
+        self.0.get()
+    }
+
+    /// Returns the current timeout in seconds.
+    pub fn timeout(&self) -> u32 {
+        // SAFETY: The struct invariant ensures we may access this field.
+        unsafe { (*self.as_raw()).timeout }
+    }
+
+    /// Sets the current timeout in seconds.
+    pub fn set_timeout(&mut self, timeout: u32) {
+        // SAFETY: The struct invariant ensures exclusive access.
+        unsafe { (*self.as_raw()).timeout = timeout };
+    }
+
+    /// Returns the current pretimeout in seconds.
+    pub fn pretimeout(&self) -> u32 {
+        // SAFETY: The struct invariant ensures we may access this field.
+        unsafe { (*self.as_raw()).pretimeout }
+    }
+
+    /// Returns the minimum timeout in seconds.
+    pub fn min_timeout(&self) -> u32 {
+        // SAFETY: The struct invariant ensures we may access this field.
+        unsafe { (*self.as_raw()).min_timeout }
+    }
+
+    /// Returns the maximum timeout in seconds.
+    pub fn max_timeout(&self) -> u32 {
+        // SAFETY: The struct invariant ensures we may access this field.
+        unsafe { (*self.as_raw()).max_timeout }
+    }
+
+    /// Returns `true` if the watchdog is active.
+    pub fn is_active(&self) -> bool {
+        // SAFETY: The struct invariant ensures the pointer is valid.
+        unsafe { bindings::watchdog_active(self.as_raw()) }
+    }
+
+    /// Returns `true` if the hardware watchdog is running.
+    pub fn is_hw_running(&self) -> bool {
+        // SAFETY: The struct invariant ensures the pointer is valid.
+        unsafe { bindings::watchdog_hw_running(self.as_raw()) }
+    }
+}
+
+/// An adapter for the registration of a watchdog driver.
+struct Adapter<T: WatchdogOps> {
+    _p: PhantomData<T>,
+}
+
+impl<T: WatchdogOps> Adapter<T> {
+    /// # Safety
+    ///
+    /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
+    unsafe extern "C" fn start_callback(
+        wdd: *mut bindings::watchdog_device,
+    ) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The watchdog core serialises access to the device.
+            let dev = unsafe { Device::from_raw(wdd) };
+            T::start(dev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
+    unsafe extern "C" fn stop_callback(
+        wdd: *mut bindings::watchdog_device,
+    ) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The watchdog core serialises access to the device.
+            let dev = unsafe { Device::from_raw(wdd) };
+            T::stop(dev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
+    unsafe extern "C" fn ping_callback(
+        wdd: *mut bindings::watchdog_device,
+    ) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The watchdog core serialises access to the device.
+            let dev = unsafe { Device::from_raw(wdd) };
+            T::ping(dev)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
+    unsafe extern "C" fn set_timeout_callback(
+        wdd: *mut bindings::watchdog_device,
+        timeout: core::ffi::c_uint,
+    ) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The watchdog core serialises access to the device.
+            let dev = unsafe { Device::from_raw(wdd) };
+            T::set_timeout(dev, timeout)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
+    unsafe extern "C" fn set_pretimeout_callback(
+        wdd: *mut bindings::watchdog_device,
+        pretimeout: core::ffi::c_uint,
+    ) -> core::ffi::c_int {
+        from_result(|| {
+            // SAFETY: The watchdog core serialises access to the device.
+            let dev = unsafe { Device::from_raw(wdd) };
+            T::set_pretimeout(dev, pretimeout)?;
+            Ok(0)
+        })
+    }
+
+    /// # Safety
+    ///
+    /// `wdd` must be passed by the corresponding callback in `watchdog_ops`.
+    unsafe extern "C" fn get_timeleft_callback(
+        wdd: *mut bindings::watchdog_device,
+    ) -> core::ffi::c_uint {
+        // SAFETY: The watchdog core serialises access to the device.
+        // We create a shared reference since get_timeleft only needs &Device.
+        let dev = unsafe { &*(wdd.cast::<Device>()) };
+        T::get_timeleft(dev)
+    }
+}
+
+/// Watchdog device operations.
+///
+/// Implement this trait to provide the callbacks for a watchdog device.
+/// Only [`WatchdogOps::start`] is mandatory; all other operations are optional.
+#[vtable]
+pub trait WatchdogOps {
+    /// Starts the watchdog device.
+    ///
+    /// This is the only mandatory operation.
+    fn start(dev: &mut Device) -> Result;
+
+    /// Stops the watchdog device.
+    fn stop(_dev: &mut Device) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Sends a keepalive ping to the watchdog device.
+    fn ping(_dev: &mut Device) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Sets the watchdog timeout in seconds.
+    fn set_timeout(_dev: &mut Device, _timeout: u32) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Sets the watchdog pretimeout in seconds.
+    fn set_pretimeout(_dev: &mut Device, _pretimeout: u32) -> Result {
+        build_error!(VTABLE_DEFAULT_ERROR)
+    }
+
+    /// Returns the time left before the watchdog fires (in seconds).
+    fn get_timeleft(_dev: &Device) -> u32 {
+        0
+    }
+}
+
+/// Creates a [`bindings::watchdog_ops`] instance from [`WatchdogOps`].
+///
+/// This populates the C ops struct at compile time based on which trait
+/// methods are implemented. The `owner` field must be set separately by
+/// the caller before registration.
+pub const fn create_watchdog_ops<T: WatchdogOps>() -> bindings::watchdog_ops {
+    bindings::watchdog_ops {
+        owner: core::ptr::null_mut(),
+        start: Some(Adapter::<T>::start_callback),
+        stop: if T::HAS_STOP {
+            Some(Adapter::<T>::stop_callback)
+        } else {
+            None
+        },
+        ping: if T::HAS_PING {
+            Some(Adapter::<T>::ping_callback)
+        } else {
+            None
+        },
+        status: None,
+        set_timeout: if T::HAS_SET_TIMEOUT {
+            Some(Adapter::<T>::set_timeout_callback)
+        } else {
+            None
+        },
+        set_pretimeout: if T::HAS_SET_PRETIMEOUT {
+            Some(Adapter::<T>::set_pretimeout_callback)
+        } else {
+            None
+        },
+        get_timeleft: if T::HAS_GET_TIMELEFT {
+            Some(Adapter::<T>::get_timeleft_callback)
+        } else {
+            None
+        },
+        restart: None,
+        ioctl: None,
+    }
+}
+
+/// Watchdog device registration.
+///
+/// Registers a watchdog device with the kernel. The device will be
+/// unregistered when this instance is dropped.
+///
+/// The [`watchdog_device`] is heap-allocated to ensure a stable address,
+/// since the watchdog core stores pointers back into it.
+///
+/// # Invariants
+///
+/// `inner` points to a heap-allocated `watchdog_device` that is registered
+/// with the watchdog core via `watchdog_register_device`.
+///
+/// [`watchdog_device`]: srctree/include/linux/watchdog.h
+pub struct Registration {
+    inner: KBox<Opaque<bindings::watchdog_device>>,
+}
+
+// SAFETY: `watchdog_unregister_device` can be called from any context.
+// The `KBox` ensures the `watchdog_device` has a stable heap address that
+// remains valid regardless of where the `Registration` is moved.
+unsafe impl Send for Registration {}
+
+// SAFETY: The only method that returns a reference to the device (`device()`)
+// returns `&Device` (shared reference), which only exposes read-only accessors.
+// The watchdog core serialises access during callbacks.
+unsafe impl Sync for Registration {}
+
+impl Registration {
+    /// Creates and registers a new watchdog device.
+    ///
+    /// The `module` parameter is used to set the `owner` field in the
+    /// watchdog ops, ensuring correct module reference counting when
+    /// userspace opens `/dev/watchdog`.
+    pub fn register(
+        module: &'static crate::ThisModule,
+        parent: Option<&device::Device>,
+        info: &'static bindings::watchdog_info,
+        ops: &'static mut bindings::watchdog_ops,
+        timeout: u32,
+        min_timeout: u32,
+        max_timeout: u32,
+        nowayout: bool,
+    ) -> Result<Self> {
+        // Set the module owner so the kernel holds a reference to our
+        // module while /dev/watchdog is open.
+        ops.owner = module.as_ptr();
+
+        let mut wdd: bindings::watchdog_device =
+            // SAFETY: Zeroing out `watchdog_device` is valid since all fields
+            // are simple types (integers, pointers) that can be zero-initialised.
+            unsafe { core::mem::MaybeUninit::zeroed().assume_init() };
+
+        wdd.info = info;
+        wdd.ops = ops;
+        wdd.timeout = timeout;
+        wdd.min_timeout = min_timeout;
+        wdd.max_timeout = max_timeout;
+        wdd.parent = if let Some(p) = parent {
+            p.as_raw()
+        } else {
+            core::ptr::null_mut()
+        };
+
+        // SAFETY: The watchdog_device is fully initialised.
+        unsafe { bindings::watchdog_set_nowayout(&mut wdd, nowayout) };
+        // SAFETY: The watchdog_device is fully initialised.
+        unsafe { bindings::watchdog_stop_on_reboot(&mut wdd) };
+
+        // Heap-allocate the watchdog_device so that the C core's back-pointers
+        // remain valid even if this Registration is moved.
+        let inner = KBox::new(Opaque::new(wdd), GFP_KERNEL)?;
+
+        // SAFETY: `inner` points to a properly initialised watchdog_device on
+        // the heap. The pointer will remain stable for the lifetime of the KBox.
+        to_result(unsafe { bindings::watchdog_register_device(inner.get()) })?;
+
+        Ok(Registration { inner })
+    }
+
+    /// Returns a reference to the underlying [`Device`].
+    pub fn device(&self) -> &Device {
+        // SAFETY: `inner` points to a valid `watchdog_device`.
+        unsafe { &*(self.inner.get() as *const Device) }
+    }
+}
+
+impl Drop for Registration {
+    fn drop(&mut self) {
+        // SAFETY: The type invariant guarantees that `self.inner` is registered.
+        unsafe { bindings::watchdog_unregister_device(self.inner.get()) };
+    }
+}
-- 
2.43.0

