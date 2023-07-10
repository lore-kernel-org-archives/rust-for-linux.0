Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A109EB64DA
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 Jul 2023 07:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbjGJHjN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 Jul 2023 03:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjGJHjG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 Jul 2023 03:39:06 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B841195;
        Mon, 10 Jul 2023 00:38:52 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6748a616e17so1115497b3a.1;
        Mon, 10 Jul 2023 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688974731; x=1691566731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/B0+u2JIAudBxKyqw20a9S5PqBdRq3CYe51Zv4lryo8=;
        b=KfrhGL7pqC4EMjU4vqCPeDajAP19Pf27zLyuIs5hFvmAngZNpclnY8Ohz9CuCiSR/O
         Lm2hYAyOwvV/4QZ0V/QrwR4y4AuoD3dhDojpITfWB2uX8rZzU1kmv+jQiW2uhYvIFlKg
         UUdNb/kc/FtdeeOfVYObKTzRTYJI7OaDuwH/sSqFYTg62BWbfN14BIplLeIu6gDRgz+p
         FyvDdZXdBvFlmDm2QzjxwaU92Hn9jEuhcQeWl+FsbNsEeOjLKBqN778lTlyPVHvwiBrc
         YrUUDIcgJEl8bXeBU2xucdsmu3kwKo8XQBPB5S5thdEO0zjYSEwJGpPE1zbMm7znTw5b
         Ze7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688974731; x=1691566731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/B0+u2JIAudBxKyqw20a9S5PqBdRq3CYe51Zv4lryo8=;
        b=JAt6O9HDRs5a10te1L7FvqDRwgx/mX9/v3HlCStpLM+XdBk0iJVzoxayiuD8GKi+xI
         /zZRBR257EQ/ZN/jD9Fcj1S/ndPAClaAebhj1hy9x6a3M5zlKaezKSmATK4hu3nG8+yE
         TfXIeS7YlWS7m9wtsnSZ4/jmrRsJPDmpKksJUck90TlwLbLbRcRqMKHZYQ7VON2YQr/L
         uV31CqaWQ8UiEPAWVtWb4EMgJQlU9PlzGyN7BGv2AoZ/Y+M8RvX7mXk66YFigxiilInz
         3UTYWklRHJMgN0CbRSy2FzgT1CGG5Dg6PpXUBWjJz8pNh1ttS2FgdQs+L9z6M3XwR1lY
         fw7A==
X-Gm-Message-State: ABy/qLZdG+0LStsM9BUM4zt1KThrIi8yFI5V3CTzhnPEHa6YIisSsX22
        rMW20+5YiM/zyw2fWHQXa34bDnMuUrR5tw==
X-Google-Smtp-Source: APBJJlFhZTLzNkVXQoEhiZhqgOBNZtUjI6Aa7YulAuvdoEu1ifLs64XAXcfyRKWvZ6ZMvVvK4/GxTQ==
X-Received: by 2002:aa7:91c9:0:b0:668:834d:4bd with SMTP id z9-20020aa791c9000000b00668834d04bdmr12776947pfa.0.1688974730800;
        Mon, 10 Jul 2023 00:38:50 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id r20-20020a62e414000000b0063f2a5a59d1sm6514483pfh.190.2023.07.10.00.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 00:38:50 -0700 (PDT)
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
To:     rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Cc:     kuba@kernel.org, andrew@lunn.ch, aliceryhl@google.com,
        miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Subject: [PATCH v2 0/5] Rust abstractions for network device drivers
Date:   Mon, 10 Jul 2023 16:36:58 +0900
Message-Id: <20230710073703.147351-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This patchset adds minimum Rust abstractions for network device
drivers and an example of a Rust network device driver, a simpler
version of drivers/net/dummy.c.

The major change is a way to drop an skb (1/5 patch); a driver needs
to explicitly call a function to drop a skb. The code to let a skb
go out of scope can't be compiled.

I dropped get_stats64 support patch that the current sample driver
doesn't use. Instead I added a patch to update the NETWORKING DRIVERS
entry in MAINTAINERS.

Changes since v1 [1]:
- a driver must explicitly call a function to drop a skb.
- simplify the code (thanks to Benno Lossin).
- update MAINTAINERS file.

[1] https://lwn.net/ml/netdev/20230613045326.3938283-1-fujita.tomonori@gmail.com/

FUJITA Tomonori (5):
  rust: core abstractions for network device drivers
  rust: add support for ethernet operations
  rust: add methods for configure net_device
  samples: rust: add dummy network driver
  MAINTAINERS: add Rust network abstractions files to the NETWORKING
    DRIVERS entry

 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   3 +
 rust/helpers.c                  |  23 ++
 rust/kernel/lib.rs              |   3 +
 rust/kernel/net.rs              |   5 +
 rust/kernel/net/dev.rs          | 598 ++++++++++++++++++++++++++++++++
 samples/rust/Kconfig            |  13 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_net_dummy.rs  |  75 ++++
 scripts/Makefile.build          |   2 +-
 10 files changed, 724 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/net.rs
 create mode 100644 rust/kernel/net/dev.rs
 create mode 100644 samples/rust/rust_net_dummy.rs


base-commit: d2e3115d717197cb2bc020dd1f06b06538474ac3
-- 
2.34.1

