Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C7FC32792
	for <rust-for-linux@archiver.kernel.org>; Mon, 22 Aug 2022 22:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234431AbiHVWf3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 22 Aug 2022 18:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238446AbiHVWfW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 22 Aug 2022 18:35:22 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E900C47BBD
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Aug 2022 15:35:19 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id l21so11950811ljj.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Aug 2022 15:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=/3Qz2I07qNsEqmUXX8sV18RiE73NXZbJtJL/a6pTzOM=;
        b=oWPtAluKai50SM+qKue2D41Qzws4/k+V5RWd5eefNxz1X9aicH59ZvpfnjRJXMaLQs
         oqxP/yJYA/pA0XUC3IAQ2pMsUZC5KWJCBsJB87xXEHpXJYh3UsodLH0bSrdVTyW8PqVU
         fl7bU/ZoUTjyKr6lYqkht34lemnsdk4xtG++3RabmhF1f8ccW1cPhtNqTlSyiEEcsLzu
         YmlkZJbQ8uLeYszYrnjAf1BiPDqMYPF7w2OYYQuBY8Qlu0DW1tannUkwgTEalQVTDxVO
         5e5PuucVBSjpt4Fd7T9Y4gljaVUNRJApsbm1Vq6Mzh8cdPFYHKbekz+4ISdZpBbhyJKO
         Yejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=/3Qz2I07qNsEqmUXX8sV18RiE73NXZbJtJL/a6pTzOM=;
        b=xGcxVMxBXsZmYA39fLFe1+M51kJIO8S4sbO0wGPuxQfMikY0ZTRc+6uyvDz27aUo4b
         guhehrJaDbzcJILd5plu9NuDLQzuHL2RmE+cm1AtXTqKxwt66Y/ZAm+edUok91hXP8GY
         8eTWEav/6slLcOz2WXfaXPJchmgmD4sS32HMokUW1X+fT/MYsTBN0xcPgVy82KDRO7ZL
         cdbh8JX8bGYm5rYmSOYKr4R4RFiHkH+s1ZzhdJtw9+V/kIP/LjJ944FfPuq0sN4SJMrH
         EAYx2tYu9jz32sXLkbA7ey2J/ywhMCKBqWL+dwmAPDlDj89eVcKEjlyUf30YeafvNKF+
         x5fA==
X-Gm-Message-State: ACgBeo2llOrTBGPZt7SzLJsR7BXzNYqntX5T1tuuFXaCIks6XXPF2t6t
        W5Wr14Oz8o6LgJlNeavEhJNXlndlbJksEIXstKHEzw==
X-Google-Smtp-Source: AA6agR7Tldikzvhh2Bk23FXDw9lViwJukpyd5ZjJCRNzpjlVddMHxOB5z715HFFouGcVhLUk2TreqJEweh3FvxQ/Ygg=
X-Received: by 2002:a2e:9dc5:0:b0:25e:6fa0:1243 with SMTP id
 x5-20020a2e9dc5000000b0025e6fa01243mr6684227ljj.513.1661207718102; Mon, 22
 Aug 2022 15:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220805154231.31257-1-ojeda@kernel.org> <20220805154231.31257-24-ojeda@kernel.org>
In-Reply-To: <20220805154231.31257-24-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 Aug 2022 15:35:05 -0700
Message-ID: <CAKwvOd=y5T9bh4398K+5=82q=vVbkjQQ76KyXLy-qoM2Tph08A@mail.gmail.com>
Subject: Re: [PATCH v9 23/27] Kbuild: add Rust support
To:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Boqun Feng <boqun.feng@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>,
        Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
        Antonio Terceiro <antonio.terceiro@linaro.org>,
        Daniel Xu <dxu@dxuuu.xyz>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

 On Fri, Aug 5, 2022 at 8:44 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Having most of the new files in place, we now enable Rust support
> in the build system, including `Kconfig` entries related to Rust,
> the Rust configuration printer and a few other bits.

Cool, I'm finally happy with this patch.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

I built and boot tested with CONFIG_RUST enabled, played with
CLIPPY=3D1, and built all of the new make targets for rust.

Thanks for all of the work that went into these series from all of the
authors and Miguel for your determination. Keep it up!

I've left comments on other patches (and I will leave one on
rust/compiler_builtins.rs because I still don't like that approach)
and there may be small cleanups we can do here or there, but I think
we're in good shape to land something and start iterating on it
upstream.  I'll file bugs in your issue tracker for small nits I come
across, but so far, it's been more-so questions.

---

LWN recently demonstrated that most fixes are in relatively younger
code: https://lwn.net/Articles/902854/

An analysis of 0day exploits found in the wild in 2021 showed that for
Android, researchers are attacking drivers:
https://googleprojectzero.blogspot.com/2022/04/the-more-you-know-more-you-k=
now-you.html

Multiple independent reports cite high numbers (70% or more) of memory
safety issues in native code:
https://www.memorysafety.org/docs/memory-safety/

I have colleagues that are developing a microkernel (they then use a
memory unsafe language for their kernel as well :^P ) to move as much
functionality as possible into lower levels of privilege.  It's
interesting and I wish them well, but I also prefer more incremental
approaches to existing solutions, and suspect the way of the monolith
to still give us the best performance.

I learned an interesting word the other day: Corten Steel
from the YouTube channel Practical Engineering (it's a great channel
on Civil Engineering):
https://www.youtube.com/watch?v=3D2RbiCOFffRs&t=3D523s
transcript:

>> I should also note that there are even steel alloys whose rust is protec=
tive! Weathering steel (sometimes known by its trade name of Corten Steel) =
is a group of alloys that are naturally resilient against rust because of p=
assivation. A special blend of elements, including manganese, nickel, silic=
on, and chromium don=E2=80=99t keep the steel from rusting, but they allow =
the layer of rust to stay attached, forming a protective layer that signifi=
cantly slows corrosion.

My hope is that Rust may provide a layer of Corten Steel to the Linux
kernel to help us protect newly written driver code from memory safety
related issues, so that Linux remains the best option for developing
products for the next 30 years. I also suspect it may bring in a whole
new generation of hackers to the kernel ecosystem.  That is my
blessing for Rust in the Linux kernel.
--
Thanks,
~Nick Desaulniers
