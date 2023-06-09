Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A0FC7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236946AbjFIG4s (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237922AbjFIG43 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:29 -0400
Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AEA3589
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6887; q=dns/txt; s=iport;
  t=1686293768; x=1687503368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C1ShqY2tWzzlgRFHeCCmbWVY+c+KiUYEuqJ8jcUmCXg=;
  b=QzJKnX82SI2GV7VsJgzA703jJnUdm7Gg6BlDNxsTIdI9LsEEZNugJv+H
   5LY56LD2VHAwdN5V//VPeICoMYweDYi6JylkMajm90R4Bx/Qcttq9kffE
   +/odkwdLGObTlz0J8TtM43y61j4VVGcpAh4BG9KwT+dS68LJ1dunRwv2U
   U=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857220"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:53 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDl055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:53 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 53/80] rust: file: move from_path, from_path_in_root_mnt and read_with_offset methods to a RegularFile newtype
Date:   Fri,  9 Jun 2023 09:30:51 +0300
Message-Id: <20230609063118.24852-54-amiculas@cisco.com>
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
 rust/kernel/file.rs      | 144 ++++++++++++++++++++-------------------
 samples/rust/puzzlefs.rs |   2 +-
 2 files changed, 75 insertions(+), 71 deletions(-)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index a4926b316573..0d2771027150 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -133,76 +133,6 @@ pub fn from_fd(fd: u32) -> Result<ARef<Self>> {
         Ok(unsafe { ARef::from_raw(ptr.cast()) })
     }
 
-    /// Constructs a new [`struct file`] wrapper from a path.
-    pub fn from_path(filename: &CStr, flags: i32, mode: u16) -> Result<ARef<Self>> {
-        let file_ptr = unsafe {
-            from_err_ptr(bindings::filp_open(
-                filename.as_ptr() as *const i8,
-                flags,
-                mode,
-            ))?
-        };
-        let file_ptr = ptr::NonNull::new(file_ptr).ok_or(ENOENT)?;
-
-        // SAFETY: `filp_open` initializes the refcount with 1
-        Ok(unsafe { ARef::from_raw(file_ptr.cast()) })
-    }
-
-    /// Constructs a new [`struct file`] wrapper from a path and a vfsmount.
-    pub fn from_path_in_root_mnt(
-        mount: &Vfsmount,
-        filename: &CStr,
-        flags: i32,
-        mode: u16,
-    ) -> Result<ARef<Self>> {
-        let file_ptr = unsafe {
-            let mnt = mount.get();
-            let raw_path = bindings::path {
-                mnt,
-                dentry: (*mnt).mnt_root,
-            };
-            from_err_ptr(bindings::file_open_root(
-                &raw_path,
-                filename.as_ptr() as *const i8,
-                flags,
-                mode,
-            ))?
-        };
-        let file_ptr = ptr::NonNull::new(file_ptr).ok_or(ENOENT)?;
-
-        // SAFETY: `file_open_root` increments the refcount before returning. (TODO does it?)
-        Ok(unsafe { ARef::from_raw(file_ptr.cast()) })
-    }
-
-    /// Read from the file into the specified buffer
-    pub fn read_with_offset(&self, buf: &mut [u8], offset: u64) -> Result<usize> {
-        Ok(unsafe {
-            // kernel_read_file expects a pointer to a "void *" buffer
-            let mut ptr_to_buf = buf.as_mut_ptr() as *mut core::ffi::c_void;
-            // Unless we give a non-null pointer to the file size:
-            // 1. we cannot give a non-zero value for the offset
-            // 2. we cannot have offset 0 and buffer_size > file_size
-            let mut file_size = 0;
-
-            // SAFETY: all the pointers to kernel_read_file are valid
-            let result = bindings::kernel_read_file(
-                self.0.get(),
-                offset.try_into()?,
-                &mut ptr_to_buf,
-                buf.len(),
-                &mut file_size,
-                bindings::kernel_read_file_id_READING_UNKNOWN,
-            );
-
-            // kernel_read_file returns the number of bytes read on success or negative on error.
-            if result < 0 {
-                return Err(Error::from_errno(result.try_into()?));
-            }
-
-            result.try_into()?
-        })
-    }
-
     /// Creates a reference to a [`File`] from a valid pointer.
     ///
     /// # Safety
@@ -273,6 +203,80 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
     }
 }
 
+/// A newtype over file, specific to regular files
+pub struct RegularFile(ARef<File>);
+impl RegularFile {
+    /// Constructs a new [`struct file`] wrapper from a path.
+    pub fn from_path(filename: &CStr, flags: i32, mode: u16) -> Result<Self> {
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
+        Ok(RegularFile(unsafe { ARef::from_raw(file_ptr.cast()) }))
+    }
+
+    /// Constructs a new [`struct file`] wrapper from a path and a vfsmount.
+    pub fn from_path_in_root_mnt(
+        mount: &Vfsmount,
+        filename: &CStr,
+        flags: i32,
+        mode: u16,
+    ) -> Result<Self> {
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
+        Ok(RegularFile(unsafe { ARef::from_raw(file_ptr.cast()) }))
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
+                self.0 .0.get(),
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
+}
+
 /// A file descriptor reservation.
 ///
 /// This allows the creation of a file descriptor in two steps: first, we reserve a slot for it,
diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index db13a1d12466..50d62109a9c1 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -130,7 +130,7 @@ fn read(
     ) -> Result<usize> {
         let mut buf = Vec::try_with_capacity(writer.len())?;
         buf.try_resize(writer.len(), 0)?;
-        let file = file::File::from_path_in_root_mnt(
+        let file = file::RegularFile::from_path_in_root_mnt(
             &data,
             c_str!("data"),
             file::flags::O_RDONLY.try_into().unwrap(),
-- 
2.40.1

