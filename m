Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCC0C7EE43
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 07:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjFJHZf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 03:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbjFJHZe (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 03:25:34 -0400
X-Greylist: delayed 319 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 10 Jun 2023 00:25:33 PDT
Received: from a27-27.smtp-out.us-west-2.amazonses.com (a27-27.smtp-out.us-west-2.amazonses.com [54.240.27.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 663143AA4
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 00:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686381613;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=KY8+PfarRxwwrHxbBX0fLAde4ex7AZeUqfc0zcvgfW8=;
        b=KxTM7nT/Wqgz0qq4fmDrZBlZKJaEROQBmxwIm9n4I5ebrJm6Byl4ufjUtcnNop3L
        Un+BGMekjcRPD5MZpYwK9ivOxnL83kO31mu4M1TdJAkKSOJwubNBemjUhsFVQNy0LZO
        n0Y4p/XAenK0zlzVJSi6vAHBMs6y5rhJz/oGlYgm4fPiaQzP6eKT99YDXKb0zyNjISG
        BsSPEeDPnAXCiBrBvgIqBso5UTRkKHBvW683ePvdyqKnQFiKgQ+r3NnOdnOt6eYHn+a
        hCgzhnhkHlVb7GcRith9ec6X+EwV4hm3R9yPtSigfs2xhKvCQHlEI4ObEk4W95ghexq
        uFBNst8emQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686381613;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=KY8+PfarRxwwrHxbBX0fLAde4ex7AZeUqfc0zcvgfW8=;
        b=ISmdW6Xa2PP53Q68syAsJeOFOOvZjLsrDzViBHFDq5el9Fdb2lLl5NcEJXJZprfD
        rA9zgsJOwerAR1EnBXOqrAw6NLrorvQzHj0L3vYo9Q/lxezU25Taq6q6udBL/fbIwtd
        DeEFunX3z3qRrZDSH3Vx9odJqMwUxUJ9ElbMC8Z8=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     aliceryhl@google.com, andrew@lunn.ch,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v2 0/5] add abstractions for network device drivers
Date:   Sat, 10 Jun 2023 07:20:13 +0000
Message-ID: <01010188a42d5244-fffbd047-446b-4cbf-8a62-9c036d177276-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.10-54.240.27.27
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This patchset adds minimum abstractions for network device drivers and
Rust dummy network device driver, a simpler version of drivers/net/dummy.c.

The dummy network device driver doesn't attach any bus such as PCI so
the dependency is minimum. Hopefully, it would make reviewing easier.

Changes since v1:
- avoids listing all the operations in net_device_ops and ethtool_ops
- renames the dummy device driver (rust_dummy to rust_net_dummy)
- removes atomic ops in the dummy device driver
- uses Opaque for rtnl_link_stats64 instead of raw pointer
- simplifies the code (cast, static, etc)

Thanks a lot for the comments on v1!


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
 rust/kernel/net/dev.rs          | 514 ++++++++++++++++++++++++++++++++
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_net_dummy.rs  |  85 ++++++
 scripts/Makefile.build          |   2 +-
 9 files changed, 646 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/net.rs
 create mode 100644 rust/kernel/net/dev.rs
 create mode 100644 samples/rust/rust_net_dummy.rs


base-commit: d09a61024f6b78c6a08892fc916cdafd87b50365
-- 
2.34.1

