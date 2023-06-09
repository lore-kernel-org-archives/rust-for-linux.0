Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8444DC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjFIGzS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjFIGzR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:17 -0400
Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC8130C3
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1288; q=dns/txt; s=iport;
  t=1686293695; x=1687503295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PTJ9IW4yOonleU/B5OYbyGMAWLOX2XhRDjGWeCSdo7o=;
  b=M4JyWNEcBo+i/dHtT+6Y/8v/FbThYsZENqHSP7uHF1othTNWOAXPt3DK
   Ld2ENTWHBuBZJ7J8HBNs5Ju80BTWdVEuDxFSDW+uI3QBfAY978mSW4DlZ
   l56Xq2z7IO2hRnPZKhXJkYn8wimCk/1rpx+FehfbBcvV3KMYKPHVrAg4Z
   0=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5453681"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:51 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDf055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:51 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 47/80] samples: puzzlefs: rename RustFs to PuzzleFs
Date:   Fri,  9 Jun 2023 09:30:45 +0300
Message-Id: <20230609063118.24852-48-amiculas@cisco.com>
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
 samples/rust/puzzlefs.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index 51aa41533a35..e7ce5078bc99 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -7,16 +7,16 @@
 use kernel::{c_str, file, fs, io_buffer::IoBufferWriter};
 
 module_fs! {
-    type: RustFs,
+    type: PuzzleFs,
     name: "puzzlefs",
     author: "Ariel Miculas",
     license: "GPL",
 }
 
-struct RustFs;
+struct PuzzleFs;
 
 #[vtable]
-impl fs::Context<Self> for RustFs {
+impl fs::Context<Self> for PuzzleFs {
     type Data = ();
 
     kernel::define_fs_params! {(),
@@ -39,7 +39,7 @@ fn try_new() -> Result {
     }
 }
 
-impl fs::Type for RustFs {
+impl fs::Type for PuzzleFs {
     type Context = Self;
     type INodeData = &'static [u8];
     const SUPER_TYPE: fs::Super = fs::Super::Independent;
@@ -97,7 +97,7 @@ fn read(
         offset: u64,
     ) -> Result<usize> {
         file::read_from_slice(
-            file.inode::<RustFs>().ok_or(EINVAL)?.fs_data(),
+            file.inode::<PuzzleFs>().ok_or(EINVAL)?.fs_data(),
             writer,
             offset,
         )
-- 
2.40.1

