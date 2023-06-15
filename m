Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91947EB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 14:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345054AbjFOOXt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 10:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345037AbjFOOXd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 10:23:33 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17391294A
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 07:23:27 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b5079b8cb3so3321165ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686839006; x=1689431006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3m3f2pGA4yw2miSC7wLIcV9xwMeClUAoyq8NzgreQg=;
        b=sU/MszFVVMkfqGzm7AE9Rvgpk8aTZWEAlDKU583mqgXfPigzJDOxFn4GLk7/51tj6w
         GrG+DGjNgfb5+avM2GAmImqIWqFRMar4EqDy64HUh+m5gFHxwFSmjuAApOoI7PnfPD1z
         pBMEOGS//HihgZClOSnNXRYSfXmpqHeuSUKL8ooxxVIzQTpE6TcZgvj/1Q6hssjuRfSJ
         2nUcWqxTZCBDNl3nunXYkV9WT9vI7NN4M5M6Jxd4rpskp5LcirDoffuKZ6HRs0i+cJEL
         axCs39Z0z9LXi2dY/C92BtpBj5i4N25yk1WvsC1JHwC/j0RM2yMpK5B8hI81h64Z+ABy
         sRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686839006; x=1689431006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3m3f2pGA4yw2miSC7wLIcV9xwMeClUAoyq8NzgreQg=;
        b=bVU8FNjNUMOpqoaLyq39dexyA4IPy3VaXi9ehXiOjSsjpGPttpWdDWN/JQIJr8TVeY
         8/voXxGoCoWiBN2eMfKK3J6LXAz+b9KFSVwIBwdRlAQugwqaCyiTUH7nE9+m6HC+QXyh
         1jB/7GYJpKNdW6dkgz3HBBj1UWLn/vZD3WYAdEcmDBIKRI664si43Sjc+u9jdPrrZR/u
         kuwsh0CHN4wNTgy5BpqE9BAON3hHQOP1EPcvZ9010KdjBXhZ80xdYAxyz9snXIFOJK/y
         vm5ZtymRowSfIAEYt0QZBXOuURYotqhn5fFgyMYpUHAJiZhAnpGZhshrrFwpeR/KUk2V
         zE7Q==
X-Gm-Message-State: AC+VfDyFutcZChJnF+gH72FZO1WaTAsXUk/76rOVYzW9YQ6tXUR0o8hh
        CVxPoBup03THcWJw3O76X5ussNnNW2oMRA==
X-Google-Smtp-Source: ACHHUZ7S3nvbq1GFcB0t8C6/KnnMfNDO7R+7HH/YzxzOHm/aKxOZ0gCizRE7aWXVTFOxtdKNTt8asw==
X-Received: by 2002:a17:902:db0e:b0:1ac:656f:a68d with SMTP id m14-20020a170902db0e00b001ac656fa68dmr20456143plx.4.1686839005827;
        Thu, 15 Jun 2023 07:23:25 -0700 (PDT)
Received: from ip-172-30-47-114.us-west-2.compute.internal (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090322cd00b001a69dfd918dsm14194616plg.187.2023.06.15.07.23.25
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:23:25 -0700 (PDT)
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
To:     rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v2 0/2] Rust abstractions for Crypto API
Date:   Thu, 15 Jun 2023 23:23:09 +0900
Message-Id: <20230615142311.4055228-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

Before sending v2 of my crypto patch [1] to linux-crypto ml and
checking the chance of Rust bindings for crypto being accepted, I'd
like to iron out Rust issues. I'd appreciate any feedback.

Once reviewing on rust-for-linux ml is done, I'll send only crypto
support to linux-crypto (drops the socket support patch to netdev).

Changes since v1:
- addressed Eric's comments on hash support [2].
- add rng support
- split files

[1] https://lore.kernel.org/netdev/010101881db036fb-2fb6981d-e0ef-4ad1-83c3-54d64b6d93b3-000000@us-west-2.amazonses.com/T/
[2] https://www.spinics.net/lists/netdev/msg904380.html

FUJITA Tomonori (2):
  rust: add synchronous message digest support
  rust: add Random Number Generator algorithms support

 rust/bindings/bindings_helper.h |   2 +
 rust/helpers.c                  |  38 ++++++++++
 rust/kernel/crypto.rs           |   6 ++
 rust/kernel/crypto/hash.rs      | 118 ++++++++++++++++++++++++++++++++
 rust/kernel/crypto/rng.rs       |  72 +++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 6 files changed, 238 insertions(+)
 create mode 100644 rust/kernel/crypto.rs
 create mode 100644 rust/kernel/crypto/hash.rs
 create mode 100644 rust/kernel/crypto/rng.rs


base-commit: d2e3115d717197cb2bc020dd1f06b06538474ac3
-- 
2.34.1

