Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EA2C433DB
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 14:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81AEF65075
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 14:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236014AbhCPOKy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 16 Mar 2021 10:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236005AbhCPOKm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 16 Mar 2021 10:10:42 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874D3C06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 07:10:41 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id c10so72307499ejx.9
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYAkCPzOmjmerRi+24ZbnhVmJQpC0gcejoFz3mEE/v8=;
        b=Tm0QViBhsry3u0vPqphyFI2LayIAWyXwV6o5eEoTu0bFWEgdKRBv48gHHtpNzilZGN
         NdxRAqHp449ToC3eVkph/DWprWpBlvElotx8mdzTHSA0XB5pUvwbcwZzEEillHyTZ+lA
         Zn9DIcLF422vHA+nOX83s6YkrovXhOrxU7Nf9fsIJBsQIc0lWaaNnx201cMpz8pBNoYO
         T9nt8KxOph30WAttpdcFmp5jw3BXV614Io/xKQ/OD62N9MmRgD9mjP0olNMFdvZqg1Qe
         KZsrL1zmM8Bm7Bn1OkUnOR/v0ttDb7l7ti66ub3pswL0KTYqGzp6jxbxolv9hKg1104E
         1KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYAkCPzOmjmerRi+24ZbnhVmJQpC0gcejoFz3mEE/v8=;
        b=OVIx35VuwdfwlJCnZdVDmwDZaJVMY93QNTy4+7PT5sqPhVAxcLT8LfxAflPNvtsj/+
         31KKvc9ojXmX5hA04onumnugt8PGPYvvpw65VZbz8SPEnPluCep+hnbymofLI21UaOek
         V+EhFS1xUQMWH1ycMczK4jYFbPKmz7c+z0I52YMmXruXcCNKdh0GeJhMnygoEebBmE19
         ikyxsDgB7y+3p1h8PVu4RdHJ6d3DN3zAngDWuOU/xPAKiNkrbXgCZdo+1MOrl6I3kSnr
         fvkCKwapi5G+NfkpB2yO+D3nj2qAj2pstSwszTphCEN71u6B2hTt+FQHIxz9yeGykBbi
         iYZA==
X-Gm-Message-State: AOAM532cBLpiBTIhHhUqQM+w9qkQJ7eJQjxx2z9bJfxViJzTyADE0bXr
        wDxY7I3zkqO8948OmxVcfL+1ZJFa3NJec05/L5w=
X-Google-Smtp-Source: ABdhPJx4LxDyprIxVx8w/vucSoiLnsZMmh4StjKn7H2c2CpCfOprs6d+i5qlh59SUW1oTqQMSAWkxzcY4RuRFEUyc+U=
X-Received: by 2002:a17:906:58c9:: with SMTP id e9mr28875923ejs.26.1615903840287;
 Tue, 16 Mar 2021 07:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210315063044.ur3lvxv7emo2egu4@adolin> <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
In-Reply-To: <CANiq72=ZUr5JcfnMYB_=Gnsi08q45PwOUo3-CPL84_d5G2EV1w@mail.gmail.com>
From:   Sumera Priyadarsini <sylphrenadin@gmail.com>
Date:   Tue, 16 Mar 2021 19:40:28 +0530
Message-ID: <CACAkLuqMrRAE6d8dP_b9khtO3HY4mnEGP_Z+1HhzRYDMOaaN+Q@mail.gmail.com>
Subject: Re: Build system can't detect rustc
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Mar 15, 2021 at 6:16 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Sumera,
>
> On Mon, Mar 15, 2021 at 7:30 AM Sumera Priyadarsini
> <sylphrenadin@gmail.com> wrote:
> >
> > Could you point me to where make is trying to find rust or how I can try
> > fixing this? Is there anything else I might have missed out on?
> > I have the latest rust nightly installed.
>
> By default, it will call `rustc` as-is, so make sure it is on your $PATH:
>
>     $ which rustc
>     /some/path/bin/rustc
>
> Another reason could be that you are using the `master` branch instead
> of the `rust` branch.
>
> HTH,
>
Hi Miguel,

This definitely helped- I was using the master branch earlier. Can I
make a PR to add this to the documentation on rust/quick-start page?

I did run into some other errors while building though:

```
error: unknown argument: '-mindirect-branch=thunk-extern', err: true
error: unknown argument: '-mindirect-branch-register', err: true
error: unsupported option '-mrecord-mcount' for target
'x86_64-pc-linux-gnu', err: true
thread 'main' panicked at 'Unable to generate bindings: ()'
```
The full logs are here: https://paste.ubuntu.com/p/xqd4pMBdrb/

Since a few places online suggested the error might be related to gcc
and clang, I tried compiling with clang versions 9.0 /10.0 /11.0 and
gcc versions 8 /9 / 10 but the error persists. I am not sure how to
proceed here :/

Thanks,
Sumera


> Cheers,
> Miguel
