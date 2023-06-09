Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0619C7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237998AbjFIGy2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238531AbjFIGyQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:16 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589CE30D2
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=44629; q=dns/txt;
  s=iport; t=1686293650; x=1687503250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iMm8/xVravt+hbiFn2urImhmHf3ONW+zdfyFhao1Wnk=;
  b=DsYYw8gBqawS6dPP28wDIwpefM1JVsvRRiXMLUNdNLCxdt4IGWIM+6Bi
   SPbl4b96yHiTLsUayjEygadvG3GPP+DlB5o+C7DxPc3CzzdZiYQaaMAq2
   2JAcO35FWg+QQSzSXwCC9YcYonI8TegmD0oTffpSc94wV4L+EHrzKBuiE
   o=;
X-CSE-ConnectionGUID: AYhavslLRg2Mt5mbyAWuTQ==
X-CSE-MsgGUID: t+h8ir2RTymBkPSLVs4uMQ==
X-IPAS-Result: =?us-ascii?q?A0DfAwA2xoJk/xbLJq1aHgEBCxIMggQLgkgBIDtVLhJHj?=
 =?us-ascii?q?U2IUgOBE5AZjD8UgREDUQUPAQEBDQEBLgMTBAEBhQYChXUmNQgOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQECAQEFAQEBAgEHBIEKE4VoDYYFBhoBDAsBRhAgMVcQCYJ+A?=
 =?us-ascii?q?YIYRAOtGYF5M4EBgmKCE5prgWiBQowWgSKEKEKBSUSBFYE8gTd2hCqGXASJH?=
 =?us-ascii?q?YISDguCZ48ogSlvgR45aX8CCQIRZ4EKCFyBc0ACDVQLC2OBHYJVAgIRPBRSY?=
 =?us-ascii?q?hkdAwcEAoEFEC8HBDIoBgkYLycGUwcXFiQJExVCBINZCoEQQBUOEYJcKgI9b?=
 =?us-ascii?q?wMJAwcFSUADCxgNSBEsNRQfBkOBBxdjgXwkJJ5GghotJg4LBwEuAkMHCQoBC?=
 =?us-ascii?q?gkSNVYMCAdEGQEGARsSCQ0GKQOSODqOU4IVnXGBAoE3hBKLfJUEGjOEAYFWk?=
 =?us-ascii?q?gKQdoEGmBaWRYwALQYxNIQvAgQGBQIWgWUCODmBIDMaCBsVgyIJSRkPjiwWi?=
 =?us-ascii?q?COBRBuJTEExOwIHCwEBAwmIbCyCLgEB?=
IronPort-Data: A9a23:BfUMMqiPD+ELeCqDI6iYT7ZrX161IREKZh0ujC45NGQN5FlHY01je
 htvXGCBP6uDa2qjeo0iPIzn8EoP6sPRzIVmTFNk/3w3FCpjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+1H1dOCn9ScsvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZWHULOZ82QsaDlMtfrS8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVTmZk5tZkSXqkMqShrefUoMHKF0hU9/011llj3qo
 TlHncTYpQwBZsUglAmBOvVVO3kWAEFIxFPICVGOscWN1EniSXS25ukzCUsnFLIFxt8iVAmi9
 dRAQNwMRhmOnae9x6i2D7QqjcU4J86tN4Qa0p1i5WiGVrB9EdaZG/6Mv4UwMDQY3qiiGd7XY
 ssSdD5mdzzLYgZEPREcD5dWcOKA2SauImEG8Tp5o4IroGiDzRYr6oT8NfDWQueue94Jg2Oh8
 zeuE2PRR0ty2Mak4SWI/mmrgObBtSz8X40WGfuz8fsCqEeO3XBWBhoMEF+6p+SpolCxVsgZK
 EEO/Ccq668o+ySWosLVVhCi5X+cuQQAHtxZD6sx6RqGzezf5APx6nU4cwOtoecO7KceLQHGH
 HfQ9z81LVSDaIGodE8=
IronPort-HdrOrdr: A9a23:zcHTZatemcreP2qIdC3rsb3o7skDWdV00zEX/kB9WHVpmwKj+/
 xG+85rsSMc5wx+ZJhNo7q90ey7MBDhHP1OkOws1MmZPTUO0VHAROpfBMnZsl/d8kbFmdK1u5
 0MT4FOTPXtEFl3itv76gGkH9tl/MOK68mT9IDjJg9WLT2Dr8pbnn5E4sHxKDwReDV7
X-Talos-CUID: 9a23:iM//+myHiefDDyfM5AiNBgU9K8AsbGbZ6E3feWqkVGNjWZSqVGOprfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A3w2TPQ+57s1BHhsBorekvCOQf9sr4/SvEho3rYQ?=
 =?us-ascii?q?Dkcq8DghOIGuAqQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7799461"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:31:39 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VID2055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:38 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 08/80] WIP: rust: allow fs to be populated
Date:   Fri,  9 Jun 2023 09:30:06 +0300
Message-Id: <20230609063118.24852-9-amiculas@cisco.com>
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

---
 rust/bindings/bindings_helper.h |   4 +
 rust/bindings/lib.rs            |   3 +
 rust/helpers.c                  |   7 +
 rust/kernel/fs.rs               | 777 +++++++++++++++++++++++++++++---
 rust/kernel/fs/param.rs         |   8 +-
 rust/kernel/prelude.rs          |   1 -
 samples/rust/rust_fs.rs         |  51 ++-
 7 files changed, 778 insertions(+), 73 deletions(-)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index b4297f6cb99f..d15a698439e1 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -22,3 +22,7 @@ const gfp_t BINDINGS_GFP_KERNEL = GFP_KERNEL;
 const gfp_t BINDINGS___GFP_ZERO = __GFP_ZERO;
 
 const loff_t BINDINGS_MAX_LFS_FILESIZE = MAX_LFS_FILESIZE;
