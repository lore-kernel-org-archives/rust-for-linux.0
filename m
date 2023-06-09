Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704BCC7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238570AbjFIGyi (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237614AbjFIGy2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:28 -0400
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9C32D74
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4925; q=dns/txt; s=iport;
  t=1686293660; x=1687503260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VEdKLcNeiY9ISIMaY0jyZvRm10XwuxKvxWZkUJN4Zd4=;
  b=Uo+0EK548mJMbcnDB/rSts2jNnVqWJvGFSL3MgIIgYXP703h0cMeNJAp
   3IErY2gbps85FpZlEFwwpaYoXXU/ve72A52AikfV/3C/u6BRpAlbo58yF
   Ui/JNO3LO/IyiwqqbvCivd1hwpnZusQq7Jk05yunwNuIah8yVxqCvugVm
   Q=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5220557"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:42 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDD055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:41 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 19/80] samples: puzzlefs: add initial puzzlefs sample, copied from rust_fs.rs
Date:   Fri,  9 Jun 2023 09:30:17 +0300
Message-Id: <20230609063118.24852-20-amiculas@cisco.com>
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
 samples/rust/Kconfig     |  10 ++++
 samples/rust/Makefile    |   1 +
 samples/rust/puzzlefs.rs | 105 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)
 create mode 100644 samples/rust/puzzlefs.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index 2bd736f99189..05ca21fbba06 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -40,6 +40,16 @@ config SAMPLE_RUST_FS
 
 	  If unsure, say N.
 
+config SAMPLE_PUZZLEFS
+	tristate "Puzzlefs file system"
+	help
+	  This option builds the Rust puzzlefs file system sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called puzzlefs.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index e5941037e673..364a38dbf90b 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -3,5 +3,6 @@
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
 obj-$(CONFIG_SAMPLE_RUST_FS)			+= rust_fs.o
+obj-$(CONFIG_SAMPLE_PUZZLEFS)			+= puzzlefs.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/puzzlefs.rs b/samples/rust/puzzlefs.rs
new file mode 100644
index 000000000000..51aa41533a35
--- /dev/null
+++ b/samples/rust/puzzlefs.rs
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust file system sample.
+
+use kernel::module_fs;
+use kernel::prelude::*;
+use kernel::{c_str, file, fs, io_buffer::IoBufferWriter};
+
+module_fs! {
+    type: RustFs,
+    name: "puzzlefs",
+    author: "Ariel Miculas",
+    license: "GPL",
+}
+
+struct RustFs;
+
+#[vtable]
+impl fs::Context<Self> for RustFs {
+    type Data = ();
+
+    kernel::define_fs_params! {(),
+        {flag, "flag", |_, v| { pr_info!("flag passed-in: {v}\n"); Ok(()) } },
+        {flag_no, "flagno", |_, v| { pr_info!("flagno passed-in: {v}\n"); Ok(()) } },
+        {bool, "bool", |_, v| { pr_info!("bool passed-in: {v}\n"); Ok(()) } },
+        {u32, "u32", |_, v| { pr_info!("u32 passed-in: {v}\n"); Ok(()) } },
+        {u32oct, "u32oct", |_, v| { pr_info!("u32oct passed-in: {v}\n"); Ok(()) } },
+        {u32hex, "u32hex", |_, v| { pr_info!("u32hex passed-in: {v}\n"); Ok(()) } },
+        {s32, "s32", |_, v| { pr_info!("s32 passed-in: {v}\n"); Ok(()) } },
+        {u64, "u64", |_, v| { pr_info!("u64 passed-in: {v}\n"); Ok(()) } },
+        {string, "string", |_, v| { pr_info!("string passed-in: {v}\n"); Ok(()) } },
+        {enum, "enum", [("first", 10), ("second", 20)], |_, v| {
+            pr_info!("enum passed-in: {v}\n"); Ok(()) }
+        },
+    }
+
+    fn try_new() -> Result {
+        Ok(())
+    }
+}
+
+impl fs::Type for RustFs {
+    type Context = Self;
+    type INodeData = &'static [u8];
+    const SUPER_TYPE: fs::Super = fs::Super::Independent;
+    const NAME: &'static CStr = c_str!("puzzlefs");
+    const FLAGS: i32 = fs::flags::USERNS_MOUNT;
+    const DCACHE_BASED: bool = true;
+
+    fn fill_super(_data: (), sb: fs::NewSuperBlock<'_, Self>) -> Result<&fs::SuperBlock<Self>> {
+        let sb = sb.init(
+            (),
+            &fs::SuperParams {
+                magic: 0x72757374,
+                ..fs::SuperParams::DEFAULT
+            },
+        )?;
+        let root = sb.try_new_populated_root_dentry(
+            &[],
+            kernel::fs_entries![
+                file("test1", 0o600, "abc\n".as_bytes(), FsFile),
+                file("test2", 0o600, "def\n".as_bytes(), FsFile),
+                char("test3", 0o600, [].as_slice(), (10, 125)),
+                sock("test4", 0o755, [].as_slice()),
+                fifo("test5", 0o755, [].as_slice()),
+                block("test6", 0o755, [].as_slice(), (1, 1)),
+                dir(
+                    "dir1",
+                    0o755,
+                    [].as_slice(),
+                    [
+                        file("test1", 0o600, "abc\n".as_bytes(), FsFile),
+                        file("test2", 0o600, "def\n".as_bytes(), FsFile),
+                    ]
+                ),
+            ],
+        )?;
+        let sb = sb.init_root(root)?;
+        Ok(sb)
+    }
+}
+
+struct FsFile;
+
+#[vtable]
+impl file::Operations for FsFile {
+    type OpenData = &'static [u8];
+
+    fn open(_context: &Self::OpenData, _file: &file::File) -> Result<Self::Data> {
+        Ok(())
+    }
+
+    fn read(
+        _data: (),
+        file: &file::File,
+        writer: &mut impl IoBufferWriter,
+        offset: u64,
+    ) -> Result<usize> {
+        file::read_from_slice(
+            file.inode::<RustFs>().ok_or(EINVAL)?.fs_data(),
+            writer,
+            offset,
+        )
+    }
+}
-- 
2.40.1

