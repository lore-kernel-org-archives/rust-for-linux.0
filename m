Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1285C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238608AbjFIG4r (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237823AbjFIG43 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:29 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F35635B6
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4503; q=dns/txt; s=iport;
  t=1686293768; x=1687503368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Eiq43l+jIeDamYcFaTEEwp4mu6fZw5QlrFx3ydj5Y9o=;
  b=hzpNv0LvCvg4EvSFs1nyjB8cSsykoH2XKTXGtL2Dutw2y1LYVXXVLN2B
   zY9LLuRiIrs00Nrl+b9W/stpWelsk5VML81HpSH+75QHcUvHOpDLwKwNW
   uUG1ktCQib2HVvB4+j2hw55JkNEvGWmhJCxmpNM2hq3EFVxVvUQjdkBeZ
   s=;
X-IPAS-Result: =?us-ascii?q?A0ASAAAixoJklxbLJq1aHQEBAQEJARIBBQUBgXsIAQsBg?=
 =?us-ascii?q?yNVLhJHjG5fiFWda4ElA1YPAQEBDQEBMRMEAQGFBgKFdSY0CQ4BAgQBAQEBA?=
 =?us-ascii?q?wIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQE3BRA1hWgNhgUDAycLAUYQI?=
 =?us-ascii?q?DFXGYJ+AYJcA60ZgXkzgQGCYoITmmuBaIFCAYwVhUpCgUlEgRWDaYsGBI4vj?=
 =?us-ascii?q?yiBKW+BHjlpfwIJAhFngQoIXIFzQAINVAsLY4EdglUCAhE8FFJiGR0DBwQCg?=
 =?us-ascii?q?QUQLwcEMigGCRgvJwZTBxcWJAkTFUIEg1kKgRBAFQ4RglwqAj1vAwkDBwVJQ?=
 =?us-ascii?q?AMLGA1IESw1FB8GQ4EHF2OBfCQknkaDDXsTAS+VaI5TghWgKoQSi3yVBBozh?=
 =?us-ascii?q?Vejfi6XaJZFjRiELwIEBgUCFoFjOjuBIDMaCBsVgyIJSRkPjjmJcIlnQTE7A?=
 =?us-ascii?q?gcLAQEDCYtGAQE?=
IronPort-Data: A9a23:oDLKLK0U8vXpKx2UK/bD5ddxkn2cJEfYwER7XKvMYLTBsI5bp2MPx
 2tMC22FM/aMZ2P1KookPNzk/UoEvJHTztQ2HlFo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZxyFjmGzvuUGuCJQUNUjclkfZKiTracUsxNbVU8Enx510ozw7VRbrNA2LBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2yxH5OKkiyZSZdBMUdGX78tmSH
 I4vxJnhlo/QEoxE5tmNyt4XeWVSKlLe0JTnZnd+A8CfbhZ+SiMawvYxCt8OTUJth2+0uOhO1
 clv9oSbcFJ8VkHMsLx1vxhwGixkeKZB4rKCfD60sNeYyAvNdH6EL/dGVR5te9ZIvLwvWicUr
 5T0KxhVBvyHr+uzwbmmTuB3rs8iN8LseogYvxmMyBmEV6l3GcGZK0nMzdIfh2ZouMpJJ9udS
 80+byFpTjKZTCQabz/7D7pnzLv32RETaQZwt1+Zvq0x6mb7wwt237zgdtHSf7SiX9hOggOWo
 XiD+2X/HwEyKtOS03yG/2iqi+uJmjn0ML/+D5Wx++QvgUWU3HBWDhQKE1C6uvK+zEW5XrqzN
 nD45AI+/aIM0V6PS+PxBSCfmEGZojxfQ/FpRrhSBB629oLY5AOQB24hRzFHacA7uMJeedDM/
 gLZ9z8OLWEz2IB5WU5x5Z/J92jsaHh9wXsqOHVdF1ptD8zL+tlbs/7Zcjp0OIiR5jEfMRj0x
 j2QoWAFm7wf5SLg//zgpA2vb96EiJzEUAkx7wPbNl9JDz+Vhqb4PeRECnCCs56sybp1qHHa5
 RDofODEtogz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvmEgfhs4ap1UJG6zC
 KM2he+3zMEIVJdNRfInC79d9+xxpUQdPY2/D6uNPoYmjmZZLVbXp0mCmnJ8L0i0wBRzzsnTy
 L+QcN2nCj4BGL97wT+tL9rxIpd1rh3SMVj7HMihpzz+iOL2TCfMGd843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnOMqNNLcA5TcidT6FKfg5U/S9Nv6zFOQAkJY8I9C5t4E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:jUWgt6ihddzpUd8ExJgSiUTaknBQXvUji2hC6mlwRA09TyVXra
 yTdZMgpHvJYVkqNk3I9errBEDEewK+yXcX2/h1AV7dZmjbUQKTRekI0WKh+UyDJ8SUzIFgPM
 lbHpRWOZnZEUV6gcHm4AOxDtoshOWc/LvAv5a4854Ud2FXg2UK1XYBNu5deXcGIjV7OQ==
X-Talos-CUID: 9a23:fU2MJ299ynriO/1jrqqVv15EEP4AYFnY9nuKHmiANnt1av6NYmbFrQ==
X-Talos-MUID: 9a23:a1X7IQjFAaVE2W6lXOxhvMMpOYAzsvyQAkc3vNYqvO6CLipSHW6ytWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279092"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:38 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VID1055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:38 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 07/80] rust: add `module_fs` macro
Date:   Fri,  9 Jun 2023 09:30:05 +0300
Message-Id: <20230609063118.24852-8-amiculas@cisco.com>
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

This reduces the amount of code needed to implement a module that
only implements a file system.

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
---
 rust/kernel/fs.rs       | 77 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/prelude.rs  |  1 +
 samples/rust/rust_fs.rs | 16 ++-------
 3 files changed, 80 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index fb4a814e1fc8..86c306c19e0a 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -4,6 +4,7 @@
 //!
 //! C headers: [`include/linux/fs.h`](../../../../include/linux/fs.h)
 
+use alloc::boxed::Box;
 use crate::{bindings, error::code::*, str::CStr, ThisModule};
 use crate::error::{to_result, from_kernel_result, Error, Result};
 use crate::types::{AlwaysRefCounted, ForeignOwnable, ScopeGuard};
@@ -757,3 +758,79 @@ pub(crate) unsafe fn from_ptr<'a>(ptr: *const bindings::filename) -> &'a Filenam
         unsafe { &*ptr.cast() }
     }
 }
