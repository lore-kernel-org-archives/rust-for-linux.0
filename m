Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E02C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbjFIGzP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237322AbjFIGzL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:11 -0400
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9435A3598
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=13482; q=dns/txt;
  s=iport; t=1686293691; x=1687503291;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wp9zKEKhGgTzVANWYs2SaT2lEuY5JYv9WJ9BhlRbW0s=;
  b=VyV/vU7cTdDbx/nXLrTxHgoI8If3zTHQN4mWcvmxokNcDmhrK0OAGsxu
   9/xlFEoK7m0D1gcfjoTAoQ7brkVNthwoUAY8Mu6cmOLSSNYpHhwB5EJwQ
   MqvaXZpzeYVm108Y+QjDaRMJyYjti33NWd+Z/Yvwhl9iQWAKXj/Acs6B9
   c=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7820473"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:32:00 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIED055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:32:00 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 79/80] rust: puzzlefs: add support for reading files
Date:   Fri,  9 Jun 2023 09:31:17 +0300
Message-Id: <20230609063118.24852-80-amiculas@cisco.com>
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
 samples/rust/puzzle/inode.rs | 68 ++++++++++++++++++++++++++++++++----
 samples/rust/puzzle/oci.rs   | 32 +++++++++++++----
 samples/rust/puzzle/types.rs | 10 +++---
 samples/rust/puzzlefs.rs     | 59 ++++++++++++++-----------------
 4 files changed, 118 insertions(+), 51 deletions(-)

diff --git a/samples/rust/puzzle/inode.rs b/samples/rust/puzzle/inode.rs
index eaaa6d964db2..678e9fe1af03 100644
--- a/samples/rust/puzzle/inode.rs
+++ b/samples/rust/puzzle/inode.rs
@@ -8,10 +8,10 @@
 use crate::puzzle::types::Digest;
 use crate::puzzle::types::{FileChunk, Ino, InodeAdditional, MetadataBlob};
 use alloc::vec::Vec;
+use core::cmp::min;
 use kernel::mount::Vfsmount;
 use kernel::prelude::{ENOENT, ENOTDIR};
 use kernel::str::CStr;
