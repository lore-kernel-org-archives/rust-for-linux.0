Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DED179958
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 23:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718753620; cv=none; b=F2wxsgXxT7sTNOss/js2h5M5MD+ZM9cH6bASv8v1qZsNxyL8kxMnDqpbuu/Hddm518UTQ3lWV8Iccj1/3e4eGxaRfl8Dkhcuu/KAUW083qbm84+hW8Cuo8aFX4RtI0UrYA7ak2wnWLDyWXHkUgLKu50mGtcUufyQQFwh9XrA1yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718753620; c=relaxed/simple;
	bh=Qy1SOCWxCtWn2K7edCK8ERJu6rKtefmYAi+H31Ps+II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZvByq+eThkX8OEGDPCf2f8zQ2C9rqJ6mDORmHeo8euuMXonnPFG4LAyxI08FzlyOpQWNcdZEniEtw4Chjeg2cNwSWogYa/anxHFed6LjyA36molTgCY+/2edXkpi+eA04KvsMt6kKO+9K+jsS4/hHSlvRGYYi273Y2Vqi29TbRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WYoNoso8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WYoNoso8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718753617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=obJyXXAVcaAbFJ331A/wtDb1/j3AHwLA/7WRRWI8afk=;
	b=WYoNoso8Vg2HztG1a6FBkkVND2vCzQB/M7SG/FsstRJwynDBIRKccTs3+gqTYr6lteto1x
	wyI0pv2SSGpoCvf0SdAsg1eMWWfvJAquoGfsUhpx2qwgikbbyjlKO3crfTfNvHZwfKk7/J
	i8K+v07baLnhEkb98iot6v2a0W3rRdM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-0ZkHjvadOTKCSfu85ZI5Iw-1; Tue, 18 Jun 2024 19:33:36 -0400
X-MC-Unique: 0ZkHjvadOTKCSfu85ZI5Iw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3607f828e4aso3034790f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 16:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718753615; x=1719358415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obJyXXAVcaAbFJ331A/wtDb1/j3AHwLA/7WRRWI8afk=;
        b=LsDx6zEW2CNPLi6Wh6D7o3W0rdF6J2OfAeMhwb1JxZQ0c8Y//Hqy8bXjiD1FeHG5hr
         xDVMMSsYM98+CqkEIhyZZemYprN38YTMilfQNoaokE5Yza2MdHyxhZDuXv4a3J9XcuM4
         z+Fxt3KyQq8+ougBEq47YL8rwnbiavZ1blqrqC0E9YZ+/Hj+3tJjPjL49fJFlbIeUrCX
         RRgWcx09w2uKjk9WYk4ylvwpo+C+nf1W9zBKF96iEboPr6xqaJL6RCluOnlY0sMbUyz+
         aenvzFNfmEJH3+ADP+kAkpeiDzcdScUCZhbODdspIE6O7Zg7jbFX+z3/Ei4TFxvt28xT
         r4Fw==
X-Gm-Message-State: AOJu0Yxz0rZH83EQ3kVpgmHHtu6EGmviM+EkPp/A0nhd/JOHIXn3RHGq
	Ysr0+Dlsa/iqSe8KSIluHeUoAV6qzEXYKhHztg2Sf2bMh9FjqzbenqJo8tZmoRtpIl2Nc18lBsW
	Z2z7z6fAoeorfys5ma5JXZheZKrp+kbpj/OZxWp2HOr92PbZ3QGSF0JR/xevmwOsR
X-Received: by 2002:adf:ce09:0:b0:35f:2550:e276 with SMTP id ffacd0b85a97d-363170ec9d7mr777233f8f.5.1718753614996;
        Tue, 18 Jun 2024 16:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYUfo2Ka2AYhDwkxH+dpmBaWjyMjCyrkVtQn7VmKBKYqCYpMpPvBQdMLZK8GgnIq+h4zKYAg==
X-Received: by 2002:adf:ce09:0:b0:35f:2550:e276 with SMTP id ffacd0b85a97d-363170ec9d7mr777210f8f.5.1718753614529;
        Tue, 18 Jun 2024 16:33:34 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3635077a4c9sm467790f8f.96.2024.06.18.16.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 16:33:34 -0700 (PDT)
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
Subject: [PATCH v2 1/8] rust: drm: ioctl: Add DRM ioctl abstraction
Date: Wed, 19 Jun 2024 01:31:37 +0200
Message-ID: <20240618233324.14217-2-dakr@redhat.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Asahi Lina <lina@asahilina.net>

