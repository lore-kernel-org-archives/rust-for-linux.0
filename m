Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A42C77B7C
	for <rust-for-linux@archiver.kernel.org>; Tue,  9 May 2023 17:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbjEIR5f (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 9 May 2023 13:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjEIR5e (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 9 May 2023 13:57:34 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65814488
        for <rust-for-linux@vger.kernel.org>; Tue,  9 May 2023 10:57:31 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30786c6082dso2543742f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 May 2023 10:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truongsinh.pro; s=google; t=1683655050; x=1686247050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S6LL4isc7La1a0/CYPICq1mhbCZgFeV2SZYktfMzc4o=;
        b=ct8vCDB28xJuCxqaEFZG6xVUf++2CcVlhv3LEQRRXCHj3HoLtiEmNgy2sQK8FNpPIn
         fDbUEIwvJEHlfJHWuFAEXxeWInf23ySDRQPqp1nASse7+x807d6EQlE2HU7Wpnpz0qPe
         o82wLHeWsH1uGZHKf7VSgivjlfUDnKUI7RqTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655050; x=1686247050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6LL4isc7La1a0/CYPICq1mhbCZgFeV2SZYktfMzc4o=;
        b=LHWvlWwJf1Pd7hyw4TkzxR0svyp02OuPeb2hUsHlz6Md9mwGx9Sb4IyQfFkNM0QEfQ
         fHDq2LvPn6SPQXCaUQ4orFP/2GYt/lfmbCu7NUEQy0ozDAx+IDk9wM3KmBb0XKSwAoL5
         riCsUm3p+7Ho6EjGDtxotCcHECRFsGfJMJiIqHChp2uWLFA65upkF6QrbaUoE80gzksK
         j067dvAAJA8N6H58twbKHtazFoc3x0w19XTLeoSNm//gG5G6N0W0H7faPdNqwZgAmXV9
         kbOkfp/DNPHHHIXSBNDGHCCuqL6GPlw7esJ5P+WQcealkN8mEKRFXwLDXxTDBIunQg86
         0+yQ==
X-Gm-Message-State: AC+VfDxGSk4P3Eo6MbKAcYlJXDdEIyB/0YDZBmNtqk6hZrIvd11o9MQ7
        GKzHIK8Dil5EnOFU61V+knUSeTPib6jZpJSq77eVjrulZ33NpYROJorpfw==
X-Google-Smtp-Source: ACHHUZ4PGv+jpscj7FuCd5tinYXENXRsLvcd1eQM3ClGuqFCXJLOAFgZQ7VimrjA+w9zH9WK+Nm0RZZbc1Ghsd6GvSU=
X-Received: by 2002:adf:f00a:0:b0:306:3286:69a2 with SMTP id
 j10-20020adff00a000000b00306328669a2mr10269051wro.48.1683655049960; Tue, 09
 May 2023 10:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230503065354.19071-1-i@truongsinh.pro> <ZFqHFTMqetbQKtah@moria.home.lan>
In-Reply-To: <ZFqHFTMqetbQKtah@moria.home.lan>
From:   TruongSinh Tran-Nguyen <i@truongsinh.pro>
Date:   Tue, 9 May 2023 10:57:18 -0700
Message-ID: <CAMy36z75N9obj0WM+OFhhnzXAPxqhg8PVY7_x8X6JbQABFnMQw@mail.gmail.com>
Subject: Re: [PATCH] chore(util): minimal Rust build example
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     linux-bcachefs@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, 9 May 2023 at 10:47, Kent Overstreet <kent.overstreet@linux.dev> wrote:

> We pretty heavily use to_text() functions kernel side; these output to
> printbufs, and in Rust they map nicely to the Display trait - do we have
> that available in the kernel or is that in std?
>

https://doc.rust-lang.org/std/fmt/trait.Display.html Display trait is definitely
in Rust `std`. As for the alternative from kernel, I am still searching.
Worst case, there is nothing right now, Rust-for-linux folks would
happy to take PR
to include it.

> Sounds like that would be a welcome cleanup :)

By clean up, do you mean moving from `uuid_le` to `uuid_t`?

Also, I don't expect this PR to be merge, as it is for demonstration
purposes only,
however, what would be a minimum mergeable PR (related to Rust build)
that you would consider?
