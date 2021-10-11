Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C196C433F5
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Oct 2021 19:01:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F2B260F4B
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Oct 2021 19:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234264AbhJKTDF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 11 Oct 2021 15:03:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233905AbhJKTDF (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 11 Oct 2021 15:03:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34B6F60F23;
        Mon, 11 Oct 2021 19:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633978865;
        bh=Vi1h8snWbYUX1uVIL+PFPzKH9+eIruMdjP8rEmHhsog=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=kvfkEXIXps2MfjKakmOMbjgocOcyjIRWYtrcCCMQ+pvanYu5vojgJ9D8UbASgzv8y
         f8MPdbcqEi+Ng36radLvQoviOBtaAz8VzFpHnowXaicDq1CSUOqW/HcF/vhjyKZN+u
         2wcTe0BFFCp9fKCBL4fniAIpYC/kR40oB2vYVuh1Tg4dasYK97hhEkiX1rD1UXMDXi
         VQNacIuPhhxiYqlbUlYaYqY7Lzd4oIKC1fwACWcZf9QUkC8fjblZdtKurboqP/BCue
         ZWwuYb5d4cXYYHR2E/vaqZ3b92vP4yUIrpQPn1i8ab2cxXVQy3rxnNroAkbjQ1RLIj
         B0UtNoenr92eg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 02D665C0687; Mon, 11 Oct 2021 12:01:04 -0700 (PDT)
Date:   Mon, 11 Oct 2021 12:01:04 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Gary Guo <gary@garyguo.net>, Marco Elver <elver@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <20211011190104.GI880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008005958.0000125d@garyguo.net>
 <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
 <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nGX6bgwDuVMX3nGUfs_UQB1ikOBHE-Q74nEaJ2Stx_2w@mail.gmail.com>
 <20211009235906.GY880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mj9x7a4mfzJo+pY8HOXAshqfhyEJMjs7F+qS-rJaaCeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mj9x7a4mfzJo+pY8HOXAshqfhyEJMjs7F+qS-rJaaCeA@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Oct 11, 2021 at 03:24:53AM +0200, Miguel Ojeda wrote:
> On Sun, Oct 10, 2021 at 1:59 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > The advantage that GCC and Clang/LLVM have is that you can simply say
> > "CentOS vx.yy" and define the full distro in an organized manner, for
> > a reasonably old and trusted distro version.  Perhaps Rust is already
> > there, but some have led me to believe that the safety-critical project
> > would need to take on some of the job of a Linux distribution.
> >
> > Which they most definitely can do, if they so choose and properly document
> > with proper approvals.  Which should not be that much of a problem to
> > make happen.
> 
> Exactly, it is doable, and the language is really just one more tool
> in the process. For instance, if I had to take on such a project right
> now, I might be more afraid (in terms of cost) of having to adapt
> internal testing-related tooling (so that it works with Rust) than
> about justifying the open-source compiler.

The main issue I was calling out was not justifying Rust, but rather
making sure that the exact same build could be reproduced a decade later.

> > In the near term, you are constrained by the existing compiler backends,
> > which contain a bunch of optimizations that are and will continue to limit
> > what you can do.  Longer term, you could write your own backend, or rework
> > the existing backends, but are all of you really interested in doing that?
> 
> I am not sure I understand what you mean, nor why you think we would
> need to rewrite any backend (I think your point here is the same as in
> the other email -- see the answer there).
> 
> Regardless of what UB instances a backend defines, Rust is still a
> layer above. It is the responsibility of the lowering code to not give
> e.g. LLVM enough freedom in its own UB terms to do unsound
> optimizations in terms of Rust UB.

There are things that concurrent software would like to do that are
made quite inconvenient due to large numbers of existing optimizations
in the various compiler backends.  Yes, we have workarounds.  But I
do not see how Rust is going to help with these inconveniences.

> > The current ownership model is also an interesting constraint, witness
> > the comments on the sequence locking post.  That said, I completely
> > understand how the ownership model is a powerful tool that can do an
> > extremely good job of keeping concurrency novices out of trouble.
> 
> I think it also does a good job of keeping concurrency experts out of trouble ;)

You mean like how I am not coding while I am producing blog posts and
responding to emails?  ;-)

Other than that, from some of the replies I am seeing to some of the
posts in this series, it looks like there are some things that concurrency
experts need to do that Rust makes quite hard.

But maybe others in the Rust community know easy solutions to the issues
raised in this series.  If so, perhaps they should speak up.  ;-)

But to be fair, much again depends on exactly where Rust is to be applied
in the kernel.  If a given Linux-kernel feature is not used where Rust
needs to be applied, then there is no need to solve the corresponding
issues.

							Thanx, Paul
