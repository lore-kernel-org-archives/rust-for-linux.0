Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD682C7EE23
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 09:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjFLJBb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 05:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbjFLJAo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 05:00:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F142B4493
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 01:57:06 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b227fdda27so30098811fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686560225; x=1689152225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIP1Nq8CX9UHVofD1hAhx9IbKfkWfppiEYGm76XgtQU=;
        b=QCRu9ptxTJs4hKFYE99wuf8rmhWZ+yLp2Z7+a0xpE5thDN656ubVMCD0oJCNGwujvw
         5mFMBLO26U+yJzbLW8IYIl5FvKx22VzkcaKwqylWsVwVykMU/hU8sedHuKZovsnXpheN
         1vqf5lSE2DgooIAIs0sc1oGHVnZD0Mhk63EwvBrz44cBcQ27FLgGClFjYlPjrQ8hDYar
         0efAqKkWbXvlo3tYdrMEhaYjidnyRuU0DIsttZcInzbGju/RioL7St0Os8Vp8u3o5MaT
         lRSpd9sgX4nX7UpjL2Z8DYl6lzA5j3cRs0MzrsfIitX3WpqW1U1RBA4FYW+16J34Do1n
         YDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686560225; x=1689152225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIP1Nq8CX9UHVofD1hAhx9IbKfkWfppiEYGm76XgtQU=;
        b=lk1mlU786TLSMfHhgY3m8n0TrQqU97vxfwTkn8gJWExkXc7vUUSuB57uXBuX6o6ibq
         g3lpihmfagZREATO/it74AZBkUA06VsujZ7pZKKbUdm7Nc/W5XFt4HKw/+4vyTcybaru
         pTooJX6FGLtksuoDi46+Ned33cz0eYq2YPy/C6JzUoRHqZoA5iJy/8rQ+Lb5ZITQijUR
         wzIKuU7h2+7fHXejO6qEkL8H3T53cLqa1J8z0hMfzvpiVF+WTeG1QK6Nt5uf9EiqwY6s
         5b8v0JVoNY0jvDP0I+ru0lx6qJpylhxLonIrCeH8mX9WPdqVW+qymFcSXgyY1J3wxtMj
         Pokg==
X-Gm-Message-State: AC+VfDyTzy3+RoRk+3chiaGHbpOTqsWOgwJ4zlljKmSJ9jYJ5dJuKAcG
        06FqkJWqFcyNhz3vYxC6vlF6jEC7f32YaoYsvVY=
X-Google-Smtp-Source: ACHHUZ6Q5bYVm8tqe+WJ+8s5uD5IcQI/qsu2o7TQQDprmy4n67sQ5D+OJAWi8FTnj7M7ob9QnK2/hBkSUCXeobkZ12o=
X-Received: by 2002:a2e:b119:0:b0:2b1:c149:6e6b with SMTP id
 p25-20020a2eb119000000b002b1c1496e6bmr2083004ljl.15.1686560224605; Mon, 12
 Jun 2023 01:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPDCGM9HbPhR2yW@moria.home.lan> <87v8fvit4m.fsf@metaspace.dk> <ZIR4tVA43Pen0ULQ@moria.home.lan>
In-Reply-To: <ZIR4tVA43Pen0ULQ@moria.home.lan>
From:   Ariel Miculas <ariel.miculas@gmail.com>
Date:   Mon, 12 Jun 2023 11:56:53 +0300
Message-ID: <CAPDJoNtFqQc-P=6Er9Gc+nk==JoaY-HLyj03Fcnacp+jYV5S3Q@mail.gmail.com>
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>,
        Ariel Miculas <amiculas@cisco.com>,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 4:30=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Sat, Jun 10, 2023 at 11:04:24AM +0200, Andreas Hindborg (Samsung) wrot=
e:
> >
> > Kent Overstreet <kent.overstreet@linux.dev> writes:
> >
> > > On Fri, Jun 09, 2023 at 09:30:29AM +0300, Ariel Miculas wrote:
> > >> From: Miguel Ojeda <ojeda@kernel.org>
> > >>
> > >> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > >> ---
> > >>  rust/serde/de/format.rs         | 2 ++
> > >>  rust/serde/de/ignored_any.rs    | 2 ++
> > >>  rust/serde/de/impls.rs          | 2 ++
> > >>  rust/serde/de/mod.rs            | 2 ++
> > >>  rust/serde/de/seed.rs           | 2 ++
> > >>  rust/serde/de/utf8.rs           | 2 ++
> > >>  rust/serde/de/value.rs          | 2 ++
> > >>  rust/serde/integer128.rs        | 2 ++
> > >>  rust/serde/lib.rs               | 2 ++
> > >>  rust/serde/macros.rs            | 2 ++
> > >>  rust/serde/private/de.rs        | 2 ++
> > >>  rust/serde/private/doc.rs       | 2 ++
> > >>  rust/serde/private/mod.rs       | 2 ++
> > >>  rust/serde/private/ser.rs       | 2 ++
> > >>  rust/serde/private/size_hint.rs | 2 ++
> > >>  rust/serde/ser/fmt.rs           | 2 ++
> > >>  rust/serde/ser/impls.rs         | 2 ++
> > >>  rust/serde/ser/impossible.rs    | 2 ++
> > >>  rust/serde/ser/mod.rs           | 2 ++
> > >>  rust/serde/std_error.rs         | 2 ++
> > >>  20 files changed, 40 insertions(+)
> > >
> > > Separately from that - are we sure we want to be pulling Serde into t=
he
> > > kernel?
> > >
> > > Don't get me wrong, Serde is amazing - it's highly ergonomic, and mak=
es
> > > a lot of compatibility issues just completely go away. It's
> > > impresssively well done.
> > >
> > > But it's a full json parser (are you using it in json mode here? it
> >
> > I think the json capability lives in serde_json, so this is actually no=
t
> > a full json parser.
>
> Good to know
>
> I don't think I'm the only one who's curious though - what's serde being
> used for here? On disk data structures of some kind?
>
> I'm probably not the only filesystem author eagerly waiting for the day
> when I can stop using carefully packed C structs for this, with all the
> sharp edges that entails...

serde, together with serde_cbor (added in another commit [3]), is used
to decode the puzzlefs metadata (check the "format" section for the
initial design [1]).
Sorry for the github links, but the patch series is incomplete because
I didn't send them to patches@lists.linux.dev, the entire "pull
request" is available here [2].

https://github.com/anuvu/puzzlefs/pull/6#issue-801680988 [1]
https://github.com/Rust-for-Linux/linux/compare/rust-next...ariel-miculas:p=
uzzlefs_rfc_v1
[2]
https://github.com/Rust-for-Linux/linux/commit/3fe9d58fbd89b0ed488d3150620e=
b07be17f1f16
[3]
