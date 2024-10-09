Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747CA18FC83
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Oct 2024 11:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473575; cv=none; b=haVkKexbwdBaLFqMHGap//6KKzKRiMag6nRhJ/TORTMloTgg1Qz0aVK2DlYvKUhvl9LobzYlZaklL599UU92GQcbm0nSG88HaEvGjY9rk7JqGcxQve1FVtxHzG5U3mgIQwDP913OXqEQr8Ty9spComoAQ34vmRznUknZJ86rv94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473575; c=relaxed/simple;
	bh=u2nkpeNDCCtr+RDR1GIBlfqM1CcT4OISAJQIvFmPPH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MR28FoAmYHRgehZvUnc4/u6rMtWQ4c+VhOa+PsLjF+ngbXNtiDaduvboBdJgNrIz3t8LBmcwtDomwIJmAK1t/Gssw+QvMNAzQjog1JfMwNQr8TNiR0ttPty/ufPX/NnOBcS8Hwub3YihNqAbpr2OeMPYoY5a3f4W7cABBIiGvWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DCJIag5X; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DCJIag5X"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d32dfbd78so1263270f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Oct 2024 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728473572; x=1729078372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHfdMVCdMqw7XiUFeDg6OwkwsDzXxFWVFFZsqEM0H+A=;
        b=DCJIag5XxPbi9OC37ORGwovatj+Tu99IFvtSNDWS8+2jYlVlg20cTWWxpVbAHhh/os
         MLDUXsmiaIi5aPSJsQQwFoAxj0eg5h7z46eWpVjn5JK+0uOaXwdMo7VhqL4KJJ1h1ibE
         1EdfjOeQb+FKVVrMOPX7ws7n4SPc7FQVEgUbBdbnQm7S5I62ybmNvsw3xY6kfh4Znp78
         la+MeVEfi170wcJAqxbTngwvRcv2XAAsrgTKjhTbj62qHMzIihppGExRYYfwJBfCKDvU
         NdEBiv0zYpQfDPMz5MwNDrGqs+tjEecDPEo2NTS8P8zIF6UTXBoW/fD0TOG814DRCtid
         UjjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728473572; x=1729078372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHfdMVCdMqw7XiUFeDg6OwkwsDzXxFWVFFZsqEM0H+A=;
        b=rqqIbq/fq7vgEvDQlS1XnwK84yVnKNN7f3d7mgWV17qN0yDSUg9GoVWpZWUPPth//w
         WCizutPmuZ4SJ1D3juis689UihNzkPn8bYNbKtaZN+E7/wvOwy0AjFgH957KfU8k8eCR
         X/oylz3V4u39HREij7WEg2/eT6tQhhxyNeiEfFK8Y4zlb9jNtxsnnNlLoY2ChrJ2tlbx
         IL4b00Tvpr9Ha9St5+TvEILLgfLH0Ye6rSSkNrfpllLuv2PuUSC4B8Dn54k5KbDf5T3w
         DwOQURkjMd3VX4VNor9DewjxSDptNCY3rcaqfiKyid8DWw7mVB7YN2fNV29Gq9swcrHw
         5YSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7orcX735hFQL9I9ATLCIALxb7GIAG60zw317wKY3tI9/ccDYyD340kveEnmUuHgBQeMyvGRTQSZtc5SHzmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7zeklLSTQ/N/K8wCT81aP1cTYySehfd+TBkSOy2UtqoqdV6Q3
	tHhFwjsPa779sewnf+W6Wg/J0ADTDyg8ioMw0yJubs1bonHd2hjYv1kE4K8rCYfyt628HV02Fc9
	6y+wbjuxJ0bA99WbrXCrNjaftrLE3qn4w+a2v
X-Google-Smtp-Source: AGHT+IF6zuOiLd59PhgXMw7DIzWOXXJgSyWEMApRca5NNJBgSiWPw2nrOVmoTfB+YfDfuvrwx/fLLRPvbmafo2m8vg4=
X-Received: by 2002:adf:fc88:0:b0:37d:374f:b0a7 with SMTP id
 ffacd0b85a97d-37d3aa4613dmr1323925f8f.34.1728473571568; Wed, 09 Oct 2024
 04:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAK7LNAQ2EY8Uf1APvhZT9XpZ6=8FhAitqePLiCP1S6mBgnXSKQ@mail.gmail.com>
 <CAH5fLgiZ5awKAm-CHc8qgsQUYtNMWdSEeKC2wuDFh2NUhVmsAA@mail.gmail.com> <CAK7LNAS_22jQzsWDswChAMaE3GhT-1eqE9ngj61NeFz40SNxGw@mail.gmail.com>
In-Reply-To: <CAK7LNAS_22jQzsWDswChAMaE3GhT-1eqE9ngj61NeFz40SNxGw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 13:32:38 +0200
Message-ID: <CAH5fLgh9t7=1sTwWWJHLtDxaaZYZAjLC8h_jVvC809hpqJz07g@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:32=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Oct 9, 2024 at 4:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
> >
> > On Tue, Oct 8, 2024 at 9:00=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> > >
> > > On Wed, Oct 9, 2024 at 2:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote:
> > > > diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> > > > index 057305eae85c..08d5b7177ea8 100644
> > > > --- a/scripts/Makefile.compiler
> > > > +++ b/scripts/Makefile.compiler
> > > > @@ -21,6 +21,7 @@ TMPOUT =3D $(if $(KBUILD_EXTMOD),$(firstword $(KB=
UILD_EXTMOD))/).tmp_$$$$
> > > >  # automatically cleaned up.
> > > >  try-run =3D $(shell set -e;              \
> > > >         TMP=3D$(TMPOUT)/tmp;              \
> > > > +       export RUSTC_BOOTSTRAP=3D1;       \
> > >
> > >
> > > try-run is not Rust-specific.
> > >
> > > Is there any reason why you did not add it
> > > to __rustc-option?
> > >
> > >
> > > __rustc-option =3D $(call try-run,\
> > >        RUSTC_BOOTSTRAP=3D1 $(1) $(2) $(3) --crate-type=3Drlib
> > > $(srctree)/rust/probe.rs --out-dir=3D$$TMP,$(3),$(4))
> >
> > I had an explanation for this in the commit message, but it looks like
> > it got lost when I rewrote it for v2. Anyway, the reason is that I'd
> > have to modify both __rustc-option and rustc-option-yn to do that, and
> > putting it here seemed more future-proof against making the same
> > mistake in any rustc-* commands added in the future.
>
>
> One solution is to delete rustc-option-yn since there are no users of it.
>
> Another solution is to refactor the code.
>
> Either way, there is no good reason for code duplication.
>
>
> If you keep rustc-option-yn, you can rebased v3 on top of this patch:
> https://lore.kernel.org/lkml/20241009102821.2675718-1-masahiroy@kernel.or=
g/T/#u

I'll rebase on top of that. If we choose to delete rustc-option-yn
then I think we should first merge the refactor and then delete it in
a follow-up. That way, when someone does need it, they will find the
refactored implementation in the git history.

Alice
