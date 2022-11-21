Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FEDC4332F
	for <rust-for-linux@archiver.kernel.org>; Mon, 21 Nov 2022 16:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiKUQ0h (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 21 Nov 2022 11:26:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiKUQ0g (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 21 Nov 2022 11:26:36 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C44D0894
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Nov 2022 08:26:35 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id v3so11626796pgh.4
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Nov 2022 08:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFl++xtNm0PeA4xw7xesS6PAmzG+pOafEb0osiM0XZ0=;
        b=TCe6x3fK4OKxqWgHPmSiPGsoOkJA9F60bWyUoXK8iAbM8OKJ+TmlcAa8h6g2RBAvvb
         cfxut4b814Qoz6Dsh08Jns34MFbRjUTu3BR6DmDEUn3umv00vPF31AMwsOySVmIKk8kl
         GT5fq5/U7P4Ifx7Zg82Tjop+B5elULCsu6BAvi2lFf6QaXrbpLzEtODjy9PI9AcO/hi3
         FAGtpP3YlpkCwUNPtoDVupFC3jTPLG5uONqalNyVwpWD8kC2WFHEmGjg7aiVG7fJYTZ1
         Wn6DLcz5qOvzQI5SnLxY3q1NjR8hv4/pHzBtNVyp1kruTZZGSUj83WCwvWCzTYK74LsC
         Jdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFl++xtNm0PeA4xw7xesS6PAmzG+pOafEb0osiM0XZ0=;
        b=RhBj2ZdWfy6rUzj6oDWoyntlh1YkwLG3icldOOaoBPl6+v1CMqpM5Q8aFt9ebpPpUq
         Da1Ry89gdn7v7q+8DJ2ZzB6A6S0B1bM0wwapWjBx1TUy+bH4AxhZYeXuIlh04sX4GUjO
         3E7khEFNIM/JZQC2xTm7xTlpGZHv4O5x8Xtsdq5BP8MpZVgRypMkj+g0SwF293VFKB3c
         WMwcgjAy/pP4GPZBiooGEOJYFpPjgxfmOfc4Bg11whe867PA4QkgebmIcPx12s2uJ5JD
         HAt0Sf3dtJtJePfzDlese5H5GHfVAaOg4uuKWQwyGeT2kXkYbXTgdD295blfbi5dJIyj
         Jr6w==
X-Gm-Message-State: ANoB5pnbXLHfk6gg2Dcrbn1gZ6lpP2OfI0D569a1If2CaBYYEsDy8w3h
        O9zTDeMJcvNvyEHWptq5RYqCl0UjzFZPvw==
X-Google-Smtp-Source: AA0mqf5CBOBgVpO/MfrQeqirWXjyy4jRwnnpbFVvuKTBwWGAwySnzYdovsdR0G0bcR9c/J2MOoBRiQ==
X-Received: by 2002:a05:6a00:17a3:b0:56b:b37d:9857 with SMTP id s35-20020a056a0017a300b0056bb37d9857mr486081pfg.12.1669047994798;
        Mon, 21 Nov 2022 08:26:34 -0800 (PST)
Received: from localhost ([220.116.249.144])
        by smtp.gmail.com with ESMTPSA id x187-20020a6231c4000000b0056bc30e618dsm8950437pfx.38.2022.11.21.08.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 08:26:34 -0800 (PST)
Date:   Tue, 22 Nov 2022 01:26:31 +0900
From:   Paran Lee <p4ranlee@gmail.com>
To:     ojeda@kernel.org
Cc:     austindh.kim@gmail.com, pmnxis@gmail.com,
        rust-for-linux@vger.kernel.org
Subject: [PATCH] scripts: add rust in scripts/Makefile.package
Message-ID: <20221121162016.GA2422@DESKTOP-NK4TH6S.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Add rust argument at TAR_CONTENT in
scripts/Makefile.package script.

Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 scripts/Makefile.package | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 8bbcced67c22..4f456c585eca 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -31,7 +31,7 @@ export KDEB_SOURCENAME
 # Include only those top-level files that are needed by make, plus the GPL copy
 TAR_CONTENT := Documentation LICENSES arch block certs crypto drivers fs \
                include init io_uring ipc kernel lib mm net samples scripts \
-               security sound tools usr virt \
+               security sound tools usr virt rust \
                .config .scmversion Makefile \
                Kbuild Kconfig COPYING $(wildcard localversion*)
 MKSPEC     := $(srctree)/scripts/package/mkspec
-- 
2.25.1

