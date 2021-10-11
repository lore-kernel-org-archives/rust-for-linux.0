Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2855C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Oct 2021 01:25:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF54460EE5
	for <rust-for-linux@archiver.kernel.org>; Mon, 11 Oct 2021 01:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232659AbhJKB1F (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 10 Oct 2021 21:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbhJKB1E (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 10 Oct 2021 21:27:04 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D63CC061570
        for <rust-for-linux@vger.kernel.org>; Sun, 10 Oct 2021 18:25:05 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id x1so2892208ilv.4
        for <rust-for-linux@vger.kernel.org>; Sun, 10 Oct 2021 18:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qg/lw2b089jKrvjooAfpKe59rWCsGtQNpRbIh39OG8Y=;
        b=QE3+hhEJDPHu2uWvCRUGkJ2iCcjg5A5YN43ZWjSrfoXyXnLQy59/g9TfmiM8t+Qf8v
         AHKDSuttma6c9SDzeg6bL7OUNi7IDb8MYKHxOoD7IIrpl089x6RQ4Hgad7u3w94tveXK
         wWwGFsB7cHQZI+HZV9ZTUtkNNmJ8dv8W7D0zwDvgH5jKXIbq/BI2/zrtYysCajtRfYMd
         YWW9XSLxqs5KG+9Rjdss755V+8nHShN6sRAjv6e1YfkOUaUDCE3K0085Ikw85aLn+yXf
         Sw9BFOZZP8Ozc/C2GOYxlyx8YVffv9ZE+mhLvlrSbsXoU+HxnljifgpJrRffKiSYEJrk
         OJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qg/lw2b089jKrvjooAfpKe59rWCsGtQNpRbIh39OG8Y=;
        b=m+t5/OPdPX1ig+wSFwe4xUXHd/loAjD+d5fUADYjcyCuuh1KX++2vlKKr03n00rNq7
         amDUsP+ecVa/qOVHQZXscurYLxdE9vjezDGmy73nbYZotO9ppnfglcIy0mL4u9zlbav4
         oGtMpfeLbGtHnkLZV4BTgKOukFLt6GlVY+GoXzd43nXEkxtRwD5LJClyH1i9oy/yVivi
         eRE/1AQzq/dP6JbU3BMhPr6aBJBE4TBHmfoaxGbAqJJ3SuKcPnI0zZaGaJ7k2KqCITaf
         9oSqcoYHGxjOquMzFiAEeX2wH0MxF/vaSZmGxlwa0JUJhRzOKeyIZ8o01u6M89yh0NsQ
         6wvg==
X-Gm-Message-State: AOAM531wms+xcDm4GrkKq2SpycHWckmosROG2gRAA2EG9SJ2YjNvRsXA
        S3ZqX8pVYejjuk5n/bp1sUo+S6W3M8ACUgPkKuY=
X-Google-Smtp-Source: ABdhPJw9EOIrj9Mfr/BBIya2azK6u+vyIrOt0F8Y91/0ByoXqUh5XzNrAJoQVIWdjf/6O0+jYZ9tX42/fYmYJRQMjYY=
X-Received: by 2002:a05:6e02:1688:: with SMTP id f8mr17511226ila.72.1633915504805;
 Sun, 10 Oct 2021 18:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211007185029.GK880162@paulmck-ThinkPad-P17-Gen-1>
 <20211007224247.000073c5@garyguo.net> <20211007223010.GN880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008000601.00000ba1@garyguo.net> <20211007234247.GO880162@paulmck-ThinkPad-P17-Gen-1>
 <20211008005958.0000125d@garyguo.net> <20211008174048.GS880162@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72mOWV2SiF24E=NMB-zc2mK_UFH=CvDFxN+vdtyjy-Wm0A@mail.gmail.com>
 <20211009000838.GV880162@paulmck-ThinkPad-P17-Gen-1> <CANiq72nGX6bgwDuVMX3nGUfs_UQB1ikOBHE-Q74nEaJ2Stx_2w@mail.gmail.com>
 <20211009235906.GY880162@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211009235906.GY880162@paulmck-ThinkPad-P17-Gen-1>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 11 Oct 2021 03:24:53 +0200
Message-ID: <CANiq72mj9x7a4mfzJo+pY8HOXAshqfhyEJMjs7F+qS-rJaaCeA@mail.gmail.com>
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

On Sun, Oct 10, 2021 at 1:59 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> The advantage that GCC and Clang/LLVM have is that you can simply say
> "CentOS vx.yy" and define the full distro in an organized manner, for
> a reasonably old and trusted distro version.  Perhaps Rust is already
> there, but some have led me to believe that the safety-critical project
> would need to take on some of the job of a Linux distribution.
>
> Which they most definitely can do, if they so choose and properly document
> with proper approvals.  Which should not be that much of a problem to
> make happen.

Exactly, it is doable, and the language is really just one more tool
in the process. For instance, if I had to take on such a project right
now, I might be more afraid (in terms of cost) of having to adapt
internal testing-related tooling (so that it works with Rust) than
about justifying the open-source compiler.

> In the near term, you are constrained by the existing compiler backends,
> which contain a bunch of optimizations that are and will continue to limit
> what you can do.  Longer term, you could write your own backend, or rework
> the existing backends, but are all of you really interested in doing that?

I am not sure I understand what you mean, nor why you think we would
need to rewrite any backend (I think your point here is the same as in
the other email -- see the answer there).

Regardless of what UB instances a backend defines, Rust is still a
layer above. It is the responsibility of the lowering code to not give
e.g. LLVM enough freedom in its own UB terms to do unsound
optimizations in terms of Rust UB.

> The current ownership model is also an interesting constraint, witness
> the comments on the sequence locking post.  That said, I completely
> understand how the ownership model is a powerful tool that can do an
> extremely good job of keeping concurrency novices out of trouble.

I think it also does a good job of keeping concurrency experts out of trouble ;)

Cheers,
Miguel
