Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC07EC7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238499AbjFIGyV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238392AbjFIGyO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:14 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C1730C8
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=16544; q=dns/txt;
  s=iport; t=1686293650; x=1687503250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fJlRtWb662kPMAWRaKH+gq+PCs5EFPBbSf66am0DDAw=;
  b=RxppblD/dnBxCSDGQIRrmcb7zCcV3rmItplP2UoPXAMKfQctDq9x22B9
   KqlWcSD3BBexKmrkIW3dFpCu4PsUc46agyX2eafz6QMQWCTfrdFtldWPr
   qkksyLjLOKOdLNPtBOzcO2Bt01iyVaAcDiexdf6I3zlTDwbWFD3sGYjG/
   o=;
X-IPAS-Result: =?us-ascii?q?A0AMAAAixoJklxbLJq1aHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBgyNVLhJHjG5fiFIDmWaEBYElA1YPAQEBDQEBOQsEAQGFBgKFdSY0C?=
 =?us-ascii?q?Q4BAgQBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQE3BRA1hWgNh?=
 =?us-ascii?q?gUDAycLAUYQIDFXGYJ+AYJcAxGtCIF5M4EBgmKCE5prgWiBQgGMFYVKQoFJR?=
 =?us-ascii?q?IEVgTyCLYJiAogiBIkdghIOC4JnjyiBKW+BHjlpfwIJAhFngQoIXIFzQAINV?=
 =?us-ascii?q?AsLY4EdglUCAhE8FFJiGR0DBwQCgQUQLwcEMigGCRgvJwZTBxcWJAkTFUIEg?=
 =?us-ascii?q?1kKgRBAFQ4RglwqAj1vAwkDBwVJQAMLGA1IESw1FB8GQ4EHF2OBfCQknkYDg?=
 =?us-ascii?q?lYUDgsHL0wJCgETGAQeY4EAGxIcLJJyjlOCFaAqhBKLfJUEGjOFV6N+mBaJa?=
 =?us-ascii?q?oNwiGuNGIQvAgQGBQIWgWM6O4EgMxoIGxWDIglJGQ+OLA0Jg1KGFRuJTEExO?=
 =?us-ascii?q?wIHCwEBAwmIbCyCLgEB?=
IronPort-Data: A9a23:24TQB6N7yLf49N/vrR2hl8FynXyQoLVcMsEvi/4bfWQNrUojgWRVm
 mIfWWiOM6mDYWryf41+YI6w/RxT6pDTzt5jTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgGPykUIYoBggrHVU/EHl52Uo48wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjhQC/YUnP/kcUFVsrgmOk4Ff2
 PZHkbXlHG/FPoWU8AgcexBVCWR1OrdLveKBKnmkusvVxErDG5fu66wxVwdtbctCor0xWzsmG
 f8wcFjhajiKguO93bayUcFnh98oK4/gO4Z3VnRIkmGEUqh3HPgvRY3AovIF+hgwl/tQQ7WEZ
 u4JMDZBQhPpNkgn1lA/UcJiw7jAamPEWyJVpEmSo6M5y2fUywN13f7mN9+9UsaXXtkQkEGC4
 2bH+XnpKg8VOcbZyjef9H+owOjVkkvGtJk6HbCis/9yh0ePg2oaFFsdVECwpr+yjUvWt89jx
 1I8whoBjrQ590ySXOLYYxq08VCUnRQ4co8FewEl0z2lxq3R6gefI2ELSD9dddAr3PPaoxR3h
 jdlePu0WVRSXK2ppWG1q+3P82LiUcQBBTJYPHVVJecQy4O7yLzfmC4jWf5FNMZZZPXcHTT92
 T3ClzQ3i93/ZuZSjPzmlbwrqxyoq4bOSgcz6m3qsoOZAuFROdTNi2+AsAazARN8wGCxFQDpU
 J8swZL20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4AvmsidR8yYptVI1cFh
 XM/XysPv/e/21P3PcdKj36ZUKzGMIC5T42+D6CIBjawSsEoJFTvEN5Sib64hjCxzxdEfVAXM
 paAesHkFmcBFali11KLqxQ1j9cWKtQF7TqLH/jTlk3/uZLHPS79dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WkOXCKqdNNdA9VRZX5bLivw/Fqmie4ClIOMAkc5zX5mNvNp6QNc3xpq9r1
