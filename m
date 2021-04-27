Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8799C433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFDB0613AB
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbhD0AfU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 20:35:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhD0AfU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 20:35:20 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C43DC061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:34:38 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id p3so46552419ybk.0
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/KNIDnUPhxRlZfrOdr34SgizaSPbI3ZlVG6FSpPy9wU=;
        b=oKZJqi0njQKdegs8L9M3Pqe7LIaQl1bRcJv3ZbjhrcNX53/X7H+qH7T2UizAbcd3jg
         fR+RQ9pTbF3g1aOQnbz8EymKxqblyoqj/A+wFGn03VoL26frlChv8DMyUWYNHStc9HJG
         UxLDupzne5Mgrkk/k/ZSavhxcH2Ob2XcA5e7iQCVd5V2y6ccF8rDhuqx9/wdfSY2uFrC
         55L2uJBVtOld20COhhtSxopVcD06PqgKU4eZupPd7zifMhAODpuUtbzxI6Ym4Y32M3e5
         m9WxA8/TFUu+t2cSYoeEua1WmxqIaN2q5QA34012kBAUbMzXcz1HcSvh0RUyufm70Ch+
         mMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/KNIDnUPhxRlZfrOdr34SgizaSPbI3ZlVG6FSpPy9wU=;
        b=QOAWBjsOgpmhuDmO9YbexaNKgPWIzAfdfqrHgyFYFN7JrILVn/EqfCBFHPWt6PoHKz
         Nmow9h11vsoV3gtSmX35c2tJsp5JZScqtkZpnQD5DHQdTPnoM95axwShvszzsZXIvEGj
         Rc7KaIoNgn/Nv30NXN8zLeQUyiqPQ1q+RWxwjjQRytPpX+ws0g+sjPQUp7gC34OXm3HL
         iWf3rpaDjmCZCb2DfEOu3jdnOu20iwGsb0B56SI8Wpt3rkYOLZaHafpj1LPQpMe0fnJw
         A6c1jM/IQby4lzXlDQz6zHNdjet34G9W0ag5ghfqcqNcHb8IVAqzeuMRl3B4IhnYw9SL
         DOhg==
X-Gm-Message-State: AOAM531HxFbuvT9ODdlrjuOYElA9EUqGFxXdZoyqitpfqdzSjViBOHin
        4Lv43I/XlXsNE9PMNC0FVijONU7oRIuY7e38W9trgjC+iGKKWA==
X-Google-Smtp-Source: ABdhPJwD59RwkZhLdArdYMuURcLkgZCL1puUJGtGpW04N111NfvvXUHxHCGcqjhbmMSul0X/X8YD7oWSQd/LH1xx/FQ=
X-Received: by 2002:a25:9085:: with SMTP id t5mr30426156ybl.26.1619483677685;
 Mon, 26 Apr 2021 17:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.11.2104241558400.11174@titan.ldpreload.com>
In-Reply-To: <alpine.DEB.2.11.2104241558400.11174@titan.ldpreload.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 27 Apr 2021 02:34:26 +0200
Message-ID: <CANiq72m7x1YEiYRZssrD5pqaoeU3e-FXyt6swfCsE3k9Lo-Vcw@mail.gmail.com>
Subject: Re: Notes from 2021-04-24 call
To:     Geoffrey Thomas <geofft@ldpreload.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Geoffrey,

Thanks a lot for writing the notes!

On Sat, Apr 24, 2021 at 11:08 PM Geoffrey Thomas <geofft@ldpreload.com> wrote:
>
> (The meeting also went two hours long - in my opinion we should just plan
> on that for the future, there's plenty of stuff to discuss. :) )

I will send an email about an update on this :)

> (Hm, probably we should have some brief coding-style docs on this?)

+1 I will be updating it alongside other bits in my next doc round.

Cheers,
Miguel
