Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AAFC77B7A
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 02:21:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjFDCVd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 3 Jun 2023 22:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjFDCVd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 3 Jun 2023 22:21:33 -0400
X-Greylist: delayed 218 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 03 Jun 2023 19:21:30 PDT
Received: from a27-50.smtp-out.us-west-2.amazonses.com (a27-50.smtp-out.us-west-2.amazonses.com [54.240.27.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E9FDD
        for <rust-for-linux@vger.kernel.org>; Sat,  3 Jun 2023 19:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1685845072;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=SVzJXTe5PCy9i8cgHQSKGGsGhnAbIEQMPwhoqDAV2y4=;
        b=jnwLFZrVkTujxuyJ1VsrTzO/Zi3ekzRuYAJsVtOetHk16Dsuf0yigvf95WAuvi9/
        EfEkMe3ETT6LBlmy23/t4sBZrIz1gtlTXZNOQYI8AgmvkBHc8SwWRK5HBUw5jOHML0J
        2l/SH7Kc3Yolbkqwlm/CIm6o1U8vXKRRkO3INpMhOWxEPgG4vBzhGA5mttT0BsEL8HQ
        fYbb/wV527PtOarAcvYl7uoW9VS7VlQcHwM49hXbHKrjvf2U73VjRgYv9TqfJMFJRkg
        tYCn1AnqR6Q/CfXrx+1Jf3oLXVv2HoUqf/AjFeKE8URFyEDJXn3Ee2EggnWQLpQP+cz
        p7cI++lKFQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685845072;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=SVzJXTe5PCy9i8cgHQSKGGsGhnAbIEQMPwhoqDAV2y4=;
        b=MCvAefmR+RPdEA4H2NqzOwYE/ISAvKc2QPlIch9UMcJgVjF2ur6UwODttuH4qLkA
        OVouxJhQNAVuY1S5ospc9HxrhUoh0CY0h5g867T7x+OHK+SG+aD5NqHONa2yjYyfnHd
        WyEZqxR44e9Pum4q4t3Jz3hlvETjhizzcvzxyOqU=
From:   FUJITA Tomonori <tomo@exabit.dev>
To:     rust-for-linux@vger.kernel.org
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH 0/5] add abstractions for network device drivers
Date:   Sun, 4 Jun 2023 02:17:52 +0000
Message-ID: <01010188843258ec-552cca54-4849-4424-b671-7a5bf9b8651a-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.04-54.240.27.50
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This patchset adds minimum abstractions for network device drivers and
Rust dummy network device driver, a simpler version of drivers/net/dummy.c.

The dummy network device driver doesn't attach any bus such as PCI so
the dependency is minimum. Hopefully, it would make reviewing easier.

This patchset applies to rust-next.

I'd appreciate any feedback before submitting to netdev.

FUJITA Tomonori (5):
  rust: core abstractions for network device drivers
  rust: add support for ethernet operations
  rust: add support for get_stats64 in struct net_device_ops
  rust: add methods for configure net_device
  samples: rust: add dummy network driver sample

 rust/bindings/bindings_helper.h |   3 +
 rust/helpers.c                  |  23 ++
 rust/kernel/lib.rs              |   2 +
 rust/kernel/net.rs              |   5 +
 rust/kernel/net/dev.rs          | 656 ++++++++++++++++++++++++++++++++
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_dummy.rs      |  98 +++++
 scripts/Makefile.build          |   2 +-
 9 files changed, 800 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/net.rs
 create mode 100644 rust/kernel/net/dev.rs
 create mode 100644 samples/rust/rust_dummy.rs


base-commit: d09a61024f6b78c6a08892fc916cdafd87b50365
-- 
2.34.1

