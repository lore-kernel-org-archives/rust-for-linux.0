Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E5BC64EC4
	for <rust-for-linux@archiver.kernel.org>; Fri, 10 Feb 2023 15:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbjBJP03 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 10 Feb 2023 10:26:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbjBJP02 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 10 Feb 2023 10:26:28 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A192172C
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Feb 2023 07:26:27 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7FCFC3F11B
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Feb 2023 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676042784;
        bh=1krz5gzGk/IBtH/mXLuEk6jDYq6rFyZJFvG5QeiBg8o=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=v74G2PecauTgOs8g1wxUyoHnBx7B07hjRdLD8EAFTj9KumvRrbgjjq+ZB87UQRXCi
         aBJNDBKVIln/YZC8b3TrEtIURsVGC2AgTAAo5MYZAn62+Mv5JDbqgGSBhX1DCgbl/9
         QKA+CwwHpQfdUtaHL5QI+UNEVehsX05kpY3R6mSbpFjcqZ85wCSZr4WhBo3dwJaJWD
         lppzjQ9rg2k1jlRwFlLP24wjvU3SnHpfO7Urun4eonpEkgx5vHKQrcAV9gWPv2Ey7q
         hSR1reZDrv/COKPY+8daoB1ONDBqk5gezfq+jHIGECr20AwFxGtpvL9h+7KXJTpu/T
         1r3sjBY274/JQ==
Received: by mail-ed1-f70.google.com with SMTP id w3-20020a056402268300b00487e0d9b53fso3760244edd.10
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Feb 2023 07:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1krz5gzGk/IBtH/mXLuEk6jDYq6rFyZJFvG5QeiBg8o=;
        b=1HTAQ+fI0sC+kC8ilqKt/uLKzoFOrETd4sgXRaGUkyTM4t6ESdWoHvvUvpnXiR85M2
         cUxiPj3rlnK8jUuMCCktCYiWet55tsHJYeXKU1xx9PI9BbIvm216JgEcqIZLizdgaenN
         KogMCowTy6gn8tmXMQR+hvNfUe78/SYdFijWsb91x5jRad6PBl8Y8Xxl4cTNORiIygWa
         xn1Iam/1hQUv6l8OT0wv4pINwF7lmiODKHELs+BviW2SHJ225YYFXmc13lK3vJRVbCeQ
         tBe6RpgIOMhtZaQELjdn0N/G6We86bl6tDgD2SZmucrmbFY1xTmvqXB3WfkGFAOztv9Q
         3T9Q==
X-Gm-Message-State: AO0yUKWQW6ixZo9kI6tMe4Jz3AzvDgVliJIU7Kf8N9GF0SGfkc8e4ZAE
        H7qXMH9z6AbfkMP4KG8Nq1tVGX/SE0HeUFGt4DLICIGrIj+aQ/DI7g2HMGP6q1Dc+Y6BJwNd0u3
        dJYXh4Wn8io/NHfALMuLvB+KeSr5C6GKsN+PxtlMYoBvp
X-Received: by 2002:a17:906:80cd:b0:8aa:a445:8215 with SMTP id a13-20020a17090680cd00b008aaa4458215mr14116908ejx.70.1676042784262;
        Fri, 10 Feb 2023 07:26:24 -0800 (PST)
X-Google-Smtp-Source: AK7set+MSjkHI+SI0mj2cJ83acvTUv/5JVWnrm71fQP74ZT9FLq6O3gmUFz0qmiBEGiGCpifjEO3fg==
X-Received: by 2002:a17:906:80cd:b0:8aa:a445:8215 with SMTP id a13-20020a17090680cd00b008aaa4458215mr14116888ejx.70.1676042784093;
        Fri, 10 Feb 2023 07:26:24 -0800 (PST)
Received: from righiandr-XPS-13-7390.homenet.telecomitalia.it (host-87-7-128-191.retail.telecomitalia.it. [87.7.128.191])
        by smtp.gmail.com with ESMTPSA id f20-20020a170906c09400b00872c0bccab2sm2507689ejz.35.2023.02.10.07.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:26:23 -0800 (PST)
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rust: fix regexp in scripts/is_rust_module.sh
Date:   Fri, 10 Feb 2023 16:26:22 +0100
Message-Id: <20230210152622.92912-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

nm can use "R" or "r" to show read-only data sections, but
scripts/is_rust_module.sh can only recognize "r", so with some versions
of binutils it can fail to detect if a module is a Rust module or not.

Right now we're using this script only to determine if we need to skip
BTF generation (that is disabled globally if CONFIG_RUST is enabled),
but it's still nice to fix this script to do the proper job.

Moreover, with this patch applied I can also relax the constraint of
"RUST depends on !DEBUG_INFO_BTF" and build a kernel with Rust and BTF
enabled at the same time (of course BTF generation is still skipped for
Rust modules).

Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 scripts/is_rust_module.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/is_rust_module.sh b/scripts/is_rust_module.sh
index 28b3831a7593..464761a7cf7f 100755
--- a/scripts/is_rust_module.sh
+++ b/scripts/is_rust_module.sh
@@ -13,4 +13,4 @@ set -e
 #
 # In the future, checking for the `.comment` section may be another
 # option, see https://github.com/rust-lang/rust/pull/97550.
-${NM} "$*" | grep -qE '^[0-9a-fA-F]+ r _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'
+${NM} "$*" | grep -qE '^[0-9a-fA-F]+ [Rr] _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'
-- 
2.37.2

