Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03831C6FA82
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Sep 2022 23:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiISX6j (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Sep 2022 19:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiISX6i (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Sep 2022 19:58:38 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B39551408
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Sep 2022 16:58:37 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id a41so1489061edf.4
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Sep 2022 16:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=k3xlnAyuOJefFP7D3SzMTJMGo96xFtxvnNEEJ0Y5xB0=;
        b=CELKTFYiDZ28jArQvDpCb7qvvmdR8edtKyTcfxOM06jxTtB2qlY/zEckJKnjqVYSUg
         /1qq7YY2fOwFzO8ZWvQluuxKF4YNZ/cX2DQjVxmpBio5Cm9RlMhyOPAY60phndmXv31l
         qegbKlImOq5akFoRY3p69urdyJAV4aubfYBpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=k3xlnAyuOJefFP7D3SzMTJMGo96xFtxvnNEEJ0Y5xB0=;
        b=jfx6WTTPZTyR2wu8b3q96Hq7bmI+odMZaD17mAcm3pqKBaXkRcCe68w7dzMrAI5M2o
         Z9WjaSrCwFQ+sQvetwL0vyDJxIihQUZJanhJHBQGzZC9PlLUTWfXQZYj6WFCGQwJnnzN
         Piz7dF1oO8vqs9wLtnJO6SW7rzc/YqZjA9ZOiwMLk/jFTQNGqN+5Sb882+0Xr8JUcniQ
         P/vUINa0tcVWmsmMIpxvigKdLgLkvfMXSmnhgN6to31goXgyTXv0b6ePJjhW2nqAyhXI
         yJf/8fgxbwQyrHy9685tEWqu6a8RG3oR20Fw3TCMWrpOto/FQ801C4LJDMskQaZeQ0Nd
         /yLg==
X-Gm-Message-State: ACrzQf0tqd4CnDPltWLiX5+tFkH18zRhLMRCpR1t8UkB9d4JGpQiGUjO
        7IIsfadTFazZ1jq9MhnAtHPZSzl7mK9s9Bda2Q0=
X-Google-Smtp-Source: AMsMyM4mvw+yRiLY4X83gXgefpc5Lo+5icku7rjZgRsJOtPYttQzrptY5xCV0jcryFaj70M0u92Q7w==
X-Received: by 2002:aa7:c458:0:b0:44e:9078:5712 with SMTP id n24-20020aa7c458000000b0044e90785712mr18189894edr.25.1663631914774;
        Mon, 19 Sep 2022 16:58:34 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id c10-20020a17090618aa00b0078194737761sm966272ejf.124.2022.09.19.16.58.34
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 16:58:34 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id cc5so1607592wrb.6
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Sep 2022 16:58:34 -0700 (PDT)
X-Received: by 2002:ac2:5cd7:0:b0:49f:ae59:3b87 with SMTP id
 f23-20020ac25cd7000000b0049fae593b87mr2724088lfq.291.1663631903618; Mon, 19
 Sep 2022 16:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220805154231.31257-13-ojeda@kernel.org> <Yu5Bex9zU6KJpcEm@yadro.com>
 <CANiq72=3j2NM2kS8iw14G6MnGirb0=O6XQyCsY9vVgsZ1DfLaQ@mail.gmail.com>
 <Yu6BXwtPZwYPIDT6@casper.infradead.org> <Yyh3kFUvt2aMh4nq@wedsonaf-dev>
 <CAHk-=wgaBaVaK2K=N05fwWSSLM6YJx=yLmP4f7j6d6o=nCAtdw@mail.gmail.com>
 <CAHk-=whTDbFZKB4KJ6=74hoLcerTm3JuN3PV8G6ktcz+Xm1qew@mail.gmail.com>
 <YyivY6WIl/ahZQqy@wedsonaf-dev> <CAHk-=whm5Ujw-yroDPZWRsHK76XxZWF1E9806jNOicVTcQC6jw@mail.gmail.com>
 <Yyjut3MHooCwzHRc@wedsonaf-dev> <CAHk-=wityPWw4YkHeMNU4iGanyiC3UwDRhbOHYCJrhB2paCGwA@mail.gmail.com>
 <CAFRnB2VPpLSMqQwFPEjZhde8+-c6LLms54QkMt+wZPjOTULESw@mail.gmail.com>
In-Reply-To: <CAFRnB2VPpLSMqQwFPEjZhde8+-c6LLms54QkMt+wZPjOTULESw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 19 Sep 2022 16:58:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiyD6KqZN8jFkMHPRPxrbyJEUDRP6+WaH9Q9hjDB5i1zg@mail.gmail.com>
Message-ID: <CAHk-=wiyD6KqZN8jFkMHPRPxrbyJEUDRP6+WaH9Q9hjDB5i1zg@mail.gmail.com>
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
        linux-kernel@vger.kernel.org, m.falkowski@samsung.com,
        me@kloenk.de, milan@mdaverde.com, mjmouse9999@gmail.com,
        patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
        thesven73@gmail.com, viktor@v-gar.de,
        Andreas Hindborg <andreas.hindborg@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Sep 19, 2022 at 4:50 PM Alex Gaynor <alex.gaynor@gmail.com> wrote:
>
> Rust's rules are that a function that's safe must not exhibit UB, no
> matter what arguments they're called with. This can be done with
> static checking or dynamic checking, with obvious trade offs between
> the two.

I think you are missing just how many things are "unsafe" in certain
contexts and *cannot* be validated.

This is not some kind of "a few special things".

This is things like absolutely _anything_ that allocates memory, or
takes a lock, or does a number of other things.

Those things are simply not "safe" if you hold a spinlock, or if you
are in a RCU read-locked region.

And there is literally no way to check for it in certain configurations. None.

So are you going to mark every single function that takes a mutex as
being "unsafe"?

Or are you just going to accept and understand that "hey, exactly like
with integer overflows, sometimes it will be checked, and sometimes it
just won't be".

Because that is literally the reality of the kernel. Sometimes you
WILL NOT have the checks, and you literally CANNOT have the checks.

This is just how reality is. You don't get to choose the universe you live in.

                  Linus
