Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0293B13AF3
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 15:30:11 +0000 (UTC)
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D64CEF
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 08:27:53 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-656262cd5aeso23055616d6.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695050706; x=1695655506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys8ZuxyrYrmqdRpBskmFPDEMMgzPmmgYAlaMVeRpyj0=;
        b=OoL/LYepxyn7fq5yLXK7HVkQfKnaUwW9v7EAHw+0/BqIW7xpbUjv7ImzN6RRGVYvBB
         LSdoSk7MN1Ly/fxCL2Y+SuTUqfpymM3UYxEVBUYNPrhkZrNlO9wu7rUVv2pvoCMzyVxE
         lqdjza/DAyPELaLP1pYEw+LeIWLv11GbQ2egzU6IRqNBc62NBRHAdMpApbZdmVlFFCoF
         d8W+M6cPzASeKEaoqBllc/rxOVBmpUfz8Y77v6srfgZOmmN8fm/gEYSlNKFE1RQdM1ot
         eNYjvKobxwT0l37bAa4e5JlrJAiplopZCJ5kKeqzSHt8SVT4iMcKpjQp8MDiDn8CNUuy
         rSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050706; x=1695655506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys8ZuxyrYrmqdRpBskmFPDEMMgzPmmgYAlaMVeRpyj0=;
        b=h/AMMXUUf/V3DYfb2lcyuq5qPteCe8lTCu+L4JriZjozGsAR5TSVv+8H6thFhpMprV
         sIGF9BHku7GpSV/rgH2DHWRn1o9deRoUMJmWmM2MJvrZxDySZICt4XXeqtcLlbLhglC3
         gtiNPyyIsan3naUsSEgay6GCoMJa6KlNgE84D8Gv1bCldo0Gw30sp9h44LhZUdEkRUK3
         tgqzJ0SLTqs8tOd+IrLrCowkVIdlP2Ds+WyxLz/qU6LGkRQ3RhxMkncKhhPbdwwhHdv+
         XxuTvq2QmAWzo9wiSpzpfOcsgEauQgw5KQV1U4JQJ/rMmnMJIUyqrYbScjj5dKV5DuEm
         Yt5Q==
X-Gm-Message-State: AOJu0YwY6fJO0NOHaPHksnzQzgjqBEkzBrd2ZW8A8poNCpr2plnEcBav
	019F5Kzp3FTgzbNNzrToKBfV5BTHA5he53L9g3Glhg/gICy2Y5QBJE0=
X-Google-Smtp-Source: AGHT+IH9LLqV92rpZ5LSrWwBipB0Ihf+9x9uQ6G4zR4uCe4P2fA/teIqsQ/gOUdead92SW7V7k086l24NnhTpkdsTVY=
X-Received: by 2002:ad4:4c48:0:b0:64f:3bec:9b29 with SMTP id
 cs8-20020ad44c48000000b0064f3bec9b29mr10357719qvb.39.1695050705847; Mon, 18
 Sep 2023 08:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230915172900.3784163-1-mmaurer@google.com> <9966E047-44E7-4665-9628-169F3EBE2F06@kloenk.dev>
 <SLZSYLg5E9OQKI546K87wxTYYLNlT1xM-LhC4W1JFhIate6PFsKq27RcBNhSjUkErYDlzsZB4F2Vc2KOP9tDThg58_tXycWn3K29mQXlFtU=@protonmail.com>
 <0561303E-2089-43FC-AA31-836C7BB844B7@kloenk.dev> <CAGSQo02p0LWZgV8oVidwvN6X__rv3-rj+ZVg9SaZ5Kx+zYahYQ@mail.gmail.com>
In-Reply-To: <CAGSQo02p0LWZgV8oVidwvN6X__rv3-rj+ZVg9SaZ5Kx+zYahYQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 18 Sep 2023 08:24:51 -0700
Message-ID: <CAKwvOdnUdFjN+aCDrHKP6RzZCFB033ycN_KkB1WKucGd6VzUSg@mail.gmail.com>
Subject: Re: [PATCH] rust: Respect HOSTCC when linking for host
To: Matthew Maurer <mmaurer@google.com>
Cc: Finn Behrens <me@kloenk.dev>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2023 at 12:54=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> On Sat, Sep 16, 2023 at 11:07=E2=80=AFAM Finn Behrens <me@kloenk.dev> wro=
te:
> >
> >
> >
> > On 16 Sep 2023, at 19:53, Bj=C3=B6rn Roy Baron wrote:
> >
> > > On Saturday, September 16th, 2023 at 18:52, Finn Behrens <me@kloenk.d=
ev> wrote:
> > >
> > >>
> > >> On 15 Sep 2023, at 19:28, Matthew Maurer wrote:
> > >>
> > >>> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is def=
ined,
> > >>> resulting in build failures in hermetic environments where `cc` doe=
s not
> > >>> exist. This includes both hostprogs and proc-macros.
> > >>>
> > >>> Since we are setting the linker to `HOSTCC`, we set the linker flav=
or to
> > >>> `gcc` explicitly.
> > >> But as `HOSTCC` could also be clang, the linker flavor would then be=
 wrong, would that create a problem?
