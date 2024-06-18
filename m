Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF8141C89
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 23:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718753631; cv=none; b=RmuMOzhsBgs3G+MfnLC3v+GfR4BjVTwiDmQj5qlAuuqnS4AbSzQptYWIS1hfptGoUrSA5ARqPWFcCpFJjjDuuVj9SD4JofXDhFDcALuaMt5r+YkhBhsxrgVUSk4kdgdXSYAFDJL2F3CCyYXjC9TsD+c5D1Io3yR8JcANTB/eMuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718753631; c=relaxed/simple;
	bh=rqB38QpznSkRIzSvalOm6TjN/Dt59oouktEhSw36FqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8t9TE2EXvdC/C5d96lNcKCMua4qD0qM5RQPZL5Qi98RgLyCbHjoD2+cf5MLc8o4mj1VNKpNr9cnJCndf7I3mPRf2Du3mLxmG6olziqf68sojE5jGdo1U0qrCUAAlYD1jA4VFI9pAsXBCQLSEtp2T6p5diyRYsWlqvGOR4uiQ2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M68PWAlf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M68PWAlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718753629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cs256xb1pxB+aLKo07WjvAHliW0Oujj+1OqKwCCaFMI=;
	b=M68PWAlfmb+87N5+PNctX9tkGkAkZVRWdGqG6U6YZfBWQ3wtP9rDeM+jOh1EMRmtioX2rE
	63GMWKO1HUZdBzeIKONeSjB3+aYekNGPqMwupeQz+loO/SKEHLYrDXLKq7Zi1p0h7vYas8
	0ZBSh3IWa4QFAJAw4mQbsZf8Ryy6izU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-3J3EyzwwMNePYc-j0_VvbQ-1; Tue, 18 Jun 2024 19:33:48 -0400
X-MC-Unique: 3J3EyzwwMNePYc-j0_VvbQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36376ef0221so34373f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 16:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718753627; x=1719358427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs256xb1pxB+aLKo07WjvAHliW0Oujj+1OqKwCCaFMI=;
        b=efIbTTqSbf6ZXiHukqvYB8DkouAdoBEBjpuyYgX0Bq0aWsXYCaAU4GT797ueJJonBC
         3pGMPqPfnMSfiVHfGWCaujuObq8Cy9Lps+j+1KXMX3LS3LPzeM+NkcWPx3ncDAuYz2Ol
         Cu+lZDQheL27O+C7vcpl8x4wESeZwIvMRLE6z31CsIsImgTdj6bIrF0LAS1cH7THlQMo
         HdZ6OuExODlHOAcMgKff9t3fBXtoJlAeYiqzKjMNmR/PbaJTZzXLT/4i6JBN+9YnV94K
         PYktBd9STjKYAFzKSldHbv4mh+SoQ8eXaSCT6GfxXdSXwn0ku90AqZpZCBD25/5iXDkd
         o+LQ==
X-Gm-Message-State: AOJu0YzFlG0JlRQ2+r8r25dUPRt05pNdNW6Hq81SduhZMwwXbT930oRq
	9TIiPg53MhpS+aUCGXvvn8/2IXDu1KPVhZrdQhXZ614ZvPsCMCJduafywOv6IOT2xyonOsBRXMj
	DlH8punJCZL4ULNa6mxFk8kGnjeDPNtFlkb1VFHQp9hNQBDwEC7zF32qK1/F4HLxM
X-Received: by 2002:a5d:4b46:0:b0:360:8683:c072 with SMTP id ffacd0b85a97d-363192cde9emr559779f8f.50.1718753626819;
        Tue, 18 Jun 2024 16:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDj4GU8KQkEGYxDKLz5FrCgHzqL9Xhx0LSLZPJwbhGZtUQiAHQgPGzyjn01QpFDvnhXqlOWw==
X-Received: by 2002:a5d:4b46:0:b0:360:8683:c072 with SMTP id ffacd0b85a97d-363192cde9emr559749f8f.50.1718753626458;
        Tue, 18 Jun 2024 16:33:46 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36245fc625dsm2349536f8f.115.2024.06.18.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 16:33:45 -0700 (PDT)
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
	lina@asahilina.net,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 4/8] rust: drm: add device abstraction
Date: Wed, 19 Jun 2024 01:31:40 +0200
Message-ID: <20240618233324.14217-5-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
References: <20240618233324.14217-1-dakr@redhat.com>
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

Implement the abstraction for a `struct drm_device`.

A `drm::device::Device` creates a static const `struct drm_driver` filled
with the data from the `drm::drv::Driver` trait implementation of the
actual driver creating the `drm::device::Device`.

Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/device.rs       | 180 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 3 files changed, 182 insertions(+)
 create mode 100644 rust/kernel/drm/device.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index dc19cb789536..1d12ee7d3c97 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
