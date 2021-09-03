Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E94C433F5
	for <rust-for-linux@archiver.kernel.org>; Fri,  3 Sep 2021 18:52:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C16A460EC0
	for <rust-for-linux@archiver.kernel.org>; Fri,  3 Sep 2021 18:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350603AbhICSxx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 3 Sep 2021 14:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350593AbhICSxw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 3 Sep 2021 14:53:52 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4D1C061575
        for <rust-for-linux@vger.kernel.org>; Fri,  3 Sep 2021 11:52:52 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id h29so6153990ila.2
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Sep 2021 11:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=df+BR6rX65K5sa5z8uA15+gkhW9JdN6IRroG65558/KrSVuBh9OSDlwNyXkXt3teiw
         CNlNfu0JMc9nIDLaKJYhXGR5cxt2fBKtVIeC6+sOclEO5ibyWSZ0YfJLnTAOPIQcuqvJ
         KX4tJL94xfJ/ujssmxS1J0qAsmsB49W4ZLhGxiv6ZX19gJTvOFJoIvZZLmNJMEKags7/
         ztBnX9iF8LEFsS951X8ExdJPJcV4bJ9+drH5zyJrShv60yuW+TM87L6TVl0cdrcYbNDk
         HNPpJ9rIzFBlNLx2w+po8jXqnqAbn+NjbV0K1Uqr0d1/2XXQ3UEaAK2Z9hYSWgz/54uQ
         avww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=Tc6W8d/QCw88h7mBysbCP5m0I2zFzUUscOC5s2j1P00olx0/hymWs9qLTs3DjrFonU
         iH+Jnftk4+L/POOM+tdloN55i0NyGfVax81YNTIxqWviVfttPb8ix+BJfsMfrZZg8fqp
         cHgeKrAgNsgTb62iLzdmS/yHWd6Z2o5BYd3k1VuHflTV33rX6AKMXYVwJykNer33IsDN
         eREm88lTv395zK0YRwNcKBSpBCse1utRglo26GbZhEDS8BOnSWKTe44lHVmbzkLI4m3i
         qIQmMerEp2UBHcVTUeVnKK2waTBV8HQdNQ0mQBZcuaqyhE9kO2dTn+mCX4pcPv6s7wbw
         OU4g==
X-Gm-Message-State: AOAM533gYrT/y9E/mzaZrG54t1IUBYFK4hcLFLllKRGHhB+g5yAfJVZj
        bc2bhFnAF2PrMRGRR+ajta5gxUDZpbTGrCqr6ZPKLvGaYDYdNg==
X-Google-Smtp-Source: ABdhPJw2+ZPjB7VKm41hJr5E5T4vm2qSEOZe3I1I/h74w3qI+pOxLTvO7taK21NR4k0swbMyvUevo12MNC7vmZ2bKgw=
X-Received: by 2002:a92:c0ce:: with SMTP id t14mr301334ilf.72.1630695171968;
 Fri, 03 Sep 2021 11:52:51 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 3 Sep 2021 20:52:41 +0200
Message-ID: <CANiq72mQYB5t4QVmCv07Gkrbe=f1WT-9mU_H4deCeFBCb91sdg@mail.gmail.com>
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
