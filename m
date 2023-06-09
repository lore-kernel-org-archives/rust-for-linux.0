Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA5FC7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbjFIGzx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238493AbjFIGzn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:43 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904E92D7C
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=13575; q=dns/txt;
  s=iport; t=1686293712; x=1687503312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/0dTFZ+wV/O55RkJlhoCddoW4JQhisbdUu6lkLb70ug=;
  b=hyRKs5Od7eOIQs9yuo+Ug3dht/i0Gsk2+zZSPyCd8P2uCg4gPaDbwYKm
   BzaHaJFH6gtD4sTCR9egR2UwDEp58yfgxTN0hIOpk4xI5Z/qe1Wn31Ov9
   tflMh1THrpuW2m/k7HJVs4etJdycXyA9CJyQKHOuehFt8Di18SlysMY/X
   0=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279099"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:52 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDg055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:51 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 48/80] samples: puzzlefs: add basic deserializing support for the puzzlefs metadata
Date:   Fri,  9 Jun 2023 09:30:46 +0300
Message-Id: <20230609063118.24852-49-amiculas@cisco.com>
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
 samples/rust/puzzle.rs                    |   2 +
 samples/rust/puzzle/error.rs              |  32 +++
 samples/rust/puzzle/types.rs              | 304 ++++++++++++++++++++++
 samples/rust/puzzle/types/cbor_helpers.rs |   9 +
 samples/rust/puzzlefs.rs                  |   2 +
 5 files changed, 349 insertions(+)
 create mode 100644 samples/rust/puzzle.rs
 create mode 100644 samples/rust/puzzle/error.rs
 create mode 100644 samples/rust/puzzle/types.rs
 create mode 100644 samples/rust/puzzle/types/cbor_helpers.rs

