Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03607C433C1
	for <rust-for-linux@archiver.kernel.org>; Thu, 25 Mar 2021 09:26:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BDA861A0E
	for <rust-for-linux@archiver.kernel.org>; Thu, 25 Mar 2021 09:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCYJZs (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhCYJZY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 25 Mar 2021 05:25:24 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257C7C06174A
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Mar 2021 02:25:23 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id i9so1587716ybp.4
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Mar 2021 02:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=goGtzj6FkBzaA3Jk1eFH8je07++nn63Ebkpy016PwFA=;
        b=LzI8d/eNBHGRu/OaY+VfJ3dh7xi3AEW2lqiAHoPSAWqwroxVeOo7t9wq+Iu+giGjaS
         zy5BrNj2QT3ipCaoagFIu+DWz3Gih1pWOfWhzbq4C5I33PhKic5Vds+Qr/RVyPNM5F+i
         aitFq/Z9yPlWBjWIDhxIscrmsWgOR47Ae8SWRlny5HxSaZMRp5UWzCs4fnh7yx0FGdrj
         8mFMvF3rRxH2fQtH8A6G6xgXTu20AEVUMP5ypTypD0msgucPeL85U0qfFADfIhk9sKV9
         et40DPY8wyPTFacTkJRM9pf5q7pNUVzy3kIM47OnLUabzdIgw93h3XFNrooAczRL806x
         FBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=goGtzj6FkBzaA3Jk1eFH8je07++nn63Ebkpy016PwFA=;
        b=RRf1PdR9Ol672rWIkAXvtggQXpd5MW5OzNCKCqLuLQDaFpYR7qcp45UTPbk4ewtyZ7
         R+iPDMkS2u5t4EtaAHWuEzBlG+/FALXRgwpM6kRsCUXJisgjTpDh4NEXBv6oigI8XHmy
         7VvclOozUw3B1d7E3QlfZozVGS9MK1ofEf6ODTdDiZQpC6C5ox6VpLztMRpm4IKvXHvn
         /KVXqNhTuqhKqTv0wGjZa+AVk063sMVKtbVW9rV+OrIr2tsPWnvza1yGl7s8ESttxl8E
         gM/HSRG+zBd9Oi1C0LSlZxiKqDC9EoKV5pNamvdw0p5rJ1zmLicF15k8GuwwYa8jTSbq
         +MOg==
X-Gm-Message-State: AOAM5324w7xw/rNTaDgQwFTWRNOfbjXLwj962tFO7lZpdaxJSA64ppxZ
        /CS8RcJ6yVU0//+x3uQVC40YNlbeQGdsTGdP3mdoVf+Gpl0pEA==
X-Google-Smtp-Source: ABdhPJyfD5pxq1cgj8cajENVdh0ZXoDOMvBVivKd/xmDs3yqFr81X357xAZtxK9qoeerHhOvHC2tCeDiUVpKYh5AJZI=
X-Received: by 2002:a25:e748:: with SMTP id e69mr11072710ybh.93.1616664322335;
 Thu, 25 Mar 2021 02:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nx1f9hPwFCLXekHDu-0=8X7srJuocryZoYEMsL9o4iPA@mail.gmail.com>
 <2EE61073-1BD9-46C7-984A-1C0861B33876@gmail.com>
In-Reply-To: <2EE61073-1BD9-46C7-984A-1C0861B33876@gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 25 Mar 2021 10:25:11 +0100
Message-ID: <CANiq72=LqB5q0D_A_AQcOHD+4aVjQaqWuoPt8=tX-+jSckmFEg@mail.gmail.com>
Subject: Re: [Rust for Linux] Call Sunday 2021-03-28 18:00 UTC
To:     Kaviraj Kanagaraj <kavirajkanagaraj@gmail.com>
Cc:     Geert Stappers <stappers@stappers.nl>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Kaviraj,

On Thu, Mar 25, 2021 at 10:02 AM Kaviraj Kanagaraj
<kavirajkanagaraj@gmail.com> wrote:
>
> Are people in this mailing list invited? Can you share the link here? I would like to join as well :)

Yes, of course, everyone that wants to join is invited. The link is
shared privately to avoid anonymous/unknown/bot joins, but that's
about it.

Cheers,
Miguel
