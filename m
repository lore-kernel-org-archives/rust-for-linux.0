Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B90C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238493AbjFIG4d (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238518AbjFIG4S (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:18 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D6E2D7B
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=6710; q=dns/txt; s=iport;
  t=1686293749; x=1687503349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UzHztnbYKw8dUhUPXpuN4ugBhnuzHrL68KHn54oi4QM=;
  b=VwdizbxGeZ3sWU4gvjcGcOmOsR7UIA96fhM+u8rGpKBQ1zdnWh+WXXPq
   GVxpMW92QjRoUG324yI6ap4s2JaeB1PE73AMY4UA8a9SnwY+KOZoJDqWu
   uTAT7AvtrkOsywxZo+RLqKsKeWWGiGu3uWZaH2Fj43J/HX4P8bZPzngEr
   c=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453687"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:32:00 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIEB055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:59 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 77/80] rust: puzzlefs: read the puzzlefs image manifest instead of an individual metadata layer
Date:   Fri,  9 Jun 2023 09:31:15 +0300
Message-Id: <20230609063118.24852-78-amiculas@cisco.com>
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

The puzzlefs image manifest is the file referenced by index.json and it
contains the array of metadata layers that describe the puzzlefs image.
This file represents the root of the puzzlefs filesystem since we can't
parse json files. When this filesystem is mounted, usermode will need to
read the tag from index.json, find the corresponding puzzlefs image
manifest and pass it to the kernel module.

Due to the lack of BTreeMap in the kernel, only image manifests without
fs verity information are supported for now.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 samples/rust/puzzle.rs       |  1 +
 samples/rust/puzzle/inode.rs | 23 ++++++++++++----
 samples/rust/puzzle/oci.rs   | 51 ++++++++++++++++++++++++++++++++++++
 samples/rust/puzzlefs.rs     | 23 +++++++---------
 4 files changed, 80 insertions(+), 18 deletions(-)
 create mode 100644 samples/rust/puzzle/oci.rs

diff --git a/samples/rust/puzzle.rs b/samples/rust/puzzle.rs
index 1b989a2579c4..ae7c57efc92c 100644
--- a/samples/rust/puzzle.rs
+++ b/samples/rust/puzzle.rs
@@ -1,3 +1,4 @@
 pub(crate) mod error;
 pub(crate) mod inode;
+pub(crate) mod oci;
 pub(crate) mod types;
diff --git a/samples/rust/puzzle/inode.rs b/samples/rust/puzzle/inode.rs
index 980aac9c4fd3..eaaa6d964db2 100644
--- a/samples/rust/puzzle/inode.rs
+++ b/samples/rust/puzzle/inode.rs
@@ -3,10 +3,15 @@
 
 use crate::puzzle::error::Result;
 use crate::puzzle::error::WireFormatError;
+use crate::puzzle::oci::Image;
 use crate::puzzle::types as format;
+use crate::puzzle::types::Digest;
 use crate::puzzle::types::{FileChunk, Ino, InodeAdditional, MetadataBlob};
 use alloc::vec::Vec;
+use kernel::mount::Vfsmount;
 use kernel::prelude::{ENOENT, ENOTDIR};
+use kernel::str::CStr;
+use kernel::sync::Arc;
 
 #[derive(Debug)]
 pub(crate) struct Inode {
@@ -17,17 +22,25 @@ pub(crate) struct Inode {
 }
 
 pub(crate) struct PuzzleFS {
+    pub(crate) oci: Image,
     layers: Vec<format::MetadataBlob>,
 }
 
 impl PuzzleFS {
-    pub(crate) fn new(md: MetadataBlob) -> Result<Self> {
-        let mut v = Vec::new();
-        v.try_push(md)?;
-        Ok(PuzzleFS { layers: v })
+    pub(crate) fn open(vfsmount: Arc<Vfsmount>, rootfs_path: &CStr) -> Result<PuzzleFS> {
+        let oci = Image::open(vfsmount)?;
+        let rootfs = oci.open_rootfs_blob(rootfs_path)?;
+
+        let layers =
+            Vec::from_iter_fallible(rootfs.metadatas.iter().map(|md| -> Result<MetadataBlob> {
+                let digest = Digest::try_from(md)?;
+                oci.open_metadata_blob(&digest)
+            }))?
+            .process_results()?;
+
+        Ok(PuzzleFS { oci, layers })
     }
 
-    // Temporary helper function used until PuzzleFs is integrated
     pub(crate) fn find_inode(&mut self, ino: u64) -> Result<Inode> {
         for layer in self.layers.iter_mut() {
             if let Some(inode) = layer.find_inode(ino)? {
diff --git a/samples/rust/puzzle/oci.rs b/samples/rust/puzzle/oci.rs
new file mode 100644
index 000000000000..becb2b868450
--- /dev/null
+++ b/samples/rust/puzzle/oci.rs
@@ -0,0 +1,51 @@
+use crate::puzzle::error::Result;
+use crate::puzzle::types::{Digest, MetadataBlob, Rootfs};
+use kernel::c_str;
+use kernel::file;
+use kernel::file::RegularFile;
+use kernel::mount::Vfsmount;
+use kernel::pr_info;
+use kernel::str::{CStr, CString};
+use kernel::sync::Arc;
+
+pub(crate) struct Image {
+    vfs_mount: Arc<Vfsmount>,
+}
+
+impl Image {
+    pub(crate) fn open(vfsmount: Arc<Vfsmount>) -> Result<Self> {
+        Ok(Image {
+            vfs_mount: vfsmount,
+        })
+    }
+
+    pub(crate) fn blob_path_relative(&self) -> &CStr {
+        c_str!("blobs/sha256")
+    }
+
+    fn open_raw_blob(&self, digest: &Digest) -> Result<RegularFile> {
+        let filename =
+            CString::try_from_fmt(format_args!("{}/{digest}", self.blob_path_relative()))?;
+        pr_info!("trying to open {:?}\n", &filename);
+
+        let file = RegularFile::from_path_in_root_mnt(
+            &self.vfs_mount,
+            &filename,
+            file::flags::O_RDONLY.try_into().unwrap(),
+            0,
+        )?;
+
+        Ok(file)
+    }
+
+    pub(crate) fn open_metadata_blob(&self, digest: &Digest) -> Result<MetadataBlob> {
+        let f = self.open_raw_blob(digest)?;
+        MetadataBlob::new(f)
+    }
+
+    pub(crate) fn open_rootfs_blob(&self, path: &CStr) -> Result<Rootfs> {
+        let digest = Digest::try_from(path)?;
+        let rootfs = Rootfs::open(self.open_raw_blob(&digest)?)?;
+        Ok(rootfs)
+    }
+}
diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index c160b5e5f911..d74e034538eb 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -13,7 +13,6 @@
 
 mod puzzle;
 use puzzle::inode::{Inode, InodeMode, PuzzleFS};
-use puzzle::types::MetadataBlob;
 
 use kernel::fs::{DEntry, INodeParams, NeedsRoot, NewSuperBlock, RootDEntry};
 
@@ -67,7 +66,7 @@ fn puzzlefs_populate_dir(
         return Err(E2BIG);
     }
 
-    let inode = Arc::try_new(pfs.find_inode(ino).map_err(|_| EINVAL)?)?;
+    let inode = Arc::try_new(pfs.find_inode(ino)?)?;
     match &inode.mode {
         InodeMode::File { chunks: _ } => {
             let params = INodeParams {
@@ -152,19 +151,17 @@ fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBl
             },
         )?;
 
-        let file = file::RegularFile::from_path_in_root_mnt(
-            &arc_vfs_mount,
-            c_str!("997eed138af30d187e87d682dd2ae9f240fae78f668907a0519460b397c82467"),
-            file::flags::O_RDONLY.try_into().unwrap(),
-            0,
-        )?;
+        let puzzlefs = PuzzleFS::open(
+            arc_vfs_mount,
+            c_str!("2d6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcffdcae901b"),
+        );
 
-        // TODO: figure out how to go from WireFormatError to kernel::error::Error
-        let metadata = MetadataBlob::new(file).map_err(|_| EINVAL)?;
-        pr_info!("number of inodes {:?}\n", metadata.inode_count);
+        if let Err(ref e) = puzzlefs {
+            pr_info!("error opening puzzlefs {e}\n");
+        }
 
-        let mut puzzlefs = PuzzleFS::new(metadata).map_err(|_| EINVAL)?;
-        let root_inode = Arc::try_new(puzzlefs.find_inode(1).map_err(|_| EINVAL)?)?;
+        let mut puzzlefs = puzzlefs?;
+        let root_inode = Arc::try_new(puzzlefs.find_inode(1)?)?;
 
         let root = try_new_populated_root_puzzlefs_dentry(&sb, &mut puzzlefs, root_inode)?;
         let sb = sb.init_root(root)?;
-- 
2.40.1

