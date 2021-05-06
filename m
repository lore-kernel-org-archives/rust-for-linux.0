Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D20C433B4
	for <rust-for-linux@archiver.kernel.org>; Thu,  6 May 2021 12:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B55D613C1
	for <rust-for-linux@archiver.kernel.org>; Thu,  6 May 2021 12:47:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhEFMsz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 6 May 2021 08:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbhEFMsy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 6 May 2021 08:48:54 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A405AC0613ED
        for <rust-for-linux@vger.kernel.org>; Thu,  6 May 2021 05:47:56 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n138so7613408lfa.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 May 2021 05:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QzEhbEsMPT0RAPd1e91T+mtb6uxkgCOagogsHHD+eZ8=;
        b=Ks4nME/nPDpiuCR59p2B2xWzX2AYOmCJzm4REQpSn4ozFkIMOPSUaWXVEwcPIc4xyQ
         /h/8FA83Pe63a9B4OsKLVtiF+oz11lDf0JTY0Nrd9qrebslmObz5Ypz0Gz1hTRDzKP2j
         VqxNzfQVUd8RPj/vo9zPpRYyZSk4aFNGAgziomJb2ZrXcFnaEFbVdi4BRH2/5cHXHWkt
         lp9+3khZACAlWA5W6hz3CYTVxwHDfHI9CGl1MoHyCeKD8UrE3WcIrz9uSDezslqePeqc
         wV081/jHVKrG2qYS+BZVI099G5yt3aR4TATmjDcF4wJ3EMrnwEPL5Emo1GkHIqM9iFxK
         zw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QzEhbEsMPT0RAPd1e91T+mtb6uxkgCOagogsHHD+eZ8=;
        b=AtZXU8OD0MrZfaC1JH4isI3cXhLC9X+zHu9DbGdd+xAu5kf51SAL6UN0FZ72SHnYam
         afVs2b53ND34df+yFskrzU3kzObgwt1eSinnZGiVR72ua3waGD3Stg+zmVDaZUOMgNYZ
         7fejC90X9qIW8TKskA+2IVdPcqCHP6gTix8YOcFg6adkDyxsZNScHIHhiJ3QgPmPz5eI
         10mEvIXWc+QuJItEsMHDYw1ZrpdIkoQFbUcCbC2C8GC2/N+k3GHQ+MWSeTPVd0dDKXU/
         bZ6TasLkJq1VKqJTuDdyiUmJzSxohUYaBWLIn671UUfO42Ygfm4guAEQe4JvDTanTjXP
         j72w==
X-Gm-Message-State: AOAM532A4PqQHCLe5yDf856uGcOvKfdnrfYmsljtI2ipy7obVlgAqWxi
        qKsv7ijoYiseGceJByEEm1B+KwTgzQTQGefhguoKHg==
X-Google-Smtp-Source: ABdhPJwJSNb8W1vk/3K2xi7xKhIaQoHWBzIq30udueCYblsY75ozgEgTP9kUERq+loNLHdEeI4qZI/JWoOzp/xuldN4=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr2712552lfn.465.1620305275123;
 Thu, 06 May 2021 05:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
 <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
 <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com>
 <CACRpkdYzqy69G1Fpj4rFQFS+mYmpbQAzTszwCUBuEhe4YW4cuQ@mail.gmail.com>
 <CANiq72k+x13L+sFkjtDLahcvnpEySqk_NGow6FVMZfrV+MmHPw@mail.gmail.com>
 <CACRpkdbNv4O7zs0OpZhWa2fkXkF5arQgDOF9++zKvr+yB5yk_w@mail.gmail.com> <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com>
In-Reply-To: <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 May 2021 14:47:43 +0200
Message-ID: <CACRpkdYpM=38K2WLS-+R2OhWweO8Q9SFndgGC2Py7uBjjxNdAA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, May 5, 2021 at 4:17 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, May 5, 2021 at 1:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > Right now it seems like those organizations and companies
> > would be some academic institutions who like rust (because they
> > study languages and compilers) and Google. But that is a
>
> Note that there are quite a few major private players already
> involved, not just Google! e.g.

I was referring to entities interested in using Rust for the
Linux kernel. Not just "using rust". And that interest is coming
from Google and a few academic institutions AFAICT.

Yours,
Linus Walleij
