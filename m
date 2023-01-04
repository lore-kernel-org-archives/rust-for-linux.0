Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4E2C4332F
	for <rust-for-linux@archiver.kernel.org>; Wed,  4 Jan 2023 16:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbjADQE0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 4 Jan 2023 11:04:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235098AbjADQEZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 4 Jan 2023 11:04:25 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12653B8
        for <rust-for-linux@vger.kernel.org>; Wed,  4 Jan 2023 08:04:24 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id cf42so51011813lfb.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Jan 2023 08:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MmC+ZbDya8QoO/TlDYYV14GeX1CKoMQHOrRplDb0a1g=;
        b=H+TbBy7udMxm1ctQiB2zg9UskWUpYcDaC8Tf2LHbzULaeBQ1Nw+bOR2beOM/ji6sQF
         kN8oMMa4/aYOeBR/Q1KixC7Jm04aeFqqDmqSCuBabzRuxx4i2QnPP3ljBgejci4YpjbN
         5sIzYT3Ri08ALMHkFHxynQ9wIY2m2A/U9dd/EkeRLnsaXLqZMbssQujcMd9Re3UrK6gy
         COlbx7yeZHTJ+vzuSouC97Yi+PKg/dSI1UNBcAHG1xXePOWvqeGn+Pjnst+AaFc65fuV
         nxbnHpzxvSqEMFp08OaiA2PApmoDRZurTIPccdIx+GeLv6JNx/faxZYYDLY8h1Z4uIL+
         kkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmC+ZbDya8QoO/TlDYYV14GeX1CKoMQHOrRplDb0a1g=;
        b=Xhd7W//GoAAT4Di8qA1Bhf+6wLYwxKpisw1SxoMEAq3tDOuVAfTJLqH82B/F2jqEGO
         m4JLMGWqvHFV5o6Uke2t3VnUWpxvwvXUPwaXCuLqmNBLO1dsdUbBKqX1oP4NymgsQcbB
         07wn1IpNtvT9GshghXClWqn0jkqWMspneCjylumqWj5aPG6VfM+XWzRPPQw/ZRVJYMbc
         BXOh8BNotPPkd3tIoamtLPHDf0disb3H3bMHucww8EmjDWR077eC/qhGlJRz9t77tE3a
         W/v1HrzT4hC0chC+psH55rO6T+UHzbeBScvNpxX7U5kJ0a+p2GgjNOmjphj865zyR/Kd
         cW3Q==
X-Gm-Message-State: AFqh2kpuZwRKPMB44lARuJs6xzvKAx5U3XSuu3ksmTdBf2fdz8/Tb/9z
        V4XVd9e5KQ6kvA0KUfAKaa3i9CWASyl0Ex0o
X-Google-Smtp-Source: AMrXdXvbYoVYPaOcpxoTXO1aETCGKcXdv+kCBqI0rvLlkwPftkik59ED+qVG4Y20SEWfmDIJ17uf3g==
X-Received: by 2002:a05:6512:20d0:b0:4b5:88e4:2ba4 with SMTP id u16-20020a05651220d000b004b588e42ba4mr11849390lfr.15.1672848262952;
        Wed, 04 Jan 2023 08:04:22 -0800 (PST)
Received: from localhost.localdomain ([46.147.136.10])
        by smtp.gmail.com with ESMTPSA id t28-20020a2e8e7c000000b0027feb966523sm841335ljk.140.2023.01.04.08.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 08:04:22 -0800 (PST)
From:   Alexander Pantyukhin <apantykhin@gmail.com>
To:     ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        akpm@linux-foundation.org
Cc:     alexpantyukhin <apantykhin@gmail.com>
Subject: [PATCH] scripts: avoid redundant re-reading makefiles. 
Date:   Wed,  4 Jan 2023 21:04:05 +0500
Message-Id: <20230104160405.5530-1-apantykhin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: alexpantyukhin <apantykhin@gmail.com>

The main goal of the patch is avoid redundant re-reading makefiles 
if these were read before. This is performance improvement.

Additional code improvements are using 'with' when read file and check
if file exists.

Signed-off-by: Alexander Pantyukhin <apantykhin@gmail.com>
---
 scripts/generate_rust_analyzer.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index ecc7ea9a4dcf..e949f32b8123 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -98,13 +98,25 @@ def generate_crates(srctree, objtree, sysroot_src):
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
+    makefile_path_content = {}
     for folder in ("samples", "drivers"):
         for path in (srctree / folder).rglob("*.rs"):
             logging.info("Checking %s", path)
             name = path.name.replace(".rs", "")
 
             # Skip those that are not crate roots.
-            if f"{name}.o" not in open(path.parent / "Makefile").read():
+            makefile_path = path.parent / "Makefile"
+
+            if makefile_path not in makefile_path_content:
+                if makefile_path.is_file():
+                    with open(makefile_path) as makefile:
+                        makefile_path_content[makefile_path] = makefile.read()
+
+                else:
+                    # If file is missing we consider it as empty-content file.
+                    makefile_path_content[makefile_path] = ""
+
+            if f"{name}.o" not in makefile_path_content[makefile_path]:
                 continue
 
             logging.info("Adding %s", name)
-- 
2.25.1

