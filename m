Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232AAC7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238477AbjFIGyK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230303AbjFIGyI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:08 -0400
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DB6271D
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4379; q=dns/txt; s=iport;
  t=1686293645; x=1687503245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3zroQWkH30BUlierqhxHJTtXlgI4e1TC1nXMci6bC3o=;
  b=U8Ey3znFd4IAFLG6mdWoLiwI63U/kTh4bC6gaM+AQvCZ6fKR5Re5UODQ
   rJWRfzkhXYnkR1+3Yj/BgQST637N1Ne6uVKG7s2ac1DvZEmoEKdhRvXwH
   sE27dZX8piPJXmb/md7BsOTBeVdnLHbA50rIgHvkU/EZtFHKa/xuN/Sbj
   I=;
X-CSE-ConnectionGUID: KsiQBORaTJWViC3oDd2csw==
X-CSE-MsgGUID: f3VATMWCSMKmguCPmQEAzg==
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7799468"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 06:31:53 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDj055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:52 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 51/80] rust: file: add from_path, from_path_in_root_mnt and read_with_offset methods to File
Date:   Fri,  9 Jun 2023 09:30:49 +0300
Message-Id: <20230609063118.24852-52-amiculas@cisco.com>
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
 rust/kernel/error.rs |  4 +--
 rust/kernel/file.rs  | 74 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 231f7dfd8005..6fff9a4f0672 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -234,9 +234,7 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
 ///     }
 /// }
 /// ```
-// TODO: Remove `dead_code` marker once an in-kernel client is available.
-#[allow(dead_code)]
-pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
+pub fn from_err_ptr<T>(ptr: *mut T) -> Result<*mut T> {
     // CAST: Casting a pointer to `*const core::ffi::c_void` is always valid.
     let const_ptr: *const core::ffi::c_void = ptr.cast();
     // SAFETY: The FFI function does not deref the pointer.
diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index 0062d8b17990..a4926b316573 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -8,11 +8,13 @@
 use crate::{
     bindings,
     cred::Credential,
-    error::{code::*, from_kernel_result, Error, Result},
+    error::{code::*, from_err_ptr, from_kernel_result, Error, Result},
     fs,
     io_buffer::{IoBufferReader, IoBufferWriter},
     iov_iter::IovIter,
     mm,
+    mount::Vfsmount,
+    str::CStr,
     sync::CondVar,
     types::ARef,
     types::AlwaysRefCounted,
@@ -131,6 +133,76 @@ pub fn from_fd(fd: u32) -> Result<ARef<Self>> {
         Ok(unsafe { ARef::from_raw(ptr.cast()) })
     }
 
+    /// Constructs a new [`struct file`] wrapper from a path.
+    pub fn from_path(filename: &CStr, flags: i32, mode: u16) -> Result<ARef<Self>> {
+        let file_ptr = unsafe {
+            from_err_ptr(bindings::filp_open(
+                filename.as_ptr() as *const i8,
+                flags,
+                mode,
+            ))?
+        };
+        let file_ptr = ptr::NonNull::new(file_ptr).ok_or(ENOENT)?;
+
+        // SAFETY: `filp_open` initializes the refcount with 1
+        Ok(unsafe { ARef::from_raw(file_ptr.cast()) })
+    }
+
+    /// Constructs a new [`struct file`] wrapper from a path and a vfsmount.
+    pub fn from_path_in_root_mnt(
+        mount: &Vfsmount,
+        filename: &CStr,
+        flags: i32,
+        mode: u16,
+    ) -> Result<ARef<Self>> {
+        let file_ptr = unsafe {
+            let mnt = mount.get();
+            let raw_path = bindings::path {
+                mnt,
+                dentry: (*mnt).mnt_root,
+            };
+            from_err_ptr(bindings::file_open_root(
+                &raw_path,
+                filename.as_ptr() as *const i8,
+                flags,
+                mode,
+            ))?
+        };
+        let file_ptr = ptr::NonNull::new(file_ptr).ok_or(ENOENT)?;
+
+        // SAFETY: `file_open_root` increments the refcount before returning. (TODO does it?)
+        Ok(unsafe { ARef::from_raw(file_ptr.cast()) })
+    }
+
+    /// Read from the file into the specified buffer
+    pub fn read_with_offset(&self, buf: &mut [u8], offset: u64) -> Result<usize> {
+        Ok(unsafe {
+            // kernel_read_file expects a pointer to a "void *" buffer
+            let mut ptr_to_buf = buf.as_mut_ptr() as *mut core::ffi::c_void;
+            // Unless we give a non-null pointer to the file size:
+            // 1. we cannot give a non-zero value for the offset
+            // 2. we cannot have offset 0 and buffer_size > file_size
+            let mut file_size = 0;
+
+            // SAFETY: all the pointers to kernel_read_file are valid
+            let result = bindings::kernel_read_file(
+                self.0.get(),
+                offset.try_into()?,
+                &mut ptr_to_buf,
+                buf.len(),
+                &mut file_size,
+                bindings::kernel_read_file_id_READING_UNKNOWN,
+            );
+
+            // kernel_read_file returns the number of bytes read on success or negative on error.
+            if result < 0 {
+                return Err(Error::from_errno(result.try_into()?));
+            }
+
+            result.try_into()?
+        })
+    }
+
     /// Creates a reference to a [`File`] from a valid pointer.
     ///
     /// # Safety
-- 
2.40.1

