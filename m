Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C15C433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 21:20:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95CA7611EE
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 21:20:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhDSVU5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 17:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhDSVU5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 17:20:57 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A5DC06174A
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 14:20:25 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x19so27828249lfa.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IWQAMmG2LrrHdqrgjtyB4Rz5aC7DrTd+8dtuGkxYgl0=;
        b=jOdwizm9oBKH5CwBuo06Ba6clU6E4MPus2PrwjmTMC/cDWdwR6B2RjAha/BWseB1Xz
         chKt/tUh/D+YLv6aSrfAOeE9g/JRE0uH78trJKj4t7RRsjtYed2usBrCpWajHxKy4Ndx
         NSkqkWdafIk1NXqp3v87T28uicz/vm4xFqs83hC/V0kNMF7ToP5IbD/STm83sfv3/G/y
         Hg3J54RXHp0VEgfiuR1El9IwIGtOzVTvyRikgpNakOgWfKaceDwlppaly3J/IJFQkit3
         2qsDnuihmyi2vP5oT2yEDEqz3tlXtT7IBpYn1uYuefKOC5qe1J4MCu+oB+KY2wjBSHGZ
         x5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IWQAMmG2LrrHdqrgjtyB4Rz5aC7DrTd+8dtuGkxYgl0=;
        b=G/UAGUYtBeUEOGIQir5I8UQIR5xo6Yi5SvfDSpGEaarwltwKV4ZPT/ykcpMOBgk3qr
         KMmZDTunTsbo3qaXrPXdC9vyeLsmg7djSd7N+NyvY8U2USnocT4PYSXhb/y0NEv/Du71
         6LU21zWCiyP31jTdAKR92Gr0vLdQ4luoI2m0DTwx6DPfs5Y1vm6gcyEFfOY+4zkaIdXU
         LglirU+lbIgNvvub3QPO58ZH92x4Curot1za0Ym2UbuIBVMnGppoO20TPhPlsGcI6E70
         uh0/h0mgbF45YYOTlJevd5/pYHT5KouIqOs1IoD2+EF+8a3QaTDfYpuYfUw9YxqTNXof
         msFw==
X-Gm-Message-State: AOAM532RhPmIFWfqdyQ1v0DdjHD5UqpMMPrdLw+YgsxzfA1oaXby+510
        R8dxf3LqOoEprNj4TMqpoCg09Qyby3K83I2AmZaiBw==
X-Google-Smtp-Source: ABdhPJzAIABUF1QOQ0nd3fNJYnebjfj1E1tsFER+ZR0dNuTjDmoTLhl7F0lzDuwlPS46ZcpYkSU0lhJUV1YaCByZPXc=
X-Received: by 2002:ac2:46ed:: with SMTP id q13mr13459689lfo.543.1618867224109;
 Mon, 19 Apr 2021 14:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
 <YH3rUsLYFF0VefDR@localhost>
In-Reply-To: <YH3rUsLYFF0VefDR@localhost>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 19 Apr 2021 14:20:11 -0700
Message-ID: <CAKwvOdmLkt8LUCikPGdh0PSSw3SHGRpSQ2tZS92HMcca6i4dqw@mail.gmail.com>
Subject: Re: Poll for call
To:     Josh Triplett <josh@joshtriplett.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 19, 2021 at 1:43 PM Josh Triplett <josh@joshtriplett.org> wrote:
>
> Either day works for me, and I'd love to join.
>
> Linux Plumbers Conference and Kernel Summit are coming up. I'd like to
> propose a "What Does the Kernel Need from Rust?" session, with my lang
> and libs hats on.
>
> I'd also love to talk about the recent LKML thread, and the plans for a
> custom alloc crate vs reusing the Rust alloc crate.

I have a microconf proposal for "Toolchains and Kernel MC" (similar to
last year) that I'm waiting to hear back on.  It would be nice if you
could hold that proposal for that MC, rather than the general
"Refereed-track."


>
> On Mon, Apr 19, 2021 at 06:14:56PM +0200, Miguel Ojeda wrote:
> > Hi all,
> >
> > Now that some days have passed since the RFC, let's have one of our calls.
> >
> > I propose next weekend Saturday 24th or Sunday 25th at 18:00 UTC like
> > as usual (EU evening / US afternoon). Please let me know which day you
> > prefer, if any.
> >
> > As usual, anybody is welcome to join. The meetings take place on
> > Google Meet. The invitation link will be sent later on to those
> > interested.
> >
> > Cheers,
> > Miguel



-- 
Thanks,
~Nick Desaulniers
