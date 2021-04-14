Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2A5C433ED
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 19:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8154761166
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 19:45:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234993AbhDNTph (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245109AbhDNTpg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Apr 2021 15:45:36 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AB13C061756
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:45:12 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u20so24514808lja.13
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=catwv2q3GSgLTDfMsYUmKmCZSwshqzh+pHe6dS6qFq0=;
        b=QSP43wtvqaEpZcRARk7mnw6oGOWu/4ywNnl/aVkEAOC2K7s8WzvGjOeQ31KNa9gAzv
         Kwi4DqSQUP2RnnG596Y/A8JFnkJHEpUBMWLjMY+a11yRwc7I1t6lIfi35/Jgsk4ZVu7F
         xXR4Tg1KelOIvKHH456Hdflb01KVNQFjYFjuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=catwv2q3GSgLTDfMsYUmKmCZSwshqzh+pHe6dS6qFq0=;
        b=EZCLEjW4j9/WdYwRpTn3nOEFo/8hNMXFaUT8fXKCdT9eRV5+tjSTbphyRjbhGXaa9j
         7O8iZZCrBUYsbj4Uj+igLl3K1iWDWbMEoB8q06FV0OcNZDp2qZpEfR2kNK3bhVjR4Mg6
         8pc4SKgSlwHn4xG8gWQ82QZKJ5PKNydB5vsguPiZXAFXbGfUWLaCPHNQEg2eba44pwCY
         Tjr81U2Z8BdyyTjuo1Sw7WEqeOWsf7rlKhCoIEgQX99SE/5nMQQGu5Y1fSkD4QfZnCYP
         Px3iYP8hVpZG15Fc01kOekibbtP2Wwg+N7MItO5MH1D2dBUzTk+0+9C8qioU51aW4uIC
         7v/g==
X-Gm-Message-State: AOAM532Tx59u2c1SZx6RYcs9o7WI5kbmOu5yUoJgLBd/RLcHsrZp4vne
        YEEGDMfmBYFDUKXm4uxipfvndkyn4Khi5B0L
X-Google-Smtp-Source: ABdhPJz9iSE88S3BbrIOp9dfLXjeVmxhfK4V7BZElnCYBgbSpaSTTgs7PhbI5qaDChHuME7CP9mmUA==
X-Received: by 2002:a2e:a490:: with SMTP id h16mr18080300lji.66.1618429510622;
        Wed, 14 Apr 2021 12:45:10 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id g18sm172281lfr.8.2021.04.14.12.45.10
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:45:10 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id n8so35257692lfh.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:45:10 -0700 (PDT)
X-Received: by 2002:ac2:58fc:: with SMTP id v28mr26526183lfo.201.1618429509986;
 Wed, 14 Apr 2021 12:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:44:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
Message-ID: <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     ojeda@kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 14, 2021 at 11:46 AM <ojeda@kernel.org> wrote:
>
> Some of you have noticed the past few weeks and months that
> a serious attempt to bring a second language to the kernel was
> being forged. We are finally here, with an RFC that adds support
> for Rust to the Linux kernel.

So I replied with my reactions to a couple of the individual patches,
but on the whole I don't hate it.

HOWEVER.

I do think that the "run-time failure panic" is a fundamental issue.

I may not understand the ramifications of when it can happen, so maybe
it's less of an issue than I think it is, but very fundamentally I
think that if some Rust allocation can cause a panic, this is simply
_fundamentally_ not acceptable.

Allocation failures in a driver or non-core code - and that is by
definition all of any new Rust code - can never EVER validly cause
panics. Same goes for "oh, some case I didn't test used 128-bit
integers or floating point".

So if the Rust compiler causes hidden allocations that cannot be
caught and returned as errors, then I seriously think that this whole
approach needs to be entirely NAK'ed, and the Rust infrastructure -
whether at the compiler level or in the kernel wrappers - needs more
work.

So if the panic was just some placeholder for things that _can_ be
caught, then I think that catching code absolutely needs to be
written, and not left as a to-do.

And if the panic situation is some fundamental "this is what the Rust
compiler does for internal allocation failures", then I think it needs
more than just kernel wrapper work - it needs the Rust compiler to be
*fixed*.

Because kernel code is different from random user-space system tools.
Running out of memory simply MUST NOT cause an abort.  It needs to
just result in an error return.

I don't know enough about how the out-of-memory situations would be
triggered and caught to actually know whether this is a fundamental
problem or not, so my reaction comes from ignorance, but basically the
rule has to be that there are absolutely zero run-time "panic()"
calls. Unsafe code has to either be caught at compile time, or it has
to be handled dynamically as just a regular error.

With the main point of Rust being safety, there is no way I will ever
accept "panic dynamically" (whether due to out-of-memory or due to
anything else - I also reacted to the "floating point use causes
dynamic panics") as a feature in the Rust model.

           Linus
