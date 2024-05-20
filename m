Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B20137C48
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225693; cv=none; b=bJpqf+8jxFXviYOhcB0KHpCzTWDPVdjGm0oYyeZsBFStf2//hBWEel5JAhzXi+vuPhOAY6bUlPXKwNNHYksp3lAlhQpbc2dn5uGDnxOFNyxxXvd5S25iqBfjOW9HL0WXk2LlWM49VKdDLF794JHhnwnYMrwXSKBWHQgsa4PQtOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225693; c=relaxed/simple;
	bh=y32cuBabj6X2ET0q80g0a9FnAUVB8+J13mJU3k9+/8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VFWjYePbmTCWIunaarrmiMKdfDHbHm20FeW1vKh/z0RdQuE+azKcKAc6gLVZxxXtp6wpEAwpBnWKthRGtJgGnbGqLiK/GE1+INlpKe9iRRAu2muW3Hnt/vm1QZQSMXGEpeg8nLdmd+tCTIOYq94b/yhqKA+5tFDUI7NBsvUlER0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BMR7+w13; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BMR7+w13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716225689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zj0pa4Lx8ydM+bjFlhdM8zfotScwh9i9XwFO8f4TNqY=;
	b=BMR7+w13PKRxeO/Yt6kVNGAnnMEcKOieJBz+WqkXsdyWKfdV9j1R5+AFo5cjIyYQKXOqFx
	fn+2fjQQM7VR9BzBqioLt7slVpPTuSSBrFytP9PYoKx1PBQJ7VT2DdYYy3DR7kPDIWGJfn
	WPYlvQd+3TnaPQ8T0VbSD23sL5myu/8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-srXB_XQnOO-ONwyv41LvQQ-1; Mon, 20 May 2024 13:21:28 -0400
X-MC-Unique: srXB_XQnOO-ONwyv41LvQQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42003993265so44091355e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716225685; x=1716830485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zj0pa4Lx8ydM+bjFlhdM8zfotScwh9i9XwFO8f4TNqY=;
        b=eWdDtaeYK1AHeAeS1j3LEYgBXFcoQJKZtvk2mFG+1Xh8s1JOMenN3OEc6wdbGOTQC+
         8YHdLWz0g27UIAgEZFlIy84vdKHqzokWfYiU69vK7eDBVJh+WuvyMGr47mjgAfvJGrgd
         e5jj/oGgk3OxRs+2IqR636iTvL8j8/VCgMWsYk2kT2sFKrPawNW9K6m24fESHU54r+uk
         K7xExiaSj8jx0Rb96jq8dtpO1rrcvzJcKwxpS0IfnWlIClBNsoMqG+ghXJbQDtt35NZP
         zQ9mQYhSizOUqeZUdOXoROkzRqOTkBsZfQx62Om240DGrNvMsyqnXyUU/ns/uioR07//
         4qDA==
X-Gm-Message-State: AOJu0YyK20h+b8FjnnWFURZ6yV+egPlcGXgnuodutirEzFAMt0tNAFtm
	zRVy4Udd/3V6U156MXcVEhtYN13zWwb/TMVR3IIGBJh5mb5XyMBLePLsWo1anbLDnjwVnq4PQcX
	sQgD1Odnl1/kQBCDRHVF4nS0MJdjgLpwaHhdB8YniC8QYLZ2b1lLgssAxZMdSjZbe
X-Received: by 2002:a05:600c:3108:b0:417:e00c:fdb8 with SMTP id 5b1f17b1804b1-41fea931b3dmr258312575e9.1.1716225684899;
        Mon, 20 May 2024 10:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQFJ6w0yVF4BBNea+uNBBOsskLn0+4sjQAPGgBcBBWKGQlFyAaYRxflG8HwCyGxfYA/pwqlQ==
X-Received: by 2002:a05:600c:3108:b0:417:e00c:fdb8 with SMTP id 5b1f17b1804b1-41fea931b3dmr258312175e9.1.1716225684310;
        Mon, 20 May 2024 10:21:24 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42010b1076dsm345952935e9.41.2024.05.20.10.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:21:23 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	fujita.tomonori@gmail.com,
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
Date: Mon, 20 May 2024 19:20:50 +0200
Message-ID: <20240520172059.181256-4-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
References: <20240520172059.181256-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Asahi Lina <lina@asahilina.net>

Add abstractions for DRM drivers and devices. These go together in one
commit since both are fairly tightly coupled types.

A few things have been stubbed out, to be implemented as further bits of
the DRM subsystem are introduced.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Co-developed-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   2 +
 rust/kernel/drm/device.rs       |  87 +++++++++
 rust/kernel/drm/drv.rs          | 318 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   2 +
 4 files changed, 409 insertions(+)
 create mode 100644 rust/kernel/drm/device.rs
 create mode 100644 rust/kernel/drm/drv.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 14188034285a..831fbfe03a47 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,8 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
