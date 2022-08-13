Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE40CC19F2D
	for <rust-for-linux@archiver.kernel.org>; Sat, 13 Aug 2022 16:07:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239999AbiHMQHy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 13 Aug 2022 12:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239994AbiHMQHx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 13 Aug 2022 12:07:53 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467EFDEF5
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Aug 2022 09:07:52 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id i84so2964154ioa.6
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Aug 2022 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=/GVPgVj5nBj3m08Tb5ha9Q/aMLXA/maH/nmIOHLLs34=;
        b=FMtfhNgJYpB5BxU5fpObzgCdwhMkoQeb6+06IoQGBRoWo/LElrBPNSdCZYCEVxb33s
         3TEUBHiSqI7XNRdj4aZRyr8/AeQKsgNi+c/E+1yKKJhBDUTRD/F5EHfCa7tFe3XJUL0G
         IZF3KuCX0uEjv2zHmiIbHvbmSmkmZB4TnRMZgE0kJ38jRdqY6KjBxpn+yXw+vwA046QT
         a/Dc60g1tFXT2D1UqTK1EEjI45pc1JXAT/JL4ntnGxZ9de8FJgBBBWtTagG1g0Nxyfyh
         UhXupJfAHeOo+8ATEg9SBzS+OijhxtrE79KGy0HysMjrkZpMx3xVaFKla04mEgx34Fv/
         ptgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/GVPgVj5nBj3m08Tb5ha9Q/aMLXA/maH/nmIOHLLs34=;
        b=HlrUlDhJOo9ULTyl9BwSe2KAFYtTSWKRwu3+NkQzOaoWrSH4wTauT/J1wAW7oElj1M
         iFy0WhZRE+HpNVk9o/dSGZrtfh1g3N7oOEUabIPOJD4D7UK10vVBhck0c+EsiSruqq2+
         9g9Tm6niRbYUeSwO+9qFI1xgLGxQZlFcyBe2oHUglT7F9XzOzXhIza1VXG0aDYzUhkwu
         w1BTr39hAhdUB5jMm3e3VhihQOaJofyrsZdmorHOyAIQxO/CQHPTKdmaGDV+zAbIRG34
         qnkYMZTRuRVvkZj6gWb6SLo1a9j3AidEQg53X6ZMxxrlNgpfa5ZGysjzLQxnTeCNKXWg
         69Dw==
X-Gm-Message-State: ACgBeo2SvSzJaz4m3gkNduKxlggQNaytAVvnHN3hDV5y0X/8qvsodD53
        yuvc6k6If7yk3QGRRbfVNa5osXA+9/qSRDTQ6JLUai2wF84=
X-Google-Smtp-Source: AA6agR65IH2b7H3cw6P+Vl0pyULlUj/1rzcoXIXw7x1Ehz3nvBVj1H00pV2LmnhKash99i6ZD+8k7TKfpU80UAg0PaQ=
X-Received: by 2002:a05:6602:224a:b0:681:2125:a85b with SMTP id
 o10-20020a056602224a00b006812125a85bmr3542707ioo.44.1660406871637; Sat, 13
 Aug 2022 09:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
 <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com>
 <a5a60b82-4079-b637-405d-78ac425174d9@asahilina.net> <CANiq72nAajzDYdaW9bHR9_KcLUudN3FX50fvh0ObqhWS7V69-A@mail.gmail.com>
 <2e32387f-e232-58b2-611f-37a72d7db140@asahilina.net> <CANiq72=Miq=7m2eDYX2mp2udzz_uiJhLvq+Ojy3tiMxas=+qww@mail.gmail.com>
 <048d48aa-c11b-35f4-afba-47446b4ecdef@asahilina.net>
In-Reply-To: <048d48aa-c11b-35f4-afba-47446b4ecdef@asahilina.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 13 Aug 2022 18:07:40 +0200
Message-ID: <CANiq72=L3soKyYPVu4pm0qzUrj7ovYfyXNGQJU1r0AAhXA63aA@mail.gmail.com>
Subject: Re: Writing the Apple AGX GPU driver in Rust?
To:     Asahi Lina <lina@asahilina.net>
Cc:     Rust for Linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Aug 13, 2022 at 5:06 PM Asahi Lina <lina@asahilina.net> wrote:
>
> I think the main issue there is that refactoring that changes the C API
> also has to change the abstractions, so if the people making those
> changes don't want to touch Rust... how would that work out? Refactoring
> patches couldn't be submitted if they break the Rust side.
>
> (Of course, ideally people aren't scared of Rust and simply make the
> changes themselves!)

That is the conundrum, indeed. And yeah, I would think if people is
reasonable, it will eventually work out.

Given Rust is supposed to be introduced in an experimental capacity,
changing the Rust side shouldn't be seen as "scary" (initially at
least), in that if somebody breaks it by mistake, it can always be
fixed, even if takes a bit longer. I think that would encourage others
to do the changes by themselves.

An orthogonal idea could be relaxing the "do not break callers" rule a
bit for Rust, so that it is possible to temporarily break the Rust
side on purpose if there is a good reason to do so (e.g. if a change
really cannot wait for the Rust side to be fixed), especially early in
a cycle.

But yeah, this topic is still ongoing.

> That's good to know! A lot of the APIs have pretty long function lists,
> of which you only end up using a subset for any given driver.

Yeah, precisely -- I hope that makes it way more enticing for you!
(see also below on the unsafe abstractions).

> Cool! Do you know where these branches are being developed? I didn't see
> them in the main Rust-for-Linux tree yet.

I am aware where some of it is, but please contact them directly if
possible (I can help with that) -- they can give you their latest
updates.

> By unsafe APIs you mean abstractions to make the API more idiomatic
> Rust, without necessarily enforcing all invariants (and therefore marked
> unsafe), right? I think I can work with that, if so! It would definitely
> be very useful to start to document the preconditions as part of it (the
> C kernel documentation is often quite terrible at this...).

Exactly, I am referring to having `unsafe fn` functions and methods
which may just require the caller to "do the right thing" (also unsafe
traits etc.). The invariants that you require would still be enforced
-- by the caller.

And, precisely, documenting the preconditions for those helps a lot to
come up later with safe abstractions. In fact, at times you will
likely realize how you will want the safe abstraction to be while
doing it.

After all, making safe abstractions is all about reducing as much as
possible the amount of times we require something from users. And to
do that, one needs to know what we are actually requiring from clients
to begin with.

> That's odd, I've never heard of dual-licensing being an issue in the
> kernel. Lots of drivers are dual licensed, as is the DRM core as I

I see Greg has got involved with details about this (thanks!), so I
defer to him...

Cheers,
Miguel
