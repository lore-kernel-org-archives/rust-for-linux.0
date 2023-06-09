Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CB9C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238554AbjFIGyT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238493AbjFIGyL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:11 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8A930C3
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=7648; q=dns/txt; s=iport;
  t=1686293649; x=1687503249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eF4y4Rt/didPRPrUHD2709Y5kpLzRij6ZqVylErBV/I=;
  b=Hro/cn1J3iHOBxYGF0kNt5fVLlxH86f6qvm4S/jXJ5xAVCXEPR10pCYs
   hsPlDRefHQcUzaJZtBqPM3NNIeAfXU+qfH0J9fSJJYd6tvKTlwiwj+bxy
   7kmp9EOdmx/ndH4bK/LlLWz0B8XjF/PvK+oscHEnBnUQBD+6DYJXmE/uD
   s=;
X-CSE-ConnectionGUID: SY2KkLtmRaiGYDuP7G+TKQ==
X-CSE-MsgGUID: oSESNd5ATxSwt5fogk4BIA==
X-IPAS-Result: =?us-ascii?q?A0AlAAA2xoJk/xbLJq1aHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBgkcBIDtVLhJHjG5fiFIDknyKb4ElA1YPAQEBDQEBLgMTBAEBhQYCh?=
 =?us-ascii?q?XUmNAkOAQIEAQEBAQMCAwEBAQEBAQECAQEFAQEBAgEHBIEKE4VoDYYFBicLA?=
 =?us-ascii?q?UYQIDFXGYJ+AYIYRAOtGYF5M4EBgmKCE5prgWiBQgGMFYVKQoFJRIEVgTyCL?=
 =?us-ascii?q?YpkIgSJHYUSjyiBKW+BHjlpfwIJAhFngQoIXIFzQAINVAsLY4EdglUCAhE8F?=
 =?us-ascii?q?FJiGR0DBwQCgQUQLwcEMigGCRgvJwZTBxcWJAkTFUIEg1kKgRBAFQ4RglwqA?=
 =?us-ascii?q?gc2bwMJAwcFSUADCxgNSBEsNRQfBkOBBxdjgXwkJJ5Gglk0exMBCoE6Bw8rK?=
 =?us-ascii?q?xsSGJJmCjKOU4IVoCqEEot8lQQaM4VXo36YFpZFjRiELwIEBgUCFoFjPDmBI?=
 =?us-ascii?q?DMaCBsVgyIJSRkPkTaFL4FEiWdBMTsCBwsBAQMJi0YBAQ?=
IronPort-Data: A9a23:xzkir6yhb+8RPIbqxBx6t+d2xyrEfRIJ4+MujC+fZmUNrF6WrkUBz
 2NKWj3VPq2PazehfYt0ao7g9UgB7JPQndJhTwU9/FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlpCCea/lH1bOiJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 YuaT/H3Ygf/gGYqajNMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE88jmSH
 rurIBmRpws1zj91Yj+Xuu+Tnn4iHtY+CTOzZk9+AMBOtPTtShsaic7XPNJEAateZq7gc9pZk
 L2hvrToIesl0zGldOk1C3Fl/y9C0aJuw46dAnubrcmpxkzpQlfx+6pBT30VBNhNkgp3KTkmG
 f0wIT0XKxuEne/znfSwS/JngYIoK8yD0IE34y47i2qJS6x+GtaZGc0m5vcAtNs0rslLHP3DY
 8MCQTFudx/HJRZIPz/7Dbphw7b52iSuG9FegFWuiJER7zX68BxKz6SwPt3aeYCgZOwAyy50o
 UqDpQwVGCoyK9GT0j2D+3yEiejIkif2HokVEdWQ7ONxnBidwXZWDBwQSEuTv/a0kAi9VshZJ
 khS/TAhxZXe72SiQ8O4XgW/umLBuBcAHdFRCOY9rgqKz8I4/jqkO4TNdRYZAPROiSP8bWVCO
 oOh9z8xOQFSjQ==
