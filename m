Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6F9C433ED
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 17:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD024611CC
	for <rust-for-linux@archiver.kernel.org>; Sat,  8 May 2021 17:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhEHRRp (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 8 May 2021 13:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhEHRRp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 8 May 2021 13:17:45 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2303C061574
        for <rust-for-linux@vger.kernel.org>; Sat,  8 May 2021 10:16:42 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id l7so16026815ybf.8
        for <rust-for-linux@vger.kernel.org>; Sat, 08 May 2021 10:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=TlXFkmusP6XaV5YwCGVYx0WqbTgBBznF23BhvqvTuZ8=;
        b=amJG/4kuqSvGihNoD2NI0WT3+I8gCW3nCyRHSJh7QXmcP1nb4bR61pkRlh5psPebjG
         K1U7MgIjyRZ7oFp5bvpHL+ozE+AsFILFCtaGfdU41H5mD0qUxoYOiviPKnei0hO4B9B9
         mWjrPRlFgKqFC92Qp7tj2cTC0Qmm2VX6sz8rxsCd4+FTXf61Ynj8N34BqGwQ66IqpOFp
         A8dtCdrOrBAHh6QGMuu8tjNNxUVw2dvhdbbuoaaCCXZi3oHHntYg+gRiCX6FvO2llwKh
         d3dTrodnP/9rBjHKns0/Wt52Gi8o5FLtg9CMT6Q2wvpkmswsVjcGUHMJwAV3Utjg158o
         9Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=TlXFkmusP6XaV5YwCGVYx0WqbTgBBznF23BhvqvTuZ8=;
        b=hJXH88/1PtnYv0EXuBx8JI3bkYHj4ix+1u/txQbFvhrsoMWj5X2B9smZ+sn5rxTgu8
         sv0V8CvXAV0eyng85akIKjt+ZMv8LD5CVB2uhlAiFHJKYQEU71UxDMPI7FG/PYBGmIKe
         O2o/A98FH1iDDlBjBTK8UfJaN+mFeyBtNk7lugRVLxG5+7yW9fsV+uhP/beJW7kpACVf
         0ydEMEXzrv5LkKCgHV5MKYL7nRxCOVXjjUuZ9v0qefUFKW3u14QKKvlLlsf1m/WnFpnP
         5gh7tHnSt5wEURSN6rwxGNuotg2IMMtayRZRsac6t845UQcmUj+xHIaZG8NlcPWurusu
         Gzxg==
X-Gm-Message-State: AOAM530ib4oKXoj1A83qbsaS6qTJmhXuEz3juc9ktTAnEspA+dPD5sXJ
        8qJOtRpU1uumqJTySVmymtGVFhSUohw1iZx5dR7V/TLqLgASFQ==
X-Google-Smtp-Source: ABdhPJzJVDc9iE9ZZbVZ6X0bNKNxBegKcfrprAKkxeXsB7zCABS9E3NnpQsqm/cPR8WM6ldbJoWHAxsAfn1VatMxI+c=
X-Received: by 2002:a25:7909:: with SMTP id u9mr20657042ybc.22.1620494201993;
 Sat, 08 May 2021 10:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mFxBi9pwh-pr_LgqNBcOFaZ5-LKXwWTB0j4V2kuW+ouw@mail.gmail.com>
In-Reply-To: <CANiq72mFxBi9pwh-pr_LgqNBcOFaZ5-LKXwWTB0j4V2kuW+ouw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 8 May 2021 19:16:31 +0200
Message-ID: <CANiq72mjL58ifDWSTfGy62h1an6KcrAb=sfmRhhgy9VN2evb+Q@mail.gmail.com>
Subject: Re: Next call on 2021-05-08
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Apr 27, 2021 at 12:04 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> As mentioned in the last meeting, we will have another call 2 weeks
> from the last one, same time: 2021-05-08 18:00 UTC.
>
> As usual, anybody is welcome to join. The meetings take place on
> Google Meet. The invitation link will be sent later on to those
> interested.

To clarify: for those that attended previous calls, I sent the
invitation some days ago (which ~10 of you accepted/rejected already),
so please use that link to join.

But if you need me to resend it or you didn't receive it, let me know!

See you in a bit!

Cheers,
Miguel
