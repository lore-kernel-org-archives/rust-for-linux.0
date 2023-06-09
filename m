Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BF5C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238569AbjFIGy0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjFIGyP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:15 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8567730EC
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=29846; q=dns/txt;
  s=iport; t=1686293650; x=1687503250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FXcNQiRMfh1vN1DrXldEyNZJaT1zskDccBmIIo7bjqs=;
  b=kaitagc69BhVthBMgZmfDNwkHbpANHjCX1y7Uv7kqtdzo27JKFhhdUKT
   GhYUIsOR0ujT2EegKBw3/OvEtQeXFPdgBSdfuB8HjSJwGctos+MmxIJ62
   IJ8+PJP1mNpzXBhH7+na0N49EVcq3b6TFa/KDemnSTXyPn3vDlaM9iblC
   4=;
X-IPAS-Result: =?us-ascii?q?A0ADAAAixoJklxbLJq1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF7BgEBAQsBgyNVLhJHjG5fiFIDgROcWIElA1YPAQEBDQEBMRMEAQGFB?=
 =?us-ascii?q?gKFdSY0CQ4BAgQBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQE3B?=
 =?us-ascii?q?RA1hWgNhgUDAxoNCwE0EhAgMVcZgn4BglwDrRmBeTOBAYJighOaa4FogUIBj?=
 =?us-ascii?q?BWBIoQoQoFJRIEVgTyBN3aKZCIEiR2CEg4LgmePKIEpb4EeOWl/AgkCEWeBC?=
 =?us-ascii?q?ghcgXNAAg1UCwtjgR2CVQICETwUUmIZHQMHBAKBBRAvBwQyKAYJGC8nBlMHF?=
 =?us-ascii?q?xYkCRMVQgSDWQqBEEAVDhGCXCoCPW8DCQMHBUlAAwsYDUgRLDUUHwZDgQcXY?=
 =?us-ascii?q?4F8JCSeRoJtDhIPIA43BxMBE4EdFAeBABILDQSSYjyOU4IVnnOBN4QSi3yVB?=
 =?us-ascii?q?BozhVejfpgWlkWMAFk/hC8CBAYFAhaBYzo7gSAzGggbFYMiCUkZD44sDQmII?=
 =?us-ascii?q?4FEiWdBMTsCBwsBAQMJi0YBAQ?=
IronPort-Data: A9a23:ov3ZsqmB6ivPYJomWi1TlNPo5gyFJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXmyOOK2NNjT1ftx1adnlpEwF6sfcy9ZnGlNv/n01EVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuKU5NXsZGYpHWeIdA970Ug4w7Bh0tYz6TSEK1rlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJM53yZWKEpfNatI88thW6
 Ar05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkSvqkAqm8A87ko0HOg+ZBpm1T/YpNVK8
 4htu7WvVgMZIZSZzYzxUzEAe81/FaRL4vrMJmKy9JHVxEzdeHyqyPJrZK00FdRHoaAsUScUr
 adecmplghOr34paxJqyT+hnm8AqN+HgPZgUvTdryjSx4fMOEc2bE/SQube02h87gc5SOeTiY
 fBebBQoQkzbSC9+BhA+XcdWcOCA3ymjLGIwREiujbU673PUygV/+LfqN9XRd5qBQsA9tlyFv
 X6D8WPjRxUbMsGP4SSK/2jqheLVmy7/HoUIG9WFGuVCiVCJg20LDwcKEF2yvb+yi1W1XJRUL
 El8FjcSQbYa5m6mE+ijVUyDpUW/4z4ScsVPF90l0VTYokbL2DqxCm8BRz9HTdUpss4qWDAnv
 mNlefu0VVSDV5XIFRqgGqeoQSCaZHJOcz5SDcMQZVZfuoOyyG0mpkiXJuuPBpJZmfXTPVkcK
 RijqC0znbhbttIC281XFnie2GvxznQlZiAx6xvQWmuj4mtEiG+Zi26AtAKzARVoddjxory9U
 J4swJH2AAcmV8vlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk5bJxYKGeyM
 BKC42u9AaO/2lP0NsebhKrsW6wXIVTITrwJq9iNNIMVO8gtHON51Hg3NRX4M5/RfLgEyPFjZ
 sjznTeEBncBAqMv1yutW+oYytcWKtMWmwvuqWTA503/i9K2PSfNIZ9caQvmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZJdglXdSVlXM+pwyGVH8baSjdb9KgaI6e56dscl0ZNxsy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:AdZYza3ssAAx6xI/ghhiXAqjBJ0kLtp133Aq2lEZdPWaSKClfq
 eV7ZAmPHDP5gr5NEtLpTnEAtjifZq+z+8R3WBuB9aftWDd0QPCEGgh1/qB/9SKIULDH4BmuJ
 tIQuxXFMDwAV9mjczz/QW0V+o7zMLvytHOuQ6n9RdQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AfVjSsmmAnY/CsV6n4FVFM50MidPXOW//wSrhfUX?=
 =?us-ascii?q?pMmNSc+C1R3aP56dUjPM7zg=3D=3D?=
