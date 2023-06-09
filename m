Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50030C87FDE
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238164AbjFIGyb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238475AbjFIGyR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:17 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A477272A
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5229; q=dns/txt; s=iport;
  t=1686293656; x=1687503256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3jIachZJVYD3asYx4tKwnabUeF/GKfQMDJUIjqP93LU=;
  b=K9tZ+fvbmaI97My4z4RYVkjyV5jd+uLOKqSA6dfqBZ1OorbI6YaKJtBm
   FPhcCCjecnZ34XeyIk7N7prfSgRMVW2vEBwbWTh2dkQk9wb8KgRj6odES
   aSVzT5uqAyAFYgJ1gQ2OK2d8dVSG1IwJ3fJFB48i/NSERB99EZQIKngWw
   I=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="8508932"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:52 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDh055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:52 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 49/80] rust: file: present the filesystem context to the open function
Date:   Fri,  9 Jun 2023 09:30:47 +0300
Message-Id: <20230609063118.24852-50-amiculas@cisco.com>
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

This is not a good implementation because it does not ensure that the
type Operations::FSData in file.rs is the same as Type::Data in fs.rs.
This means that we could store a Box in the field s_fs_info and retrieve
an Arc from there, which is obviously wrong and it leads to UB.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/kernel/file.rs      | 18 ++++++++++++++++--
 samples/rust/puzzlefs.rs | 21 ++++++++++++++++++---
 samples/rust/rust_fs.rs  |  2 +-
 3 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/file.rs b/rust/kernel/file.rs
index 086c62000533..0062d8b17990 100644
--- a/rust/kernel/file.rs
+++ b/rust/kernel/file.rs
@@ -330,9 +330,14 @@ impl<A: OpenAdapter<T::OpenData>, T: Operations> OperationsVtable<A, T> {
             // `fileref` never outlives this function, so it is guaranteed to be
             // valid.
             let fileref = unsafe { File::from_ptr(file) };
+
+            // SAFETY: into_foreign was called in fs::NewSuperBlock<..., NeedsInit>::init and
+            // it is valid until from_foreign will be called in fs::Tables::free_callback
+            let fs_info = unsafe { T::FSData::borrow((*(*inode).i_sb).s_fs_info) };
+
             // SAFETY: `arg` was previously returned by `A::convert` and must
             // be a valid non-null pointer.
-            let ptr = T::open(unsafe { &*arg }, fileref)?.into_foreign();
+            let ptr = T::open(fs_info, unsafe { &*arg }, fileref)?.into_foreign();
             // SAFETY: The C contract guarantees that `private_data` is available
             // for implementers of the file operations (no other C code accesses
             // it), so we know that there are no concurrent threads/CPUs accessing
@@ -793,10 +798,19 @@ pub trait Operations {
     /// The type of the context data passed to [`Operations::open`].
     type OpenData: Sync = ();
 
+    /// Data associated with each file system instance.
+    // SAFETY: this is not safe because we don't enforce the same type as fs::Type::Data, so it's
+    // possible to store a Box in s_fs_info and retrieve an Arc when open is called, leading to UB
+    type FSData: ForeignOwnable + Send + Sync = ();
+
     /// Creates a new instance of this file.
     ///
     /// Corresponds to the `open` function pointer in `struct file_operations`.
-    fn open(context: &Self::OpenData, file: &File) -> Result<Self::Data>;
+    fn open(
+        fs_info: <Self::FSData as ForeignOwnable>::Borrowed<'_>,
+        context: &Self::OpenData,
+        file: &File,
+    ) -> Result<Self::Data>;
 
     /// Cleans up after the last reference to the file goes away.
     ///
diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index b149af4e66ce..e454bce7dbc6 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -4,7 +4,7 @@
 
 use kernel::module_fs;
 use kernel::prelude::*;
-use kernel::{c_str, file, fs, io_buffer::IoBufferWriter};
+use kernel::{c_str, file, fs, io_buffer::IoBufferWriter, fmt, str::CString};
 
 mod puzzle;
 
@@ -17,6 +17,11 @@
 
 struct PuzzleFs;
 
+#[derive(Debug)]
+struct PuzzlefsInfo {
+    base_path: CString,
+}
+
 #[vtable]
 impl fs::Context<Self> for PuzzleFs {
     type Data = ();
@@ -44,14 +49,17 @@ fn try_new() -> Result {
 impl fs::Type for PuzzleFs {
     type Context = Self;
     type INodeData = &'static [u8];
+    type Data = Box<PuzzlefsInfo>;
     const SUPER_TYPE: fs::Super = fs::Super::Independent;
     const NAME: &'static CStr = c_str!("puzzlefs");
     const FLAGS: i32 = fs::flags::USERNS_MOUNT;
     const DCACHE_BASED: bool = true;
 
     fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
+        let base_path = CString::try_from_fmt(fmt!("hello world"))?;
+        pr_info!("base_path {:?}\n", base_path);
         let sb = sb.init(
-            (),
+            Box::try_new(PuzzlefsInfo { base_path })?,
             &fs::SuperParams {
                 magic: 0x72757374,
                 ..fs::SuperParams::DEFAULT
@@ -87,8 +95,15 @@ fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBl
 #[vtable]
 impl file::Operations for FsFile {
     type OpenData = &'static [u8];
+    type FSData = Box<PuzzlefsInfo>;
+
+    fn open(
+        fs_info: &PuzzlefsInfo,
+        _context: &Self::OpenData,
+        _file: &file::File,
+    ) -> Result<Self::Data> {
+        pr_info!("got {:?}\n", fs_info);
 
-    fn open(_context: &Self::OpenData, _file: &file::File) -> Result<Self::Data> {
         Ok(())
     }
 
diff --git a/samples/rust/rust_fs.rs b/samples/rust/rust_fs.rs
index 7527681ee024..36bca7da179f 100644
--- a/samples/rust/rust_fs.rs
+++ b/samples/rust/rust_fs.rs
@@ -86,7 +86,7 @@ fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBl
 impl file::Operations for FsFile {
     type OpenData = &'static [u8];
 
-    fn open(_context: &Self::OpenData, _file: &file::File) -> Result<Self::Data> {
+    fn open(_fs_info: (), _context: &Self::OpenData, _file: &file::File) -> Result<Self::Data> {
         Ok(())
     }
 
-- 
2.40.1

