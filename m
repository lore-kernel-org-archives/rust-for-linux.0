Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14065C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 00:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA41860FD8
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 00:08:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243850AbhJIAKf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 8 Oct 2021 20:10:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:58902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243818AbhJIAKe (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 8 Oct 2021 20:10:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8762860FC2;
        Sat,  9 Oct 2021 00:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633738118;
        bh=Y/yBc4wxoMXX+KdWn50eDGnYu5NKY+XNUID99GYsmSo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Oo8nsj0F60O7B2ox+zgrRpqvYjx1d+AlKTqyCBE7w8QeQHGuwkXPFq8Gme7PWiLMF
         Jo+Y8P7677GdU2pSp4rIePlReGLwHlJp+U5JahmlBB2Mwh+REGtTSCB76P9Wk+RdGt
         ZdaTWnnfKRbQ05cvt0bKyXTb9c1ResITtgQyDI991ghbrZ/O9xr9tFMvsQG9A/LBIk
         KvVvqOv5bwhPgDLV5Vxzi88mFERhc6g0gBH8jsZrOLdOCwAfstaoY5d1/Ip6F7aR+5
         +OD2qvHkF7J2pUg6Dc5OgVQ2zxa6ymif4zoXpmFRepcFXtD2RXXNHesKX51/ZMgcCL
         +ZM6WXPegraLQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 51FD35C1E85; Fri,  8 Oct 2021 17:08:38 -0700 (PDT)
Date:   Fri, 8 Oct 2021 17:08:38 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008005958.0000125d@garyguo.net>
 <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Oct 08, 2021 at 11:32:34PM +0200, Miguel Ojeda wrote:
> On Fri, Oct 8, 2021 at 7:40 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > Just in case there is lingering confusion, my purpose in providing an
> > example from the field of safety-critical systems was nothing more or
> > less than to derive an extreme lower bound for the expected bug rate in
> 
> Yes, safety-critical systems usually have lower rate of bugs, but they
> can actually be very buggy as long as they comply with requirements...
> :P

If it complies with requirements, is it really a bug?  And while we are
at it, I need to make an insignificant change to those requirements.  ;-)

> > production software.  Believe me, there is no way that I am advocating
> > use of Rust as it currently exists for use in safety-critical systems!
> > Not that this will necessarily prevent such use, mind you!  ;-)
> 
> Well, people are already working on bringing Rust to safety-critical domains! :)

Hey, they have been using C for quite some time!  In at least some cases,
with the assistance of formal verification tooling that takes the C code
as input (cbmc, for example).

> In any case, for example, DO-178 describes the software development
> process, but does not require a particular language to be used even if
> a particular project following that standard may do so.

And how many of those boxes are ticked by the usual open-source processes?
Nicholas Mc Guire talks about this from time to time.

One challenge for use of Rust in my previous work with similar standards
would be repeatability.  It would be necessary to carefully identify and
archive the Rust compiler.

> > From what I have seen, people prevent unsafe Rust code from introducing
> > UB by adding things, for example assertions and proofs of correctness.
> > Each and every one of those added things have a non-zero probability
> > of themselves containing bugs or mistakes.  Therefore, a Rust program
> > containing a sufficiently large quantity of unsafe code will with high
> > probability invoke UB.
> >
> > Hopefully, a much lower UB-invocation probability than a similar quantity
> > of C code, but nevertheless, a decidedly non-zero probability.
> >
> > So what am I missing here?
> 
> Rust does not guarantee UB-freedom in an absolute way -- after all,
> there is unsafe code in the standard library, we have unsafe code in
> the kernel abstractions, the compiler may have bugs, the hardware may
> misbehave, there may be a single-event upset, etc.
> 
> However, the key is to understand Rust as a way to minimize unsafe
> code, and therefore minimize the chances of UB happening.
> 
> Let's take an example: we need to dereference a pointer 10 times in a
> driver. And 10 more times in another driver. We may do it writing
> `unsafe` many times in every driver, and checking that every single
> usage does not trigger UB. This is fine, and we can write Rust code
> like that, but is not buying us much. And, as you say, if we keep
> accumulating those dereferences, the probability of a mistake grows
> and grows.

The real fun in device drivers is the MMIO references, along with the
IOMMU, the occasional cache-incoherent device, and so on.

> Instead, we could write an abstraction that provides a safe way to do
> the same thing. Then we can focus our efforts in checking the
> abstraction, and reuse it everywhere, in all drivers.
> 
> That abstraction does not guarantee there is no UB -- after all, it
> may have a bug, or someone else may corrupt our memory, or the
> hardware may have a bug, etc. However, that abstraction is promising
> that, as long as there is no other UB subverting it, then it will not
> allow safe code to create UB.
> 
> Therefore, as a driver writer, as long as I keep writing only safe
> code, I do not have to care about introducing UB. As a reviewer, if
> the driver does not contain unsafe code, I don't need to worry about
> any UB either. If UB is actually introduced, then the bug is in the
> abstractions, not the safe driver.
> 
> Thus we are reducing the amount of places where we risk using a
> potentially-UB operation.

So Rust is an attempt to let the compiler writers have their UB while
inflicting at least somewhat less inconvenience on those of us poor
fools using the resulting compilers?  If so, I predict that the compiler
writers will work hard to exploit additional UB until such time as Rust
is at least as unsound as the C language currently is.

Sorry, but you did leave yourself wide open for that one!!!  ;-)

							Thanx, Paul
