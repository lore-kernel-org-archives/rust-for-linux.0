Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09966C433E9
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Jan 2021 14:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC592233FB
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Jan 2021 14:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbhAMOKQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 13 Jan 2021 09:10:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbhAMOKP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 13 Jan 2021 09:10:15 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618E6C061575
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Jan 2021 06:09:35 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id q7so1572115pgm.5
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Jan 2021 06:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U7GmkxRnnammeE7RzbnQTncpXVO7iwKex6TaPE/tUVU=;
        b=Yg3CfW00YveCSJAs/bY6ykMOVlDmnd9iDpW3UsPGKyLKuX0o9e0TAoWgxHCmBXxmdU
         y/GSH54p+MsAS/CFM6yi/NciEE8fbp/T+Cu//Q7gltu/PzgrM55ezoGDg7QmG3cE7zD3
         SITJzzo/Jj0uRToXGmhDd42rKFDDkZrzP4lunvIHswfntx2JYk4UjH6ATKw3os7DA32v
         mbHALycvQZkmciUMXFdZFW3stIPwi9fKnn6X8fvF9JzjO1xKIKuiiaUmbwVHC1FijnbW
         mtAEbOzsKnQSVPzm63ZvGxezqn6B/loIb+OM6YE/AvW6orLOBH8wgTP/BJ1OCxU18gZX
         Omgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U7GmkxRnnammeE7RzbnQTncpXVO7iwKex6TaPE/tUVU=;
        b=M9c/IUYlwI0OmmZ/C18Ho+Q2yewLGLMtiLjhO2QLBmNHzm0pLxrwf/jpfUecCu1Ris
         UhacrHkg+ZgDNrS7bP6NU7SMck74+3iAvXc7YZNwSFp0AY5KDtaRM+fGP0qKtA+NruLb
         CoqvVna8zBzcD8+JbkjRQQhxcuiUyJXB43HAZXuKvQFb/ctW7jMqYetqSOrkxkwuN2GI
         ymb8zLQPx+chCtYsMzqAB75nH8cBJYVlzgQ07iEw0++l9rLCMa05ctTZ+PWLulN7IcPR
         DWi3THNhlebnM0q5JmchKg9F0g62PalM0fSWa1wfBAtQlvw3R3qN1VEpQWSMPMehhUtc
         LrIw==
X-Gm-Message-State: AOAM533FR+m+2sa8RkFM2YBNoojhboWjEg5v6GYePwxxL/gQmO6dq/xZ
        jdpUtCgcxCAHVYxhhngZOpuTy1PdqLHpVr1eJchj4+XwOf0=
X-Google-Smtp-Source: ABdhPJwrGIDYN00NOiKqZOifk2fKf2D97AYTtssdZut07f5vkUGGJUqiIOidBxsiUNy/hB9+yU6ELXkpmZw/r8AXC5s=
X-Received: by 2002:a62:78ca:0:b029:19d:ce86:fc22 with SMTP id
 t193-20020a6278ca0000b029019dce86fc22mr2334007pfc.39.1610546974932; Wed, 13
 Jan 2021 06:09:34 -0800 (PST)
MIME-Version: 1.0
References: <CAFRnB2U0gpaoGxTM132bRKCTHyxCZz4fLqBZtsfmRq+6Nj28=Q@mail.gmail.com>
 <CANiq72=Xh9vSf-pRFOZ73qqhZ9ushKfM1ei-0TqYxNfLyHJmow@mail.gmail.com>
In-Reply-To: <CANiq72=Xh9vSf-pRFOZ73qqhZ9ushKfM1ei-0TqYxNfLyHJmow@mail.gmail.com>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Wed, 13 Jan 2021 09:09:22 -0500
Message-ID: <CAFRnB2XcWKrPCBo04iVr9Z4xNvjMw8pFmqCkqB_xsaZJKc_CCw@mail.gmail.com>
Subject: Re: Upstream Milestone
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I'm not quite sure how I missed the label... this milestone is clearly
duplicative, I'll remove it. I'll see if I can do something with the
labels to make them stick out more so I don't miss them!

Alex

On Wed, Jan 13, 2021 at 12:20 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jan 13, 2021 at 3:42 AM Alex Gaynor <alex.gaynor@gmail.com> wrote:
> >
> > I wanted to flag for folks that I've created a milestone for us to
> > track things issues and PRs that we think "absolutely must be
> > completed before this can be submitted to upstream":
> > https://github.com/Rust-for-Linux/linux/milestones?with_issues=no
>
> Initially I did setup a couple milestones and played around with them,
> as well as with "Projects", but then after playing with things around,
> I found labels easier to manage and more powerful than milestones
> (colors, several "categories", several "states" per category, complex
> filtering, etc.).
>
> So, for instance, for the "priority" category, we have "required" and
> "optional", but one can add more states if needed (e.g. "TBD", "very
> low", etc.). To get the equivalent of a "milestone view", one can
> filter on Label.
>
> I am fine with going back to milestones if there is an advantage, but
> I didn't find it... I am curious what they are good for (perhaps to
> get that warm feeling of reading "we are at 90% completion!" ;-),
> which is basically an arbitrary number given how they work...).
>
> Cheers,
> Miguel



-- 
All that is necessary for evil to succeed is for good people to do nothing.
