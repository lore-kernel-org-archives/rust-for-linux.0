Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4EDC433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 15:33:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62088613DD
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 15:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbhD0PeC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 11:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhD0Pd7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 11:33:59 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A599C061574
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 08:33:16 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id x5so9636337wrv.13
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 08:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VG76O7xSFpU0Sn0BOz2fzT5vdjwgPyZM9Qf2JoEblwU=;
        b=i+rshS+Mnpr8jDB/0vqEB6RtvhWW6IYIpm0XttT31NdXlmNQ2HtTi0R+oLj5B61Hbl
         Jnyl4JaCh+skJtBBHeDwmF+G+3lfR8JihIixVz65cWiSw0miViPfdj9TROu7wX8j74oK
         jWiGu1D2BVq8EBLB/LJIBEmM5IFpk0iFQI5ZehrR0mr8cl83UNeV1bFoDdzw5eDvY3hv
         v5m9D2n5t7gvPy4zB1twy/56EXcGS8yYVcVvE7ssiQLyRYRyO0m7LSeMn9mhsKlYOAgo
         KGUL28eMConZDAmPLtFr+K8tamr+lX5JmExeZhBCmRouQN41KVu9p2fIpuYQ2p+VHopN
         7N4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VG76O7xSFpU0Sn0BOz2fzT5vdjwgPyZM9Qf2JoEblwU=;
        b=dm3K/nNIzudoFYjH7njfr9f2RKit8Y8s/hzQ35kzeEHvVQwcmzVotjGE/kWBh1Yepu
         Pp3wKGKUWHQ5V7LHQuvZYmhIQRqZglt/fVd8CEbpl1OlSGMWww69hmgpK5FsOCW2Kp2l
         wEJIXeQKmwWUbSJ3i6lmUouyaIJMkBZDKTfMwj1KtuMZmGjBFAfkrIh0KM3k/AAgmSQf
         gSVRyBxJgQm5SyunJEsJp/FAiIPk0j5qlEuxO2tM2dXfYOybepwVjvw2F04K9/N2Mflo
         UGWubGirTLmL2Edu2zuEx4G+xMIO5Ozk4JS1LbalFSWcAMu3HJKO3qxTzHI9XZLBrhY2
         Onug==
X-Gm-Message-State: AOAM533QGtT9mPBKqzYpfHzYEJazgDmarNOhXSRr9yyNwXb5kqn6zXWe
        69ecpXy/Q8lMNnMFrYd8dg/XdlpzpD2ZkA==
X-Google-Smtp-Source: ABdhPJw3/HkgmRhJxaX2bmF5A7xNlzJFlegbkxzoLRv3jBTWPhVgrDIayow1Xf2iZ20xEtil5Z146w==
X-Received: by 2002:a05:6000:2c4:: with SMTP id o4mr29325949wry.232.1619537595002;
        Tue, 27 Apr 2021 08:33:15 -0700 (PDT)
Received: from agape.jhs ([5.171.81.92])
        by smtp.gmail.com with ESMTPSA id z14sm4957158wrt.54.2021.04.27.08.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 08:33:14 -0700 (PDT)
Date:   Tue, 27 Apr 2021 17:33:12 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     Alex Gaynor <alex.gaynor@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Question on Box<T> smart pointer
Message-ID: <20210427153311.GB4653@agape.jhs>
References: <20210427152015.GA4653@agape.jhs>
 <CAFRnB2U6cXM3V2-cFXPMXBo-BxbzBMNb=PSX9GzW2qwvSs_Fjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFRnB2U6cXM3V2-cFXPMXBo-BxbzBMNb=PSX9GzW2qwvSs_Fjw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Apr 27, 2021 at 11:22:23AM -0400, Alex Gaynor wrote:
> Box<T> in the kernel allocates on the kernel heap, via kmalloc. This
> is done by providing a Rust GlobalAllocator:
> https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs#L11

so this code:

pub struct KernelAllocator;

unsafe impl GlobalAlloc for KernelAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        // `krealloc()` is used instead of `kmalloc()` because the latter is
        // an inline function and cannot be bound to as a result.
        bindings::krealloc(ptr::null(), layout.size(), bindings::GFP_KERNEL) as *mut u8
    }

    unsafe fn dealloc(&self, ptr: *mut u8, _layout: Layout) {
        bindings::kfree(ptr as *const c_types::c_void);
    }
}

overrides the default behaviour of Box<T> defined
in core::alloc::GlobalAlloc, doesn't it?

So this code overrides the general heap allocation
facility, not just Box<T>, right?

thank you,

fabio

> 
> Alex
> 
> On Tue, Apr 27, 2021 at 11:20 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
> >
> > Hi all,
> >
> > I have a question. There's one thing I miss.
> >
> > If Box<T> smart pointer allows allocating space on the heap,
> > how is this behaviour overridden in linux kernel Rust?
> >
> > I mean, in c we have all API's to allocate heap space,
> > but using "pure" Box<T> in kernel space what kind of
> > allocation provides?
> >
> > If this question is stupid I apologize in advance,
> >
> > thank you,
> >
> > fabio
> 
> 
> 
> -- 
> All that is necessary for evil to succeed is for good people to do nothing.