IronPort-HdrOrdr: A9a23:aydWdaxGPiUTBZVTg4piKrPwA71zdoMgy1knxilNoNJuHvBw8P
 re+MjzuiWbtN98YhsdcJW7Scq9qBDnhPtICPcqXItKNTOO0ACVxcNZnOnfKlbbdBEWmNQx6Y
 5QN4BjFdz9CkV7h87m7AT9L8wt27C8gceVbJ/lr0uEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:fOfu6GwrePr2Dz3kFBZ5BgUsKu8GbnbezE7CGGqEDmo4Zq22Q3u5rfY=
X-Talos-MUID: 9a23:+AZZGQtQZ7xsC4BTes2njnZPaeFH47WVFh5Oy5Qiq5CIGwJ3EmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857695"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:37 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VICv055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:37 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 03/80] rust: define fs context
Date:   Fri,  9 Jun 2023 09:30:01 +0300
Message-Id: <20230609063118.24852-4-amiculas@cisco.com>
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

Also make fs mountable, but empty for now.

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
---
 rust/bindings/bindings_helper.h |   3 +
 rust/bindings/lib.rs            |   2 +
 rust/helpers.c                  |  12 ++
 rust/kernel/error.rs            |  46 +++++++
 rust/kernel/fs.rs               | 224 ++++++++++++++++++++++++++++++--
 rust/kernel/lib.rs              |   5 +
 samples/rust/rust_fs.rs         |  13 ++
 7 files changed, 297 insertions(+), 8 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index eeb5b7c0528a..556f2e7c3ddb 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -11,7 +11,10 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/fs.h>
+#include <linux/fs_parser.h>
 
 /* `bindgen` gets confused at certain things. */
 const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
 const gfp_t BINDINGS___GFP_ZERO = __GFP_ZERO;
+
+const loff_t BINDINGS_MAX_LFS_FILESIZE = MAX_LFS_FILESIZE;
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 9bcbea04dac3..cd1fceb31390 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -51,3 +51,5 @@ mod bindings_helper {
 
 pub const GFP_KERNEL: gfp_t = BINDINGS_GFP_KERNEL;
 pub const __GFP_ZERO: gfp_t = BINDINGS___GFP_ZERO;
+
+pub const MAX_LFS_FILESIZE: loff_t = BINDINGS_MAX_LFS_FILESIZE;
diff --git a/rust/helpers.c b/rust/helpers.c
index e00c53c94c43..d6f277c3b7a7 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -135,6 +135,18 @@ struct dentry *rust_helper_dget(struct dentry *dentry)
 }
 EXPORT_SYMBOL_GPL(rust_helper_dget);
 
