Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B17BC433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 23:59:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3130460F6B
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 23:59:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhJJABE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 9 Oct 2021 20:01:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:35530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229703AbhJJABE (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 9 Oct 2021 20:01:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC55E60F57;
        Sat,  9 Oct 2021 23:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633823946;
        bh=0JzN+7cmMA9FDa/hUzcaEGFr9/c//tTdPKQV4NbWyfs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=strx8NBTuRV8OIRzGCcwjvOTUqvgODTs1TPiNwehCyNsRal1YL4qCigjgw6GDLQGo
         VQuevnDDUt4xAia4ZbwuCZL1S3ZASQ3vPEhiuOcdMh29nYXyxvfLe3wq5OKsrQLSph
         aHf6re8WGtIIer8cG/ei8Se68AF/wYH5fCwmRtQWkE0ry1smnBGe+FolhHxURZYdzW
         unSEUqBgHksBlCMYHSYa7M7SqstXx2VapqUzN/nUs3f2Q7PaCQbdBfscniI83f6wel
         ZvgQPZZvd95fpQqK8qNRymQfW++Jmb6XF8VrCMCJS+5htuWeaCC3AiEgc3XXccKO0a
         C5G5Nxg25eQeg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id A7A785C0887; Sat,  9 Oct 2021 16:59:06 -0700 (PDT)
Date:   Sat, 9 Oct 2021 16:59:06 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211009235906.GY880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008005958.0000125d@garyguo.net>
 <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
 <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nGX6bgwDuVMX3nGUfs_UQB1ikOBHE-Q74nEaJ2Stx_2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nGX6bgwDuVMX3nGUfs_UQB1ikOBHE-Q74nEaJ2Stx_2w@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Oct 09, 2021 at 06:31:06PM +0200, Miguel Ojeda wrote:
> On Sat, Oct 9, 2021 at 2:08 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > If it complies with requirements, is it really a bug?  And while we are
> > at it, I need to make an insignificant change to those requirements.  ;-)
> >
> > Hey, they have been using C for quite some time!  In at least some cases,
> > with the assistance of formal verification tooling that takes the C code
> > as input (cbmc, for example).
> 
> Indeed, for assurance levels that require that kind of verification,
> there is a need for that kind of tooling for Rust.
> 
> > And how many of those boxes are ticked by the usual open-source processes?
> > Nicholas Mc Guire talks about this from time to time.
> >
> > One challenge for use of Rust in my previous work with similar standards
> > would be repeatability.  It would be necessary to carefully identify and
> > archive the Rust compiler.
> 
> This may be open for interpretation, but I am aware of safety-critical
> projects having used open-source compilers (e.g. GCC) and passing
> certification (in at least some assurance levels).
> 
> Of course, in any case, companies looking to certify a system will not
> jump right away into Rust because there are many other things to
> consider: previous experience certifying, existence of tools, etc. and
> all their implications in cost.

The advantage that GCC and Clang/LLVM have is that you can simply say
"CentOS vx.yy" and define the full distro in an organized manner, for
a reasonably old and trusted distro version.  Perhaps Rust is already
there, but some have led me to believe that the safety-critical project
would need to take on some of the job of a Linux distribution.

Which they most definitely can do, if they so choose and properly document
with proper approvals.  Which should not be that much of a problem to
make happen.

> > So Rust is an attempt to let the compiler writers have their UB while
> > inflicting at least somewhat less inconvenience on those of us poor
> > fools using the resulting compilers?  If so, I predict that the compiler
> 
> You can see Rust as a way to "tame" C and C++, yes ;D

How about instead taming the people writing insane optimizations?  ;-)

> More seriously, users of Rust also take advantage of it, not just
> compiler writers. For instance, unsafe code is used all the time to
> implement all sorts of data structures in a performant way, while
> still giving callers a safe interface.
> 
> There is also the angle about using `unsafe` even in "normal code" as
> an escape hatch when you really need the performance (e.g. to avoid a
> runtime check you can show it always holds).
> 
> The key idea is to encapsulate and minimize all that, and keep most of
> the code (e.g. drivers) within the safe subset while still taking
> advantage of the performance potentially-UB operations give us.

Nice spin.  ;-)

> > writers will work hard to exploit additional UB until such time as Rust
> > is at least as unsound as the C language currently is.
> 
> Rust has defined both the language and the compiler frontend so far,
> thus it is also its own compiler writer here (ignoring here
> alternative compilers which are very welcome). So it is in a good
> position to argue with itself about what should be UB ;)
> 
> Now, of course, the Rust compiler writers have to ensure to abide by
> LLVM's UB semantics when they lower code (and similarly for
> alternative backends). But this is a different layer of UB, one that
> frontend writers are responsible for, not the Rust one, which is the
> one we care about for writing unsafe code.
> 
> Nevertheless, in the layer we care about, it would be nice to see the
> unsafe Rust semantics defined as precisely as possible -- and there is
> work to do there (as well as an opportunity).
> 
> (In any case, to be clear, this all is about unsafe Rust -- for safe
> Rust, it has to show no UB modulo bugs in optimizers, libraries,
> hardware, etc. -- see my other email about this. Furthermore, even if
> there comes a time Rust has an standard, the safe Rust subset should
> still not allow any UB).

In the near term, you are constrained by the existing compiler backends,
which contain a bunch of optimizations that are and will continue to limit
what you can do.  Longer term, you could write your own backend, or rework
the existing backends, but are all of you really interested in doing that?

The current ownership model is also an interesting constraint, witness
the comments on the sequence locking post.  That said, I completely
understand how the ownership model is a powerful tool that can do an
extremely good job of keeping concurrency novices out of trouble.

> > Sorry, but you did leave yourself wide open for that one!!!  ;-)
> 
> No worries :) I appreciate that you raise all these points, and I hope
> it clarifies things for others with the same questions.

Here is hoping!

							Thanx, Paul
