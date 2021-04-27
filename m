Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE82C433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 15:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68ADB61078
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 15:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237475AbhD0PgM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 11:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhD0PgL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 11:36:11 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FAFC061574
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 08:35:28 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id b21so2579629plz.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 08:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PUNByRoK1goQxqk3yy33PD86M9MqfZGqEYZKfdxWF3A=;
        b=f8rcnI0CS4ISGKF/KypANb9/HYPYYIR3PX98Rj5ZrSoS5Brmuxdp1qekosq0t5lEoR
         tHK5+iOyjibjRaEc4IU4A/fj2J4tK3F6JeQWB/MD51d7u8t1c/PuPY8DiS8gG3vQi9mD
         RYLyN0Q+PYbwABJgAIINtpLgQIxTqKnz0iAgR5xdEFFnp/Mx8uZe5RCHY5YrJWU8V7wT
         Q4eHkA3A8hjxK8KFjJeqliZcIjUU7L/+jresyFzGZzfGvfahr7YjK5jxwYUWgJuASAxE
         V9TxvhI+nIPrbOJs8OR/coyqxvqIAFJuhTFPsnXq6oE/N3z/jDjlqMBltf6T1FyGsIQ2
         vokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PUNByRoK1goQxqk3yy33PD86M9MqfZGqEYZKfdxWF3A=;
        b=pzNtUVknE9OkagshcmvD2doaqpxiXPF9tTPpX9kMVMEmoyIwdijKNtG+sV15aWn1fF
         3W2eMtkWUEKiD98zKujhjfY1kworAzJkqaXNlBEWi9PM/8tgEb2TAw522bpU+5f3jpDo
         xBAjlV0Cro5kmoRHruJW4pYu/A3/MxpZQAom73X7YicfY/AQqKG39S9Fjmq7kKO/d/eL
         UwYMzLbansEVEus0tuUz2WXtdgAB4UPXq8huZ1XIUdSYPdlhwZRDS7lA3Gfg3WZBotl7
         lvT2VpQTOH/L8UR9Aiw/92lFDeWVcjjkKlmjs1YowQLPNe0g5tHoyYplIG9emfivG1Zv
         FZaQ==
X-Gm-Message-State: AOAM532Ur6vIrhzE9zmTriFno5xeM70Li+OyHgS9eGRrEYHYqViTd5AP
        jIXgVedBOt1BKkdaCP0KHMt+UHXFnju5ayY0bZuPULI8f5lm/g==
X-Google-Smtp-Source: ABdhPJzBt2MPd4Np6tpczkG3tdvHpNZItj2Orahn+zZPrdC6vCiSpFtSq+IJdSLMbS46t/0tf+PZ8HWbFzU9kIBC6y0=
X-Received: by 2002:a17:90a:448b:: with SMTP id t11mr27535910pjg.21.1619537728110;
 Tue, 27 Apr 2021 08:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210427152015.GA4653@agape.jhs> <CAFRnB2U6cXM3V2-cFXPMXBo-BxbzBMNb=PSX9GzW2qwvSs_Fjw@mail.gmail.com>
 <20210427153311.GB4653@agape.jhs>
In-Reply-To: <20210427153311.GB4653@agape.jhs>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Tue, 27 Apr 2021 11:35:17 -0400
Message-ID: <CAFRnB2UPfD--T6o+MYLi=qUxeowHFCQJLuu4601kHQx_h+JwpA@mail.gmail.com>
Subject: Re: Question on Box<T> smart pointer
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Yes, it overrides it for any APIs in the alloc crate that allocate
memory (Arc, Rc, Vec, String, etc.).

Technically https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/lib.rs#L203-L204
is where the overriding really happens. The previous code I linked is
where the implementation is.

Alex

On Tue, Apr 27, 2021 at 11:33 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
>
> On Tue, Apr 27, 2021 at 11:22:23AM -0400, Alex Gaynor wrote:
> > Box<T> in the kernel allocates on the kernel heap, via kmalloc. This
> > is done by providing a Rust GlobalAllocator:
> > https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs#L11
>
> so this code:
>
> pub struct KernelAllocator;
>
> unsafe impl GlobalAlloc for KernelAllocator {
>     unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
>         // `krealloc()` is used instead of `kmalloc()` because the latter is
>         // an inline function and cannot be bound to as a result.
>         bindings::krealloc(ptr::null(), layout.size(), bindings::GFP_KERNEL) as *mut u8
>     }
>
>     unsafe fn dealloc(&self, ptr: *mut u8, _layout: Layout) {
>         bindings::kfree(ptr as *const c_types::c_void);
>     }
> }
>
> overrides the default behaviour of Box<T> defined
> in core::alloc::GlobalAlloc, doesn't it?
>
> So this code overrides the general heap allocation
> facility, not just Box<T>, right?
>
> thank you,
>
> fabio
>
> >
> > Alex
> >
> > On Tue, Apr 27, 2021 at 11:20 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
> > >
> > > Hi all,
> > >
> > > I have a question. There's one thing I miss.
> > >
> > > If Box<T> smart pointer allows allocating space on the heap,
> > > how is this behaviour overridden in linux kernel Rust?
> > >
> > > I mean, in c we have all API's to allocate heap space,
> > > but using "pure" Box<T> in kernel space what kind of
> > > allocation provides?
> > >
> > > If this question is stupid I apologize in advance,
> > >
> > > thank you,
> > >
> > > fabio
> >
> >
> >
> > --
> > All that is necessary for evil to succeed is for good people to do nothing.



-- 
All that is necessary for evil to succeed is for good people to do nothing.
