Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13DAC77B7C
	for <rust-for-linux@archiver.kernel.org>; Sat, 20 May 2023 23:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjETXRK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 20 May 2023 19:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjETXRJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 20 May 2023 19:17:09 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE3C115
        for <rust-for-linux@vger.kernel.org>; Sat, 20 May 2023 16:17:08 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-199fd7b5789so3439524fac.2
        for <rust-for-linux@vger.kernel.org>; Sat, 20 May 2023 16:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684624627; x=1687216627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=skE8dDlqyTXnm41TPm2FoL1VY9nxvPTXfK3RbRQ3xjw=;
        b=i4HeIEFu8Ml8t2jtyrMFR6q+Vz65XnuD5bqpi7HbJ9voUsgXm+yGDh9S0UvSdW/X0I
         4+uJMYszyKhWyfyprZSV/aioi+NO3ScWjLHXn3A8dLVcvxh/+VtlDqlqFNM7Mji6c07o
         +HzgfOhCwxHdtWsQCdv6+0sd+zCl0L6ilhgzgoZMKmmxASjBfkK3SXf3hIX/UXQdFgQC
         i3N9o334bopdVtEThayOW+yPBjGN94HfPPtW6Fv43KIz7XQP9PW79xkYag1Sfm9oDxrG
         pcMuR4qLlH+ozyIr0yo7fQkOR4Yx9W7S3BrhBh4asi49tb02/AwRYuLLdEAupRfAM873
         lRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684624627; x=1687216627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skE8dDlqyTXnm41TPm2FoL1VY9nxvPTXfK3RbRQ3xjw=;
        b=RIs2SfrAQLglUSQXuWo6RsjyO0JmYFy7EXcmq97LMz9eXLjaN6tniNtnvR6SDwI6Ng
         bXyLie7Ly0mUcyT/XQi3WMoIKKYB/W4Pq379uyiV4WH9WCrdhBYv1P2EBuq18eyh1QH0
         pbI4P3d17EE22NWoqF0t9gazSNgq20hIc8T5E0p3MyfqTQnEQS1gfGeT3PG1Fws5kI/B
         jWofvr+l5quBCLKVZg+HzoYH34PRgIJqfPzKWLK6OtAjw198M1igzzPlmai21/Yp/o5H
         pWP0c3gQxLNrGykjoAFC3qbGLlVaFm7zR/cbULqhpluYDdEOpwuqlqg+FOEusRFQPhQT
         +vGQ==
X-Gm-Message-State: AC+VfDycvJ0KH+fED3M4EUYHeSdAnLmGrgZa2CKuG8fi5x2FHYgcdbCp
        y0PxGJ8dVZaCJ6oHjqVGnKeHaMjSHuo=
X-Google-Smtp-Source: ACHHUZ6vDg4CufGchw5hphXhES7ogogeWe16LWyfMiEqxHhPhOY3YCblHwPT0zYxzv7cqYvFvOt0Yg==
X-Received: by 2002:a05:6870:7f82:b0:187:b836:4d33 with SMTP id aw2-20020a0568707f8200b00187b8364d33mr3436334oac.30.1684624626842;
        Sat, 20 May 2023 16:17:06 -0700 (PDT)
Received: from tx3000mach.io (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id v11-20020a056870954b00b00195e943f958sm984811oal.1.2023.05.20.16.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 16:17:06 -0700 (PDT)
From:   Martin Rodriguez Reboredo <yakoyoku@gmail.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
Subject: [PATCH v2] scripts: read cfgs from Makefile for rust-analyzer
Date:   Sat, 20 May 2023 20:17:01 -0300
Message-Id: <20230520231701.46008-1-yakoyoku@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Both `core` and `alloc` had their `cfgs` missing in `rust-project.json`,
to remedy this `generate_rust_analyzer.py` scans the Makefile from
inside the `rust` directory for them to be added to a dictionary that
each key corresponds to a crate and each value, to an array of `cfgs`.

Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
---
v1 -> v2:
- Read values from command line arguments

 rust/Makefile                     |  4 +++-
 scripts/generate_rust_analyzer.py | 16 ++++++++++++++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 7c9d9f11aec5..6234f5b70aee 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -373,7 +373,9 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
 
 rust-analyzer:
-	$(Q)$(srctree)/scripts/generate_rust_analyzer.py $(srctree) $(objtree) \
+	$(Q)$(srctree)/scripts/generate_rust_analyzer.py \
+		--cfgs='core=$(core-cfgs)' --cfgs='alloc=$(alloc-cfgs)' \
+		$(srctree) $(objtree) \
 		$(RUST_LIB_SRC) > $(objtree)/rust-project.json
 
 redirect-intrinsics = \
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 946e250c1b2a..5a850f055609 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -9,7 +9,15 @@ import logging
 import pathlib
 import sys
 
-def generate_crates(srctree, objtree, sysroot_src):
+def args_crates_cfgs(cfgs):
+    crates_cfgs = {}
+    for cfg in cfgs:
+        crate, vals = cfg.split("=", 1)
+        crates_cfgs[crate] = vals.replace("--cfg", "").split()
+
+    return crates_cfgs
+
+def generate_crates(srctree, objtree, sysroot_src, cfgs):
     # Generate the configuration list.
     cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
@@ -23,6 +31,7 @@ def generate_crates(srctree, objtree, sysroot_src):
     # Avoid O(n^2) iterations by keeping a map of indexes.
     crates = []
     crates_indexes = {}
+    crates_cfgs = args_crates_cfgs(cfgs)
 
     def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False):
         crates_indexes[display_name] = len(crates)
@@ -44,6 +53,7 @@ def generate_crates(srctree, objtree, sysroot_src):
         "core",
         sysroot_src / "core" / "src" / "lib.rs",
         [],
+        cfg=crates_cfgs.get("core", []),
         is_workspace_member=False,
     )
 
@@ -57,6 +67,7 @@ def generate_crates(srctree, objtree, sysroot_src):
         "alloc",
         srctree / "rust" / "alloc" / "lib.rs",
         ["core", "compiler_builtins"],
+        cfg=crates_cfgs.get("alloc", []),
     )
 
     append_crate(
@@ -123,6 +134,7 @@ def generate_crates(srctree, objtree, sysroot_src):
 def main():
     parser = argparse.ArgumentParser()
     parser.add_argument('--verbose', '-v', action='store_true')
+    parser.add_argument('--cfgs', action='append', default=[])
     parser.add_argument("srctree", type=pathlib.Path)
     parser.add_argument("objtree", type=pathlib.Path)
     parser.add_argument("sysroot_src", type=pathlib.Path)
@@ -134,7 +146,7 @@ def main():
     )
 
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src),
+        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.cfgs),
         "sysroot_src": str(args.sysroot_src),
     }
 
-- 
2.40.1

