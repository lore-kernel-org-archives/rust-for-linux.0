Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611CF41C89
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 23:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718753628; cv=none; b=hDRigmYdMQ6qTFwGh5pDPtPWKblRuMN54ccQZmKPGhPzWrWeUmbsf6fVox4ErBqwIGVVALSq5wdPubT6beXmk7bHQnHSEvLdCFhLhtDvhaflBoZwIfHxiVBAlounFbVXiB+LkXs/q/k4lJF+OvjRAweUJsMCOFak34RgdyCxeoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718753628; c=relaxed/simple;
	bh=ztLuyOvempZ9ASoO9F7sPZNkQEBL82YmK8/rUwoU1pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W8Gy1fLOQ70QUPT/Yiw4e/7y7Q/rYuOqQWvFhoCmSMn5zeD2L3dGl3/KV4afQB8vFMXmT247tB5F3Wd6ph9t5TVwgahjO9tnSaXff/QXlki1Z54gfui0SiIZPnH4kpe/H63kTqEyoyhTgK75ZYGmeA8dE77CrrH5E28kuGusAiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNBBcgXp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNBBcgXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718753625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jpXHd+jXOaH8DsZOi8XKN320BhvYlcEJISRJoUGPNMs=;
	b=gNBBcgXpHMLzt1ysT4SFsNBUV/nNRR1mbau8HIInTPwlUA5ebR1IUfL246nDY3n2X9xXka
	8u41nMiFKop6MhZIbDcPU/EnwJdHyxREAL8c4NCfPiDxu5GSfNN53YSZyfD/VOXTd7b98B
	hyjuLPhHa+NYds3Lu0OzSN+6ZuhgyMo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-hrWgvQmyP9qlMVgiMyQFdg-1; Tue, 18 Jun 2024 19:33:44 -0400
X-MC-Unique: hrWgvQmyP9qlMVgiMyQFdg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4217f941ca8so38917475e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 16:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718753623; x=1719358423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpXHd+jXOaH8DsZOi8XKN320BhvYlcEJISRJoUGPNMs=;
        b=fywoNMPTi4nuTF1a9Cy3u6XehuQTsAsKJlOgEivpDEdN8padN8vNpXuLDf8NCz0sWe
         TAoKaOqSFaZk9ztGwdxWI2+kqH92dMiLQ7NQtnEnIma0srQm0+tdDeeNwOHohKMPp7zp
         KRG7IvYOuj8wuNpbJsSUWwiz66olZpDxHmuqYKv8V2kAdgjJs8znTFHDkR34KBzdyKjt
         2QLFnGX8qYlk9VMUI14F9Ivt8WkznIhNRX+2xWK6sliUayh1CCZvnyo0KhByLdXLjeRZ
         ZtppkNwGmh8SesS1O3rRvM1SFqahG0XvfJTJRkc/Ijk4Ru5W+ai5160bW6WzcaURQbME
         29aA==
X-Gm-Message-State: AOJu0YyLvo8gTShdcL7s4FQ5Qa8lWM7CjLLBGGtM5yp0e+NxPfwkvaRQ
	i2NRZw3B+gojfeDZOpii7VLL50ZQOso8uIrywtkd8AFXQMPzisMdPe4tV2bL2aQRED75Q4nkbj5
	+1U5KuGiH17e6goaEhMqlwUGDZtH72ZFXiCCkyda/wsuXk03bXZ4r7ehPZS36j8tB
X-Received: by 2002:a7b:c31a:0:b0:421:f68f:a144 with SMTP id 5b1f17b1804b1-4247529c55emr5095035e9.36.1718753622773;
        Tue, 18 Jun 2024 16:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK+B+d6Q+UBC0SuUD/NJqwziXMqMYTgFshtNZO9KMt8w0uzmrD33Wu68wj0NfFBPKPshI+mA==
X-Received: by 2002:a7b:c31a:0:b0:421:f68f:a144 with SMTP id 5b1f17b1804b1-4247529c55emr5094835e9.36.1718753622457;
        Tue, 18 Jun 2024 16:33:42 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36087457258sm10773875f8f.89.2024.06.18.16.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 16:33:42 -0700 (PDT)
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
Subject: [PATCH v2 3/8] rust: drm: add driver abstractions
Date: Wed, 19 Jun 2024 01:31:39 +0200
Message-ID: <20240618233324.14217-4-dakr@redhat.com>
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

Implement the DRM driver abstractions.

The `Driver` trait provides the interface to the actual driver to fill
in the driver specific data, such as the `DriverInfo`, driver features
and IOCTLs.

Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/drv.rs          | 141 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 3 files changed, 143 insertions(+)
 create mode 100644 rust/kernel/drm/drv.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ed25b686748e..dc19cb789536 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/errname.h>
diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
new file mode 100644
index 000000000000..cd594a32f9e4
--- /dev/null
+++ b/rust/kernel/drm/drv.rs
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM driver core.
+//!
+//! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
+
+use crate::{bindings, drm, private::Sealed, str::CStr, types::ForeignOwnable};
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
+/// Driver supports compute acceleration devices. This flag is mutually exclusive with `FEAT_RENDER`
+/// and `FEAT_MODESET`. Devices that support both graphics and compute acceleration should be
+/// handled by two drivers that are connected using auxiliary bus.
+pub const FEAT_COMPUTE_ACCEL: u32 = bindings::drm_driver_feature_DRIVER_COMPUTE_ACCEL;
+/// Driver supports user defined GPU VA bindings for GEM objects.
+pub const FEAT_GEM_GPUVA: u32 = bindings::drm_driver_feature_DRIVER_GEM_GPUVA;
+/// Driver supports and requires cursor hotspot information in the cursor plane (e.g. cursor plane
+/// has to actually track the mouse cursor and the clients are required to set hotspot in order for
+/// the cursor planes to work correctly).
+pub const FEAT_CURSOR_HOTSPOT: u32 = bindings::drm_driver_feature_DRIVER_CURSOR_HOTSPOT;
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
+/// The DRM `Driver` trait.
+///
+/// This trait must be implemented by drivers in order to create a `struct drm_device` and `struct
+/// drm_driver` to be registered in the DRM subsystem.
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
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 9ec6d7cbcaf3..d987c56b3cec 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,4 +2,5 @@
 
 //! DRM subsystem abstractions.
 
+pub mod drv;
 pub mod ioctl;
-- 
2.45.1