new file mode 100644
index 000000000000..f72bab8dd42d
--- /dev/null
+++ b/rust/kernel/drm/device.rs
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM device.
+//!
+//! C header: [`include/linux/drm/drm_device.h`](../../../../include/linux/drm/drm_device.h)
+
+use crate::{
+    bindings, device, drm,
+    error::code::*,
+    error::from_err_ptr,
+    error::Result,
+    types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
+};
+use alloc::boxed::Box;
+use core::{ffi::c_void, marker::PhantomData, pin::Pin, ptr::NonNull};
+
+/// A typed DRM device with a specific driver. The device is always reference-counted.
+#[repr(transparent)]
+pub struct Device<T: drm::drv::Driver>(Opaque<bindings::drm_device>, PhantomData<T>);
+
+impl<T: drm::drv::Driver> Device<T> {
+    pub(crate) fn new(
+        dev: &device::Device,
+        vtable: &Pin<Box<bindings::drm_driver>>,
+    ) -> Result<ARef<Self>> {
+        let raw_drm = unsafe { bindings::drm_dev_alloc(&**vtable, dev.as_raw()) };
+        let raw_drm = NonNull::new(from_err_ptr(raw_drm)? as *mut _).ok_or(ENOMEM)?;
+
+        // SAFETY: The reference count is one, and now we take ownership of that reference as a
+        // drm::device::Device.
+        Ok(unsafe { ARef::from_raw(raw_drm) })
+    }
+
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
+        self.0.get()
+    }
+
+    // Not intended to be called externally, except via declare_drm_ioctls!()
+    #[doc(hidden)]
+    pub unsafe fn borrow<'a>(raw: *const bindings::drm_device) -> &'a Self {
+        unsafe { &*(raw as *const Self) }
+    }
+
+    pub(crate) fn raw_data(&self) -> *const c_void {
+        // SAFETY: `self` is guaranteed to hold a valid `bindings::drm_device` pointer.
+        unsafe { *self.as_raw() }.dev_private
+    }
+
+    // SAFETY: Must be called only once after device creation.
+    pub(crate) unsafe fn set_raw_data(&self, ptr: *const c_void) {
+        // SAFETY: Safe as by the safety precondition.
+        unsafe { &mut *self.as_raw() }.dev_private = ptr as _;
+    }
+
+    /// Returns a borrowed reference to the user data associated with this Device.
+    pub fn data(&self) -> Option<<T::Data as ForeignOwnable>::Borrowed<'_>> {
+        let dev_private = self.raw_data();
+
+        if dev_private.is_null() {
+            None
+        } else {
+            // SAFETY: `dev_private` is NULL before the DRM device is registered; after the DRM
+            // device has been registered dev_private is guaranteed to be valid.
+            Some(unsafe { T::Data::borrow(dev_private) })
+        }
+    }
+}
+
+// SAFETY: DRM device objects are always reference counted and the get/put functions
+// satisfy the requirements.
+unsafe impl<T: drm::drv::Driver> AlwaysRefCounted for Device<T> {
+    fn inc_ref(&self) {
+        unsafe { bindings::drm_dev_get(&self.as_raw() as *const _ as *mut _) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The Device<T> type has the same layout as drm_device, so we can just cast.
+        unsafe { bindings::drm_dev_put(obj.as_ptr() as *mut _) };
+    }
+}
+
+// SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
+unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
+
+// SAFETY: `Device` only holds a pointer to a C device, references to which are safe to be used
+// from any thread.
+unsafe impl<T: drm::drv::Driver> Sync for Device<T> {}
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
new file mode 100644
index 000000000000..5dd8f3f8df7c
--- /dev/null
+++ b/rust/kernel/drm/drv.rs
@@ -0,0 +1,318 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM driver core.
+//!
+//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
+
+use crate::{
+    alloc::flags::*,
+    bindings, device, drm,
+    error::code::*,
+    error::{Error, Result},
+    prelude::*,
+    private::Sealed,
+    str::CStr,
+    types::{ARef, ForeignOwnable},
+    ThisModule,
+};
+use core::{
+    marker::{PhantomData, PhantomPinned},
+    pin::Pin,
+};
+use macros::vtable;
+
+/// Driver use the GEM memory manager. This should be set for all modern drivers.
+pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
+/// Driver supports mode setting interfaces (KMS).
+pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
+/// Driver supports dedicated render nodes.
+pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
+/// Driver supports the full atomic modesetting userspace API.
+///
+/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
+/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
+/// should not set this flag.
+pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
+/// Driver supports DRM sync objects for explicit synchronization of command submission.
+pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
+/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
+/// submission.
+pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
+
+/// Information data for a DRM Driver.
+pub struct DriverInfo {
+    /// Driver major version.
+    pub major: i32,
+    /// Driver minor version.
+    pub minor: i32,
+    /// Driver patchlevel version.
+    pub patchlevel: i32,
+    /// Driver name.
+    pub name: &'static CStr,
+    /// Driver description.
+    pub desc: &'static CStr,
+    /// Driver date.
+    pub date: &'static CStr,
+}
+
+/// Internal memory management operation set, normally created by memory managers (e.g. GEM).
+///
+/// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
+pub struct AllocOps {
+    pub(crate) gem_create_object: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            size: usize,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    pub(crate) prime_handle_to_fd: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            handle: u32,
+            flags: u32,
+            prime_fd: *mut core::ffi::c_int,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) prime_fd_to_handle: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            prime_fd: core::ffi::c_int,
+            handle: *mut u32,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) gem_prime_import: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            dma_buf: *mut bindings::dma_buf,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    pub(crate) gem_prime_import_sg_table: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            attach: *mut bindings::dma_buf_attachment,
+            sgt: *mut bindings::sg_table,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    pub(crate) dumb_create: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            args: *mut bindings::drm_mode_create_dumb,
+        ) -> core::ffi::c_int,
+    >,
+    pub(crate) dumb_map_offset: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            handle: u32,
+            offset: *mut u64,
+        ) -> core::ffi::c_int,
+    >,
+}
+
+/// Trait for memory manager implementations. Implemented internally.
+pub trait AllocImpl: Sealed {
+    /// The C callback operations for this memory manager.
+    const ALLOC_OPS: AllocOps;
+}
+
+/// A DRM driver implementation.
+#[vtable]
+pub trait Driver {
+    /// Context data associated with the DRM driver
+    ///
+    /// Determines the type of the context data passed to each of the methods of the trait.
+    type Data: ForeignOwnable + Sync + Send;
+
+    /// The type used to manage memory for this driver.
+    ///
+    /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
+    type Object: AllocImpl;
+
+    /// Driver metadata
+    const INFO: DriverInfo;
+
+    /// Feature flags
+    const FEATURES: u32;
+
+    /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
+    const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
+}
+
+/// A registration of a DRM device
+///
+/// # Invariants:
+///
+/// drm is always a valid pointer to an allocated drm_device
+pub struct Registration<T: Driver> {
+    drm: ARef<drm::device::Device<T>>,
+    registered: bool,
+    fops: bindings::file_operations,
+    vtable: Pin<Box<bindings::drm_driver>>,
+    _p: PhantomData<T>,
+    _pin: PhantomPinned,
+}
+
+#[cfg(CONFIG_DRM_LEGACY)]
+macro_rules! drm_legacy_fields {
+    ( $($field:ident: $val:expr),* $(,)? ) => {
+        bindings::drm_driver {
+            $( $field: $val ),*,
+            firstopen: None,
+            preclose: None,
+            dma_ioctl: None,
+            dma_quiescent: None,
+            context_dtor: None,
+            irq_handler: None,
+            irq_preinstall: None,
+            irq_postinstall: None,
+            irq_uninstall: None,
+            get_vblank_counter: None,
+            enable_vblank: None,
+            disable_vblank: None,
+            dev_priv_size: 0,
+        }
+    }
+}
+
+#[cfg(not(CONFIG_DRM_LEGACY))]
+macro_rules! drm_legacy_fields {
+    ( $($field:ident: $val:expr),* $(,)? ) => {
+        bindings::drm_driver {
+            $( $field: $val ),*
+        }
+    }
+}
+
+/// Registers a DRM device with the rest of the kernel.
+///
+/// It automatically picks up THIS_MODULE.
+#[allow(clippy::crate_in_macro_def)]
+#[macro_export]
+macro_rules! drm_device_register {
+    ($reg:expr, $data:expr, $flags:expr $(,)?) => {{
+        $crate::drm::drv::Registration::register($reg, $data, $flags, &crate::THIS_MODULE)
+    }};
+}
+
+impl<T: Driver> Registration<T> {
+    const VTABLE: bindings::drm_driver = drm_legacy_fields! {
+        load: None,
+        open: None, // TODO: File abstraction
+        postclose: None, // TODO: File abstraction
+        lastclose: None,
+        unload: None,
+        release: None,
+        master_set: None,
+        master_drop: None,
+        debugfs_init: None,
+        gem_create_object: T::Object::ALLOC_OPS.gem_create_object,
+        prime_handle_to_fd: T::Object::ALLOC_OPS.prime_handle_to_fd,
+        prime_fd_to_handle: T::Object::ALLOC_OPS.prime_fd_to_handle,
+        gem_prime_import: T::Object::ALLOC_OPS.gem_prime_import,
+        gem_prime_import_sg_table: T::Object::ALLOC_OPS.gem_prime_import_sg_table,
+        dumb_create: T::Object::ALLOC_OPS.dumb_create,
+        dumb_map_offset: T::Object::ALLOC_OPS.dumb_map_offset,
+        show_fdinfo: None,
+
+        major: T::INFO.major,
+        minor: T::INFO.minor,
+        patchlevel: T::INFO.patchlevel,
+        name: T::INFO.name.as_char_ptr() as *mut _,
+        desc: T::INFO.desc.as_char_ptr() as *mut _,
+        date: T::INFO.date.as_char_ptr() as *mut _,
+
+        driver_features: T::FEATURES,
+        ioctls: T::IOCTLS.as_ptr(),
+        num_ioctls: T::IOCTLS.len() as i32,
+        fops: core::ptr::null_mut(),
+    };
+
+    /// Creates a new [`Registration`] but does not register it yet.
+    ///
+    /// It is allowed to move.
+    pub fn new(parent: &device::Device) -> Result<Self> {
+        let vtable = Pin::new(Box::new(Self::VTABLE, GFP_KERNEL)?);
+
+        Ok(Self {
+            drm: drm::device::Device::new(parent, &vtable)?,
+            registered: false,
+            vtable,
+            fops: Default::default(), // TODO: GEM abstraction
+            _pin: PhantomPinned,
+            _p: PhantomData,
+        })
+    }
+
+    /// Registers a DRM device with the rest of the kernel.
+    ///
+    /// Users are encouraged to use the [`drm_device_register!()`] macro because it automatically
+    /// picks up the current module.
+    pub fn register(
+        self: Pin<&mut Self>,
+        data: T::Data,
+        flags: usize,
+        module: &'static ThisModule,
+    ) -> Result {
+        if self.registered {
+            // Already registered.
+            return Err(EINVAL);
+        }
+
+        // SAFETY: We never move out of `this`.
+        let this = unsafe { self.get_unchecked_mut() };
+        let data_pointer = <T::Data as ForeignOwnable>::into_foreign(data);
+
+        // SAFETY: This is the only code touching a device' private data pointer.
+        unsafe { this.drm.set_raw_data(data_pointer) };
+
+        this.fops.owner = module.0;
+        this.vtable.fops = &this.fops;
+
+        // SAFETY: The device is now initialized and ready to be registered.
+        let ret = unsafe { bindings::drm_dev_register(this.drm.as_raw(), flags as u64) };
+        if ret < 0 {
+            // SAFETY: `data_pointer` was returned by `into_foreign` above.
+            unsafe { T::Data::from_foreign(data_pointer) };
+            return Err(Error::from_errno(ret));
+        }
+
+        this.registered = true;
+        Ok(())
+    }
+
+    /// Returns a reference to the `Device` instance for this registration.
+    pub fn device(&self) -> &drm::device::Device<T> {
+        &self.drm
+    }
+}
+
+// SAFETY: `Registration` doesn't offer any methods or access to fields when shared between threads
+// or CPUs, so it is safe to share it.
+unsafe impl<T: Driver> Sync for Registration<T> {}
+
+// SAFETY: Registration with and unregistration from the drm subsystem can happen from any thread.
+// Additionally, `T::Data` (which is dropped during unregistration) is `Send`, so it is ok to move
+// `Registration` to different threads.
+#[allow(clippy::non_send_fields_in_send_ty)]
+unsafe impl<T: Driver> Send for Registration<T> {}
+
+impl<T: Driver> Drop for Registration<T> {
+    /// Removes the registration from the kernel if it has completed successfully before.
+    fn drop(&mut self) {
+        if self.registered {
+            // Get a pointer to the data stored in device before destroying it.
+            // SAFETY: `drm` is valid per the type invariant
+            let data_pointer = self.drm.raw_data();
+
+            // SAFETY: Since `registered` is true, `self.drm` is both valid and registered.
+            unsafe { bindings::drm_dev_unregister(self.drm.as_raw()) };
+
+            // Free data as well.
+            // SAFETY: `data_pointer` was returned by `into_foreign` during registration.
+            unsafe { <T::Data as ForeignOwnable>::from_foreign(data_pointer) };
+        }
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 9ec6d7cbcaf3..69376b3c6db9 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,4 +2,6 @@
 
 //! DRM subsystem abstractions.
 
+pub mod device;
+pub mod drv;
 pub mod ioctl;
-- 
2.45.1

