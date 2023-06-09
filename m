Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5F4C8300C
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237878AbjFIGyR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238476AbjFIGyK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:10 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18512D7C
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=7536; q=dns/txt; s=iport;
  t=1686293648; x=1687503248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZWYwpni0j8BCCmI4MeeO5mMJMIX9iiFwD73c0Qa/VnU=;
  b=fW8BH0yvFdDIEaPbqqxeDZ66I+U8AKnEiyQSO1gCxl6y5wrK2lhtyPGA
   A0kUuEbz1VeZvd6rz62XcprKqnW4RZFEo1rzdDqrx/JNwr58rYumbgS6j
   fv4eM1KODcTDrT6h7uaXlulE0rPPhDLsS9XacHDBCpoTaWOIE6/7/QG6i
   I=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="8508935"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:57 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIE1055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:57 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 67/80] samples: puzzlefs: populate the directory entries with the inodes from the puzzlefs metadata file
Date:   Fri,  9 Jun 2023 09:31:05 +0300
Message-Id: <20230609063118.24852-68-amiculas@cisco.com>
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
 rust/kernel/fs.rs        |   4 +-
 samples/rust/puzzlefs.rs | 125 ++++++++++++++++++++++++++++++---------
 2 files changed, 100 insertions(+), 29 deletions(-)

