Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB94C433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 16:07:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01B19610FB
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 16:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbhJMQJL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 13 Oct 2021 12:09:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:57780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229514AbhJMQJK (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 13 Oct 2021 12:09:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E47460EE9;
        Wed, 13 Oct 2021 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634141227;
        bh=VdZeZhWuuOBfc6UTS0g3w7QyMJ8taUZ6LXpTC9W6orI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=bxE7Qb4CVxjcYubj+wK5hQaSI3iQMQlooFv8cXvNEJFMRbh1zmOu4yr41ddPNuOFV
         RJNvx2ecmCLqLGk+WWy3BwwWjsawRmnXRwBA9vrZID+zZOZGUVqyr502fCyVREQh1s
         muonMLpDo1xtbZjeSRNhPhaGGjo+i9SEOd4wtewSZQrg5VpMOIDI4T5LaaZBHKSYOe
         pyd+gUylaC567keHM8paxC1Ihf+sl8CGgppGv4Nk+sWTCg+fGROVjHo5Q1dr441F1m
         syW/9ERwWKN+Vwmb9ZeklnJO0HmXYYq3AgBbi2Oo+V95w0zTxj7rKCT3XH80x1zmpg
         IlNduztclLB6A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 6EB3A5C0687; Wed, 13 Oct 2021 09:07:07 -0700 (PDT)
Date:   Wed, 13 Oct 2021 09:07:07 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211013160707.GR880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008005958.0000125d@garyguo.net>
 <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
 <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nGX6bgwDuVMX3nGUfs_UQB1ikOBHE-Q74nEaJ2Stx_2w@mail.gmail.com>
 <20211009235906.GY880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mj9x7a4mfzJo+pY8HOXAshqfhyEJMjs7F+qS-rJaaCeA@mail.gmail.com>
 <20211011190104.GI880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72ny0RCnO1+E_wBgx0C6NCaMfv82rvkLVuwmW8Y+7Kii0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72ny0RCnO1+E_wBgx0C6NCaMfv82rvkLVuwmW8Y+7Kii0Q@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Oct 13, 2021 at 01:48:13PM +0200, Miguel Ojeda wrote:
> On Mon, Oct 11, 2021 at 9:01 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > The main issue I was calling out was not justifying Rust, but rather
> > making sure that the exact same build could be reproduced a decade later.
> 
> Yes, but that is quite trivial compared to other issues I was
> mentioning like adapting and requalifying a testing tool. For
> instance, if you already had a team maintaining the configuration
> management (i.e. the versions etc.), adding one more tool is not a big
> deal.

OK, close enough to fair enough.  ;-)

> > There are things that concurrent software would like to do that are
> > made quite inconvenient due to large numbers of existing optimizations
> > in the various compiler backends.  Yes, we have workarounds.  But I
> > do not see how Rust is going to help with these inconveniences.
> 
> Sure, but C UB is unrelated to Rust UB. Thus, if you think it would be
> valuable to be able to express particular algorithms in unsafe Rust,
> then I would contact the Rust teams to let them know your needs --
> perhaps we end up with something way better than C for that use case!

Sequence locks and RCU do seem to be posing some challenges.  I suppose
this should not be too much of a surprise, given that there are people who
have been in the Rust community for a long time who do understand both.
If it were easy, they would have already come up with a solution.

So the trick is to stage things so as to allow people time to work on
these sorts of issues.

> In any case, Rust does not necessarily need to help there. What is
> important is whether Rust helps writing the majority of the kernel
> code. If we need to call into C or use inline assembly for certain
> bits -- so be it.
> 
> > But to be fair, much again depends on exactly where Rust is to be applied
> > in the kernel.  If a given Linux-kernel feature is not used where Rust
> > needs to be applied, then there is no need to solve the corresponding
> > issues.
> 
> Exactly.

Thank you for bearing with me.

I will respond to your other email later,.  but the focus on memory
safety in particular instead of undefined behavior in general does help
me quite a bit.

My next step is to create a "TL;DR: Memory-Model Recommendations" post
that is more specific, with both short-term ("do what is easy") and
long-term suggestions.

							Thanx, Paul
