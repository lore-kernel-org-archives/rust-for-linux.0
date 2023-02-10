Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A089C636D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 10 Feb 2023 21:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbjBJVwE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 10 Feb 2023 16:52:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbjBJVvv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 10 Feb 2023 16:51:51 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B8BE4219
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Feb 2023 13:51:47 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DF5A83F128
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Feb 2023 21:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676065903;
        bh=zFT0oOBpYveO604RTQTdkSq+7ygdeMz6BBCP0ZNZAbw=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=iZVI6hK+jG1MqYlRYG+J76r8Q09/G8mXG0l+gJRpPIPNl+MdQtqRz/DjnC060c+OZ
         TQoSb8XKW27ZCLCOkBBJj3M1/itOaSn/64773vJJBitHN88hGULQmYlYQ8Q1bs4uPq
         lueweB4THo38vQ2FdPW4e5VucnetfOciFmTK7amVCS4q103Nxs8N1kveJwyELSdGpX
         WOkx0Jhf5P9BzdoRaK7RCjUBba7FaOmKHJvdCg1zHPFcr/eUiabvM/QjCXzJRvn2Bk
         ferso7o08xsWvfnnTMK2RW4dnxbPJVhWx8c1fuYldhjoo8Bv099Nhbi9mRlN7dtudc
         3d3G7ZATQumUA==
Received: by mail-ej1-f72.google.com with SMTP id qa17-20020a170907869100b0088ea39742c8so4323628ejc.13
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Feb 2023 13:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFT0oOBpYveO604RTQTdkSq+7ygdeMz6BBCP0ZNZAbw=;
        b=7AFr87KWsbLmVyZFBMb0Jd8bbn1XQ0lym55Z6biCtpncIG+Wc8369o1bH+aomdIfWf
         HE75osv6vTr+TzCuMowqZQez0aHcgV4hLpMR8/UJkENT9Xfs7xXgtYiJv1V9ulfzJT4r
         YdslubrPVxmd7NfyGPRQQ1MHeLuoM528S3FqYsNK0ZQRuyTByvIfcEwNaeveLSXzHQ5U
         sNvAWNn3hDYaHOqkiqE+uR2N9+wkl6afezwBgsPXMdE8YGMNbB15a4lppB4BMB7zD6ZY
         deSVBoLgyWvJV829rgl2HrfIRGaDidUVdldXC1vgTUdDDO6LocQKZItRETpE9OkRkMwL
         OBXw==
X-Gm-Message-State: AO0yUKWLtBWHFaJkcOWU3ZoenEAw4Mh5228idui7BIRHNie784NDWvHL
        8cJbxuVJWC52nI43xIhs/aZvUcoWKs3hjzZ+cLBqkdLBkD+MvnMZHh+CrNJBCRJIDetj6OXUG0d
        Uf/PnCnFIdScLqGaHRntGX8Qgc+Ro+u0xVdgrB56jNPD9
X-Received: by 2002:a50:9e6e:0:b0:4aa:a709:8aaa with SMTP id z101-20020a509e6e000000b004aaa7098aaamr17736717ede.26.1676065902952;
        Fri, 10 Feb 2023 13:51:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9+BHlJMDBcsvgiM7vwnGCVZttPxeqAKvR0hWfwXQt8YmKsWjwVxROQgnN9KPCp3zjIdBwimQ==
X-Received: by 2002:a50:9e6e:0:b0:4aa:a709:8aaa with SMTP id z101-20020a509e6e000000b004aaa7098aaamr17736703ede.26.1676065902700;
        Fri, 10 Feb 2023 13:51:42 -0800 (PST)
Received: from righiandr-XPS-13-7390.homenet.telecomitalia.it (host-87-7-128-191.retail.telecomitalia.it. [87.7.128.191])
        by smtp.gmail.com with ESMTPSA id o17-20020a50c291000000b0049ef70a2894sm2852729edf.38.2023.02.10.13.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 13:51:42 -0800 (PST)
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        bjorn3_gh@protonmail.com, Kees Cook <keescook@chromium.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust: allow to use INIT_STACK_ALL_ZERO
Date:   Fri, 10 Feb 2023 22:51:41 +0100
Message-Id: <20230210215141.108958-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

With CONFIG_INIT_STACK_ALL_ZERO enabled, bindgen passes
-ftrivial-auto-var-init=zero to clang, that triggers the following
error:

 error: '-ftrivial-auto-var-init=zero' hasn't been enabled; enable it at your own peril for benchmarking purpose only with '-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang'

However, this additional option that is currently required by clang is
going to be removed in the future (as the name of the option suggests),
likely with clang-17.

So, make sure bindgen is using this extra option if the major version of
the libclang used by bindgen is < 17.

In this way we can enable CONFIG_INIT_STACK_ALL_ZERO with CONFIG_RUST
without triggering any build error.

Link: https://github.com/llvm/llvm-project/issues/44842
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---

Changes in v2:
 - check the version of libclang used by bindgen to determine if we need
   to pass the additional clang option

 rust/Makefile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index ff70c4c916f8..c77d7ce96a85 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -269,6 +269,19 @@ BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 # some configurations, with new GCC versions, etc.
 bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
 
+# Auto variable zero-initialization requires an additional special option with
+# clang that is going to be removed sometimes in the future (likely in
+# clang-17), so make sure to pass this option only if clang supports it
+# (libclang major version < 17).
+#
+# https://github.com/llvm/llvm-project/issues/44842
+ifdef CONFIG_INIT_STACK_ALL_ZERO
+libclang_maj_ver=$(shell $(BINDGEN) $(srctree)/scripts/rust_is_available_bindgen_libclang.h 2>&1 | sed -ne 's/.*clang version \([0-9]*\).*/\1/p')
+ifeq ($(shell expr $(libclang_maj_ver) \< 17), 1)
+bindgen_extra_c_flags += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
+endif
+endif
+
 bindgen_c_flags = $(filter-out $(bindgen_skip_c_flags), $(c_flags)) \
 	$(bindgen_extra_c_flags)
 endif
-- 
2.38.1

