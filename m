Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B491C87FE1
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238473AbjFIGyc (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238548AbjFIGyQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:16 -0400
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6350A3588
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2601; q=dns/txt; s=iport;
  t=1686293654; x=1687503254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8+06KB81dEgRZD0dDho08nxQtcysHdgi/hq8R62lgtk=;
  b=RF2kQ7W5rVkHulD9QiHSuNgqC+Fop/PlAv3YgflWT+GQP1VOl6qaF5+X
   RBJCYfVqkh+Vkbpt29idCjIysborgxg+xy/McJ4O/SYfclLpN3NC+sxLX
   b8JcQQNEz8mvU4mKW+OJshn/sL66NVkesIs5KlWlsczMLe56ip1HCVGzZ
   o=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5220563"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:53 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDm055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:53 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 54/80] rust: file: ensure RegularFile can only create regular files
Date:   Fri,  9 Jun 2023 09:30:52 +0300
Message-Id: <20230609063118.24852-55-amiculas@cisco.com>
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
 rust/kernel/file.rs | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index 0d2771027150..afb2084745de 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -206,8 +206,21 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
 /// A newtype over file, specific to regular files
 pub struct RegularFile(ARef<File>);
 impl RegularFile {
+    fn create_if_regular(file_ptr: ptr::NonNull<bindings::file>) -> Result<RegularFile> {
+        // make sure the file is a regular file
+        // TODO: create a helper function
+        // SAFETY: we have a NonNull pointer
+        unsafe {
+            let inode = core::ptr::addr_of!((*file_ptr.as_ptr()).f_inode).read();
+            if bindings::S_IFMT & ((*inode).i_mode) as u32 != bindings::S_IFREG {
+                return Err(EINVAL);
+            }
+        }
+        Ok(RegularFile(unsafe { ARef::from_raw(file_ptr.cast()) }))
+    }
     /// Constructs a new [`struct file`] wrapper from a path.
     pub fn from_path(filename: &CStr, flags: i32, mode: u16) -> Result<Self> {
+        // SAFETY: `filp_open` initializes the refcount with 1
         let file_ptr = unsafe {
             from_err_ptr(bindings::filp_open(
                 filename.as_ptr() as *const i8,
@@ -217,8 +230,7 @@ pub fn from_path(filename: &CStr, flags: i32, mode: u16) -> Result<Self> {
         };
         let file_ptr = ptr::NonNull::new(file_ptr).ok_or(ENOENT)?;
 
-        // SAFETY: `filp_open` initializes the refcount with 1
-        Ok(RegularFile(unsafe { ARef::from_raw(file_ptr.cast()) }))
+        Self::create_if_regular(file_ptr)
     }
 
     /// Constructs a new [`struct file`] wrapper from a path and a vfsmount.
@@ -228,6 +240,7 @@ pub fn from_path_in_root_mnt(
         flags: i32,
         mode: u16,
     ) -> Result<Self> {
+        // SAFETY: `file_open_root` increments the refcount before returning. (TODO does it?)
         let file_ptr = unsafe {
             let mnt = mount.get();
             let raw_path = bindings::path {
@@ -243,8 +256,7 @@ pub fn from_path_in_root_mnt(
         };
         let file_ptr = ptr::NonNull::new(file_ptr).ok_or(ENOENT)?;
 
-        // SAFETY: `file_open_root` increments the refcount before returning. (TODO does it?)
-        Ok(RegularFile(unsafe { ARef::from_raw(file_ptr.cast()) }))
+        Self::create_if_regular(file_ptr)
     }
 
     /// Read from the file into the specified buffer
-- 
2.40.1