diff --git a/rust/kernel/fs.rs b/rust/kernel/fs.rs
index ba98ae7caf00..81c64faf717b 100644
--- a/rust/kernel/fs.rs
+++ b/rust/kernel/fs.rs
@@ -775,7 +775,9 @@ impl SuperParams {
 ///
 /// The superblock is a newly-created one and this is the only active pointer to it.
 pub struct NewSuperBlock<'a, T: Type + ?Sized, S = NeedsInit> {
-    sb: &'a mut SuperBlock<T>,
+    /// Pointer to the superblock; this fields is public so puzzlefs can call
+    /// try_new_dcache_dir_inode when populating the directory hierarchy
+    pub sb: &'a mut SuperBlock<T>,
 
     // This also forces `'a` to be invariant.
     _p: PhantomData<&'a mut &'a S>,
diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index 50d62109a9c1..c160b5e5f911 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -6,13 +6,16 @@
 use kernel::mount::Vfsmount;
 use kernel::prelude::*;
 use kernel::{
-    c_str, file, fmt, fs,
+    c_str, file, fs,
     io_buffer::IoBufferWriter,
-    str::CString,
     sync::{Arc, ArcBorrow},
 };
 
 mod puzzle;
+use puzzle::inode::{Inode, InodeMode, PuzzleFS};
+use puzzle::types::MetadataBlob;
+
+use kernel::fs::{DEntry, INodeParams, NeedsRoot, NewSuperBlock, RootDEntry};
 
 module_fs! {
     type: PuzzleFs,
@@ -25,7 +28,6 @@
 
 #[derive(Debug)]
 struct PuzzlefsInfo {
-    base_path: CString,
     vfs_mount: Arc<Vfsmount>,
 }
 
@@ -53,9 +55,81 @@ fn try_new() -> Result {
     }
 }
 
+fn puzzlefs_populate_dir(
+    sb: &NewSuperBlock<'_, PuzzleFs, NeedsRoot>,
+    pfs: &mut PuzzleFS,
+    parent: &DEntry<PuzzleFs>,
+    ino: u64,
+    name: &CStr,
+    recursion: usize,
+) -> Result {
+    if recursion == 0 {
+        return Err(E2BIG);
+    }
+
+    let inode = Arc::try_new(pfs.find_inode(ino).map_err(|_| EINVAL)?)?;
+    match &inode.mode {
+        InodeMode::File { chunks: _ } => {
+            let params = INodeParams {
+                mode: inode.inode.permissions,
+                ino: inode.inode.ino,
+                value: inode.clone(),
+            };
+            let creator = fs::file_creator::<_, FsFile>();
+            let inode = creator(sb, params)?;
+            sb.try_new_dentry(inode, parent, name)?;
+        }
+        InodeMode::Dir { entries } => {
+            let params = INodeParams {
+                mode: inode.inode.permissions,
+                ino: inode.inode.ino,
+                value: inode.clone(),
+            };
+
+            let new_dentry;
+            let new_parent = if name.as_bytes() != c_str!("").as_bytes() {
+                let dcache_inode = sb.sb.try_new_dcache_dir_inode(params)?;
+                new_dentry = sb.try_new_dentry(dcache_inode, parent, name)?;
+                &new_dentry
+            } else {
+                parent
+            };
+
+            for (name, new_inode) in entries {
+                let mut name = name.try_clone()?;
+                // append NUL terminator
+                name.try_push(0)?;
+                let name = CStr::from_bytes_with_nul(&name)?;
+                puzzlefs_populate_dir(sb, pfs, new_parent, *new_inode, name, recursion - 1)?;
+            }
+        }
+        InodeMode::Other => todo!(),
+    }
+
+    Ok(())
+}
+
+/// Creates a new root dentry populated with the given entries.
+fn try_new_populated_root_puzzlefs_dentry(
+    sb: &NewSuperBlock<'_, PuzzleFs, NeedsRoot>,
+    pfs: &mut PuzzleFS,
+    root_value: <PuzzleFs as fs::Type>::INodeData,
+) -> Result<RootDEntry<PuzzleFs>> {
+    let root_inode = sb.sb.try_new_dcache_dir_inode(INodeParams {
+        mode: 0o755,
+        ino: root_value.inode.ino,
+        value: root_value,
+    })?;
+    let root = sb.try_new_root_dentry(root_inode)?;
+    let ino = 1u64;
+    puzzlefs_populate_dir(sb, pfs, &root, ino, c_str!(""), 10)?;
+    Ok(root)
+}
+
 impl fs::Type for PuzzleFs {
     type Context = Self;
-    type INodeData = &'static [u8];
+    // this is Arc so it can be cloned in puzzlefs_populate_dir
+    type INodeData = Arc<Inode>;
     type Data = Box<PuzzlefsInfo>;
     const SUPER_TYPE: fs::Super = fs::Super::Independent;
     const NAME: &'static CStr = c_str!("puzzlefs");
@@ -63,41 +137,36 @@ impl fs::Type for PuzzleFs {
     const DCACHE_BASED: bool = true;
 
     fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
-        let base_path = CString::try_from_fmt(fmt!("hello world"))?;
-        pr_info!("base_path {:?}\n", base_path);
         let vfs_mount = Vfsmount::new_private_mount(c_str!("/home/puzzlefs_oci"))?;
         pr_info!("vfs_mount {:?}\n", vfs_mount);
 
+        let arc_vfs_mount = Arc::try_new(vfs_mount)?;
+
         let sb = sb.init(
             Box::try_new(PuzzlefsInfo {
-                base_path,
-                vfs_mount: Arc::try_new(vfs_mount)?,
+                vfs_mount: arc_vfs_mount.clone(),
             })?,
             &fs::SuperParams {
                 magic: 0x72757374,
                 ..fs::SuperParams::DEFAULT
             },
         )?;
-        let root = sb.try_new_populated_root_dentry(
-            &[],
-            kernel::fs_entries![
-                file("test1", 0o600, "abc\n".as_bytes(), FsFile),
-                file("test2", 0o600, "def\n".as_bytes(), FsFile),
-                char("test3", 0o600, [].as_slice(), (10, 125)),
-                sock("test4", 0o755, [].as_slice()),
-                fifo("test5", 0o755, [].as_slice()),
-                block("test6", 0o755, [].as_slice(), (1, 1)),
-                dir(
-                    "dir1",
-                    0o755,
-                    [].as_slice(),
-                    [
-                        file("test1", 0o600, "abc\n".as_bytes(), FsFile),
-                        file("test2", 0o600, "def\n".as_bytes(), FsFile),
-                    ]
-                ),
-            ],
+
+        let file = file::RegularFile::from_path_in_root_mnt(
+            &arc_vfs_mount,
+            c_str!("997eed138af30d187e87d682dd2ae9f240fae78f668907a0519460b397c82467"),
+            file::flags::O_RDONLY.try_into().unwrap(),
+            0,
         )?;
+
+        // TODO: figure out how to go from WireFormatError to kernel::error::Error
+        let metadata = MetadataBlob::new(file).map_err(|_| EINVAL)?;
+        pr_info!("number of inodes {:?}\n", metadata.inode_count);
+
+        let mut puzzlefs = PuzzleFS::new(metadata).map_err(|_| EINVAL)?;
+        let root_inode = Arc::try_new(puzzlefs.find_inode(1).map_err(|_| EINVAL)?)?;
+
+        let root = try_new_populated_root_puzzlefs_dentry(&sb, &mut puzzlefs, root_inode)?;
         let sb = sb.init_root(root)?;
         Ok(sb)
     }
@@ -108,7 +177,7 @@ fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBl
 #[vtable]
 impl file::Operations for FsFile {
     // must be the same as INodeData
-    type OpenData = &'static [u8];
+    type OpenData = Arc<Inode>;
     type FSData = Box<PuzzlefsInfo>;
     // this is an Arc because Data must be ForeignOwnable and the only implementors of it are Box,
     // Arc and (); we cannot pass a reference to read, so we share Vfsmount using and Arc
-- 
2.40.1

