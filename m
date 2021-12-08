Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55BD6C433FE
	for <rust-for-linux@archiver.kernel.org>; Wed,  8 Dec 2021 00:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242726AbhLHAJS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 7 Dec 2021 19:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242720AbhLHAJR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 7 Dec 2021 19:09:17 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8846C061574
        for <rust-for-linux@vger.kernel.org>; Tue,  7 Dec 2021 16:05:46 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id bn20so1096469ljb.8
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Dec 2021 16:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PkRp1/WhJVVA6i6xAX3mohuTTguHyeyteEeO36GWsMw=;
        b=AV7GarWqfoyFb49GhbARcORLve3Kgr+ZEDWeWqVFHWQIDWPYTU+Y9UOyx5IPGrX7hq
         qUq/z3hRSbC3SJUwOtSZa5/DsAEx6tPJCVyJgd0OWPXlEkxTi7fVVTTkKXYkUmm1YJSX
         etLohbFzctKJkFb8ERUAHI/Jp2wDDuCx9/VEIDzyA8aEEpVdUdAS3gNZ+Wz19TPGYuJU
         pZz0XYkZ0ryi92EfFgXHabFYi0eCQPIeMam1X8QOHCoq7cs6hqr6ZHCfatAFsTr1Oygn
         BxwoHhcxB/qjlX/coqglFxEcLnhCepPglrdBia2YYBcijG5L92JLSgKeGloqW3q0ahLD
         tHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PkRp1/WhJVVA6i6xAX3mohuTTguHyeyteEeO36GWsMw=;
        b=8Ndx7/FvSLE0f4/W3rxHrHG0v7WiMqIapEm750LQFOCOy+6KmjFhDDKn21cwQPoz/J
         RQSPy5ripNe2IM4uRx2+iDvQPRk4f5gCpVo5eegUSvweEbcFL9bMYM0QhqvrS68lnw1Q
         a2ou2c25HOe0uadv9AF5xXP/dk1+M9ULk8hJrPxKhQX+wQx6ub3oG7YU4QnVQ8/Emu8n
         07YVKcgzw0mCnXz0ml8/FfOEt29sIqpOrj9FD7Rr9+AumCmbTZUPvdLmAjMcaRB1ViNn
         KwuH87dcw5/uEV3LfECXfHmAzPQ1nbJ6/Wphc1sXoSlUymepwp4oLD8zp44ssaBaaEaw
         pPGg==
X-Gm-Message-State: AOAM532wzY6wPOKfJP/VhqBRqvWOt4DZ6VGsqMsCP0w+EFV2uXnQ8EKJ
        SgPRdoedxp+bR8XvEhJwn2Q9WHoiBGpvAzp/DGuQDQ==
X-Google-Smtp-Source: ABdhPJzPgJkU3kVjubRmB/GXIdL86/aIC8VR7QUJp2CfMcc/khiWum+fgoQxAe14XwQtmue20+CERJzWqrsrYrd72bw=
X-Received: by 2002:a2e:90d0:: with SMTP id o16mr13593ljg.339.1638921944628;
 Tue, 07 Dec 2021 16:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20211206140313.5653-1-ojeda@kernel.org> <20211206140313.5653-16-ojeda@kernel.org>
 <CAKwvOd=7QTUH69+ZbT7e8einvgcosTbDkyohmPaUBv6_y8RfrQ@mail.gmail.com>
 <CAKwvOdk9VNenJJN5HnPpGgsHT+OsRsgPGSesQgqMP2aLPWy0NQ@mail.gmail.com> <CAMKQLNJKumnucRHttHFN0cMK_g6kCJ7o0ev_3_RJsmPqbjo08g@mail.gmail.com>
