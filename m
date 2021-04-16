Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8453BC433ED
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:09:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65DDD610CB
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Apr 2021 13:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbhDPNKG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Apr 2021 09:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235252AbhDPNKF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Apr 2021 09:10:05 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27644C061574
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 06:09:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id n138so44789466lfa.3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Apr 2021 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=christine-website.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/2zyPMoGvSkjVF2Ok61BCHBX3TLPPHGIQYqcnEQSuHk=;
        b=O+vS89AANbokzKLmXHR1YS+hojV51TSpGNlIAEOXBHEFhFUuVIyvfRdU++RNORVcP5
         QeXigecmjzOAwo38sZDGbW4BLj2ZU1gA/IqEMX1Degred+OAl0Y/302Lv+mGIQZClfWj
         WJOyl5xGKhzCy7CXmDjWd8UJhr05IAUESfcaE5XvdP7iOj/VpR3WMAwHJCJoucoyur3D
         5mRX0J6Y/L9ESrKWKUPrxSJQ9bHVbKljVvejmbhgJa7sBJidCc+3tSRa0izb/GfKDDmN
         vFVhl4i6z3R4i4awYon3LCixDHbnbaw9vCAdMmNC0aVqVtf1aajIw0v+OMZXjaRIuPEi
         xnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/2zyPMoGvSkjVF2Ok61BCHBX3TLPPHGIQYqcnEQSuHk=;
        b=O46ff+vhyoTzgwP0QmAcWnUeBagghb6KrGUrQ+IIOVSfWdMsgMXmSVKtn/2AoUANAd
         2AOz6/On6r/MzQNH5tVlbt3e4Csk234t50imNxYJm79Nu7T3kY5Y3F0E5Q4/cDSW5fdG
         h9Y1QjkrwFr7crjhrUyW43rlcxlmTfDCk5vYmoHT18jSrQ5yEZD4gChKAyOJJ+VIwzwR
         TiN7lJyhmR/sLBAUNGNK1j1fXXOUHMYBZfxvOff0H0+jvBi89nbpq9N2UDGB9PnVKDBb
         246PdvusgpW8HQzCQCH0aYCs74mU757xEBQrw0pCPWdyRkKlokBceaf4V3fG1yyIRCTD
         pkfA==
X-Gm-Message-State: AOAM5322xB0l3Hoyp6tudzk+cKV2Rthri7/lBAxqe8DFLgH4CxWUrgmC
        Na86qiYuLPhAWwQjmQ9GXCzQpWd8BRZt52zq0PgC3Q==
X-Google-Smtp-Source: ABdhPJy/RXVB3SyWF1qfnsEuWI0emmGGYbscd4Xvk7t1iPvreCXocgUXH+Ig8BWNFEXdvFRx3qERJpAhZz4WHWqBaJ4=
X-Received: by 2002:a05:6512:2243:: with SMTP id i3mr2955650lfu.439.1618578579370;
 Fri, 16 Apr 2021 06:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <04861911-1275-449E-BE54-C6871B53F4A3@kloenk.de>
 <CANiq72nvB7LYTc7wfuV+UM-s9wvOpObBhdJa4=odd8103x7BKA@mail.gmail.com> <BB89357B-DB5C-4D4D-A0F0-0B57F9F5CE11@kloenk.de>
In-Reply-To: <BB89357B-DB5C-4D4D-A0F0-0B57F9F5CE11@kloenk.de>
From:   Christine Dodrill <me@christine.website>
Date:   Fri, 16 Apr 2021 09:09:28 -0400
Message-ID: <CAE06CAE_g53DEB5cZr02eV-=okMPbnE0Do1vQgHR7UyZsS_edw@mail.gmail.com>
Subject: Re: Rust-for-Linux Hydra CI
To:     Finn Behrens <me@kloenk.de>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux@vger.kernel.org, linux@petabyte.dev,
        Joerg Thalheim <joerg@thalheim.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I will see what I can get done after work today. I would just submit
the tests as a pull request, right?

On Fri, Apr 16, 2021 at 9:07 AM Finn Behrens <me@kloenk.de> wrote:
>
> Hi,
>
> > On 16. Apr 2021, at 15:00, Miguel Ojeda <miguel.ojeda.sandonis@gmail.co=
m> wrote:
> >
> >> PS: I=E2=80=99m not sure If this will break if we rebase to a newer li=
nux version, as nix needs a version to find some files.
> >
> > If we rebase, does it affect negatively Hydra or some of the other
> > tools? i.e. would we be blocking some other project in some way? If it
> > is just us seeing a "red" state in the CI, then I think it is fine :)
>
> I confirmed that rebasing breaks the build. But yes this is only a red st=
ate as the build fails, but it does not block anything. Ofcourse if we get =
around to build nixos-vm tests those tests are also blocked as there is no =
kernel that builds and so can be tested. But still, this is only a broken s=
tate, and does not affect any other projects.
> We can also monitor different branches of the rust-for-linux linux tree, =
where a rebase in one branch would not affect another branch.
>
> Maybe Christine want=E2=80=99s to add tests, the nix derivations are at h=
ttps://github.com/rust-for-linux/nix and are automatically updated by hydra=
, as I should write my finals and not linux tests :-).
>
> CU,
> Finn



--=20
Christine Dodrill
me@christine.website

.i la budza pu cusku lu
 <<.i ko snura .i ko kanro
   .i ko panpi .i ko gleki
