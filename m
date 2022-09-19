Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDA0ECAAA1
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Sep 2022 17:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbiISRV3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Sep 2022 13:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbiISRV1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Sep 2022 13:21:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D192C39B8B
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Sep 2022 10:21:25 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id u9so277059ejy.5
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Sep 2022 10:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=T9tjs2C6JiXyUusbaKulAdI7lGnBQljvbsg/PdLJCpA=;
        b=d9OWu4XihWylyVprmVcBC5mpF2dwkINsQkbE45w0j52Xy81466CqXQPMiUn98OKp2I
         D0OR+cpGgXgnZk/F2jIxYmIK2vfKKSY72iauA7Bdb3NO4Rsn4PtIq5pbAlsF4TH6MKLA
         dYmf0PmOlJ4YKvN7Iu0BbKVYqGq7ucGD9f4OE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=T9tjs2C6JiXyUusbaKulAdI7lGnBQljvbsg/PdLJCpA=;
        b=U6zfW562+4FRo7PN6xSUwhEYH/ZAsDeS3yYS3OBrdUhPI8+v8rTBxhIPozUWz0RBMc
         Cps0xcDOTybtsiq00YPjCwduNZEf8ozYse7jr7GDhdc+70LdLhr3kKBqk+MNntITdOrV
         9xjceg12mNmzFXSnB9wgGI5UHKGDuwA5UD9sOZAw/qHJTznnY9WExUboChkORLE0M4gu
         GMmZ2a8Kn3Njg/tWh9O6GdznqvqWnkrbZLAwSKQkGnfLwuTDvmJd4/LfArJ5APQjP+lE
         sYnklphnNasjMHY2dV7QLtGtT5vQIMww+gbR+IwTs3U3MyvbXClJL/nA3WwAH3t2MFZK
         z0KA==
X-Gm-Message-State: ACrzQf1LTNYnh8ad0zWotv1bxPnSiesMXw4tf/NteXiqXbViP4jYPmeY
        fMzXs6FzU8AewyEUsqwISff/BaGHrsjGe3fjEJQ=
X-Google-Smtp-Source: AMsMyM7qF051QKowEGHS5U2PnLUOI9yxDkmvqfZWq72D0wPHitKyfTd4j1tz//QnRi0HHXvxzE3tmw==
X-Received: by 2002:a17:907:3f90:b0:77e:9281:ee9e with SMTP id hr16-20020a1709073f9000b0077e9281ee9emr13508426ejc.74.1663608083852;
        Mon, 19 Sep 2022 10:21:23 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id z20-20020a170906715400b0073d65a95161sm15817595ejj.222.2022.09.19.10.21.21
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 10:21:23 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id c11so129886wrp.11
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Sep 2022 10:21:21 -0700 (PDT)
X-Received: by 2002:a05:6512:3d16:b0:498:f04f:56cf with SMTP id
 d22-20020a0565123d1600b00498f04f56cfmr7388621lfv.612.1663608070133; Mon, 19
 Sep 2022 10:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220805154231.31257-13-ojeda@kernel.org> <Yu5Bex9zU6KJpcEm@yadro.com>
 <CANiq72=3j2NM2kS8iw14G6MnGirb0=O6XQyCsY9vVgsZ1DfLaQ@mail.gmail.com>
 <Yu6BXwtPZwYPIDT6@casper.infradead.org> <Yyh3kFUvt2aMh4nq@wedsonaf-dev> <CAHk-=wgaBaVaK2K=N05fwWSSLM6YJx=yLmP4f7j6d6o=nCAtdw@mail.gmail.com>
In-Reply-To: <CAHk-=wgaBaVaK2K=N05fwWSSLM6YJx=yLmP4f7j6d6o=nCAtdw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 19 Sep 2022 10:20:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=whTDbFZKB4KJ6=74hoLcerTm3JuN3PV8G6ktcz+Xm1qew@mail.gmail.com>
Message-ID: <CAHk-=whTDbFZKB4KJ6=74hoLcerTm3JuN3PV8G6ktcz+Xm1qew@mail.gmail.com>
Subject: Re: [PATCH v9 12/27] rust: add `kernel` crate
To:     Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Konstantin Shelekhin <k.shelekhin@yadro.com>, ojeda@kernel.org,
        alex.gaynor@gmail.com, ark.email@gmail.com,
        bjorn3_gh@protonmail.com, bobo1239@web.de, bonifaido@gmail.com,
        boqun.feng@gmail.com, davidgow@google.com, dev@niklasmohrin.de,
        dsosnowski@dsosnowski.pl, foxhlchen@gmail.com, gary@garyguo.net,
        geofft@ldpreload.com, gregkh@linuxfoundation.org,
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

On Mon, Sep 19, 2022 at 9:09 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The whole "really know what context this code is running within" is
> really important. You may want to write very explicit comments about
> it.

Side note: a corollary of this is that people should avoid "dynamic
context" things like the plague, because it makes for such pain when
the context isn't statically obvious.

So things like conditional locking should generally be avoided as much
as humanly possible. Either you take the lock or you don't - don't
write code where the lock context depends on some argument value or
flag, for example.

Code like this is fine:

        if (some_condition) {
                spin_lock(&mylock);
                xyz();
                spin_unlock(&mylock);
        }

because 'xyz()' is always run in the same context. But avoid patterns like

        if (some_condition)
                spin_lock(&mylock);
        xyz();
        if (same_condition)
                spin_unlock(&mylock);

where now 'xyz()' sometimes does something with the lock held, and
sometimes not. That way lies insanity.

Now, obviously, the context for helper functions (like the Rust kernel
crate is, pretty much by definition) obviously depends on the context
of the callers of said helpers, so in that sense the above kind of
"sometimes in locked context, sometimes not" will always be the case.

So those kinds of helper functions will generally need to be either
insensitive to context and usable in all contexts (best), or
documented - and verify with debug code like 'might_sleep()' - that
they only run in certain contexts.

And then in the worst case there's a gfp_flag that says "you can only
do these kinds of allocations" or whatever, but even then you should
strive to never have other dynamic behavior (ie please try to avoid
behavior like having a "already locked" argument and then taking a
lock depending on that).

Because if you follow those rules, at least you can statically see the
context from a call chain (so, for example, the stack trace of an oops
will make the context unambiguous, because there's hopefully no lock
or interrupt disabling or similar that has some dynamic behavior like
in that second example of "xyz()".

Do we have places in the kernel that do conditional locking? Yes we
do. Examples like that second case do exist. It's bad. Sometimes you
can't avoid it. But you can always *strive* to avoid it, and
minimizing those kinds of "context depends on other things"
situations.

And we should strive very hard to make those kinds of contexts very
clear and explicit and not dynamic exactly because it's so important
in the kernel, and it has subtle implications wrt other locking, and
memory allocations.

             Linus
