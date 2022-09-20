Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D57C6FA82
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Sep 2022 00:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiITAPs (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Sep 2022 20:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiITAPr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Sep 2022 20:15:47 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC02CE0EB
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Sep 2022 17:15:45 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id f20so1515606edf.6
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Sep 2022 17:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=BgWrStjazBL3noD9/vk03t6GhWMu6WHkO8oDZrwsiw4=;
        b=SJSO8IZCt0Y5kVGyIwQdueMBTnqTxxL958lu9VE+yxSsYNOU0eyCEEmnqg94jyfjNV
         KNmUMvZPN7glZM0GJC6KmElL09bXeF6IzD009CSYWLhp9dSWYCICBezT84oZ8V12JkEM
         /7eszFNQyjg/zQP3c6u5LG9DPaqw5laxsPfEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=BgWrStjazBL3noD9/vk03t6GhWMu6WHkO8oDZrwsiw4=;
        b=OV9ghNYZ2wKai1+bLOu+1yDk0wQGqwq2rKmR4Do/TJmSpAS5siXNMe03Q7/7joKsZa
         y/VGLfDST6QAVqhxDebC9DD/mxPZ2oXHzdUKqHzKTO9yBywya3hgrfpDhGc4sa/PLKMD
         nyHn8/VjW3BLUeD3KN9H0Incr6vyYwvL6DDIQ13cJaO/qmDSZkBcqvPTHWD2e5ul0yT/
         tR8hiHrk2hc2hYQG8K8hL4NWTjJQvPlk1M+DNYVxEiTyCYIxFiv2ogbsEbEds5oPleCv
         skjsqFCCvjQuF3Q/MnnUzZbYtlmWriGp1uEuBgKhgvxWKNRFjR5aa1xsNLAqJ0/NIoTI
         p0tA==
X-Gm-Message-State: ACrzQf1w/8Layr63lY2tE+LVsUPnuVAtPDPQiZkbEWdotD8z4lht24ob
        6t2ky2Pb5oXc0PjNJkIfRF4SI/m7tjmZdrYGYVo=
X-Google-Smtp-Source: AMsMyM681m/cRJgFVY1vCwnZSfzazUxIgDFSd4L/xr4gNn84kYHc3LeDqA7RkN9OZzqI1LKxegqHSQ==
X-Received: by 2002:aa7:d98f:0:b0:454:44a0:f53e with SMTP id u15-20020aa7d98f000000b0045444a0f53emr3837118eds.425.1663632942587;
        Mon, 19 Sep 2022 17:15:42 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id rl2-20020a170907216200b007415f8ffcbbsm16507519ejb.98.2022.09.19.17.15.41
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 17:15:41 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id l14so2392217eja.7
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Sep 2022 17:15:41 -0700 (PDT)
X-Received: by 2002:a19:4f45:0:b0:49a:63c9:190d with SMTP id
 a5-20020a194f45000000b0049a63c9190dmr6637732lfk.61.1663632930544; Mon, 19 Sep
 2022 17:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220805154231.31257-13-ojeda@kernel.org> <Yu5Bex9zU6KJpcEm@yadro.com>
 <CANiq72=3j2NM2kS8iw14G6MnGirb0=O6XQyCsY9vVgsZ1DfLaQ@mail.gmail.com>
 <Yu6BXwtPZwYPIDT6@casper.infradead.org> <Yyh3kFUvt2aMh4nq@wedsonaf-dev>
 <CAHk-=wgaBaVaK2K=N05fwWSSLM6YJx=yLmP4f7j6d6o=nCAtdw@mail.gmail.com>
 <CAHk-=whTDbFZKB4KJ6=74hoLcerTm3JuN3PV8G6ktcz+Xm1qew@mail.gmail.com>
 <YyivY6WIl/ahZQqy@wedsonaf-dev> <CAHk-=whm5Ujw-yroDPZWRsHK76XxZWF1E9806jNOicVTcQC6jw@mail.gmail.com>
 <Yyjut3MHooCwzHRc@wedsonaf-dev> <CAHk-=wityPWw4YkHeMNU4iGanyiC3UwDRhbOHYCJrhB2paCGwA@mail.gmail.com>
 <CAFRnB2VPpLSMqQwFPEjZhde8+-c6LLms54QkMt+wZPjOTULESw@mail.gmail.com> <CAHk-=wiyD6KqZN8jFkMHPRPxrbyJEUDRP6+WaH9Q9hjDB5i1zg@mail.gmail.com>
In-Reply-To: <CAHk-=wiyD6KqZN8jFkMHPRPxrbyJEUDRP6+WaH9Q9hjDB5i1zg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 19 Sep 2022 17:15:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj6sDFk8ZXSEKUMj-J9zfrMSSO3jhBEaveVaJSUpr=O=w@mail.gmail.com>
Message-ID: <CAHk-=wj6sDFk8ZXSEKUMj-J9zfrMSSO3jhBEaveVaJSUpr=O=w@mail.gmail.com>
Subject: Re: [PATCH v9 12/27] rust: add `kernel` crate
To:     Alex Gaynor <alex.gaynor@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Konstantin Shelekhin <k.shelekhin@yadro.com>, ojeda@kernel.org,
        ark.email@gmail.com, bjorn3_gh@protonmail.com, bobo1239@web.de,
        bonifaido@gmail.com, boqun.feng@gmail.com, davidgow@google.com,
        dev@niklasmohrin.de, dsosnowski@dsosnowski.pl, foxhlchen@gmail.com,
        gary@garyguo.net, geofft@ldpreload.com, gregkh@linuxfoundation.org,
        jarkko@kernel.org, john.m.baublitz@gmail.com,
        leseulartichaut@gmail.com, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, me@kloenk.de, milan@mdaverde.com,
        mjmouse9999@gmail.com, patches@lists.linux.dev,
        rust-for-linux@vger.kernel.org, thesven73@gmail.com,
        viktor@v-gar.de, Andreas Hindborg <andreas.hindborg@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Sep 19, 2022 at 4:58 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This is not some kind of "a few special things".
>
> This is things like absolutely _anything_ that allocates memory, or
> takes a lock, or does a number of other things.

Examples of "number of other things" ends up being things like
"accessing user memory", which depending on what you are doing may be
very common too.

And btw, it's not only about the (multiple kinds of) atomic regions.

We have other context rules in the kernel too, like "does floating
point or vector unit calculations". Which you can actually do, but
only in a kernel_fpu_begin/kernel_fpu_end region.

Now, the floating point thing is rare enough that it's probably fine
to just say "no floating point at all in Rust code".  It tends to be
very special code, so you'd write it in C or inline assembly, because
you're doing special things like using the vector unit for crypto
hashes using special CPU instructions.

                  Linus
