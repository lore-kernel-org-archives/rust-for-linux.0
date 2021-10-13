Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDDAC433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 11:47:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3593161056
	for <rust-for-linux@archiver.kernel.org>; Wed, 13 Oct 2021 11:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhJMLtu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 13 Oct 2021 07:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhJMLtt (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 13 Oct 2021 07:49:49 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D2FC061570
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Oct 2021 04:47:46 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id s3so2434117ild.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Oct 2021 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WNpZ64Dfc3sW2fQ35x9beQ3WXpgO0Vr7YbM8MXV6/e0=;
        b=UyxQKE97b8Ij27IGmfh7VKySE4Yc6DWb6lOy8HqziaFpwF2qFKsWto2ARoev/Jw1Tr
         fpZK5XH/XHcBwW7Zf+UzRXeWV5dELrRyrzbzeNJ5CiknhbhM940f6YlZ1gtPBuiUPFjN
         pGd/s7NtLuftH5zH9s6pr6MaGwraRxC6vPWd8EgScLJgwUxQWmILCXczZ2X3cN1cjMo+
         kELzlZpvSH69njcgMjm5GZf4Kk/P0xXxGC2bUzQpI3RpBck8QgSnDsATxMkxQUFx8qTR
         UcMhzyh4pGOheS4lbWE3bj4fvq4V0B9P6/aChH2Gh+VVGiwhclzv7qQwuHC2U2/V/lWz
         OnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WNpZ64Dfc3sW2fQ35x9beQ3WXpgO0Vr7YbM8MXV6/e0=;
        b=UWGH8Uflb4t5FKdsBqljiG/ufOr4v2guh4eoBEIKo3KTSGV1+YumQRFd19/vt7SzoB
         njkH02Ex87l01YyqtKjRWJNKgKhvNscm7Gr1klObawmAS0tlkr98DiHJ46Nzt/2a92JW
         RkifmHO4oiKvr/r0T2tVNNVb3NI7srpJhTBFqLbZJdOAylFNCFrdN/nTNjogTbAQr0eO
         U9f60PDTV+MwpuKFdD481ae6atti+UOmQ4yb+P2eDMMqP3Ui2fnkac6XjYLsHZHVgSkx
         Zom+iLtYs1QcFW6hkPASGO02J955OBeIe5BVro4UP2I2rTqgzRnLdWb6e7QjP1ZFWaB2
         1nvw==
X-Gm-Message-State: AOAM531siGXDrkOJ7Z6gxV1bqvPe7cBL4ndND25/t62hLyqUSo4TCWMD
        J8RFJoGAPlmgEETq7Diwphff3qhOYt7SJCLiaUs=
X-Google-Smtp-Source: ABdhPJxMD+nP0CWCBlhyORFF1TTNl+wYsvzCSJR5Z5XMR9PBPcyeCON7xhTZZSTAP24409dFhe62yoZA9Y+8NozoY6I=
X-Received: by 2002:a05:6e02:1543:: with SMTP id j3mr10881842ilu.151.1634125666291;
 Wed, 13 Oct 2021 04:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net> <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net> <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72nLXmN0SJOQ-aGD4P2dUTs_vXBXMDnr2eWP-+R7H2ecEw@mail.gmail.com>
 <20211008235744.GU880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72m76-nRDNAceEqUmC_k75FZj+OZr1_HSFUdksysWgCsCA@mail.gmail.com>
 <20211009234834.GX880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72=uPFMbp+270O5zTS7vb8xJLNYvYXdyx2Xsz5+3-JATLw@mail.gmail.com>
 <20211011185234.GH880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211011185234.GH880162@paulmck-ThinkPad-P17-Gen-1>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 13 Oct 2021 13:47:34 +0200
Message-ID: <CANiq72k+wa8bkxzcaRUSAee2btOy04uqLLnwY_AsBfd2RBhOxw@mail.gmail.com>
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

On Mon, Oct 11, 2021 at 8:52 PM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> I am sorry, but I have personally witnessed way way too many compiler
> writers gleefully talk about breaking user programs.

Sure, and I just said that even if compiler writers disregarded their
users, they are not completely free to do whatever they want.

> And yes, I am working to try to provide the standards with safe ways to
> implement any number of long-standing concurrent algorithms.  And more
> than a few sequential algorithms.  It is slow going.  Compiler writers are
> quite protective of not just current UB, but any prospects for future UB.

I am aware of that -- I am in WG14 and the UBSG, and some folks there
want to change the definition of UB altogether to prevent exactly the
sort of issues you worry about.

But, again, this is a different matter, and it does not impact Rust.

> Adducing new classes of UB from the standard means that there will be
> classes of UB that the Rust compiler doesn't handle.  Optimizations in
> the common compiler backends could then break existing Rust programs.

No, that is conflating different layers. The Rust compiler does not
"handle classes of UB" from the C or C++ standards. LLVM, the main
backend in rustc, defines some semantics and optimizes according to
those. Rust lowers to LLVM, not to C.

Now, sure, somebody may break LLVM with any given change, including
changes that are intended to be used by a particular language. But
that is arguing about accidents and it can happen in every direction,
not just C to Rust (e.g. Rust made LLVM fix bugs in `noalias` -- those
changes could have broken the C and C++ compilers). If you follow that
logic, then compilers should never use a common backend. Including
between C and C++.

Furthermore, the Rust compiler does not randomly pick a LLVM version
found in your system. Each release internally uses a given LLVM
instance. So you can see the Rust compiler as monolithic, not
"sharing" the backend. Therefore, even if LLVM has a particular bug
somewhere, the Rust frontend can either fix that in their copy (they
patch LLVM at times) or avoid generating the input that breaks LLVM
(they did it for `noalias`).

But, again, this applies to any change to LLVM, UB-related or not. I
don't see how or why this is related to Rust in particular.

> Or you rely on semantics that appear to be clear to you right now, but
> that someone comes up with another interpretation for later.  And that
> other interpretation opens the door for unanticipated-by-Rust classes
> of UB.

When I say "subtle semantics that may not be clear yet", I mean that
they are not explicitly delimited by the language; not as in
"understood in a personal capacity".

If we really want to use `unsafe` code with unclear semantics, we have
several options:

  - Ask upstream Rust about it, so that it can be clearly encoded /
clarified in the reference etc.

  - Do it, but ensure we create an issue in upstream Rust + ideally we
have a test for it in the kernel, so that a crater run would alert
upstream Rust if they ever attempt to change it in the future
(assuming we manage to get the kernel in the crater runs).

  - Call into C for the time being.

> All fair points, but either way the program doesn't do what its users
> want it to do.

Sure, but even if you don't agree with the categorization, safe Rust
helps to avoid several classes of errors, and users do see the results
of that.

> OK, I will more strongly emphasize wrappering in my next pass through
> this series.  And there does seem to have been at least a few cases
> of confusion where "implementing" was interpreted by me as a proposed
> rewrite of some Linux-kernel subsystem, but where others instead meant
> "provide Rust wrappers for".

Yeah, we are not suggesting to rewrite anything. There are, in fact,
several fine approaches, and which to take depends on the code we are
talking about:

  - A given kernel maintainer can provide safe abstractions over the C
APIs, thus avoiding the risk of rewrites, and then start accepting new
"client" modules in mostly safe Rust.

  - Another may do the same, but may only accept new "client" modules
in Rust and not C.

  - Another may do the same, but start rewriting the existing "client"
modules too, perhaps with aims to gradually move to Rust.

  - Another may decide to rewrite the entire subsystem in Rust,
possibly keeping the C version alive for some releases or forever.

  - Another may do the same, but provide the existing C API as
exported Rust functions.

In any case, rewrites from scratch should be a conscious decision --
perhaps a major refactor was due anyway, perhaps the subsystem has had
a history of memory-safety issues, perhaps they want to take advantage
of Rust generics, macros or enums...

> I get that the Rust community makes this distinction.  I am a loss as
> to why they do so.

If you mean the distinction between different types of bugs, then the
distinction does not come from the Rust community.

For instance, in the links I gave you, you can see major C/C++
projects like Chromium and major companies like Microsoft talking
about memory-safety issues.

> OK.  I am definitely not putting forward Linux-kernel RCU as a candidate
> for conversion.  But it might well be that there is code in the Linux
> kernel that would benefit from application of Rust, and answering this
> question is in fact the point of this experiment.

Converting (rather than wrapping) core kernel APIs requires keeping
two separate implementations, because Rust is not mandatory for the
moment.

So I would only do that if there is a good reason, or if somebody is
implementing something new, rather than rewriting it.

> The former seems easier and faster than the latter, sad to say!  ;-)

Well, since you maintain that compiler writers will never drop UB from
their hands, I would expect you see the latter as the easier one. ;)

And, in fact, it would be the best way to do it -- fix the language,
not each individual tool.

> Plus there are long-standing algorithms that dereference pointers to
> objects that have been freed, but only if a type-compatible still-live
> object was subsequently allocated and initialized at that same address.
> And "long standing" as in known and used when I first wrote code, which
> was quite some time ago.

Yes, C and/or Rust may not be suitable for writing certain algorithms
without invoking UB, but that just means we need to write them in
another language, or in assembly, or we ask the compiler to do what we
need. It does not mean we need to drop C or Rust for the vast majority
of the code.

Cheers,
Miguel
