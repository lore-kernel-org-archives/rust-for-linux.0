Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34C7C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjFIGzv (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237480AbjFIGzl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:41 -0400
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E59B2D7B
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=24485; q=dns/txt;
  s=iport; t=1686293710; x=1687503310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jOuH9ze9CX8sXOnEX9jK+dCQ/IIsbl/4dFa+iYQMTt0=;
  b=gfftXLWY+ie/fCGaQWvTRT7by8L53r7E2GjqWrTSO6xlmCv2WfhDOV2i
   LLVHiwtyxQgSa2lK/EJYBEhyv8ILT9dkzuuC4PIlAmGpbJtD/+W8N7uJv
   hJHQEA9TWv19h910KCrtVAUVQFZTzAlqVgH1EaqZ3NnwoYlJ8ukTIKCnL
   o=;
X-IPAS-Result: =?us-ascii?q?A0AMAAAixoJklxbLJq1aHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBgyNVLhJHjG5fiFIDgROcWIElA1YPAQEBDQEBMRMEAQGFBgKFdSY0C?=
 =?us-ascii?q?Q4BAgQBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQE3BRA1hWgNh?=
 =?us-ascii?q?gUDAycLAUYQIDFXGYJ+AYJcA60ZgXkzgQGCYoITmmuBaIFCAYwVhUpCgUlEg?=
 =?us-ascii?q?RWBPIE3dosGBIkdghIOC4JnjyiBKW+BHjlpfwIJAhFngQoIXIFzQAINVAsLY?=
 =?us-ascii?q?4EdglUCAhE8FFJiGR0DBwQCgQUQLwcEMigGCRgvJwZTBxcWJAkTFUIEg1kKg?=
 =?us-ascii?q?RBAFQ4RglwqAj1vAwkDBwVJQAMLGA1IESw1FB8GQ4EHF2OBfCQknkaCbRkGA?=
 =?us-ascii?q?S9FBwkKAYEmChtEIAEbEhwsknKOU4IVnnOBN4QSi3yVBBozhAGBVqN+mBaCT?=
 =?us-ascii?q?5N2jRiELwIEBgUCFoFjOjuBIDMaCBsVgyIJSRkPjjmJcBuJTEExOwIHCwEBA?=
 =?us-ascii?q?wmIbCyCLgEB?=
IronPort-Data: A9a23:HvCiZa7VaNzJBoMdwyqEEQxRtB7HchMFZxGqfqrLsTDasY5as4F+v
 mBJCmDXa/iIZmagfN1xYN++8E0GvcDWyodrSgBp/nsyZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyOa/FH0WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVvV0
 T/Oi5eHYgT9hWYkajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKmWDNrfnL
 wpr5OjRElLxp3/BOPv8+lrIWhFirorpAOS7oiE+t55OLfR1jndaPq4TbJLwYKrM4tmDt4gZJ
 N5l7fRcReq1V0HBsLx1bvVWL81xFZZd1aPNJiOBiOfN5kvvWErAmPp8HV5jaOX0+s4vaY1P3
 fUVMnUGaQqOwr/wy7OgQe4qjcMmRCXpFNpA4Tc7nXeDVa1gG8qrr6bivbe02B85g8FFAPLXf
 OISaCFka1LLZBgn1lI/V8Jjw73x3BETdRVHlXCbmZMQ5VTW6yV7wIPjFsGWPfaFEJA9ckGw/
 zKaoDuR7gshHMOSxSGC9HuiruDImiz/VcQZE7jQ3uR3m0HWyGsJTRkXU0ariee2h1T4WN9FL
 UEQvC00osAPGFeDR9TnGhygp2SY+xgVR5xbEvYx70eGza+8Dxul6nYsdSVsdNYh7/EPbmID0
 Hairv+yCi5+r+jAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+UPRqlu3nojqf4+TMaIYs3J9SLYn
 mrR8nlu71kHpZNRjv/qlbzSq2j0zqUlWDLZ8S3xegpJBCtQYIuofYHg0kTS4Z6sx67AFQDc1
 JTos+aa4f4JCZiLmESwrAQx8FOBuqzt3N702AAH83wdG9KFoCfLkWd4umsWGauRGpxYEQIFm
 WeK0e+r2LddPWGxcYh8aJ+rBsIhwMDITIq1CKqIP4IVMsUgLmdrGR2Cg2bOhAgBd2BxwckC1
 WuzKq5A8F5DU/08lWrqLwvj+eZylntWKZzvqWDTlkT7juX2iI+9QrYeO1zGdfEi8K6Bu23oH
 yV3aaO3J+FkeLSmOEH/qNdLRXhTdChTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwPzb6Vp
 izjAxAHoLc97FWeQTi3hrlYQOuHdf5CQbgTZETA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:EzwL0qoqhveevWg6RNZu9QwaV5oEeYIsimQD101hICG9vPb1qy
 nIpoV+6faaslgssR0b8+xofZPwIk80lqQFhLX5Q43CYOCOggLBR72Kr7GSoQEIcBeQygcy78
 pdWpk7IMHsDFR8kMbx6BS1HpId2tWdmZrY4ts2t00McemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:c25P72wCQBll+qMTeVN3BgUvAe05eHqG8k77fWa+IE1YZOaaW06PrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A7BMJ1g6VEc+fpznkCBsHxymKxox33oagNHkql6k?=
 =?us-ascii?q?DnOCOJRd+HSzeyx64F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857212"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:38 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VID0055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:38 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 06/80] rust: allow fs driver to initialise new superblocks
Date:   Fri,  9 Jun 2023 09:30:04 +0300
Message-Id: <20230609063118.24852-7-amiculas@cisco.com>
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

They are also allowed to specify the type of superblock keying.

With this change, drivers get a new callback, `fill_super`, that they
need to implement to initialise new superblocks.

In subsequent commits, they'll be able to populate the root with
entries, but for now it's empty.

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
---
 rust/kernel/fs.rs       | 406 ++++++++++++++++++++++++++++++++--------
 rust/kernel/fs/param.rs |  17 +-
 samples/rust/rust_fs.rs |  14 +-
 3 files changed, 357 insertions(+), 80 deletions(-)

diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index e68b67b8adb0..fb4a814e1fc8 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -7,11 +7,31 @@
 use crate::{bindings, error::code::*, str::CStr, ThisModule};
 use crate::error::{to_result, from_kernel_result, Error, Result};
 use crate::types::{AlwaysRefCounted, ForeignOwnable, ScopeGuard};
-use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin, ptr};
+use core::{cell::UnsafeCell, marker::PhantomData, marker::PhantomPinned, pin::Pin, ptr};
 use macros::vtable;
 
 pub mod param;
 
