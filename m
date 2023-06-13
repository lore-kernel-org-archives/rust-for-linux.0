Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E43C7EE29
	for <rust-for-linux@archiver.kernel.org>; Tue, 13 Jun 2023 04:53:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239545AbjFMExh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 13 Jun 2023 00:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233430AbjFMExg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 13 Jun 2023 00:53:36 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF8A18C;
        Mon, 12 Jun 2023 21:53:32 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-65c6881df05so1211231b3a.1;
        Mon, 12 Jun 2023 21:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686632011; x=1689224011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IhhNCWoLM7rq84i2XdJZKpLP/eseoVpIN0SwKzCcprY=;
        b=GhDKgKELDcq60Fp3oJouXw9mkSDW2jeTOJTAwGpqkng1QkjTQI+yMvF4dqNcI6s24Y
         ddiBfSD6UTEwBsc6vg8yYXqQSRl8+8F/ZAJGmfez32Len2QKDaFoKA9HmAvh+CUKQfZ3
         Be6kZ0SADU/4nYS5aGC/0V+EQb11kL87kLW2tVcVlepagG4ljMpUWfLDMrwZrmcJoWA+
         Gt2rSEg2K+UHyUk/i8ZaZQ7HkVpevO17YgfSDEaHhnevBNkbITc/OGPdXXLhwSud1kM5
         ZtgwBg2GgbIoBGu4wEenfIz2F4PPYK3xF2na4jeN+CB63Sr0cfeS/61OfYt+2ykQpATo
         MZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686632011; x=1689224011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhhNCWoLM7rq84i2XdJZKpLP/eseoVpIN0SwKzCcprY=;
        b=ZevDwAsB1mpvu0wQi0qrPWJLTtH0ojLv0uGMk0jWQAZnsNEd7JwM965p2XSBW89R3G
         6lu944zZRZVEbTXXvtSIsdWe9S9Vpa1UDxuCCZWIsKMWevFK60REEuFSKN8z5ds3XSY5
         bSDOgtEx0VAxQDkh+U56Xm0JyQtp3MGA6ZXqB83qlrEo1o/y0XH43k2uNrv3E4idC0QB
         HSxjP06V+WQOotOarJ+eEGhAC4BvafXt8Rwf0GX+MOC2IZnYnYv0JEvQF9HoRQT9r7sT
         /WZwaQCzaGIh3kx305rk0e/cbUFhR5VbWZYG6waUCRoeGYW2aW/hWiwu3sHxT6EdRILD
         iqDQ==
X-Gm-Message-State: AC+VfDyNylRFPo5MIO7HgcfckDCRpF2ABMWnSX0QsRTkMOozWLuz75qb
        hae8LOUcna6gnDmjtuPajQnzq/LLI11XOX6u
X-Google-Smtp-Source: ACHHUZ7XLwwrDdlT8Br/SlRuL6HUk6zTN+ZUftrNd0kxhcBHi1fdimW3Gt5WsyZ1qjCajGOKpjFhIA==
X-Received: by 2002:a17:902:f682:b0:1b3:d4bb:3515 with SMTP id l2-20020a170902f68200b001b3d4bb3515mr4265715plg.0.1686632011145;
        Mon, 12 Jun 2023 21:53:31 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001b027221393sm9095249plc.43.2023.06.12.21.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 21:53:30 -0700 (PDT)
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
To:     netdev@vger.kernel.org
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        andrew@lunn.ch, miguel.ojeda.sandonis@gmail.com
Subject: [PATCH 0/5] Rust abstractions for network device drivers
Date:   Tue, 13 Jun 2023 13:53:21 +0900
Message-Id: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This patchset adds minimum Rust abstractions for network device
drivers and an example of a Rust network device driver, a simpler
version of drivers/net/dummy.c.

The dummy network device driver doesn't attach any bus such as PCI so
the dependency is minimum. Hopefully, it would make reviewing easier.

Thanks a lot for reviewing on RFC patchset at rust-for-linux ml.
Hopefully, I've addressed all the issues.

FUJITA Tomonori (5):
  rust: core abstractions for network device drivers
  rust: add support for ethernet operations
  rust: add support for get_stats64 in struct net_device_ops
  rust: add methods for configure net_device
  samples: rust: add dummy network driver

 rust/bindings/bindings_helper.h |   3 +
 rust/helpers.c                  |  23 ++
 rust/kernel/lib.rs              |   3 +
 rust/kernel/net.rs              |   5 +
 rust/kernel/net/dev.rs          | 697 ++++++++++++++++++++++++++++++++
 samples/rust/Kconfig            |  12 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_net_dummy.rs  |  81 ++++
 scripts/Makefile.build          |   2 +-
 9 files changed, 826 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/net.rs
 create mode 100644 rust/kernel/net/dev.rs
 create mode 100644 samples/rust/rust_net_dummy.rs


base-commit: d2e3115d717197cb2bc020dd1f06b06538474ac3
-- 
2.34.1

