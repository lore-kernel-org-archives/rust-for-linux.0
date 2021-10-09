Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44DDC433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 23:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9307603E7
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 23:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhJIXuc (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 9 Oct 2021 19:50:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:34630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230342AbhJIXub (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 9 Oct 2021 19:50:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 657A160F43;
        Sat,  9 Oct 2021 23:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633823314;
        bh=ckhHmR1wKD4r5UL18GJ5BLDh+CaW3LHKByluL/lXX0o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=l4NlNTMheptPatYN4dC8fvlECDPbHnQvb9y3znMK3b3tf1kUUnvkCRNZi+eyAWFtN
         XgAde6Z9lLlL/qYHgUQscx6qWVxd774V284psOB5vjf/lw2JNPX1DwSkP/2gMxXzGC
         4M/CTr0rWn5gtg7OyiDV/1vhvTbaxWrCmr8OqX1F8D4SsmQu23eXqF9n3Kc49iAtDW
         efGI/Zg9ATqMRLuUES/eY3ZdNf+uovhvF+EPjRs2I4mTPi/tbR9yPalQFb/gpUhVjO
         UWluM8bbdoP5SY8sVYiE2AblohV6fXABHYXQzPSSvSIDMuZb7Rdf6nJRlOT7UCsH0r
         1I7qaYLQKpnog==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 276B65C0887; Sat,  9 Oct 2021 16:48:34 -0700 (PDT)
Date:   Sat, 9 Oct 2021 16:48:34 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211009234834.GX880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
 <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72m76-nRDNAceEqUmC_k75FZj+OZr1_HSFUdksysWgCsCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72m76-nRDNAceEqUmC_k75FZj+OZr1_HSFUdksysWgCsCA@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Oct 09, 2021 at 06:30:10PM +0200, Miguel Ojeda wrote:
> On Sat, Oct 9, 2021 at 1:57 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > But some other library could have a wild-pointer bug in unsafe Rust code
> > or in C code, correct?  And such a bug could subvert a rather wide range
> 
> Indeed, but that would require a bug somewhere in unsafe Rust code --
> safe Rust code cannot do so on its own. That is why I mentioned
> "outside safe code".

Understood.

> > of code, including that of correct libraries, right?  If I am wrong,
> > please tell me what Rust is doing to provide the additional protection.
> 
> Of course, an unsafe code bug, or C code going wild, or a compiler
> bug, or a hardware bug, or a single-event upset etc. can subvert
> everything (see the other reply).
> 
> This is why I emphasize that the guarantees Rust aims to provide are
> conditional to all that. After all, it is just a language -- there is
> no way it could make a system (including hardware) immune to that.

And understood here as well.

> > I would like to believe that, but I have seen too many cases where
> > UB propagates far and wide.  :-(
> 
> To be clear, the "effectively contain UB" above did not imply that
> Rust somehow prevents UB from breaking everything if it actually
> happens (this relates to the previous point). It means that, as a
> tool, it seems to be an effective way to write less UB-related bugs
> compared to using languages like C.
> 
> In other words, UB-related bugs can definitely still happen, but the
> idea is to reduce the amount of issues involving UB as much as
> possible via reducing the amount of code that we need to write that
> requires potentially-UB operations. So it is a matter of reducing the
> probabilities you mentioned -- but Rust alone will not make them zero
> nor guarantee no UB in an absolute manner.

And understood here, too.

> > Except that all too many compiler writers are actively looking for more
> > UB to exploit.  So this would be a difficult moving target.
> 
> If you mean it in the sense of C and C++ (i.e. where it is easy to
> trigger UB without realizing it because the optimizer may not take
> advantage of that today, but may actually take advantage of it
> tomorrow); then in safe Rust that would be a bug.
> 
> That is, such a bug may be in the compiler frontend, it may be a bug
> in LLVM, or in the language spec, or in the stdlib, or in our own
> unsafe code in the kernel, etc. But ultimately, it would be considered
> a bug.
> 
> The idea is that the safe subset of Rust does not allow you to write
> UB at all, whatever you write. So, for instance, no optimizer (whether
> today's version or tomorrow's version) will be able to break your code
> (again, assuming no bugs in the optimizer etc.).
> 
> This is in contrast with C (or unsafe Rust!), where not only we have
> the risk of compiler bugs like in safe Rust, but also all the UB
> landmines in the language itself that correct optimizers can exploit
> (assuming we agreed what is "legal" by the standard, which is a whole
> another discussion).

As long as a significant number of compiler writers evaluate themselves by
improved optimization, they will be working hard to create additional UB
opportunities.  From what you say above, their doing so has the potential
to generate bugs in the Rust compiler.  Suppose this happens ten years
from now.  Do you propose to force rework not just the compiler, but
large quantities of Rust code that might have been written by that time?

> > Let me see if I can summarize with a bit of interpretation...
> >
> > 1.      Rust modules are a pointless distraction here.  Unless you object,
> >         I will remove all mention of them from this blog series.
> 
> I agree it is best to omit them. However, it is not that Rust modules
> are irrelevant/unrelated to the safety story in Rust, but for
> newcomers to Rust, I think it is a detail that can easily mislead
> them.

Plus the connection to a Rust memory model is not all that strong.

> > 2.      Safe Rust code might have bugs, as might any other code.
> >
> >         For example, even if Linux-kernel RCU were to somehow be rewritten
> >         into Rust with no unsafe code whatsoever, there is not a verifier
> >         alive today that is going to realize that changing the value of
> >         RCU_JIFFIES_FQS_DIV from 256 to (say) 16 is a really bad idea.
> 
> Definitely: logic bugs are not prevented by safe Rust.
> 
> It may reduce the chances of logic bugs compared to C though (e.g.
> through its stricter type system etc.), but this is another topic,
> mostly unrelated to the safety/UB discussion.

The thing is that you have still not convinced me that UB is all that
separate of a category from logic bugs, especially given that either
can generate the other.

> > 3.      Correctly written unsafe Rust code defends itself (and the safe
> >         code invoking it) from misuse.  And presumably the same applies
> >         for wrappers written for C code, given that there is probably
> >         an "unsafe" lurking somewhere in such wrappers.
> 
> Yes. And definitely, calling C code is unsafe, since C code does not
> have a way to promise in its signature that it is safe.

Hence the Rust-unsafe wrappering for C code, presumably.

> > 4.      Rust's safety properties are focused more on UB in particular
> >         than on bugs in general.
> 
> Yes, safety in Rust is all about UB, not logic bugs.
> 
> This does not mean that Rust was not designed to try to minimize logic
> bugs too, of course, but that is another discussion.

This focus on UB surprises me.  Unless the goal is mainly comfort for
compiler writers looking for more UB to "optimize".  ;-)

> > And one final thing to keep in mind...  If I turn this blog series into
> > a rosy hymn to Rust, nobody is going to believe it.  ;-)
> 
> I understand :)
> 
> As a personal note: I am trying my best to give a fair assessment of
> Rust for the kernel, and trying hard to describe what Rust actually
> aims to guarantee and what not. I do not enjoy when Rust is portrayed
> as the solution to every single problem -- it does not solve all
> issues, at all. But I think it is a big enough improvement to be
> seriously considered for kernel development.

It will be interesting to see how the experiment plays out.  And to
be sure, part of my skepticism is the fact that UB is rarely (if ever)
the cause of my Linux-kernel RCU bugs.  But the other option that the
kernel uses is gcc and clang/LLVM flags to cause the compiler to define
standard-C UB, one example being signed integer overflow.

But my main official focus is of course the memory model.

						Thanx, Paul
