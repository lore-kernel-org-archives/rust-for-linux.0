Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CA3C433E0
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 18:05:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32B0764F38
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Mar 2021 18:05:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhCQSEz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Mar 2021 14:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbhCQSEv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Mar 2021 14:04:51 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEACC06174A
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 11:04:50 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id p8so4072339ejb.10
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Mar 2021 11:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+FflRMqMc/sOMdJs90tDgDKtpvJCFcnPl7JM2uGYlnY=;
        b=KZubUiuk+sbJmBhug18kOn8s+2hTs8iPO1OVprsmb9Nf+L2tl8smEbVOPUgEQKfMdb
         Eocrjrkiv5xnjaxWiuI7zNa72X04bd2c0rHHgXHs3Nne/iM3FMsby/WyavWO7nGmo/YP
         FIKAYo7O3nMbxogSflVkdbEE4kcaPW8qLkAd/zf6z5n8BzJQwsrq37rSlu773vvqIFSS
         OsQuSeZGR2Ocxq3J186VDYU8AMx7EdGp4ScaHO9l6sVsv+kURe0e9LwxwRjJ6S6B3oov
         VOzL8VLgv/AZr6Cj/h7F68oEi4Xc80/kup8bI4AMYIV7hgOhLE3YL3DwvKnn0auvXa8C
         dIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+FflRMqMc/sOMdJs90tDgDKtpvJCFcnPl7JM2uGYlnY=;
        b=aIJgXQul2sIl073+KI98eK0z4xYZM3IqXqp9PblJXo8j+z7NVwCFYoj5/sB5+lekxf
         h4ZLllhiRCvrkR6Bl+VqfL6ho/OvUGImVFGAKITWPxzYRq+8Vo/FUdn6sTJ3ZvGAaLyN
         EdhhTYBuD2pTT4cFPfQU18mwmtqcdZTrf9WRclk+aG557NndLS/ZLA45ggwmBnyP73dj
         dIU/lq40weyOkjnVY0qVRGUQlprP+mdF+kAz5z8l2TuqBmWw1Ps7K3M663qMhndami8b
         UJ5iWiuZ82kl0Be1Cw8DHdwg/HT8UEgSyoKLrSdetJe3afvd1etl0t02n35dLVCzfnwe
         1a8w==
X-Gm-Message-State: AOAM530mxnPcy/pjnErghLbg8/rIf2wL02qKU+j1HL78E62ZztIfKdJz
        7ffSYoWSZ+/M6VfRApFYVSNkhYCEzAmIzsc3+hk=
X-Google-Smtp-Source: ABdhPJwoRrNfyUZNPKTLd6f5GAsqrdEwBIjCzdMZ72hGiO3M5t+QIC9R4mhCabBqpMj8Db4QnXzwsgToHzClzvo+mzo=
X-Received: by 2002:a17:907:76b3:: with SMTP id jw19mr36165571ejc.202.1616004289442;
 Wed, 17 Mar 2021 11:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210315063044.ur3lvxv7emo2egu4@adolin> <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
 <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com>
 <CANiq72=2FJQ7Ct_77MsaYe-3qThuRJ-gkLFvY-acq_GmhR9A4A@mail.gmail.com>
 <CACAkLuopZwyXSMX0TNK_AV=nSjSp7++mXJ7PNeg2_j1bNxrekQ@mail.gmail.com> <CANiq72nNJgZJ2Be4NWk8MWpxhBbCA6Ry8o88KsgzkZwGCUxNvQ@mail.gmail.com>
In-Reply-To: <CANiq72nNJgZJ2Be4NWk8MWpxhBbCA6Ry8o88KsgzkZwGCUxNvQ@mail.gmail.com>
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
Date:   Wed, 17 Mar 2021 23:34:38 +0530
Message-ID: <CACAkLurXhRBUF8jFCPTwK8eXHHDtN-15Btw21FcUqOOJKifdBQ@mail.gmail.com>
Subject: Re: Build system can't detect rustc
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Mar 17, 2021 at 7:10 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Mar 17, 2021 at 11:32 AM Sumera Priyadarsini
> <sylphrenadin@gmail.com> wrote:
> >
> > Specifying  clang did work, thanks! I used "make nconfig" but I am
> > guessing it would be the same as what 'defconfig' would have given.
> > Here is a paste if you want to take a look:
> > https://paste.ubuntu.com/p/dMb3bb34Qf/
>
> Please note that `menuconfig` (and similar commands) should be run
> with `CC=clang` as well, so that configuration is done properly for
> Clang.
>
> It would be great if you can confirm `make nconfig CC=clang` would
> have worked for you (to start from scratch, including removing the
> configuration, use `make mrproper`).

Sorry, I missed out on this- yes, I did specify CC=clang with 'make
nconfig' as well.
Without that, 'make -j4 CC=clang' started asking for config options as
expected XD

Thanks for all the help :)

Cheers,
Sumera

>
> Thanks!
>
> Cheers,
> Miguel
