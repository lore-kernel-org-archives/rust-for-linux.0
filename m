Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53C2C433FE
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 00:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8EB3224DE
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 00:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbgLMACL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 12 Dec 2020 19:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgLMACL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 12 Dec 2020 19:02:11 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB92C0613CF
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 16:01:30 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id a8so21000131lfb.3
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 16:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DjD0Sq6nedKenbFig9QsEhjgn016hWDjPZholk1F7eU=;
        b=OCkx6Tw2FaFQpFDMDvBuHHsOu3JYeGuiB4HDrWtoM2Ou/xxh2pvqJxbBa2+2lePJi6
         mE91QzgT9KcMAQX5+PSW36zclKU8hG4rnKCTCcHkDNxlYRboeh2lTQ7H4VOyfWXdHVVE
         Ez9xwn4Zx1Jyor+IFM+Yh2n7DrHuPz7hp0s/Tro0WTySEvw9Ky+z2AUgQDi/Tbp4CUOn
         nYvXLJ3yRhFa42+hcuXatJAs+0gVL0wXJ3kpgzSuH3cz7yNY68jGVzCDJfpR0rB9HejT
         W53ic/ROTF7ZO1kS6+1MBcEzSgyqIjiUqkVFMCVMOg/cr+k9D536NSV7zmM34JsV3Itc
         HTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DjD0Sq6nedKenbFig9QsEhjgn016hWDjPZholk1F7eU=;
        b=lTu2h7vMRfliOpxxSCkwCwLvaRvbufn/L7NUCAmpoERCSuocCZOVAQtmXjwtwbSzZR
         xMaLOrb8ZS4HBs+i/eJEjZZw4kkt+9peBql38hwiVGgkMs2mip1hH/whlisp9FCFXdDz
         XF2ZFKRSwFJ44fYWEqx+uJ6MGLvcwpfoW4AAFDMha/u2g6dAitDVMVjgav4nJI8YwEvy
         yL1Ayl21H5UKmq6nyJHQKEx3dLaZipBdH4/KuWXXrVH+C8iAt8F/iMK1aIGzjJTvZjn1
         sDKoS7fpKAE48TVoWlFfbICT+cq+ojUS8D2CqnYmxw6/XXUGREzY4Oj45V9djSUoWC9t
         pV+Q==
X-Gm-Message-State: AOAM533wmuBV18tTRV724p52eHT9xDB6Z6p/M0Oywsl0wVnET4SUZybx
        bLAu3CRQFatOUTTy1fIHTMYrIiCQUN/QsCD34cmy
X-Google-Smtp-Source: ABdhPJyCjPEA0xfjGjsjBtbPxrueBUw9OjoyBPts0o65AGJh1LaXdDctVCDmckF8tLJmhsMWRW8+P/VKvU7Fg8U4O6w=
X-Received: by 2002:a2e:99cb:: with SMTP id l11mr7666149ljj.249.1607817687505;
 Sat, 12 Dec 2020 16:01:27 -0800 (PST)
MIME-Version: 1.0
References: <CAMKQLNLp+XfVcQf_+8OHJO=faTkwfdiFYR2s72LoAryHxFBJFA@mail.gmail.com>
 <CANiq72maQNCGT=ff9BrsqY81mXjzeYpKxDy9rZL36cmgfCZt-w@mail.gmail.com>
In-Reply-To: <CANiq72maQNCGT=ff9BrsqY81mXjzeYpKxDy9rZL36cmgfCZt-w@mail.gmail.com>
From:   Wedson Almeida Filho <wedsonaf@google.com>
Date:   Sun, 13 Dec 2020 00:01:16 +0000
Message-ID: <CAMKQLN++0y2fVHNJhthemZ4BhQCAqXyFygj-jACZQnqfFBmkbg@mail.gmail.com>
Subject: Re: File operations
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, 9 Dec 2020 at 23:18, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Not sure... On one hand the first snippet looks very cumbersome; on
> the other hand, introducing a macro for just a line may not be over
> the threshold of "is this sugar worth enough?".

It will be several lines considering that we will have several of
these functions, but as you yourself mention in the next paragraph, I
don't think this is the main point of the macro, it's a reduction in
the boilerplate and making functions exactly the same as any other.

> The macro makes the fileops functions look more normal, so I think it
> would be fine, but don't spend too much time on that if you feel it
> gets too convoluted: we will likely know how much macro magic people
> enjoy if we end up being successful in introducing Rust in the kernel
> :-)

The macro would get the names of all functions implemented in a given
`impl` block and add another `impl` block with the same names as
booleans set the true. Not too complicated, but it would be better f
we could find a simpler solution.

> Nevertheless, however you do it, having actual non-trivial drivers
> implemented is a *very* nice thing!

Yes, that's what I am working towards. If the non-trivial driver is
filled with function declarations like those though, wrapped in
`Option`s and closures, I think it may be tougher sell.

Cheers,
-Wedson