IronPort-HdrOrdr: A9a23:9n4oyayQfed2Wvs91PKCKrPwA71zdoMgy1knxilNoNJuHvBw8P
 re+MjzuiWbtN98YhsdcJW7Scq9qBDnhPtICPcqXItKNTOO0ACVxcNZnOnfKlbbdBEWmNQx6Y
 5QN4BjFdz9CkV7h87m7AT9L8wt27C8gceVbJ/lr0uEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:puGo22Crw/ZP2Tr6ExJWrm0XPtwgSHTc40b8PnfnJiVVa4TAHA==
X-Talos-MUID: 9a23:CQp3awrBy2+gBxZJkcgezzZZGfxO7/mHNFA2jolbtc6LNnBaGh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7799459"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:31:37 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VICu055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:36 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 02/80] rust: add ability to register a file system
Date:   Fri,  9 Jun 2023 09:30:00 +0300
Message-Id: <20230609063118.24852-3-amiculas@cisco.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609063118.24852-1-amiculas@cisco.com>
References: <20230609063118.24852-1-amiculas@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas
X-Outbound-SMTP-Client: 10.61.198.236, [10.61.198.236]
X-Outbound-Node: aer-core-5.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Wedson Almeida Filho <wedsonaf@google.com>

Also add sample that uses the new public API. The registered file system
cannot be mounted yet, but can be seen in /proc/filesystems.

More functionality will be added in subsequent commits.

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
---
 rust/kernel/fs.rs       | 116 +++++++++++++++++++++++++++++++++++++++-
 samples/rust/Kconfig    |  10 ++++
 samples/rust/Makefile   |   1 +
 samples/rust/rust_fs.rs |  31 +++++++++++
 scripts/Makefile.build  |   2 +-
 5 files changed, 157 insertions(+), 3 deletions(-)
 create mode 100644 samples/rust/rust_fs.rs

diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index 157fdb917ad1..b61e6f03e871 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -4,9 +4,121 @@
 //!
 //! C headers: [`include/linux/fs.h`](../../../../include/linux/fs.h)
 
-use crate::{bindings};
+use crate::{bindings, error::code::*, str::CStr, ThisModule};
+use crate::error::{to_result, Result};
 use crate::types::AlwaysRefCounted;
