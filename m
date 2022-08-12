Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2BEC00140
	for <rust-for-linux@archiver.kernel.org>; Fri, 12 Aug 2022 17:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiHLRs7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 12 Aug 2022 13:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiHLRs7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 12 Aug 2022 13:48:59 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18737B780
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Aug 2022 10:48:57 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id r6so818938ilc.12
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Aug 2022 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0uOe8wyMcrRVE/uhkMLbUXoo8rBoMi5Ga/91+WPjUUE=;
        b=acqzM9wEVh3V08Lv89uMT/Tc/30xZz2YOLk9gvH+CUEyH7bBciFU1ePu9hFnw3Qc64
         SV/9b7HFzId7fKfUpwB2y14aLxYJL517wXXlqOMFWedj6y3ZU82c8A7q6WmQfjKOmPzM
         7MSDekpf55ol6kMDoNj1aSO4Es2qifr4ADCYfNqhv0ZjmNX6SccfwWOApn7mISE48E22
         GA8Xmjmmrf222RXvnvomLcSn889h3Y/NmRHlkU19leDISa2OUpX0qthdXlCMEggRq8YI
         nJqwGZ8khkV+keRfCIUHRGbLjlhM2cd0oGRF+DMblfhSrNVP1A1qlPQTluDksC6GZUpu
         H5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0uOe8wyMcrRVE/uhkMLbUXoo8rBoMi5Ga/91+WPjUUE=;
        b=ILlLJLenYKZN3xSBwwFvIe+Oqbxe46M0odgnfR09ZsQ8FaIQDX5hn39/wDIoMWlESR
         6dDt+J+s3oZYxy3ZO3MG/za4AoXVzNuDnjXrfcGfMpQj2n2/Ldf1YuW1zP5lWvVuAJR2
         wAA4tKhMikVd0wAvbcgGqeb7gtrxC7sY06iSqgU+WBaVyYYO4cPysybtiCd4MgrchIU0
         fgBfzMFQIICe6Kx6E3JUFuLzXkcyov2Muj5yKnt9Q6SOD6ocN4EkNhiemj+HShUPqVkb
         SGfUi5wTsasr0NWtCuSJTDClSNxZXlK8ZaP7B4/GRTZM2jAKfBLn11GKm+7iZm3PBfn1
         BNVg==
X-Gm-Message-State: ACgBeo2dvKFn0KlY0KMqwzEwLBYzLmSGngUVXNfb7mhHLkXyJOpd2LPB
        1Tq+/OAXFkLDKpS+2/iJNV/PQFJ5Ehd9wGRMBI/l4oLb
X-Google-Smtp-Source: AA6agR6yt1+CXXcgpUGPP3LrO36GysNQN/d+9BHXpaSesORhqTliY6H60On3Hk8ZZgNXT6XqQjaoU22zyDJQyQWVJRc=
X-Received: by 2002:a05:6e02:17c6:b0:2dd:d9dc:6387 with SMTP id
 z6-20020a056e0217c600b002ddd9dc6387mr2301856ilu.321.1660326536184; Fri, 12
 Aug 2022 10:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
 <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com> <a5a60b82-4079-b637-405d-78ac425174d9@asahilina.net>
In-Reply-To: <a5a60b82-4079-b637-405d-78ac425174d9@asahilina.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 12 Aug 2022 19:48:44 +0200
Message-ID: <CANiq72nAajzDYdaW9bHR9_KcLUudN3FX50fvh0ObqhWS7V69-A@mail.gmail.com>
Subject: Re: Writing the Apple AGX GPU driver in Rust?
To:     Asahi Lina <lina@asahilina.net>
Cc:     Rust for Linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Aug 12, 2022 at 6:01 AM Asahi Lina <lina@asahilina.net> wrote:
>
> But this also ties into the question of where the Rust boundary is: even
> if, for some reason, the DRM folks were against Rust bindings entirely,
> I would still want to write parts of my driver in it, even if it means
> calling into them from a smaller DRM C driver, since it would make my
> life much easier as the author/maintainer of this particular driver!

I guess it depends -- for instance, if they would need to understand
what is going on in your other Rust code for some reason (I don't know
if that would be the case here), and they cannot easily follow it
because it is in Rust, then it could still affect them indirectly at
some point, so they could have a reason to oppose it I guess
(personally, I think if everybody is reasonable and willing to learn a
bit, that will not be a problem).

In other words, we would love to see Rust used everywhere (of course)
but we have to be mindful about where/how we introduce it (we are not
even in mainline yet), and be as much in agreement as possible with
maintainers where it may affect them.

> In particular, trying to make a comprehensive DRM binding as a
> prerequisite is a huge task, especially if you want it to cover KMS too.
> DRM isn't a self-contained API surface like most smaller subsystems, but
> rather a large collection of modular components that are intended to be
> reused by drivers. On top of that, KMS is quite complex from a
> programming model standpoint. There's a lot that goes into display drivers!

There is no requirement to create abstractions for everything of a
particular subsystem (sorry if that was unclear), i.e. what I
understood from your previous message is that the subset you need
(e.g. the render portion of DRM) would be feasible to tackle. Is that
correct? (i.e. I am referring to the first approach you mentioned)

> Of course, it would be great to move towards a world with more Rust! I'm
> just trying to be practical and not bite off more than I can chew right
> off the bat. I do hope that if I can do this in Rust, that might help
> the Rust-for-Linux project along the way and maybe encourage other folks
> to try writing new drivers to Rust (or rewrite existing ones).

Yes, definitely! In fact, I am confident a lot of people would love to
see Rust used in such a "big driver", and it would be a key driver to
showcase what is possible (this is what I meant when I said if you
happened to write a subset of the DRM abstractions, then others could
follow your lead later on).

> That's why I went with the proc macro approach, which lets me write the
> code once and keep it looking like normal Rust code with something that
> looks similar to #[cfg()] conditionals, except then it magically becomes
> many code variants in a single compilation step, without involving the
> build system (more than it already is for proc macros). If I were doing
> this in C, the only reasonable way I can think of doing it would be
> #ifdefs and multiple compilation of the same files with different
> defines (or multiple #includes into one compilation unit...).

It is probably a good idea to check with those sending the MiBs of
generated code, in case it is a policy.

> Thanks, I just joined!

My pleasure!

> By the way, just a minor thing: I noticed that all the rust-for-linux
> code seems to be GPL-2.0. Was this an explicit decision, or just a
> default? The DRM core is dual-licensed GPL/MIT, as are some of the major
> drivers (i915/radeon/amdgpu at least), and this allows OpenBSD to also
> use this code directly. I'd definitely want to use the same approach for
> this driver, since I want it to be useful for other kernels too. So I
> wonder if it might make sense to license some of the Rust core (in
> particular, proc macros and common code written in Rust) more
> permissively, so it can be directly pulled in if other projects want to
> reuse some of the drivers that depend on it.
>
> I think the subsystem bindings matter less here, since those are
> naturally very Linux-specific, except for DRM of course, so this is
> mostly about common scaffolding code.
>
> (It's probably a good time to think about this if it hasn't come up in
> the past, since changing the license after it's upstream would be a lot
> harder!)

We discussed it soon after starting and everyone involved agreed to
use GPL-2.0 everywhere. There was also some discussion about a year
ago about reusing a file for GRUB modules written in Rust.

I can raise this point in Kangrejos/LPC to see what is everyone's
position on it.

Cheers,
Miguel
