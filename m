Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D62DC433F5
	for <rust-for-linux@archiver.kernel.org>; Fri, 22 Oct 2021 19:17:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42DF5610A4
	for <rust-for-linux@archiver.kernel.org>; Fri, 22 Oct 2021 19:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbhJVTUE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 22 Oct 2021 15:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbhJVTUE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 22 Oct 2021 15:20:04 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDC9C061764
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Oct 2021 12:17:46 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id a8so5355418ilj.10
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Oct 2021 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ulfGQ2/OGrqGipqel6m6LOJoxfozQy2WBLXzVVjKVk=;
        b=KTSH8Ohq457rEcX4C44PrrMtyp9RxRaqBMzxJ5RT0Spt9UFdiXHVHobPRJB6/nk1ZA
         fBPGckAtfDag1GWwMauYOzdtkHIfUF8xDjfsi2RXz7vVs9/SXBK/Pyjum6DHYnsElhTL
         jfbaQs3Ofs8i5hhuE3O+J4xZdbaPCaRKaodJ9rvYzd1cf/0+1Yom9gyRF2UXT62HzgKJ
         UkMzlH+MMDjlK3JcowugGiOI3cV0KFbuoUkuAoxFcztM2Q/EeU94UYcift05qdVaeyvA
         6I4HrmvXRmX4rbrP6eGTLvd6MALZGCZ+DOMgpMxfVlBxMOfAoYfdz+xT3LpvAr/lYJFE
         zY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ulfGQ2/OGrqGipqel6m6LOJoxfozQy2WBLXzVVjKVk=;
        b=ax7ABKWFJTcyFcelJFvD3xp59GPY08fTi0JEuYUngtY3PeghfLynPtSwV4pk7MPOFT
         wU9C5PuVXtBgTCP3Q0jku7HFnE2xS9ivbIAo2rTcYgxsXwJBMwXpSRVHdfT7SCwD3Azm
         ZqodeSfKQPWj6Psfx2wGpt7eriz0f6dGCgrb0Ny8+xabdVzkg65ldFbDg07myibG90nT
         15GiRAitCxOfMeirIwZRo1gEidlhJS2yXCfqBNyziO2g3sgimlhxEI4as6PYm3+xxvPT
         YCOAmFgwFok/CCrnKU+rXpGj8rB8D/xLK9CVnelOTnOqC9ly1XveYfKg9Jj4WeF7TpxA
         jv+A==
X-Gm-Message-State: AOAM531aY2qjk0JcofoRUNk4ASiH6NlFzForMOnFynEKOUo3kIj7+9c8
        W8vRDICCKRodrX6bMvhZ/xc03qlin3hMENB9kJI=
X-Google-Smtp-Source: ABdhPJyenFxwGXE6Wz4YRDDU8A8qC82SM/5u+dRqtaR3UY7OGvQPr1VVXhsqIanJGlrmN/Vxiy1tkPXBU7VHVl5zZ0c=
X-Received: by 2002:a05:6e02:1543:: with SMTP id j3mr1127059ilu.151.1634930266149;
 Fri, 22 Oct 2021 12:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net> <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
 <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72m76-nRDNAceEqUmC_k75FZj+OZr1_HSFUdksysWgCsCA@mail.gmail.com>
 <20211009234834.GX880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72=uPFMbp+270O5zTS7vb8xJLNYvYXdyx2Xsz5+3-JATLw@mail.gmail.com>
 <20211011185234.GH880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72k+wa8bkxzcaRUSAee2btOy04uqLLnwY_AsBfd2RBhOxw@mail.gmail.com>
 <20211013232939.GW880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211013232939.GW880162@paulmck-ThinkPad-P17-Gen-1>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 22 Oct 2021 21:17:34 +0200
Message-ID: <CANiq72m=MV2rF=SHKfrAi+E0vwEpKemeO_48h10=tvejJ_mAPw@mail.gmail.com>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Oct 14, 2021 at 1:29 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> So Rust could support zombie pointers without changes to LLVM?

I don't know what you mean "without changes". LLVM is not fixed, it
changes every version, and Rust sometimes has to patch it on top. If
Rust decides to support (or not) zombie pointers, then they will have
to look for a way to lower code in the given version/instance of LLVM
they are using in a way that does not break the zap-susceptible
algorithms. That may require new features for the IR, or disabling
certain optimizations, or fixing bugs, etc.

> The standard is for the most part not a mathematical document.  So many
> parts of it can only be "understood in a personal capacity".

Sure, but there is a middle-ground between a formal model and
completely unstated semantics where nobody can even guess the
intention. My point was that we should not rely on semantics that are
not precise yet -- if possible. And if the same problem happens in C,
but we have a workaround for it, we should not be rewriting those
algorithms in Rust.

> To be proven in the context of the Linux kernel.  And I am happy to
> provide at least a little help with the experiment.

I was talking about classes of errors that are avoided "just" by using
the language. For instance, using `Result` instead of hoping users to
get the error encoding right even across maintenance rounds.

> Working on it in the case of C/C++, though quite a bit more slowly
> than I would like.

In my case I am trying to see if WG14 would be interested in adding
Rust-like features to C, but even if everyone agreed, it would take a
very long time, indeed.

> However...
>
> Just to get you an idea of the timeframe, the C++ committee requested
> an RCU proposal from me in 2014.  It took about four years to exchange
> sufficient C++ and RCU knowledge to come to agreement on what a C++
> RCU API would even look like.  The subsequent three years of delay were
> due to bottlenecks in the standardization process.  Only this year were
> hazard pointers and RCU voted into a Technical Specification, which has
> since been drafted by Michael Wong, Maged Michael (who of course did the
> hazard pointers section), and myself.  The earliest possible International
> Standard release date is 2026, with 2029 perhaps being more likely.
>
> Let's be optimistic and assume 2026.  That would be 12 years elapsed time.
>
> Now, the USA Social Security actuarial tables [1] give me about a 77%
> chance of living another 12 years, never mind the small matter of
> remaining vigorous enough to participate in the standards process.
> Therefore, there is only so much more that I will doing in this space.
>
> Apologies for bringing up what might seem to be a rather morbid point,
> but there really are sharp limits here.  ;-)

I feel you, I have also experienced it (to a much lesser degree, though).

I could even see similar work for Rust going in faster than in C++
even if you started today ;-)

Cheers,
Miguel
