Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFAAC433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 30 Mar 2022 00:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241192AbiC3AFr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 29 Mar 2022 20:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241159AbiC3AFr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 29 Mar 2022 20:05:47 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3812317D
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Mar 2022 17:04:02 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g22so11412139edz.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Mar 2022 17:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sutes-me.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tbTFvBJbtTRDj6B9PQS1dJEVX3QU47mRhCJu7myLmCg=;
        b=RLi5UBWQMGklwbwEVhlmRe5tqKWwmZZOahZ+0hPKWTrEmPytn0VXP8yMi9/7YOIkRX
         6JO2NKzF5iTvo6uK8YxYN0JrnzZ2iySYjZkba+Vf0nQg+luXfh4EL1DF8cMoadmA3fVA
         loAajRDglELBbNxJ4+gYh06HbVm5gq+Wm8E6UsPGE3+ZMHJM1gh9TiwR2ANwEWxoyVqV
         PkXxMI8c6xeVxy8zgksN+c86R9ZbCRuoFN1ea/OeVVITPHQY4EqEqaUpqaw2n+cj0I6Q
         t8k/HxhT2pC5cKouKHdbtiAVOpIUzk3MVlYXZGuXXeJpuqDvSixESJdIJcgEohXRUAvl
         ybyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tbTFvBJbtTRDj6B9PQS1dJEVX3QU47mRhCJu7myLmCg=;
        b=b4l0bIGT1GFb0W99tCNqGrpQLC0Blv1YTzy0fz1fr8TK6spQLt6VCgahin59KhGYDu
         USUfm+cbjBTuqsx5U/V5Ckln6tWifkCrPohTTQ+2lUAhbX2gKOZXsx3i6u7neZ2H5pLp
         WJCcHv+6Es1IP5CdO8VGNLQpn/ybFFKnPp8Mb92G3n4XHaPyfYdHPsRwNtq/wAXSj+BL
         9d82BloUpIxoqq5hGsbHUzNInNi+ka0iEY4MoGBAae9kE/sHMPiiye5Jek6Kgbuu1FfI
         bcMCihtmSu44X2TZROcQYYT9/+JJCml4UuJwE6BnDpOXKqYKpCNOMVM3J89L9nUDdks5
         JloA==
X-Gm-Message-State: AOAM532dkZfNGK7rlYv558TLbZ4lkyDcT705T/+pV/6IdfwRBd/pEa9Y
        +b5TyhXkXppX1aPSsXI/Fnld0RoJhFAhMK9rGHkJRw==
X-Google-Smtp-Source: ABdhPJx/ycIWZCvRHvJqdnOpAjkq27Qs7v9zdoQbiQ1OBWr6r9c614W+3FgRE0ctLrsd9VttCOIAkN1WTUB2C6AMVvI=
X-Received: by 2002:a05:6402:5107:b0:419:935d:bb6e with SMTP id
 m7-20020a056402510700b00419935dbb6emr7605258edd.242.1648598641125; Tue, 29
 Mar 2022 17:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
 <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com>
 <20220328054136.27mt2xdaltz4unby@gpm.stappers.nl> <CAKfU0D+gaC6s6kBBQ9OV+E9PFcm997efY-cUwP3bFWmuDDugbA@mail.gmail.com>
 <YkKXvnsvr0qz/pR2@kroah.com> <CAKfU0DLv3K7benXuofXqJwsgxUHA10bu8XWmyBZ0Z_PpZFMACg@mail.gmail.com>
 <CANiq72mrBpJm_6rjapicBoO_mkg4_hEpi9aRTAkj+gtiGkC3Aw@mail.gmail.com>
In-Reply-To: <CANiq72mrBpJm_6rjapicBoO_mkg4_hEpi9aRTAkj+gtiGkC3Aw@mail.gmail.com>
From:   Chris Suter <chris@sutes.me>
Date:   Wed, 30 Mar 2022 11:03:50 +1100
Message-ID: <CAKfU0DJ1AqR4cy4=706qRGESozHii9dPL5BYQV047cZkyn3RzA@mail.gmail.com>
Subject: Re: Fwd: Adding crates
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Geert Stappers <stappers@stappers.nl>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel,

On Wed, Mar 30, 2022 at 2:47 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 29, 2022 at 9:49 AM Chris Suter <chris@sutes.me> wrote:
> >
> > I'm interested in quite a few crates but the first and perhaps most
> > significant would be futures. I'm not necessarily looking for a
> > "generic" solution at this point, any solution would do =E2=80=94 just =
enough
> > to help me make a little progress and then maybe I could contribute
> > back later. I can probably figure it out myself, but I was hoping to
> > save some time.
>
> If you are just looking to experiment with some third-party crates,
> then as mentioned in the other thread, what you could do is copy and
> adapt the code. For instance, if the crates you need do not use Cargo
> build scripts, this may be as simple as copying the sources of the
> Rust modules into your kernel module (which is a crate), so that you
> do not need to deal with build systems.

I'm working with an existing code base and there are quite a few
crates I need to bring in or find replacements for. I'm hoping to
minimise or isolate the changes I need to make to the existing code
base. Obviously, some changes are going to be unavoidable.

To start with, what I'd like to do is bring in a crate and build it as
a library and then link it with my module. I just need to work out the
magic incantation to do that.

> But if you are looking to do something else, then please note there is
> no plan to add support for building/linking against third-party
> crates. This is why we ask what crates would be useful and why -- so
> that we can consider adding similar facilities to the kernel (possibly
> importing those third-party crates).

Like I said, I'm interested in futures. Why it's useful: async Rust is
arguably more common and easier to use than other forms of
multi-threaded processing. Other crates that I'd like: anyhow,
bincode, byteorder, log, once_cell, pin-project, rand, serde, slab,
static_assertions, uuid plus some more esoteric ones.

At this stage, I'm really just experimenting to see what's possible.

Anyway, thanks for your response. I'll keep playing and see where I get to.

Kind regards,

Chris

>
> Cheers,
> Miguel
