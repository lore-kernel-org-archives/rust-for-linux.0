Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63147C3DA7D
	for <rust-for-linux@archiver.kernel.org>; Tue,  3 Jan 2023 21:03:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbjACVDy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 3 Jan 2023 16:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233962AbjACVDu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 3 Jan 2023 16:03:50 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65131570A
        for <rust-for-linux@vger.kernel.org>; Tue,  3 Jan 2023 13:03:48 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id m6so37038712lfj.11
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Jan 2023 13:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uLm3t/jCqRftzsa84IaoMU3qGif9izgFkANoIkgXLPc=;
        b=OcuCYgQUww5GfX0e0IZL5QWpsTB0x00GASHPJ3+pj3WTY/eCH6xO6CLaANMpqWlwAk
         /12qA6oLKv8yCcxMIL+cT7XD4p9zsadvm0cUxibN6YZY/sw3IQQj/zA7ZlUTk8f2xjLg
         qwrv9qHZWN+UvbYwtxVYzXrCecPkyiTgKYHXblhbbkfNp9TBQzZolpR7cXmpgceMOJvs
         2aI/JCMVS0vvk0ToOOa3Ck+8nIwrUv9jcZbYZaD9Ys1/RkBA49zDZWBV/fOeFMubXPFF
         WsZI3BHJz5afblT8rXrQFN0fDjHHu3uFvIuOQ9RLVJ3+E4bxlm0x+yrvAZD297fX1gS8
         vMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLm3t/jCqRftzsa84IaoMU3qGif9izgFkANoIkgXLPc=;
        b=3X1EAFVV+VLDn4fTKG27vaozjpsj64Kek7w1TMF2YG0+vYWwZWYYu14KVMuuIy75w2
         rWlqOu+TEQDHsRAXFoncO4XyOYA62DjpIQQfU7THbs3xDwyBzv8M7NpnuC02lbbMAxLA
         niP6/MMOmNRdi6X5pidrOr1u8YDWxR46stugj2FRA8HqGedYbJgDlYuz9EvXU1PYS8c8
         LHVHVuMY1IX8WMwpf+/JjAPWMdT+Z0iliAsNh5Mg7RCmAUkqoMmrWugTVRkNj3klw0lA
         LLQy0dzotxX1n48mGSuUQv2kw+1aIs9ACbFSrarX3cuZa3xrHS24yr5iZiPHURoQw+Ly
         gjhw==
X-Gm-Message-State: AFqh2koiUeIdTZpdIicxGYaSU9iV3IQHT9CXUx52E6g4dVavYk/D0j30
        hjH4orgm/esERsgyAtdi46M=
X-Google-Smtp-Source: AMrXdXsJCRKXND1KPN9exNrwAugySlYadsaNeGtvKH53FskpiaYhR7c/i1BGkQNsU6fcVeyF9Srujw==
X-Received: by 2002:a05:6512:2356:b0:4b5:6417:43bb with SMTP id p22-20020a056512235600b004b5641743bbmr16409474lfu.51.1672779827038;
        Tue, 03 Jan 2023 13:03:47 -0800 (PST)
Received: from localhost.localdomain ([46.147.136.10])
        by smtp.gmail.com with ESMTPSA id d18-20020ac241d2000000b004b4cbc942a3sm4936735lfi.127.2023.01.03.13.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 13:03:46 -0800 (PST)
From:   alexpantyukhin <apantykhin@gmail.com>
To:     ojeda@kernel.org, rust-for-linux@vger.kernel.org,
        akpm@linux-foundation.org
Cc:     alexpantyukhin <apantykhin@gmail.com>
Subject: [PATCH] scripts: store Makefiles in dictionary
Date:   Wed,  4 Jan 2023 02:02:19 +0500
Message-Id: <20230103210219.5690-1-apantykhin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Signed-off-by: alexpantyukhin <apantykhin@gmail.com>
---
 Store Makefiles by paths in dictionary and use these if required again

 scripts/generate_rust_analyzer.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index ecc7ea9a4dcf..9fafa0397e8b 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -98,13 +98,19 @@ def generate_crates(srctree, objtree, sysroot_src):
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
+    makefiles_path_content = {}
     for folder in ("samples", "drivers"):
         for path in (srctree / folder).rglob("*.rs"):
             logging.info("Checking %s", path)
             name = path.name.replace(".rs", "")
 
             # Skip those that are not crate roots.
-            if f"{name}.o" not in open(path.parent / "Makefile").read():
+            makefile_path = path.parent / "Makefile"
+            if makefile_path not in makefiles_path_content:
+                with open(makefile_path) as makefile:
+                    makefiles_path_content[makefile_path] = makefile.read()
+
+            if f"{name}.o" not in makefiles_path_content[makefile_path]:
                 continue
 
             logging.info("Adding %s", name)
-- 
2.25.1

