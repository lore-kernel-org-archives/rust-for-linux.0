Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752B6C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238555AbjFIGyh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjFIGy2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:28 -0400
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36FD3585
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5664; q=dns/txt; s=iport;
  t=1686293660; x=1687503260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ERTw5De3mm/jC3wOPNUZNz++GHq59h5rKLrg8FYkISc=;
  b=ClWecTrzCuio1E/8Rh4dADVc7ka2kXLw3fedGp0NDtxcrMR2qiyJOcWL
   q6QoiEtMYD6SyySjngZ11k7mvQBwznVY24/gnP09WTIsYlCB2tPq7Ctu5
   D1p0RTiHSU41g9vDy9vhc2R7wPnQUAnvHNwdCPhHpbJUwrI2xIsygLHxL
   4=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5220556"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:40 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VID9055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:40 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 15/80] rust: kernel: add count_paren_items macro, needed by define_fs_params macro
Date:   Fri,  9 Jun 2023 09:30:13 +0300
Message-Id: <20230609063118.24852-16-amiculas@cisco.com>
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

Changes:
* add count_paren_items in rust/kernel/driver.rs, used by
  define_fs_params macro in rust/kernel/fs/param.rs
* add missing uring_cmd_iopoll in file_operations VTABLE
* fix accesses to the vm_flags field in vm_area_struct
* fix init's signature in rust/kernel/fs.rs
* import module_fs in samples/rust/rust_fs.rs

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/driver.rs           | 28 ++++++++++++++++++++++++++++
 rust/kernel/file.rs             |  1 +
 rust/kernel/fs.rs               |  2 +-
 rust/kernel/lib.rs              |  3 ++-
 rust/kernel/mm.rs               |  4 ++--
 samples/rust/rust_fs.rs         |  1 +
 7 files changed, 36 insertions(+), 4 deletions(-)
 create mode 100644 rust/kernel/driver.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index d15a698439e1..6182174663ba 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -16,6 +16,7 @@
 #include <linux/poll.h>
 #include <linux/uio.h>
 #include <linux/uaccess.h>
+#include <linux/delay.h>
 
 /* `bindgen` gets confused at certain things. */
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
new file mode 100644
index 000000000000..f743fcf5451b
--- /dev/null
+++ b/rust/kernel/driver.rs
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Generic support for drivers of different buses (e.g., PCI, Platform, Amba, etc.).
+//!
+//! Each bus/subsystem is expected to implement [`DriverOps`], which allows drivers to register
+//! using the [`Registration`] class.
+
+/// Counts the number of parenthesis-delimited, comma-separated items.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::count_paren_items;
+///
+/// assert_eq!(0, count_paren_items!());
+/// assert_eq!(1, count_paren_items!((A)));
+/// assert_eq!(1, count_paren_items!((A),));
+/// assert_eq!(2, count_paren_items!((A), (B)));
+/// assert_eq!(2, count_paren_items!((A), (B),));
+/// assert_eq!(3, count_paren_items!((A), (B), (C)));
+/// assert_eq!(3, count_paren_items!((A), (B), (C),));
+/// ```
+#[macro_export]
+macro_rules! count_paren_items {
+    (($($item:tt)*), $($remaining:tt)*) => { 1 + $crate::count_paren_items!($($remaining)*) };
+    (($($item:tt)*)) => { 1 };
+    () => { 0 };
+}
diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index 586c0b386b5b..b3bbbf153925 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -637,6 +637,7 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
             None
         },
         uring_cmd: None,
+        uring_cmd_iopoll: None,
         write_iter: if T::HAS_WRITE {
             Some(Self::write_iter_callback)
         } else {
diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index 1d920fde4022..ba98ae7caf00 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -1263,7 +1263,7 @@ pub struct Module<T: Type> {
 }
 
 impl<T: Type + Sync> crate::Module for Module<T> {
-    fn init(_name: &'static CStr, module: &'static ThisModule) -> Result<Self> {
+    fn init(module: &'static ThisModule) -> Result<Self> {
         let mut reg = Pin::from(Box::try_new(Registration::new())?);
         reg.as_mut().register::<T>(module)?;
         Ok(Self {
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7dfebbe39430..08f67833afcf 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -21,6 +21,7 @@
 #![feature(receiver_trait)]
 #![feature(unsize)]
 #![feature(const_mut_refs)]
+#![feature(duration_constants)]
 
 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
@@ -36,6 +37,7 @@
 mod build_assert;
 pub mod cred;
 pub mod delay;
+pub mod driver;
 pub mod error;
 pub mod file;
 pub mod fs;
@@ -97,7 +99,6 @@ impl ThisModule {
     pub const unsafe fn from_ptr(ptr: *mut bindings::module) -> ThisModule {
         ThisModule(ptr)
     }
-
 }
 /// Calculates the offset of a field from the beginning of the struct it belongs to.
 ///
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 779359d0c5cf..d159c45157a9 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -38,7 +38,7 @@ pub(crate) unsafe fn from_ptr(vma: *mut bindings::vm_area_struct) -> Self {
         /// The possible flags are a combination of the constants in [`flags`].
         pub fn flags(&self) -> usize {
             // SAFETY: `self.vma` is valid by the type invariants.
-            unsafe { (*self.vma).vm_flags as _ }
+            unsafe { (*self.vma).__bindgen_anon_1.vm_flags as _ }
         }
 
         /// Sets the flags associated with the virtual memory area.
@@ -46,7 +46,7 @@ pub fn flags(&self) -> usize {
         /// The possible flags are a combination of the constants in [`flags`].
         pub fn set_flags(&mut self, flags: usize) {
             // SAFETY: `self.vma` is valid by the type invariants.
-            unsafe { (*self.vma).vm_flags = flags as _ };
+            unsafe { (*self.vma).__bindgen_anon_1.vm_flags = flags as _ };
         }
 
         /// Returns the start address of the virtual memory area.
diff --git a/samples/rust/rust_fs.rs b/samples/rust/rust_fs.rs
index 18fd4542863b..7527681ee024 100644
--- a/samples/rust/rust_fs.rs
+++ b/samples/rust/rust_fs.rs
@@ -2,6 +2,7 @@
 
 //! Rust file system sample.
 
+use kernel::module_fs;
 use kernel::prelude::*;
 use kernel::{c_str, file, fs, io_buffer::IoBufferWriter};
 
-- 
2.40.1

