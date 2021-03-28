Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376C9C433DB
	for <rust-for-linux@archiver.kernel.org>; Sun, 28 Mar 2021 13:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7C7B6196D
	for <rust-for-linux@archiver.kernel.org>; Sun, 28 Mar 2021 13:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhC1NYE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 28 Mar 2021 09:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbhC1NXm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 28 Mar 2021 09:23:42 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D53C061762
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Mar 2021 06:23:42 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id i144so10959382ybg.1
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Mar 2021 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iBm6n0enEMRc3R41O+MvIBN8Xn+icCnGpt3X0l4O+y0=;
        b=Um9h7TTGzzLFXV4CPr2m0GhNe0nEbsUaeSQUkTNJpYVkVe9y/u2YiIHutNfdSYHZiA
         kTYEGQte0vcI06CoVdgqbMOqHU86zb3JxK7O8fsUIkPdsnmrV0gjhmulqhdgPwm+TlR+
         3fj4lCyxHLcUdCx83M8y6QWMkNrpVpwEwFXrRvSbXhQg7qOSwftLtffZSTWPcMNFDcWc
         WYZH3bRML+ILDkGo47SODtex4b9Yj14aYUlBSj1YH/yieOMe+PSUmRDr5RVlCYrPrqt+
         iScMkD9AnpTzsSxFpUocINSyZ20qX1pUXSij3qQ/XN/V5vSqBPf0REsSt3ULN4O4ImzW
         +AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iBm6n0enEMRc3R41O+MvIBN8Xn+icCnGpt3X0l4O+y0=;
        b=HFB7EfX+HNBNFkyiXOy0JaWZrO8tnwql41ihtFVXmDqj8KQuxv73hkUJZNDMWaf7K2
         uQh2pj+7dKnoKEEUf16AwHssWHUlQt/HqgyXUJz2BFWnsWQOP8Xm1uI9vQy0hP4SxF6h
         ow1cS3f5ebw+Yu+ZDnWrwi6DwrkzBmuTmh3iRc3Ubs4+2gZ5uJYTED5yhx0Yv5y9x2Kv
         ft1DiLruYQFBxDz8DTqBu0pVJUtRfGd3Zyy5gDH9lHdUxAoOCsjrTCb6EgQI6fNsaIfP
         2mnQRSOSIALcopUNjfgouqehve4rALx8wSk4Ii68N3qBuV6NfEBK0nr95FumDvOYfzny
         5uaA==
X-Gm-Message-State: AOAM532XQEw++xLNIY3E7XJc7XAfqtWuOq6Goq4OPoDcJPKwFIrm1EFC
        LxZR8RRfylByP5yHBssZSIrRDP3zRgfGewdvarse/rUHo9o=
X-Google-Smtp-Source: ABdhPJxbKbf1q1K9V8ItYNmpoRLJx9BzX8oSE1fiVmFaHPkqYs7HrFmfHrIOqzEZ7XIjGkpaJt2QpyuCPqX2ZtdHn4A=
X-Received: by 2002:a25:81ce:: with SMTP id n14mr24506059ybm.33.1616937821600;
 Sun, 28 Mar 2021 06:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nx1f9hPwFCLXekHDu-0=8X7srJuocryZoYEMsL9o4iPA@mail.gmail.com>
 <2EE61073-1BD9-46C7-984A-1C0861B33876@gmail.com> <CANiq72=LqB5q0D_A_AQcOHD+4aVjQaqWuoPt8=tX-+jSckmFEg@mail.gmail.com>
 <20210327114912.cfeqqvxpjn7wgghs@gpm.stappers.nl>
In-Reply-To: <20210327114912.cfeqqvxpjn7wgghs@gpm.stappers.nl>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 28 Mar 2021 15:23:30 +0200
Message-ID: <CANiq72mBd7_gWxvTd8e9q0SMROkPcXK8BBVuUJapC1tgg1ugOQ@mail.gmail.com>
Subject: Re: [Rust for Linux] Call Sunday 2021-03-28 18:00 UTC
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Mar 27, 2021 at 12:49 PM Geert Stappers <stappers@stappers.nl> wrote:
>
> When to expect the invite? (When to start worrying "no invite for me???" ;-)

I'm creating the event now.

> Are people without a Google account also welcome?

I am not sure if it works without signing in. Please have a dummy
account ready just in case.

> Will the invite like "Dear citizen of Troy, we made a beatifull horse
> for you. Come to our site to download it." as a Microsoft Team invite?

No extra software needed, only a browser (Chrome, Firefox, Edge...).

Cheers,
Miguel
