Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929F64C97
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765293409; cv=none; b=RnDtPoa4qNKas3oe2Op26fnJnjMJcIIfdrRga8tdtzjKAAbrEHkoEXDaw/vpTARXq3IvQJU5XTiVtz9lQFlyy4pIPgPow5PSAAwg1BPd4g0kXA129jxWXoavys/obCHsfj77f0ZTGqSSe/OG39NnKlomPpDPlyLvyFUjMk9HT44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765293409; c=relaxed/simple;
	bh=h6G1NpmxsgR4NkEUP0YEKZwiYKQvUpAhohWXWaw4rmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KfLNbQDW0ZhGmkZJo1Boz5QrYw26C8okTka55fgXqxo1YZS4/GJF0Lk6SlFkxA5Bl0Ou4VHm/e98jFv3PQoBXwC2lQ59DxO+HQGFdZOs30WyHj6lu+FxQfs0CQCbha1IKjPZNTIToIHWZrTo4yoWSG5Q0062bcbWmfNLCyn2Wv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aab7623f42so6830179b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 07:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293404; x=1765898204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9mRfKTMVlbDVXIDHBqOfCP83HCO81gjwPUuUfeq1Vo=;
        b=CDjQY/As7f5PpTApP0NBnIZON/m4GnjihJExAOM6Kniv3Jrmx9vFPj++0raeVXynyf
         +qsqjo6NRgvd7hEY97eQZvzlG1CSHnHbi0kxBqg3QJnzUp0ZI+p/XHVzHl+jM6Jze6oI
         ehRTSPrFHtF5h07HpWvaerVKmBIjS0YYQ/usrRnaAzA+VhLz//TYD2T8DmPnXkzS+clt
         2EKy5ATMKeQ9diqMFlsCW7I7X5YABooaj8Gj0djGFg8cTH71G2pc0xDspLBgHoO2XCkj
         D61rsbRAalkFcQDtP6G3t4ehl3QYAt/vqBpSeKKfmUmHaNgBxvdPxmvcvhSs9/yg8IyM
         cRnA==
X-Gm-Message-State: AOJu0Yx8IX97Nf0aOCK9mEDk3F6Q9+668a6Mmk08AeIv8YhvqcVBx+eX
	2aY+AXIQ+DnUj7hecFa/7xuyoHb+tEcBU1K7ZzbqO/asap6PFLrk/RX6
X-Gm-Gg: ASbGncsaGXnFuI7XLbHlg2B7+7jUwg0isqIm/1DB3U7udu0h+pRobXJSxxMz4/4uQn7
	6bStJF/NdV31bqj3lkzDr5doZ2+y3N0VC1rNXbCH5WGgadMwPeA6NZ7bkUhzJmj/gMiyntvrDrv
	FkQzS2qFSAasGaJA6KLkRHRGmTFwn1w1i/21yNRXDfxjKAQub1uEPSSN+P+0lFmDkPL1FkNBCWh
	TEqT9sLK3vXUFy9GwZ77sADV6bFZwfYod7GgmfyN1W/rfyz+YjdXa3mqyPs3GC3J84igneuSAhT
	MJWzCjzktmOwhYBSTh7k5AlfpdugyAXQJgMOnM9PhusrMjXCvqtT2P04zDHJ0roLhkPvIl+D1kk
	ftfdjzuhOyHs0e33B1DP9NCXxMjBvf8n8bbdA95QEl4m7j2pFaTuASw0Ym+lN1Qfqp046TAAAUm
	sbcsJwUM9yEnhQCwhB4v3MiQ==
X-Google-Smtp-Source: AGHT+IFTK6cUAIYCGwJZ7h1LPglLtdKV1U9k/R0qCIsu+IczhQX9fdijz5SSnNOiX8X6Gqpzyaio6w==
X-Received: by 2002:a05:6a00:1483:b0:7e8:4433:8fb2 with SMTP id d2e1a72fcca58-7e8c6ba9411mr9852064b3a.58.1765293403465;
        Tue, 09 Dec 2025 07:16:43 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2aedb474fsm16538952b3a.52.2025.12.09.07.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:16:42 -0800 (PST)
From: Ke Sun <sunke@kylinos.cn>
To: ojeda@kernel.org,
	linux@armlinux.org.uk