+/// Type of superblock keying.
+///
+/// It determines how C's `fs_context_operations::get_tree` is implemented.
+pub enum Super {
+    /// Only one such superblock may exist.
+    Single,
+
+    /// As [`Super::Single`], but reconfigure if it exists.
+    SingleReconf,
+
+    /// Superblocks with different data pointers may exist.
+    Keyed,
+
+    /// Multiple independent superblocks may exist.
+    Independent,
+
+    /// Uses a block device.
+    BlockDev,
+}
+
 /// A file system context.
 ///
 /// It is used to gather configuration to then mount or reconfigure a file system.
@@ -48,6 +68,16 @@ fn parse_monolithic<'a>(
     ) -> Result<Option<&'a mut [u8]>> {
         Ok(None)
     }
+
+    /// Returns the superblock data to be used by this file system context.
+    ///
+    /// This is only needed when [`Type::SUPER_TYPE`] is [`Super::Keyed`], otherwise it is never
+    /// called. In the former case, when the fs is being mounted, an existing superblock is reused
+    /// if one can be found with the same data as the returned value; otherwise a new superblock is
+    /// created.
+    fn tree_key(_data: &mut Self::Data) -> Result<T::Data> {
+        Err(ENOTSUPP)
+    }
 }
 
 struct Tables<T: Type + ?Sized>(T);
