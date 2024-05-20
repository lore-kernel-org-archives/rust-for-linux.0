Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5876C11184
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225875; cv=none; b=WUERFR9j1Onb1gxL7cEg2lLW6ynKmPFYAlG7jHTZ3kjm4qSY9lqzuEvu0M8UtT6k+bfWcaj9QbdFVve2ewZQFiXuDl6sDxy4qtA22IFoubmbxh9iqikrWRHDOzsf7pKw4Qu/4pS5fqw7rYr+T2xWJjB5sce2bbExpSTojaMFU4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225875; c=relaxed/simple;
	bh=NNugBS45KUoQ2EjnHPxkldEKy5qzurrofq/+xLuw3VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kCp+nWJ8MoXDDuhTS9/7/JUiM3rFlaNqen6DGsFbPznwPatCVdvIrvLbiTgOeoS3ax97rWPAsi9CIlC38ZJVf8bjw9Fju6HGbYHfFjfzk3s5jZdZBvd+arHiPpa+cUiS3NQflS7lmCyIlOrrl3Z6W5KWIapwj+JeT+xbAVgV3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WttHfd28; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WttHfd28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716225873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5P5B+YM/OjD534xio0dIE5yHPWEzGnlxEKEl3OyNZXU=;
	b=WttHfd28pSJKc0k2PDRhK4G13cTpmaZ5jDlGzYaPa7DnD5w8cjh1YJcEG/XCVITkjrIn6I
	e1xiAHXj9IMfXdYo7TW9IYd3nHlgBnsgPYkDvJQEW8JJimZF6YeflqZ3iv6oc/KdcOD9nt
	9tVjw20FcfAUByBKM7TeHIKaDADBNLg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-N8mDd1VaN2CZLeFmlaLgkQ-1; Mon, 20 May 2024 13:24:30 -0400
X-MC-Unique: N8mDd1VaN2CZLeFmlaLgkQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-41dc9c831acso60683165e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716225869; x=1716830669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5P5B+YM/OjD534xio0dIE5yHPWEzGnlxEKEl3OyNZXU=;
        b=Wfa+I36jDTCykGDYzl/xaFyd7YpFTOUpxrn6p/PKogMKrd3BkqmDkaifG5ugV9dO23
         EuOKCt17Qq94EDvuqIHQRBPXlh0GvPNZaEVhEwRVGB6wKQD7iCxxg5tc6Ar9m3z48t28
         QMPzUyYa4Ed/3WIHpL5aJgTQePVNFLJBybtuOs47NwxEEjO7xFNa/0wq1ePeYNrBa59f
         QQHBp2kK66svy+oKSsj0aS4tQRGyKsqHUT03rHuZGR33Ps6itc/yW4wQDWF4WbFevOkB
         iKP6Nw43CoD991Dj6mn4pAo91p30mUhfcbLxzdUNkRnoYwkcJmBhCVAMbdzNpHQzYxqT
         R/9g==
X-Gm-Message-State: AOJu0Yw4yMl8jUZ3JfR+Td8HG1R9f+NmMPStTCO5yjdL/Z1kI9s6HHxn
	BWm7PO43KfXOCURaR0PaezpHl0NvAfmbv2bPETVOv1loZRSb8SWMxzwo1NBxYGbi/ThBBPQe1+o
	vP+WkHcGLNjJhOHD+Wc1FlCE92LUKToDHQ0Ga6IxCXPtDqu5UITH20CfmJn0bHgF7
X-Received: by 2002:a05:600c:5101:b0:419:f4d6:463b with SMTP id 5b1f17b1804b1-420e1a301f8mr50659865e9.14.1716225869685;
        Mon, 20 May 2024 10:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD66DGPVTzcTg/uKLOomBnDurKshNpwlQP73J4t42qg3pUB6/sWqwv/uKUk7zNux5Kw2TyTw==
X-Received: by 2002:a05:600c:5101:b0:419:f4d6:463b with SMTP id 5b1f17b1804b1-420e1a301f8mr50659645e9.14.1716225869295;
        Mon, 20 May 2024 10:24:29 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce24cdsm431781365e9.15.2024.05.20.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:24:28 -0700 (PDT)
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
Subject: [RFC PATCH 5/8] rust: drm: file: Add File abstraction
Date: Mon, 20 May 2024 19:24:17 +0200
Message-ID: <20240520172422.181763-2-dakr@redhat.com>
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

A DRM File is the DRM counterpart to a kernel file structure,
representing an open DRM file descriptor. Add a Rust abstraction to
allow drivers to implement their own File types that implement the
DriverFile trait.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/drv.rs          |   7 +-
 rust/kernel/drm/file.rs         | 113 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 4 files changed, 120 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/drm/file.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 831fbfe03a47..c591811ccb67 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
