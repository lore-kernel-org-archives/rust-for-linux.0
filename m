Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E24EB64DC
	for <rust-for-linux@archiver.kernel.org>; Tue, 11 Jul 2023 07:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjGKHTf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 11 Jul 2023 03:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGKHTe (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 11 Jul 2023 03:19:34 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FC6CE
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jul 2023 00:19:33 -0700 (PDT)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F37FC3F730
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jul 2023 07:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689059967;
        bh=xRON641Prwmt7A4t6EJBbCJmTtEWBykCSOV9am7HjQc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=WdKwM6xsxFi9H5rh6ZyY2kDVdPTj6u6njS3PSC84kHE38UIt4dWwJ9zyzKKXz1sfL
         wCySuZh4zxr9d2EdxSt8LCySNZ1Xv2Fo/IKjMqhu1KiRlyhPtTWb1MKHNQORsTvAZO
         wfYZKPJyYrigZIZvinQkSHXfoT4hOarqFYo6MyuOBDmt/9hBmzhiKr5LifwgqkwTZg
         4/g/o54zhcb39e9qJ2kRbc5THpH8axlDo50NSEWJwz0gz7m4P1NvkobgHue8lobgs3
         5e5DE2V1REIxAOhfXmC2pipVURT4yNUSpYhhw1YPfcx2MClWfK2N1HTVmHzfni280k
         65bvV/VKcVzlQ==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-98df34aa83aso750111766b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jul 2023 00:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689059967; x=1691651967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRON641Prwmt7A4t6EJBbCJmTtEWBykCSOV9am7HjQc=;
        b=bJ958Q1DMHS21PYeWd/cBQ5zMevPr4pa6x4PsMoRT7TwvdBeLaSuWjslq8FP1RkR/P
         VH1azc7Y5LWsH6k8Me4fwh418zGpOZUvcTbysmPQcujALONiwQHgp9oD78kiCMGpOQ2I
         3sJNZEKlJ7vSvG/JkMqzLSYDKO7njcNTPjaGgThKri7m96HDEWtLu0hreTYe3u2HTX9o
         v2mLPl5akxgH6yP1qq4nx3yrZp8w3E3W/a82pJ0YUfY1p5MVCQApCdGpmBrG3bTMniQ6
         9d4bZlwroXEurtfLdnHsqELPuVHnVFx16oX7T+LNvTm5DMCdJiTN++Kd1kEdn2YHgrRG
         QGLA==
X-Gm-Message-State: ABy/qLY+CTEHF2ErwZ++0m68KqgX5TRvuapooiyjpZelNIJjfFzeWpOP
        D5ZCw1gfW31FeNZyTEAgZY2zXkr5atRGn0+o2+bxGgVfKPx1ZyTkRgFeGyNFzhkW0wV4RFn8F+h
        u3lM+ExALnhHj0MMNzQidH3WzfPS2Vq+wJmakyh2Hv6jyLf6xWO9jBhc=
X-Received: by 2002:a17:906:d9:b0:98e:2413:952f with SMTP id 25-20020a17090600d900b0098e2413952fmr19698189eji.18.1689059967618;
        Tue, 11 Jul 2023 00:19:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEli/fbeO4KxeIb+IfmtYxn8L0PBBNzCKXxRW4pUu5B2IKJhDL6R2vAN22+FLEOOlntd+n4IQ==
X-Received: by 2002:a17:906:d9:b0:98e:2413:952f with SMTP id 25-20020a17090600d900b0098e2413952fmr19698159eji.18.1689059967069;
        Tue, 11 Jul 2023 00:19:27 -0700 (PDT)
Received: from localhost.localdomain (host-95-234-206-203.retail.telecomitalia.it. [95.234.206.203])
        by smtp.gmail.com with ESMTPSA id a25-20020a1709062b1900b00992ae4cf3c1sm740573ejg.186.2023.07.11.00.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 00:19:26 -0700 (PDT)
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Kees Cook <keescook@chromium.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rust: fix bindgen build error with UBSAN_BOUNDS_STRICT
Date:   Tue, 11 Jul 2023 09:19:14 +0200
Message-Id: <20230711071914.133946-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

With commit 2d47c6956ab3 ("ubsan: Tighten UBSAN_BOUNDS on GCC") if
CONFIG_UBSAN is enabled and gcc supports -fsanitize=bounds-strict, we
can trigger the following build error due to bindgen lacking support for
this additional build option:

   BINDGEN rust/bindings/bindings_generated.rs
 error: unsupported argument 'bounds-strict' to option '-fsanitize='

Fix by adding -fsanitize=bounds-strict to the list of skipped gcc flags
for bindgen.

Fixes: 2d47c6956ab3 ("ubsan: Tighten UBSAN_BOUNDS on GCC")
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 7c9d9f11aec5..4124bfa01798 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -257,7 +257,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-partial-inlining -fplugin-arg-arm_ssp_per_task_plugin-% \
 	-fno-reorder-blocks -fno-allow-store-data-races -fasan-shadow-offset=% \
 	-fzero-call-used-regs=% -fno-stack-clash-protection \
-	-fno-inline-functions-called-once \
+	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	--param=% --param asan-%
 
 # Derived from `scripts/Makefile.clang`.
-- 
2.40.1