+void rust_helper_lockdep_register_key(struct lock_class_key *key)
+{
+	lockdep_register_key(key);
+}
+EXPORT_SYMBOL_GPL(rust_helper_lockdep_register_key);
+
+void rust_helper_lockdep_unregister_key(struct lock_class_key *key)
+{
+	lockdep_unregister_key(key);
+}
+EXPORT_SYMBOL_GPL(rust_helper_lockdep_unregister_key);
+
 /*
  * We use `bindgen`'s `--size_t-is-usize` option to bind the C `size_t` type
  * as the Rust `usize` type, so we can use it in contexts where Rust
diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 7c1ce2bccd08..231f7dfd8005 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -296,3 +296,49 @@ pub(crate) fn from_result<T, F>(f: F) -> T
         Err(e) => T::from(e.to_errno() as i16),
     }
 }
+
+pub(crate) fn from_kernel_result_helper<T>(r: Result<T>) -> T
+where
+    T: From<i16>,
+{
+    match r {
+        Ok(v) => v,
+        // NO-OVERFLOW: negative `errno`s are no smaller than `-bindings::MAX_ERRNO`,
+        // `-bindings::MAX_ERRNO` fits in an `i16` as per invariant above,
+        // therefore a negative `errno` always fits in an `i16` and will not overflow.
+        Err(e) => T::from(e.to_errno() as i16),
+    }
+}
+
+/// Transforms a [`crate::error::Result<T>`] to a kernel C integer result.
+///
+/// This is useful when calling Rust functions that return [`crate::error::Result<T>`]
+/// from inside `extern "C"` functions that need to return an integer
+/// error result.
+///
+/// `T` should be convertible to an `i16` via `From<i16>`.
+///
+/// # Examples
+///
+/// ```ignore
+/// # use kernel::from_kernel_result;
+/// # use kernel::bindings;
+/// unsafe extern "C" fn probe_callback(
+///     pdev: *mut bindings::platform_device,
+/// ) -> core::ffi::c_int {
+///     from_kernel_result! {
+///         let ptr = devm_alloc(pdev)?;
+///         bindings::platform_set_drvdata(pdev, ptr);
+///         Ok(0)
+///     }
+/// }
+/// ```
+macro_rules! from_kernel_result {
+    ($($tt:tt)*) => {{
+        $crate::error::from_kernel_result_helper((|| {
+            $($tt)*
+        })())
+    }};
+}
+
+pub(crate) use from_kernel_result;
diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index b61e6f03e871..187f0c19dcd0 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -5,15 +5,162 @@
 //! C headers: [`include/linux/fs.h`](../../../../include/linux/fs.h)
 
 use crate::{bindings, error::code::*, str::CStr, ThisModule};
-use crate::error::{to_result, Result};
-use crate::types::AlwaysRefCounted;
+use crate::error::{to_result, from_kernel_result, Result};
+use crate::types::{AlwaysRefCounted, ForeignOwnable, ScopeGuard};
 use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin, ptr};
+use macros::vtable;
+
+/// A file system context.
+///
+/// It is used to gather configuration to then mount or reconfigure a file system.
+#[vtable]
+pub trait Context<T: Type + ?Sized> {
+    /// Type of the data associated with the context.
+    type Data: ForeignOwnable + Send + Sync + 'static;
+
+    /// Creates a new context.
+    fn try_new() -> Result<Self::Data>;
+}
+
+struct Tables<T: Type + ?Sized>(T);
+impl<T: Type + ?Sized> Tables<T> {
+    const CONTEXT: bindings::fs_context_operations = bindings::fs_context_operations {
+        free: Some(Self::free_callback),
+        parse_param: None,
+        get_tree: Some(Self::get_tree_callback),
+        reconfigure: Some(Self::reconfigure_callback),
+        parse_monolithic: None,
+        dup: None,
+    };
+
+    unsafe extern "C" fn free_callback(fc: *mut bindings::fs_context) {
+        // SAFETY: The callback contract guarantees that `fc` is valid.
+        let ptr = unsafe { (*fc).fs_private };
+        if !ptr.is_null() {
+            // SAFETY: `fs_private` was initialised with the result of a `to_pointer` call in
+            // `init_fs_context_callback`, so it's ok to call `from_foreign` here.
+            unsafe { <T::Context as Context<T>>::Data::from_foreign(ptr) };
+        }
+    }
+
+    unsafe extern "C" fn fill_super_callback(
+        sb_ptr: *mut bindings::super_block,
+        _fc: *mut bindings::fs_context,
+    ) -> core::ffi::c_int {
+        from_kernel_result! {
+            // The following is temporary code to create the root inode and dentry. It will be
+            // replaced with calls to Rust code.
+
+            // SAFETY: The callback contract guarantees that `sb_ptr` is the only pointer to a
+            // newly-allocated superblock, so it is safe to mutably reference it.
+            let sb = unsafe { &mut *sb_ptr };
+
+            sb.s_maxbytes = bindings::MAX_LFS_FILESIZE;
+            sb.s_blocksize = crate::PAGE_SIZE as _;
+            sb.s_blocksize_bits = bindings::PAGE_SHIFT as _;
+            sb.s_magic = T::MAGIC as _;
+            sb.s_op = &Tables::<T>::SUPER_BLOCK;
+            sb.s_time_gran = 1;
+
+            // Create and initialise the root inode.
+            let inode = unsafe { bindings::new_inode(sb) };
+            if inode.is_null() {
+                return Err(ENOMEM);
+            }
+
+            {
+                // SAFETY: This is a newly-created inode. No other references to it exist, so it is
+                // safe to mutably dereference it.
+                let inode = unsafe { &mut *inode };
+
+                // SAFETY: `current_time` requires that `inode.sb` be valid, which is the case here
+                // since we allocated the inode through the superblock.
+                let time = unsafe { bindings::current_time(inode) };
+                inode.i_ino = 1;
+                inode.i_mode = (bindings::S_IFDIR | 0o755) as _;
+                inode.i_mtime = time;
+                inode.i_atime = time;
+                inode.i_ctime = time;
+
+                // SAFETY: `simple_dir_operations` never changes, it's safe to reference it.
+                inode.__bindgen_anon_3.i_fop = unsafe { &bindings::simple_dir_operations };
+
+                // SAFETY: `simple_dir_inode_operations` never changes, it's safe to reference it.
+                inode.i_op = unsafe { &bindings::simple_dir_inode_operations };
+
+                // SAFETY: `inode` is valid for write.
+                unsafe { bindings::set_nlink(inode, 2) };
+            }
+
+            // SAFETY: `d_make_root` requires that `inode` be valid and referenced, which is the
+            // case for this call.
+            //
+            // It takes over the inode, even on failure, so we don't need to clean it up.
+            let dentry = unsafe { bindings::d_make_root(inode) };
+            if dentry.is_null() {
+                return Err(ENOMEM);
+            }
+
+            sb.s_root = dentry;
+            Ok(0)
+        }
+    }
+
+    unsafe extern "C" fn get_tree_callback(fc: *mut bindings::fs_context) -> core::ffi::c_int {
+        // SAFETY: `fc` is valid per the callback contract. `fill_super_callback` also has the
+        // right type and is a valid callback.
+        unsafe { bindings::get_tree_nodev(fc, Some(Self::fill_super_callback)) }
+    }
+
+    unsafe extern "C" fn reconfigure_callback(_fc: *mut bindings::fs_context) -> core::ffi::c_int {
+        EINVAL.to_errno()
+    }
+
+    const SUPER_BLOCK: bindings::super_operations = bindings::super_operations {
+        alloc_inode: None,
+        destroy_inode: None,
+        free_inode: None,
+        dirty_inode: None,
+        write_inode: None,
+        drop_inode: None,
+        evict_inode: None,
+        put_super: None,
+        sync_fs: None,
+        freeze_super: None,
+        freeze_fs: None,
+        thaw_super: None,
+        unfreeze_fs: None,
+        statfs: None,
+        remount_fs: None,
+        umount_begin: None,
+        show_options: None,
+        show_devname: None,
+        show_path: None,
+        show_stats: None,
+        #[cfg(CONFIG_QUOTA)]
+        quota_read: None,
+        #[cfg(CONFIG_QUOTA)]
+        quota_write: None,
+        #[cfg(CONFIG_QUOTA)]
+        get_dquots: None,
+        nr_cached_objects: None,
+        free_cached_objects: None,
+    };
+}
 
 /// A file system type.
 pub trait Type {
+    /// The context used to build fs configuration before it is mounted or reconfigured.
+    type Context: Context<Self> + ?Sized;
+
     /// The name of the file system type.
     const NAME: &'static CStr;
 
+    /// The magic number associated with the file system.
+    ///
+    /// This is normally one of the values in `include/uapi/linux/magic.h`.
+    const MAGIC: u32;
+
     /// The flags of this file system type.
     ///
     /// It is a combination of the flags in the [`flags`] module.
@@ -80,7 +227,7 @@ pub fn new() -> Self {
     /// The file system is described by the [`Type`] argument.
     ///
     /// It is automatically unregistered when the registration is dropped.
-    pub fn register<T: Type>(self: Pin<&mut Self>, module: &'static ThisModule) -> Result {
+    pub fn register<T: Type + ?Sized>(self: Pin<&mut Self>, module: &'static ThisModule) -> Result {
         // SAFETY: We never move out of `this`.
         let this = unsafe { self.get_unchecked_mut() };
 
@@ -94,20 +241,81 @@ pub fn register<T: Type>(self: Pin<&mut Self>, module: &'static ThisModule) -> R
         fs.fs_flags = T::FLAGS;
         fs.init_fs_context = Some(Self::init_fs_context_callback::<T>);
         fs.kill_sb = Some(Self::kill_sb_callback::<T>);
+
+        // SAFETY: This block registers all fs type keys with lockdep. We just need the memory
+        // locations to be owned by the caller, which is the case.
+        unsafe {
+            bindings::lockdep_register_key(&mut fs.s_lock_key);
+            bindings::lockdep_register_key(&mut fs.s_umount_key);
+            bindings::lockdep_register_key(&mut fs.s_vfs_rename_key);
+            bindings::lockdep_register_key(&mut fs.i_lock_key);
+            bindings::lockdep_register_key(&mut fs.i_mutex_key);
+            bindings::lockdep_register_key(&mut fs.invalidate_lock_key);
+            bindings::lockdep_register_key(&mut fs.i_mutex_dir_key);
+            for key in &mut fs.s_writers_key {
+                bindings::lockdep_register_key(key);
+            }
+        }
+
+        let ptr = this.fs.get();
+
+        // SAFETY: `ptr` as valid as it points to the `self.fs`.
+        let key_guard = ScopeGuard::new(|| unsafe { Self::unregister_keys(ptr) });
+
         // SAFETY: Pointers stored in `fs` are either static so will live for as long as the
         // registration is active (it is undone in `drop`).
-        to_result(unsafe { bindings::register_filesystem(this.fs.get()) })?;
+        to_result(unsafe { bindings::register_filesystem(ptr) })?;
+        key_guard.dismiss();
         this.is_registered = true;
         Ok(())
     }
 
-    unsafe extern "C" fn init_fs_context_callback<T: Type>(
-        _fc_ptr: *mut bindings::fs_context,
+    /// Unregisters the lockdep keys in the file system type.
+    ///
+    /// # Safety
+    ///
+    /// `fs` must be non-null and valid.
+    unsafe fn unregister_keys(fs: *mut bindings::file_system_type) {
+        // SAFETY: This block unregisters all fs type keys from lockdep. They must have been
+        // registered before.
+        unsafe {
+            bindings::lockdep_unregister_key(ptr::addr_of_mut!((*fs).s_lock_key));
+            bindings::lockdep_unregister_key(ptr::addr_of_mut!((*fs).s_umount_key));
+            bindings::lockdep_unregister_key(ptr::addr_of_mut!((*fs).s_vfs_rename_key));
+            bindings::lockdep_unregister_key(ptr::addr_of_mut!((*fs).i_lock_key));
+            bindings::lockdep_unregister_key(ptr::addr_of_mut!((*fs).i_mutex_key));
+            bindings::lockdep_unregister_key(ptr::addr_of_mut!((*fs).invalidate_lock_key));
+            bindings::lockdep_unregister_key(ptr::addr_of_mut!((*fs).i_mutex_dir_key));
+            for i in 0..(*fs).s_writers_key.len() {
+                bindings::lockdep_unregister_key(ptr::addr_of_mut!((*fs).s_writers_key[i]));
+            }
+        }
+    }
+
+    unsafe extern "C" fn init_fs_context_callback<T: Type + ?Sized>(
+        fc_ptr: *mut bindings::fs_context,
     ) -> core::ffi::c_int {
-        EINVAL.to_errno()
+        from_kernel_result! {
+            let data = T::Context::try_new()?;
+            // SAFETY: The callback contract guarantees that `fc_ptr` is the only pointer to a
+            // newly-allocated fs context, so it is safe to mutably reference it.
+            let fc = unsafe { &mut *fc_ptr };
+            fc.fs_private = data.into_foreign() as _;
+            fc.ops = &Tables::<T>::CONTEXT;
+            Ok(0)
+        }
     }
 
-    unsafe extern "C" fn kill_sb_callback<T: Type>(_sb_ptr: *mut bindings::super_block) {}
+    unsafe extern "C" fn kill_sb_callback<T: Type + ?Sized>(sb_ptr: *mut bindings::super_block) {
+        // SAFETY: We always call `get_tree_nodev` from `get_tree_callback`, so we never have a
+        // device, so it is ok to call the function below. Additionally, the callback contract
+        // guarantees that `sb_ptr` is valid.
+        unsafe { bindings::kill_anon_super(sb_ptr) }
+
+        // SAFETY: The callback contract guarantees that `sb_ptr` is valid, and the `kill_sb`
+        // callback being called implies that the `s_type` is also valid.
+        unsafe { Self::unregister_keys((*sb_ptr).s_type) };
+    }
 }
 
 impl Drop for Registration {
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 486f60912132..48da79b02422 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -98,3 +98,8 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
     // instead of `!`. See <https://github.com/rust-lang/rust-bindgen/issues/2094>.
     loop {}
 }
+
+/// Page size defined in terms of the `PAGE_SHIFT` macro from C.
+///
+/// [`PAGE_SHIFT`]: ../../../include/asm-generic/page.h
+pub const PAGE_SIZE: usize = 1 << bindings::PAGE_SHIFT;
diff --git a/samples/rust/rust_fs.rs b/samples/rust/rust_fs.rs
index 2caacea50e73..2bd4e563c694 100644
--- a/samples/rust/rust_fs.rs
+++ b/samples/rust/rust_fs.rs
@@ -13,9 +13,22 @@
 }
 
 struct RustFs;
+
+#[vtable]
+impl fs::Context<Self> for RustFs {
+    type Data = ();
+
+    fn try_new() -> Result {
+        pr_info!("context created!\n");
+        Ok(())
+    }
+}
+
 impl fs::Type for RustFs {
+    type Context = Self;
     const NAME: &'static CStr = c_str!("rustfs");
     const FLAGS: i32 = fs::flags::USERNS_MOUNT;
+    const MAGIC: u32 = 0x72757374;
 }
 
 struct FsModule {
-- 
2.40.1