Cc: rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH 1/2] rust: amba: add AMBA bus abstractions
Date: Tue,  9 Dec 2025 23:16:15 +0800
Message-ID: <20251209151616.2491085-2-sunke@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209151616.2491085-1-sunke@kylinos.cn>
References: <20251209151616.2491085-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic abstractions for AMBA (Advanced Microcontroller Bus Architecture)
bus support, including:

* rust/bindings/bindings_helper.h - Add AMBA bus header for bindings generation
* rust/kernel/lib.rs - Export amba module with CONFIG_ARM_AMBA conditional compilation
* rust/kernel/amba.rs - Complete AMBA bus abstraction implementation:
  - amba::DeviceId - RawDeviceIdIndex implementation for AMBA device IDs
    with const constructors using core::mem::zeroed() for static allocation
  - amba::Device - Safe wrapper around struct amba_device providing access
    to AMBA device operations, including resource and IRQ management
  - amba::Adapter - Implements driver::RegistrationOps to hook into the
    generic driver::Registration machinery
  - amba::Driver - Trait that drivers must implement, including probe
  - amba_device_table! - Macro to create AMBA IdTable with modpost alias
  - module_amba_driver! - Macro to declare AMBA driver modules

The implementation follows the same patterns as i2c.rs and platform.rs.

Signed-off-by: Ke Sun <sunke@kylinos.cn>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/amba.rs             | 445 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 3 files changed, 448 insertions(+)
 create mode 100644 rust/kernel/amba.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b422..fa697287cf71b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
