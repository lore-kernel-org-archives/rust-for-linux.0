Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660CFC25B08
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 Aug 2022 15:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234503AbiHQPYz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 Aug 2022 11:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236896AbiHQPYv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 Aug 2022 11:24:51 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238EC5B78E
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug 2022 08:24:48 -0700 (PDT)
Received: from mail-ed1-f51.google.com ([209.85.208.51]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Myevl-1nPmnS00K5-00z0gR for <rust-for-linux@vger.kernel.org>; Wed, 17 Aug
 2022 17:24:47 +0200
Received: by mail-ed1-f51.google.com with SMTP id t5so17932176edc.11;
        Wed, 17 Aug 2022 08:24:46 -0700 (PDT)
X-Gm-Message-State: ACgBeo2tLGlyOV9BN/uWuQsAneBNNbwDc/3XQ4/urS/PSZxnfwlYlMOl
        6z440wpZAXwTJ2TIebyxQsWm95NzAMHPrPRrkOA=
X-Google-Smtp-Source: AA6agR6Zf7lY1qLm89sTihdpHsj0aQ4umr8ol/DRSTBvAYEQUmT2uPZZqvLUfFS8neOBi78/JbDKpYlk6svZGBrs0nY=
X-Received: by 2002:a05:6402:520e:b0:43d:df14:fbed with SMTP id
 s14-20020a056402520e00b0043ddf14fbedmr23980070edd.16.1660749886667; Wed, 17
 Aug 2022 08:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
 <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com> <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
In-Reply-To: <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 17 Aug 2022 17:24:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2YuGsSJY2-=npqXMHXEr+zaF36iDrM+kP=9nS85FLpbA@mail.gmail.com>
Message-ID: <CAK8P3a2YuGsSJY2-=npqXMHXEr+zaF36iDrM+kP=9nS85FLpbA@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Miguel Cano <macanroj@gmail.com>,
        Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>,
        Douglas Su <d0u9.su@outlook.com>,
        Borislav Petkov <bp@alien8.de>,
        linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Boqun Feng <boqun.feng@gmail.com>,
        linux-um@lists.infradead.org,
        =?UTF-8?Q?Bj=C3=83B_6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Daniel Xu <dxu@dxuuu.xyz>, David Gow <davidgow@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        linux-arm-kernel@lists.infradead.org,
        Tiago Lam <tiagolam@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Richard Weinberger <richard@nod.at>,
        Finn Behrens <me@kloenk.de>,
        Johannes Berg <johannes@sipsolutions.net>,
        linuxppc-dev@lists.ozlabs.org,
        Philip Herron <philip.herron@embecosm.com>,
        Arthur Cohen <arthur.cohen@embecosm.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:GrYdDeYH1fgJg1zOz1xr9h1s6Sfhr9dkLSpevGGAT5zD5u2Fyx0
 2+B9ys5I6KpMKgUzXM2lFBTuHa7IQnOL50Z9aRPYZMumrRMvLUglOLfX1PwmDSlSNA2Wj0s
 BdLz0dqP7O6Zx5qxLXqxbKQQrH07qsj31MLMQClJ+6uVCl3j9Azwrx6U7wsdVlJLYuAsvG9
 Lu2Mb/j0c0kPk87EHEYJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3TbU2KmkWD4=:aP6hoA/H7ijYvZxs3nzhu8
 3mVln+p+e6ACH26rMzHK2TXKwM/8MfNa4U1e4CuN1WFkjkNXP23WW/yqOFdfh93XGCIzIpBlw
 76GoAnRUwpJE67tG9XU9ZAQ4DrcQTAWGOJeYkzawQ0bSqRLIcyaw7e7Pl/ztusxlROnTfkUbW
 RTfIMMlKB6jDHWclqVAZvpGNxWqx8L0aHfmUi4uHCS/yhWZQ6KoEmJz0HKamTLu3EJD2cPn7q
 2AVfPjINAbNrJBASWgA++3i1B7vjpL18PtjsEo5bcGo3+ANtT7an/KDurIoVBBtVb1sGK49t5
 EFvhgcaWgOisagFFcomYn6ZJt3uF9RNqcbpUz9QI5c3t33bvwgYG1NdBxAMcoTdVlBW/ayhpV
 i8rF+YOF1e3qbjJwpiRBwVquqeW1r6SzxR9N1//LANn3IpSRTVEZ80TzkfdM5hvJB3U4ifLLH
 N8l+JUY3h+/0fm7Ruo0kfs2xOxmHrejJUHgjM5CkXCa273G6tHPgp6nC2ivQ1wT0AUeIojq8Q
 wBhcTCVT6w84bXGQHzNcwbT7+aVbfyVvlq1QbmXqmWSqm15GsFyWIWKyjG/6+hmTrvWNJWNKP
 g2kgwrcRcMfC4+QxTaCq9FZ5R7wkfNbG8/aHC6AQOvZUDALJJ5CDJIbHyOdIfepZxMFoVNrUU
 oiObkIWgWabIl3tKIPBRRcqhS5hEPHv+uQ5QBGPQdgy9ETi6f51h/ezMGOy43lE6IaLsEVfLZ
 pg39HMn4VlcVRnatjjOZ6mDjBHEaRMtk0j/6TzCKrQAF0x+LemuQhPcR32qA1l/Q1LD9WIKGW
 1vXxhpKeKT7AI6JVNoNtwyJYzStQoIrNT70uOHfDmzh749uYXYvoRD8u/lcl/MsrTGAvnjpaw
 Qaq/0eyo7FXNA6Ub0FgQ==
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Aug 17, 2022 at 5:13 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, Aug 17, 2022 at 4:40 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I tried enabling rust support in the gcc builds I provide at
> > https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/arm64/12.1.0/
>
> Thanks for giving it a go!
>
> > to make this more accessible, but it appears that the command line
> > options here are not portable:
> >
> >  /home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs
>
> So you mean with GCC Rust, right? (i.e. we have "GCC builds" working,
> via compiling the Rust side with LLVM and linking with the GCC C side,
> but it is not intended for production or to be supported, even if we
> cover it in our CI, test it boots and loads modules etc.).

Yes, I meant GCC rust, with the contents of
https://gcc.gnu.org/git/?p=gcc.git;a=shortlog;h=refs/heads/devel/rust/master
merged into the gcc-12.1.0 release tag.

> > I guess nobody has tried this so far. Would you think that fixing this is only
> > a matter for fixing the build system to pass the correct flags depending on the
> > compiler, or is this broken in a more fundamental way?
>
> If you meant GCC Rust, then it is a bit too early for the compiler. As
> far as I now, they are working on compiling the `core` crate and
> supporting more stable language features. They are also researching
> the integration of the borrow checker, though we wouldn't need that
> for "only" compiling the kernel.
>
> Now, if they decided to focus on supporting Rust for Linux early on
> (which would be great), they would still need to work on the delta
> between what what they target now and what we use (which includes both
> stable and some unstable features), plus I assume infrastructure bits
> like the platform (target spec) support, the flags / `rustc` driver
> (though I would be happy to do as much as possible on our side to
> help), etc.
>
> (We privately talked about possible timelines for all that if they
> were to focus on Rust for Linux etc., but I let them comment or not on
> that... Cc'ing them! :)

Thanks for the explanation. My hope was that building the kernel
would actually be easier here than building the more complicated
rust user space.

The gcc cross-compilers on kernel.org are similarly easy to build for
all architectures the kernel supports because the complexity is
usually in picking a working libc for the more obscure architectures,
so I was naively thinking that this would work for building the
rust support across all architectures in Linux.

I tried one more step and just removed the unsupported command
line flags to see what would happen, but that did not get me any
further:

/home/arnd/cross/x86_64/gcc-12.1.0+rust-nolibc/x86_64-linux/bin/x86_64-linux-gccrs
-frust-edition=2021 -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms
-Dunreachable_pub -Dnon_ascii_idents
-Drustdoc::missing_crate_level_docs -Dclippy::correctness
-Dclippy::style -Dclippy::suspicious -Dclippy::complexity
-Dclippy::perf -Dclippy::let_unit_value -Dclippy::mut_mut
-Dclippy::needless_bitwise_bool -Dclippy::needless_continue  -O
/git/arm-soc/scripts/generate_rust_target.rs; mv
scripts/generate_rust_target.d scripts/.generate_rust_target.d; sed -i
'/^#/d' scripts/.generate_rust_target.d
rust1: internal compiler error: Segmentation fault
0x7f37ee04b51f ???
./signal/../sysdeps/unix/sysv/linux/x86_64/libc_sigaction.c:0
0x7f37ee032fcf __libc_start_call_main
../sysdeps/nptl/libc_start_call_main.h:58
0x7f37ee03307c __libc_start_main_impl
../csu/libc-start.c:409
Please submit a full bug report, with preprocessed source (by using
-freport-bug).
Please include the complete backtrace with any bug report.
See <https://gcc.gnu.org/bugs/> for instructions.

      Arnd