In-Reply-To: <CAMKQLNJKumnucRHttHFN0cMK_g6kCJ7o0ev_3_RJsmPqbjo08g@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Dec 2021 16:05:33 -0800
Message-ID: <CAKwvOdk2Z2-GQZ3rxHzdYQGVw2G-w0BmbiwDb_PCDzQaw6MdXw@mail.gmail.com>
Subject: Re: [PATCH 15/19] Kbuild: add Rust support
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Dec 7, 2021 at 3:25 PM Wedson Almeida Filho <wedsonaf@google.com> wrote:
>
> On Tue, 7 Dec 2021 at 23:21, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Tue, Dec 7, 2021 at 2:45 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >
> > > On Mon, Dec 6, 2021 at 6:07 AM Miguel Ojeda <ojeda@kernel.org> wrote:
> > > >
> > >
> > > ... snip ...
> > >
> > > Miguel and team,
> > > I'm happy to see progress here! Just some quick notes after a first pass.
> > >
> > > Testing this series applied on mainline, I see:
> > > $ make LLVM=1 -j72 defconfig
> > > $ grep RUST .config
> > > CONFIG_HAS_RUST=y
> > > CONFIG_RUSTC_VERSION=14000
> > > # CONFIG_RUST is not set
> > > ...
> > > $ make LLVM=1 -j72 menuconfig
> > > # enable CONFIG_RUST
> > > $ make LLVM=1
> > > ...
> > >   CALL    scripts/checksyscalls.sh
> > > error: @path is unstable - use -Z unstable-options to enable its use
> > >
> > > error: @path is unstable - use -Z unstable-options to enable its use
> > > $ rustc --version
> > > rustc 1.40.0 (73528e339 2019-12-16)
> > >
> > > Can we update some Kconfig checks to fix that?
> >
> > After now reading though the Documentation/ patch:
> >
> > $ rustup update
> > $ rustc --version
> > rustc 1.57.0 (f1edd0429 2021-11-29)
> > $ make LLVM=1 -j72
> > ...
> > make[1]: *** No rule to make target
> > '/usr/local/google/home/ndesaulniers/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/lib.rs',
> > needed by 'rust/core.o'.  Stop.
>
> Can you run `rustup component add rust-src`?
>
> When we change the compiler version, we need to install the source
> code for `core` for the new version. (We'll update the documentation
> to reflect that.)

Cool, yeah please add that to the docs.  Kconfig checks should be
added to make this idiot-proof; starting from everything uninstalled,
I should be able to read the Kconfig dependencies in `make menuconfig`
to understand what I'm missing. And if I'm missing anything, I
shouldn't be able to select CONFIG_RUST.

I get slightly further now.

$ make LLVM=1 -j72
...
  BINDGEN rust/bindings_helpers_generated.rs
thread 'main' panicked at 'called `Result::unwrap()` on an `Err`
value: "could not run executable `/android0/llvm-project/clang`:
Permission denied (os error 13)"',
/usr/local/google/home/ndesaulniers/.cargo/registry/src/github.com-1ecc6299db9ec823/clang-sys-1.3.0/src/support.rs:196:58
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
thread 'main' panicked at 'called `Result::unwrap()` on an `Err`
value: "could not run executable `/android0/llvm-project/clang`:
Permission denied (os error 13)"',
/usr/local/google/home/ndesaulniers/.cargo/registry/src/github.com-1ecc6299db9ec823/clang-sys-1.3.0/src/support.rs:196:58
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
make[1]: *** [rust/Makefile:261: rust/bindings_helpers_generated.rs] Error 1
make[1]: *** Deleting file 'rust/bindings_helpers_generated.rs'
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [rust/Makefile:248: rust/bindings_generated.rs] Error 1
make[1]: *** Deleting file 'rust/bindings_generated.rs'
make: *** [Makefile:1271: prepare0] Error 2

It looks like bindgen found part of the path to llvm-project that I
have checked out to disk for when I do development on LLVM for work.
So this might only be an issue if folks have a copy of clang built
from source in their $PATH?

$ which clang
/android0/llvm-project/llvm/build/bin/clang

Looking at the output of `make LLVM=1 -j72 V=1`, I see two invocations
of bindgen, and can repro if I just run the full command manually.

I don't see my path to my source code checkout of llvm-project in the
command line invocation of bindgen; this might be an issue itself with
bindgen.

Googling for "could not run executable" and bindgen, I find this
thread with a similar failure string:
https://bugzilla.mozilla.org/show_bug.cgi?id=1363655
No hits in their issue tracker: https://github.com/rust-lang/rust-bindgen.

$ bindgen --version
bindgen 0.59.2
$ cargo install --locked --version 0.56.0 bindgen
$ bindgen --version
bindgen 0.56.0
$ make LLVM=1 -j72
# produces the same error.

I guess the error is coming not from bindgen, but a dependency of its;
"clang-sys?"
https://github.com/KyleMayes/clang-sys/blob/master/src/support.rs

I've filed an issue in
https://github.com/KyleMayes/clang-sys/issues/138; let's follow up
there?
-- 
Thanks,
~Nick Desaulniers
