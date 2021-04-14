Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACFEC43461
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 19:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9A8961166
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Apr 2021 19:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353286AbhDNTUE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Apr 2021 15:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353266AbhDNTUC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Apr 2021 15:20:02 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2F7C06175F
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:19:40 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id u20so24442987lja.13
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2NCuqqnTNRZqz4gVa7VmF8X9q5BSGA2MnI49n6bMs7A=;
        b=dCmT2JevlN2Um24EUlGKuB1noKIv7ps6g0KvoFc8NO7f9Egls/Mith+iaPjQtsQfnr
         V3m5Niy5LYKZYm6IIrt5kn+7wbQBG2dzlRjqlgBgfDXYfOc9ZchG7DC8UHzaS3kiP/3M
         I5Wq5Fh4vLEyyOX6IyyZ6+LRoWZP+OivJSbUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2NCuqqnTNRZqz4gVa7VmF8X9q5BSGA2MnI49n6bMs7A=;
        b=ZAHehwJ8kwsw0PqfZebM1GNk29hA1NCXzSaeCH7GcUvtJtCxwFKToRP0pE7832DNE3
         1UpNHyD5kYZMLIg43ngi52QerNT3dAw9xbrv6vqVaup4KeM+OmQWa+qmNWuNyB62gToY
         NBT7TL9/nSz9RZf482632QJfAk8/6Qh96DaXWjsVsI7slQQCEMFAvUvSR8i4No+aN7u4
         qSoND4xfCZJV3VacNVbUaLVEHOMj5lXabLGZlNSlRezudHE/zOTdemw2hlc9HzgpdMjd
         nKqC2f8qyM4OsTCA5K0CTlSey/hiDmtAs8EIkfpdItWT74opvcjR1SMayeN2azJ2lXqd
         gXlQ==
X-Gm-Message-State: AOAM531D9ekebelJPeMTVZHJunIfe9UiSVsJjL/OzFlocOaT1ojeHM7v
        k71F5uuGdJ9ANPtmFx3fLsLD8lGTiEr5Osx6
X-Google-Smtp-Source: ABdhPJwK9bv+s9iR/+pZWTITjp3yjM2gx6n7bXdePuz3eSnjzaCugj/l8N6eLlP+Z8QwwrVQjYZ/Hg==
X-Received: by 2002:a2e:a40c:: with SMTP id p12mr25365177ljn.358.1618427978338;
        Wed, 14 Apr 2021 12:19:38 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id o21sm149453lfr.144.2021.04.14.12.19.36
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:19:37 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id f17so27999870lfu.7
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 12:19:36 -0700 (PDT)
X-Received: by 2002:a05:6512:31c7:: with SMTP id j7mr18301122lfe.41.1618427976755;
 Wed, 14 Apr 2021 12:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-6-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-6-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:19:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJvJJtd2mpYpx5+zn_hPrSOqGqi-Pxb7e+h+anhsLnQg@mail.gmail.com>
Message-ID: <CAHk-=wgJvJJtd2mpYpx5+zn_hPrSOqGqi-Pxb7e+h+anhsLnQg@mail.gmail.com>
Subject: Re: [PATCH 05/13] Rust: Compiler builtins crate
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
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 14, 2021 at 11:46 AM <ojeda@kernel.org> wrote:
>
> We also need a helpers C source file to contain some forwarders
> to C macros and inlined functions. For the moment, we only need it
> to call the `BUG()` macro, but we will be adding more later.

Not being a Rust person, I can only guess based on random pattern
matching, but this _looks_ like these "panicking intrinsics" panic at
run-time (by calling BUG()).

Is there some way these things could cause built-time link errors
instead, so that if somebody uses 128-bit shifts, or floating point
ops in the rust code, they show up as build failures, not as run-time
ones?

Hmm?

          Linus
