Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B11DC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237660AbjFIGz4 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237825AbjFIGzs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:48 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9D130C8
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3384; q=dns/txt; s=iport;
  t=1686293717; x=1687503317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fr5nmbRUwtuyIAFD8Ycxg+Eo9gv7pCgumHAzBTfYMog=;
  b=BsHA1qEZmZV9PJh6JnQXryaZUD2WhZWi3JDbBC6SA8QRx+PP70mZKbVK
   B9e60aQWkMSoX3I8s7i+U5kJ/RL6s8agqGGmcu1qZFn5FiabEUR7evW97
   V7brREsQfzV2LwDPCG/kfQOX2vGQqNYcWx38IW34fcjdvd32LQckHBeb8
   Y=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453682"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:52 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDi055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:52 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 50/80] rust: kernel: add an abstraction over vfsmount to allow cloning a new private mount
Date:   Fri,  9 Jun 2023 09:30:48 +0300
Message-Id: <20230609063118.24852-51-amiculas@cisco.com>
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

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/lib.rs              |  1 +
 rust/kernel/mount.rs            | 66 +++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)
 create mode 100644 rust/kernel/mount.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 6182174663ba..3ea8e3f610ee 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -17,6 +17,7 @@
 #include <linux/uio.h>
 #include <linux/uaccess.h>
 #include <linux/delay.h>
+#include <linux/namei.h>
 
 /* `bindgen` gets confused at certain things. */
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index a94fb784d576..5ad583ce6fb4 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -46,6 +46,7 @@
 pub mod ioctl;
 pub mod iov_iter;
 pub mod mm;
+pub mod mount;
 pub mod pages;
 pub mod prelude;
 pub mod print;
diff --git a/rust/kernel/mount.rs b/rust/kernel/mount.rs
new file mode 100644
index 000000000000..c8c517eb996a
--- /dev/null
+++ b/rust/kernel/mount.rs
@@ -0,0 +1,66 @@
+//! Mount interface
+//!
+//! C headers: [`include/linux/mount.h`](../../../../include/linux/mount.h)
+
+use kernel::bindings;
+use kernel::error::from_err_ptr;
+use kernel::pr_err;
+use kernel::prelude::*;
+use kernel::str::CStr;
+use kernel::types::Opaque;
+
+/// Wraps the kernel's `struct path`.
+#[repr(transparent)]
+pub struct Path(pub(crate) Opaque<bindings::path>);
+
+/// Wraps the kernel's `struct vfsmount`.
+#[repr(transparent)]
+#[derive(Debug)]
+pub struct Vfsmount {
+    vfsmount: *mut bindings::vfsmount,
+}
+
+// SAFETY: No one besides us has the raw pointer, so we can safely transfer Vfsmount to another thread
+unsafe impl Send for Vfsmount {}
+// SAFETY: It's OK to access `Vfsmount` through references from other threads because we're not
+// accessing any properties from the underlying raw pointer
+unsafe impl Sync for Vfsmount {}
+
+impl Vfsmount {
+    /// Create a new private mount clone based on a path name
+    pub fn new_private_mount(path_name: &CStr) -> Result<Self> {
+        let path: Path = Path(Opaque::uninit());
+        let err = unsafe {
+            bindings::kern_path(
+                path_name.as_ptr() as *const i8,
+                bindings::LOOKUP_FOLLOW | bindings::LOOKUP_DIRECTORY,
+                path.0.get(),
+            )
+        };
+        if err != 0 {
+            pr_err!("failed to resolve '{}': {}\n", path_name, err);
+            return Err(EINVAL);
+        }
+
+        let vfsmount = unsafe {
+            let mnt = from_err_ptr(bindings::clone_private_mount(path.0.get()))?;
+            // Don't inherit atime flags
+            (*mnt).mnt_flags &=
+                !(bindings::MNT_NOATIME | bindings::MNT_NODIRATIME | bindings::MNT_RELATIME) as i32;
+            mnt
+        };
+        Ok(Self { vfsmount })
+    }
+
+    /// Returns a raw pointer to vfsmount
+    pub fn get(&self) -> *mut bindings::vfsmount {
+        self.vfsmount
+    }
+}
+
+impl Drop for Vfsmount {
+    fn drop(&mut self) {
+        // SAFETY new_private_mount makes sure to return a valid pointer
+        unsafe { bindings::kern_unmount(self.vfsmount) };
+    }
+}
-- 
2.40.1

