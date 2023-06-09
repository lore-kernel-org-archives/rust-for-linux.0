Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEA1C7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjFIGyM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjFIGyJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:09 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89FF42D71
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1852; q=dns/txt; s=iport;
  t=1686293647; x=1687503247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=75vJrYKrBaGohs8AVI4mXEgs8Hy1NmimO92w6Mqalrc=;
  b=TcfDkezGUmP71Y4Wg3QOofeXW/+RUNLHFSM5pOucVsLl++vAZV2KMksd
   pbSgopJQjPxAvCecInWWDS6VqF80IgMgurZnxrMc0DGwOjqLyqAvt6ijP
   lfz/4bj5F6LGTt7sLdtkxtag6oVRt+D8GcxdK/HnwfwLOZAPLbSK98kW/
   A=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="8508934"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:55 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDs055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:55 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 60/80] samples: puzzlefs: implement new for MetadataBlob
Date:   Fri,  9 Jun 2023 09:30:58 +0300
Message-Id: <20230609063118.24852-61-amiculas@cisco.com>
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
 samples/rust/puzzle/types.rs | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/samples/rust/puzzle/types.rs b/samples/rust/puzzle/types.rs
index 207e5c4f86fa..c6b69b94fa6d 100644
--- a/samples/rust/puzzle/types.rs
+++ b/samples/rust/puzzle/types.rs
@@ -1,5 +1,4 @@
 use crate::puzzle::error::WireFormatError;
-use alloc::boxed::Box;
 use alloc::vec::Vec;
 use core::mem::size_of;
 use serde::de::Error as SerdeError;
@@ -8,7 +7,8 @@
 use serde_derive::Deserialize;
 mod cbor_helpers;
 use crate::puzzle::error::Result;
-pub(crate) use cbor_helpers::cbor_size_of_list_header;
+pub(crate) use cbor_helpers::{cbor_get_array_size, cbor_size_of_list_header};
+use kernel::file;
 
 #[derive(Deserialize, Debug)]
 pub(crate) struct InodeAdditional {
@@ -26,9 +26,10 @@ pub(crate) struct Xattr {
     pub(crate) val: Vec<u8>,
 }
 
+#[derive(Debug)]
 pub(crate) struct MetadataBlob {
-    mmapped_region: Box<[u8]>,
-    inode_count: usize,
+    pub(crate) mmapped_region: Vec<u8>,
+    pub(crate) inode_count: usize,
 }
 
 fn read_one_from_slice<'a, T: Deserialize<'a>>(bytes: &'a [u8]) -> Result<T> {
@@ -116,6 +117,15 @@ fn visit_bytes<E>(self, v: &[u8]) -> kernel::error::Result<BlobRef, E>
 }
 
 impl MetadataBlob {
+    pub(crate) fn new(mut f: file::RegularFile) -> Result<MetadataBlob> {
+        let inodes_count = cbor_get_array_size(&mut f)? as usize;
+        let mmapped_region = f.read_to_end()?;
+        Ok(MetadataBlob {
+            mmapped_region,
+            inode_count: inodes_count,
+        })
+    }
+
     pub(crate) fn seek_ref(&mut self, r: &BlobRef) -> Result<u64> {
         match r.kind {
             BlobRefKind::Other { .. } => Err(WireFormatError::SeekOtherError),
-- 
2.40.1

