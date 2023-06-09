Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52656C7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237178AbjFIGyf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238518AbjFIGyU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:20 -0400
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4B4271D
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3698; q=dns/txt; s=iport;
  t=1686293656; x=1687503256;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XbUBkYNxE/m0UQR2D/EnVvjWini+4eNwMPeT2CDQeUU=;
  b=JT8FY0pz8A8aLwFzB0H+FGwrRSQkQcP3dQgl058jeWp2v65v1ezG17NH
   CDVIMl+obCteA0D9vt4MMnqrDZsEUMFDIiupJBkiGTfS2zis1meXET0JG
   3ysq7T9p1GDDqnpFY24LC904d9b1Dg4kj2lew3K5m9la8/8kRn6/p1M1E
   8=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5220565"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:57 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIE0055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:56 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 66/80] samples: puzzlefs: add higher level inode related functionality
Date:   Fri,  9 Jun 2023 09:31:04 +0300
Message-Id: <20230609063118.24852-67-amiculas@cisco.com>
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
 samples/rust/puzzle.rs       |  3 +-
 samples/rust/puzzle/inode.rs | 83 ++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 samples/rust/puzzle/inode.rs

diff --git a/samples/rust/puzzle.rs b/samples/rust/puzzle.rs
index 4d558561974d..1b989a2579c4 100644
--- a/samples/rust/puzzle.rs
+++ b/samples/rust/puzzle.rs
@@ -1,2 +1,3 @@
 pub(crate) mod error;
-mod types;
+pub(crate) mod inode;
+pub(crate) mod types;
diff --git a/samples/rust/puzzle/inode.rs b/samples/rust/puzzle/inode.rs
new file mode 100644
index 000000000000..980aac9c4fd3
--- /dev/null
+++ b/samples/rust/puzzle/inode.rs
@@ -0,0 +1,83 @@
+// This contents of this file is taken from puzzlefs.rs (the userspace implementation)
+// It is named inode.rs instead puzzlefs.rs since the root of this kernel module already has that name
+
+use crate::puzzle::error::Result;
+use crate::puzzle::error::WireFormatError;
+use crate::puzzle::types as format;
+use crate::puzzle::types::{FileChunk, Ino, InodeAdditional, MetadataBlob};
+use alloc::vec::Vec;
+use kernel::prelude::{ENOENT, ENOTDIR};
+
+#[derive(Debug)]
+pub(crate) struct Inode {
+    pub(crate) inode: format::Inode,
+    pub(crate) mode: InodeMode,
+    #[allow(dead_code)]
+    pub(crate) additional: Option<InodeAdditional>,
+}
+
+pub(crate) struct PuzzleFS {
+    layers: Vec<format::MetadataBlob>,
+}
+
+impl PuzzleFS {
+    pub(crate) fn new(md: MetadataBlob) -> Result<Self> {
+        let mut v = Vec::new();
+        v.try_push(md)?;
+        Ok(PuzzleFS { layers: v })
+    }
+
+    // Temporary helper function used until PuzzleFs is integrated
+    pub(crate) fn find_inode(&mut self, ino: u64) -> Result<Inode> {
+        for layer in self.layers.iter_mut() {
+            if let Some(inode) = layer.find_inode(ino)? {
+                return Inode::new(layer, inode);
+            }
+        }
+        Err(WireFormatError::from_errno(ENOENT))
+    }
+}
+
+impl Inode {
+    fn new(layer: &mut MetadataBlob, inode: format::Inode) -> Result<Inode> {
+        let mode = match inode.mode {
+            format::InodeMode::Reg { offset } => {
+                let chunks = layer.read_file_chunks(offset)?;
+                InodeMode::File { chunks }
+            }
+            format::InodeMode::Dir { offset } => {
+                // TODO: implement something like collect_fallible (since try_collect already exists with another purpose)
+                let mut entries = Vec::from_iter_fallible(
+                    layer
+                        .read_dir_list(offset)?
+                        .entries
+                        .iter_mut()
+                        .map(|de| (de.name.try_clone().unwrap(), de.ino)),
+                )?;
+                // Unstable sort is used because it avoids memory allocation
+                // There should not be two directories with the same name, so stable sort doesn't have any advantage
+                entries.sort_unstable_by(|(a, _), (b, _)| a.cmp(b));
+                InodeMode::Dir { entries }
+            }
+            _ => InodeMode::Other,
+        };
+
+        let additional = inode
+            .additional
+            .map(|additional_ref| layer.read_inode_additional(&additional_ref))
+            .transpose()?;
+
+        Ok(Inode {
+            inode,
+            mode,
+            additional,
+        })
+    }
+}
+
+#[derive(Debug)]
+pub(crate) enum InodeMode {
+    File { chunks: Vec<FileChunk> },
+    Dir { entries: Vec<(Vec<u8>, Ino)> },
+    Other,
+}
-- 
2.40.1

