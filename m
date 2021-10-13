Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B205C433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 23:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9073610E5
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 23:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhJMXbn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 13 Oct 2021 19:31:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:36678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229575AbhJMXbn (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 13 Oct 2021 19:31:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94BB360E97;
        Wed, 13 Oct 2021 23:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634167779;
        bh=xbMhy1voxBzvUn3hhVAEpSxxTLUVWdvummFPiLb1lYM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=f0fCeTeW6qafx04wdS3z9a1WkljdTkkyUPMR2dtYw0fx/Ymbaa+dwrYSxIsuNhJy1
         Gyt+NJuSOoyNwvOrLAo4xHnZHIDKjS8yQuT3+0QqReI6UEZv2K+eAkBopP2+l6KJHc
         p61u7XrzbEKfMbJCbV8dMEwmeGBgUnJqMs8sEufpLI7RGsqPUIjYfZeOh4aeAoIBnZ
         pkXA9kP0m1aFsdKmB/3hyCrQgZh+ECjPvM+O3AIxZWVHVKcWcEzlZS4m6cLR9qwCAQ
         +ZJfmpdsE7roHOvTsdzvdvPJ9xefW8q0dT4eD/qputiuyXnXJ7sgpof24AZZUQDZUV
         tiZ6jBckGvZvw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 66D675C14F7; Wed, 13 Oct 2021 16:29:39 -0700 (PDT)
Date:   Wed, 13 Oct 2021 16:29:39 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211013232939.GW880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
 <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72m76-nRDNAceEqUmC_k75FZj+OZr1_HSFUdksysWgCsCA@mail.gmail.com>
 <20211009234834.GX880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72=uPFMbp+270O5zTS7vb8xJLNYvYXdyx2Xsz5+3-JATLw@mail.gmail.com>
 <20211011185234.GH880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72k+wa8bkxzcaRUSAee2btOy04uqLLnwY_AsBfd2RBhOxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72k+wa8bkxzcaRUSAee2btOy04uqLLnwY_AsBfd2RBhOxw@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Oct 13, 2021 at 01:47:34PM +0200, Miguel Ojeda wrote:
> On Mon, Oct 11, 2021 at 8:52 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > I am sorry, but I have personally witnessed way way too many compiler
> > writers gleefully talk about breaking user programs.
> 
> Sure, and I just said that even if compiler writers disregarded their
> users, they are not completely free to do whatever they want.

Here is hoping!  Me, I have been pointing out to them the possible
consequences of breaking certain programs.  ;-)

I am responding to a very few points, but your point about memory safety
in particular rather than undefined behavior in general simplifies things.
Which makes most of the discussion, entertaining though it was, less
relevant to the problem at hand.

Not that my silence on the remaining points should be in any way
interpreted as agreement, mind you!  ;-)

> > And yes, I am working to try to provide the standards with safe ways to
> > implement any number of long-standing concurrent algorithms.  And more
> > than a few sequential algorithms.  It is slow going.  Compiler writers are
> > quite protective of not just current UB, but any prospects for future UB.
> 
> I am aware of that -- I am in WG14 and the UBSG, and some folks there
> want to change the definition of UB altogether to prevent exactly the
> sort of issues you worry about.
> 
> But, again, this is a different matter, and it does not impact Rust.
> 
> > Adducing new classes of UB from the standard means that there will be
> > classes of UB that the Rust compiler doesn't handle.  Optimizations in
> > the common compiler backends could then break existing Rust programs.
> 
> No, that is conflating different layers. The Rust compiler does not
> "handle classes of UB" from the C or C++ standards. LLVM, the main
> backend in rustc, defines some semantics and optimizes according to
> those. Rust lowers to LLVM, not to C.

So Rust could support zombie pointers without changes to LLVM?

> Now, sure, somebody may break LLVM with any given change, including
> changes that are intended to be used by a particular language. But
> that is arguing about accidents and it can happen in every direction,
> not just C to Rust (e.g. Rust made LLVM fix bugs in `noalias` -- those
> changes could have broken the C and C++ compilers). If you follow that
> logic, then compilers should never use a common backend. Including
> between C and C++.
> 
> Furthermore, the Rust compiler does not randomly pick a LLVM version
> found in your system. Each release internally uses a given LLVM
> instance. So you can see the Rust compiler as monolithic, not
> "sharing" the backend. Therefore, even if LLVM has a particular bug
> somewhere, the Rust frontend can either fix that in their copy (they
> patch LLVM at times) or avoid generating the input that breaks LLVM
> (they did it for `noalias`).
> 
> But, again, this applies to any change to LLVM, UB-related or not. I
> don't see how or why this is related to Rust in particular.
> 
> > Or you rely on semantics that appear to be clear to you right now, but
> > that someone comes up with another interpretation for later.  And that
> > other interpretation opens the door for unanticipated-by-Rust classes
> > of UB.
> 
> When I say "subtle semantics that may not be clear yet", I mean that
> they are not explicitly delimited by the language; not as in
> "understood in a personal capacity".

The standard is for the most part not a mathematical document.  So many
parts of it can only be "understood in a personal capacity".

> If we really want to use `unsafe` code with unclear semantics, we have
> several options:
> 
>   - Ask upstream Rust about it, so that it can be clearly encoded /
> clarified in the reference etc.
> 
>   - Do it, but ensure we create an issue in upstream Rust + ideally we
> have a test for it in the kernel, so that a crater run would alert
> upstream Rust if they ever attempt to change it in the future
> (assuming we manage to get the kernel in the crater runs).
> 
>   - Call into C for the time being.

I have been thinking more in terms of calling into C in the short term.
I added a post looking at short-term and longer-term possibilities.
The short-term possibilities are mostly "call into C", while the long-term
possibilities are more utopian, perhaps insanely so in many cases.

> > All fair points, but either way the program doesn't do what its users
> > want it to do.
> 
> Sure, but even if you don't agree with the categorization, safe Rust
> helps to avoid several classes of errors, and users do see the results
> of that.

To be proven in the context of the Linux kernel.  And I am happy to
provide at least a little help with the experiment.

> > OK, I will more strongly emphasize wrappering in my next pass through
> > this series.  And there does seem to have been at least a few cases
> > of confusion where "implementing" was interpreted by me as a proposed
> > rewrite of some Linux-kernel subsystem, but where others instead meant
> > "provide Rust wrappers for".
> 
> Yeah, we are not suggesting to rewrite anything. There are, in fact,
> several fine approaches, and which to take depends on the code we are
> talking about:
> 
>   - A given kernel maintainer can provide safe abstractions over the C
> APIs, thus avoiding the risk of rewrites, and then start accepting new
> "client" modules in mostly safe Rust.
> 
>   - Another may do the same, but may only accept new "client" modules
> in Rust and not C.
> 
>   - Another may do the same, but start rewriting the existing "client"
> modules too, perhaps with aims to gradually move to Rust.
> 
>   - Another may decide to rewrite the entire subsystem in Rust,
> possibly keeping the C version alive for some releases or forever.
> 
>   - Another may do the same, but provide the existing C API as
> exported Rust functions.
> 
> In any case, rewrites from scratch should be a conscious decision --
> perhaps a major refactor was due anyway, perhaps the subsystem has had
> a history of memory-safety issues, perhaps they want to take advantage
> of Rust generics, macros or enums...

My current belief is that wrappers would more likely be around
higher-level C code using RCU than around the low-level RCU APIs
themselves.  But who knows?

> > I get that the Rust community makes this distinction.  I am a loss as
> > to why they do so.
> 
> If you mean the distinction between different types of bugs, then the
> distinction does not come from the Rust community.
> 
> For instance, in the links I gave you, you can see major C/C++
> projects like Chromium and major companies like Microsoft talking
> about memory-safety issues.

And talking about memory-safety issues makes much more sense to me than
does talking about undefined behavior in general.

> > OK.  I am definitely not putting forward Linux-kernel RCU as a candidate
> > for conversion.  But it might well be that there is code in the Linux
> > kernel that would benefit from application of Rust, and answering this
> > question is in fact the point of this experiment.
> 
> Converting (rather than wrapping) core kernel APIs requires keeping
> two separate implementations, because Rust is not mandatory for the
> moment.
> 
> So I would only do that if there is a good reason, or if somebody is
> implementing something new, rather than rewriting it.

That makes sense, especially if you are looking at bug rate as a measure
of effectiveness.  Unnecessarily converting well-tested and heavily used
code normally does not improve its bug rate.

> > The former seems easier and faster than the latter, sad to say!  ;-)
> 
> Well, since you maintain that compiler writers will never drop UB from
> their hands, I would expect you see the latter as the easier one. ;)
> 
> And, in fact, it would be the best way to do it -- fix the language,
> not each individual tool.

Working on it in the case of C/C++, though quite a bit more slowly
than I would like.

> > Plus there are long-standing algorithms that dereference pointers to
> > objects that have been freed, but only if a type-compatible still-live
> > object was subsequently allocated and initialized at that same address.
> > And "long standing" as in known and used when I first wrote code, which
> > was quite some time ago.
> 
> Yes, C and/or Rust may not be suitable for writing certain algorithms
> without invoking UB, but that just means we need to write them in
> another language, or in assembly, or we ask the compiler to do what we
> need. It does not mean we need to drop C or Rust for the vast majority
> of the code.

As we agreed earlier, we instead need to provide ways for these languages
to conveniently express these algorithms.

However...

Just to get you an idea of the timeframe, the C++ committee requested
an RCU proposal from me in 2014.  It took about four years to exchange
sufficient C++ and RCU knowledge to come to agreement on what a C++
RCU API would even look like.  The subsequent three years of delay were
due to bottlenecks in the standardization process.  Only this year were
hazard pointers and RCU voted into a Technical Specification, which has
since been drafted by Michael Wong, Maged Michael (who of course did the
hazard pointers section), and myself.  The earliest possible International
Standard release date is 2026, with 2029 perhaps being more likely.

Let's be optimistic and assume 2026.  That would be 12 years elapsed time.

Now, the USA Social Security actuarial tables [1] give me about a 77%
chance of living another 12 years, never mind the small matter of
remaining vigorous enough to participate in the standards process.
Therefore, there is only so much more that I will doing in this space.

Apologies for bringing up what might seem to be a rather morbid point,
but there really are sharp limits here.  ;-)

							Thanx, Paul

[1] https://www.ssa.gov/oact/STATS/table4c6.html
