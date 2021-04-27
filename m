Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5342AC433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:04:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0978F60FDA
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 10:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbhD0KFV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 06:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235181AbhD0KFS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 06:05:18 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E0DC061574
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 03:04:29 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id s9so10294122ybe.5
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 03:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ud78MP3l9EfJ6CDGwe5xsZLmv7Ih1zITPVvM6+t6VCU=;
        b=SJNE0UANaAV8UL076nu71s0JhhtjztkigNNj3BFoD5IuJcz/H3p14R4xarg7lQ2XPd
         yUgKJYkEXcLL/Vgb7w9Z8mH08ixC+KkEWg3kjYhLBe69Iz03+APMqHSyoXwTDipEW38o
         9x8GDQGe2Au6QOdKaujlcE4Y/NZFmilk4z/DWZQeQPPJDXFOdjeL1+F04jyxWX2Ugjjr
         N765CMAyui2S34D1dfxLHC9ubM3MJ2ooxOBY+xa1KkhD6NH5ORB5+cfGwPj9qlroxW0l
         XuwgmwZk5gUlkj2FNachhHXtLBs8tJzUePGre7LUMZ4MXCS5rtRL664Gm0QQV9SiedzZ
         OCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ud78MP3l9EfJ6CDGwe5xsZLmv7Ih1zITPVvM6+t6VCU=;
        b=ZEAAr5FYPHQRU9fWR+X/BUuvPXY7BGUShfPDkPUShOhi3Mt2nehXXHUI4zGWwnVHUp
         SzgkSZhaAGydneE1oR95KJRaxlwaPIHoY0ncfhS+Qg6IL68/GhBEOvKl4bubVIPgCLX1
         K5U4q/uyRymmERbOIidS8sqKozIV/s2qOc7Pgvd4w9/HnwjfkRrMTgIb/frAZraFw2Yg
         Vk84lmDVsrbF6Tt/lG8TLUAydHAIy2qNhWP7sMyYvmedxf90QZ7Kd3oHBYqktdSwN/1F
         Xdhi5LgH93tQE5nGwikdjG3+YpSUkBonuURRQv17/I86KFUzFbycSGWoPeFs11yMbElW
         WcwQ==
X-Gm-Message-State: AOAM530EfibjXSlCGME2c49s4KJxlxs/i11tUsp7Du4uFf6uuMELoCBP
        z6npBIq2e7vaVuGBkF13oHEf9VoaTc4MIXooQrtuuDK8l+pR2Rz5
X-Google-Smtp-Source: ABdhPJyVYNQNHnIJdGFcIRkVgONpja8M9RoPzAQ8+SsYP+/BoIpz1CYsrZc0q809F8MAjZFEoPADyhDbQpBt0cHUBkk=
X-Received: by 2002:a25:6b0b:: with SMTP id g11mr401394ybc.135.1619517868966;
 Tue, 27 Apr 2021 03:04:28 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 27 Apr 2021 12:04:18 +0200
Message-ID: <CANiq72mFxBi9pwh-pr_LgqNBcOFaZ5-LKXwWTB0j4V2kuW+ouw@mail.gmail.com>
Subject: Next call on 2021-05-08
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

As mentioned in the last meeting, we will have another call 2 weeks
from the last one, same time: 2021-05-08 18:00 UTC.

As usual, anybody is welcome to join. The meetings take place on
Google Meet. The invitation link will be sent later on to those
interested.

Cheers,
Miguel