+
+const slab_flags_t BINDINGS_SLAB_RECLAIM_ACCOUNT = SLAB_RECLAIM_ACCOUNT;
+const slab_flags_t BINDINGS_SLAB_MEM_SPREAD = SLAB_MEM_SPREAD;
+const slab_flags_t BINDINGS_SLAB_ACCOUNT = SLAB_ACCOUNT;
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index cd1fceb31390..8655d73b6785 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -53,3 +53,6 @@ mod bindings_helper {
 pub const __GFP_ZERO: gfp_t = BINDINGS___GFP_ZERO;
 
 pub const MAX_LFS_FILESIZE: loff_t = BINDINGS_MAX_LFS_FILESIZE;
+
+pub const SLAB_RECLAIM_ACCOUNT: slab_flags_t = BINDINGS_SLAB_RECLAIM_ACCOUNT;
+pub const SLAB_MEM_SPREAD: slab_flags_t = BINDINGS_SLAB_MEM_SPREAD;
diff --git a/rust/helpers.c b/rust/helpers.c
index ffe62af5ee20..efbe9d917a57 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -191,6 +191,13 @@ void rust_helper_kunmap(struct page *page)
 }
 EXPORT_SYMBOL_GPL(rust_helper_kunmap);
 
+void *rust_helper_alloc_inode_sb(struct super_block *sb,
+		struct kmem_cache *cache, gfp_t gfp)
+{
+	return alloc_inode_sb(sb, cache, gfp);
+}
+EXPORT_SYMBOL_GPL(rust_helper_alloc_inode_sb);
+
 /*
  * We use `bindgen`'s `--size_t-is-usize` option to bind the C `size_t` type
  * as the Rust `usize` type, so we can use it in contexts where Rust
diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index 86c306c19e0a..2a0267b3c0b6 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -4,11 +4,20 @@
 //!
 //! C headers: [`include/linux/fs.h`](../../../../include/linux/fs.h)
 
+use crate::error::{from_kernel_result, to_result, Error, Result};
+use crate::file;
+use crate::types::{ARef, AlwaysRefCounted, ForeignOwnable, ScopeGuard};
+use crate::{
+    bindings, container_of, delay::coarse_sleep, error::code::*, pr_warn, str::CStr, ThisModule,
+};
 use alloc::boxed::Box;
-use crate::{bindings, error::code::*, str::CStr, ThisModule};
-use crate::error::{to_result, from_kernel_result, Error, Result};
-use crate::types::{AlwaysRefCounted, ForeignOwnable, ScopeGuard};
-use core::{cell::UnsafeCell, marker::PhantomData, marker::PhantomPinned, pin::Pin, ptr};
+use core::mem::{align_of, size_of, ManuallyDrop, MaybeUninit};
+use core::sync::atomic::{AtomicU64, Ordering};
+use core::time::Duration;
+use core::{
+    cell::UnsafeCell, marker::PhantomData, marker::PhantomPinned, ops::Deref, pin::Pin, ptr,
+};
+
 use macros::vtable;
 
 pub mod param;
@@ -81,7 +90,21 @@ fn tree_key(_data: &mut Self::Data) -> Result<T::Data> {
     }
 }
 
-struct Tables<T: Type + ?Sized>(T);
+/// An empty file system context.
+///
+/// That is, one that doesn't take any arguments and doesn't hold any state. It is a convenience
+/// type for file systems that don't need context for mounting/reconfiguring.
+pub struct EmptyContext;
+
+#[vtable]
+impl<T: Type + ?Sized> Context<T> for EmptyContext {
+    type Data = ();
+    fn try_new() -> Result {
+        Ok(())
+    }
+}
+
+pub(crate) struct Tables<T: Type + ?Sized>(T);
 impl<T: Type + ?Sized> Tables<T> {
     const CONTEXT: bindings::fs_context_operations = bindings::fs_context_operations {
         free: Some(Self::free_callback),
@@ -292,10 +315,18 @@ impl<T: Type + ?Sized> Tables<T> {
         }
     }
 
-    const SUPER_BLOCK: bindings::super_operations = bindings::super_operations {
-        alloc_inode: None,
+    pub(crate) const SUPER_BLOCK: bindings::super_operations = bindings::super_operations {
+        alloc_inode: if size_of::<T::INodeData>() != 0 {
+            Some(Self::alloc_inode_callback)
+        } else {
+            None
+        },
         destroy_inode: None,
-        free_inode: None,
+        free_inode: if size_of::<T::INodeData>() != 0 {
+            Some(Self::free_inode_callback)
+        } else {
+            None
+        },
         dirty_inode: None,
         write_inode: None,
         drop_inode: None,
@@ -322,16 +353,76 @@ impl<T: Type + ?Sized> Tables<T> {
         nr_cached_objects: None,
         free_cached_objects: None,
     };
+
+    unsafe extern "C" fn alloc_inode_callback(
+        sb: *mut bindings::super_block,
+    ) -> *mut bindings::inode {
+        // SAFETY: The callback contract guarantees that `sb` is valid for read.
+        let super_type = unsafe { (*sb).s_type };
+
+        // SAFETY: This callback is only used in `Registration`, so `super_type` is necessarily
+        // embedded in a `Registration`, which is guaranteed to be valid because it has a
+        // superblock associated to it.
+        let reg = unsafe { &*container_of!(super_type, Registration, fs) };
+
+        // SAFETY: `sb` and `reg.inode_cache` are guaranteed to be valid by the callback contract
+        // and by the existence of a superblock respectively.
+        let ptr = unsafe { bindings::alloc_inode_sb(sb, reg.inode_cache, bindings::GFP_KERNEL) }
+            as *mut INodeWithData<T::INodeData>;
+        if ptr.is_null() {
+            return ptr::null_mut();
+        }
+        reg.alloc_count.fetch_add(1, Ordering::Relaxed);
+        ptr::addr_of_mut!((*ptr).inode)
+    }
+
+    unsafe extern "C" fn free_inode_callback(inode: *mut bindings::inode) {
+        // SAFETY: The inode is guaranteed to be valid by the callback contract. Additionally, the
+        // superblock is also guaranteed to still be valid by the inode existence.
+        let super_type = unsafe { (*(*inode).i_sb).s_type };
+
+        // SAFETY: This callback is only used in `Registration`, so `super_type` is necessarily
+        // embedded in a `Registration`, which is guaranteed to be valid because it has a
+        // superblock associated to it.
+        let reg = unsafe { &*container_of!(super_type, Registration, fs) };
+        let ptr = container_of!(inode, INodeWithData<T::INodeData>, inode);
+
+        // SAFETY: The code in `try_new_inode` always initialises the inode data after allocating
+        // it, so it is safe to drop it here.
+        unsafe {
+            core::ptr::drop_in_place(
+                (*(ptr as *mut INodeWithData<T::INodeData>))
+                    .data
+                    .as_mut_ptr(),
+            )
+        };
+
+        // The callback contract guarantees that the inode was previously allocated via the
+        // `alloc_inode_callback` callback, so it is safe to free it back to the cache.
+        unsafe { bindings::kmem_cache_free(reg.inode_cache, ptr as _) };
+
+        reg.alloc_count.fetch_sub(1, Ordering::Release);
+    }
 }
 
 /// A file system type.
 pub trait Type {
     /// The context used to build fs configuration before it is mounted or reconfigured.
-    type Context: Context<Self> + ?Sized;
+    type Context: Context<Self> + ?Sized = EmptyContext;
+
+    /// Type of data allocated for each inode.
+    type INodeData: Send + Sync = ();
 
     /// Data associated with each file system instance.
     type Data: ForeignOwnable + Send + Sync = ();
 
+    /// Determines whether the filesystem is based on the dcache.
+    ///
+    /// When this is `true`, adding a dentry results in an increased refcount. Removing them
+    /// results in a matching decrement, and `kill_litter_super` is used when killing the
+    /// superblock so that these extra references are removed.
+    const DCACHE_BASED: bool = false;
+
     /// Determines how superblocks for this file system type are keyed.
     const SUPER_TYPE: Super;
 
@@ -377,10 +468,11 @@ pub mod flags {
 }
 
 /// A file system registration.
-#[derive(Default)]
 pub struct Registration {
     is_registered: bool,
     fs: UnsafeCell<bindings::file_system_type>,
+    inode_cache: *mut bindings::kmem_cache,
+    alloc_count: AtomicU64,
     _pin: PhantomPinned,
 }
 
@@ -401,6 +493,8 @@ pub fn new() -> Self {
         Self {
             is_registered: false,
             fs: UnsafeCell::new(bindings::file_system_type::default()),
+            inode_cache: ptr::null_mut(),
+            alloc_count: AtomicU64::new(0),
             _pin: PhantomPinned,
         }
     }
@@ -418,6 +512,29 @@ pub fn register<T: Type + ?Sized>(self: Pin<&mut Self>, module: &'static ThisMod
             return Err(EINVAL);
         }
 
+        if this.inode_cache.is_null() {
+            let size = size_of::<T::INodeData>();
+            if size != 0 {
+                // We only create the cache if the size is non-zero.
+                //
+                // SAFETY: `NAME` is static, so always valid.
+                this.inode_cache = unsafe {
+                    bindings::kmem_cache_create(
+                        T::NAME.as_char_ptr(),
+                        size_of::<INodeWithData<T::INodeData>>() as _,
+                        align_of::<INodeWithData<T::INodeData>>() as _,
+                        bindings::SLAB_RECLAIM_ACCOUNT
+                            | bindings::SLAB_MEM_SPREAD
+                            | bindings::SLAB_ACCOUNT,
+                        Some(Self::inode_init_once_callback::<T>),
+                    )
+                };
+                if this.inode_cache.is_null() {
+                    return Err(ENOMEM);
+                }
+            }
+        }
+
         let mut fs = this.fs.get_mut();
         fs.owner = module.0;
         fs.name = T::NAME.as_char_ptr();
@@ -496,6 +613,13 @@ unsafe fn unregister_keys(fs: *mut bindings::file_system_type) {
             // to call `kill_block_super`. Additionally, the callback contract guarantees that
             // `sb_ptr` is valid.
             unsafe { bindings::kill_block_super(sb_ptr) }
+        } else if T::DCACHE_BASED {
+            // SAFETY: We always call a `get_tree_nodev` variant from `get_tree_callback` without a
+            // device when `T::SUPER_TYPE` is not `BlockDev`, so we never have a device in such
+            // cases, therefore it is ok to call the function below. Additionally, the callback
+            // contract guarantees that `sb_ptr` is valid, and we have all positive dentries biased
+            // by +1 when `T::DCACHE_BASED`.
+            unsafe { bindings::kill_litter_super(sb_ptr) }
         } else {
             // SAFETY: We always call a `get_tree_nodev` variant from `get_tree_callback` without a
             // device when `T::SUPER_TYPE` is not `BlockDev`, so we never have a device in such
@@ -519,6 +643,35 @@ unsafe fn unregister_keys(fs: *mut bindings::file_system_type) {
             unsafe { T::Data::from_foreign(ptr) };
         }
     }
+
+    unsafe extern "C" fn inode_init_once_callback<T: Type + ?Sized>(
+        outer_inode: *mut core::ffi::c_void,
+    ) {
+        let ptr = outer_inode as *mut INodeWithData<T::INodeData>;
+        // This is only used in `register`, so we know that we have a valid `INodeWithData`
+        // instance whose inode part can be initialised.
+        unsafe { bindings::inode_init_once(ptr::addr_of_mut!((*ptr).inode)) };
+    }
+
+    fn has_super_blocks(&self) -> bool {
+        unsafe extern "C" fn fs_cb(_: *mut bindings::super_block, ptr: *mut core::ffi::c_void) {
+            // SAFETY: This function is only called below, while `ptr` is known to `has_sb`.
+            unsafe { *(ptr as *mut bool) = true };
+        }
+
+        let mut has_sb = false;
+        // SAFETY: `fs` is valid, and `fs_cb` only touches `has_sb` during the call.
+        unsafe {
+            bindings::iterate_supers_type(self.fs.get(), Some(fs_cb), (&mut has_sb) as *mut _ as _)
+        }
+        has_sb
+    }
+}
+
+impl Default for Registration {
+    fn default() -> Self {
+        Self::new()
+    }
 }
 
 impl Drop for Registration {
@@ -527,10 +680,59 @@ fn drop(&mut self) {
             // SAFETY: When `is_registered` is `true`, a previous call to `register_filesystem` has
             // succeeded, so it is safe to unregister here.
             unsafe { bindings::unregister_filesystem(self.fs.get()) };
+
+            // TODO: Test this.
+            if self.has_super_blocks() {
+                // If there are mounted superblocks of this registration, we cannot release the
+                // memory because it may be referenced, which would be a memory violation.
+                pr_warn!(
+                    "Attempting to unregister a file system (0x{:x}) with mounted super blocks\n",
+                    self.fs.get() as usize
+                );
+                while self.has_super_blocks() {
+                    pr_warn!("Sleeping 1s before retrying...\n");
+                    coarse_sleep(Duration::from_secs(1));
+                }
+            }
+        }
+
+        if !self.inode_cache.is_null() {
+            // Check if all inodes have been freed. If that's not the case, we may run into
+            // user-after-frees of the registration and kmem cache, so wait for it to drop to zero
+            // before proceeding.
+            //
+            // The expectation is that developers will fix this if they run into this warning.
+            if self.alloc_count.load(Ordering::Acquire) > 0 {
+                pr_warn!(
+                    "Attempting to unregister a file system (0x{:x}) with allocated inodes\n",
+                    self.fs.get() as usize
+                );
+                while self.alloc_count.load(Ordering::Acquire) > 0 {
+                    pr_warn!("Sleeping 1s before retrying...\n");
+                    coarse_sleep(Duration::from_secs(1));
+                }
+            }
+
+            // SAFETY: Just an FFI call with no additional safety requirements.
+            unsafe { bindings::rcu_barrier() };
+
+            // SAFETY: We know there are no more allocations in this cache and that it won't be
+            // used to allocate anymore because the filesystem is unregistered (so new mounts can't
+            // be created) and there are no more superblocks nor inodes.
+            //
+            // TODO: Can a dentry keep a file system alive? It looks like the answer is yes because
+            // it has a pointer to the superblock. How do we keep it alive? `d_init` may be an
+            // option to increment some count.
+            unsafe { bindings::kmem_cache_destroy(self.inode_cache) };
         }
     }
 }
 
+struct INodeWithData<T> {
+    data: MaybeUninit<T>,
+    inode: bindings::inode,
+}
+
 /// State of [`NewSuperBlock`] that indicates that [`NewSuperBlock::init`] needs to be called
 /// eventually.
 pub struct NeedsInit;
@@ -574,8 +776,10 @@ impl SuperParams {
 ///
 /// The superblock is a newly-created one and this is the only active pointer to it.
 pub struct NewSuperBlock<'a, T: Type + ?Sized, S = NeedsInit> {
-    sb: *mut bindings::super_block,
-    _p: PhantomData<(&'a T, S)>,
+    sb: &'a mut SuperBlock<T>,
+
+    // This also forces `'a` to be invariant.
+    _p: PhantomData<&'a mut &'a S>,
 }
 
 impl<'a, T: Type + ?Sized> NewSuperBlock<'a, T, NeedsInit> {
@@ -587,7 +791,8 @@ impl<'a, T: Type + ?Sized> NewSuperBlock<'a, T, NeedsInit> {
     unsafe fn new(sb: *mut bindings::super_block) -> Self {
         // INVARIANT: The invariants are satisfied by the safety requirements of this function.
         Self {
-            sb,
+            // SAFETY: The safety requirements ensure that `sb` is valid for dereference.
+            sb: unsafe { &mut *sb.cast() },
             _p: PhantomData,
         }
     }
@@ -598,9 +803,7 @@ pub fn init(
         data: T::Data,
         params: &SuperParams,
     ) -> Result<NewSuperBlock<'a, T, NeedsRoot>> {
-        // SAFETY: The type invariant guarantees that `self.sb` is the only pointer to a
-        // newly-allocated superblock, so it is safe to mutably reference it.
-        let sb = unsafe { &mut *self.sb };
+        let sb = self.sb.0.get_mut();
 
         sb.s_magic = params.magic as _;
         sb.s_op = &Tables::<T>::SUPER_BLOCK;
@@ -635,56 +838,214 @@ pub fn init(
 
 impl<'a, T: Type + ?Sized> NewSuperBlock<'a, T, NeedsRoot> {
     /// Initialises the root of the superblock.
-    pub fn init_root(self) -> Result<&'a SuperBlock<T>> {
-        // The following is temporary code to create the root inode and dentry. It will be replaced
-        // once we allow inodes and dentries to be created directly from Rust code.
+    pub fn init_root(self, dentry: RootDEntry<T>) -> Result<&'a SuperBlock<T>> {
+        self.sb.0.get_mut().s_root = ManuallyDrop::new(dentry).ptr;
+        Ok(self.sb)
+    }
 
-        // SAFETY: `sb` is initialised (`NeedsRoot` typestate implies it), so it is safe to pass it
-        // to `new_inode`.
-        let inode = unsafe { bindings::new_inode(self.sb) };
-        if inode.is_null() {
-            return Err(ENOMEM);
+    fn populate_dir(
+        &self,
+        parent: &DEntry<T>,
+        ino: &mut u64,
+        entries: &[Entry<'_, T>],
+        recursion: usize,
+    ) -> Result
+    where
+        T::INodeData: Clone,
+    {
+        if recursion == 0 {
+            return Err(E2BIG);
         }
 
-        {
-            // SAFETY: This is a newly-created inode. No other references to it exist, so it is
-            // safe to mutably dereference it.
-            let inode = unsafe { &mut *inode };
+        for e in entries {
+            *ino += 1;
+            match e {
+                Entry::File(name, mode, value, inode_create) => {
+                    let params = INodeParams {
+                        mode: *mode,
+                        ino: *ino,
+                        value: value.clone(),
+                    };
+                    let inode = inode_create(self, params)?;
+                    self.try_new_dentry(inode, parent, name)?;
+                }
+                Entry::Special(name, mode, value, typ, dev) => {
+                    let params = INodeParams {
+                        mode: *mode,
+                        ino: *ino,
+                        value: value.clone(),
+                    };
+                    let inode = self.sb.try_new_special_inode(*typ, *dev, params)?;
+                    self.try_new_dentry(inode, parent, name)?;
+                }
+                Entry::Directory(name, mode, value, dir_entries) => {
+                    let params = INodeParams {
+                        mode: *mode,
+                        ino: *ino,
+                        value: value.clone(),
+                    };
+                    let inode = self.sb.try_new_dcache_dir_inode(params)?;
+                    let new_parent = self.try_new_dentry(inode, parent, name)?;
+                    self.populate_dir(&new_parent, ino, dir_entries, recursion - 1)?;
+                }
+            }
+        }
 
-            // SAFETY: `current_time` requires that `inode.sb` be valid, which is the case here
-            // since we allocated the inode through the superblock.
-            let time = unsafe { bindings::current_time(inode) };
-            inode.i_ino = 1;
-            inode.i_mode = (bindings::S_IFDIR | 0o755) as _;
-            inode.i_mtime = time;
-            inode.i_atime = time;
-            inode.i_ctime = time;
+        Ok(())
+    }
 
-            // SAFETY: `simple_dir_operations` never changes, it's safe to reference it.
-            inode.__bindgen_anon_3.i_fop = unsafe { &bindings::simple_dir_operations };
+    /// Creates a new root dentry populated with the given entries.
+    pub fn try_new_populated_root_dentry(
+        &self,
+        root_value: T::INodeData,
+        entries: &[Entry<'_, T>],
+    ) -> Result<RootDEntry<T>>
+    where
+        T::INodeData: Clone,
+    {
+        let root_inode = self.sb.try_new_dcache_dir_inode(INodeParams {
+            mode: 0o755,
+            ino: 1,
+            value: root_value,
+        })?;
+        let root = self.try_new_root_dentry(root_inode)?;
+        let mut ino = 1u64;
+        self.populate_dir(&root, &mut ino, entries, 10)?;
+        Ok(root)
+    }
 
-            // SAFETY: `simple_dir_inode_operations` never changes, it's safe to reference it.
-            inode.i_op = unsafe { &bindings::simple_dir_inode_operations };
+    /// Creates a new empty root dentry.
+    pub fn try_new_root_dentry(&self, inode: ARef<INode<T>>) -> Result<RootDEntry<T>> {
+        // SAFETY: The inode is referenced, so it is safe to read the read-only field `i_sb`.
+        if unsafe { (*inode.0.get()).i_sb } != self.sb.0.get() {
+            return Err(EINVAL);
+        }
 
-            // SAFETY: `inode` is valid for write.
-            unsafe { bindings::set_nlink(inode, 2) };
+        // SAFETY: The caller owns a reference to the inode, so it is valid. The reference is
+        // transferred to the callee.
+        let dentry =
+            ptr::NonNull::new(unsafe { bindings::d_make_root(ManuallyDrop::new(inode).0.get()) })
+                .ok_or(ENOMEM)?;
+        Ok(RootDEntry {
+            ptr: dentry.as_ptr(),
+            _p: PhantomData,
+        })
+    }
+
+    /// Creates a new dentry with the given name, under the given parent, and backed by the given
+    /// inode.
+    pub fn try_new_dentry(
+        &self,
+        inode: ARef<INode<T>>,
+        parent: &DEntry<T>,
+        name: &CStr,
+    ) -> Result<ARef<DEntry<T>>> {
+        // SAFETY: Both `inode` and `parent` are referenced, so it is safe to read the read-only
+        // fields `i_sb` and `d_sb`.
+        if unsafe { (*parent.0.get()).d_sb } != self.sb.0.get()
+            || unsafe { (*inode.0.get()).i_sb } != self.sb.0.get()
+        {
+            return Err(EINVAL);
         }
 
-        // SAFETY: `d_make_root` requires that `inode` be valid and referenced, which is the
-        // case for this call.
-        //
-        // It takes over the inode, even on failure, so we don't need to clean it up.
-        let dentry = unsafe { bindings::d_make_root(inode) };
-        if dentry.is_null() {
-            return Err(ENOMEM);
+        // SAFETY: `parent` is valid (we have a shared reference to it), and `name` is valid for
+        // the duration of the call (the callee makes a copy of the name).
+        let dentry = ptr::NonNull::new(unsafe {
+            bindings::d_alloc_name(parent.0.get(), name.as_char_ptr())
+        })
+        .ok_or(ENOMEM)?;
+
+        // SAFETY: `dentry` was just allocated so it is valid. The callee takes over the reference
+        // to the inode.
+        unsafe { bindings::d_add(dentry.as_ptr(), ManuallyDrop::new(inode).0.get()) };
+
+        // SAFETY: `dentry` was just allocated, and the caller holds a reference, which it
+        // transfers to `dref`.
+        let dref = unsafe { ARef::from_raw(dentry.cast::<DEntry<T>>()) };
+
+        if T::DCACHE_BASED {
+            // Bias the refcount by +1 when adding a positive dentry.
+            core::mem::forget(dref.clone());
         }
 
-        // SAFETY: The typestate guarantees that `self.sb` is valid.
-        unsafe { (*self.sb).s_root = dentry };
+        Ok(dref)
+    }
+
+    /// Creates a new inode that is a directory.
+    ///
+    /// The directory is based on the dcache, implemented by `simple_dir_operations` and
+    /// `simple_dir_inode_operations`.
+    pub fn try_new_dcache_dir_inode(
+        &self,
+        params: INodeParams<T::INodeData>,
+    ) -> Result<ARef<INode<T>>> {
+        self.sb.try_new_dcache_dir_inode(params)
+    }
 
-        // SAFETY: The typestate guarantees that `self.sb` is initialised and we just finished
-        // setting its root, so it's a fully ready superblock.
-        Ok(unsafe { &mut *self.sb.cast() })
+    /// Creates a new "special" inode.
+    pub fn try_new_special_inode(
+        &self,
+        typ: INodeSpecialType,
+        rdev: Option<u32>,
+        params: INodeParams<T::INodeData>,
+    ) -> Result<ARef<INode<T>>> {
+        self.sb.try_new_special_inode(typ, rdev, params)
+    }
+
+    /// Creates a new regular file inode.
+    pub fn try_new_file_inode<F: file::Operations<OpenData = T::INodeData>>(
+        &self,
+        params: INodeParams<T::INodeData>,
+    ) -> Result<ARef<INode<T>>> {
+        self.sb.try_new_file_inode::<F>(params)
+    }
+}
+
+/// The type of a special inode.
+///
+/// This is used in functions like [`SuperBlock::try_new_special_inode`] to specify the type of
+/// an special inode; in this example, it's for it to be created.
+#[derive(Clone, Copy)]
+#[repr(u16)]
+pub enum INodeSpecialType {
+    /// Character device.
+    Char = bindings::S_IFCHR as _,
+
+    /// Block device.
+    Block = bindings::S_IFBLK as _,
+
+    /// A pipe (FIFO, first-in first-out) inode.
+    Fifo = bindings::S_IFIFO as _,
+
+    /// A unix-domain socket.
+    Sock = bindings::S_IFSOCK as _,
+}
+
+/// Required inode parameters.
+///
+/// This is used when creating new inodes.
+pub struct INodeParams<T> {
+    /// The access mode. It's a mask that grants execute (1), write (2) and read (4) access to
+    /// everyone, the owner group, and the owner.
+    pub mode: u16,
+
+    /// Number of the inode.
+    pub ino: u64,
+
+    /// Value to attach to this node.
+    pub value: T,
+}
+
+struct FsAdapter<T: Type + ?Sized>(PhantomData<T>);
+impl<T: Type + ?Sized> file::OpenAdapter<T::INodeData> for FsAdapter<T> {
+    unsafe fn convert(
+        inode: *mut bindings::inode,
+        _file: *mut bindings::file,
+    ) -> *const T::INodeData {
+        let ptr = container_of!(inode, INodeWithData<T::INodeData>, inode);
+        // SAFETY: Add safety annotation.
+        let outer = unsafe { &*ptr };
+        outer.data.as_ptr()
     }
 }
 
@@ -697,6 +1058,95 @@ pub struct SuperBlock<T: Type + ?Sized>(
     PhantomData<T>,
 );
 
+impl<T: Type + ?Sized> SuperBlock<T> {
+    fn try_new_inode(
+        &self,
+        mode_type: u16,
+        params: INodeParams<T::INodeData>,
+        init: impl FnOnce(&mut bindings::inode),
+    ) -> Result<ARef<INode<T>>> {
+        // SAFETY: `sb` is initialised (`NeedsRoot` typestate implies it), so it is safe to pass it
+        // to `new_inode`.
+        let inode =
+            ptr::NonNull::new(unsafe { bindings::new_inode(self.0.get()) }).ok_or(ENOMEM)?;
+
+        {
+            let ptr = container_of!(inode.as_ptr(), INodeWithData<T::INodeData>, inode);
+
+            // SAFETY: This is a newly-created inode. No other references to it exist, so it is
+            // safe to mutably dereference it.
+            let outer = unsafe { &mut *(ptr as *mut INodeWithData<T::INodeData>) };
+
+            // N.B. We must always write this to a newly allocated inode because the free callback
+            // expects the data to be initialised and drops it.
+            outer.data.write(params.value);
+
+            // SAFETY: `current_time` requires that `inode.sb` be valid, which is the case here
+            // since we allocated the inode through the superblock.
+            let time = unsafe { bindings::current_time(&mut outer.inode) };
+            outer.inode.i_mtime = time;
+            outer.inode.i_atime = time;
+            outer.inode.i_ctime = time;
+
+            outer.inode.i_ino = params.ino;
+            outer.inode.i_mode = params.mode & 0o777 | mode_type;
+
+            init(&mut outer.inode);
+        }
+
+        // SAFETY: `inode` only has one reference, and it's being relinquished to the `ARef`
+        // instance.
+        Ok(unsafe { ARef::from_raw(inode.cast()) })
+    }
+
+    /// Creates a new inode that is a directory.
+    ///
+    /// The directory is based on the dcache, implemented by `simple_dir_operations` and
+    /// `simple_dir_inode_operations`.
+    pub fn try_new_dcache_dir_inode(
+        &self,
+        params: INodeParams<T::INodeData>,
+    ) -> Result<ARef<INode<T>>> {
+        self.try_new_inode(bindings::S_IFDIR as _, params, |inode| {
+            // SAFETY: `simple_dir_operations` never changes, it's safe to reference it.
+            inode.__bindgen_anon_3.i_fop = unsafe { &bindings::simple_dir_operations };
+
+            // SAFETY: `simple_dir_inode_operations` never changes, it's safe to reference it.
+            inode.i_op = unsafe { &bindings::simple_dir_inode_operations };
+
+            // Directory inodes start off with i_nlink == 2 (for "." entry).
+            // SAFETY: `inode` is valid for write.
+            unsafe { bindings::inc_nlink(inode) };
+        })
+    }
+
+    /// Creates a new "special" inode.
+    pub fn try_new_special_inode(
+        &self,
+        typ: INodeSpecialType,
+        rdev: Option<u32>,
+        params: INodeParams<T::INodeData>,
+    ) -> Result<ARef<INode<T>>> {
+        // SAFETY: `inode` is valid as it's a mutable reference.
+        self.try_new_inode(typ as _, params, |inode| unsafe {
+            bindings::init_special_inode(inode, inode.i_mode, rdev.unwrap_or(0))
+        })
+    }
+
+    /// Creates a new regular file inode.
+    pub fn try_new_file_inode<F: file::Operations<OpenData = T::INodeData>>(
+        &self,
+        params: INodeParams<T::INodeData>,
+    ) -> Result<ARef<INode<T>>> {
+        self.try_new_inode(bindings::S_IFREG as _, params, |inode| {
+            // SAFETY: The adapter is compatible because it assumes an inode created by a `T` file
+            // system, which is the case here.
+            inode.__bindgen_anon_3.i_fop =
+                unsafe { file::OperationsVtable::<FsAdapter<T>, F>::build() };
+        })
+    }
+}
+
 /// Wraps the kernel's `struct inode`.
 ///
 /// # Invariants
@@ -704,10 +1154,19 @@ pub struct SuperBlock<T: Type + ?Sized>(
 /// Instances of this type are always ref-counted, that is, a call to `ihold` ensures that the
 /// allocation remains valid at least until the matching call to `iput`.
 #[repr(transparent)]
-pub struct INode(pub(crate) UnsafeCell<bindings::inode>);
+pub struct INode<T: Type + ?Sized>(pub(crate) UnsafeCell<bindings::inode>, PhantomData<T>);
+
+impl<T: Type + ?Sized> INode<T> {
+    /// Returns the file-system-determined data associated with the inode.
+    pub fn fs_data(&self) -> &T::INodeData {
+        let ptr = container_of!(self.0.get(), INodeWithData<T::INodeData>, inode);
+        // SAFETY: Add safety annotation.
+        unsafe { (*ptr::addr_of!((*ptr).data)).assume_init_ref() }
+    }
+}
 
 // SAFETY: The type invariants guarantee that `INode` is always ref-counted.
-unsafe impl AlwaysRefCounted for INode {
+unsafe impl<T: Type + ?Sized> AlwaysRefCounted for INode<T> {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
         unsafe { bindings::ihold(self.0.get()) };
@@ -726,10 +1185,10 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
 /// Instances of this type are always ref-counted, that is, a call to `dget` ensures that the
 /// allocation remains valid at least until the matching call to `dput`.
 #[repr(transparent)]
-pub struct DEntry(pub(crate) UnsafeCell<bindings::dentry>);
+pub struct DEntry<T: Type + ?Sized>(pub(crate) UnsafeCell<bindings::dentry>, PhantomData<T>);
 
 // SAFETY: The type invariants guarantee that `DEntry` is always ref-counted.
-unsafe impl AlwaysRefCounted for DEntry {
+unsafe impl<T: Type + ?Sized> AlwaysRefCounted for DEntry<T> {
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
         unsafe { bindings::dget(self.0.get()) };
@@ -741,6 +1200,45 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
 
+/// A dentry that is meant to be used as the root of a file system.
+///
+/// We have a specific type for the root dentry because we may need to do extra work when it is
+/// dropped. For example, if [`Type::DCACHE_BASED`] is `true`, we need to remove the extra
+/// reference held on each child dentry.
+///
+/// # Invariants
+///
+/// `ptr` is always valid and ref-counted.
+pub struct RootDEntry<T: Type + ?Sized> {
+    ptr: *mut bindings::dentry,
+    _p: PhantomData<T>,
+}
+
+impl<T: Type + ?Sized> Deref for RootDEntry<T> {
+    type Target = DEntry<T>;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: Add safety annotation.
+        unsafe { &*self.ptr.cast() }
+    }
+}
+
+impl<T: Type + ?Sized> Drop for RootDEntry<T> {
+    fn drop(&mut self) {
+        if T::DCACHE_BASED {
+            // All dentries have an extra ref on them, so we use `d_genocide` to drop it.
+            // SAFETY: Add safety annotation.
+            unsafe { bindings::d_genocide(self.ptr) };
+
+            // SAFETY: Add safety annotation.
+            unsafe { bindings::shrink_dcache_parent(self.ptr) };
+        }
+
+        // SAFETY: Add safety annotation.
+        unsafe { bindings::dput(self.ptr) };
+    }
+}
+
 /// Wraps the kernel's `struct filename`.
 #[repr(transparent)]
 pub struct Filename(pub(crate) UnsafeCell<bindings::filename>);
@@ -776,6 +1274,11 @@ fn init(_name: &'static CStr, module: &'static ThisModule) -> Result<Self> {
     }
 }
 
+/// Returns a device id from its major and minor components.
+pub const fn mkdev(major: u16, minor: u32) -> u32 {
+    (major as u32) << bindings::MINORBITS | minor
+}
+
 /// Declares a kernel module that exposes a single file system.
 ///
 /// The `type` argument must be a type which implements the [`Type`] trait. Also accepts various
@@ -797,16 +1300,7 @@ fn init(_name: &'static CStr, module: &'static ThisModule) -> Result<Self> {
 ///
 /// struct MyFs;
 ///
-/// #[vtable]
-/// impl fs::Context<Self> for MyFs {
-///     type Data = ();
-///     fn try_new() -> Result {
-///         Ok(())
-///     }
-/// }
-///
 /// impl fs::Type for MyFs {
-///     type Context = Self;
 ///     const SUPER_TYPE: fs::Super = fs::Super::Independent;
 ///     const NAME: &'static CStr = c_str!("example");
 ///     const FLAGS: i32 = 0;
@@ -819,7 +1313,13 @@ fn init(_name: &'static CStr, module: &'static ThisModule) -> Result<Self> {
 ///                 ..fs::SuperParams::DEFAULT
 ///             },
 ///         )?;
-///         let sb = sb.init_root()?;
+///         let root_inode = sb.try_new_dcache_dir_inode(fs::INodeParams {
+///             mode: 0o755,
+///             ino: 1,
+///             value: (),
+///         })?;
+///         let root = sb.try_new_root_dentry(root_inode)?;
+///         let sb = sb.init_root(root)?;
 ///         Ok(sb)
 ///     }
 /// }
@@ -834,3 +1334,144 @@ macro_rules! module_fs {
         }
     }
 }
+
+/// Defines a slice of file system entries.
+///
+/// This is meant as a helper for the definition of file system entries in a more compact form than
+/// if declared directly using the types.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::prelude::*;
+/// use kernel::{c_str, file, fs};
+///
+/// struct MyFs;
+///
+/// impl fs::Type for MyFs {
+///     type INodeData = &'static [u8];
+///
+///     // ...
+/// #    const SUPER_TYPE: fs::Super = fs::Super::Independent;
+/// #    const NAME: &'static CStr = c_str!("example");
+/// #    const FLAGS: i32 = fs::flags::USERNS_MOUNT;
+/// #    const DCACHE_BASED: bool = true;
+/// #
+/// #    fn fill_super(_: (), _: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
+/// #        todo!()
+/// #    }
+/// }
+///
+/// struct MyFile;
+///
+/// #[vtable]
+/// impl file::Operations for MyFile {
+///     type OpenData = &'static [u8];
+///
+///     // ...
+/// #    fn open(_context: &Self::OpenData, _file: &file::File) -> Result<Self::Data> {
+/// #        Ok(())
+/// #    }
+/// }
+///
+/// const ENTRIES: &[fs::Entry<'_, MyFs>] = kernel::fs_entries![
+///     file("test1", 0o600, "abc\n".as_bytes(), MyFile),
+///     file("test2", 0o600, "def\n".as_bytes(), MyFile),
+///     char("test3", 0o600, [].as_slice(), (10, 125)),
+///     sock("test4", 0o755, [].as_slice()),
+///     fifo("test5", 0o755, [].as_slice()),
+///     block("test6", 0o755, [].as_slice(), (1, 1)),
+///     dir(
+///         "dir1",
+///         0o755,
+///         [].as_slice(),
+///         [
+///             file("test1", 0o600, "abc\n".as_bytes(), MyFile),
+///             file("test2", 0o600, "def\n".as_bytes(), MyFile),
+///         ],
+///     ),
+/// ];
+/// ```
+#[macro_export]
+macro_rules! fs_entries {
+    ($($kind:ident ($($t:tt)*)),* $(,)?) => {
+        &[
+            $($crate::fs_entries!(@single $kind($($t)*)),)*
+        ]
+    };
+    (@single file($name:literal, $mode:expr, $value:expr, $file_ops:ty $(,)?)) => {
+        $crate::fs::Entry::File(
+            $crate::c_str!($name),
+            $mode,
+            $value,
+            $crate::fs::file_creator::<_, $file_ops>(),
+        )
+    };
+    (@single dir($name:literal, $mode:expr, $value:expr, [$($t:tt)*] $(,)?)) => {
+        $crate::fs::Entry::Directory(
+            $crate::c_str!($name),
+            $mode,
+            $value,
+            $crate::fs_entries!($($t)*),
+        )
+    };
+    (@single nod($name:literal, $mode:expr, $value:expr, $nod_type:ident, $dev:expr $(,)?)) => {
+        $crate::fs::Entry::Special(
+            $crate::c_str!($name),
+            $mode,
+            $value,
+            $crate::fs::INodeSpecialType::$nod_type,
+            $dev,
+        )
+    };
+    (@single char($name:literal, $mode:expr, $value:expr, ($major:expr, $minor:expr) $(,)?)) => {
+        $crate::fs_entries!(
+            @single nod($name, $mode, $value, Char, Some($crate::fs::mkdev($major, $minor))))
+    };
+    (@single block($name:literal, $mode:expr, $value:expr, ($major:expr, $minor:expr) $(,)?)) => {
+        $crate::fs_entries!(
+            @single nod($name, $mode, $value, Block, Some($crate::fs::mkdev($major, $minor))))
+    };
+    (@single sock($name:literal, $mode:expr, $value:expr $(,)?)) => {
+        $crate::fs_entries!(@single nod($name, $mode, $value, Sock, None))
+    };
+    (@single fifo($name:literal, $mode:expr, $value:expr $(,)?)) => {
+        $crate::fs_entries!(@single nod($name, $mode, $value, Fifo, None))
+    };
+}
+
+/// A file system entry.
+///
+/// This is used statically describe the files and directories of a file system in functions that
+/// take such data as arguments, for example, [`NewSuperBlock::try_new_populated_root_dentry`].
+pub enum Entry<'a, T: Type + ?Sized> {
+    /// A regular file.
+    File(&'a CStr, u16, T::INodeData, INodeCreator<T>),
+
+    /// A directory and its children.
+    Directory(&'a CStr, u16, T::INodeData, &'a [Entry<'a, T>]),
+
+    /// A special file, the type of which is given by [`INodeSpecialType`].
+    Special(&'a CStr, u16, T::INodeData, INodeSpecialType, Option<u32>),
+}
+
+/// A function that creates and inode.
+pub type INodeCreator<T> = fn(
+    &NewSuperBlock<'_, T, NeedsRoot>,
+    INodeParams<<T as Type>::INodeData>,
+) -> Result<ARef<INode<T>>>;
+
+/// Returns an [`INodeCreator`] that creates a regular file with the given file operations.
+///
+/// This is used by the [`fs_entries`] macro to elide the type implementing the [`file::Operations`]
+/// trait.
+pub const fn file_creator<T: Type + ?Sized, F: file::Operations<OpenData = T::INodeData>>(
+) -> INodeCreator<T> {
+    fn file_creator<T: Type + ?Sized, F: file::Operations<OpenData = T::INodeData>>(
+        new_sb: &NewSuperBlock<'_, T, NeedsRoot>,
+        params: INodeParams<T::INodeData>,
+    ) -> Result<ARef<INode<T>>> {
+        new_sb.sb.try_new_file_inode::<F>(params)
+    }
+    file_creator::<T, F>
+}
diff --git a/rust/kernel/fs/param.rs b/rust/kernel/fs/param.rs
index 44b4e895a1eb..1a31130c6d1e 100644
--- a/rust/kernel/fs/param.rs
+++ b/rust/kernel/fs/param.rs
@@ -502,7 +502,13 @@ macro_rules! count_brace_items {
 /// #                ..fs::SuperParams::DEFAULT
 /// #            },
 /// #        )?;
-/// #        let sb = sb.init_root()?;
+/// #        let root_inode = sb.try_new_dcache_dir_inode(fs::INodeParams {
+/// #            mode: 0o755,
+/// #            ino: 1,
+/// #            value: (),
+/// #        })?;
+/// #        let root = sb.try_new_root_dentry(root_inode)?;
+/// #        let sb = sb.init_root(root)?;
 /// #        Ok(sb)
 /// #    }
 /// # }
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 37789bc8a796..c28587d68ebc 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -28,7 +28,6 @@
 pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
 
 pub use super::{init, pin_init, try_init, try_pin_init};
-pub use super::{module_fs, module_misc_device};
 
 pub use super::static_assert;
 
diff --git a/samples/rust/rust_fs.rs b/samples/rust/rust_fs.rs
index 064ead97dd98..18fd4542863b 100644
--- a/samples/rust/rust_fs.rs
+++ b/samples/rust/rust_fs.rs
@@ -3,7 +3,7 @@
 //! Rust file system sample.
 
 use kernel::prelude::*;
-use kernel::{c_str, fs};
+use kernel::{c_str, file, fs, io_buffer::IoBufferWriter};
 
 module_fs! {
     type: RustFs,
@@ -34,16 +34,17 @@ impl fs::Context<Self> for RustFs {
     }
 
     fn try_new() -> Result {
-        pr_info!("context created!\n");
         Ok(())
     }
 }
 
 impl fs::Type for RustFs {
     type Context = Self;
+    type INodeData = &'static [u8];
     const SUPER_TYPE: fs::Super = fs::Super::Independent;
     const NAME: &'static CStr = c_str!("rustfs");
     const FLAGS: i32 = fs::flags::USERNS_MOUNT;
+    const DCACHE_BASED: bool = true;
 
     fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
         let sb = sb.init(
@@ -53,7 +54,51 @@ fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBl
                 ..fs::SuperParams::DEFAULT
             },
         )?;
-        let sb = sb.init_root()?;
+        let root = sb.try_new_populated_root_dentry(
+            &[],
+            kernel::fs_entries![
+                file("test1", 0o600, "abc\n".as_bytes(), FsFile),
+                file("test2", 0o600, "def\n".as_bytes(), FsFile),
+                char("test3", 0o600, [].as_slice(), (10, 125)),
+                sock("test4", 0o755, [].as_slice()),
+                fifo("test5", 0o755, [].as_slice()),
+                block("test6", 0o755, [].as_slice(), (1, 1)),
+                dir(
+                    "dir1",
+                    0o755,
+                    [].as_slice(),
+                    [
+                        file("test1", 0o600, "abc\n".as_bytes(), FsFile),
+                        file("test2", 0o600, "def\n".as_bytes(), FsFile),
+                    ]
+                ),
+            ],
+        )?;
+        let sb = sb.init_root(root)?;
         Ok(sb)
     }
 }
+
+struct FsFile;
+
+#[vtable]
+impl file::Operations for FsFile {
+    type OpenData = &'static [u8];
+
+    fn open(_context: &Self::OpenData, _file: &file::File) -> Result<Self::Data> {
+        Ok(())
+    }
+
+    fn read(
+        _data: (),
+        file: &file::File,
+        writer: &mut impl IoBufferWriter,
+        offset: u64,
+    ) -> Result<usize> {
+        file::read_from_slice(
+            file.inode::<RustFs>().ok_or(EINVAL)?.fs_data(),
+            writer,
+            offset,
+        )
+    }
+}
-- 
2.40.1

