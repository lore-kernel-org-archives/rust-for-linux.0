Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44669C433DB
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 16:57:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01DD46510F
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 16:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhCPQ4l (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 16 Mar 2021 12:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236819AbhCPQ42 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 16 Mar 2021 12:56:28 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABF9C061756
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 09:56:16 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id u3so37552073ybk.6
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 09:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=0Q2GEHfl4Ob8KlaVM66LrNosy/YM4WsW8okxDG0d70w=;
        b=qIvtxJ/nwlcOQgyTfDJUdUZ46KTMGBzMDvgZc3ix8fNJEj41cCOmn/cz1hyXl2xTOF
         ZSSzZ7RrL4qcdmoiQhYkLGk50fk+seEeTk8eY+okyHREnW9cUYHkaqepFyJe1i2opaFl
         xQjaGLTLmtuc1YxYCowItrk22WCEm1/iyoedeVBKcaXGRDWdnCgrMN5PcdugGEBObDHL
         AM6cTtZ94u+iK3rTXYbOLGREKnCDC/+btd6SRfcVo0zi1yq4liDnMdTAw5wsRfi3Z/y1
         CfybQzi9n1HIoDPWC4bDZpGsb5whc3WvChACrJsjqoz7eV8a8U2aI/gc2IQ5fhVf3IxX
         9orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0Q2GEHfl4Ob8KlaVM66LrNosy/YM4WsW8okxDG0d70w=;
        b=E5KKpNUWA3FbpE58UZrvyhCnKJ3u0b5biEVTmWt/a2zwe0S9ylIwyva3k5O3ClPddJ
         uraq558p7VOAvNDjCUW1tpH5+sEM+RVUt72I6ZwAhhT7ZPNoOSJe6ACOwCMzj60rkD4s
         LMIaeKtUyUe311fH2dP0m/c1ocPcFi36WHmz1xAeAAZVEJX5SLQDGcK76BwQHkuOXJCd
         6Nui0tsSPbLpesJWqwuscUhb+NVdfPQ7eLAYMAeV+iWqST5HDEVdarVKQbpSD0ZZjivk
         nb9KDk77Z1c7LHFag/b8FIqC/530KTbP8JHYAQbhgiqYeQ1DvQBPBoJAvHMepxCJLaMl
         CYUA==
X-Gm-Message-State: AOAM531CAjQBMwmpJx5ZTa+Ga7i+aWOZ4GlyMECRjhsVK8qwais+hGVP
        9aEiRD2EuVc2ja1uGYANci0cu1iqU+E1yITQqIXsdB5F5TSMxg==
X-Google-Smtp-Source: ABdhPJy8UGQi3kP5iBAN2zd55Q1ny3Foi6VFAOjcS8ZlPINt3kP5TG2/ojv96YroaRRkePXdwFFbkWsWFv1AEXX6FOw=
X-Received: by 2002:a25:d4d0:: with SMTP id m199mr8571624ybf.26.1615913775648;
 Tue, 16 Mar 2021 09:56:15 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 16 Mar 2021 17:56:04 +0100
Message-ID: <CANiq72knS6Rbqyb7R1-sjZN8iv24_hykgv6LmpbNt5s_V-ZhRg@mail.gmail.com>
Subject: Mirror in GitLab
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

I was playing around testing GitLab's "external CI" (i.e. from GitHub
in our case) features, and I took the chance to setup a mirror there
in the same group/namespace:

    https://gitlab.com/Rust-for-Linux/linux

This is useful to have a bit of redundancy and for folks that may want
to fork there and/or use GitLab APIs. It is also nice to get some
extra features, e.g. analytics at
https://gitlab.com/Rust-for-Linux/linux/-/graphs/rust/charts.
Hopefully we will see Rust show up in the graph there soon ;-)

Cheers,
Miguel
