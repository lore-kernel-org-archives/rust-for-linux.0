Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88E3C433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 May 2022 21:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243035AbiEYVaJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 May 2022 17:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbiEYVaJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 May 2022 17:30:09 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC40793AD
        for <rust-for-linux@vger.kernel.org>; Wed, 25 May 2022 14:30:05 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id v8so36075361lfd.8
        for <rust-for-linux@vger.kernel.org>; Wed, 25 May 2022 14:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CN9iEc/6AbDEhSeIoyRVDRtZ+F/iKWAgeW+cCw6K3rg=;
        b=HP0XCJMzu6+KjtahsVn49yXUZGLjsitCectX4zlL9zReAYpS+lfaTLYj9xRlPa5YKy
         zdMq9WzVf5n3QNBmYUzG2QZ3u0aX5JH/Vv8EeQ9OEbBqaOr4IZ6u7fy9O6pDkTtuoRoG
         HsEwWc0qQmgsR0v90SUj6bIVrRIihaeMhjqn1Q/44XwJHHuCsQxE8ZKrvelyrMyDosvf
         jKCmfkSlzkKq+j2HMDSFuoNNt+K3TUVNOb5H4mdPn69XcLYjzDenNOTg1GRrc/p7YKFY
         zdRsBHjlK5k8Bm3lhI/vv+UgXUeIFx2dXm3bNZlBIZ4kUnQ4mygqWENIZcpjfl5z+7Tx
         /tLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CN9iEc/6AbDEhSeIoyRVDRtZ+F/iKWAgeW+cCw6K3rg=;
        b=UU/0g04pC8VCdeyqZh2tLJLgt9G52nZzAV2etsJH2NZUwo6BN/omnlVfjM8ADVjfMV
         /vchPi4UyVpKeJm1DOGKiTpes3idYvEkwO4oGNPqPk+mG6m3LXutnkCwM+1pb/WCpFvU
         ZhQepTP5lrGrO4FevdJx1+XshwPGDvfZH8r00JfN5A3k8QLYTZZLrZ50N6tCdXjugQCy
         ruehSeNMcI0SImdwCrcDrV8vXAaGnCea8RW1ZaWxjSeyJF8ZPb8RCdkTZ8Jo5dg4qZz6
         tdR2ewLUb0jcty6tTL435jiNiMtDgbFZ5oVAhd/MioBVEcgrQjiM6/wq8tNns1adJ3Zl
         SoOg==
X-Gm-Message-State: AOAM533tK3bMTGrHzbh3X4WKqXyn2pnx7dx7R7UfahihyEJSOmoz9A+E
        +xsrFJuqW1IrsAjvram8LF1tqrvMTmZpjqWyt04PUA==
X-Google-Smtp-Source: ABdhPJyhZ9jtmrfWycnNF67xLRtYk+3UH27SKHU8VpvEjLIF+D46JgX8gLSc8u2HSteNfcYhESzSTK2ZB7QswcV4emU=
X-Received: by 2002:a05:6512:2614:b0:445:777d:3530 with SMTP id
 bt20-20020a056512261400b00445777d3530mr24708485lfb.647.1653514203249; Wed, 25
 May 2022 14:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220523020209.11810-7-ojeda@kernel.org>
 <CAKwvOd=mFhxjKRP_qt3Yu69dj_P6VUMSUSQm7fY6yS2bsO8Y2w@mail.gmail.com> <20220524004156.0000790e@garyguo.net>
In-Reply-To: <20220524004156.0000790e@garyguo.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 25 May 2022 14:29:51 -0700
Message-ID: <CAKwvOdmDgaG_DT+rr4F7xx=q=bVEaM9z7CBFqSq-0Eg=NwO02w@mail.gmail.com>
Subject: Re: [PATCH v7 06/25] rust: add `compiler_builtins` crate
To:     Gary Guo <gary@garyguo.net>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

 On Mon, May 23, 2022 at 4:42 PM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon, 23 May 2022 11:37:16 -0700
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > Also, I'm not sure my concern about explicit build failures for C code
> > was ever addressed?  We have a constant problem with `long long`
> > division on ARCH=arm32 and ARCH=i386 in C code.
> > https://lore.kernel.org/lkml/CAKwvOdk+A2PBdjSFVUhj4xyCGCKujtej1uPgywQgrKPiK2ksPw@mail.gmail.com/
> >
> > > +#[cfg(target_arch = "arm")]
> > > +define_panicking_intrinsics!("`u64` division/modulo should not be
> > > used", {
> > > +    __aeabi_uldivmod,
> > > +    __mulodi4,
> > > +});
>
> Starting in LLVM 14 (used in Rust 1.60+), __mulodi4 will no longer be
> generated. So that can be removed.

I'm familiar, but good catch. ;)
https://reviews.llvm.org/D108936
https://reviews.llvm.org/D108842
https://reviews.llvm.org/D108844
https://reviews.llvm.org/D112750
https://reviews.llvm.org/D108928
https://reviews.llvm.org/D108939
https://bugs.llvm.org/show_bug.cgi?id=28629
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=103034

>
> As for __aeabi_uldivmod, is there any reason that it can't just be
> defined in arch/arm/lib? There are quite a few __aeabi functions already
> defined there.

Indeed.
arch/arm/kernel/armksyms.c and
arch/arm/lib/lib1funcs.S

This is the previous thread I recall w/ Linus:
https://lore.kernel.org/llvm/CAHk-=wiydA=Oay+NB2m2ewCHpPEcoU51qPFrzsekFoPu7QPtuw@mail.gmail.com/

If CONFIG_RUST provides those symbols, it will hide the linkage
failures that we try to use to spot & avoid 64b division that's open
coded using the / binary operator, rather than the kernel's do_div()
and friends.

>
> The source of __aeabi_uldivmod in compiler-rt seems quite simple, just
> delegating to __uldivmoddi4. I think just changing that to
> div64_u64_rem should do the job?

Maybe; send a patch and see what happens. There's probably other 32b
architectures that will need other symbols that also handle 64b
division though, so it's not as simple as providing __aeabi_uldivmod
for ARM.

There's probably someone from linux-arm-kernel that can provide
additional context.
https://lore.kernel.org/linux-arm-kernel/alpine.LFD.2.00.1104271305580.24613@xanadu.home/
is pretty old, but refers to policies that seem to pre-exist other
references to __aeabi_uldivmod on that list.

arch/nios2/kernel/nios2_ksyms.c exports __udivmoddi4, but it also
explicitly links against libgcc.  I'm guessing that's frowned upon,
but not out of the question relative to having the kernel ported to
the architecture at all.

>
> https://android.googlesource.com/toolchain/compiler-rt/+/release_32/lib/arm/aeabi_uldivmod.S

Here's the latest source.
https://github.com/llvm/llvm-project/blob/main/compiler-rt/lib/builtins/arm/aeabi_uldivmod.S
and __uldivmoddi4:
https://github.com/llvm/llvm-project/blob/main/compiler-rt/lib/builtins/udivmoddi4.c

By chance, does any of the rust code in this series use open coded
division w/ 64 bit operands (rather than using do_div) by accident?

I'm also curious about the panic message for 128b operands. IIUC,
those are functions that may have `long long` operands.  On 32b ARM,
which is ILP32, I'd have expected `long long` to be 64b, not 128b.
Message might be misleading.
-- 
Thanks,
~Nick Desaulniers
