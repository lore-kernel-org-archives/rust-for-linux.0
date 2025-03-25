Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5F819DFB4
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Mar 2025 23:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742946970; cv=none; b=fE4MLKcBfTlZiW9iwDaXqZuryO+bverOiElIvR6MSEPz4jNFdcqee/Cvz3qGeAlgHNNc5Xj/uaASr8ok+ICX0cqjqIjW87oiemkmQ3hYRE/8l5TifFitbMTFKuSg6mQV7aOg8zOT0+Ljtv4ccxodlWewAstnBphzq6prPEZw5d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742946970; c=relaxed/simple;
	bh=urZ19F0FqcMUQbVUhk02uC2JrDOanxAGiZ3NASF7P2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+BNCnqmDR3vADq6UTpiiGWPdWhqSRAHaqsAjJAqz+WauytV6DIoPeqsmyYHoQkgIuyDHEM7WDmf5nnQ7kLnqANrVw5ZP34hPLdIT741zVWbT5Kp48cJ3CBe+iBiPyh1otSSzYyhVO+tS8AoWQMjtBpzYIabvy7Ma7rQCS/OqXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5TJEpvD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5TJEpvD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053DCC4CEED;
	Tue, 25 Mar 2025 23:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742946970;
	bh=urZ19F0FqcMUQbVUhk02uC2JrDOanxAGiZ3NASF7P2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P5TJEpvDvo9dPTvU+ICoIML4rbVTcuuVmnoUZM6b0Is1aH+4oj2NAI2XGgUyCXg95
	 ZqbQzAyNEKDiJdF6PRAVq70t+JxZ3EmWGwvG/zedB4tH6SBDuc7GXSCnekYXJz6B+V
	 5WVoGus7/yWVU7rPQrkKInsEjy12ulIx6QXB39SY0i1HOK7grzl8MGGQZ5ewbr/Ak9
	 w5uA0f67wmuNOat1q3FxNdaKpO9PErjTHmW1xg8tKBnpknVE0SEiXFvT+5maZ0rqxe
	 Bisa1krqE2n6dkwzF92RFnOsRapGhu9tkagHdArHS2G7Ltk5Ria5xmbcgRi2i3hSSt
	 m2euAL/6E/feQ==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	lyude@redhat.com,
	acurrid@nvidia.com,
	lina@asahilina.net,
	daniel.almeida@collabora.com,
	j@jannau.net
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/8] rust: drm: add driver abstractions
Date: Wed, 26 Mar 2025 00:54:30 +0100
Message-ID: <20250325235522.3992-4-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325235522.3992-1-dakr@kernel.org>
References: <20250325235522.3992-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the DRM driver abstractions.

The `Driver` trait provides the interface to the actual driver to fill
in the driver specific data, such as the `DriverInfo`, driver features
and IOCTLs.

Co-developed-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/driver.rs       | 143 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   8 ++
 3 files changed, 152 insertions(+)
 create mode 100644 rust/kernel/drm/driver.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b25ea9fe1663..a6be6dc80249 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
new file mode 100644
index 000000000000..1ac770482ae0
--- /dev/null
+++ b/rust/kernel/drm/driver.rs
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM driver core.
+//!
+//! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
+
+use crate::{bindings, drm, str::CStr};
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
+    #[expect(unused)]
+    pub(crate) gem_create_object: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            size: usize,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    #[expect(unused)]
+    pub(crate) prime_handle_to_fd: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            handle: u32,
+            flags: u32,
+            prime_fd: *mut core::ffi::c_int,
+        ) -> core::ffi::c_int,
+    >,
+    #[expect(unused)]
+    pub(crate) prime_fd_to_handle: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            file_priv: *mut bindings::drm_file,
+            prime_fd: core::ffi::c_int,
+            handle: *mut u32,
+        ) -> core::ffi::c_int,
+    >,
+    #[expect(unused)]
+    pub(crate) gem_prime_import: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            dma_buf: *mut bindings::dma_buf,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    #[expect(unused)]
+    pub(crate) gem_prime_import_sg_table: Option<
+        unsafe extern "C" fn(
+            dev: *mut bindings::drm_device,
+            attach: *mut bindings::dma_buf_attachment,
+            sgt: *mut bindings::sg_table,
+        ) -> *mut bindings::drm_gem_object,
+    >,
+    #[expect(unused)]
+    pub(crate) dumb_create: Option<
+        unsafe extern "C" fn(
+            file_priv: *mut bindings::drm_file,
+            dev: *mut bindings::drm_device,
+            args: *mut bindings::drm_mode_create_dumb,
+        ) -> core::ffi::c_int,
+    >,
+    #[expect(unused)]
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
+pub trait AllocImpl: super::private::Sealed {
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
+    type Data: Sync + Send;
+
+    /// The type used to manage memory for this driver.
+    ///
+    /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
+    type Object: AllocImpl;
+
+    /// Driver metadata
+    const INFO: DriverInfo;
+
+    /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
+    const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 9ec6d7cbcaf3..2e3f9a8a9353 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -2,4 +2,12 @@
 
 //! DRM subsystem abstractions.
 
+pub mod driver;
 pub mod ioctl;
+
+pub use self::driver::Driver;
+pub use self::driver::DriverInfo;
+
+pub(crate) mod private {
+    pub trait Sealed {}
+}
-- 
2.49.0

