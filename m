Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6139BC43461
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 20:22:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BD3D61177
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 20:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbhDNUWe (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Apr 2021 16:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232571AbhDNUWc (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Apr 2021 16:22:32 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585EEC061574
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 13:22:10 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a1so24678218ljp.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 13:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6thTORuT8bN7jwK094fMT/y8sU4GZakkr5R6ovUTdHI=;
        b=UAoa76Qtsf0pbMc9IJqG9ooEMfjhEIrknCxndD8VY6cPrguml69YvPFqGmlzuBSQzh
         FrdelVohMGw/UXPitS8jaS0vYBU01i6SIHCs/u+B0uDNa1/+o7AFCQGtYFo/uY/vW9FE
         e35iod5n6V1pTvp83DTqqYHvpeFqDSO7Dx/Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6thTORuT8bN7jwK094fMT/y8sU4GZakkr5R6ovUTdHI=;
        b=etvRlLyNd/bGuTd5aTo8OfnS+CR6qbZ08oRUKqakvFj0Uk2vUP3u7VqE3uQKP7hsyh
         giNlRLMrhqszbyXW9JOCGuiJxSd5FC3S8q+OmU7b39pBeCv5PM8T9c0XuLFkxyGHaNPR
         UU/o4T8VNpfVorOraq52TWqkFUIL79My1uCKPAcYRIjqyjCi4jnN1PApiMi5sjYYciZR
         sKK/JKY77yaRdvXjq1NLj4AKNPtBGHZXCq8gFrsXbPsKp1st4dPPoK6zxcctvb87zuer
         qTY1LVYbUyM4feXFf6bbreXr3LSiWCPyD0f56FsHuCRC9+UrAlc5cI70dtfJDKTQrr5q
         U/QA==
X-Gm-Message-State: AOAM530pMTMdiWWSuLqc6bCKIPhW8jXx0rWzCr6Mu5/xeZLLUjJxIG8E
        ZLovqirHkgry+eX9pKwAb/oJQvd4q2jgp6Yc
X-Google-Smtp-Source: ABdhPJzclhPW3wwMY52x3eFEOI87qhrl3mgP1/lsaf4Od3M6sX7o87kYX5aD8tR2zKq34HRrkWjo8A==
X-Received: by 2002:a2e:a790:: with SMTP id c16mr24741457ljf.119.1618431728680;
        Wed, 14 Apr 2021 13:22:08 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id q3sm192637lfu.304.2021.04.14.13.22.08
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 13:22:08 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id g8so35357642lfv.12
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 13:22:08 -0700 (PDT)
X-Received: by 2002:a05:6512:1286:: with SMTP id u6mr16109842lfs.377.1618431727841;
 Wed, 14 Apr 2021 13:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414200953.GX2531743@casper.infradead.org>
In-Reply-To: <20210414200953.GX2531743@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 13:21:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
Message-ID: <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Matthew Wilcox <willy@infradead.org>
Cc:     ojeda@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 14, 2021 at 1:10 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> There's a philosophical point to be discussed here which you're skating
> right over!  Should rust-in-the-linux-kernel provide the same memory
> allocation APIs as the rust-standard-library, or should it provide a Rusty
> API to the standard-linux-memory-allocation APIs?

Yeah, I think that the standard Rust API may simply not be acceptable
inside the kernel, if it has similar behavior to the (completely
broken) C++ "new" operator.

So anything that does "panic!" in the normal Rust API model needs to
be (statically) caught, and never exposed as an actual call to
"panic()/BUG()" in the kernel.

So "Result<T, E>" is basically the way to go, and if the standard Rust
library alloc() model is based on "panic!" then that kind of model
must simply not be used in the kernel.

             Linus

           Linus
