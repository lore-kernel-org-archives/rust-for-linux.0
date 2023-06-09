Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C38DC7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237478AbjFIGyJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237598AbjFIGyI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:08 -0400
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63EB2718
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3227; q=dns/txt; s=iport;
  t=1686293647; x=1687503247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v3nHAw0ZLVtArSLZM7ay7K9xVP24lG0ipqtR/YKMubk=;
  b=EREkmP5lGmv+5Mco7kHYNbk0OhP5ppLrXCc+DQNYbJORe1egAvLPsceJ
   ciqGFWxZ8l/+amC/klTa0solKoQm4Y2bzsKaec7uRyiFdM4lZ/UPymxdT
   8nfhuFdVgcuZVOLBmfAg2Gp47B2BPHB0K5eAhGvKh3Kdv9ZQE2+s/VSay
   g=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7857704"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:53 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDk055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:52 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 52/80] samples: puzzlefs: pass the Vfsmount structure from open to read and return the contents of the data file inside /home/puzzlefs_oci
Date:   Fri,  9 Jun 2023 09:30:50 +0300
Message-Id: <20230609063118.24852-53-amiculas@cisco.com>
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
 samples/rust/puzzlefs.rs | 44 +++++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index e454bce7dbc6..db13a1d12466 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -3,8 +3,14 @@
 //! Rust file system sample.
 
 use kernel::module_fs;
+use kernel::mount::Vfsmount;
 use kernel::prelude::*;
-use kernel::{c_str, file, fs, io_buffer::IoBufferWriter, fmt, str::CString};
+use kernel::{
+    c_str, file, fmt, fs,
+    io_buffer::IoBufferWriter,
+    str::CString,
+    sync::{Arc, ArcBorrow},
+};
 
 mod puzzle;
 
@@ -20,6 +26,7 @@
 #[derive(Debug)]
 struct PuzzlefsInfo {
     base_path: CString,
+    vfs_mount: Arc<Vfsmount>,
 }
 
 #[vtable]
@@ -58,8 +65,14 @@ impl fs::Type for PuzzleFs {
     fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
         let base_path = CString::try_from_fmt(fmt!("hello world"))?;
         pr_info!("base_path {:?}\n", base_path);
+        let vfs_mount = Vfsmount::new_private_mount(c_str!("/home/puzzlefs_oci"))?;
+        pr_info!("vfs_mount {:?}\n", vfs_mount);
+
         let sb = sb.init(
-            Box::try_new(PuzzlefsInfo { base_path })?,
+            Box::try_new(PuzzlefsInfo {
+                base_path,
+                vfs_mount: Arc::try_new(vfs_mount)?,
+            })?,
             &fs::SuperParams {
                 magic: 0x72757374,
                 ..fs::SuperParams::DEFAULT
@@ -94,29 +107,36 @@ fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBl
 
 #[vtable]
 impl file::Operations for FsFile {
+    // must be the same as INodeData
     type OpenData = &'static [u8];
     type FSData = Box<PuzzlefsInfo>;
+    // this is an Arc because Data must be ForeignOwnable and the only implementors of it are Box,
+    // Arc and (); we cannot pass a reference to read, so we share Vfsmount using and Arc
+    type Data = Arc<Vfsmount>;
 
     fn open(
         fs_info: &PuzzlefsInfo,
         _context: &Self::OpenData,
         _file: &file::File,
     ) -> Result<Self::Data> {
-        pr_info!("got {:?}\n", fs_info);
-
-        Ok(())
+        Ok(fs_info.vfs_mount.clone())
     }
 
     fn read(
-        _data: (),
-        file: &file::File,
+        data: ArcBorrow<'_, Vfsmount>,
+        _file: &file::File,
         writer: &mut impl IoBufferWriter,
         offset: u64,
     ) -> Result<usize> {
-        file::read_from_slice(
-            file.inode::<PuzzleFs>().ok_or(EINVAL)?.fs_data(),
-            writer,
-            offset,
-        )
+        let mut buf = Vec::try_with_capacity(writer.len())?;
+        buf.try_resize(writer.len(), 0)?;
+        let file = file::File::from_path_in_root_mnt(
+            &data,
+            c_str!("data"),
+            file::flags::O_RDONLY.try_into().unwrap(),
+            0,
+        )?;
+        let nr_bytes_read = file.read_with_offset(&mut buf[..], offset)?;
+        file::read_from_slice(&buf[..nr_bytes_read], writer, 0)
     }
 }
-- 
2.40.1

