Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6664C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238643AbjFIG4a (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238146AbjFIG4O (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:14 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C936930D2
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2138; q=dns/txt; s=iport;
  t=1686293744; x=1687503344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hwurEKpNGatA8KUDa0hGT7k5vW5qxChPviMaImA0hH4=;
  b=WtsQdLqQt4N+UN82SN4ORshMCbLK+L+3l7YvzPO06qlSonWmJG+RNkzt
   5mRyYRuuWYJsXLOyYspjEB8UxpP68R+0i1T+ExN8g2ioejQ9Pry52jvth
   g7XsWECwPrsAMXSSYBx3gg8XotWdoTDmm7IWaGdGwsunAC3CmHtAv/ggZ
   Y=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279104"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:32:00 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIEC055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:32:00 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 78/80] rust: puzzlefs: rename PuzzleFs to PuzzleFsModule to avoid confusion with the PuzzleFS struct
Date:   Fri,  9 Jun 2023 09:31:16 +0300
Message-Id: <20230609063118.24852-79-amiculas@cisco.com>
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
 samples/rust/puzzlefs.rs | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
index d74e034538eb..f04a2e5bcb04 100644
--- a/samples/rust/puzzlefs.rs
+++ b/samples/rust/puzzlefs.rs
@@ -17,13 +17,13 @@
 use kernel::fs::{DEntry, INodeParams, NeedsRoot, NewSuperBlock, RootDEntry};
 
 module_fs! {
-    type: PuzzleFs,
+    type: PuzzleFsModule,
     name: "puzzlefs",
     author: "Ariel Miculas",
     license: "GPL",
 }
 
-struct PuzzleFs;
+struct PuzzleFsModule;
 
 #[derive(Debug)]
 struct PuzzlefsInfo {
@@ -31,7 +31,7 @@ struct PuzzlefsInfo {
 }
 
 #[vtable]
-impl fs::Context<Self> for PuzzleFs {
+impl fs::Context<Self> for PuzzleFsModule {
     type Data = ();
 
     kernel::define_fs_params! {(),
@@ -55,9 +55,9 @@ fn try_new() -> Result {
 }
 
 fn puzzlefs_populate_dir(
-    sb: &NewSuperBlock<'_, PuzzleFs, NeedsRoot>,
+    sb: &NewSuperBlock<'_, PuzzleFsModule, NeedsRoot>,
     pfs: &mut PuzzleFS,
-    parent: &DEntry<PuzzleFs>,
+    parent: &DEntry<PuzzleFsModule>,
     ino: u64,
     name: &CStr,
     recursion: usize,
@@ -110,10 +110,10 @@ fn puzzlefs_populate_dir(
 
 /// Creates a new root dentry populated with the given entries.
 fn try_new_populated_root_puzzlefs_dentry(
-    sb: &NewSuperBlock<'_, PuzzleFs, NeedsRoot>,
+    sb: &NewSuperBlock<'_, PuzzleFsModule, NeedsRoot>,
     pfs: &mut PuzzleFS,
-    root_value: <PuzzleFs as fs::Type>::INodeData,
-) -> Result<RootDEntry<PuzzleFs>> {
+    root_value: <PuzzleFsModule as fs::Type>::INodeData,
+) -> Result<RootDEntry<PuzzleFsModule>> {
     let root_inode = sb.sb.try_new_dcache_dir_inode(INodeParams {
         mode: 0o755,
         ino: root_value.inode.ino,
@@ -125,7 +125,7 @@ fn try_new_populated_root_puzzlefs_dentry(
     Ok(root)
 }
 
-impl fs::Type for PuzzleFs {
+impl fs::Type for PuzzleFsModule {
     type Context = Self;
     // this is Arc so it can be cloned in puzzlefs_populate_dir
     type INodeData = Arc<Inode>;
-- 
2.40.1