+#include <linux/amba/bus.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/rust/kernel/amba.rs b/rust/kernel/amba.rs
new file mode 100644
index 0000000000000..05f35838738b8
--- /dev/null
+++ b/rust/kernel/amba.rs
@@ -0,0 +1,445 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! ARM AMBA bus abstractions.
+//!
+//! C header: [`include/linux/amba/bus.h`](srctree/include/linux/amba/bus.h)
+
+use crate::{
+    acpi, bindings, device,
+    device_id::{RawDeviceId, RawDeviceIdIndex},
+    driver,
+    error::{from_result, to_result, Error, Result},
+    io::{mem::IoRequest, resource::Resource},
+    irq::{self, IrqRequest},
+    of,
+    prelude::*,
+    str::CStr,
+    sync::aref::AlwaysRefCounted,
+    types::Opaque,
+    ThisModule,
+};
+use core::{
+    marker::PhantomData,
+    ptr::{addr_of_mut, NonNull},
+};
+use pin_init::PinInit;
+
+/// IdTable type for AMBA drivers.
+pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
+
+/// An AMBA device id.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct DeviceId(pub(crate) bindings::amba_id);
+
+// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `amba_id` and does not add
+// additional invariants, so it's safe to transmute to `RawType`.
+unsafe impl RawDeviceId for DeviceId {
+    type RawType = bindings::amba_id;
+}
+
+// SAFETY: `DRIVER_DATA_OFFSET` is the offset to the `data` field.
+unsafe impl RawDeviceIdIndex for DeviceId {
+    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::amba_id, data);
+
+    fn index(&self) -> usize {
+        self.0.data as usize
+    }
+}
+
+impl DeviceId {
+    /// Create a new device id from an AMBA device ID and mask.
+    ///
+    /// # Arguments
+    ///
+    /// * `id` - The significant bits of the hardware device ID
+    /// * `mask` - Bitmask specifying which bits of the id field are significant when matching.
+    ///   A driver binds to a device when `(hardware_device_id & mask) == id`.
+    #[inline(always)]
+    pub const fn new(id: u32, mask: u32) -> Self {
+        // Replace with `bindings::amba_id::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut amba: bindings::amba_id = unsafe { core::mem::zeroed() };
+        amba.id = id;
+        amba.mask = mask;
+        amba.data = core::ptr::null_mut();
+
+        Self(amba)
+    }
+
+    /// Create a new device id with driver data.
+    ///
+    /// # Arguments
+    ///
+    /// * `id` - The significant bits of the hardware device ID
+    /// * `mask` - Bitmask specifying which bits of the id field are significant when matching
+    /// * `data` - Private data used by the driver (typically a pointer to driver-specific data)
+    #[inline(always)]
+    pub const fn new_with_data(id: u32, mask: u32, data: usize) -> Self {
+        // Replace with `bindings::amba_id::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut amba: bindings::amba_id = unsafe { core::mem::zeroed() };
+        amba.id = id;
+        amba.mask = mask;
+        amba.data = data as *mut core::ffi::c_void;
+
+        Self(amba)
+    }
+
+    /// Get the device ID.
+    #[inline(always)]
+    pub const fn id(&self) -> u32 {
+        self.0.id
+    }
+
+    /// Get the mask.
+    #[inline(always)]
+    pub const fn mask(&self) -> u32 {
+        self.0.mask
+    }
+}
+
+/// Create an AMBA `IdTable` with an "alias" for modpost.
+#[macro_export]
+macro_rules! amba_device_table {
+    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
+        const $table_name: $crate::device_id::IdArray<
+            $crate::amba::DeviceId,
+            $id_info_type,
+            { $table_data.len() },
+        > = $crate::device_id::IdArray::new($table_data);
+
+        $crate::module_device_table!("amba", $module_table_name, $table_name);
+    };
+}
+
+/// An adapter for the registration of AMBA drivers.
+pub struct Adapter<T: Driver>(T);
+
+// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// a preceding call to `register` has been successful.
+unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
+    type RegType = bindings::amba_driver;
+
+    unsafe fn register(
+        adrv: &Opaque<Self::RegType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
+        let amba_table = match T::AMBA_ID_TABLE {
+            Some(table) => table.as_ptr(),
+            None => core::ptr::null(),
+        };
+
+        // SAFETY: It's safe to set the fields of `struct amba_driver` on initialization.
+        unsafe {
+            (*adrv.get()).drv.name = name.as_char_ptr();
+            (*adrv.get()).probe = Some(Self::probe_callback);
+            (*adrv.get()).remove = Some(Self::remove_callback);
+            (*adrv.get()).shutdown = Some(Self::shutdown_callback);
+            (*adrv.get()).id_table = amba_table;
+        }
+
+        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
+        to_result(unsafe { bindings::__amba_driver_register(adrv.get(), module.0) })
+    }
+
+    unsafe fn unregister(adrv: &Opaque<Self::RegType>) {
+        // SAFETY: `adrv` is guaranteed to be a valid `RegType`.
+        unsafe { bindings::amba_driver_unregister(adrv.get()) };
+    }
+}
+
+impl<T: Driver + 'static> Adapter<T> {
+    extern "C" fn probe_callback(
+        adev: *mut bindings::amba_device,
+        id: *const bindings::amba_id,
+    ) -> kernel::ffi::c_int {
+        // SAFETY: The AMBA bus only ever calls the probe callback with a valid pointer to a
+        // `struct amba_device`.
+        //
+        // INVARIANT: `adev` is valid for the duration of `probe_callback()`.
+        let adev = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
+        let info = Self::amba_id_info(adev, id);
+
+        from_result(|| {
+            let data = T::probe(adev, info);
+
+            adev.as_ref().set_drvdata(data)?;
+            Ok(0)
+        })
+    }
+
+    extern "C" fn remove_callback(adev: *mut bindings::amba_device) {
+        // SAFETY: The AMBA bus only ever calls the remove callback with a valid pointer to a
+        // `struct amba_device`.
+        //
+        // INVARIANT: `adev` is valid for the duration of `remove_callback()`.
+        let adev = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
+
+        // SAFETY: `remove_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
+        // and stored a `Pin<KBox<T>>`.
+        let data = unsafe { adev.as_ref().drvdata_obtain::<T>() };
+
+        T::unbind(adev, data.as_ref());
+    }
+
+    extern "C" fn shutdown_callback(adev: *mut bindings::amba_device) {
+        // SAFETY: `shutdown_callback` is only ever called for a valid `adev`
+        let adev = unsafe { &*adev.cast::<Device<device::CoreInternal>>() };
+
+        // SAFETY: `shutdown_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
+        // and stored a `Pin<KBox<T>>`.
+        let data = unsafe { adev.as_ref().drvdata_obtain::<T>() };
+
+        T::shutdown(adev, data.as_ref());
+    }
+
+    /// The [`amba::IdTable`] of the corresponding driver.
+    fn amba_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdInfo>> {
+        T::AMBA_ID_TABLE
+    }
+
+    /// Returns the driver's private data from the matching entry in the [`amba::IdTable`], if any.
+    ///
+    /// If this returns `None`, it means there is no match with an entry in the [`amba::IdTable`].
+    fn amba_id_info(
+        _dev: &Device,
+        id: *const bindings::amba_id,
+    ) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
+        if id.is_null() {
+            return None;
+        }
+
+        let table = Self::amba_id_table()?;
+
+        // SAFETY: `id` is a valid pointer to a `struct amba_id` that was matched by the kernel.
+        // `DeviceId` is a `#[repr(transparent)]` wrapper of `struct amba_id` and does not add
+        // additional invariants, so it's safe to transmute.
+        let device_id = unsafe { &*id.cast::<DeviceId>() };
+
+        Some(table.info(<DeviceId as RawDeviceIdIndex>::index(device_id)))
+    }
+}
+
+impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
+    type IdInfo = T::IdInfo;
+
+    fn acpi_id_table() -> Option<acpi::IdTable<Self::IdInfo>> {
+        None
+    }
+
+    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
+        None
+    }
+}
+
+/// Declares a kernel module that exposes a single AMBA driver.
+///
+/// # Examples
+///
+/// ```ignore
+/// kernel::module_amba_driver! {
+///     type: MyDriver,
+///     name: "Module name",
+///     authors: ["Author name"],
+///     description: "Description",
+///     license: "GPL v2",
+/// }
+/// ```
+#[macro_export]
+macro_rules! module_amba_driver {
+    ($($f:tt)*) => {
+        $crate::module_driver!(<T>, $crate::amba::Adapter<T>, { $($f)* });
+    };
+}
+
+/// The AMBA driver trait.
+///
+/// Drivers must implement this trait in order to get an AMBA driver registered.
+///
+/// # Examples
+///
+///```
+/// # use kernel::{bindings, c_str, device::Core, amba};
+///
+/// struct MyDriver;
+///
+/// kernel::amba_device_table!(
+///     AMBA_TABLE,
+///     MODULE_AMBA_TABLE,
+///     <MyDriver as amba::Driver>::IdInfo,
+///     [
+///         (amba::DeviceId::new(0x00041031, 0x000fffff), ())
+///     ]
+/// );
+///
+/// impl amba::Driver for MyDriver {
+///     type IdInfo = ();
+///     const AMBA_ID_TABLE: Option<amba::IdTable<Self::IdInfo>> = Some(&AMBA_TABLE);
+///
+///     fn probe(
+///         _adev: &amba::Device<Core>,
+///         _id_info: Option<&Self::IdInfo>,
+///     ) -> impl PinInit<Self, Error> {
+///         Err(ENODEV)
+///     }
+/// }
+///```
+pub trait Driver: Send {
+    /// The type holding information about each device id supported by the driver.
+    type IdInfo: 'static;
+
+    /// The table of device ids supported by the driver.
+    const AMBA_ID_TABLE: Option<IdTable<Self::IdInfo>> = None;
+
+    /// AMBA driver probe.
+    ///
+    /// Called when a new AMBA device is added or discovered.
+    /// Implementers should attempt to initialize the device here.
+    fn probe(
+        dev: &Device<device::Core>,
+        id_info: Option<&Self::IdInfo>,
+    ) -> impl PinInit<Self, Error>;
+
+    /// AMBA driver shutdown.
+    ///
+    /// Called by the kernel during system reboot or power-off to allow the [`Driver`] to bring the
+    /// [`Device`] into a safe state. Implementing this callback is optional.
+    ///
+    /// Typical actions include stopping transfers, disabling interrupts, or resetting the hardware
+    /// to prevent undesired behavior during shutdown.
+    ///
+    /// This callback is distinct from final resource cleanup, as the driver instance remains valid
+    /// after it returns. Any deallocation or teardown of driver-owned resources should instead be
+    /// handled in `Self::drop`.
+    fn shutdown(dev: &Device<device::Core>, this: Pin<&Self>) {
+        let _ = (dev, this);
+    }
+
+    /// AMBA driver unbind.
+    ///
+    /// Called when the [`Device`] is unbound from its bound [`Driver`]. Implementing this
+    /// callback is optional.
+    ///
+    /// This callback serves as a place for drivers to perform teardown operations that require a
+    /// `&Device<Core>` or `&Device<Bound>` reference. For instance, drivers may try to perform I/O
+    /// operations to gracefully tear down the device.
+    ///
+    /// Otherwise, release operations for driver resources should be performed in `Self::drop`.
+    fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
+        let _ = (dev, this);
+    }
+}
+
+/// An AMBA device.
+///
+/// This is a wrapper around the C `struct amba_device` that provides safe access
+/// to AMBA device operations.
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(
+    Opaque<bindings::amba_device>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> Device<Ctx> {
+    /// Get the raw pointer to the underlying amba_device.
+    pub fn as_raw(&self) -> *mut bindings::amba_device {
+        self.0.get()
+    }
+
+    /// Returns the memory resource (AMBA devices have a single memory resource).
+    pub fn resource(&self) -> Option<&Resource> {
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct amba_device`.
+        let resource = unsafe { addr_of_mut!((*self.as_raw()).res) };
+        // SAFETY: `resource` is a valid pointer to a `struct resource`.
+        Some(unsafe { Resource::from_raw(resource) })
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
+        // `struct amba_device`.
+        let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
+
+        // SAFETY: `dev` points to a valid `struct device`.
+        unsafe { device::Device::from_raw(dev) }
+    }
+}
+
+impl Device<device::Bound> {
+    /// Returns an `IoRequest` for the memory resource.
+    pub fn io_request(&self) -> Option<IoRequest<'_>> {
+        self.resource()
+            // SAFETY: `resource` is a valid resource for `&self` during the
+            // lifetime of the `IoRequest`.
+            .map(|resource| unsafe { IoRequest::new(self.as_ref(), resource) })
+    }
+
+    /// Returns an [`IrqRequest`] for the IRQ at the given index, if any.
+    pub fn irq_by_index(&self, index: u32) -> Result<IrqRequest<'_>> {
+        if index >= bindings::AMBA_NR_IRQS {
+            return Err(crate::error::code::EINVAL);
+        }
+
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct amba_device`.
+        let irq = unsafe { (*self.as_raw()).irq[index as usize] };
+
+        if irq == 0 {
+            return Err(crate::error::code::ENXIO);
+        }
+
+        // SAFETY: `irq` is guaranteed to be a valid IRQ number for `&self`.
+        Ok(unsafe { IrqRequest::new(self.as_ref(), irq) })
+    }
+
+    /// Returns a [`irq::Registration`] for the IRQ at the given index.
+    pub fn request_irq_by_index<'a, T: irq::Handler + 'static>(
+        &'a self,
+        flags: irq::Flags,
+        index: u32,
+        name: &'static CStr,
+        handler: impl PinInit<T, Error> + 'a,
+    ) -> Result<impl PinInit<irq::Registration<T>, Error> + 'a> {
+        let request = self.irq_by_index(index)?;
+
+        Ok(irq::Registration::<T>::new(request, flags, name, handler))
+    }
+}
+
+impl crate::dma::Device for Device<device::Core> {}
+
+// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s
+// generic argument.
+kernel::impl_device_context_deref!(unsafe { Device });
+kernel::impl_device_context_into_aref!(Device);
+
+// SAFETY: Instances of `Device` are always reference-counted.
+// AMBA devices use the underlying `device` reference counting mechanism.
+unsafe impl AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        // amba_device_put calls put_device on the underlying device, which properly
+        // decrements the reference count.
+        // We use put_device directly since amba_device_put is just a wrapper around it.
+        let adev: *mut bindings::amba_device = obj.cast().as_ptr();
+        // SAFETY: amba_device contains device as its first field
+        let dev: *mut bindings::device = unsafe { addr_of_mut!((*adev).dev) };
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::put_device(dev) }
+    }
+}
+
+// SAFETY: A `Device` is always reference-counted and can be released from any thread.
+unsafe impl Send for Device {}
+
+// SAFETY: `Device` can be shared among threads because all methods of `Device`
+// (i.e. `Device<Normal>) are thread safe.
+unsafe impl Sync for Device {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf1200428..8af5ac6ef94c9 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -66,6 +66,8 @@
 
 pub mod acpi;
 pub mod alloc;
+#[cfg(CONFIG_ARM_AMBA = "y")]
+pub mod amba;
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
 pub mod bitmap;
-- 
2.43.0

