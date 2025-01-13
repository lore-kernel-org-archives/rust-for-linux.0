Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B8F1C5F22
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 20:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736798672; cv=none; b=dOc6oCRakOpVtxIrVmfkQ5RaO9XQueHP9/8G8x/pIFNcGBwlLcB5ro+yB3NKF02q+eM6t/c7XBD9jyNKDBeeFPyQbHmkWyE1QxrFoWLXh0G3Ln5e6lVCaTs7R3jBRCXeHF9IIG18KSvwJB9ckxVLfmnoOF0XIkJrhc9aPyNH8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736798672; c=relaxed/simple;
	bh=headnAKnIPgzcpaskLaA1PfeshfYjP8pQyA8Rn/VBbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRHXqDntrx08mt4kyMl9AJAOGRvU1bTLeuE5ygXc1RPje8BWurC3xd1c6foGH986wc088vdCjMtOE0Keb8NouTo1PacDMiqAHpEm20VvAKMg5dzcTIO3C4ACOuS7Usu2vj1x7xw2vln+fgD/dyq6ysN+C9tNDEJ68tvBHeZaESk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZLJuh9AU; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZLJuh9AU"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so1575a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 12:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736798668; x=1737403468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHTlphgauUE0MdQoq+J6Kpo0ZGTAu35Dgo6BpbFsY+0=;
        b=ZLJuh9AUooiSThryAsFYfRUi66QySjzA/MB8PQKhyPaLkfFWpYnFk/+xittwDKgSDZ
         sLb4+cRJ8iWGqXBIUHF5r/96qP7+LUOE0N2TXjyftnRy7Yl5IY6/mGnf7ZeeJQkbFxVy
         lV+J58p5ajIuOwDK2qoUXb5CXq8ndoXL8FwGthWUHEepOL8Zcka3OWWTiutbw9nM3Ju4
         OXFqnmuEVeS83pNCY+7E+57/w6QwJTN4sK5w5dM3Ac39oMgeXiWgjAox7grtvXAhbrKw
         Dzk6DD0U43i9B00E3wQDSQjsILObBJnpIGZ5vd1TXCJ/EG3e6Lm0mwaFdE+Ue8Sj3yFO
         DoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736798668; x=1737403468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHTlphgauUE0MdQoq+J6Kpo0ZGTAu35Dgo6BpbFsY+0=;
        b=KC76Yt2V1UxamI0/IfJWC5RJNp7gqTsyqDNxEqOeWUOUKRGNqHVL/RYOTw06AQtimY
         I70rLySW5esaQNGncGyrbLs4BiJ1T8AapuELTRB/QtovjIkvkFiY3dyrH8dqv9RhPJRv
         HzqUqdr3ab91yryHoLt91poBpRCZ8D8rbzwzHyKK339jWmsGNIOABoH5KsaR7GSUCvGh
         mFmiEkQsGCzS9aJQYmeecTNXQJ7VXRaW57WbjgsFZw5RICkpQEEKq+aYCf+T6J8PPQ6Z
         cqByX2aLdRKsokeFOwvsaSs3DSm+KCTkJml2NSfodXNsD4eZpQcyS5oNU1in/CFyprZy
         DNpg==
X-Forwarded-Encrypted: i=1; AJvYcCUEsUb99tUef3fjD6MI2qv2iNcyhc86lqZx3WXKKiMs/CE5laClyApjwZ+ZeXt7D+132SvjhK5f/4ZM6KE9BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/uTHEwRHOuiouFj9fqTg0fnStmDEipGmf2pQwJ9Yi4zKgkSEh
	cfI74h5iJ8eSc08Bt/t8Zfhw9r2ClA0kEI4LxbKQJuMluKnuQ48A8mLKrTReszwE0DGDd8lr7yM
	ya/uOT60hmtOO4b6K41MZehfyqAZkdUrlVr2o
X-Gm-Gg: ASbGncsZPbUUR4gXZyBvjnovK63c7qcjC9ea4LcqJOv8f2Sfo7BzxSSXI41M/55Zlu1
	1t7dL8rrvKB6nE30W8R3fNSe3z2Iv9wp/1JI=
