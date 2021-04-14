Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD32C433ED
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 19:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C520D60FE8
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 19:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353396AbhDNTbx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346010AbhDNTbv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Apr 2021 15:31:51 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9F1C061756
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:31:29 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l22so17154170ljc.9
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8tmkl21nBTrgg+zi0wiLnvNOnvLGFNGElqoYB3gSO4k=;
        b=fcsPK/9hZwnNtEOdCgJlxw05JK+JnScQC6KTDZz/6X9MVaflY6Jqqe4mj4BbDYGIn6
         D5cRaqLVGf110aJOYDRuUskjfvklEd0pqbbD6FIOHNNLHu3Y3CC1Te8apRSktxKYlGWX
         ozpACYQ9P5BsjDg3WbdRsGj5aS6Iw1MmwYSsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8tmkl21nBTrgg+zi0wiLnvNOnvLGFNGElqoYB3gSO4k=;
        b=K9bNyDjo0lnNHBCs3Y3VC7Xl4C4eNxueNfMyI9sJHjJtHWNLPhYUc+dQSRXQqFYhnA
         VabW1XyhQSYysr/1x4ASsfWmaqNZPktdTbJw7xBQxQM7ahy/GKolhKdlNp13Qno3n/As
         vy3QDuHX3R3headgtaClwTTBFYTOP9QsWK4g4Vk/xfvMNAdXqYTa7H9blPu8B59G+/SG
         Bnu7grkwC3W/u+E4VGCHM5nlywgju4xs3E6FDk7AXc/fPi/FjwlqcrN8VHszmdH31wjz
         bhUnjkGlH6U8gDevpBp9qICYgZpRFbxM8CbpUqqACTVNn0eBQFhv2k6kFVhPuS4m6PJX
         zXFw==
X-Gm-Message-State: AOAM532+9dD7bq8xomQ6EAGXRSwMXw9d6/0RZM/V7ZAWs+oQq1XWgz3O
        QVD0zrsrPcA08J1PXByr1UPnXn++h9EKt4Fc
X-Google-Smtp-Source: ABdhPJxKENpmd5AnP+BoJYCR/JRd7B/2X7ZNEG3nKcr0esAbuttGJp+v05qdbX/I97qFYbIzRznJfw==
X-Received: by 2002:a05:651c:307:: with SMTP id a7mr13962746ljp.166.1618428687088;
        Wed, 14 Apr 2021 12:31:27 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id h28sm158312lfv.26.2021.04.14.12.31.26
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:31:26 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id a36so13666347ljq.8
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:31:26 -0700 (PDT)
X-Received: by 2002:a2e:8893:: with SMTP id k19mr9184503lji.465.1618428685906;
 Wed, 14 Apr 2021 12:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-8-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-8-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:31:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVY56LzwV_G075NEFwsdf-p7GOTy_cB7-UU9b=49rB1g@mail.gmail.com>
Message-ID: <CAHk-=wiVY56LzwV_G075NEFwsdf-p7GOTy_cB7-UU9b=49rB1g@mail.gmail.com>
Subject: Re: [PATCH 07/13] Rust: Kernel crate
To:     ojeda@kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
>
> +#[alloc_error_handler]
> +fn oom(_layout: Layout) -> ! {
> +    panic!("Out of memory!");
> +}
> +
> +#[no_mangle]
> +pub fn __rust_alloc_error_handler(_size: usize, _align: usize) -> ! {
> +    panic!("Out of memory!");
> +}

Again, excuse my lack of internal Rust knowledge, but when do these
end up being an issue?

If the Rust compiler ends up doing hidden allocations, and they then
cause panics, then one of the main *points* of Rustification is
entirely broken. That's 100% the opposite of being memory-safe at
build time.

An allocation failure in some random driver must never ever be
something that the compiler just turns into a panic. It must be
something that is caught and handled synchronously and results in an
ENOMEM error return.

So the fact that the core patches have these kinds of

    panic!("Out of memory!");

things in them as part of just the support infrastructure makes me go
"Yeah, that's fundamentally wrong".

And if this is some default that is called only when the Rust code
doesn't have error handling, then once again - I think it needs to be
a *build-time* failure, not a runtime one. Because having unsafe code
that will cause a panic only under very special situations that are
hard to trigger is about the worst possible case.

             Linus
