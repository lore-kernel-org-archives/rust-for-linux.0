Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3264C0015E
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 Jul 2023 07:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbjGJHjS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 Jul 2023 03:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbjGJHjN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 Jul 2023 03:39:13 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD5EE7C;
        Mon, 10 Jul 2023 00:38:59 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-66d6a9851f3so612130b3a.0;
        Mon, 10 Jul 2023 00:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688974738; x=1691566738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsQMEaCs3k1dlBLgyXTPYSUjzDqURbd4pdB1RY6xh1k=;
        b=S5gJ4BxbDkGfukmtMvb5QI2fe3sotCh3JApFSWTTEeD88C3aNxv7GEvNUVgWpTlDrp
         XisGArgHa7xFZqvMB6vmTDRqXKVARRsXOPpuqM85WlmN9JVQWgHtUM/E2RaHTaGrshvb
         wvQ8+bKVNFw1DfByqGQWUZqI8kaPNpnYXBV764Ode43smk40hwsDNpYaEDf1cDlYHaeI
         hs3FNzxY7wi4M0VAmcPdA8dNiGLsInxamCtG7LV/L4E5iezkiq2uOafxL4tkkkiciI8I
         fvra7iOSobp08grcVah+YZyxdr72hORagieZWHVeVp4lC2y9GMF2FuBPn3+/+eGRdI3V
         5dLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688974738; x=1691566738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsQMEaCs3k1dlBLgyXTPYSUjzDqURbd4pdB1RY6xh1k=;
        b=Xgpr/l0cWqC4H8lN9VreV8LkECfl0/LVuccTiW+BbwQDdRI/P/MzI8bwv1anux5HV+
         bHtX6eiWwUDBHxR4Up7pdxSQ5QskqRJwPLya5JDrTzrfkBnZGuxL8y/R3mvadvzHV6ey
         liZIY3xR/sUi1tctHfGbhKACF/dE3i1zX4AQWo6Ns2QtPqdPfi4gq0JMi63aSPyHEaPI
         y5+tLkotmt0qwYrG2iecryw+zjedvG+c0j0ZahHsWzjy792qCoZxvAaY/RuY7cKpzJO7
         +bqtelB+CgL+ZD6zc3zKyx81mK82P7/UYbUfykDaAmiKhhKLvOcfXUYQfvbOuFoA3h9C
         zgLQ==
X-Gm-Message-State: ABy/qLYw9CsuZ5D5XZYnzkBU1auEHSvkq1t8P0g1DYC2Jqqe172wzrde
        7DNgcNNVMh5J2SnY5T3wH6gpR0agoQTcVTc4
X-Google-Smtp-Source: APBJJlGFbyw59LLFw59QxK58EARZfGw/4tLQBrhhDAU5HtqVHq5PFCZz8bdEGwLeJPeNVoQmnSHJvw==
X-Received: by 2002:a05:6a20:4424:b0:111:a0e5:d2b7 with SMTP id ce36-20020a056a20442400b00111a0e5d2b7mr17505660pzb.4.1688974737589;
        Mon, 10 Jul 2023 00:38:57 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id r20-20020a62e414000000b0063f2a5a59d1sm6514483pfh.190.2023.07.10.00.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 00:38:56 -0700 (PDT)
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
To:     rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Cc:     kuba@kernel.org, andrew@lunn.ch, aliceryhl@google.com,
        miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Subject: [PATCH v2 5/5] MAINTAINERS: add Rust network abstractions files to the NETWORKING DRIVERS entry
Date:   Mon, 10 Jul 2023 16:37:03 +0900
Message-Id: <20230710073703.147351-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710073703.147351-1-fujita.tomonori@gmail.com>
References: <20230710073703.147351-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

The files are placed at rust/kernel/ directory for now but the files
are likely to be moved to net/ directory if things go well.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 250518fc70ff..66b8e43b05a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14581,6 +14581,8 @@ F:	include/linux/inetdevice.h
 F:	include/linux/netdevice.h
 F:	include/uapi/linux/if_*
 F:	include/uapi/linux/netdevice.h
+F:	rust/kernel/net.rs
+F:	rust/kernel/net/
 
 NETWORKING DRIVERS (WIRELESS)
 M:	Kalle Valo <kvalo@kernel.org>
-- 
2.34.1

