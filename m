Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD5FC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238512AbjFIGyf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238555AbjFIGyU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:20 -0400
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315B330C3
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3897; q=dns/txt; s=iport;
  t=1686293657; x=1687503257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TDTcM5VU1l630M3KUp8WaBoYrvraqPr86yo4vpu3XO4=;
  b=ROz7jCbFWNeQRBbF0L5djn542nNWmpkEUyWACXdOBGntbR/PmjZJTJ2X
   xyj1/e6LYdQOqE4pmCnkyM5OqRD+gqmDw0nPC1uI9Re6djZ+xVqAgBfgk
   t1VlyIAQsXf4QyObxoy4zlr6TPCfUmf3ExSRtADMAI0W5Nsv0+2aqN6+J
   4=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5220566"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:59 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIE9055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:59 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 75/80] samples: puzzlefs: add Rootfs and Digest structs to types.rs
Date:   Fri,  9 Jun 2023 09:31:13 +0300
Message-Id: <20230609063118.24852-76-amiculas@cisco.com>
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
 samples/rust/puzzle/types.rs | 75 ++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/samples/rust/puzzle/types.rs b/samples/rust/puzzle/types.rs
index c6b69b94fa6d..69d4f5dfa12c 100644
--- a/samples/rust/puzzle/types.rs
+++ b/samples/rust/puzzle/types.rs
@@ -8,7 +8,10 @@
 mod cbor_helpers;
 use crate::puzzle::error::Result;
 pub(crate) use cbor_helpers::{cbor_get_array_size, cbor_size_of_list_header};
+use core::fmt;
+use hex::{encode_hex_iter, FromHexError};
 use kernel::file;
+use kernel::str::CStr;
 
 #[derive(Deserialize, Debug)]
 pub(crate) struct InodeAdditional {
@@ -32,6 +35,8 @@ pub(crate) struct MetadataBlob {
     pub(crate) inode_count: usize,
 }
 
+pub(crate) const SHA256_BLOCK_SIZE: usize = 32;
+
 fn read_one_from_slice<'a, T: Deserialize<'a>>(bytes: &'a [u8]) -> Result<T> {
     // serde complains when we leave extra bytes on the wire, which we often want to do. as a
     // hack, we create a streaming deserializer for the type we're about to read, and then only
@@ -41,6 +46,23 @@ fn read_one_from_slice<'a, T: Deserialize<'a>>(bytes: &'a [u8]) -> Result<T> {
     v.ok_or(WireFormatError::ValueMissing)
 }
 
+#[derive(Deserialize, Debug)]
+pub(crate) struct Rootfs {
+    pub(crate) metadatas: Vec<BlobRef>,
+    // TODO: deserialize fs_verity_data, for the moment BTreeMap is not supported
+    #[allow(dead_code)]
+    pub(crate) fs_verity_data: (),
+    #[allow(dead_code)]
+    pub(crate) manifest_version: u64,
+}
+
+impl Rootfs {
+    pub(crate) fn open(file: file::RegularFile) -> Result<Rootfs> {
+        let buffer = file.read_to_end()?;
+        read_one_from_slice(&buffer)
+    }
+}
+
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum BlobRefKind {
     Local,
@@ -176,6 +198,59 @@ pub(crate) fn find_inode(&mut self, ino: Ino) -> Result<Option<Inode>> {
     }
 }
 
+#[derive(Debug, Clone, PartialEq, Eq)]
+pub(crate) struct Digest([u8; SHA256_BLOCK_SIZE]);
+
+impl Digest {
+    pub(crate) fn underlying(&self) -> [u8; SHA256_BLOCK_SIZE] {
+        let mut dest = [0_u8; SHA256_BLOCK_SIZE];
+        dest.copy_from_slice(&self.0);
+        dest
+    }
+}
+
+impl fmt::Display for Digest {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        let mut hex_string =
+            Vec::from_iter_fallible(encode_hex_iter(&self.underlying())).map_err(|_| fmt::Error)?;
+        // append NUL character
+        hex_string.try_push(0).map_err(|_| fmt::Error)?;
+        let hex_string = CStr::from_bytes_with_nul(&hex_string).map_err(|_| fmt::Error)?;
+        write!(f, "{}", hex_string)
+    }
+}
+
+impl TryFrom<&CStr> for Digest {
+    type Error = FromHexError;
+    fn try_from(s: &CStr) -> kernel::error::Result<Self, Self::Error> {
+        let digest = hex::decode(s)?;
+        let digest: [u8; SHA256_BLOCK_SIZE] = digest
+            .try_into()
+            .map_err(|_| FromHexError::InvalidStringLength)?;
+        Ok(Digest(digest))
+    }
+}
+
+impl TryFrom<BlobRef> for Digest {
+    type Error = WireFormatError;
+    fn try_from(v: BlobRef) -> kernel::error::Result<Self, Self::Error> {
+        match v.kind {
+            BlobRefKind::Other { digest } => Ok(Digest(digest)),
+            BlobRefKind::Local => Err(WireFormatError::LocalRefError),
+        }
+    }
+}
+
+impl TryFrom<&BlobRef> for Digest {
+    type Error = WireFormatError;
+    fn try_from(v: &BlobRef) -> kernel::error::Result<Self, Self::Error> {
+        match v.kind {
+            BlobRefKind::Other { digest } => Ok(Digest(digest)),
+            BlobRefKind::Local => Err(WireFormatError::LocalRefError),
+        }
+    }
+}
+
 #[derive(Deserialize, Debug)]
 pub(crate) struct DirEnt {
     pub(crate) ino: Ino,
-- 
2.40.1