> > >
> > > Rustc uses the gcc linker flavor for clang too. There has been a prop=
osal to split it up, but I'm not sure of the status of that. In any case cl=
ang's cli is similar enough to gcc that it works fine to use the gcc linker=
 flavor.
> > >
> > In that case this looks very reasonable.
> >
> > Second thing I noticed is that `HOSTCC` could be the wrong variable, an=
d `HOSTLD` would make more sense as we look for the linker and not the gene=
ral C compiler.
> >
> Yes, thanks Bjorn - "gcc" is the linker flavor used for "Use the C
> compiler as a linker".
>
> With regards to HOSTLD, I was trying to make the minimum possible
> change. Currently, it is using the command `cc` as a linker, so this
> would preserve existing behavior when HOSTCC is unset.

Hey! Isn't HOSTCC always set? Top level Makefile lines 442-445?

What happens if you invoke the linker directly?

Generally, the kernel either invokes the compiler or the linker
directly. (For assembler, it is typically preprocessed, as are linker
scripts!)  So invoking the linker directly is a common pattern in
kbuild.  It also makes me slightly sad if the rust compiler ends up
invoking a c compiler, even if it's simply to drive the linker.

I'm concerned that while this might invoke $HOSTCC, it probably won't
do so with any of the $KBUILD_HOSTCFLAGS set.  That's generally been a
problem in the past.

For example, Android carries a downstream patch to set `-fuse-ld=3Dlld`
for $KBUILD_HOSTCFLAGS, because its build environment doesn't contain
GNU binutils ("guilty, officer").

So if you set `rustc` to use `clang` as the linker, how do you
guarantee that `-fuse-ld=3Dlld` or any of the upstream
$KBUILD_HOSTCFLAGS get used?

Android also sets `--sysroot` for the $KBUILD_HOSTCFLAGS to guarantee
that the UAPI header tests can be built against bionic (Android's
libc).

Or is that handled elsewhere in rust/Makefile already?

Also, if this is your first kernel patch, nice job! Welcome!

>
> If we would prefer `HOSTLD` instead we can do that, but we would need
> to additionally inspect `LLVM` to set the linker flavor accordingly
> (e.g. set ld vs ld.lld).
>
> Do folks have strong opinions between these? My primary concern is to
> avoid calling programs by foo when their HOSTFOO variable is set.
>
> See https://doc.rust-lang.org/rustc/codegen-options/index.html#linker-fla=
vor
> for details on linker flavor settings.
> > >>>
> > >>> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > >>> ---
> > >>>  rust/Makefile         | 1 +
> > >>>  scripts/Makefile.host | 1 +
> > >>>  2 files changed, 2 insertions(+)
> > >>>
> > >>> diff --git a/rust/Makefile b/rust/Makefile
> > >>> index 87958e864be0..2a2352638f11 100644
> > >>> --- a/rust/Makefile
> > >>> +++ b/rust/Makefile
> > >>> @@ -383,6 +383,7 @@ $(obj)/exports_kernel_generated.h: $(obj)/kerne=
l.o FORCE
> > >>>  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
> > >>>        cmd_rustc_procmacro =3D \
> > >>>     $(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> > >>> +           -C linker-flavor=3Dgcc -C linker=3D$(HOSTCC) \
> > >>>             --emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --ext=
ern proc_macro \
> > >>>             --crate-type proc-macro \
> > >>>             --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
> > >>> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> > >>> index 8f7f842b54f9..0aa95a3af1c4 100644
> > >>> --- a/scripts/Makefile.host
> > >>> +++ b/scripts/Makefile.host
> > >>> @@ -91,6 +91,7 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
> > >>>  # current working directory, which may be not accessible in the ou=
t-of-tree
> > >>>  # modules case.
> > >>>  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfi=
le) \
> > >>> +            -C linker-flavor=3Dgcc -C linker=3D$(HOSTCC) \
> > >>>                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
> > >>>                   $(HOSTRUSTFLAGS_$(target-stem))
> > >>>
> > >>> --
> > >>> 2.42.0.459.ge4e396fd5e-goog



--=20
Thanks,
~Nick Desaulniers
