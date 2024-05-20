Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA844C8E
	for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 17:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716225682; cv=none; b=Nj1fVW/kgEk/9N+x2yCMYcsd5dRAYMNQLxDsLLzxnofRE7FSQssTwGWGrIg70aquqHNTZRUtUH68qjhOJuYZ5DGcUkrHBYMZ3LmNC5krCSo1rqUPCI1ATFes0liBXI8Rd0+N3vZf4oYWmbTmij6F0iCycW/VcNjiU2DCmLO3/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716225682; c=relaxed/simple;
	bh=PEqxqwDXs2LhlHsVsJH42XzNARdGm9ILnmzM/mCn1FI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cU9ShWDRfsGX0DXj2S2h+emndBMOJjKA68Up7G7XW4vTFP7kCv7RKWvGZq1/GwLdCucDIEprsJp8gqJTEP2hOeyI4SwS63FpOXJUCl/ITjcMhZnZRoGxJfDK/v7dSWc4emIh6EMesL7HSDl7Xr/04CFMUj9CIcUKnXTr91oEGkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PpfLqUu/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PpfLqUu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716225679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yDyFo5QAsShU2UXMrrT4xAbvXT6OnwazMreT8PcbZM=;
	b=PpfLqUu/pZ2J2Ad4Wy1aQVOXwBpYSbCcpJ2st25dWFzoIZc7mf54DJYlE6mVI5ZdYXZXbm
	kNij2GeOivMVsGW0Z+X0sULCDh5a42bqpPahIICSQGMbOzQ9Q1iQS/sQUzA7Frfafc8D3p
	+dxSf4Ge6i5I3t4XnICThTNNwgKPjmc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-3NrzwVAmN4KFHwig8MzT5g-1; Mon, 20 May 2024 13:21:18 -0400
X-MC-Unique: 3NrzwVAmN4KFHwig8MzT5g-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42015260835so39329245e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 May 2024 10:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716225676; x=1716830476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yDyFo5QAsShU2UXMrrT4xAbvXT6OnwazMreT8PcbZM=;
        b=vkadfkr4GZ1ozKS5+5dq22vcvejVAUf0oDqeeImoHw1C8JMcKJJ/vrfs6c5uX4qnjs
         Hz61WoXP1007WbMgPYUcq5epEhFw9TQu762eK1Wr+hFou75CqkZAvPgaTP5vATcGpTca
         pytUx9ATYj10qdZGnGZvbZGGs9dDteWwBa40XgkKpZg5B4CM/MXYrKsFTEO6dMSA704A
         FmB6B8/gknC082pyqmpw8qfM4kLqprsp7uoe53NhY5xbirkaEud/9IxyfpCYTCRsvmst
         O8nv6VxIc4W3unAI7RGDL1rAsx5i1rnJmqZyTRhgW00C6MtF5ex5eX+rA98pklS/iipx
         rJJA==
X-Gm-Message-State: AOJu0Yxdi6JJGUdQtneOJ8qvANwUwlH/xo4BKtd7OUi0agWr5e/nqS3x
	NguB+h6bFAm9uAazmf+0pz7ILHM9LeOy+LJO6exT+r0JJHm2OmlPx9cBGQ5PBCE4tSf6eLlXL6l
	CnxLMjBvgOkyoHkJLtLK21NQSj2UynUCnfGAnW0DN2JZPmBThsXnRgVq6PgCdJMI+
X-Received: by 2002:a05:600c:4f42:b0:41b:a670:a9f1 with SMTP id 5b1f17b1804b1-41feaa2f409mr202751875e9.7.1716225675943;
        Mon, 20 May 2024 10:21:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfuWyiq6rqJZ4UVuzu/rSymC+StzNm4hbcpBUY0IqZsQhhXqZBG4ZtoNnNxU/lFlphDCd8rw==
X-Received: by 2002:a05:600c:4f42:b0:41b:a670:a9f1 with SMTP id 5b1f17b1804b1-41feaa2f409mr202751525e9.7.1716225675040;
        Mon, 20 May 2024 10:21:15 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88110f3esm466021575e9.29.2024.05.20.10.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 10:21:14 -0700 (PDT)
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
Subject: [RFC PATCH 1/8] rust: drm: ioctl: Add DRM ioctl abstraction
Date: Mon, 20 May 2024 19:20:48 +0200
Message-ID: <20240520172059.181256-2-dakr@redhat.com>
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
index 32221de16e57..14188034285a 100644
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
index 000000000000..79d720e9d18e
--- /dev/null
+++ b/rust/kernel/drm/ioctl.rs
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+#![allow(non_snake_case)]
+
+//! DRM IOCTL definitions.
+//!
+//! C header: [`include/linux/drm/drm_ioctl.h`](../../../../include/linux/drm/drm_ioctl.h)
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
+/// Internal structures used by the [`declare_drm_ioctls!{}`] macro. Do not use directly.
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
+/// ```
+/// fn foo(device: &kernel::drm::device::Device<Self>,
+///        data: &mut bindings::argument_type,
+///        file: &kernel::drm::file::File<Self::File>,
+/// )
+/// ```
+/// where `Self` is the drm::drv::Driver implementation these ioctls are being declared within.
+///
+/// # Examples
+///
+/// ```
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
index 15730deca822..cb0dd3d76729 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -32,6 +32,8 @@
 pub mod device;
 pub mod devres;
 pub mod driver;
+#[cfg(CONFIG_DRM = "y")]
+pub mod drm;
 pub mod error;
 pub mod init;
 pub mod ioctl;
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