-use core::{cell::UnsafeCell, ptr};
+use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin, ptr};
+
+/// A file system type.
+pub trait Type {
+    /// The name of the file system type.
+    const NAME: &'static CStr;
+
+    /// The flags of this file system type.
+    ///
+    /// It is a combination of the flags in the [`flags`] module.
+    const FLAGS: i32;
+}
+
+/// File system flags.
+pub mod flags {
+    use crate::bindings;
+
+    /// The file system requires a device.
+    pub const REQUIRES_DEV: i32 = bindings::FS_REQUIRES_DEV as _;
+
+    /// The options provided when mounting are in binary form.
+    pub const BINARY_MOUNTDATA: i32 = bindings::FS_BINARY_MOUNTDATA as _;
+
+    /// The file system has a subtype. It is extracted from the name and passed in as a parameter.
+    pub const HAS_SUBTYPE: i32 = bindings::FS_HAS_SUBTYPE as _;
+
+    /// The file system can be mounted by userns root.
+    pub const USERNS_MOUNT: i32 = bindings::FS_USERNS_MOUNT as _;
+
+    /// Disables fanotify permission events.
+    pub const DISALLOW_NOTIFY_PERM: i32 = bindings::FS_DISALLOW_NOTIFY_PERM as _;
+
+    /// The file system has been updated to handle vfs idmappings.
+    pub const ALLOW_IDMAP: i32 = bindings::FS_ALLOW_IDMAP as _;
+
+    /// The file systen will handle `d_move` during `rename` internally.
+    pub const RENAME_DOES_D_MOVE: i32 = bindings::FS_RENAME_DOES_D_MOVE as _;
+}
+
+/// A file system registration.
+#[derive(Default)]
+pub struct Registration {
+    is_registered: bool,
+    fs: UnsafeCell<bindings::file_system_type>,
+    _pin: PhantomPinned,
+}
+
+// SAFETY: `Registration` doesn't really provide any `&self` methods, so it is safe to pass
+// references to it around.
+unsafe impl Sync for Registration {}
+
+// SAFETY: Both registration and unregistration are implemented in C and safe to be performed from
+// any thread, so `Registration` is `Send`.
+unsafe impl Send for Registration {}
+
+impl Registration {
+    /// Creates a new file system registration.
+    ///
+    /// It is not visible or accessible yet. A successful call to [`Registration::register`] needs
+    /// to be made before users can mount it.
+    pub fn new() -> Self {
+        Self {
+            is_registered: false,
+            fs: UnsafeCell::new(bindings::file_system_type::default()),
+            _pin: PhantomPinned,
+        }
+    }
+
+    /// Registers a file system so that it can be mounted by users.
+    ///
+    /// The file system is described by the [`Type`] argument.
+    ///
+    /// It is automatically unregistered when the registration is dropped.
+    pub fn register<T: Type>(self: Pin<&mut Self>, module: &'static ThisModule) -> Result {
+        // SAFETY: We never move out of `this`.
+        let this = unsafe { self.get_unchecked_mut() };
+
+        if this.is_registered {
+            return Err(EINVAL);
+        }
+
+        let mut fs = this.fs.get_mut();
+        fs.owner = module.0;
+        fs.name = T::NAME.as_char_ptr();
+        fs.fs_flags = T::FLAGS;
+        fs.init_fs_context = Some(Self::init_fs_context_callback::<T>);
+        fs.kill_sb = Some(Self::kill_sb_callback::<T>);
+        // SAFETY: Pointers stored in `fs` are either static so will live for as long as the
+        // registration is active (it is undone in `drop`).
+        to_result(unsafe { bindings::register_filesystem(this.fs.get()) })?;
+        this.is_registered = true;
+        Ok(())
+    }
+
+    unsafe extern "C" fn init_fs_context_callback<T: Type>(
+        _fc_ptr: *mut bindings::fs_context,
+    ) -> core::ffi::c_int {
+        EINVAL.to_errno()
+    }
+
+    unsafe extern "C" fn kill_sb_callback<T: Type>(_sb_ptr: *mut bindings::super_block) {}
+}
+
+impl Drop for Registration {
+    fn drop(&mut self) {
+        if self.is_registered {
+            // SAFETY: When `is_registered` is `true`, a previous call to `register_filesystem` has
+            // succeeded, so it is safe to unregister here.
+            unsafe { bindings::unregister_filesystem(self.fs.get()) };
+        }
+    }
+}
 
 /// Wraps the kernel's `struct inode`.
 ///
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index b0f74a81c8f9..2bd736f99189 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -30,6 +30,16 @@ config SAMPLE_RUST_PRINT
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_FS
+	tristate "File system"
+	help
+	  This option builds the Rust file system sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_fs.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 03086dabbea4..e5941037e673 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
+obj-$(CONFIG_SAMPLE_RUST_FS)			+= rust_fs.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/rust_fs.rs b/samples/rust/rust_fs.rs
new file mode 100644
index 000000000000..2caacea50e73
--- /dev/null
+++ b/samples/rust/rust_fs.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust file system sample.
+
+use kernel::prelude::*;
+use kernel::{c_str, fs};
+
+module! {
+    type: FsModule,
+    name: "rust_fs",
+    author: "Rust for Linux Contributors",
+    license: "GPL",
+}
+
+struct RustFs;
+impl fs::Type for RustFs {
+    const NAME: &'static CStr = c_str!("rustfs");
+    const FLAGS: i32 = fs::flags::USERNS_MOUNT;
+}
+
+struct FsModule {
+    _fs: Pin<Box<fs::Registration>>,
+}
+
+impl kernel::Module for FsModule {
+    fn init(module: &'static ThisModule) -> Result<Self> {
+        let mut reg = Pin::from(Box::try_new(fs::Registration::new())?);
+        reg.as_mut().register::<RustFs>(module)?;
+        Ok(Self { _fs: reg })
+    }
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 78175231c969..1404967e908e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -277,7 +277,7 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := new_uninit
+rust_allowed_features := allocator_api,new_uninit
 
 rust_common_cmd = \
 	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
-- 
2.40.1