index 5dd8f3f8df7c..c5a63663ea21 100644
--- a/rust/kernel/drm/drv.rs
+++ b/rust/kernel/drm/drv.rs
@@ -131,6 +131,9 @@ pub trait Driver {
     /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
     type Object: AllocImpl;
 
+    /// The type used to represent a DRM File (client)
+    type File: drm::file::DriverFile;
+
     /// Driver metadata
     const INFO: DriverInfo;
 
@@ -200,8 +203,8 @@ macro_rules! drm_device_register {
 impl<T: Driver> Registration<T> {
     const VTABLE: bindings::drm_driver = drm_legacy_fields! {
         load: None,
-        open: None, // TODO: File abstraction
-        postclose: None, // TODO: File abstraction
+        open: Some(drm::file::open_callback::<T::File>),
+        postclose: Some(drm::file::postclose_callback::<T::File>),
         lastclose: None,
         unload: None,
         release: None,
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
new file mode 100644
index 000000000000..a25b8c61f4ee
--- /dev/null
+++ b/rust/kernel/drm/file.rs
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM File objects.
+//!
+//! C header: [`include/linux/drm/drm_file.h`](../../../../include/linux/drm/drm_file.h)
+
+use crate::{bindings, drm, error::Result};
+use alloc::boxed::Box;
+use core::marker::PhantomData;
+use core::pin::Pin;
+
+/// Trait that must be implemented by DRM drivers to represent a DRM File (a client instance).
+pub trait DriverFile {
+    /// The parent `Driver` implementation for this `DriverFile`.
+    type Driver: drm::drv::Driver;
+
+    /// Open a new file (called when a client opens the DRM device).
+    fn open(device: &drm::device::Device<Self::Driver>) -> Result<Pin<Box<Self>>>;
+}
+
+/// An open DRM File.
+///
+/// # Invariants
+/// `raw` is a valid pointer to a `drm_file` struct.
+#[repr(transparent)]
+pub struct File<T: DriverFile> {
+    raw: *mut bindings::drm_file,
+    _p: PhantomData<T>,
+}
+
+pub(super) unsafe extern "C" fn open_callback<T: DriverFile>(
+    raw_dev: *mut bindings::drm_device,
+    raw_file: *mut bindings::drm_file,
+) -> core::ffi::c_int {
+    let drm = unsafe { drm::device::Device::borrow(raw_dev) };
+    // SAFETY: This reference won't escape this function
+    let file = unsafe { &mut *raw_file };
+
+    let inner = match T::open(drm) {
+        Err(e) => {
+            return e.to_errno();
+        }
+        Ok(i) => i,
+    };
+
+    // SAFETY: This pointer is treated as pinned, and the Drop guarantee is upheld below.
+    file.driver_priv = Box::into_raw(unsafe { Pin::into_inner_unchecked(inner) }) as *mut _;
+
+    0
+}
+
+pub(super) unsafe extern "C" fn postclose_callback<T: DriverFile>(
+    _dev: *mut bindings::drm_device,
+    raw_file: *mut bindings::drm_file,
+) {
+    // SAFETY: This reference won't escape this function
+    let file = unsafe { &*raw_file };
+
+    // Drop the DriverFile
+    unsafe {
+        let _ = Box::from_raw(file.driver_priv as *mut T);
+    };
+}
+
+impl<T: DriverFile> File<T> {
+    // Not intended to be called externally, except via declare_drm_ioctls!()
+    #[doc(hidden)]
+    pub unsafe fn from_raw(raw_file: *mut bindings::drm_file) -> File<T> {
+        File {
+            raw: raw_file,
+            _p: PhantomData,
+        }
+    }
+
+    #[allow(dead_code)]
+    /// Return the raw pointer to the underlying `drm_file`.
+    pub(super) fn raw(&self) -> *const bindings::drm_file {
+        self.raw
+    }
+
+    /// Return an immutable reference to the raw `drm_file` structure.
+    pub(super) fn file(&self) -> &bindings::drm_file {
+        unsafe { &*self.raw }
+    }
+
+    /// Return a pinned reference to the driver file structure.
+    pub fn inner(&self) -> Pin<&T> {
+        unsafe { Pin::new_unchecked(&*(self.file().driver_priv as *const T)) }
+    }
+}
+
+impl<T: DriverFile> crate::private::Sealed for File<T> {}
+
+/// Generic trait to allow users that don't care about driver specifics to accept any File<T>.
+///
+/// # Safety
+/// Must only be implemented for File<T> and return the pointer, following the normal invariants
+/// of that type.
+pub unsafe trait GenericFile: crate::private::Sealed {
+    /// Returns the raw const pointer to the `struct drm_file`
+    fn raw(&self) -> *const bindings::drm_file;
+    /// Returns the raw mut pointer to the `struct drm_file`
+    fn raw_mut(&mut self) -> *mut bindings::drm_file;
+}
+
+unsafe impl<T: DriverFile> GenericFile for File<T> {
+    fn raw(&self) -> *const bindings::drm_file {
+        self.raw
+    }
+    fn raw_mut(&mut self) -> *mut bindings::drm_file {
+        self.raw
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 69376b3c6db9..a767942d0b52 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -4,4 +4,5 @@
 
 pub mod device;
 pub mod drv;
+pub mod file;
 pub mod ioctl;
-- 
2.45.1

