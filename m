Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E526C2B9F2
	for <rust-for-linux@archiver.kernel.org>; Sat, 22 May 2021 20:30:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F32461175
	for <rust-for-linux@archiver.kernel.org>; Sat, 22 May 2021 20:30:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhEVUbz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 22 May 2021 16:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231339AbhEVUbz (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 22 May 2021 16:31:55 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E17C061574
        for <rust-for-linux@vger.kernel.org>; Sat, 22 May 2021 13:30:29 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id c10so17867316qtx.10
        for <rust-for-linux@vger.kernel.org>; Sat, 22 May 2021 13:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uZ3w+4cobcfrNJcoyf54F+qqGiaubwJyhkLY3vSW/Lg=;
        b=CgqmlHRlnGXMX1GCP8i3oKEllyzSVjsRNUnNOKSxx3W/RS++5nY3R8zJib9v7yfDrc
         MaibB1+vKeh2E5ebruubmNyk9XQpP+oP2UKJUVrd+LxNwWBPuQhXjBH3iUPzd+zhVTz1
         ly4zMOqhFR1ZuRvhVnTHQbpK/sDVRMhIbVO2vPUXuHncPE0DtjoLQ1trM6ymL/FYF7ZJ
         hfKEz+TUn9UG4JbvzDenM2gg0vsdZe6gLybrD2jW43UHJm2WjriBb1nWVKBgfzPU2ilz
         hTsbHDsCh+ZSxAAlWwoz+SYPsSrA/cfZZtgiIbJ150OuZRfbqEqbgXYmLltOmulUIKwS
         W+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uZ3w+4cobcfrNJcoyf54F+qqGiaubwJyhkLY3vSW/Lg=;
        b=jqPhruyNVz+xkYTJbsg6PCgKLAnR+B+VYX7/3a/KAfj95dFPvhv0nofWIQ6S9jiT2b
         HRg+2MKwtBUAwFZuF5WtuFtAxi/cYtkHX3gAtf12jOjA+lHH8Pay87rETs9cHz2hTZd/
         m+gpI4VBTKuaIx2gQBJZRDYz8dU1UemW7lrG2Xt9Sq1YvToiZtHlhyFtCav+aPfh91tH
         S3Myxt7qqoPemBQXAUZR4apSWo41B8sf4VZC2Cn86BTc7YMhy2zFlj3VkbV8ljT5mIB1
         9Fdu98MI4BhZd6gAH6oqH9vZMHFGgR/b0pJ6ihAz8O/BXBRMkNyOhb8Pe4dOKENBMnhv
         4xFA==
X-Gm-Message-State: AOAM532zGGzTEkxns396uYnAcoRZ/iM16QXtJi1+Eu7iodgek4rzYg4o
        PGXiCqrNdLhyG0lW6seCyz5oqr4LtRN5F8thiLbK7BscqPw=
X-Google-Smtp-Source: ABdhPJy92jKUgqGHP+wl4w57sFpHU2zfwHftCKmN/YmxTqdbuC2uLgmyNtVsvuoZLt8CPhJgsMmZ/iuqjxDeKPrZCmo=
X-Received: by 2002:a05:622a:164a:: with SMTP id y10mr18893258qtj.97.1621715428823;
 Sat, 22 May 2021 13:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmvQ+WEAFJCAn2my8iRUZBDvREExsFCydUxZxUxfSV51MK_Uw@mail.gmail.com>
 <20210522090942.0000158b@garyguo.net> <CAKmvQ+UpHb0tBbYo9pR-YJa=SC3bd2T8pE_R8tLkOqKCsK9kXA@mail.gmail.com>
 <20210522201758.00006b1e@garyguo.net>
In-Reply-To: <20210522201758.00006b1e@garyguo.net>
From:   Hanqing Zhao <ouckarlzhao@gmail.com>
Date:   Sat, 22 May 2021 16:30:17 -0400
Message-ID: <CAKmvQ+WT-LhrUSVu7E+Qz1DZ0A-+t8Z0U8vGR+eVagJFAwJtLA@mail.gmail.com>
Subject: Re: [KernelAllocator] Usage of GlobalAlloc
To:     Gary Guo <gary@garyguo.net>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, May 22, 2021 at 3:18 PM Gary Guo <gary@garyguo.net> wrote:
>
> On Sat, 22 May 2021 06:46:41 -0400
> Hanqing Zhao <ouckarlzhao@gmail.com> wrote:
>
> > On Sat, May 22, 2021 at 4:22 AM Gary Guo <gary@garyguo.net> wrote:
> > >
> > > On Fri, 21 May 2021 13:42:40 -0400
> > > Hanqing Zhao <ouckarlzhao@gmail.com> wrote:
> > >
> > > > While implementing an alloc crate, I intend to pass custom
> > > > parameters and extra parameters such as
> > > > memory flags (GFP_KERNEL, GFP_ATOMIC, etc) through the `Layout`
> > > > parameter.
> > >
> > > This sounds very wrong. `Layout` should only contain size and align,
> > > but not other stuff. `Layout` is part of libcore, and it is a lang
> > > item (aka part of the Rust language, tightly coupled to the
> > > compiler), so you shouldn't change that.
> > >
> >
> > Yes. I actually modified the rust library for some experimental
> > safety features.
>
> `core` is tightly coupled with the version of rustc, so unless the
> feature you are suggesting will likely ended up in upstream Rust, I
> doubt that we can use the modification.
>
> `Layout` is truly just for layout of the type, so don't put any
> irrelevant bits there. You can experiment on designs of a new allocator
> APIs, but please don't change `Layout`.
>
> > > > However, the current implementation of GlobalAlloc
> > > > (https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs#L13)
> > > > is not actually used,
> > > > because the kernel allocation directly resorts to `__rust_alloc`
> > > > (
> > > > https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs\#L34),
> > > > `__rust_dealloc`, etc.
> > >
> > > This is a complicated. Rust will call `__rust_alloc` for all
> > > allocations that use the global allocator. Rust will also generate
> > > `__rust_alloc` automatically if the target is a binary, `.a` or
> > > `.so`, but it wouldn't generate it for `.o`.
> > >
> > > So we currently manually implement these functions. Perhaps we
> > > should redirect `__rust_alloc` to `<KernelAllocator as
> > > GlobalAlloc>::alloc`, but since `alloc` also just calls
> > > GlobalAlloc>`bindings::krealloc` it does not
> > > matter much.
> > >
> >
> > Because I do not use `kmalloc` as a backend, I probably need to find
> > alternative ways to
> > enable the usage of GlobalAlloc. It would be better if I can find a
> > way to pass layout as parameter
> > instead of the size and align parameter for `__rust_alloc`.
>
>
> Just replace the code of `__rust_alloc` with
> `KernelAllocator.alloc(Layout::from_size_align_unchecked(size,
> align))`, or whatever other type that implements `GlobalAlloc`.
>
> > > > While implementing an alloc crate, I intend to pass custom
> > > > parameters and extra parameters such as
> > > > memory flags (GFP_KERNEL, GFP_ATOMIC, etc) through the `Layout`
> > > > parameter.
> > >
> > > Back to start. Why do you need to want to specify these through
> > > `Layout`? As for the flags, we've discussed about this topic ~1
> > > month ago in the meeting
> > > (https://lore.kernel.org/rust-for-linux/alpine.DEB.2.11.2104241558400.11174@titan.ldpreload.com/)
> > > weeks ago in the meeting, and we've concluded that one should
> > > invoke kmalloc themselves and use unsafe APIs to construct any
> > > collections if they want sepcial flags (e.g. GFP_DMA).
> > >
> >
> > memory flags are one of my concerns. I am also passing some parameters
> > for demonstrating
> > experimental security features.
>
>
> Why are you trying to use `GlobalAlloc` though? Have you looked into
> the `Allocator` API? There's nothing preventing you to add a flag there:
> ```
> struct MyAlloc(u32);
>
> impl Allocator for MyAlloc { /*blah*/ }
>
> Box::try_new_in(blah, MyAlloc(myflag))
> ```
>

Because I want to have a drop-in replacement for benchmarking.
After getting those performance numbers, then I can introduce it as
a new allocator api.

> >
> > My implementation actually does not rely on `kmalloc`, the memory
> > allocation can be
> > managed in Rust independently and does not need to be handled by
> > kernel slab.
> >
> > > A quick grep shows that in drivers/ there are 30k GFP_'s, and 27k of
> > > them are GFP_KERNEL, 3k being GFP_ATOMIC, just 1k for the rest. If
> > > possible we want to automatically detect the context and use
> > > GFP_ATOMIC in interrupt contexts (see notes), but if it's not
> > > possible probably we only need an `core::alloc::Alloc` that does
> > > GFP_ATOMIC and do not need to have the allocator support arbitrary
> > > flags.
> > >
> >
> > Preventing the sleep-in-atomic-context bugs is also one of my
> > concerns. For the memory allocation occured in rust, we can
> > automatically adjust the flags through some new abstractions like
> > something called `atomic_context` that takes as input a clouse.
> > Although we still need to come up with a way to deal with sleepale
> > APIs.
> >
>
> I had a thought about that recently and I believe that we can probably
> make use of static analysis (or Rust pluggable lints) to handle
> sleepable APIs.
>
> Please use "Reply All" next time. You didn't CC the mailing list.
>
> - Gary
>

Best,
Hanqing Zhao
Georgia Tech
