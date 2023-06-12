Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907C1C7EE45
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 11:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbjFLL7J (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 07:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjFLL7I (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 07:59:08 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F31AA8
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 04:59:03 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f6195d2b3fso5001182e87.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 04:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686571141; x=1689163141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lu8mmZX5LoPg7t6iAQ9O0MXFs4DU7K4GzQsUs0maHEc=;
        b=ID9bN2tITbvNusteVp8FhXP55Pl+adVkAGlstQ9bJA737lRCBjmxSj03EHC+Ljet28
         sa227eXlaJ70AW9oogFfuI6V+RtMxhJsbq0sgYUcYFNiAgjdWL9wVk9p/zjOGy2Zwdbc
         yRJa6ed7Xj+X2iUaUTQSqc0ROPyLJ/9i1rYAz5a2alONe/skDxwwiJImj4XpUonuCUKx
         4v15PgHyFJhyt69LQJK/uljM/jllVBs5UDNnJlYWhBDjEIHt1IwFIKftRXYRfE9gCpn8
         NxfSe2mHTvzjOghTEuZhm5K8ERayXF3sYCHO0IrSt4434hsH8OpXzPZ4SjBicdWI6JG+
         tNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686571141; x=1689163141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lu8mmZX5LoPg7t6iAQ9O0MXFs4DU7K4GzQsUs0maHEc=;
        b=XHnbFuJwLyLVtcq3B38pWd9koyaQHUNtUmRrsz8K9jNAUcLFq8YNejAHAtLdZlHMRe
         48NxJ+A1ALJnLPQ8HaHT1qMFh10LH0tybtJ18ouuRfgySvyVVUFXHArSSkbQz/djtFZt
         V9N6LRhprCrC8Qf4uWheumBu2xaIszB+den+jnAcIQIuQXFZSxnQ1nQAJfMmOClpd6Ue
         H5bVvTYxR3ED0PRNxAaaStXvIB++4lCqlfz4QpAtvkhgUjfdvwPHx5/LG80YtpAVKdOZ
         faZwOa9k4WxQ3KLMZr2r4bWo0da10w645OfFXlc4obnIjY4LXRMW+dVMUlF47wYbqlwX
         YYnQ==
X-Gm-Message-State: AC+VfDyZTKC8iDrAWIeRPRYYf2s4VruSLH0IWiR3rdtRRIRu1ALN5ZS5
        hTPs4xUBlByEJxiXhSvttpFG0ujkqiEsTxdtHWo=
X-Google-Smtp-Source: ACHHUZ7ps+eXs3goid/4DErfddG2RNAG7sf/vFq5cZ9+YjiiTaCpCWXt4iVP+G3JVCBXc8/kPCB1xdnXSw/qVHqbPBY=
X-Received: by 2002:a2e:9f0d:0:b0:2b1:e829:a959 with SMTP id
 u13-20020a2e9f0d000000b002b1e829a959mr2232973ljk.5.1686571141085; Mon, 12 Jun
 2023 04:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPDCGM9HbPhR2yW@moria.home.lan>
In-Reply-To: <ZIPDCGM9HbPhR2yW@moria.home.lan>
From:   Ariel Miculas <ariel.miculas@gmail.com>
Date:   Mon, 12 Jun 2023 14:58:49 +0300
Message-ID: <CAPDJoNudAwQFHHGFL6T1Zh=fKygUNSb3j-Bzg5f5f0UCkQBytQ@mail.gmail.com>
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 3:29=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Fri, Jun 09, 2023 at 09:30:29AM +0300, Ariel Miculas wrote:
> > From: Miguel Ojeda <ojeda@kernel.org>
> >
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > ---
> >  rust/serde/de/format.rs         | 2 ++
> >  rust/serde/de/ignored_any.rs    | 2 ++
> >  rust/serde/de/impls.rs          | 2 ++
> >  rust/serde/de/mod.rs            | 2 ++
> >  rust/serde/de/seed.rs           | 2 ++
> >  rust/serde/de/utf8.rs           | 2 ++
> >  rust/serde/de/value.rs          | 2 ++
> >  rust/serde/integer128.rs        | 2 ++
> >  rust/serde/lib.rs               | 2 ++
> >  rust/serde/macros.rs            | 2 ++
> >  rust/serde/private/de.rs        | 2 ++
> >  rust/serde/private/doc.rs       | 2 ++
> >  rust/serde/private/mod.rs       | 2 ++
> >  rust/serde/private/ser.rs       | 2 ++
> >  rust/serde/private/size_hint.rs | 2 ++
> >  rust/serde/ser/fmt.rs           | 2 ++
> >  rust/serde/ser/impls.rs         | 2 ++
> >  rust/serde/ser/impossible.rs    | 2 ++
> >  rust/serde/ser/mod.rs           | 2 ++
> >  rust/serde/std_error.rs         | 2 ++
> >  20 files changed, 40 insertions(+)
>
> Separately from that - are we sure we want to be pulling Serde into the
> kernel?
>
> Don't get me wrong, Serde is amazing - it's highly ergonomic, and makes
> a lot of compatibility issues just completely go away. It's
> impresssively well done.
>
> But it's a full json parser (are you using it in json mode here? it
> supports multiple formats), and object size is going to be a
> consideration. In particular, the way it works is by generating (via
> procedural macros) encode/decode functions for every type you use
> #[derive] an encoder/decoder for, so depending on how that was
> implemented that's going to add up.
>
> I would need to see text size numbers - the bloaty tool might be
> useful here: https://github.com/google/bloaty
>
> I'd give serious consideration to Cap'n proto instead, it's not as
> ergonomic as Serde (the get/set interface is not ideal, ask me for more
> details on how this could be fixed) but it's lower overhead than Serde.
>
> https://github.com/capnproto/capnproto-rust

Unfortunately bloaty seems broken [1], but here's the output:
```
$ bloaty puzzlefs_vmlinux -- vmlinux
    FILE SIZE        VM SIZE
 --------------  --------------
  +102%  +921Ki  [ =3D ]       0    .debug_info
  +139%  +849Ki  [ =3D ]       0    .debug_str
  +251%  +574Ki  [ =3D ]       0    .debug_loc
  +116%  +246Ki  [ =3D ]       0    .strtab
  +292%  +226Ki  [ =3D ]       0    .debug_pubtypes
  +297%  +200Ki  [ =3D ]       0    .debug_pubnames
  +115%  +176Ki  +115%  +176Ki    .rodata
  +103%  +160Ki  [ =3D ]       0    .debug_line
  +287%  +152Ki  [ =3D ]       0    .debug_ranges
  +104% +44.9Ki  [ =3D ]       0    .debug_frame
  +103% +43.2Ki  [ =3D ]       0    .symtab
  +112% +24.0Ki  +112% +24.0Ki    __ksymtab_strings
  +100% +5.31Ki  [ =3D ]       0    .debug_abbrev
  +100% +4.20Ki  [ =3D ]       0    .debug_str_offsets
  +108% +2.89Ki  +108% +2.89Ki    __ksymtab_gpl
  +100% +2.13Ki  [ =3D ]       0    .debug_addr
  +100%    +452  [ =3D ]       0    .debug_loclists
  +129%    +416  [ =3D ]       0    .debug_aranges
  +0.0%     +60  +0.0%     +68    [8 Others]
   +99%     -64   +99%     -64    [LOAD #3 [RWX]]
   +96%  -202Ki  [ =3D ]       0    [Unmapped]
  +104% +90.2Mi  +101% +13.8Mi    TOTAL
```
where puzzlefs_vmlinux is the kernel built with my puzzlefs changes
and vmlinux is the kernel built on the rust-next branch.
```
$ ls -lah puzzlefs_vmlinux
-rwxr-xr-x 1 amiculas amiculas 91M Jun 12 14:38 puzzlefs_vmlinux
~/work/linux rust-next*
$ ls -lah vmlinux
-rwxr-xr-x 1 amiculas amiculas 87M Jun 12 14:38 vmlinux
```
It's a +4M difference between the two versions (3.35 M to be exact),
but they are both debug builds (with CONFIG_DEBUG_KERNEL and
CONFIG_KALLSYMS set).
If I should do additional comparisons, please let me know.

https://github.com/google/bloaty/issues/335 [1]
