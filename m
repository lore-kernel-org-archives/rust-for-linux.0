Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A904C433C1
	for <rust-for-linux@archiver.kernel.org>; Sat, 27 Mar 2021 15:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B46A619BB
	for <rust-for-linux@archiver.kernel.org>; Sat, 27 Mar 2021 15:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhC0P1z (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 27 Mar 2021 11:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhC0P1w (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 27 Mar 2021 11:27:52 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B479AC0613B1
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Mar 2021 08:27:51 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id b16so9578399eds.7
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Mar 2021 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5TsygeJ0deLdYhNaKrY7yG6gfj5AT0v3S9BNw7zfUrA=;
        b=SNWEHUMopLcXYztAGaAnzbO0NzEBWwZ8IDUplNm57avya8rP6FuYYphOb6T0d4WbHF
         WdM142aExQTMh/5JzBRJQkjCOWOlKAn9crfG8ldFROcOM3k8euY31RN4sPI0ZgWlqdzy
         suNSPvW7adaPMnor0duorMCJOAcslk5rftiXv8ZiDQmZXXYq5N2oqIswWan/xKeYaliV
         g7f6mWdYgRqYnoNJt7Btz+mWvkCDhUUQAlKNL0Bxfy1qDfqKMgemQ9aDN/OBeB5bXRP/
         8bn4aiJTNroBDQET7eGFfYDMhCjdFux6f3O5NYV3fQibrKWI3ZtnAWvh6F2iob6hrz7B
         bpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5TsygeJ0deLdYhNaKrY7yG6gfj5AT0v3S9BNw7zfUrA=;
        b=bCXxWmfmCUsLWhBTg2G16JsWTfbWw7hK3ZF4nB6MTtht5xbM+g0txueHxms0nRbTsu
         BdL15V/93doaojJZNIPiDhy5NOH/0DyaPE3i8/AbwzSTyLbC2ka2btJZvNWM5y5EHsnu
         e7+qJ215XnH7cKHd4rkueSP58k40/ptieJg+U3CldbAVbkWhnyPnD6uC+kifUx6fgb5Y
         ivhp5NRxMxicY+rh3THTbLxSSCiMa0eJASPDKc0bnI06aYVGRl/TPo6cax9xmp9KPiiu
         7CuVdQigT2MlZOHW52uva6vWrghrMhWR5TbGmQohr2EtMEuzyrz9h5qxEmz7lb2zk2AJ
         aoFw==
X-Gm-Message-State: AOAM532hmkhnTvkzD4EG5/0q1b7kQr3m0f0u24mZJ7QhpSSc7DLOdqba
        YBeT1ixl6YA7uJP5ouEIXAkVGf6L6S3CakZXVew6VXAPa3A=
X-Google-Smtp-Source: ABdhPJwyusENR0SHbLCmd/iIJTUH56lDQI+iLEc1gJPAqJO/UZowhmHMXOAdJNcHBgeU4NCzblCJih0YtGBQa3hM08U=
X-Received: by 2002:a05:6402:270e:: with SMTP id y14mr20770264edd.283.1616858868986;
 Sat, 27 Mar 2021 08:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nCOKy_rUmxpqt=s4PX3veentT-jz38c7Yti0tr2X3FSg@mail.gmail.com>
 <CANiq72mJMCgZxKyRDyQnkKi5U=6ejZq5yFRx-UyLC3yy7mYR2Q@mail.gmail.com>
 <20210324211237.zsdycx3ikq2siweh@gpm.stappers.nl> <CANiq72nx1f9hPwFCLXekHDu-0=8X7srJuocryZoYEMsL9o4iPA@mail.gmail.com>
In-Reply-To: <CANiq72nx1f9hPwFCLXekHDu-0=8X7srJuocryZoYEMsL9o4iPA@mail.gmail.com>
From:   Joshua Abraham <j.abraham1776@gmail.com>
Date:   Sat, 27 Mar 2021 10:27:38 -0500
Message-ID: <CAMmOe3TEXedCx3=qNZbdy9+uAKYTY_Bp-JE3NE2Sh4OVn+e96w@mail.gmail.com>
Subject: Re: [Rust for Linux] Call Sunday 2021-03-28 18:00 UTC
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Geert Stappers <stappers@stappers.nl>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Miguel,

On Thu, Mar 25, 2021 at 3:17 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> We use Google Meet -- I will share the link privately.

I would also like to attend please. Thanks!

-- 
Respectfully,
Josh Abraham