@@ -67,12 +97,22 @@ impl<T: Type + ?Sized> Tables<T> {
 
     unsafe extern "C" fn free_callback(fc: *mut bindings::fs_context) {
         // SAFETY: The callback contract guarantees that `fc` is valid.
-        let ptr = unsafe { (*fc).fs_private };
+        let fc = unsafe { &*fc };
+
+        let ptr = fc.fs_private;
         if !ptr.is_null() {
             // SAFETY: `fs_private` was initialised with the result of a `to_pointer` call in
             // `init_fs_context_callback`, so it's ok to call `from_foreign` here.
             unsafe { <T::Context as Context<T>>::Data::from_foreign(ptr) };
         }
+
+        let ptr = fc.s_fs_info;
+        if !ptr.is_null() {
+            // SAFETY: `s_fs_info` may be initialised with the result of a `to_pointer` call in
+            // `get_tree_callback` when keyed superblocks are used (`get_tree_keyed` sets it), so
+            // it's ok to call `from_foreign` here.
+            unsafe { T::Data::from_foreign(ptr) };
+        }
     }
 
     unsafe extern "C" fn parse_param_callback(
@@ -84,8 +124,8 @@ impl<T: Type + ?Sized> Tables<T> {
             let ptr = unsafe { (*fc).fs_private };
 
             // SAFETY: The value of `ptr` (coming from `fs_private` was initialised in
-            // `init_fs_context_callback` to the result of an `into_pointer` call. Since the
-            // context is valid, `from_pointer` wasn't called yet, so `ptr` is valid. Additionally,
+            // `init_fs_context_callback` to the result of an `into_foreign` call. Since the
+            // context is valid, `from_foreign` wasn't called yet, so `ptr` is valid. Additionally,
             // the callback contract guarantees that callbacks are serialised, so it is ok to
             // mutably reference it.
             let mut data =
@@ -126,73 +166,91 @@ impl<T: Type + ?Sized> Tables<T> {
 
     unsafe extern "C" fn fill_super_callback(
         sb_ptr: *mut bindings::super_block,
-        _fc: *mut bindings::fs_context,
+        fc: *mut bindings::fs_context,
     ) -> core::ffi::c_int {
         from_kernel_result! {
-            // The following is temporary code to create the root inode and dentry. It will be
-            // replaced with calls to Rust code.
-
-            // SAFETY: The callback contract guarantees that `sb_ptr` is the only pointer to a
-            // newly-allocated superblock, so it is safe to mutably reference it.
-            let sb = unsafe { &mut *sb_ptr };
-
-            sb.s_maxbytes = bindings::MAX_LFS_FILESIZE;
-            sb.s_blocksize = crate::PAGE_SIZE as _;
-            sb.s_blocksize_bits = bindings::PAGE_SHIFT as _;
-            sb.s_magic = T::MAGIC as _;
-            sb.s_op = &Tables::<T>::SUPER_BLOCK;
-            sb.s_time_gran = 1;
-
-            // Create and initialise the root inode.
-
-            // SAFETY: `sb` was just created initialised, so it is safe pass it to `new_inode`.
-            let inode = unsafe { bindings::new_inode(sb) };
-            if inode.is_null() {
-                return Err(ENOMEM);
-            }
-
-            {
-                // SAFETY: This is a newly-created inode. No other references to it exist, so it is
-                // safe to mutably dereference it.
-                let inode = unsafe { &mut *inode };
-
-                // SAFETY: `current_time` requires that `inode.sb` be valid, which is the case here
-                // since we allocated the inode through the superblock.
-                let time = unsafe { bindings::current_time(inode) };
-                inode.i_ino = 1;
-                inode.i_mode = (bindings::S_IFDIR | 0o755) as _;
-                inode.i_mtime = time;
-                inode.i_atime = time;
-                inode.i_ctime = time;
-
-                // SAFETY: `simple_dir_operations` never changes, it's safe to reference it.
-                inode.__bindgen_anon_3.i_fop = unsafe { &bindings::simple_dir_operations };
-
-                // SAFETY: `simple_dir_inode_operations` never changes, it's safe to reference it.
-                inode.i_op = unsafe { &bindings::simple_dir_inode_operations };
-
-                // SAFETY: `inode` is valid for write.
-                unsafe { bindings::set_nlink(inode, 2) };
-            }
-
-            // SAFETY: `d_make_root` requires that `inode` be valid and referenced, which is the
-            // case for this call.
-            //
-            // It takes over the inode, even on failure, so we don't need to clean it up.
-            let dentry = unsafe { bindings::d_make_root(inode) };
-            if dentry.is_null() {
-                return Err(ENOMEM);
-            }
+            // SAFETY: The callback contract guarantees that `fc` is valid. It also guarantees that
+            // the callbacks are serialised for a given `fc`, so it is safe to mutably dereference
+            // it.
+            let fc = unsafe { &mut *fc };
+            let ptr = core::mem::replace(&mut fc.fs_private, ptr::null_mut());
 
-            sb.s_root = dentry;
+            // SAFETY: The value of `ptr` (coming from `fs_private` was initialised in
+            // `init_fs_context_callback` to the result of an `into_foreign` call. The context is
+            // being used to initialise a superblock, so we took over `ptr` (`fs_private` is set to
+            // null now) and call `from_foreign` below.
+            let data =
+                unsafe { <<T::Context as Context<T>>::Data as ForeignOwnable>::from_foreign(ptr) };
+
+            // SAFETY: The callback contract guarantees that `sb_ptr` is a unique pointer to a
+            // newly-created superblock.
+            let newsb = unsafe { NewSuperBlock::new(sb_ptr) };
+            T::fill_super(data, newsb)?;
             Ok(0)
         }
     }
 
     unsafe extern "C" fn get_tree_callback(fc: *mut bindings::fs_context) -> core::ffi::c_int {
-        // SAFETY: `fc` is valid per the callback contract. `fill_super_callback` also has the
-        // right type and is a valid callback.
-        unsafe { bindings::get_tree_nodev(fc, Some(Self::fill_super_callback)) }
+        // N.B. When new types are added below, we may need to update `kill_sb_callback` to ensure
+        // that we're cleaning up properly.
+        match T::SUPER_TYPE {
+            Super::Single => unsafe {
+                // SAFETY: `fc` is valid per the callback contract. `fill_super_callback` also has
+                // the right type and is a valid callback.
+                bindings::get_tree_single(fc, Some(Self::fill_super_callback))
+            },
+            Super::SingleReconf => unsafe {
+                // SAFETY: `fc` is valid per the callback contract. `fill_super_callback` also has
+                // the right type and is a valid callback.
+                bindings::get_tree_single_reconf(fc, Some(Self::fill_super_callback))
+            },
+            Super::Independent => unsafe {
+                // SAFETY: `fc` is valid per the callback contract. `fill_super_callback` also has
+                // the right type and is a valid callback.
+                bindings::get_tree_nodev(fc, Some(Self::fill_super_callback))
+            },
+            Super::BlockDev => unsafe {
+                // SAFETY: `fc` is valid per the callback contract. `fill_super_callback` also has
+                // the right type and is a valid callback.
+                bindings::get_tree_bdev(fc, Some(Self::fill_super_callback))
+            },
+            Super::Keyed => {
+                from_kernel_result! {
+                    // SAFETY: `fc` is valid per the callback contract.
+                    let ctx = unsafe { &*fc };
+                    let ptr = ctx.fs_private;
+
+                    // SAFETY: The value of `ptr` (coming from `fs_private` was initialised in
+                    // `init_fs_context_callback` to the result of an `into_foreign` call. Since
+                    // the context is valid, `from_foreign` wasn't called yet, so `ptr` is valid.
+                    // Additionally, the callback contract guarantees that callbacks are
+                    // serialised, so it is ok to mutably reference it.
+                    let mut data = unsafe {
+                        <<T::Context as Context<T>>::Data as ForeignOwnable>::borrow_mut(ptr)
+                    };
+                    let fs_data = T::Context::tree_key(&mut data)?;
+                    let fs_data_ptr = fs_data.into_foreign();
+
+                    // `get_tree_keyed` reassigns `ctx.s_fs_info`, which should be ok because
+                    // nowhere else is it assigned a non-null value. However, we add the assert
+                    // below to ensure that there are no unexpected paths on the C side that may do
+                    // this.
+                    assert_eq!(ctx.s_fs_info, core::ptr::null_mut());
+
+                    // SAFETY: `fc` is valid per the callback contract. `fill_super_callback` also
+                    // has the right type and is a valid callback. Lastly, we just called
+                    // `into_foreign` above, so `fs_data_ptr` is also valid.
+                    to_result(unsafe {
+                        bindings::get_tree_keyed(
+                            fc,
+                            Some(Self::fill_super_callback),
+                            fs_data_ptr as _,
+                        )
+                    })?;
+                    Ok(0)
+                }
+            }
+        }
     }
 
     unsafe extern "C" fn reconfigure_callback(_fc: *mut bindings::fs_context) -> core::ffi::c_int {
@@ -208,8 +266,8 @@ impl<T: Type + ?Sized> Tables<T> {
             let ptr = unsafe { (*fc).fs_private };
 
             // SAFETY: The value of `ptr` (coming from `fs_private` was initialised in
-            // `init_fs_context_callback` to the result of an `into_pointer` call. Since the
-            // context is valid, `from_pointer` wasn't called yet, so `ptr` is valid. Additionally,
+            // `init_fs_context_callback` to the result of an `into_foreign` call. Since the
+            // context is valid, `from_foreign` wasn't called yet, so `ptr` is valid. Additionally,
             // the callback contract guarantees that callbacks are serialised, so it is ok to
             // mutably reference it.
             let mut data =
@@ -270,18 +328,25 @@ pub trait Type {
     /// The context used to build fs configuration before it is mounted or reconfigured.
     type Context: Context<Self> + ?Sized;
 
+    /// Data associated with each file system instance.
+    type Data: ForeignOwnable + Send + Sync = ();
+
+    /// Determines how superblocks for this file system type are keyed.
+    const SUPER_TYPE: Super;
+
     /// The name of the file system type.
     const NAME: &'static CStr;
 
-    /// The magic number associated with the file system.
-    ///
-    /// This is normally one of the values in `include/uapi/linux/magic.h`.
-    const MAGIC: u32;
-
     /// The flags of this file system type.
     ///
     /// It is a combination of the flags in the [`flags`] module.
     const FLAGS: i32;
+
+    /// Initialises a super block for this file system type.
+    fn fill_super(
+        data: <Self::Context as Context<Self>>::Data,
+        sb: NewSuperBlock<'_, Self>,
+    ) -> Result<&SuperBlock<Self>>;
 }
 
 /// File system flags.
@@ -425,14 +490,33 @@ unsafe fn unregister_keys(fs: *mut bindings::file_system_type) {
     }
 
     unsafe extern "C" fn kill_sb_callback<T: Type + ?Sized>(sb_ptr: *mut bindings::super_block) {
-        // SAFETY: We always call `get_tree_nodev` from `get_tree_callback`, so we never have a
-        // device, so it is ok to call the function below. Additionally, the callback contract
-        // guarantees that `sb_ptr` is valid.
-        unsafe { bindings::kill_anon_super(sb_ptr) }
-
-        // SAFETY: The callback contract guarantees that `sb_ptr` is valid, and the `kill_sb`
-        // callback being called implies that the `s_type` is also valid.
-        unsafe { Self::unregister_keys((*sb_ptr).s_type) };
+        if let Super::BlockDev = T::SUPER_TYPE {
+            // SAFETY: When the superblock type is `BlockDev`, we have a block device so it's safe
+            // to call `kill_block_super`. Additionally, the callback contract guarantees that
+            // `sb_ptr` is valid.
+            unsafe { bindings::kill_block_super(sb_ptr) }
+        } else {
+            // SAFETY: We always call a `get_tree_nodev` variant from `get_tree_callback` without a
+            // device when `T::SUPER_TYPE` is not `BlockDev`, so we never have a device in such
+            // cases, therefore it is ok to call the function below. Additionally, the callback
+            // contract guarantees that `sb_ptr` is valid.
+            unsafe { bindings::kill_anon_super(sb_ptr) }
+        }
+
+        // SAFETY: The callback contract guarantees that `sb_ptr` is valid.
+        let sb = unsafe { &*sb_ptr };
+
+        // SAFETY: The `kill_sb` callback being called implies that the `s_type` field is valid.
+        unsafe { Self::unregister_keys(sb.s_type) };
+
+        let ptr = sb.s_fs_info;
+        if !ptr.is_null() {
+            // SAFETY: The only place where `s_fs_info` is assigned is `NewSuperBlock::init`, where
+            // it's initialised with the result of a `to_pointer` call. We checked above that ptr
+            // is non-null because it would be null if we never reached the point where we init the
+            // field.
+            unsafe { T::Data::from_foreign(ptr) };
+        }
     }
 }
 
@@ -446,6 +530,172 @@ fn drop(&mut self) {
     }
 }
 
+/// State of [`NewSuperBlock`] that indicates that [`NewSuperBlock::init`] needs to be called
+/// eventually.
+pub struct NeedsInit;
+
+/// State of [`NewSuperBlock`] that indicates that [`NewSuperBlock::init_root`] needs to be called
+/// eventually.
+pub struct NeedsRoot;
+
+/// Required superblock parameters.
+///
+/// This is used in [`NewSuperBlock::init`].
+pub struct SuperParams {
+    /// The magic number of the superblock.
+    pub magic: u32,
+
+    /// The size of a block in powers of 2 (i.e., for a value of `n`, the size is `2^n`.
+    pub blocksize_bits: u8,
+
+    /// Maximum size of a file.
+    pub maxbytes: i64,
+
+    /// Granularity of c/m/atime in ns (cannot be worse than a second).
+    pub time_gran: u32,
+}
+
+impl SuperParams {
+    /// Default value for instances of [`SuperParams`].
+    pub const DEFAULT: Self = Self {
+        magic: 0,
+        blocksize_bits: crate::PAGE_SIZE as _,
+        maxbytes: bindings::MAX_LFS_FILESIZE,
+        time_gran: 1,
+    };
+}
+
+/// A superblock that is still being initialised.
+///
+/// It uses type states to ensure that callers use the right sequence of calls.
+///
+/// # Invariants
+///
+/// The superblock is a newly-created one and this is the only active pointer to it.
+pub struct NewSuperBlock<'a, T: Type + ?Sized, S = NeedsInit> {
+    sb: *mut bindings::super_block,
+    _p: PhantomData<(&'a T, S)>,
+}
+
+impl<'a, T: Type + ?Sized> NewSuperBlock<'a, T, NeedsInit> {
+    /// Creates a new instance of [`NewSuperBlock`].
+    ///
+    /// # Safety
+    ///
+    /// `sb` must point to a newly-created superblock and it must be the only active pointer to it.
+    unsafe fn new(sb: *mut bindings::super_block) -> Self {
+        // INVARIANT: The invariants are satisfied by the safety requirements of this function.
+        Self {
+            sb,
+            _p: PhantomData,
+        }
+    }
+
+    /// Initialises the superblock so that it transitions to the [`NeedsRoot`] type state.
+    pub fn init(
+        self,
+        data: T::Data,
+        params: &SuperParams,
+    ) -> Result<NewSuperBlock<'a, T, NeedsRoot>> {
+        // SAFETY: The type invariant guarantees that `self.sb` is the only pointer to a
+        // newly-allocated superblock, so it is safe to mutably reference it.
+        let sb = unsafe { &mut *self.sb };
+
+        sb.s_magic = params.magic as _;
+        sb.s_op = &Tables::<T>::SUPER_BLOCK;
+        sb.s_maxbytes = params.maxbytes;
+        sb.s_time_gran = params.time_gran;
+        sb.s_blocksize_bits = params.blocksize_bits;
+        sb.s_blocksize = 1;
+        if sb.s_blocksize.leading_zeros() < params.blocksize_bits.into() {
+            return Err(EINVAL);
+        }
+        sb.s_blocksize = 1 << sb.s_blocksize_bits;
+
+        // Keyed file systems already have `s_fs_info` initialised.
+        let info = data.into_foreign() as *mut _;
+        if let Super::Keyed = T::SUPER_TYPE {
+            // SAFETY: We just called `into_foreign` above.
+            unsafe { T::Data::from_foreign(info) };
+
+            if sb.s_fs_info != info {
+                return Err(EINVAL);
+            }
+        } else {
+            sb.s_fs_info = info;
+        }
+
+        Ok(NewSuperBlock {
+            sb: self.sb,
+            _p: PhantomData,
+        })
+    }
+}
+
+impl<'a, T: Type + ?Sized> NewSuperBlock<'a, T, NeedsRoot> {
+    /// Initialises the root of the superblock.
+    pub fn init_root(self) -> Result<&'a SuperBlock<T>> {
+        // The following is temporary code to create the root inode and dentry. It will be replaced
+        // once we allow inodes and dentries to be created directly from Rust code.
+
+        // SAFETY: `sb` is initialised (`NeedsRoot` typestate implies it), so it is safe to pass it
+        // to `new_inode`.
+        let inode = unsafe { bindings::new_inode(self.sb) };
+        if inode.is_null() {
+            return Err(ENOMEM);
+        }
+
+        {
+            // SAFETY: This is a newly-created inode. No other references to it exist, so it is
+            // safe to mutably dereference it.
+            let inode = unsafe { &mut *inode };
+
+            // SAFETY: `current_time` requires that `inode.sb` be valid, which is the case here
+            // since we allocated the inode through the superblock.
+            let time = unsafe { bindings::current_time(inode) };
+            inode.i_ino = 1;
+            inode.i_mode = (bindings::S_IFDIR | 0o755) as _;
+            inode.i_mtime = time;
+            inode.i_atime = time;
+            inode.i_ctime = time;
+
+            // SAFETY: `simple_dir_operations` never changes, it's safe to reference it.
+            inode.__bindgen_anon_3.i_fop = unsafe { &bindings::simple_dir_operations };
+
+            // SAFETY: `simple_dir_inode_operations` never changes, it's safe to reference it.
+            inode.i_op = unsafe { &bindings::simple_dir_inode_operations };
+
+            // SAFETY: `inode` is valid for write.
+            unsafe { bindings::set_nlink(inode, 2) };
+        }
+
+        // SAFETY: `d_make_root` requires that `inode` be valid and referenced, which is the
+        // case for this call.
+        //
+        // It takes over the inode, even on failure, so we don't need to clean it up.
+        let dentry = unsafe { bindings::d_make_root(inode) };
+        if dentry.is_null() {
+            return Err(ENOMEM);
+        }
+
+        // SAFETY: The typestate guarantees that `self.sb` is valid.
+        unsafe { (*self.sb).s_root = dentry };
+
+        // SAFETY: The typestate guarantees that `self.sb` is initialised and we just finished
+        // setting its root, so it's a fully ready superblock.
+        Ok(unsafe { &mut *self.sb.cast() })
+    }
+}
+
+/// A file system super block.
+///
+/// Wraps the kernel's `struct super_block`.
+#[repr(transparent)]
+pub struct SuperBlock<T: Type + ?Sized>(
+    pub(crate) UnsafeCell<bindings::super_block>,
+    PhantomData<T>,
+);
+
 /// Wraps the kernel's `struct inode`.
 ///
 /// # Invariants
diff --git a/rust/kernel/fs/param.rs b/rust/kernel/fs/param.rs
index f0b4393b6b67..44b4e895a1eb 100644
--- a/rust/kernel/fs/param.rs
+++ b/rust/kernel/fs/param.rs
@@ -487,9 +487,24 @@ macro_rules! count_brace_items {
 ///
 /// # impl fs::Type for Example {
 /// #    type Context = Self;
+/// #    const SUPER_TYPE: fs::Super = fs::Super::Independent;
 /// #    const NAME: &'static CStr = c_str!("example");
 /// #    const FLAGS: i32 = 0;
-/// #    const MAGIC: u32 = 0x6578616d;
+/// #
+/// #    fn fill_super<'a>(
+/// #        _data: Box<State>,
+/// #        sb: fs::NewSuperBlock<'_, Self>,
+/// #    ) -> Result<&fs::SuperBlock<Self>> {
+/// #        let sb = sb.init(
+/// #            (),
+/// #            &fs::SuperParams {
+/// #                magic: 0x6578616d,
+/// #                ..fs::SuperParams::DEFAULT
+/// #            },
+/// #        )?;
+/// #        let sb = sb.init_root()?;
+/// #        Ok(sb)
+/// #    }
 /// # }
 /// ```
 #[macro_export]
diff --git a/samples/rust/rust_fs.rs b/samples/rust/rust_fs.rs
index acaa603b0bb2..5d8880d5830b 100644
--- a/samples/rust/rust_fs.rs
+++ b/samples/rust/rust_fs.rs
@@ -41,9 +41,21 @@ fn try_new() -> Result {
 
 impl fs::Type for RustFs {
     type Context = Self;
+    const SUPER_TYPE: fs::Super = fs::Super::Independent;
     const NAME: &'static CStr = c_str!("rustfs");
     const FLAGS: i32 = fs::flags::USERNS_MOUNT;
-    const MAGIC: u32 = 0x72757374;
+
+    fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
+        let sb = sb.init(
+            (),
+            &fs::SuperParams {
+                magic: 0x72757374,
+                ..fs::SuperParams::DEFAULT
+            },
+        )?;
+        let sb = sb.init_root()?;
+        Ok(sb)
+    }
 }
 
 struct FsModule {
-- 
2.40.1

