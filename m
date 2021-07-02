Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DF4C11F68
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Jul 2021 11:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B685C61416
	for <rust-for-linux@archiver.kernel.org>; Fri,  2 Jul 2021 11:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhGBLtt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 2 Jul 2021 07:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbhGBLtt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 2 Jul 2021 07:49:49 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E78C061762
        for <rust-for-linux@vger.kernel.org>; Fri,  2 Jul 2021 04:47:17 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id v5so9452798ilo.5
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jul 2021 04:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=txioFWg6OfSlIly/gnQwjp6C/7OavvjvK8g8vmWX4F1YnqUhNpKEtNrROEfvOrK61D
         8JKBg/VPA6QFVKSn82Teih6QK156Pz8Ap7UYZ2fse8i88vVIlodmbUfXEXuHRV0cKOiO
         CJaQHt+gCuFCDGIUCX5lwKodXMuvqGmBskZLqnsuJzE6Tu2OgBjdXhG0VZBG1wXcJfcc
         +lOgEhCmIXHWcR0nooyN6KhPnBbFvI1CsLQONdAYKhGqNUIXRj8bM/kG/hMs4dVYNP9K
         oD6hvbIn+U1uQE9/IKoOQm+LyDTH7wyaRmBJXYqXFo42z5Z/3ZkbwWUzrt/IRHa/z/fy
         rQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sAOMZh3Hj9zMG5BoGRnAUbkkTSArkSVDCSJpPZl6NYI=;
        b=dRvt3qRPQLYSA6nNhe9FZw/qW6CRft7wVTPlHqhFDAmy8Fc0geTKiOGb7WjDsh3QI+
         20mkcHV1xuykHgZx3rz+71if6muHu+7wWhOjkcSf5pGv5NZdXCtx9Y1r2QI6Y3/VldB0
         UuEzPp+HjylBjG4lNOTGiakFjmhURNFo2W1VPSDfWQFWLT3fbEGVEb973tn8rcJnf3Vk
         Re6TJuKSxPplcP5wbjZtL62wfMzh/m3B8TIt3pCrttIY8WwJ+W9MU4rLaKWWgwaZEY36
         t16Hd4tcqoDtNHXmrdD82iwbux1n/U01aREsC12LnfM80JorSnnt+fEGpBUZEV9NM034
         Sw4w==
X-Gm-Message-State: AOAM5310SA4TGDA4okWFPs5MvvEe5vcLRDK8QPUu9iD2U3/fpu2zlp+q
        Yx/LiXh9fHvTXkr1QayMSTENgAGtJPz5+YgeokaJ5SIdTs30tg==
X-Google-Smtp-Source: ABdhPJyfGnBzk91YdSvQBBNYZ5K7Act6y7sG2YEALdMDfH3/0UX86myzlq3qmv7mRBgzTuPXoFY1oKUUKxBhiHzLd7Y=
X-Received: by 2002:a05:6e02:1d04:: with SMTP id i4mr1484882ila.149.1625226436984;
 Fri, 02 Jul 2021 04:47:16 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 2 Jul 2021 13:47:05 +0200
Message-ID: <CANiq72kx+phuQ5q3gHAfK7TFk_qbMxRoDbqE0NyJ_ZARho0+DA@mail.gmail.com>
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
