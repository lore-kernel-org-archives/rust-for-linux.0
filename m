Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396E7C433EF
	for <rust-for-linux@archiver.kernel.org>; Fri, 22 Oct 2021 20:34:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 075126112F
	for <rust-for-linux@archiver.kernel.org>; Fri, 22 Oct 2021 20:34:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhJVUhG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 22 Oct 2021 16:37:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:37340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232411AbhJVUhG (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 22 Oct 2021 16:37:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B69A61059;
        Fri, 22 Oct 2021 20:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634934888;
        bh=gQYlGkJdhB/fmP2FkjPmFpnU/E/Aed9Y0ICUH3/IOPQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hOcAlJzSWalqMIirPt6GF6M5jT1tqD5ys7O1QVfLoC7qhqycHlY7/k63soVb0GAzu
         KPB/k2S/BUKIbAHmbi3lhipVYJ5srfbbhZDc7UyAcs4j6k2lNzEbpOF086GgkZooQA
         4yIitIrOnQIjK+jdp+jTa52yEkFzh8D7OwWXU5Nq8x0Lb6Pjhv7si+Ud8Gj08vKx4Y
         FKLFNlolnaNpNjl2+ytwSasGQDE+CsGVWgawXRX6JbdDIeZYsXMuZ8G+eSs9JvgRgR
         Gg8sJkyVhaCfUuRjbfnqVV+OgYfM/2woAhOX+I6SVJu7e5bqPjXHUhAztrzcI3y86e
         glpE7MhLPj0PQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 47C635C0BF4; Fri, 22 Oct 2021 13:34:48 -0700 (PDT)
Date:   Fri, 22 Oct 2021 13:34:48 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211022203448.GC880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
 <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72m76-nRDNAceEqUmC_k75FZj+OZr1_HSFUdksysWgCsCA@mail.gmail.com>
 <20211009234834.GX880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72=uPFMbp+270O5zTS7vb8xJLNYvYXdyx2Xsz5+3-JATLw@mail.gmail.com>
 <20211011185234.GH880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72k+wa8bkxzcaRUSAee2btOy04uqLLnwY_AsBfd2RBhOxw@mail.gmail.com>
 <20211013232939.GW880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72m=MV2rF=SHKfrAi+E0vwEpKemeO_48h10=tvejJ_mAPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72m=MV2rF=SHKfrAi+E0vwEpKemeO_48h10=tvejJ_mAPw@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Oct 22, 2021 at 09:17:34PM +0200, Miguel Ojeda wrote:
> On Thu, Oct 14, 2021 at 1:29 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > So Rust could support zombie pointers without changes to LLVM?
> 
> I don't know what you mean "without changes". LLVM is not fixed, it
> changes every version, and Rust sometimes has to patch it on top. If
> Rust decides to support (or not) zombie pointers, then they will have
> to look for a way to lower code in the given version/instance of LLVM
> they are using in a way that does not break the zap-susceptible
> algorithms. That may require new features for the IR, or disabling
> certain optimizations, or fixing bugs, etc.

And we do have some people working on these fixes in the LLVM backend,
but it may take some time.

> > The standard is for the most part not a mathematical document.  So many
> > parts of it can only be "understood in a personal capacity".
> 
> Sure, but there is a middle-ground between a formal model and
> completely unstated semantics where nobody can even guess the
> intention. My point was that we should not rely on semantics that are
> not precise yet -- if possible. And if the same problem happens in C,
> but we have a workaround for it, we should not be rewriting those
> algorithms in Rust.

Me, I don't have a choice.  To get my job done, I am required to use
things that the standards do not define very well, if at all.

And this is true of any large project.  And also part of the reason that
Rust has unsafe mode.

But yes, in many cases, informal definitions are better than no
definitions.  And I agree that it is possible to reason informally.
After all, the formal definitions of RCU didn't show up until RCU had
some decades of use in production.  ;-)

> > To be proven in the context of the Linux kernel.  And I am happy to
> > provide at least a little help with the experiment.
> 
> I was talking about classes of errors that are avoided "just" by using
> the language. For instance, using `Result` instead of hoping users to
> get the error encoding right even across maintenance rounds.

OK, I have to ask and I apologize in advance, but...

...have you taken courses in statistics and in experiment design?

> > Working on it in the case of C/C++, though quite a bit more slowly
> > than I would like.
> 
> In my case I am trying to see if WG14 would be interested in adding
> Rust-like features to C, but even if everyone agreed, it would take a
> very long time, indeed.

I know that feeling.

And to be fair, everyone would have been better off had C and C++ been
slower to adopt memory_order_consume.  (Another thing being worked on.)

> > However...
> >
> > Just to get you an idea of the timeframe, the C++ committee requested
> > an RCU proposal from me in 2014.  It took about four years to exchange
> > sufficient C++ and RCU knowledge to come to agreement on what a C++
> > RCU API would even look like.  The subsequent three years of delay were
> > due to bottlenecks in the standardization process.  Only this year were
> > hazard pointers and RCU voted into a Technical Specification, which has
> > since been drafted by Michael Wong, Maged Michael (who of course did the
> > hazard pointers section), and myself.  The earliest possible International
> > Standard release date is 2026, with 2029 perhaps being more likely.
> >
> > Let's be optimistic and assume 2026.  That would be 12 years elapsed time.
> >
> > Now, the USA Social Security actuarial tables [1] give me about a 77%
> > chance of living another 12 years, never mind the small matter of
> > remaining vigorous enough to participate in the standards process.
> > Therefore, there is only so much more that I will doing in this space.
> >
> > Apologies for bringing up what might seem to be a rather morbid point,
> > but there really are sharp limits here.  ;-)
> 
> I feel you, I have also experienced it (to a much lesser degree, though).
> 
> I could even see similar work for Rust going in faster than in C++
> even if you started today ;-)

For RCU in Rust, there would first be much need for the Rust community
to learn more about RCU and for me to learn more about Rust.  As noted
earlier, my next step is to better document RCU's wide range of use cases.

And I know (and appreciate) that some in the Rust community have read
my open-source book on concurrency, but I suspect that quite a few more
could benefit from doing so.  ;-)

							Thanx, Paul