+
+/// Kernel module that exposes a single file system implemented by `T`.
+pub struct Module<T: Type> {
+    _fs: Pin<Box<Registration>>,
+    _p: PhantomData<T>,
+}
+
+impl<T: Type + Sync> crate::Module for Module<T> {
+    fn init(_name: &'static CStr, module: &'static ThisModule) -> Result<Self> {
+        let mut reg = Pin::from(Box::try_new(Registration::new())?);
+        reg.as_mut().register::<T>(module)?;
+        Ok(Self {
+            _fs: reg,
+            _p: PhantomData,
+        })
+    }
+}
+
+/// Declares a kernel module that exposes a single file system.
+///
+/// The `type` argument must be a type which implements the [`Type`] trait. Also accepts various
+/// forms of kernel metadata.
+///
+/// # Examples
+///
+/// ```ignore
+/// use kernel::prelude::*;
+/// use kernel::{c_str, fs};
+///
+/// module_fs! {
+///     type: MyFs,
+///     name: b"my_fs_kernel_module",
+///     author: b"Rust for Linux Contributors",
+///     description: b"My very own file system kernel module!",
+///     license: b"GPL",
+/// }
+///
+/// struct MyFs;
+///
+/// #[vtable]
+/// impl fs::Context<Self> for MyFs {
+///     type Data = ();
+///     fn try_new() -> Result {
+///         Ok(())
+///     }
+/// }
+///
+/// impl fs::Type for MyFs {
+///     type Context = Self;
+///     const SUPER_TYPE: fs::Super = fs::Super::Independent;
+///     const NAME: &'static CStr = c_str!("example");
+///     const FLAGS: i32 = 0;
+///
+///     fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
+///         let sb = sb.init(
+///             (),
+///             &fs::SuperParams {
+///                 magic: 0x6578616d,
+///                 ..fs::SuperParams::DEFAULT
+///             },
+///         )?;
+///         let sb = sb.init_root()?;
+///         Ok(sb)
+///     }
+/// }
+/// ```
+#[macro_export]
+macro_rules! module_fs {
+    (type: $type:ty, $($f:tt)*) => {
+        type ModuleType = $crate::fs::Module<$type>;
+        $crate::macros::module! {
+            type: ModuleType,
+            $($f)*
+        }
+    }
+}
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index c28587d68ebc..37789bc8a796 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -28,6 +28,7 @@
 pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
 
 pub use super::{init, pin_init, try_init, try_pin_init};
+pub use super::{module_fs, module_misc_device};
 
 pub use super::static_assert;
 
diff --git a/samples/rust/rust_fs.rs b/samples/rust/rust_fs.rs
index 5d8880d5830b..064ead97dd98 100644
--- a/samples/rust/rust_fs.rs
+++ b/samples/rust/rust_fs.rs
@@ -5,8 +5,8 @@
 use kernel::prelude::*;
 use kernel::{c_str, fs};
 
-module! {
-    type: FsModule,
+module_fs! {
+    type: RustFs,
     name: "rust_fs",
     author: "Rust for Linux Contributors",
     license: "GPL",
@@ -57,15 +57,3 @@ fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBl
         Ok(sb)
     }
 }
-
-struct FsModule {
-    _fs: Pin<Box<fs::Registration>>,
-}
-
-impl kernel::Module for FsModule {
-    fn init(module: &'static ThisModule) -> Result<Self> {
-        let mut reg = Pin::from(Box::try_new(fs::Registration::new())?);
-        reg.as_mut().register::<RustFs>(module)?;
-        Ok(Self { _fs: reg })
-    }
-}
-- 
2.40.1