-use kernel::sync::Arc;
 
 #[derive(Debug)]
 pub(crate) struct Inode {
@@ -21,14 +21,16 @@ pub(crate) struct Inode {
     pub(crate) additional: Option<InodeAdditional>,
 }
 
+#[derive(Debug)]
 pub(crate) struct PuzzleFS {
     pub(crate) oci: Image,
     layers: Vec<format::MetadataBlob>,
 }
 
 impl PuzzleFS {
-    pub(crate) fn open(vfsmount: Arc<Vfsmount>, rootfs_path: &CStr) -> Result<PuzzleFS> {
-        let oci = Image::open(vfsmount)?;
+    pub(crate) fn open(oci_root_dir: &CStr, rootfs_path: &CStr) -> Result<PuzzleFS> {
+        let vfs_mount = Vfsmount::new_private_mount(oci_root_dir)?;
+        let oci = Image::open(vfs_mount)?;
         let rootfs = oci.open_rootfs_blob(rootfs_path)?;
 
         let layers =
@@ -41,8 +43,8 @@ pub(crate) fn open(vfsmount: Arc<Vfsmount>, rootfs_path: &CStr) -> Result<Puzzle
         Ok(PuzzleFS { oci, layers })
     }
 
-    pub(crate) fn find_inode(&mut self, ino: u64) -> Result<Inode> {
-        for layer in self.layers.iter_mut() {
+    pub(crate) fn find_inode(&self, ino: u64) -> Result<Inode> {
+        for layer in self.layers.iter() {
             if let Some(inode) = layer.find_inode(ino)? {
                 return Inode::new(layer, inode);
             }
@@ -52,7 +54,7 @@ pub(crate) fn find_inode(&mut self, ino: u64) -> Result<Inode> {
 }
 
 impl Inode {
-    fn new(layer: &mut MetadataBlob, inode: format::Inode) -> Result<Inode> {
+    fn new(layer: &MetadataBlob, inode: format::Inode) -> Result<Inode> {
         let mode = match inode.mode {
             format::InodeMode::Reg { offset } => {
                 let chunks = layer.read_file_chunks(offset)?;
@@ -64,7 +66,7 @@ fn new(layer: &mut MetadataBlob, inode: format::Inode) -> Result<Inode> {
                     layer
                         .read_dir_list(offset)?
                         .entries
-                        .iter_mut()
+                        .iter()
                         .map(|de| (de.name.try_clone().unwrap(), de.ino)),
                 )?;
                 // Unstable sort is used because it avoids memory allocation
@@ -94,3 +96,55 @@ pub(crate) enum InodeMode {
     Dir { entries: Vec<(Vec<u8>, Ino)> },
     Other,
 }
+
+pub(crate) fn file_read(
+    oci: &Image,
+    inode: &Inode,
+    offset: usize,
+    data: &mut [u8],
+) -> Result<usize> {
+    let chunks = match &inode.mode {
+        InodeMode::File { chunks } => chunks,
+        _ => return Err(WireFormatError::from_errno(ENOTDIR)),
+    };
+
+    // TODO: fix all this casting...
+    let end = offset + data.len();
+
+    let mut file_offset = 0;
+    let mut buf_offset = 0;
+    for chunk in chunks {
+        // have we read enough?
+        if file_offset > end {
+            break;
+        }
+
+        // should we skip this chunk?
+        if file_offset + (chunk.len as usize) < offset {
+            file_offset += chunk.len as usize;
+            continue;
+        }
+
+        let addl_offset = if offset > file_offset {
+            offset - file_offset
+        } else {
+            0
+        };
+
+        // ok, need to read this chunk; how much?
+        let left_in_buf = data.len() - buf_offset;
+        let to_read = min(left_in_buf, chunk.len as usize - addl_offset);
+
+        let start = buf_offset;
+        let finish = start + to_read;
+        file_offset += addl_offset;
+
+        // how many did we actually read?
+        let n = oci.fill_from_chunk(chunk.blob, addl_offset as u64, &mut data[start..finish])?;
+        file_offset += n;
+        buf_offset += n;
+    }
+
+    // discard any extra if we hit EOF
+    Ok(buf_offset)
+}
diff --git a/samples/rust/puzzle/oci.rs b/samples/rust/puzzle/oci.rs
index becb2b868450..935beb168079 100644
--- a/samples/rust/puzzle/oci.rs
+++ b/samples/rust/puzzle/oci.rs
@@ -1,19 +1,21 @@
-use crate::puzzle::error::Result;
+use crate::puzzle::error::{Result, WireFormatError};
+use crate::puzzle::types as format;
 use crate::puzzle::types::{Digest, MetadataBlob, Rootfs};
 use kernel::c_str;
 use kernel::file;
 use kernel::file::RegularFile;
 use kernel::mount::Vfsmount;
-use kernel::pr_info;
+use kernel::pr_debug;
+use kernel::prelude::ENOTSUPP;
 use kernel::str::{CStr, CString};
-use kernel::sync::Arc;
 
+#[derive(Debug)]
 pub(crate) struct Image {
-    vfs_mount: Arc<Vfsmount>,
+    pub(crate) vfs_mount: Vfsmount,
 }
 
 impl Image {
-    pub(crate) fn open(vfsmount: Arc<Vfsmount>) -> Result<Self> {
+    pub(crate) fn open(vfsmount: Vfsmount) -> Result<Self> {
         Ok(Image {
             vfs_mount: vfsmount,
         })
@@ -26,7 +28,7 @@ pub(crate) fn blob_path_relative(&self) -> &CStr {
     fn open_raw_blob(&self, digest: &Digest) -> Result<RegularFile> {
         let filename =
             CString::try_from_fmt(format_args!("{}/{digest}", self.blob_path_relative()))?;
-        pr_info!("trying to open {:?}\n", &filename);
+        pr_debug!("trying to open {:?}\n", &filename);
 
         let file = RegularFile::from_path_in_root_mnt(
             &self.vfs_mount,
@@ -48,4 +50,22 @@ pub(crate) fn open_rootfs_blob(&self, path: &CStr) -> Result<Rootfs> {
         let rootfs = Rootfs::open(self.open_raw_blob(&digest)?)?;
         Ok(rootfs)
     }
+
+    pub(crate) fn fill_from_chunk(
+        &self,
+        chunk: format::BlobRef,
+        addl_offset: u64,
+        buf: &mut [u8],
+    ) -> Result<usize> {
+        let digest = &<Digest>::try_from(chunk)?;
+
+        let blob = if chunk.compressed {
+            return Err(WireFormatError::KernelError(ENOTSUPP));
+        } else {
+            self.open_raw_blob(digest)?
+        };
+
+        let n = blob.read_with_offset(buf, chunk.offset + addl_offset)?;
+        Ok(n)
+    }
 }
diff --git a/samples/rust/puzzle/types.rs b/samples/rust/puzzle/types.rs
index 69d4f5dfa12c..353323f73ab1 100644
--- a/samples/rust/puzzle/types.rs
+++ b/samples/rust/puzzle/types.rs
@@ -148,28 +148,28 @@ pub(crate) fn new(mut f: file::RegularFile) -> Result<MetadataBlob> {
         })
     }
 
-    pub(crate) fn seek_ref(&mut self, r: &BlobRef) -> Result<u64> {
+    pub(crate) fn seek_ref(&self, r: &BlobRef) -> Result<u64> {
         match r.kind {
             BlobRefKind::Other { .. } => Err(WireFormatError::SeekOtherError),
             BlobRefKind::Local => Ok(r.offset),
         }
     }
 
-    pub(crate) fn read_file_chunks(&mut self, offset: u64) -> Result<Vec<FileChunk>> {
+    pub(crate) fn read_file_chunks(&self, offset: u64) -> Result<Vec<FileChunk>> {
         read_one_from_slice::<FileChunkList>(&self.mmapped_region[offset as usize..])
             .map(|cl| cl.chunks)
     }
 
-    pub(crate) fn read_dir_list(&mut self, offset: u64) -> Result<DirList> {
+    pub(crate) fn read_dir_list(&self, offset: u64) -> Result<DirList> {
         read_one_from_slice(&self.mmapped_region[offset as usize..])
     }
 
-    pub(crate) fn read_inode_additional(&mut self, r: &BlobRef) -> Result<InodeAdditional> {
+    pub(crate) fn read_inode_additional(&self, r: &BlobRef) -> Result<InodeAdditional> {
         let offset = self.seek_ref(r)? as usize;
         read_one_from_slice(&self.mmapped_region[offset..])
     }
 
-    pub(crate) fn find_inode(&mut self, ino: Ino) -> Result<Option<Inode>> {
+    pub(crate) fn find_inode(&self, ino: Ino) -> Result<Option<Inode>> {
         let mut left = 0;
         let mut right = self.inode_count;
 
diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index f04a2e5bcb04..897a996a6ab3 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -3,7 +3,6 @@
 //! Rust file system sample.
 
 use kernel::module_fs;
-use kernel::mount::Vfsmount;
 use kernel::prelude::*;
 use kernel::{
     c_str, file, fs,
@@ -12,7 +11,7 @@
 };
 
 mod puzzle;
-use puzzle::inode::{Inode, InodeMode, PuzzleFS};
+use puzzle::inode::{file_read, Inode, InodeMode, PuzzleFS};
 
 use kernel::fs::{DEntry, INodeParams, NeedsRoot, NewSuperBlock, RootDEntry};
 
@@ -27,7 +26,7 @@
 
 #[derive(Debug)]
 struct PuzzlefsInfo {
-    vfs_mount: Arc<Vfsmount>,
+    puzzlefs: Arc<PuzzleFS>,
 }
 
 #[vtable]
@@ -56,7 +55,7 @@ fn try_new() -> Result {
 
 fn puzzlefs_populate_dir(
     sb: &NewSuperBlock<'_, PuzzleFsModule, NeedsRoot>,
-    pfs: &mut PuzzleFS,
+    pfs: &PuzzleFS,
     parent: &DEntry<PuzzleFsModule>,
     ino: u64,
     name: &CStr,
@@ -111,7 +110,7 @@ fn puzzlefs_populate_dir(
 /// Creates a new root dentry populated with the given entries.
 fn try_new_populated_root_puzzlefs_dentry(
     sb: &NewSuperBlock<'_, PuzzleFsModule, NeedsRoot>,
-    pfs: &mut PuzzleFS,
+    pfs: &PuzzleFS,
     root_value: <PuzzleFsModule as fs::Type>::INodeData,
 ) -> Result<RootDEntry<PuzzleFsModule>> {
     let root_inode = sb.sb.try_new_dcache_dir_inode(INodeParams {
@@ -136,14 +135,20 @@ impl fs::Type for PuzzleFsModule {
     const DCACHE_BASED: bool = true;
 
     fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
-        let vfs_mount = Vfsmount::new_private_mount(c_str!("/home/puzzlefs_oci"))?;
-        pr_info!("vfs_mount {:?}\n", vfs_mount);
+        let puzzlefs = PuzzleFS::open(
+            c_str!("/home/puzzlefs_oci"),
+            c_str!("2d6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcffdcae901b"),
+        );
 
-        let arc_vfs_mount = Arc::try_new(vfs_mount)?;
+        if let Err(ref e) = puzzlefs {
+            pr_info!("error opening puzzlefs {e}\n");
+        }
+
+        let puzzlefs = Arc::try_new(puzzlefs?)?;
 
         let sb = sb.init(
             Box::try_new(PuzzlefsInfo {
-                vfs_mount: arc_vfs_mount.clone(),
+                puzzlefs: puzzlefs.clone(),
             })?,
             &fs::SuperParams {
                 magic: 0x72757374,
@@ -151,19 +156,9 @@ fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBl
             },
         )?;
 
-        let puzzlefs = PuzzleFS::open(
-            arc_vfs_mount,
-            c_str!("2d6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcffdcae901b"),
-        );
-
-        if let Err(ref e) = puzzlefs {
-            pr_info!("error opening puzzlefs {e}\n");
-        }
-
-        let mut puzzlefs = puzzlefs?;
         let root_inode = Arc::try_new(puzzlefs.find_inode(1)?)?;
 
-        let root = try_new_populated_root_puzzlefs_dentry(&sb, &mut puzzlefs, root_inode)?;
+        let root = try_new_populated_root_puzzlefs_dentry(&sb, &puzzlefs, root_inode)?;
         let sb = sb.init_root(root)?;
         Ok(sb)
     }
@@ -175,34 +170,32 @@ fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBl
 impl file::Operations for FsFile {
     // must be the same as INodeData
     type OpenData = Arc<Inode>;
+    // must be the same as fs::Type::Data
+    // TODO: find a way to enforce this
     type FSData = Box<PuzzlefsInfo>;
     // this is an Arc because Data must be ForeignOwnable and the only implementors of it are Box,
-    // Arc and (); we cannot pass a reference to read, so we share Vfsmount using and Arc
-    type Data = Arc<Vfsmount>;
+    // Arc and (); we cannot pass a reference to the read callback, so we share PuzzleFS using Arc
+    type Data = Arc<PuzzleFS>;
 
     fn open(
         fs_info: &PuzzlefsInfo,
         _context: &Self::OpenData,
         _file: &file::File,
     ) -> Result<Self::Data> {
-        Ok(fs_info.vfs_mount.clone())
+        Ok(fs_info.puzzlefs.clone())
     }
 
     fn read(
-        data: ArcBorrow<'_, Vfsmount>,
-        _file: &file::File,
+        data: ArcBorrow<'_, PuzzleFS>,
+        file: &file::File,
         writer: &mut impl IoBufferWriter,
         offset: u64,
     ) -> Result<usize> {
+        let inode = file.inode::<PuzzleFsModule>().ok_or(EINVAL)?.fs_data();
         let mut buf = Vec::try_with_capacity(writer.len())?;
         buf.try_resize(writer.len(), 0)?;
-        let file = file::RegularFile::from_path_in_root_mnt(
-            &data,
-            c_str!("data"),
-            file::flags::O_RDONLY.try_into().unwrap(),
-            0,
-        )?;
-        let nr_bytes_read = file.read_with_offset(&mut buf[..], offset)?;
-        file::read_from_slice(&buf[..nr_bytes_read], writer, 0)
+        let read = file_read(&data.oci, inode, offset as usize, &mut buf)?;
+        buf.truncate(read);
+        file::read_from_slice(&buf, writer, 0)
     }
 }
-- 
2.40.1

