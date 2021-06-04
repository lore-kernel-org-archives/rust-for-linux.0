Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F12C4708F
	for <rust-for-linux@archiver.kernel.org>; Fri,  4 Jun 2021 06:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1AF2600D3
	for <rust-for-linux@archiver.kernel.org>; Fri,  4 Jun 2021 06:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhFDGQp (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 4 Jun 2021 02:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbhFDGQp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 4 Jun 2021 02:16:45 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE417C06174A
        for <rust-for-linux@vger.kernel.org>; Thu,  3 Jun 2021 23:14:59 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id g38so12144731ybi.12
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Jun 2021 23:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=JS4SY70rYyKPtrDyG6ES4J4e07pux33p0a/ICEUcXfw=;
        b=pvv8VPJPuH5AgM0CZkSNxVdffJ1i/9PS/gASQLap6PqoVB9pTHWj1fQwaND0C3XjL8
         H2lrkcAiS9doKCbKpjmzgIurBtPKRSoHOcaPQPEWSBlHwj2TBM/INt63KpleD0L7x8tC
         AKScsM6Sbxw0S5c8IIZefIAq+eWm0/j9UeYfBAyYTrrX9ItGv1Zji00wHdHwh6kL9Mb0
         UUQJEEBAZLWMcsMpipdwd4dGWlHckReMWLj20FmEqMOLswUKtuPpWs3mxtZCiQmGqBv2
         2LgbjAG9udRqq+Hbhz/3OZPmIwJskgtOQY6iXqsmZYKXHZUyL4Bi9UkmC+PxFsOix2/F
         IWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JS4SY70rYyKPtrDyG6ES4J4e07pux33p0a/ICEUcXfw=;
        b=LdVsFZgPPXa6soq5UkhtropkpwyS5ViiERT1EBd6EXD8qx2wIKt9L8DWzyYeArovBv
         YGmrrQvt5UNYRFBV/9wpFz7JgX2dsbXsoDbfKzk19sIY0sGstSicFbPUR6p/TbtrFiCC
         duSi0dec94iWZpVS/sLIO4XLBmlzFO+VZwBeCfLNO6xIBj89ksiY1XwSyxLzREkKTpFz
         b8wIaYDAGTx93NTuEy3VQ7u5s2+YGTr14BVSzInd5NDkTusuyaLleNPH831Vjq2x3W96
         1+357eqybP04om4D27NrD5E7KXh8TYufeYfXvNrb4u3/0cSQlcNI248WpUjawwEsZfNu
         iwwg==
X-Gm-Message-State: AOAM533Xb14j+H0cqlF03aLN9fFJ3zkHKhFK1qGiLWbEIpAI6IpI2kiA
        jQOx4qvC6e9nEFqmKJWlpjbL20kTtjFS+c6jo4LRqpESk2E=
X-Google-Smtp-Source: ABdhPJzzJRZ0SKGSB/FlbHdmBcKgdv7LXUNb1mOyC1Ntux1vdR4hnyGPiCoUD+sGjqxXpjGTglI2eDME+CanW6gm2rQ=
X-Received: by 2002:a25:d448:: with SMTP id m69mr3087548ybf.422.1622787299077;
 Thu, 03 Jun 2021 23:14:59 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 4 Jun 2021 08:14:48 +0200
Message-ID: <CANiq72nFdHhWF5WuX0VaVpt+K=gB1KXt_J5pJvKqfQJGPU324g@mail.gmail.com>
Subject: Reminder: informal call tomorrow 18:00 UTC
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call tomorrow 18:00 UTC (first Saturday of
each month).

As usual, anybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