DRM drivers need to be able to declare which driver-specific ioctls they
support. Add an abstraction implementing the required types and a helper
macro to generate the ioctl definition inside the DRM driver.

Note that this macro is not usable until further bits of the abstraction
are in place (but it will not fail to compile on its own, if not called).

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/drm/ioctl.rs        | 153 ++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   5 ++
 rust/kernel/lib.rs              |   2 +
 rust/uapi/uapi_helper.h         |   1 +
 5 files changed, 162 insertions(+)
 create mode 100644 rust/kernel/drm/ioctl.rs
 create mode 100644 rust/kernel/drm/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 30ad2a0e22d7..ed25b686748e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -6,6 +6,7 @@
  * Sorted alphabetically.
  */
 
+#include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
new file mode 100644
index 000000000000..09ca7a8e7583
--- /dev/null
+++ b/rust/kernel/drm/ioctl.rs
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+#![allow(non_snake_case)]
+
+//! DRM IOCTL definitions.
+//!
+//! C header: [`include/linux/drm/drm_ioctl.h`](srctree/include/linux/drm/drm_ioctl.h)
+
+use crate::ioctl;
+
+const BASE: u32 = uapi::DRM_IOCTL_BASE as u32;
+
+/// Construct a DRM ioctl number with no argument.
+#[inline(always)]
+pub const fn IO(nr: u32) -> u32 {
+    ioctl::_IO(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a read-only argument.
+#[inline(always)]
+pub const fn IOR<T>(nr: u32) -> u32 {
+    ioctl::_IOR::<T>(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a write-only argument.
+#[inline(always)]
+pub const fn IOW<T>(nr: u32) -> u32 {
+    ioctl::_IOW::<T>(BASE, nr)
+}
+
+/// Construct a DRM ioctl number with a read-write argument.
+#[inline(always)]
+pub const fn IOWR<T>(nr: u32) -> u32 {
+    ioctl::_IOWR::<T>(BASE, nr)
+}
+
+/// Descriptor type for DRM ioctls. Use the `declare_drm_ioctls!{}` macro to construct them.
+pub type DrmIoctlDescriptor = bindings::drm_ioctl_desc;
+
+/// This is for ioctl which are used for rendering, and require that the file descriptor is either
+/// for a render node, or if it’s a legacy/primary node, then it must be authenticated.
+pub const AUTH: u32 = bindings::drm_ioctl_flags_DRM_AUTH;
+
+/// This must be set for any ioctl which can change the modeset or display state. Userspace must
+/// call the ioctl through a primary node, while it is the active master.
+///
+/// Note that read-only modeset ioctl can also be called by unauthenticated clients, or when a
+/// master is not the currently active one.
+pub const MASTER: u32 = bindings::drm_ioctl_flags_DRM_MASTER;
+
+/// Anything that could potentially wreak a master file descriptor needs to have this flag set.
+///
+/// Current that’s only for the SETMASTER and DROPMASTER ioctl, which e.g. logind can call to
+/// force a non-behaving master (display compositor) into compliance.
+///
+/// This is equivalent to callers with the SYSADMIN capability.
+pub const ROOT_ONLY: u32 = bindings::drm_ioctl_flags_DRM_ROOT_ONLY;
+
+/// This is used for all ioctl needed for rendering only, for drivers which support render nodes.
+/// This should be all new render drivers, and hence it should be always set for any ioctl with
+/// `AUTH` set. Note though that read-only query ioctl might have this set, but have not set
+/// DRM_AUTH because they do not require authentication.
+pub const RENDER_ALLOW: u32 = bindings::drm_ioctl_flags_DRM_RENDER_ALLOW;
+
+/// Internal structures used by the `declare_drm_ioctls!{}` macro. Do not use directly.
+#[doc(hidden)]
+pub mod internal {
+    pub use bindings::drm_device;
+    pub use bindings::drm_file;
+    pub use bindings::drm_ioctl_desc;
+}
+
+/// Declare the DRM ioctls for a driver.
+///
+/// Each entry in the list should have the form:
+///
+/// `(ioctl_number, argument_type, flags, user_callback),`
+///
+/// `argument_type` is the type name within the `bindings` crate.
+/// `user_callback` should have the following prototype:
+///
+/// ```ignore
+/// fn foo(device: &kernel::drm::device::Device<Self>,
+///        data: &mut bindings::argument_type,
+///        file: &kernel::drm::file::File<Self::File>,
+/// )
+/// ```
+/// where `Self` is the drm::drv::Driver implementation these ioctls are being declared within.
+///
+/// # Examples
+///
+/// ```ignore
+/// kernel::declare_drm_ioctls! {
+///     (FOO_GET_PARAM, drm_foo_get_param, ioctl::RENDER_ALLOW, my_get_param_handler),
+/// }
+/// ```
+///
+#[macro_export]
+macro_rules! declare_drm_ioctls {
+    ( $(($cmd:ident, $struct:ident, $flags:expr, $func:expr)),* $(,)? ) => {
+        const IOCTLS: &'static [$crate::drm::ioctl::DrmIoctlDescriptor] = {
+            use $crate::uapi::*;
+            const _:() = {
+                let i: u32 = $crate::uapi::DRM_COMMAND_BASE;
+                // Assert that all the IOCTLs are in the right order and there are no gaps,
+                // and that the sizeof of the specified type is correct.
+                $(
+                    let cmd: u32 = $crate::macros::concat_idents!(DRM_IOCTL_, $cmd);
+                    ::core::assert!(i == $crate::ioctl::_IOC_NR(cmd));
+                    ::core::assert!(core::mem::size_of::<$crate::uapi::$struct>() ==
+                                    $crate::ioctl::_IOC_SIZE(cmd));
+                    let i: u32 = i + 1;
+                )*
+            };
+
+            let ioctls = &[$(
+                $crate::drm::ioctl::internal::drm_ioctl_desc {
+                    cmd: $crate::macros::concat_idents!(DRM_IOCTL_, $cmd) as u32,
+                    func: {
+                        #[allow(non_snake_case)]
+                        unsafe extern "C" fn $cmd(
+                                raw_dev: *mut $crate::drm::ioctl::internal::drm_device,
+                                raw_data: *mut ::core::ffi::c_void,
+                                raw_file_priv: *mut $crate::drm::ioctl::internal::drm_file,
+                        ) -> core::ffi::c_int {
+                            // SAFETY: The DRM core ensures the device lives while callbacks are
+                            // being called.
+                            //
+                            // FIXME: Currently there is nothing enforcing that the types of the
+                            // dev/file match the current driver these ioctls are being declared
+                            // for, and it's not clear how to enforce this within the type system.
+                            let dev = $crate::drm::device::Device::borrow(raw_dev);
+                            // SAFETY: This is just the ioctl argument, which hopefully has the
+                            // right type (we've done our best checking the size).
+                            let data = unsafe { &mut *(raw_data as *mut $crate::uapi::$struct) };
+                            // SAFETY: This is just the DRM file structure
+                            let file = unsafe { $crate::drm::file::File::from_raw(raw_file_priv) };
+
+                            match $func(dev, data, &file) {
+                                Err(e) => e.to_errno(),
+                                Ok(i) => i.try_into()
+                                            .unwrap_or($crate::error::code::ERANGE.to_errno()),
+                            }
+                        }
+                        Some($cmd)
+                    },
+                    flags: $flags,
+                    name: $crate::c_str!(::core::stringify!($cmd)).as_char_ptr(),
+                }
+            ),*];
+            ioctls
+        };
+    };
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
new file mode 100644
index 000000000000..9ec6d7cbcaf3
--- /dev/null
+++ b/rust/kernel/drm/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM subsystem abstractions.
+
+pub mod ioctl;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 4a02946dbbd9..5a68b9a5fe03 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -33,6 +33,8 @@
 pub mod device_id;
 pub mod devres;
 pub mod driver;
+#[cfg(CONFIG_DRM = "y")]
+pub mod drm;
 pub mod error;
 #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
 pub mod firmware;
diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 08f5e9334c9e..ed42a456da2e 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -7,5 +7,6 @@
  */
 
 #include <uapi/asm-generic/ioctl.h>
+#include <uapi/drm/drm.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>
-- 
2.45.1

