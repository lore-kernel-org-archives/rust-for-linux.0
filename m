Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37D0C678D4
	for <rust-for-linux@archiver.kernel.org>; Tue,  7 Mar 2023 12:08:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbjCGMIG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 7 Mar 2023 07:08:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjCGMIF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 7 Mar 2023 07:08:05 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A7B38645
        for <rust-for-linux@vger.kernel.org>; Tue,  7 Mar 2023 04:08:03 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so10252500wms.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Mar 2023 04:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1678190882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N8+KuBNUOvMkQ5tG78D1gymPnKoB/geR+L27cmc6zCU=;
        b=JZiHCHIFrKxIz+YAYok47ojhjGpd5HwreP81Bh/lztS9vQDw3MXjwvGiui7nRTyoaQ
         PRCXJJ2z/aVQNYI+CoywYgwTyaUqJY1EX433/qaD0v6YMv0OzGDgneR3iiLpl3zWZltx
         S5EWYYG6935vjVpUmlqFRQwVVtx3wvWt+dXqrm50NxWKMSp5GKqKQtwjDA2Sbuc2aqyZ
         AO7mUNqW3+gBhC1eNajMLFKpMMW+TN1wNX9uruW+dxJrI+sTQ41XnkCgmmaDtxINXnE/
         4SWn6tOI3YOiJb8NRC3tKMAMgJH6khkfYce0wUmpT9PF0zqjG6DW9fzEJKwSSnQRN2XU
         bI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678190882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8+KuBNUOvMkQ5tG78D1gymPnKoB/geR+L27cmc6zCU=;
        b=kZbYGxVQhzDfterkNx3nGqjDXkVtb/ZaBVCINLIpgwUp5d+kj9ao4Cu7JtTBhtpLvK
         QAeMqN7hOda/iJTRhAw+jG5M39aN9yk0vgdL5Ax2KCXdO3391BVS4NdcEEK0xWnrui6E
         NjcWb0cF4GED82aLFM0c1HPSmerCt5QZoE66ThGx9Cg83ShkOrBElXvUfTg5+arxBfWD
         btmtgY9cVpRcvokOHWWGNzwru+xURdiovw6Obh7U75syzuW18tz0rrACQfOno9a4pDhC
         dOK9MQZ4rD9MSYMSKtd82++5/T2UzvaYjyoa2zoRy2/kx1O5XJDzwloQtyNdvIQunW88
         +Ncg==
X-Gm-Message-State: AO0yUKVP4K+NMimyF7WPwU4EignmHIFpgcYvT1eIt54v7eMnAScsiwb0
        f7z5hK8wMIbCad8RGCywggCKvKVMYMD+YagWMMk=
X-Google-Smtp-Source: AK7set+hqMq9rWHSQEMhQN2UPXAK02r9tnlaaJ7BbiWNYsYRBLpLGNjeQ7ZwOvU5GAKeikPMdf5DBw==
X-Received: by 2002:a05:600c:4688:b0:3eb:42fc:fb30 with SMTP id p8-20020a05600c468800b003eb42fcfb30mr12992036wmo.32.1678190882157;
        Tue, 07 Mar 2023 04:08:02 -0800 (PST)
Received: from localhost ([147.161.155.97])
        by smtp.gmail.com with ESMTPSA id v38-20020a05600c4da600b003eb68bb61c8sm12351014wmp.3.2023.03.07.04.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:08:01 -0800 (PST)
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     rust-for-linux@vger.kernel.org
Cc:     Andreas Hindborg <a.hindborg@samsung.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] scripts: rust-analyzer: Skip crate module directories
Date:   Tue,  7 Mar 2023 13:07:36 +0100
Message-Id: <20230307120736.75492-1-nmi@metaspace.dk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

When generating rust-analyzer configuration, skip module directories. This fixes
an issue that occur if we have

 - drivers/block/driver.rs
 - drivers/block/driver_mod/mod.rs

If `driver_mod` is a module of the crate `driver`, the directory `driver_mod`
may not contain `Makefile`, and `generate_rust_analyzer.py` will fail.

Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
---
 scripts/generate_rust_analyzer.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index ecc7ea9a4dcf..e8c643fb2488 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -104,7 +104,7 @@ def generate_crates(srctree, objtree, sysroot_src):
             name = path.name.replace(".rs", "")
 
             # Skip those that are not crate roots.
-            if f"{name}.o" not in open(path.parent / "Makefile").read():
+            if not (path.parent / "Makefile").is_file() or f"{name}.o" not in open(path.parent / "Makefile").read():
                 continue
 
             logging.info("Adding %s", name)

base-commit: 8c20eb7e6a27b2c493b0bbb435e75cae7135634f
-- 
2.39.2