X-Talos-MUID: 9a23:XqPQTQamFJOhsOBTvDjimBVwCMFSpKGAT25Vir40ivXDHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="8508924"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:37 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VICw055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:37 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Wedson Almeida Filho <wedsonaf@google.com>
Subject: [PATCH 04/80] rust: add support for file system parameters
Date:   Fri,  9 Jun 2023 09:30:02 +0300
Message-Id: <20230609063118.24852-5-amiculas@cisco.com>
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

This allows file system contexts to be further initialised with
parameters from userspace before a fs is mounted or reconfigured.

Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
---
 rust/helpers.c          |   9 +
 rust/kernel/fs.rs       | 142 ++++++++++-
 rust/kernel/fs/param.rs | 537 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs      |   1 +
 samples/rust/rust_fs.rs |  15 ++
 5 files changed, 701 insertions(+), 3 deletions(-)
 create mode 100644 rust/kernel/fs/param.rs

diff --git a/rust/helpers.c b/rust/helpers.c
index d6f277c3b7a7..b042d496649f 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -147,6 +147,15 @@ void rust_helper_lockdep_unregister_key(struct lock_class_key *key)
 }
 EXPORT_SYMBOL_GPL(rust_helper_lockdep_unregister_key);
 
+int rust_helper_fs_parse(struct fs_context *fc,
+		const struct fs_parameter_spec *desc,
+		struct fs_parameter *param,
+		struct fs_parse_result *result)
+{
+	return fs_parse(fc, desc, param, result);
+}
+EXPORT_SYMBOL_GPL(rust_helper_fs_parse);
+
 /*
  * We use `bindgen`'s `--size_t-is-usize` option to bind the C `size_t` type
  * as the Rust `usize` type, so we can use it in contexts where Rust
diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index 187f0c19dcd0..e68b67b8adb0 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -5,11 +5,13 @@
 //! C headers: [`include/linux/fs.h`](../../../../include/linux/fs.h)
 
 use crate::{bindings, error::code::*, str::CStr, ThisModule};
-use crate::error::{to_result, from_kernel_result, Result};
+use crate::error::{to_result, from_kernel_result, Error, Result};
 use crate::types::{AlwaysRefCounted, ForeignOwnable, ScopeGuard};
 use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin, ptr};
 use macros::vtable;
 
+pub mod param;
+
 /// A file system context.
 ///
 /// It is used to gather configuration to then mount or reconfigure a file system.
@@ -18,18 +20,48 @@ pub trait Context<T: Type + ?Sized> {
     /// Type of the data associated with the context.
     type Data: ForeignOwnable + Send + Sync + 'static;
 
+    /// The typed file system parameters.
+    ///
+    /// Users are encouraged to define it using the [`crate::define_fs_params`] macro.
+    const PARAMS: param::SpecTable<'static, Self::Data> = param::SpecTable::empty();
+
     /// Creates a new context.
     fn try_new() -> Result<Self::Data>;
+
+    /// Parses a parameter that wasn't specified in [`Self::PARAMS`].
+    fn parse_unknown_param(
+        _data: &mut Self::Data,
+        _name: &CStr,
+        _value: param::Value<'_>,
+    ) -> Result {
+        Err(ENOPARAM)
+    }
+
+    /// Parses the whole parameter block, potentially skipping regular handling for parts of it.
+    ///
+    /// The return value is the portion of the input buffer for which the regular handling
+    /// (involving [`Self::PARAMS`] and [`Self::parse_unknown_param`]) will still be carried out.
+    /// If it's `None`, the regular handling is not performed at all.
+    fn parse_monolithic<'a>(
+        _data: &mut Self::Data,
+        _buf: Option<&'a mut [u8]>,
+    ) -> Result<Option<&'a mut [u8]>> {
+        Ok(None)
+    }
 }
 
 struct Tables<T: Type + ?Sized>(T);
 impl<T: Type + ?Sized> Tables<T> {
     const CONTEXT: bindings::fs_context_operations = bindings::fs_context_operations {
         free: Some(Self::free_callback),
-        parse_param: None,
+        parse_param: Some(Self::parse_param_callback),
         get_tree: Some(Self::get_tree_callback),
         reconfigure: Some(Self::reconfigure_callback),
-        parse_monolithic: None,
+        parse_monolithic: if <T::Context as Context<T>>::HAS_PARSE_MONOLITHIC {
+            Some(Self::parse_monolithic_callback)
+        } else {
+            None
+        },
         dup: None,
     };
 
@@ -43,6 +75,55 @@ impl<T: Type + ?Sized> Tables<T> {
         }
     }
 
+    unsafe extern "C" fn parse_param_callback(
+        fc: *mut bindings::fs_context,
+        param: *mut bindings::fs_parameter,
+    ) -> core::ffi::c_int {
+        from_kernel_result! {
+            // SAFETY: The callback contract guarantees that `fc` is valid.
+            let ptr = unsafe { (*fc).fs_private };
+
+            // SAFETY: The value of `ptr` (coming from `fs_private` was initialised in
+            // `init_fs_context_callback` to the result of an `into_pointer` call. Since the
+            // context is valid, `from_pointer` wasn't called yet, so `ptr` is valid. Additionally,
+            // the callback contract guarantees that callbacks are serialised, so it is ok to
+            // mutably reference it.
+            let mut data =
+                unsafe { <<T::Context as Context<T>>::Data as ForeignOwnable>::borrow_mut(ptr) };
+            let mut result = bindings::fs_parse_result::default();
+            // SAFETY: All parameters are valid at least for the duration of the call.
+            let opt =
+                unsafe { bindings::fs_parse(fc, T::Context::PARAMS.first, param, &mut result) };
+
+            // SAFETY: The callback contract guarantees that `param` is valid for the duration of
+            // the callback.
+            let param = unsafe { &*param };
+            if opt >= 0 {
+                let opt = opt as usize;
+                if opt >= T::Context::PARAMS.handlers.len() {
+                    return Err(EINVAL);
+                }
+                T::Context::PARAMS.handlers[opt].handle_param(&mut data, param, &result)?;
+                return Ok(0);
+            }
+
+            if opt != ENOPARAM.to_errno() {
+                return Err(Error::from_errno(opt));
+            }
+
+            if !T::Context::HAS_PARSE_UNKNOWN_PARAM {
+                return Err(ENOPARAM);
+            }
+
+            let val = param::Value::from_fs_parameter(param);
+            // SAFETY: The callback contract guarantees the parameter key to be valid and last at
+            // least the duration of the callback.
+            T::Context::parse_unknown_param(
+                &mut data, unsafe { CStr::from_char_ptr(param.key) }, val)?;
+            Ok(0)
+        }
+    }
+
     unsafe extern "C" fn fill_super_callback(
         sb_ptr: *mut bindings::super_block,
         _fc: *mut bindings::fs_context,
@@ -63,6 +144,8 @@ impl<T: Type + ?Sized> Tables<T> {
             sb.s_time_gran = 1;
 
             // Create and initialise the root inode.
+
+            // SAFETY: `sb` was just created initialised, so it is safe pass it to `new_inode`.
             let inode = unsafe { bindings::new_inode(sb) };
             if inode.is_null() {
                 return Err(ENOMEM);
@@ -116,6 +199,40 @@ impl<T: Type + ?Sized> Tables<T> {
         EINVAL.to_errno()
     }
 
+    unsafe extern "C" fn parse_monolithic_callback(
+        fc: *mut bindings::fs_context,
+        buf: *mut core::ffi::c_void,
+    ) -> core::ffi::c_int {
+        from_kernel_result! {
+            // SAFETY: The callback contract guarantees that `fc` is valid.
+            let ptr = unsafe { (*fc).fs_private };
+
+            // SAFETY: The value of `ptr` (coming from `fs_private` was initialised in
+            // `init_fs_context_callback` to the result of an `into_pointer` call. Since the
+            // context is valid, `from_pointer` wasn't called yet, so `ptr` is valid. Additionally,
+            // the callback contract guarantees that callbacks are serialised, so it is ok to
+            // mutably reference it.
+            let mut data =
+                unsafe { <<T::Context as Context<T>>::Data as ForeignOwnable>::borrow_mut(ptr) };
+            let page = if buf.is_null() {
+                None
+            } else {
+                // SAFETY: This callback is called to handle the `mount` syscall, which takes a
+                // page-sized buffer as data.
+                Some(unsafe { &mut *ptr::slice_from_raw_parts_mut(buf.cast(), crate::PAGE_SIZE) })
+            };
+            let regular = T::Context::parse_monolithic(&mut data, page)?;
+            if let Some(buf) = regular {
+                // SAFETY: Both `fc` and `buf` are guaranteed to be valid; the former because the
+                // callback is still ongoing and the latter because its lifefime is tied to that of
+                // `page`, which is also valid for the duration of the callback.
+                to_result(
+                    unsafe { bindings::generic_parse_monolithic(fc, buf.as_mut_ptr().cast()) })?;
+            }
+            Ok(0)
+        }
+    }
+
     const SUPER_BLOCK: bindings::super_operations = bindings::super_operations {
         alloc_inode: None,
         destroy_inode: None,
@@ -239,6 +356,7 @@ pub fn register<T: Type + ?Sized>(self: Pin<&mut Self>, module: &'static ThisMod
         fs.owner = module.0;
         fs.name = T::NAME.as_char_ptr();
         fs.fs_flags = T::FLAGS;
+        fs.parameters = T::Context::PARAMS.first;
         fs.init_fs_context = Some(Self::init_fs_context_callback::<T>);
         fs.kill_sb = Some(Self::kill_sb_callback::<T>);
 
@@ -371,3 +489,21 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
         unsafe { bindings::dput(obj.cast().as_ptr()) }
     }
 }
+
+/// Wraps the kernel's `struct filename`.
+#[repr(transparent)]
+pub struct Filename(pub(crate) UnsafeCell<bindings::filename>);
+
+impl Filename {
+    /// Creates a reference to a [`Filename`] from a valid pointer.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is valid and remains valid for the lifetime of the
+    /// returned [`Filename`] instance.
+    pub(crate) unsafe fn from_ptr<'a>(ptr: *const bindings::filename) -> &'a Filename {
+        // SAFETY: The safety requirements guarantee the validity of the dereference, while the
+        // `Filename` type being transparent makes the cast ok.
+        unsafe { &*ptr.cast() }
+    }
+}
diff --git a/rust/kernel/fs/param.rs b/rust/kernel/fs/param.rs
new file mode 100644
index 000000000000..f0b4393b6b67
--- /dev/null
+++ b/rust/kernel/fs/param.rs
@@ -0,0 +1,537 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! File system parameters and parsing them.
+//!
+//! C headers: [`include/linux/fs_parser.h`](../../../../../include/linux/fs_parser.h)
+
+use crate::{bindings, file, fs, str::CStr, error::Result};
+use core::{marker::PhantomData, ptr};
+
+/// The value of a file system parameter.
+pub enum Value<'a> {
+    /// The value is undefined.
+    Undefined,
+
+    /// There is no value, but parameter itself is a flag.
+    Flag,
+
+    /// The value is the given string.
+    String(&'a CStr),
+
+    /// The value is the given binary blob.
+    Blob(&'a mut [u8]),
+
+    /// The value is the given file.
+    File(&'a file::File),
+
+    /// The value is the given filename and the given directory file descriptor (which may be
+    /// `AT_FDCWD`, to indicate the current directory).
+    Filename(&'a fs::Filename, i32),
+}
+
+impl<'a> Value<'a> {
+    pub(super) fn from_fs_parameter(p: &'a bindings::fs_parameter) -> Self {
+        match p.type_() {
+            bindings::fs_value_type_fs_value_is_string => {
+                // SAFETY: `type_` is string, so it is ok to use the union field. Additionally, it
+                // is guaranteed to be valid while `p` is valid.
+                Self::String(unsafe { CStr::from_char_ptr(p.__bindgen_anon_1.string) })
+            }
+            bindings::fs_value_type_fs_value_is_flag => Self::Flag,
+            bindings::fs_value_type_fs_value_is_blob => {
+                // SAFETY: `type_` is blob, so it is ok to use the union field and size.
+                // Additionally, it is guaranteed to be valid while `p` is valid.
+                let slice = unsafe {
+                    &mut *ptr::slice_from_raw_parts_mut(p.__bindgen_anon_1.blob.cast(), p.size)
+                };
+                Self::Blob(slice)
+            }
+            bindings::fs_value_type_fs_value_is_file => {
+                // SAFETY: `type_` is file, so it is ok to use the union field. Additionally, it is
+                // guaranteed to be valid while `p` is valid.
+                let file_ptr = unsafe { p.__bindgen_anon_1.file };
+                if file_ptr.is_null() {
+                    Self::Undefined
+                } else {
+                    // SAFETY: `file_ptr` is non-null and guaranteed to be valid while `p` is.
+                    Self::File(unsafe { file::File::from_ptr(file_ptr) })
+                }
+            }
+            bindings::fs_value_type_fs_value_is_filename => {
+                // SAFETY: `type_` is filename, so it is ok to use the union field. Additionally,
+                // it is guaranteed to be valid while `p` is valid.
+                let filename_ptr = unsafe { p.__bindgen_anon_1.name };
+                if filename_ptr.is_null() {
+                    Self::Undefined
+                } else {
+                    // SAFETY: `filename_ptr` is non-null and guaranteed to be valid while `p` is.
+                    Self::Filename(unsafe { fs::Filename::from_ptr(filename_ptr) }, p.dirfd)
+                }
+            }
+            _ => Self::Undefined,
+        }
+    }
+}
+
+/// A specification of a file system parameter.
+pub struct Spec {
+    name: &'static CStr,
+    flags: u16,
+    type_: bindings::fs_param_type,
+    extra: *const core::ffi::c_void,
+}
+
+const DEFAULT: Spec = Spec {
+    name: crate::c_str!(""),
+    flags: 0,
+    type_: None,
+    extra: core::ptr::null(),
+};
+
+macro_rules! define_param_type {
+    ($name:ident, $fntype:ty, $spec:expr, |$param:ident, $result:ident| $value:expr) => {
+        /// Module to support `$name` parameter types.
+        pub mod $name {
+            use super::*;
+
+            #[doc(hidden)]
+            pub const fn spec(name: &'static CStr) -> Spec {
+                const GIVEN: Spec = $spec;
+                Spec { name, ..GIVEN }
+            }
+
+            #[doc(hidden)]
+            pub const fn handler<S>(setfn: fn(&mut S, $fntype) -> Result) -> impl Handler<S> {
+                let c =
+                    move |s: &mut S,
+                          $param: &bindings::fs_parameter,
+                          $result: &bindings::fs_parse_result| { setfn(s, $value) };
+                ConcreteHandler {
+                    setfn: c,
+                    _p: PhantomData,
+                }
+            }
+        }
+    };
+}
+
+// SAFETY: This is only called when the parse result is a boolean, so it is ok to access to union
+// field.
+define_param_type!(flag, bool, Spec { ..DEFAULT }, |_p, r| unsafe {
+    r.__bindgen_anon_1.boolean
+});
+
+define_param_type!(
+    flag_no,
+    bool,
+    Spec {
+        flags: bindings::fs_param_neg_with_no as _,
+        ..DEFAULT
+    },
+    // SAFETY: This is only called when the parse result is a boolean, so it is ok to access to
+    // union field.
+    |_p, r| unsafe { r.__bindgen_anon_1.boolean }
+);
+
+define_param_type!(
+    bool,
+    bool,
+    Spec {
+        type_: Some(bindings::fs_param_is_bool),
+        ..DEFAULT
+    },
+    // SAFETY: This is only called when the parse result is a boolean, so it is ok to access to
+    // union field.
+    |_p, r| unsafe { r.__bindgen_anon_1.boolean }
+);
+
+define_param_type!(
+    u32,
+    u32,
+    Spec {
+        type_: Some(bindings::fs_param_is_u32),
+        ..DEFAULT
+    },
+    // SAFETY: This is only called when the parse result is a u32, so it is ok to access to union
+    // field.
+    |_p, r| unsafe { r.__bindgen_anon_1.uint_32 }
+);
+
+define_param_type!(
+    u32oct,
+    u32,
+    Spec {
+        type_: Some(bindings::fs_param_is_u32),
+        extra: 8 as _,
+        ..DEFAULT
+    },
+    // SAFETY: This is only called when the parse result is a u32, so it is ok to access to union
+    // field.
+    |_p, r| unsafe { r.__bindgen_anon_1.uint_32 }
+);
+
+define_param_type!(
+    u32hex,
+    u32,
+    Spec {
+        type_: Some(bindings::fs_param_is_u32),
+        extra: 16 as _,
+        ..DEFAULT
+    },
+    // SAFETY: This is only called when the parse result is a u32, so it is ok to access to union
+    // field.
+    |_p, r| unsafe { r.__bindgen_anon_1.uint_32 }
+);
+
+define_param_type!(
+    s32,
+    i32,
+    Spec {
+        type_: Some(bindings::fs_param_is_s32),
+        ..DEFAULT
+    },
+    // SAFETY: This is only called when the parse result is an i32, so it is ok to access to union
+    // field.
+    |_p, r| unsafe { r.__bindgen_anon_1.int_32 }
+);
+
+define_param_type!(
+    u64,
+    u64,
+    Spec {
+        type_: Some(bindings::fs_param_is_u64),
+        extra: 16 as _,
+        ..DEFAULT
+    },
+    // SAFETY: This is only called when the parse result is a u32, so it is ok to access to union
+    // field.
+    |_p, r| unsafe { r.__bindgen_anon_1.uint_64 }
+);
+
+define_param_type!(
+    string,
+    &CStr,
+    Spec {
+        type_: Some(bindings::fs_param_is_string),
+        ..DEFAULT
+    },
+    // SAFETY: This is only called when the parse result is a string, so it is ok to access to
+    // union field.
+    |p, _r| unsafe { CStr::from_char_ptr(p.__bindgen_anon_1.string) }
+);
+
+/// Module to support `enum` parameter types.
+pub mod enum_ {
+    use super::*;
+
+    #[doc(hidden)]
+    pub const fn spec(name: &'static CStr, options: ConstantTable<'static>) -> Spec {
+        Spec {
+            name,
+            type_: Some(bindings::fs_param_is_enum),
+            extra: options.first as *const _ as _,
+            ..DEFAULT
+        }
+    }
+
+    #[doc(hidden)]
+    pub const fn handler<S>(setfn: fn(&mut S, u32) -> Result) -> impl Handler<S> {
+        let c = move |s: &mut S, _p: &bindings::fs_parameter, r: &bindings::fs_parse_result| {
+            // SAFETY: This is only called when the parse result is an enum, so it is ok to access
+            // to union field.
+            setfn(s, unsafe { r.__bindgen_anon_1.uint_32 })
+        };
+        ConcreteHandler {
+            setfn: c,
+            _p: PhantomData,
+        }
+    }
+}
+
+const ZERO_SPEC: bindings::fs_parameter_spec = bindings::fs_parameter_spec {
+    name: core::ptr::null(),
+    type_: None,
+    opt: 0,
+    flags: 0,
+    data: core::ptr::null(),
+};
+
+/// A zero-terminated parameter spec array, followed by handlers.
+#[repr(C)]
+pub struct SpecArray<const N: usize, S: 'static> {
+    specs: [bindings::fs_parameter_spec; N],
+    sentinel: bindings::fs_parameter_spec,
+    handlers: [&'static dyn Handler<S>; N],
+}
+
+impl<const N: usize, S: 'static> SpecArray<N, S> {
+    /// Creates a new spec array.
+    ///
+    /// Users are encouraged to use the [`define_fs_params`] macro to define the
+    /// [`super::Context::PARAMS`] constant.
+    ///
+    /// # Safety
+    ///
+    /// The type of the elements in `handlers` must be compatible with the types in specs. For
+    /// example, if `specs` declares that the i-th element is a bool then the i-th handler
+    /// should be for a bool.
+    pub const unsafe fn new(specs: [Spec; N], handlers: [&'static dyn Handler<S>; N]) -> Self {
+        let mut array = Self {
+            specs: [ZERO_SPEC; N],
+            sentinel: ZERO_SPEC,
+            handlers,
+        };
+        let mut i = 0usize;
+        while i < N {
+            array.specs[i] = bindings::fs_parameter_spec {
+                name: specs[i].name.as_char_ptr(),
+                type_: specs[i].type_,
+                opt: i as _,
+                flags: specs[i].flags,
+                data: specs[i].extra,
+            };
+            i += 1;
+        }
+        array
+    }
+
+    /// Returns a [`SpecTable`] backed by `self`.
+    ///
+    /// This is used to essentially erase the array size.
+    pub const fn as_table(&self) -> SpecTable<'_, S> {
+        SpecTable {
+            first: &self.specs[0],
+            handlers: &self.handlers,
+            _p: PhantomData,
+        }
+    }
+}
+
+/// A parameter spec table.
+///
+/// The table is guaranteed to be zero-terminated.
+///
+/// Users are encouraged to use the [`define_fs_params`] macro to define the
+/// [`super::Context::PARAMS`] constant.
+pub struct SpecTable<'a, S: 'static> {
+    pub(super) first: &'a bindings::fs_parameter_spec,
+    pub(super) handlers: &'a [&'static dyn Handler<S>],
+    _p: PhantomData<S>,
+}
+
+impl<S> SpecTable<'static, S> {
+    pub(super) const fn empty() -> Self {
+        Self {
+            first: &ZERO_SPEC,
+            handlers: &[],
+            _p: PhantomData,
+        }
+    }
+}
+
+/// A zero-terminated parameter constant array.
+#[repr(C)]
+pub struct ConstantArray<const N: usize> {
+    consts: [bindings::constant_table; N],
+    sentinel: bindings::constant_table,
+}
+
+impl<const N: usize> ConstantArray<N> {
+    /// Creates a new constant array.
+    ///
+    /// Users are encouraged to use the [`define_fs_params`] macro to define the
+    /// [`super::Context::PARAMS`] constant.
+    pub const fn new(consts: [(&'static CStr, u32); N]) -> Self {
+        const ZERO: bindings::constant_table = bindings::constant_table {
+            name: core::ptr::null(),
+            value: 0,
+        };
+        let mut array = Self {
+            consts: [ZERO; N],
+            sentinel: ZERO,
+        };
+        let mut i = 0usize;
+        while i < N {
+            array.consts[i] = bindings::constant_table {
+                name: consts[i].0.as_char_ptr(),
+                value: consts[i].1 as _,
+            };
+            i += 1;
+        }
+        array
+    }
+
+    /// Returns a [`ConstantTable`] backed by `self`.
+    ///
+    /// This is used to essentially erase the array size.
+    pub const fn as_table(&self) -> ConstantTable<'_> {
+        ConstantTable {
+            first: &self.consts[0],
+        }
+    }
+}
+
+/// A parameter constant table.
+///
+/// The table is guaranteed to be zero-terminated.
+pub struct ConstantTable<'a> {
+    pub(super) first: &'a bindings::constant_table,
+}
+
+#[doc(hidden)]
+pub trait Handler<S> {
+    fn handle_param(
+        &self,
+        state: &mut S,
+        p: &bindings::fs_parameter,
+        r: &bindings::fs_parse_result,
+    ) -> Result;
+}
+
+struct ConcreteHandler<
+    S,
+    T: Fn(&mut S, &bindings::fs_parameter, &bindings::fs_parse_result) -> Result,
+> {
+    setfn: T,
+    _p: PhantomData<S>,
+}
+
+impl<S, T: Fn(&mut S, &bindings::fs_parameter, &bindings::fs_parse_result) -> Result> Handler<S>
+    for ConcreteHandler<S, T>
+{
+    fn handle_param(
+        &self,
+        state: &mut S,
+        p: &bindings::fs_parameter,
+        r: &bindings::fs_parse_result,
+    ) -> Result {
+        (self.setfn)(state, p, r)
+    }
+}
+
+/// Counts the number of comma-separated entries surrounded by braces.
+///
+/// # Examples
+///
+/// ```
+/// # use kernel::count_brace_items;
+///
+/// assert_eq!(0, count_brace_items!());
+/// assert_eq!(1, count_brace_items!({A}));
+/// assert_eq!(1, count_brace_items!({A},));
+/// assert_eq!(2, count_brace_items!({A}, {B}));
+/// assert_eq!(2, count_brace_items!({A}, {B},));
+/// assert_eq!(3, count_brace_items!({A}, {B}, {C}));
+/// assert_eq!(3, count_brace_items!({A}, {B}, {C},));
+/// ```
+#[macro_export]
+macro_rules! count_brace_items {
+    ({$($item:tt)*}, $($remaining:tt)*) => { 1 + $crate::count_brace_items!($($remaining)*) };
+    ({$($item:tt)*}) => { 1 };
+    () => { 0 };
+}
+
+/// Defines the file system parameters of a given file system context.
+///
+/// # Examples
+/// ```
+/// # use kernel::prelude::*;
+/// # use kernel::{c_str, fs, str::CString};
+///
+/// #[derive(Default)]
+/// struct State {
+///     flag: Option<bool>,
+///     flag_no: Option<bool>,
+///     bool_value: Option<bool>,
+///     u32_value: Option<u32>,
+///     i32_value: Option<i32>,
+///     u64_value: Option<u64>,
+///     str_value: Option<CString>,
+///     enum_value: Option<u32>,
+/// }
+///
+/// fn set_u32(s: &mut Box<State>, v: u32) -> Result {
+///     s.u32_value = Some(v);
+///     Ok(())
+/// }
+///
+/// struct Example;
+///
+/// #[vtable]
+/// impl fs::Context<Self> for Example {
+///     type Data = Box<State>;
+///
+///     kernel::define_fs_params!{Box<State>,
+///         {flag, "flag", |s, v| { s.flag = Some(v); Ok(()) } },
+///         {flag_no, "flagno", |s, v| { s.flag_no = Some(v); Ok(()) } },
+///         {bool, "bool", |s, v| { s.bool_value = Some(v); Ok(()) } },
+///         {u32, "u32", set_u32 },
+///         {u32oct, "u32oct", set_u32 },
+///         {u32hex, "u32hex", set_u32 },
+///         {s32, "s32", |s, v| { s.i32_value = Some(v); Ok(()) } },
+///         {u64, "u64", |s, v| { s.u64_value = Some(v); Ok(()) } },
+///         {string, "string", |s, v| {
+///             s.str_value = Some(CString::try_from_fmt(fmt!("{v}"))?);
+///             Ok(())
+///         }},
+///         {enum, "enum", [("first", 10), ("second", 20)], |s, v| {
+///             s.enum_value = Some(v);
+///             Ok(())
+///         }},
+///     }
+///
+///     fn try_new() -> Result<Self::Data> {
+///         Ok(Box::try_new(State::default())?)
+///     }
+/// }
+///
+/// # impl fs::Type for Example {
+/// #    type Context = Self;
+/// #    const NAME: &'static CStr = c_str!("example");
+/// #    const FLAGS: i32 = 0;
+/// #    const MAGIC: u32 = 0x6578616d;
+/// # }
+/// ```
+#[macro_export]
+macro_rules! define_fs_params {
+    ($data_type:ty, $({$($t:tt)*}),+ $(,)?) => {
+        const PARAMS: $crate::fs::param::SpecTable<'static, $data_type> =
+            {
+                use $crate::fs::param::{self, ConstantArray, Spec, SpecArray, Handler};
+                use $crate::c_str;
+                const COUNT: usize = $crate::count_brace_items!($({$($t)*},)*);
+                const SPECS: [Spec; COUNT] = $crate::define_fs_params!(@specs $({$($t)*},)*);
+                const HANDLERS: [&dyn Handler<$data_type>; COUNT] =
+                    $crate::define_fs_params!(@handlers $data_type, $({$($t)*},)*);
+                // SAFETY: We defined matching specs and handlers above.
+                const ARRAY: SpecArray<COUNT, $data_type> =
+                    unsafe { SpecArray::new(SPECS, HANDLERS) };
+                ARRAY.as_table()
+            };
+    };
+
+    (@handlers $data_type:ty, $({$($t:tt)*},)*) => {
+        [ $($crate::define_fs_params!(@handler $data_type, $($t)*),)* ]
+    };
+    (@handler $data_type:ty, enum, $name:expr, $opts:expr, $closure:expr) => {
+        &param::enum_::handler::<$data_type>($closure)
+    };
+    (@handler $data_type:ty, $type:ident, $name:expr, $closure:expr) => {
+        &param::$type::handler::<$data_type>($closure)
+    };
+
+    (@specs $({$($t:tt)*},)*) => {[ $($crate::define_fs_params!(@spec $($t)*),)* ]};
+    (@spec enum, $name:expr, [$($opts:tt)*], $closure:expr) => {
+        {
+            const COUNT: usize = $crate::count_paren_items!($($opts)*);
+            const OPTIONS: ConstantArray<COUNT> =
+                ConstantArray::new($crate::define_fs_params!(@c_str_first $($opts)*));
+            param::enum_::spec(c_str!($name), OPTIONS.as_table())
+        }
+    };
+    (@spec $type:ident, $name:expr, $closure:expr) => { param::$type::spec(c_str!($name)) };
+
+    (@c_str_first $(($first:expr, $second:expr)),+ $(,)?) => {
+        [$((c_str!($first), $second),)*]
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 48da79b02422..6cf267119fda 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -18,6 +18,7 @@
 #![feature(new_uninit)]
 #![feature(receiver_trait)]
 #![feature(unsize)]
+#![feature(const_mut_refs)]
 
 // Ensure conditional compilation based on the kernel configuration works;
 // otherwise we may silently break things like initcall handling.
diff --git a/samples/rust/rust_fs.rs b/samples/rust/rust_fs.rs
index 2bd4e563c694..acaa603b0bb2 100644
--- a/samples/rust/rust_fs.rs
+++ b/samples/rust/rust_fs.rs
@@ -18,6 +18,21 @@
 impl fs::Context<Self> for RustFs {
     type Data = ();
 
+    kernel::define_fs_params! {(),
+        {flag, "flag", |_, v| { pr_info!("flag passed-in: {v}\n"); Ok(()) } },
+        {flag_no, "flagno", |_, v| { pr_info!("flagno passed-in: {v}\n"); Ok(()) } },
+        {bool, "bool", |_, v| { pr_info!("bool passed-in: {v}\n"); Ok(()) } },
+        {u32, "u32", |_, v| { pr_info!("u32 passed-in: {v}\n"); Ok(()) } },
+        {u32oct, "u32oct", |_, v| { pr_info!("u32oct passed-in: {v}\n"); Ok(()) } },
+        {u32hex, "u32hex", |_, v| { pr_info!("u32hex passed-in: {v}\n"); Ok(()) } },
+        {s32, "s32", |_, v| { pr_info!("s32 passed-in: {v}\n"); Ok(()) } },
+        {u64, "u64", |_, v| { pr_info!("u64 passed-in: {v}\n"); Ok(()) } },
+        {string, "string", |_, v| { pr_info!("string passed-in: {v}\n"); Ok(()) } },
+        {enum, "enum", [("first", 10), ("second", 20)], |_, v| {
+            pr_info!("enum passed-in: {v}\n"); Ok(()) }
+        },
+    }
+
     fn try_new() -> Result {
         pr_info!("context created!\n");
         Ok(())
-- 
2.40.1

