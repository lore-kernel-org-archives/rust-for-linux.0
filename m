Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC35377F15
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718725739; cv=none; b=n2fg3/aGz4HBso5/7SKycPMf6n3QbSiThrV7gtGDScv++C+rLTrXz2GCs04evE55VFP5a+9fmHH6LBxEzWc0H7CvnSB+h6m/V7Oh5/j9ug8T/NKGBifC3F2OZ3YlBek6SBIJNDKTc3f3rXcdednVBO6n1+7b/8THpVLW+dEa5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718725739; c=relaxed/simple;
	bh=uKdkar9T+buQ+rgXRjYk96RQ1pLgLS/s5OH1+LEQGf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=brJ6JAgUN8OBu9qF4zESn5pL0sKHFEUT5y5BZb4wHJUU3RVjh5ZXFUcnUG8pYSgwfjMk3Cn4pMgCM2Q4q9PZODtrIcF/xEk38TN5LdnVB9TRAiQE7jmnOQ71XafNSfDRQqsSg4ragGeUZMnO7z9pdoUlPSRupBBh1em3mpqHpGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZniwUPCY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZniwUPCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718725736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbhl14xAYy/a54hqQydSy+Qa7m2sEEE4gFOceKt9vSQ=;
	b=ZniwUPCYRmP9vY7XRS1jwd+tVpjvjoO6h8TZUnn+Vb3aZY/2lf55v+3kBwbeTtpK8RkxH4
	ChC0TFYlTBOj5bMlDByvMmgaykHbGwYtkYwUserL8RzlGPujweSofxL5ng3rS93e+/Cfhc
	FdEbnXteSs/egFdvaxaRfkTwPF1zD9Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-t9MK-qxdM9ijXohVAoWtVg-1; Tue, 18 Jun 2024 11:48:53 -0400
X-MC-Unique: t9MK-qxdM9ijXohVAoWtVg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-35f1230659bso4005471f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Jun 2024 08:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718725732; x=1719330532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbhl14xAYy/a54hqQydSy+Qa7m2sEEE4gFOceKt9vSQ=;
        b=PjiKqGPkB28sQIJw3Wbqh8IbyMMSchVnBktD+zg4tJO5zl4Zj5tuMeOF4m/5pU72i0
         afRu57jFtf/yeXCc2dceWRQX4q0NVnkqAswYD6duYxMxEyDDhmFUvm0lSSxuaGGXloey
         AFrqZpRBSlXhp3ji0tgKMNOTTfzn2L8IbNfNJ8Ka7x/ion79sp2iGat5iGMTaM4re6MI
         EsXdyT2LZbfygikZ/lvD3okMh5rvrgLRyU+kq35SgCUV+ubSyGu/2IEe1WnnPmM3xT7b
         jeMM6+0ylPn8vZ4V3eCWS84Gdrv3q1jFIuFnqPe4c/FxFw2BhVEnRyTschadDDvoCADL
         47zg==
X-Gm-Message-State: AOJu0Yx8kziIB57pCVY7WNoh2kUP3C0/jz7NRkwabzkfFeycVsv73TM/
	6IdCDbE0rMCrFX5UMSedzol9tldGXpquLndKjdyDQS/QuFKHk9PycpkoMrx/t6asaU8qe5m8Zkb
	7+krbfjSWfEWm5pAMtu5X6krzjPZ2rWZWxPn9FUu5ugMNbchuy4gRHQRtauSOif68
X-Received: by 2002:a5d:66ce:0:b0:362:a876:6cc2 with SMTP id ffacd0b85a97d-362a8766e14mr643430f8f.6.1718725732389;
        Tue, 18 Jun 2024 08:48:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdnbO11plzCAF10UelkIXmaa6jQbyBCnK6b7JzS6IBKVhFwAgOmsi2cQG5eQ/M+V5rPjuZ6Q==
X-Received: by 2002:a5d:66ce:0:b0:362:a876:6cc2 with SMTP id ffacd0b85a97d-362a8766e14mr643420f8f.6.1718725732039;
        Tue, 18 Jun 2024 08:48:52 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-362231c7ec0sm1497197f8f.29.2024.06.18.08.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 08:48:51 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	mcgrof@kernel.org,
	russ.weight@linux.dev,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	fujita.tomonori@gmail.com,
	pstanner@redhat.com,
	ajanulgu@redhat.com,
	lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v4 2/2] rust: add firmware abstractions
Date: Tue, 18 Jun 2024 17:48:35 +0200
Message-ID: <20240618154841.6716-3-dakr@redhat.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240618154841.6716-1-dakr@redhat.com>
References: <20240618154841.6716-1-dakr@redhat.com>
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

Add an abstraction around the kernels firmware API to request firmware
images. The abstraction provides functions to access the firmware's size
and backing buffer.

The firmware is released once the abstraction instance is dropped.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/base/firmware_loader/Kconfig |   7 ++
 rust/bindings/bindings_helper.h      |   1 +
 rust/kernel/firmware.rs              | 101 +++++++++++++++++++++++++++
 rust/kernel/lib.rs                   |   2 +
 4 files changed, 111 insertions(+)
 create mode 100644 rust/kernel/firmware.rs

diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmware_loader/Kconfig
index 5ca00e02fe82..a03701674265 100644
--- a/drivers/base/firmware_loader/Kconfig
+++ b/drivers/base/firmware_loader/Kconfig
@@ -37,6 +37,13 @@ config FW_LOADER_DEBUG
 	  SHA256 checksums to the kernel log for each firmware file that is
 	  loaded.
 
+config RUST_FW_LOADER_ABSTRACTIONS
+	bool "Rust Firmware Loader abstractions"
+	depends on RUST
+	depends on FW_LOADER=y
+	help
+	  This enables the Rust abstractions for the firmware loader API.
+
 if FW_LOADER
 
 config FW_LOADER_PAGED_BUF
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ddb5644d4fd9..18a3f05115cb 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -9,6 +9,7 @@
 #include <kunit/test.h>
 #include <linux/errname.h>
 #include <linux/ethtool.h>
+#include <linux/firmware.h>
 #include <linux/jiffies.h>
 #include <linux/mdio.h>
 #include <linux/phy.h>
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
new file mode 100644
index 000000000000..b55ea1b45368
--- /dev/null
+++ b/rust/kernel/firmware.rs
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Firmware abstraction
+//!
+//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h")
+
+use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
+use core::ptr::NonNull;
+
+// One of the following: `bindings::request_firmware`, `bindings::firmware_request_nowarn`,
+// `firmware_request_platform`, `bindings::request_firmware_direct`
+type FwFunc =
+    unsafe extern "C" fn(*mut *const bindings::firmware, *const i8, *mut bindings::device) -> i32;
+
+/// Abstraction around a C `struct firmware`.
+///
+/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
+/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
+/// `&[u8]`. The firmware is released once [`Firmware`] is dropped.
+///
+/// # Invariants
+///
+/// The pointer is valid, and has ownership over the instance of `struct firmware`.
+///
+/// Once requested, the `Firmware` backing buffer is not modified until it is freed when `Firmware`
+/// is dropped.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::{c_str, device::Device, firmware::Firmware};
+///
+/// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
+/// # let dev = unsafe { Device::from_raw(core::ptr::null_mut()) };
+///
+/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev).unwrap();
+/// let blob = fw.data();
+/// ```
+pub struct Firmware(NonNull<bindings::firmware>);
+
+impl Firmware {
+    fn request_internal(name: &CStr, dev: &Device, func: FwFunc) -> Result<Self> {
+        let mut fw: *mut bindings::firmware = core::ptr::null_mut();
+        let pfw: *mut *mut bindings::firmware = &mut fw;
+
+        // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
+        // `name` and `dev` are valid as by their type invariants.
+        let ret = unsafe { func(pfw as _, name.as_char_ptr(), dev.as_raw()) };
+        if ret != 0 {
+            return Err(Error::from_errno(ret));
+        }
+
+        // SAFETY: `func` not bailing out with a non-zero error code, guarantees that `fw` is a
+        // valid pointer to `bindings::firmware`.
+        Ok(Firmware(unsafe { NonNull::new_unchecked(fw) }))
+    }
+
+    /// Send a firmware request and wait for it. See also `bindings::request_firmware`.
+    pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
+        Self::request_internal(name, dev, bindings::request_firmware)
+    }
+
+    /// Send a request for an optional firmware module. See also
+    /// `bindings::firmware_request_nowarn`.
+    pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self> {
+        Self::request_internal(name, dev, bindings::firmware_request_nowarn)
+    }
+
+    fn as_raw(&self) -> *mut bindings::firmware {
+        self.0.as_ptr()
+    }
+
+    /// Returns the size of the requested firmware in bytes.
+    pub fn size(&self) -> usize {
+        // SAFETY: Safe by the type invariant.
+        unsafe { (*self.as_raw()).size }
+    }
+
+    /// Returns the requested firmware as `&[u8]`.
+    pub fn data(&self) -> &[u8] {
+        // SAFETY: Safe by the type invariant. Additionally, `bindings::firmware` guarantees, if
+        // successfully requested, that `bindings::firmware::data` has a size of
+        // `bindings::firmware::size` bytes.
+        unsafe { core::slice::from_raw_parts((*self.as_raw()).data, self.size()) }
+    }
+}
+
+impl Drop for Firmware {
+    fn drop(&mut self) {
+        // SAFETY: Safe by the type invariant.
+        unsafe { bindings::release_firmware(self.as_raw()) };
+    }
+}
+
+// SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, which is safe to be used from
+// any thread.
+unsafe impl Send for Firmware {}
+
+// SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, references to which are safe to
+// be used from any thread.
+unsafe impl Sync for Firmware {}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index dd1207f1a873..7707cb013ce9 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -30,6 +30,8 @@
 mod build_assert;
 pub mod device;
 pub mod error;
+#[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
+pub mod firmware;
 pub mod init;
 pub mod ioctl;
 #[cfg(CONFIG_KUNIT)]
-- 
2.45.1

