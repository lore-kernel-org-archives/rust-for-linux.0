Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A30C433F5
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Oct 2021 18:52:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5C3460E90
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Oct 2021 18:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbhJKSyf (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 11 Oct 2021 14:54:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:41892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229824AbhJKSye (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 11 Oct 2021 14:54:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AD0760F23;
        Mon, 11 Oct 2021 18:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633978354;
        bh=Th33yZz0dACyRio3jNXdPFz6KIn2EztX3gj5hacpEOo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=fUN0V38blX1FKI32Pz0vWL28Gl1lDG0RVZ2FQDYAdR7mf0pl/O/zF6mecIX+YQxOU
         Jq+DYkX+L6SR0Wz5i6R2vmmChzU/0q8W9YsQsgmRxmVO98ISFy6SprEo6Kh5Fv25f/
         OYnDtkqFU5RjQM+i06CUxeOcVhrlsr/vWJW4xUIlbaZBlEyg4OsHdS1lotzi/Qmg7F
         1Q8BqI+4yV9kXXCfnUVSZhHO6YmFgFmsnkzbWP633Z/9lng66CjJhG96/oJvUT+nPc
         nRfgI0YJxrn/YJYuttnE8/6Y2qDTbK3tPbRWgPKi0/pj4KNftTVQkENuWPh17CyBOz
         bYHdngwVtKcQA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 498AD5C0687; Mon, 11 Oct 2021 11:52:34 -0700 (PDT)
Date:   Mon, 11 Oct 2021 11:52:34 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211011185234.GH880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
 <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72m76-nRDNAceEqUmC_k75FZj+OZr1_HSFUdksysWgCsCA@mail.gmail.com>
 <20211009234834.GX880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72=uPFMbp+270O5zTS7vb8xJLNYvYXdyx2Xsz5+3-JATLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=uPFMbp+270O5zTS7vb8xJLNYvYXdyx2Xsz5+3-JATLw@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Oct 11, 2021 at 02:59:00AM +0200, Miguel Ojeda wrote:
> On Sun, Oct 10, 2021 at 1:48 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > As long as a significant number of compiler writers evaluate themselves by
> > improved optimization, they will be working hard to create additional UB
> > opportunities.  From what you say above, their doing so has the potential
> 
> Compiler writers definitely try to take advantage of as much UB as
> possible to improve optimization, but I would not call that creating
> additional UB opportunities. The opportunities are already there,
> created by the standards/committees in the case of C and the
> RFCs/teams in the case of unsafe Rust.
> 
> Of course, compiler writers may be stretching too much the intention
> and/or ambiguities, and there is the whole discussion about whether UB
> was/is supposed to allow unbounded consequences which WG14 is
> discussing in the recently created UBSG.
> 
> But I touch on this to emphasize that, even in unsafe Rust, compiler
> writers are not completely free to do whatever they want (even if they
> completely disregarded their users and existing code bases) and that
> C/unsafe Rust also share part of the responsibility (as languages) to
> define clearly what is allowed and what is not. So unsafe Rust is in a
> similar position to C here (though not equal).

I am sorry, but I have personally witnessed way way too many compiler
writers gleefully talk about breaking user programs.

And yes, I am working to try to provide the standards with safe ways to
implement any number of long-standing concurrent algorithms.  And more
than a few sequential algorithms.  It is slow going.  Compiler writers are
quite protective of not just current UB, but any prospects for future UB.

> > to generate bugs in the Rust compiler.  Suppose this happens ten years
> 
> I am not sure what you mean by bugs in the Rust compiler. If the
> compiler is following what unsafe Rust designers asked for, then it
> wouldn't be a bug. Whether those semantics are what we want as users,
> of course, is a different matter, but we should talk in that case with
> the language people (see the previous point).

Adducing new classes of UB from the standard means that there will be
classes of UB that the Rust compiler doesn't handle.  Optimizations in
the common compiler backends could then break existing Rust programs.

> > from now.  Do you propose to force rework not just the compiler, but
> > large quantities of Rust code that might have been written by that time?
> 
> No, but I am not sure where you are coming from.
> 
> If your concern is that the unsafe Rust code we write today in the
> kernel may be broken in 10 years because the language changed the
> semantics, then this is a real concern if we are writing unsafe code
> that relies on yet-to-be-defined semantics. Of course, we should avoid
> doing that just yet. This is why I hope to see more work on the Rust
> reference etc. -- an independent implementation like the upcoming GCC
> Rust may prove very useful for this.
> 
> Now, even if we do use subtle semantics that may not be clear yet,
> upstream Rust should not be happy to break the kernel (just like ISO C
> and GCC/Clang should not be). At least, they seem quite careful about
> this. For instance, when they consider it a need, upstream Rust
> compiles and/or runs the tests of huge amounts of open source
> libraries out there [1] e.g. [2]. It would be ideal to have the kernel
> integrated into those "crater runs" even if we are not a normal crate.
> 
> [1] https://rustc-dev-guide.rust-lang.org/tests/intro.html#crater
> [2] https://crater-reports.s3.amazonaws.com/beta-1.56-1/index.html

Or you rely on semantics that appear to be clear to you right now, but
that someone comes up with another interpretation for later.  And that
other interpretation opens the door for unanticipated-by-Rust classes
of UB.

> > The thing is that you have still not convinced me that UB is all that
> > separate of a category from logic bugs, especially given that either
> > can generate the other.
> 
> Logic bugs in safe Rust cannot trigger UB as long as those conditions
> we discussed apply. Thus, in that sense, they are separate in Rust.
> 
> But even in C, we can see it from the angle that triggering UB means
> the compiler output cannot be "trusted" anymore (assuming we use the
> definition of UB that compiler writers like to use but that not
> everybody in the committee agrees with). While with logic bugs, even
> with optimizations applied, the output still has to be consistent with
> the input (in terms of observable behavior). For instance, the
> compiler returning -38 here (https://godbolt.org/z/Pa8TWjY9a):
> 
>     int f(void) {
>         const unsigned char s = 42;
>         _Bool d;
>         memcpy(&d, &s, 1);
>         return d ? 3 : 4;
>     }
> 
> The distinction is also useful in order to discuss vulnerabilities:
> about ~70% of them come from UB-related issues [1][2][3][4].
> 
> [1] https://msrc-blog.microsoft.com/2019/07/18/we-need-a-safer-systems-programming-language/
> [2] https://langui.sh/2019/07/23/apple-memory-safety/
> [3] https://www.chromium.org/Home/chromium-security/memory-safety
> [4] https://security.googleblog.com/2019/05/queue-hardening-enhancements.html

All fair points, but either way the program doesn't do what its users
want it to do.

> > Hence the Rust-unsafe wrappering for C code, presumably.
> 
> Yes, the wrapping uses unsafe code to call the C bindings, but the
> wrapper may expose a safe interface to the users.
> 
> That wrapping is what we call "abstractions". In our approach, drivers
> should only ever call the abstractions, never interacting with the C
> bindings directly.
> 
> Wrapping things also allows us to leverage Rust features to provide
> better APIs compared to using C APIs. For instance, using `Result`
> everywhere to represent success/failure.

OK, I will more strongly emphasize wrappering in my next pass through
this series.  And there does seem to have been at least a few cases
of confusion where "implementing" was interpreted by me as a proposed
rewrite of some Linux-kernel subsystem, but where others instead meant
"provide Rust wrappers for".

> > This focus on UB surprises me.  Unless the goal is mainly comfort for
> > compiler writers looking for more UB to "optimize".  ;-)
> 
> I could have been clearer: what I meant is that "safety" in Rust (as a
> concept) is related to UB. So safety in Rust "focuses" on UB.
> 
> But Rust also focuses on "safety" in a more general sense about
> preventing all kinds of bugs, and is a significant improvement over C
> in this regard, removing some classes of errors.
> 
> For instance, in the previous point, I mention `Result` -- using it
> statically avoids forgetting to handle errors, as well as mistakes due
> to confusion over error encoding.

I get that the Rust community makes this distinction.  I am a loss as
to why they do so.

> > It will be interesting to see how the experiment plays out.  And to
> > be sure, part of my skepticism is the fact that UB is rarely (if ever)
> > the cause of my Linux-kernel RCU bugs.  But the other option that the
> 
> Safe/UB-related Rust guarantees may not useful everywhere, but Rust
> also helps lowering the chances of logic bugs in general (see the
> previous point).

OK.  I am definitely not putting forward Linux-kernel RCU as a candidate
for conversion.  But it might well be that there is code in the Linux
kernel that would benefit from application of Rust, and answering this
question is in fact the point of this experiment.

> > kernel uses is gcc and clang/LLVM flags to cause the compiler to define
> > standard-C UB, one example being signed integer overflow.
> 
> Definitely, compilers could offer to define many UBs in C. The
> standard could also decide to remove them, too.

The former seems easier and faster than the latter, sad to say!  ;-)

> However, there are still cases that C cannot really prevent unless
> major changes take place, such as dereferencing pointers or preventing
> data races.

Plus there are long-standing algorithms that dereference pointers to
objects that have been freed, but only if a type-compatible still-live
object was subsequently allocated and initialized at that same address.
And "long standing" as in known and used when I first wrote code, which
was quite some time ago.

							Thanx, Paul
