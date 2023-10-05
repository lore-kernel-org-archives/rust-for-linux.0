Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C939141760
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Oct 2023 21:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4bJSH3eK"
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630CDD8
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Oct 2023 14:36:32 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-537f07dfe8eso1726a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Oct 2023 14:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696541791; x=1697146591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWddOZrmmasiWu5O0KWGa9lmgFQoWcrVlIGB6YyWgVs=;
        b=4bJSH3eKN6MBY0Fpg0QIuGImOmRogXegcl4rJtKoq4BHU191C99zCRMoMz55rlPTTl
         IdHXlJVarO7ktFPAKrq3G7RTTRSApiidYU7KAPTnxItPPINLAXJyOUMlL8+Pz5mc2y3t
         bVWTXXqLg/nk+Cv1NEIIyPzU+lyR3WWwNWaWLXcBy75kL27BFIKk9zEopXfA67pc1YbM
         YjCWjQIMKGFuW8qy+s43YvrtMUtbuCRKAH2LItQ06bKkezqTHj5kV+oWlzTXHgXRXZ+i
         69hnaLjLeqjU2lrsmnGh8Ssdbgw4E9umxVYCnk78nEFjBRnNoAbQRJa+83Ke/zVUaTxb
         TdJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696541791; x=1697146591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWddOZrmmasiWu5O0KWGa9lmgFQoWcrVlIGB6YyWgVs=;
        b=I2Jrx4vMWLvXlVo7GSFVAxID/kR+xehJKrm8tOGSB8dZ2jUbdgBhVjeJiQ4S6IGYwg
         XldppweVMaDLS0nlswB73xZh7BXIu/bGgLNKnee2xZSExiBNr7CQKpek+1UD/8IX0sqW
         Pn3GB8xApw6/2/79EaoO/3VlwYik/Y14eM0NjfQq2Cig4GwLh6yuTvR5eiGEb4Co2Dw7
         p9WpVWpMjaars2ZI45ZaR/bd5BM07pv75ookym7Wnzmfd12yWLKdW6RmCDFnL3fOUh5b
         J9ErD1yrSKLwngaoXt5CQababhi8zBawmJURsQPv0AKeuWf18pyVSfudNUJ07oXa1qfk
         ip1g==
X-Gm-Message-State: AOJu0YzfIoVY3Co/z959Et8QUXdt17HHvz0oFcgPvWGSsyPsMw2mtS3S
	m6ltDGfJH+RhUBfn4FY8DxrCiWZcAWygHAu1piV8IA==
X-Google-Smtp-Source: AGHT+IGlPnoq0UGE7DkoUzQp1yA5leDO8Cu3vmPbEmr9NZ49zBh/WWSakqyb4sccb/9wcCnTmo4j2D3js6AfFSbidkA=
X-Received: by 2002:a50:9f67:0:b0:522:4741:d992 with SMTP id
 b94-20020a509f67000000b005224741d992mr121564edf.4.1696541790666; Thu, 05 Oct
 2023 14:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928194801.2278999-1-mmaurer@google.com> <CAK7LNAQP9FVCArnw=JDBbtbu-3bxx162kqT24bUbffPtwE18uA@mail.gmail.com>
In-Reply-To: <CAK7LNAQP9FVCArnw=JDBbtbu-3bxx162kqT24bUbffPtwE18uA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 5 Oct 2023 14:36:19 -0700
Message-ID: <CAGSQo01=UxFmPRo6OTU1443izumvF+Z0fevgdWVdHK6DGTehCQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Respect HOSTCC when linking for host
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 29, 2023 at 10:59=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Fri, Sep 29, 2023 at 4:48=E2=80=AFAM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined=
,
> > resulting in build failures in hermetic environments where `cc` does no=
t
> > exist. This includes both hostprogs and proc-macros.
> >
> > Since we are setting the linker to `HOSTCC`, we set the linker flavor t=
o
> > `gcc` explicitly. The linker-flavor selects both which linker to search
> > for if the linker is unset, and which kind of linker flags to pass.
> > Without this flag, `rustc` would attempt to determine which flags to
> > pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> > name of the linker-flavor used by `rustc` for all C compilers, includin=
g
> > both `gcc` and `clang`.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  rust/Makefile         | 2 ++
> >  scripts/Makefile.host | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 87958e864be0..da664d7aed51 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o =
FORCE
> >  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
> >        cmd_rustc_procmacro =3D \
> >         $(RUSTC_OR_CLIPPY) $(rust_common_flags) \
> > +               -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> > +               -Clink-args=3D'$(subst ','\'',$(KBUILD_HOSTLDFLAGS))' \
>
>
>
> Why not consistently use the escsq macro here too ?
>
>
I didn't use it in rust/Makefile because that makefile doesn't
directly import scripts/Kbuild.include, and I was under the mistaken
impression that scripts/ was supposed to be its own namespace, even if
Make wasn't enforcing it. Inspecting other functions in
scripts/Kbuild.include though, it's clear they're called elsewhere, so
I'll upload another version of the patch using escsq here as well.
>
>
>
>
> >                 --emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@ --ext=
ern proc_macro \
> >                 --crate-type proc-macro \
> >                 --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
> > diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> > index 8f7f842b54f9..08d83d9db31a 100644
> > --- a/scripts/Makefile.host
> > +++ b/scripts/Makefile.host
> > @@ -91,6 +91,8 @@ hostcxx_flags  =3D -Wp,-MMD,$(depfile) \
> >  # current working directory, which may be not accessible in the out-of=
-tree
> >  # modules case.
> >  hostrust_flags =3D --out-dir $(dir $@) --emit=3Ddep-info=3D$(depfile) =
\
> > +                -Clinker-flavor=3Dgcc -Clinker=3D$(HOSTCC) \
> > +                -Clink-args=3D'$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
> >                   $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
> >                   $(HOSTRUSTFLAGS_$(target-stem))
> >
> > --
> > 2.42.0.582.g8ccd20d70d-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada
