Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351814B96E
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Aug 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754062969; cv=none; b=jhc0qiKv3DDGpGG1JXB3GcBU+nK/GIrekYdYDfFFXK0BDWeT+XOEer5i7bKo3dfiLxOB2e9r0pUOjvdRoBGIXxBvyK2/QynwBskha1ASzcFZaXG00vlE+C26mgmTzdsoEsEwRvn0JPmnnXov3uz7fODLElTjGkC5JHUtnEoUFoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754062969; c=relaxed/simple;
	bh=pfqcvX2sshn6TULWqWx2eDtYs4e17cvaZPd33D5F+nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XSVszCxamvFSJNNAXMm5PDC5DJTgrF6IzGuqx/g3oSwDvbENvmzKYIosSshn0+Zag8LlgccRE+JZbVJN4LpRN7gB6vIzdT+3xuNt335LaFgVOf7HXb0CR0rdBSkD0PEhORIjH5VShNzeJ+YJgK5tww3Y5YCjcE31tp704xbi1uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxogVyxR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxogVyxR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4589b3e3820so22946765e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Aug 2025 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754062966; x=1754667766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97V49XEw1BtCEuIibSiAOzcmWJ+JTJIB5eWJvJZFSqM=;
        b=BxogVyxRObWIDshOJSUfvMtFG6qn0SaKzjoXue0aZCAxKsPvW3+0ibislUtzQeCvA5
         Nu+xLdZXo9TKiz4n99UbUkEbYOfVbaWDmKckvH9spoFP8t92y5piPhM9iUWFoq96Lwy6
         bkUTQ45+/gJZIGtqmb5AkLCXN/Cptl/dMSSxgJMBqfhsE2ESfvdTsTmAR6JaPeSP0KQZ
         s+GN6EekpnT01vCfP/gk6IgQCXCJX4FkoxseyOKS3jd9FflK6ATjL/+eD+0Zy2Z66aWQ
         7+McXY4yPTPwMmWsCzjidpqNKXQLRZDcigbZ5YCzU98IUSw7nqtM0le27o+rPoA9wqHJ
         Jhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754062966; x=1754667766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=97V49XEw1BtCEuIibSiAOzcmWJ+JTJIB5eWJvJZFSqM=;
        b=n8KirYT4rgpI3qa51yHZAE15YRgY11UoyocdlpGRiupPQb4asNhHnHgfIDUkfxQmk/
         p288yVlf18QVVQ9idE/SUiol1zQrfxm7Kvo3biOdAfD0FXqwFD5joS2teTItSZTqQnN6
         AuxW3Iwg4CccBJmy2WzIaJYuLl18moQpheotdOqqhK2e/i0Y8WHhaBVmAUZS4ay4L47u
         uE7DmITyoUsKBAUweB8tpddQxMNTO1UuQBJdbaN3DvfJnn/DVEIvJH/yMzh8aJ+e3PJS
         wrvSc/IFnguBIsdPjhhfqCfvi3yu4qHYtmNQB4q0ATSK9oEW/x18J+MaSj6gmmWaEhdB
         G61g==
X-Forwarded-Encrypted: i=1; AJvYcCWlPKTdsLVBNGHyK+/qutf0+JqEioXjaMiKr0K3I6dvkgLNWQs81OA/59eWI8HZ3DW5mIBwywoFgA1BXImcdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzq3T2cWwzL4fGZm43BF/FHb0+R0UzAnBn+tBCvwAEPZIlFoUu
	PPofK4FozFvxPbWuAvSPOM0UPyaPdc/aiZ4w5LzO9/7Wlr+5AKBFOmgv
X-Gm-Gg: ASbGncuBzx5KdHGsg1nNgcl7s/2V7I4g9I8Euc9zg5SmL1iDpiibUwMx1YgveE4GO/F
	GKeuClVh+l8we0cpJ+0DkRYOEgV4rbI5CejYWcVRK7f1g4X0Go393MjKmOLvIxFJ4aHByMBsonJ
	Q806VrpzTKBVp3Hvb6xr2IodPrrBvj3qZnEKvdmy4XkAZFrW3LH69KHeMp/AArmVixFE9B+TG51
	pWjnZXbwsQuBBzgZbFU7c8quvB5anGdB4Cf9XCfuWfAZ2y+jrhKfGSp0k39MIlGMJYf2dTXIqb2
	HEnTfAciXf54t4s8kni69X6XDLlfmAUpadp72JxPBetjRXJcX8l9+77uN016xfH7KuX+/51pkS3
	Hb8E0HZ1OpmmPFK+EAsxolAERpmlYep3JPcw4oE+zQosxGJjIBDCYUiFbub0RvvMaW/1h0pzuNd
	M=
X-Google-Smtp-Source: AGHT+IG8Lt5VNRm3AlpzjoiB+1m7GqtIjS0YhdyAfmskCpmu5CQ82oBFaYrhGl66PUZ8SeH2OSwV8Q==
X-Received: by 2002:a05:600c:8b71:b0:456:161c:3d61 with SMTP id 5b1f17b1804b1-458a4f945camr58281895e9.22.1754062965222;
        Fri, 01 Aug 2025 08:42:45 -0700 (PDT)
Received: from igor-korotin-Precision-Tower-3620.airspan.com ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536bc34sm108519725e9.2.2025.08.01.08.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 08:42:44 -0700 (PDT)
Sender: Igor Korotin <igorkor.3vium@gmail.com>
From: Igor Korotin <igor.korotin.linux@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver abstractions
Date: Fri,  1 Aug 2025 16:40:42 +0100
Message-ID: <20250801154042.14327-1-igor.korotin.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement the core abstractions needed for I2C drivers, including:

* `i2c::Driver` — the trait drivers must implement, including `probe`

* `i2c::Device` — a safe wrapper around `struct i2c_client`

* `i2c::Adapter` — implements `driver::RegistrationOps` to hook into the
  generic `driver::Registration` machinery

* `i2c::DeviceId` — a `RawDeviceIdIndex` implementation for I2C device IDs

Signed-off-by: Igor Korotin <igor.korotin.linux@gmail.com>
---
 MAINTAINERS                     |   7 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/i2c.rs              | 391 ++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 4 files changed, 401 insertions(+)
 create mode 100644 rust/kernel/i2c.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f03e230f3c5..767beaa0f7c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11514,6 +11514,13 @@ F:	include/linux/i2c.h
 F:	include/uapi/linux/i2c-*.h
 F:	include/uapi/linux/i2c.h
 
+I2C SUBSYSTEM [RUST]
+M:	Igor Korotin <igor.korotin.linux@gmail.com>
+R:	Danilo Krummrich <dakr@kernel.org>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/i2c.rs
+
 I2C SUBSYSTEM HOST DRIVERS
 M:	Andi Shyti <andi.shyti@kernel.org>
 L:	linux-i2c@vger.kernel.org
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 84d60635e8a9..81796d5e16e8 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -53,6 +53,7 @@
 #include <linux/file.h>
 #include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/i2c.h>
 #include <linux/ioport.h>
 #include <linux/jiffies.h>
 #include <linux/jump_label.h>
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
new file mode 100644
index 000000000000..fafcae92cfdb
--- /dev/null
+++ b/rust/kernel/i2c.rs
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! I2C Driver subsystem
+
+// I2C Driver abstractions.
+use crate::{
+    acpi, container_of, device,
+    device_id::{RawDeviceId, RawDeviceIdIndex},
+    driver,
+    error::*,
+    of,
+    prelude::*,
+    types::Opaque,
+};
+
+use core::{
+    marker::PhantomData,
+    ptr::{addr_of_mut, NonNull},
+};
+
+/// An I2C device id table.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct DeviceId(bindings::i2c_device_id);
+
+impl DeviceId {
+    const I2C_NAME_SIZE: usize = 20;
+
+    /// Create a new device id from an I2C 'id' string.
+    #[inline(always)]
+    pub const fn new(id: &'static CStr) -> Self {
+        build_assert!(
+            id.len_with_nul() <= Self::I2C_NAME_SIZE,
+            "ID exceeds 20 bytes"
+        );
+        let src = id.as_bytes_with_nul();
+        // Replace with `bindings::acpi_device_id::default()` once stabilized for `const`.
+        // SAFETY: FFI type is valid to be zero-initialized.
+        let mut i2c: bindings::i2c_device_id = unsafe { core::mem::zeroed() };
+        let mut i = 0;
+        while i < src.len() {
+            i2c.name[i] = src[i];
+            i += 1;
+        }
+
+        Self(i2c)
+    }
+}
+
+// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `i2c_device_id` and does not add
+// additional invariants, so it's safe to transmute to `RawType`.
+unsafe impl RawDeviceId for DeviceId {
+    type RawType = bindings::i2c_device_id;
+}
+
+// SAFETY: `DRIVER_DATA_OFFSET` is the offset to the `driver_data` field.
+unsafe impl RawDeviceIdIndex for DeviceId {
+    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::i2c_device_id, driver_data);
+
+    fn index(&self) -> usize {
+        self.0.driver_data as _
+    }
+}
+
+/// IdTable type for I2C
+pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
+
+/// Create a I2C `IdTable` with its alias for modpost.
+#[macro_export]
+macro_rules! i2c_device_table {
+    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
+        const $table_name: $crate::device_id::IdArray<
+            $crate::i2c::DeviceId,
+            $id_info_type,
+            { $table_data.len() },
+        > = $crate::device_id::IdArray::new($table_data);
+
+        $crate::module_device_table!("i2c", $module_table_name, $table_name);
+    };
+}
+
+/// An adapter for the registration of I2C drivers.
+pub struct Adapter<T: Driver>(T);
+
+// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
+// a preceding call to `register` has been successful.
+unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
+    type RegType = bindings::i2c_driver;
+
+    unsafe fn register(
+        pdrv: &Opaque<Self::RegType>,
+        name: &'static CStr,
+        module: &'static ThisModule,
+    ) -> Result {
+        let i2c_table = match T::I2C_ID_TABLE {
+            Some(table) => table.as_ptr(),
+            None => core::ptr::null(),
+        };
+
+        let of_table = match T::OF_ID_TABLE {
+            Some(table) => table.as_ptr(),
+            None => core::ptr::null(),
+        };
+
+        let acpi_table = match T::ACPI_ID_TABLE {
+            Some(table) => table.as_ptr(),
+            None => core::ptr::null(),
+        };
+
+        // SAFETY: It's safe to set the fields of `struct i2c_client` on initialization.
+        unsafe {
+            (*pdrv.get()).driver.name = name.as_char_ptr();
+            (*pdrv.get()).probe = Some(Self::probe_callback);
+            (*pdrv.get()).remove = Some(Self::remove_callback);
+            (*pdrv.get()).shutdown = Some(Self::shutdown_callback);
+            (*pdrv.get()).id_table = i2c_table;
+            (*pdrv.get()).driver.of_match_table = of_table;
+            (*pdrv.get()).driver.acpi_match_table = acpi_table;
+        }
+
+        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
+        to_result(unsafe { bindings::i2c_register_driver(module.0, pdrv.get()) })
+    }
+
+    unsafe fn unregister(pdrv: &Opaque<Self::RegType>) {
+        // SAFETY: `pdrv` is guaranteed to be a valid `RegType`.
+        unsafe { bindings::i2c_del_driver(pdrv.get()) }
+    }
+}
+
+impl<T: Driver + 'static> Adapter<T> {
+    extern "C" fn probe_callback(pdev: *mut bindings::i2c_client) -> kernel::ffi::c_int {
+        // SAFETY: The I2C bus only ever calls the probe callback with a valid pointer to a
+        // `struct i2c_client`.
+        //
+        // INVARIANT: `pdev` is valid for the duration of `probe_callback()`.
+        let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal>>() };
+
+        let info =
+            Self::i2c_id_info(pdev).or_else(|| <Self as driver::Adapter>::id_info(pdev.as_ref()));
+
+
+        from_result(|| {
+            let data = T::probe(pdev, info)?;
+
+            pdev.as_ref().set_drvdata(data);
+            Ok(0)
+        })
+    }
+
+    extern "C" fn remove_callback(pdev: *mut bindings::i2c_client) {
+        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
+        let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal>>() };
+
+        // SAFETY: `remove_callback` is only ever called after a successful call to
+        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
+        // and stored a `Pin<KBox<T>>`.
+        drop(unsafe { pdev.as_ref().drvdata_obtain::<Pin<KBox<T>>>() });
+    }
+
+    extern "C" fn shutdown_callback(pdev: *mut bindings::i2c_client) {
+        let pdev = unsafe { &*pdev.cast::<Device<device::Core>>() };
+
+        T::shutdown(pdev);
+    }
+
+    /// The [`i2c::IdTable`] of the corresponding driver.
+    fn i2c_id_table() -> Option<IdTable<<Self as driver::Adapter>::IdInfo>> {
+        T::I2C_ID_TABLE
+    }
+
+    /// Returns the driver's private data from the matching entry in the [`i2c::IdTable`], if any.
+    ///
+    /// If this returns `None`, it means there is no match with an entry in the [`i2c::IdTable`].
+    fn i2c_id_info(dev: &Device) -> Option<&'static <Self as driver::Adapter>::IdInfo> {
+        let table = Self::i2c_id_table()?;
+
+        // SAFETY:
+        // - `table` has static lifetime, hence it's valid for read,
+        // - `dev` is guaranteed to be valid while it's alive, and so is `pdev.as_ref().as_raw()`.
+        let raw_id = unsafe { bindings::i2c_match_id(table.as_ptr(), dev.as_raw()) };
+
+        if raw_id.is_null() {
+            None
+        } else {
+            // SAFETY: `DeviceId` is a `#[repr(transparent)` wrapper of `struct i2c_device_id` and
+            // does not add additional invariants, so it's safe to transmute.
+            let id = unsafe { &*raw_id.cast::<DeviceId>() };
+
+            Some(table.info(<DeviceId as crate::device_id::RawDeviceIdIndex>::index(id)))
+        }
+    }
+}
+
+impl<T: Driver + 'static> driver::Adapter for Adapter<T> {
+    type IdInfo = T::IdInfo;
+
+    fn of_id_table() -> Option<of::IdTable<Self::IdInfo>> {
+        T::OF_ID_TABLE
+    }
+
+    fn acpi_id_table() -> Option<acpi::IdTable<Self::IdInfo>> {
+        T::ACPI_ID_TABLE
+    }
+}
+
+/// Declares a kernel module that exposes a single i2c driver.
+///
+/// # Examples
+///
+/// ```ignore
+/// kernel::module_i2c_driver! {
+///     type: MyDriver,
+///     name: "Module name",
+///     authors: ["Author name"],
+///     description: "Description",
+///     license: "GPL v2",
+/// }
+/// ```
+#[macro_export]
+macro_rules! module_i2c_driver {
+    ($($f:tt)*) => {
+        $crate::module_driver!(<T>, $crate::i2c::Adapter<T>, { $($f)* });
+    };
+}
+
+/// The i2c driver trait.
+///
+/// Drivers must implement this trait in order to get a i2c driver registered.
+///
+/// # Example
+///
+///```
+/// # use kernel::{acpi, bindings, c_str, device::Core, i2c, of};
+///
+/// struct MyDriver;
+///
+/// kernel::acpi_device_table!(
+///     ACPI_TABLE,
+///     MODULE_ACPI_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [
+///         (acpi::DeviceId::new(c_str!("LNUXBEEF")), ())
+///     ]
+/// );
+///
+/// kernel::i2c_device_table!(
+///     I2C_TABLE,
+///     MODULE_I2C_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [
+///          (i2c::DeviceId::new(c_str!("rust_driver_i2c")), ())
+///     ]
+/// );
+///
+/// kernel::of_device_table!(
+///     OF_TABLE,
+///     MODULE_OF_TABLE,
+///     <MyDriver as i2c::Driver>::IdInfo,
+///     [
+///         (of::DeviceId::new(c_str!("test,device")), ())
+///     ]
+/// );
+///
+/// impl i2c::Driver for MyDriver {
+///     type IdInfo = ();
+///     const I2C_ID_TABLE: Option<i2c::IdTable<Self::IdInfo>> = Some(&I2C_TABLE);
+///     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+///     const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = Some(&ACPI_TABLE);
+///
+///     fn probe(
+///         _pdev: &i2c::Device<Core>,
+///         _id_info: Option<&Self::IdInfo>,
+///     ) -> Result<Pin<KBox<Self>>> {
+///         Err(ENODEV)
+///     }
+///
+///     fn shutdown(_pdev: &i2c::Device<Core>) {
+///     }
+/// }
+///```
+pub trait Driver: Send {
+    /// The type holding information about each device id supported by the driver.
+    // TODO: Use `associated_type_defaults` once stabilized:
+    //
+    // ```
+    // type IdInfo: 'static = ();
+    // ```
+    type IdInfo: 'static;
+
+    /// The table of device ids supported by the driver.
+    const I2C_ID_TABLE: Option<IdTable<Self::IdInfo>> = None;
+
+    /// The table of OF device ids supported by the driver.
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = None;
+
+    /// The table of ACPI device ids supported by the driver.
+    const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
+
+    /// I2C driver probe.
+    ///
+    /// Called when a new i2c device is added or discovered.
+    /// Implementers should attempt to initialize the device here.
+    fn probe(dev: &Device<device::Core>, id_info: Option<&Self::IdInfo>)
+        -> Result<Pin<KBox<Self>>>;
+
+    /// I2C driver shutdown
+    ///
+    /// Called when
+    fn shutdown(dev: &Device<device::Core>) {
+        let _ = dev;
+    }
+}
+
+/// The i2c client representation.
+///
+/// This structure represents the Rust abstraction for a C `struct i2c_client`. The
+/// implementation abstracts the usage of an already existing C `struct i2c_client` within Rust
+/// code that we get passed from the C side.
+///
+/// # Invariants
+///
+/// A [`Device`] instance represents a valid `struct i2c_client` created by the C portion of
+/// the kernel.
+#[repr(transparent)]
+pub struct Device<Ctx: device::DeviceContext = device::Normal>(
+    Opaque<bindings::i2c_client>,
+    PhantomData<Ctx>,
+);
+
+impl<Ctx: device::DeviceContext> Device<Ctx> {
+    fn as_raw(&self) -> *mut bindings::i2c_client {
+        self.0.get()
+    }
+}
+
+// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
+// argument.
+kernel::impl_device_context_deref!(unsafe { Device });
+kernel::impl_device_context_into_aref!(Device);
+
+// SAFETY: Instances of `Device` are always reference-counted.
+unsafe impl crate::types::AlwaysRefCounted for Device {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::put_device(addr_of_mut!((*obj.as_ref().as_raw()).dev)) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
+    fn as_ref(&self) -> &device::Device<Ctx> {
+        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
+        // `struct i2c_client`.
+        let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
+
+        // SAFETY: `dev` points to a valid `struct device`.
+        unsafe { device::Device::from_raw(dev) }
+    }
+}
+
+impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
+    type Error = kernel::error::Error;
+
+    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
+        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
+        // `struct device`.
+        if unsafe { bindings::i2c_verify_client(dev.as_raw()).is_null() } {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: We've just verified that the type of `dev` equals to
+        // `bindings::i2c_client_type`, hence `dev` must be embedded in a valid
+        // `struct i2c_client` as guaranteed by the corresponding C code.
+        let pdev = unsafe { container_of!(dev.as_raw(), bindings::i2c_client, dev) };
+
+        // SAFETY: `pdev` is a valid pointer to a `struct i2c_client`.
+        Ok(unsafe { &*pdev.cast() })
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
index c2d1b9375205..0780c3e746fc 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -86,6 +86,8 @@
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
 pub mod fs;
+#[cfg(CONFIG_I2C = "y")]
+pub mod i2c;
 pub mod init;
 pub mod io;
 pub mod ioctl;
-- 
2.43.0

