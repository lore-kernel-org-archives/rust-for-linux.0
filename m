Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F89AC7EE2F
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238518AbjFIG4d (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237480AbjFIG4T (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:19 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDA03596
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4334; q=dns/txt; s=iport;
  t=1686293750; x=1687503350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3u76x2LZDFGr+ztxzrHaBol/FgJ1zj9loLRU0dzEF/Q=;
  b=XisfilKLa2i4165xg9xlqsNqNji1++9cpIXQHBzbMXXe/1MeEZuaIdgS
   N70ZNYKbpRHpET8o4BOeE8ar/jmOEdX0d1vEJiV9qMtiBs+slbSQHzGjx
   9n+4A9lcfLwc9WL+AMUSMp8nk+yNtw+WJCkeusMV1qbdWyHIIuPe3gwIs
   8=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453688"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:32:01 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIEE055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:32:00 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 80/80] rust: puzzlefs: add oci_root_dir and image_manifest filesystem parameters
Date:   Fri,  9 Jun 2023 09:31:18 +0300
Message-Id: <20230609063118.24852-81-amiculas@cisco.com>
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

These parameters are passed when mounting puzzlefs using '-o' option of
mount:
-o oci_root_dir="/path/to/oci/dir"
-o image_manifest="root_hash_of_image_manifest"

For a particular manifest in the manifests array in index.json (located
in the oci_root_dir), the root hash of the image manifest is found in
the digest field.

It would be nicer if we could pass the tag, but we don't support json
deserialization.

Example of mount:
mount -t puzzlefs -o oci_root_dir="/home/puzzlefs_oci" -o \
image_manifest="2d6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcffdcae901b" \
none /mnt

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 samples/rust/puzzlefs.rs | 63 ++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index 897a996a6ab3..fbd091d9d00d 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -7,6 +7,7 @@
 use kernel::{
     c_str, file, fs,
     io_buffer::IoBufferWriter,
+    str::CString,
     sync::{Arc, ArcBorrow},
 };
 
@@ -29,27 +30,29 @@ struct PuzzlefsInfo {
     puzzlefs: Arc<PuzzleFS>,
 }
 
+#[derive(Default)]
+struct PuzzleFsParams {
+    oci_root_dir: Option<CString>,
+    image_manifest: Option<CString>,
+}
+
 #[vtable]
 impl fs::Context<Self> for PuzzleFsModule {
-    type Data = ();
-
-    kernel::define_fs_params! {(),
-        {flag, "flag", |_, v| { pr_info!("flag passed-in: {v}\n"); Ok(()) } },
-        {flag_no, "flagno", |_, v| { pr_info!("flagno passed-in: {v}\n"); Ok(()) } },
-        {bool, "bool", |_, v| { pr_info!("bool passed-in: {v}\n"); Ok(()) } },
-        {u32, "u32", |_, v| { pr_info!("u32 passed-in: {v}\n"); Ok(()) } },
-        {u32oct, "u32oct", |_, v| { pr_info!("u32oct passed-in: {v}\n"); Ok(()) } },
-        {u32hex, "u32hex", |_, v| { pr_info!("u32hex passed-in: {v}\n"); Ok(()) } },
-        {s32, "s32", |_, v| { pr_info!("s32 passed-in: {v}\n"); Ok(()) } },
-        {u64, "u64", |_, v| { pr_info!("u64 passed-in: {v}\n"); Ok(()) } },
-        {string, "string", |_, v| { pr_info!("string passed-in: {v}\n"); Ok(()) } },
-        {enum, "enum", [("first", 10), ("second", 20)], |_, v| {
-            pr_info!("enum passed-in: {v}\n"); Ok(()) }
-        },
+    type Data = Box<PuzzleFsParams>;
+
+    kernel::define_fs_params! {Box<PuzzleFsParams>,
+        {string, "oci_root_dir", |s, v| {
+                                      s.oci_root_dir = Some(CString::try_from_fmt(format_args!("{v}"))?);
+                                      Ok(())
+                                  }},
+        {string, "image_manifest", |s, v| {
+                                      s.image_manifest = Some(CString::try_from_fmt(format_args!("{v}"))?);
+                                      Ok(())
+                                  }},
     }
 
-    fn try_new() -> Result {
-        Ok(())
+    fn try_new() -> Result<Self::Data> {
+        Ok(Box::try_new(PuzzleFsParams::default())?)
     }
 }
 
@@ -134,11 +137,27 @@ impl fs::Type for PuzzleFsModule {
     const FLAGS: i32 = fs::flags::USERNS_MOUNT;
     const DCACHE_BASED: bool = true;
 
-    fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
-        let puzzlefs = PuzzleFS::open(
-            c_str!("/home/puzzlefs_oci"),
-            c_str!("2d6602d678140540dc7e96de652a76a8b16e8aca190bae141297bcffdcae901b"),
-        );
+    fn fill_super(
+        data: Box<PuzzleFsParams>,
+        sb: fs::NewSuperBlock<'_, Self>,
+    ) -> Result<&fs::SuperBlock<Self>> {
+        let oci_root_dir = match data.oci_root_dir {
+            Some(val) => val,
+            None => {
+                pr_err!("missing oci_root_dir parameter!\n");
+                return Err(ENOTSUPP);
+            }
+        };
+
+        let image_manifest = match data.image_manifest {
+            Some(val) => val,
+            None => {
+                pr_err!("missing image_manifest parameter!\n");
+                return Err(ENOTSUPP);
+            }
+        };
+
+        let puzzlefs = PuzzleFS::open(&oci_root_dir, &image_manifest);
 
         if let Err(ref e) = puzzlefs {
             pr_info!("error opening puzzlefs {e}\n");
-- 
2.40.1

