Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7475CC4338F
	for <rust-for-linux@archiver.kernel.org>; Fri,  6 Aug 2021 16:15:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 575B7606A5
	for <rust-for-linux@archiver.kernel.org>; Fri,  6 Aug 2021 16:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhHFQQL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 6 Aug 2021 12:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhHFQQK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 6 Aug 2021 12:16:10 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1209CC0613CF
        for <rust-for-linux@vger.kernel.org>; Fri,  6 Aug 2021 09:15:55 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id n19so12274638ioz.0
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Aug 2021 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=q3ClAvbOX8s36bAefQUIpDRADEI5rFEkbnfFReq/4aHLxJNiTLU+A56jqnNaGROwQN
         3W0c5i+EqY9w3PdI7eEshriRWaqfi9coyN534gPxOiD8kKWqqbPoadHxmScLJoBx/VQl
         NXcGOLWnNfbMTL0s7TcDF/KQp4OR2MOvDyVinM2V2rGMjE1WGdUxpkdWck/LXp8RNlf6
         uAdzRTsyvSkTDVYF9bnhJ5TmXU619vhaPik10qSU3vl/6N/iUvbMKze7CemLkNW8lJJ9
         S8PVVpFIP8meooGNALMcWFNHUxm9KSi0bP0vGKemIb+Ah/JgQXbxeiTUnDi2AcXdlUdO
         Sgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=QWxPLXQdFcR4jQgH18zAecI4m05sbOyrWM2EdIgGxpxW+pcaX0yg/C3Ck5x39uqNSR
         yMf1pNwYaZpn9UlcY4WDgYJlMmXlpsX2C8/Sd9MsHe7VLGPJ+Tv2LtCB9jR6MjNnBCCT
         tuqVm5pRBx43B23SpPGD/2uvjn4skBwdtXsap0av41K3lFgZSmM5MyWFLODSxhzCd7SX
         YfmHDfNX7D/+JNH8rmXQhlQFH21fn+DJJpbu/oEegvuNoEOi6SwXkisfLTADUAWuZf8O
         8kGj5nQSyFyMPNCQAw5UZAPdRzBe/SnBA9TeBlqq9WhOF76fpv3HGPnbdmv78CzTUJb4
         Vclg==
X-Gm-Message-State: AOAM5323hOgQhf3Mo6OOLcJLulhGvP5d1cUV1/UkcZbt1FQ7kSPmc9lm
        WyPplxPfJQswNvw+HrTUMACra0Npl/e3b0xYO6aaDHgY/eM=
X-Google-Smtp-Source: ABdhPJw5dqWaHpAFsm7d5+86kOZdwubgH0QICafA23uQYzQPvQm338SsLcQveEzTI+O/x/37LMbeVs1qXZDaPJwqUMI=
X-Received: by 2002:a92:1908:: with SMTP id 8mr1137887ilz.149.1628266554519;
 Fri, 06 Aug 2021 09:15:54 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 6 Aug 2021 18:15:43 +0200
Message-ID: <CANiq72n2Yh0DqQthU=3z0MjzfO7sLYxDmA6v-FsezQ5AV=2oEg@mail.gmail.com>
Subject: Reminder: informal call tomorrow 18:00 UTC
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call tomorrow 18:00 UTC (first Saturday of
each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