diff --git a/samples/rust/puzzle.rs b/samples/rust/puzzle.rs
new file mode 100644
index 000000000000..4d558561974d
--- /dev/null
+++ b/samples/rust/puzzle.rs
@@ -0,0 +1,2 @@
+pub(crate) mod error;
+mod types;
diff --git a/samples/rust/puzzle/error.rs b/samples/rust/puzzle/error.rs
new file mode 100644
index 000000000000..3427c5d2f7e3
--- /dev/null
+++ b/samples/rust/puzzle/error.rs
@@ -0,0 +1,32 @@
+use core::fmt::{self, Display};
+
+// TODO use String in error types (when it's available from the kernel)
+
+pub(crate) enum WireFormatError {
+    LocalRefError,
+    SeekOtherError,
+    ValueMissing,
+    CBORError(serde_cbor::Error),
+}
+
+impl Display for WireFormatError {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            WireFormatError::LocalRefError => f.write_str("cannot turn local ref into a digest"),
+            WireFormatError::SeekOtherError => f.write_str("cannot seek to other blob"),
+            WireFormatError::ValueMissing => f.write_str("no value present"),
+            WireFormatError::CBORError(_) => f.write_str("CBOR error"),
+        }
+    }
+}
+
+pub(crate) type Result<T> = kernel::error::Result<T, WireFormatError>;
+
+// TODO figure out how to use thiserror
+#[allow(unused_qualifications)]
+impl core::convert::From<serde_cbor::Error> for WireFormatError {
+    #[allow(deprecated)]
+    fn from(source: serde_cbor::Error) -> Self {
+        WireFormatError::CBORError(source)
+    }
+}
diff --git a/samples/rust/puzzle/types.rs b/samples/rust/puzzle/types.rs
new file mode 100644
index 000000000000..207e5c4f86fa
--- /dev/null
+++ b/samples/rust/puzzle/types.rs
@@ -0,0 +1,304 @@
+use crate::puzzle::error::WireFormatError;
+use alloc::boxed::Box;
+use alloc::vec::Vec;
+use core::mem::size_of;
+use serde::de::Error as SerdeError;
+use serde::de::Visitor;
+use serde::{Deserialize, Deserializer};
+use serde_derive::Deserialize;
+mod cbor_helpers;
+use crate::puzzle::error::Result;
+pub(crate) use cbor_helpers::cbor_size_of_list_header;
+
+#[derive(Deserialize, Debug)]
+pub(crate) struct InodeAdditional {
+    #[allow(dead_code)]
+    pub(crate) xattrs: Vec<Xattr>,
+    #[allow(dead_code)]
+    pub(crate) symlink_target: Option<Vec<u8>>,
+}
+
+#[derive(Deserialize, Debug)]
+pub(crate) struct Xattr {
+    #[allow(dead_code)]
+    pub(crate) key: Vec<u8>,
+    #[allow(dead_code)]
+    pub(crate) val: Vec<u8>,
+}
+
+pub(crate) struct MetadataBlob {
+    mmapped_region: Box<[u8]>,
+    inode_count: usize,
+}
+
+fn read_one_from_slice<'a, T: Deserialize<'a>>(bytes: &'a [u8]) -> Result<T> {
+    // serde complains when we leave extra bytes on the wire, which we often want to do. as a
+    // hack, we create a streaming deserializer for the type we're about to read, and then only
+    // read one value.
+    let mut iter = serde_cbor::Deserializer::from_slice(bytes).into_iter::<T>();
+    let v = iter.next().transpose()?;
+    v.ok_or(WireFormatError::ValueMissing)
+}
+
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum BlobRefKind {
+    Local,
+    Other { digest: [u8; 32] },
+}
+
+const BLOB_REF_SIZE: usize = 1 /* mode */ + 32 /* digest */ + 8 /* offset */;
+
+// TODO: should this be an ociv1 digest and include size and media type?
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) struct BlobRef {
+    pub(crate) offset: u64,
+    pub(crate) kind: BlobRefKind,
+    pub(crate) compressed: bool,
+}
+
+const COMPRESSED_BIT: u8 = 1 << 7;
+
+impl BlobRef {
+    fn fixed_length_deserialize<E: SerdeError>(
+        state: &[u8; BLOB_REF_SIZE],
+    ) -> kernel::error::Result<BlobRef, E> {
+        let offset = u64::from_le_bytes(state[0..8].try_into().unwrap());
+
+        let compressed = (state[8] & COMPRESSED_BIT) != 0;
+        let kind = match state[8] & !COMPRESSED_BIT {
+            0 => BlobRefKind::Local,
+            1 => BlobRefKind::Other {
+                digest: state[9..41].try_into().unwrap(),
+            },
+            _ => {
+                return Err(SerdeError::custom(format_args!(
+                    "bad blob ref kind {}",
+                    state[0]
+                )))
+            }
+        };
+
+        Ok(BlobRef {
+            offset,
+            kind,
+            compressed,
+        })
+    }
+}
+
+impl<'de> Deserialize<'de> for BlobRef {
+    fn deserialize<D>(deserializer: D) -> kernel::error::Result<BlobRef, D::Error>
+    where
+        D: Deserializer<'de>,
+    {
+        struct BlobRefVisitor;
+
+        impl<'de> Visitor<'de> for BlobRefVisitor {
+            type Value = BlobRef;
+
+            fn expecting(&self, formatter: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+                formatter.write_fmt(format_args!("expected {BLOB_REF_SIZE} bytes for BlobRef"))
+            }
+
+            fn visit_bytes<E>(self, v: &[u8]) -> kernel::error::Result<BlobRef, E>
+            where
+                E: SerdeError,
+            {
+                let state: [u8; BLOB_REF_SIZE] = v
+                    .try_into()
+                    .map_err(|_| SerdeError::invalid_length(v.len(), &self))?;
+                BlobRef::fixed_length_deserialize(&state)
+            }
+        }
+
+        deserializer.deserialize_bytes(BlobRefVisitor)
+    }
+}
+
+impl MetadataBlob {
+    pub(crate) fn seek_ref(&mut self, r: &BlobRef) -> Result<u64> {
+        match r.kind {
+            BlobRefKind::Other { .. } => Err(WireFormatError::SeekOtherError),
+            BlobRefKind::Local => Ok(r.offset),
+        }
+    }
+
+    pub(crate) fn read_file_chunks(&mut self, offset: u64) -> Result<Vec<FileChunk>> {
+        read_one_from_slice::<FileChunkList>(&self.mmapped_region[offset as usize..])
+            .map(|cl| cl.chunks)
+    }
+
+    pub(crate) fn read_dir_list(&mut self, offset: u64) -> Result<DirList> {
+        read_one_from_slice(&self.mmapped_region[offset as usize..])
+    }
+
+    pub(crate) fn read_inode_additional(&mut self, r: &BlobRef) -> Result<InodeAdditional> {
+        let offset = self.seek_ref(r)? as usize;
+        read_one_from_slice(&self.mmapped_region[offset..])
+    }
+
+    pub(crate) fn find_inode(&mut self, ino: Ino) -> Result<Option<Inode>> {
+        let mut left = 0;
+        let mut right = self.inode_count;
+
+        while left <= right {
+            let mid = left + (right - left) / 2;
+            let mid_offset = cbor_size_of_list_header(self.inode_count) + mid * INODE_WIRE_SIZE;
+            let i = read_one_from_slice::<Inode>(
+                &self.mmapped_region[mid_offset..mid_offset + INODE_WIRE_SIZE],
+            )?;
+            if i.ino == ino {
+                return Ok(Some(i));
+            }
+
+            if i.ino < ino {
+                left = mid + 1;
+            } else {
+                // don't underflow...
+                if mid == 0 {
+                    break;
+                }
+                right = mid - 1;
+            };
+        }
+
+        Ok(None)
+    }
+}
+
+#[derive(Deserialize, Debug)]
+pub(crate) struct DirEnt {
+    pub(crate) ino: Ino,
+    pub(crate) name: Vec<u8>,
+}
+
+#[derive(Deserialize, Debug)]
+pub(crate) struct DirList {
+    // TODO: flags instead?
+    #[allow(dead_code)]
+    pub(crate) look_below: bool,
+    pub(crate) entries: Vec<DirEnt>,
+}
+
+#[derive(Deserialize, Debug)]
+pub(crate) struct FileChunkList {
+    pub(crate) chunks: Vec<FileChunk>,
+}
+
+#[derive(Deserialize, Debug)]
+pub(crate) struct FileChunk {
+    pub(crate) blob: BlobRef,
+    pub(crate) len: u64,
+}
+
+const INODE_MODE_SIZE: usize = 1 /* mode */ + size_of::<u64>() * 2 /* major/minor/offset */;
+
+// InodeMode needs to have custom serialization because inodes must be a fixed size.
+#[derive(Debug, PartialEq, Eq)]
+pub(crate) enum InodeMode {
+    Unknown,
+    Fifo,
+    Chr { major: u64, minor: u64 },
+    Dir { offset: u64 },
+    Blk { major: u64, minor: u64 },
+    Reg { offset: u64 },
+    Lnk,
+    Sock,
+    Wht,
+}
+
+pub(crate) type Ino = u64;
+
+const INODE_SIZE: usize = size_of::<Ino>() + INODE_MODE_SIZE + 2 * size_of::<u32>() /* uid and gid */
++ size_of::<u16>() /* permissions */ + 1 /* Option<BlobRef> */ + BLOB_REF_SIZE;
+
+pub(crate) const INODE_WIRE_SIZE: usize = cbor_size_of_list_header(INODE_SIZE) + INODE_SIZE;
+
+#[derive(Debug, PartialEq, Eq)]
+pub(crate) struct Inode {
+    pub(crate) ino: Ino,
+    pub(crate) mode: InodeMode,
+    pub(crate) uid: u32,
+    pub(crate) gid: u32,
+    pub(crate) permissions: u16,
+    pub(crate) additional: Option<BlobRef>,
+}
+
+impl<'de> Deserialize<'de> for Inode {
+    fn deserialize<D>(deserializer: D) -> kernel::error::Result<Inode, D::Error>
+    where
+        D: Deserializer<'de>,
+    {
+        struct InodeVisitor;
+
+        impl<'de> Visitor<'de> for InodeVisitor {
+            type Value = Inode;
+
+            fn expecting(&self, formatter: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+                formatter.write_fmt(format_args!("expected {INODE_MODE_SIZE} bytes for Inode"))
+            }
+
+            fn visit_bytes<E>(self, v: &[u8]) -> kernel::error::Result<Inode, E>
+            where
+                E: SerdeError,
+            {
+                let state: [u8; INODE_SIZE] = v
+                    .try_into()
+                    .map_err(|_| SerdeError::invalid_length(v.len(), &self))?;
+
+                let mode = match state[8] {
+                    0 => InodeMode::Unknown,
+                    1 => InodeMode::Fifo,
+                    2 => {
+                        let major = u64::from_le_bytes(state[9..17].try_into().unwrap());
+                        let minor = u64::from_le_bytes(state[17..25].try_into().unwrap());
+                        InodeMode::Chr { major, minor }
+                    }
+                    4 => {
+                        let offset = u64::from_le_bytes(state[9..17].try_into().unwrap());
+                        InodeMode::Dir { offset }
+                    }
+                    6 => {
+                        let major = u64::from_le_bytes(state[9..17].try_into().unwrap());
+                        let minor = u64::from_le_bytes(state[17..25].try_into().unwrap());
+                        InodeMode::Blk { major, minor }
+                    }
+                    8 => {
+                        let offset = u64::from_le_bytes(state[9..17].try_into().unwrap());
+                        InodeMode::Reg { offset }
+                    }
+                    10 => InodeMode::Lnk,
+                    12 => InodeMode::Sock,
+                    14 => InodeMode::Wht,
+                    _ => {
+                        return Err(SerdeError::custom(format_args!(
+                            "bad inode mode value {}",
+                            state[8]
+                        )))
+                    }
+                };
+
+                let additional = if state[35] > 0 {
+                    Some(BlobRef::fixed_length_deserialize(
+                        state[36..36 + BLOB_REF_SIZE].try_into().unwrap(),
+                    )?)
+                } else {
+                    None
+                };
+
+                Ok(Inode {
+                    // ugh there must be a nicer way to do this with arrays, which we already have
+                    // from above...
+                    ino: u64::from_le_bytes(state[0..8].try_into().unwrap()),
+                    mode,
+                    uid: u32::from_le_bytes(state[25..29].try_into().unwrap()),
+                    gid: u32::from_le_bytes(state[29..33].try_into().unwrap()),
+                    permissions: u16::from_le_bytes(state[33..35].try_into().unwrap()),
+                    additional,
+                })
+            }
+        }
+
+        deserializer.deserialize_bytes(InodeVisitor)
+    }
+}
diff --git a/samples/rust/puzzle/types/cbor_helpers.rs b/samples/rust/puzzle/types/cbor_helpers.rs
new file mode 100644
index 000000000000..ae2aa4609428
--- /dev/null
+++ b/samples/rust/puzzle/types/cbor_helpers.rs
@@ -0,0 +1,9 @@
+pub(crate) const fn cbor_size_of_list_header(size: usize) -> usize {
+    match size {
+        0..=23 => 1,
+        24..=255 => 2,
+        256..=65535 => 3,
+        65536..=4294967295 => 4,
+        _ => 8,
+    }
+}
diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index e7ce5078bc99..b149af4e66ce 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -6,6 +6,8 @@
 use kernel::prelude::*;
 use kernel::{c_str, file, fs, io_buffer::IoBufferWriter};
 
+mod puzzle;
+
 module_fs! {
     type: PuzzleFs,
     name: "puzzlefs",
-- 
2.40.1