X-Google-Smtp-Source: AGHT+IF0ImtytlLOuNBIguPAjeH7U4hIPd2noWdWrMGEBo3lMmqYucAvmrJESKCyXWngvaXS5pNjrcV4IkidF9a/DB4=
X-Received: by 2002:a50:ccdb:0:b0:5d9:5a5c:f2f9 with SMTP id
 4fb4d7f45d1cf-5d9f6c2c39bmr4420a12.7.1736798667639; Mon, 13 Jan 2025 12:04:27
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
 <20250103-extended-modversions-v13-5-35d87c65ee04@google.com> <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
In-Reply-To: <CAK7LNATGw-m_dcdjTBHsFwCZh7mTt8q8yNZQ7VFP=hMU8NvUvg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 13 Jan 2025 12:03:51 -0800
X-Gm-Features: AbW1kvYivGs5dyWgDAa0jLS9Y99MI1ugBfYsduBbEB5OZ0TEDoer8gpSmAU-ynQ
Message-ID: <CABCJKuf-w1puUsypU-cr5BH8uvCdPPQmhZZ1qVKDDg3Y-iQhSg@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] rust: Use gendwarfksyms + extended modversions
 for CONFIG_MODVERSIONS
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, Jan 10, 2025 at 6:26=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Jan 4, 2025 at 2:37=E2=80=AFAM Matthew Maurer <mmaurer@google.com=
> wrote:
> >
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > Previously, two things stopped Rust from using MODVERSIONS:
> > 1. Rust symbols are occasionally too long to be represented in the
> >    original versions table
> > 2. Rust types cannot be properly hashed by the existing genksyms
> >    approach because:
> >         * Looking up type definitions in Rust is more complex than C
> >         * Type layout is potentially dependent on the compiler in Rust,
> >           not just the source type declaration.
> >
> > CONFIG_EXTENDED_MODVERSIONS addresses the first point, and
> > CONFIG_GENDWARFKSYMS the second. If Rust wants to use MODVERSIONS, allo=
w
> > it to do so by selecting both features.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Co-developed-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  init/Kconfig  |  3 ++-
> >  rust/Makefile | 34 ++++++++++++++++++++++++++++++++--
> >  2 files changed, 34 insertions(+), 3 deletions(-)
> >
> > diff --git a/init/Kconfig b/init/Kconfig
> > index c1f9eb3d5f2e892e977ba1425599502dc830f552..b60acfd9431e0ac2bf401ec=
b6523b5104ad31150 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1959,7 +1959,8 @@ config RUST
> >         bool "Rust support"
> >         depends on HAVE_RUST
> >         depends on RUST_IS_AVAILABLE
> > -       depends on !MODVERSIONS
> > +       select EXTENDED_MODVERSIONS if MODVERSIONS
> > +       depends on !MODVERSIONS || GENDWARFKSYMS
> >         depends on !GCC_PLUGIN_RANDSTRUCT
> >         depends on !RANDSTRUCT
> >         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> > diff --git a/rust/Makefile b/rust/Makefile
> > index a40a3936126d603836e0ec9b42a1285916b60e45..80f970ad81f7989afe5ff2b=
5f633f50feb7f6006 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -329,10 +329,11 @@ $(obj)/bindings/bindings_helpers_generated.rs: pr=
ivate bindgen_target_extra =3D ;
> >  $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.=
c FORCE
> >         $(call if_changed_dep,bindgen)
> >
> > +rust_exports =3D $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ &=
& $$3!~/__cfi/ { printf $(2),$(3) }'
> > +
> >  quiet_cmd_exports =3D EXPORTS $@
> >        cmd_exports =3D \
> > -       $(NM) -p --defined-only $< \
> > -               | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_=
SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> > +       $(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3) > $=
@
>
> I noticed a nit:
>
> Both of the two callsites of rust_exports pass
> '$$3' to the last parameter instead of hardcoding it.
>
> Is it a flexibility for future extensions?
>
> I cannot think of any other use except for printing
> the third column, i.e. symbol name.

Good catch, the last parameter isn't necessary anymore. It was used in
early versions of the series to also pass symbol addresses to
gendwarfksyms, but that's not needed since we read the symbol table
directly now.

Sami
