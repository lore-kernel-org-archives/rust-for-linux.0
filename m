Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E925FC47080
	for <rust-for-linux@archiver.kernel.org>; Wed,  2 Jun 2021 01:39:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC865613B4
	for <rust-for-linux@archiver.kernel.org>; Wed,  2 Jun 2021 01:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbhFBBlM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 1 Jun 2021 21:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhFBBlL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 1 Jun 2021 21:41:11 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE06C061574
        for <rust-for-linux@vger.kernel.org>; Tue,  1 Jun 2021 18:39:27 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id ez19so536575qvb.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Jun 2021 18:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MczkO/vGN40rks67/8PHJZ+O7QBFr72y7hueCuIxRz0=;
        b=i0H967i2Se1Be83smvwVXj2ABRg9m0LBusyK8MD/Jl/zBMxUmEECIz/6lAgcANsdjP
         0yDwRusuzXf4126CZ9wVgsS3JHBhVWYlSDkWP4RDzkdBO3On0zem3hFSgNcUG2pDJBp3
         E9n3jZZj/2VZS10a8XsmDFYG2bd6t8/eJQDbt/Tkf+tCxyHtLmW3oF2kxOpQZtRt7KSb
         ICWLvIbIgpjuW0fiSkNXqYOsR0eoq5lxxmDK/fpEuYM5VQzxTIc3bakfuPDgd4c++ruB
         jRIx6N1JPeP/vRhGZinW5q4YMv7k4y4vlZNsWoHDE+9GJyhYywp1V8eh/9kCKAq5Jz/C
         l/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MczkO/vGN40rks67/8PHJZ+O7QBFr72y7hueCuIxRz0=;
        b=SIKNM+1CLaxc4//X9uA2mxrhH7wcuiNtfMyb7sU0BW6tohgAirx6caUG/wmqlnZW3L
         B2kHW5bTcVxokMQuf1H80DooaFA6ikJoP3xdKWLG5hEc2bkWTue9XRtOzKHf0pFaoNF6
         JrWhP40/wQ0Sv7rEwHjLMJ2VxWc05Yd37IZ2xZf39Fcmw3T6cjrnqH6uCeVUL9TDaMTx
         ojQGpOXVdQIWFn755SRR3hnFY8TV2TELW8XW8498A+PAH1OA71AWKeK4WyXqczTpeM//
         Fv36yAuuNmUXu8rOGzVOdOYEYXf5Sc1iuzXF3Pt+8lHNYR+W7RA+VtlzFocpNe5ddzjv
         WAig==
X-Gm-Message-State: AOAM53396ZtkQG1tdU9JVwAxC9ThpF+BNk2RahZft4/bDLSu5b9azjbB
        PGXN0Gstj1d1qnUqFF6zQGDUTMvHkiEhC4JfEXM=
X-Google-Smtp-Source: ABdhPJxmkkgA1XPo3K3BEpOlHB7QzmzpWRH+JSkj8hODH3f4bDQXbqVB6HJlwM885Qze3Ht+xLaIkEfkfq4CCTi8gXg=
X-Received: by 2002:ad4:5f87:: with SMTP id jp7mr25965040qvb.46.1622597966891;
 Tue, 01 Jun 2021 18:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <CABDqbH3s6Xr-5xhxAYyTt44w16A-Sq8sK7wgvxJuyDgg8+bWXg@mail.gmail.com>
 <CANiq72kxfZt9A_ky_UMK+Un5HRVFng8-_yBgw3W4cwjLx+St5g@mail.gmail.com>
 <CABDqbH2oji4Vh+u3Qp+P2h3yScX5Qi3cLsdF9Z_D8871FKD_iw@mail.gmail.com> <CANiq72kXKFRGzP-=nWfiOk8Lq6TRjY2hmFS6PDomk6SsdaQagw@mail.gmail.com>
In-Reply-To: <CANiq72kXKFRGzP-=nWfiOk8Lq6TRjY2hmFS6PDomk6SsdaQagw@mail.gmail.com>
From:   Douglas Su <d0u9.su@gmail.com>
Date:   Wed, 2 Jun 2021 09:39:14 +0800
Message-ID: <CABDqbH1h8jCRKRqQwfpC_U2th8pvoGsagzMUfg629ZVCEk6BrQ@mail.gmail.com>
Subject: Re: Contribute documentation
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Note that you replied only to me so others did not see your reply! You
> need to use "Reply to All" so that your message is seen by all the
> mailing list :-)
>
> Also, please do not feel discouraged by what I said. I think having a
> book like the Rust ones (like the rustc dev guide book) would be great
> when the project grows, and I am sure a lot of people will appreciate
> it. I was trying to point out things that would perhaps need to change
> a bit etc.
>
> Cheers,
> Miguel

Thanks for your response.

Cheers,
Douglas