new file mode 100644
index 000000000000..c62516f79221
--- /dev/null
+++ b/rust/kernel/drm/device.rs
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM device.
+//!
+//! C header: [`include/linux/drm/drm_device.h`](srctree/include/linux/drm/drm_device.h)
+
+use crate::{
+    bindings, device, drm,
+    drm::drv::AllocImpl,
+    error::code::*,
+    error::from_err_ptr,
+    error::Result,
+    types::{ARef, AlwaysRefCounted, ForeignOwnable, Opaque},
+};
+use core::{ffi::c_void, marker::PhantomData, ptr::NonNull};
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
+/// A typed DRM device with a specific `drm::drv::Driver` implementation. The device is always
+/// reference-counted.
+///
+/// # Invariants
+///
+/// `drm_dev_release()` can be called from any non-atomic context.
+#[repr(transparent)]
+pub struct Device<T: drm::drv::Driver>(Opaque<bindings::drm_device>, PhantomData<T>);
+
+impl<T: drm::drv::Driver> Device<T> {
+    const VTABLE: bindings::drm_driver = drm_legacy_fields! {
+        load: None,
+        open: None, // TODO: File abstraction
+        postclose: None, // TODO: File abstraction
+        lastclose: None,
+        unload: None,
+        release: Some(Self::release),
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
+        fops: core::ptr::null_mut() as _,
+    };
+
+    /// Create a new `drm::device::Device` for a `drm::drv::Driver`.
+    pub fn new(dev: &device::Device, data: T::Data) -> Result<ARef<Self>> {
+        // SAFETY: `dev` is valid by its type invarants; `VTABLE`, as a `const` is pinned to the
+        // read-only section of the compilation.
+        let raw_drm = unsafe { bindings::drm_dev_alloc(&Self::VTABLE, dev.as_raw()) };
+        let raw_drm = NonNull::new(from_err_ptr(raw_drm)? as *mut _).ok_or(ENOMEM)?;
+
+        let data_ptr = <T::Data as ForeignOwnable>::into_foreign(data);
+
+        // SAFETY: The reference count is one, and now we take ownership of that reference as a
+        // drm::device::Device.
+        let drm = unsafe { ARef::<Self>::from_raw(raw_drm) };
+
+        // SAFETY: Safe as we set `dev_private` once at device creation.
+        unsafe { drm.set_raw_data(data_ptr) };
+
+        Ok(drm)
+    }
+
+    pub(crate) fn as_raw(&self) -> *mut bindings::drm_device {
+        self.0.get()
+    }
+
+    /// Not intended to be called externally, except via declare_drm_ioctls!()
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count,
+    /// i.e. it must be ensured that the reference count of the C `struct drm_device` `ptr` points
+    /// to can't drop to zero, for the duration of this function call and the entire duration when
+    /// the returned reference exists.
+    #[doc(hidden)]
+    pub unsafe fn borrow<'a>(ptr: *const bindings::drm_device) -> &'a Self {
+        // SAFETY: Safe by the safety requirements of this function.
+        unsafe { &*ptr.cast() }
+    }
+
+    pub(crate) fn raw_data(&self) -> *const c_void {
+        // SAFETY: `self` is guaranteed to hold a valid `bindings::drm_device` pointer.
+        unsafe { *self.as_raw() }.dev_private
+    }
+
+    // SAFETY: Must be called only once after device creation.
+    unsafe fn set_raw_data(&self, ptr: *const c_void) {
+        // SAFETY: Safe as by the safety precondition.
+        unsafe { &mut *self.as_raw() }.dev_private = ptr as _;
+    }
+
+    /// Returns a borrowed reference to the user data associated with this Device.
+    pub fn data(&self) -> <T::Data as ForeignOwnable>::Borrowed<'_> {
+        // SAFETY: `dev_private` is always set at device creation.
+        unsafe { T::Data::borrow(self.raw_data()) }
+    }
+
+    unsafe extern "C" fn release(drm: *mut bindings::drm_device) {
+        // SAFETY: Guaranteed to be a valid pointer to a `struct drm_device`.
+        let drm = unsafe { Self::borrow(drm) };
+
+        // SAFETY: `Self::data` is always converted and set on device creation.
+        unsafe { <T::Data as ForeignOwnable>::from_foreign(drm.raw_data()) };
+    }
+}
+
+// SAFETY: DRM device objects are always reference counted and the get/put functions
+// satisfy the requirements.
+unsafe impl<T: drm::drv::Driver> AlwaysRefCounted for Device<T> {
+    fn inc_ref(&self) {
+        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
+        unsafe { bindings::drm_dev_get(self.as_raw()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
+        unsafe { bindings::drm_dev_put(obj.cast().as_ptr()) };
+    }
+}
+
+impl<T: drm::drv::Driver> AsRef<device::Device> for Device<T> {
+    fn as_ref(&self) -> &device::Device {
+        // SAFETY: `bindings::drm_device::dev` is valid as long as the DRM device itself is valid,
+        // which is guaranteed by the type invariant.
+        unsafe { device::Device::as_ref((*self.as_raw()).dev) }
+    }
+}
+
+// SAFETY: As by the type invariant `Device` can be sent to any thread.
+unsafe impl<T: drm::drv::Driver> Send for Device<T> {}
+
+// SAFETY: `Device` can be shared among threads because all immutable methods are protected by the
+// synchronization in `struct drm_device`.
+unsafe impl<T: drm::drv::Driver> Sync for Device<T> {}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index d987c56b3cec..69376b3c6db9 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,5 +2,6 @@
 
 //! DRM subsystem abstractions.
 
+pub mod device;
 pub mod drv;
 pub mod ioctl;
-- 
2.45.1

