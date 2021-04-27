Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E7FC433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 15:22:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9B7C613B2
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 15:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbhD0PXU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 11:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235974AbhD0PXT (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 11:23:19 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E4DC061574
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 08:22:34 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y1so15406435plg.11
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nBDHdVX5AfxZSKdQ73biB9lEzLB0/esIoZK2ZB8CIJk=;
        b=dZOO12nbOBIhfCmMl/BjhWzRBNhv2MmdIkDne1/tcQ8gCZHBaxIMcDRY7UL0Numeii
         CLIMFApPs4vPTxkrikUzN858ykwclmhusbpO1WcFUZIXpDYle/aob22TwpcWmPZbZFk8
         8ipUwIlQscU+MIA98ojvix7ihMdkWtGziSmTZ7waj/UCAQRLn4n2p34N9dh/eCnDksIG
         F+yAbz2jt8MpG7QC+EvO0yYh+H7PvUodAeIEGGT+K3mmcP6mzwop8V/DNDOv3aPjVq2N
         1/CPn5vt3fEbTwobPG3qE1JYeNYczUovyY/pLvBZ7A0sfsqUdtT1GdfuViX4EoH5AfZY
         mZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nBDHdVX5AfxZSKdQ73biB9lEzLB0/esIoZK2ZB8CIJk=;
        b=aWlpeA9tu7vF67YixKcEM6FQAn+Ew15sgnWv3SugOseGM7WxzJpETQIEKSMX9vCPOd
         O/zOAkb2fmWhZ58Dz6V8hupBxMWl8AaCC1OMEoQ/vfJtIS7/4OLN4h4F5xAQ5VEYtvgK
         WViD4jBzadgmlhfRUMoi8o10xe0F7FxwUrr7w70u4Fadne5eoixHwEDnzWZdcZ8ePITW
         vzplusH/j9xnb2tnRmswRUnH3k6X6CTtolYJfxQa5etwuebvtootJTCuPlvRVpP8l3ll
         FHC0sg+Sup4nlhIIF0aiTZTTewGcS2AiD3ZOE9uytZ6a4nJ1M2UQvJBfdvvZag20wr5G
         t8hQ==
X-Gm-Message-State: AOAM532EzrarpZW2FwaujS+OmT5spp7otZN1r39HIrzAMDI+1+oWT7CZ
        nMvxPD+Sfu/nkPjxcr3eFQ/Omoh+uhjH2mrVwAk=
X-Google-Smtp-Source: ABdhPJzE5TF00FEUcxqTartW7Shn0GO77PmHLY5f9TJsG8LlXWzh7kGub4aIR0F4t05W2YmoCjKx5DkXEbmSuEDBgNY=
X-Received: by 2002:a17:902:8688:b029:ea:f782:5eae with SMTP id
 g8-20020a1709028688b02900eaf7825eaemr24622788plo.15.1619536954447; Tue, 27
 Apr 2021 08:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210427152015.GA4653@agape.jhs>
In-Reply-To: <20210427152015.GA4653@agape.jhs>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Tue, 27 Apr 2021 11:22:23 -0400
Message-ID: <CAFRnB2U6cXM3V2-cFXPMXBo-BxbzBMNb=PSX9GzW2qwvSs_Fjw@mail.gmail.com>
Subject: Re: Question on Box<T> smart pointer
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Box<T> in the kernel allocates on the kernel heap, via kmalloc. This
is done by providing a Rust GlobalAllocator:
https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs#L11

Alex

On Tue, Apr 27, 2021 at 11:20 AM Fabio Aiuto <fabioaiuto83@gmail.com> wrote:
>
> Hi all,
>
> I have a question. There's one thing I miss.
>
> If Box<T> smart pointer allows allocating space on the heap,
> how is this behaviour overridden in linux kernel Rust?
>
> I mean, in c we have all API's to allocate heap space,
> but using "pure" Box<T> in kernel space what kind of
> allocation provides?
>
> If this question is stupid I apologize in advance,
>
> thank you,
>
> fabio



-- 
All that is necessary for evil to succeed is for good people to do nothing.
