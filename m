Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAC7C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 16:31:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15F2260F8F
	for <rust-for-linux@archiver.kernel.org>; Sat,  9 Oct 2021 16:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhJIQdS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 9 Oct 2021 12:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbhJIQdP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 9 Oct 2021 12:33:15 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BEA5C061570
        for <rust-for-linux@vger.kernel.org>; Sat,  9 Oct 2021 09:31:18 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id z184so14451969iof.5
        for <rust-for-linux@vger.kernel.org>; Sat, 09 Oct 2021 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yVEm896Yx01LPVLuAIaN3xFYGrEW8NhuMbgTTKjWCI8=;
        b=oNVFlHLilNjCJGhD/j3ds+6hYD3a/lpNAr/3OkzM6W8yC6akPqbX6v7uOVjWvK9iPm
         /mj/CR24WjZf2zkTmNxmdmtVkHBZvXKeRHt6b9hU0T1hhtOCUIbO7piVUWvmgpSvpdS/
         cUjUMi47izoSMSQD8+d2ijD0//Ug6AhPPA0WtINOS1MJAXXBEzXjJFbWsoqLOw5Q25BI
         EzXVbyxRUDoIot1w9ud7ONjF+ZBtf1ykoIZXw3m9EUxaCFHtgssXHiAa6LBmJqZrI38p
         /FvQAUhCMJyWtBgedQMNlxOze5yIIiu4fGSiFB280KPElH7xwc0ovwclpkksiMa5IHjJ
         mUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yVEm896Yx01LPVLuAIaN3xFYGrEW8NhuMbgTTKjWCI8=;
        b=yvL2IUqO3ylO77JNTU41tfFzc6ckP7HdmwrixRZEMvsfvXa9SCQ9I2Ki+bI4cPaFoV
         sGa2mfR1Se/Evi9y4JIHk4Hef3MaMkPtGl9jZmGvk6b9GLq06SLsxLb/14KdJ/6S67Yu
         hOw7mVA67W6qIWaUTGkNLHgmRgBtJ8E1XQ3IM8mkLnMgAxLYjNsLpuwpDAsfsdQ1ancL
         j6+5aSrr/6P040M7c5lSuBwVoL2JlzDF6WWSG9G+Qwdeabf9kTRB53fk7M+d3AKdyGf1
         lK8gFiFWu0ahZexzPzCOjAk3FWX552lRy9/N12l4ElZAiHZfa78mPSLzia5Ky+cjoXrD
         tG5g==
X-Gm-Message-State: AOAM532izWvVkgJ4YEFmU3t2c7jZ7AXNWVWejwzJwnW6G51y5sBJJZL9
        r60PBt1p0gkIib+bqfcntTpS2r8PMYHB/dUj074=
X-Google-Smtp-Source: ABdhPJy0sodWlyCjy9mNsTbNZ/M45ZmBzJUNeyHok8P5OTqlPLd70Nldbb5i0Bb+PUuj7NjUy9eYZisr8mzFnC/Gi+I=
X-Received: by 2002:a05:6602:160c:: with SMTP id x12mr12100046iow.44.1633797077563;
 Sat, 09 Oct 2021 09:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
 <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
 <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1> <20211007224247.000073c5@garyguo.net>
 <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1> <20211008000601.00000ba1@garyguo.net>
 <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1> <20211008005958.0000125d@garyguo.net>
 <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
 <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 9 Oct 2021 18:31:06 +0200
Message-ID: <CANiq72nGX6bgwDuVMX3nGUfs_UQB1ikOBHE-Q74nEaJ2Stx_2w@mail.gmail.com>
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

On Sat, Oct 9, 2021 at 2:08 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> If it complies with requirements, is it really a bug?  And while we are
> at it, I need to make an insignificant change to those requirements.  ;-)
>
> Hey, they have been using C for quite some time!  In at least some cases,
> with the assistance of formal verification tooling that takes the C code
> as input (cbmc, for example).

Indeed, for assurance levels that require that kind of verification,
there is a need for that kind of tooling for Rust.

> And how many of those boxes are ticked by the usual open-source processes?
> Nicholas Mc Guire talks about this from time to time.
>
> One challenge for use of Rust in my previous work with similar standards
> would be repeatability.  It would be necessary to carefully identify and
> archive the Rust compiler.

This may be open for interpretation, but I am aware of safety-critical
projects having used open-source compilers (e.g. GCC) and passing
certification (in at least some assurance levels).

Of course, in any case, companies looking to certify a system will not
jump right away into Rust because there are many other things to
consider: previous experience certifying, existence of tools, etc. and
all their implications in cost.

> So Rust is an attempt to let the compiler writers have their UB while
> inflicting at least somewhat less inconvenience on those of us poor
> fools using the resulting compilers?  If so, I predict that the compiler

You can see Rust as a way to "tame" C and C++, yes ;D

More seriously, users of Rust also take advantage of it, not just
compiler writers. For instance, unsafe code is used all the time to
implement all sorts of data structures in a performant way, while
still giving callers a safe interface.

There is also the angle about using `unsafe` even in "normal code" as
an escape hatch when you really need the performance (e.g. to avoid a
runtime check you can show it always holds).

The key idea is to encapsulate and minimize all that, and keep most of
the code (e.g. drivers) within the safe subset while still taking
advantage of the performance potentially-UB operations give us.

> writers will work hard to exploit additional UB until such time as Rust
> is at least as unsound as the C language currently is.

Rust has defined both the language and the compiler frontend so far,
thus it is also its own compiler writer here (ignoring here
alternative compilers which are very welcome). So it is in a good
position to argue with itself about what should be UB ;)

Now, of course, the Rust compiler writers have to ensure to abide by
LLVM's UB semantics when they lower code (and similarly for
alternative backends). But this is a different layer of UB, one that
frontend writers are responsible for, not the Rust one, which is the
one we care about for writing unsafe code.

Nevertheless, in the layer we care about, it would be nice to see the
unsafe Rust semantics defined as precisely as possible -- and there is
work to do there (as well as an opportunity).

(In any case, to be clear, this all is about unsafe Rust -- for safe
Rust, it has to show no UB modulo bugs in optimizers, libraries,
hardware, etc. -- see my other email about this. Furthermore, even if
there comes a time Rust has an standard, the safe Rust subset should
still not allow any UB).

> Sorry, but you did leave yourself wide open for that one!!!  ;-)

No worries :) I appreciate that you raise all these points, and I hope
it clarifies things for others with the same questions.

Cheers,
Miguel
