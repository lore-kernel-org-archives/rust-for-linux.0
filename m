Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9311229B38
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 23:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767568661; cv=none; b=J47qnfX8MC9dO1iOSEK16UCp39tqY4lLmCYxAaFldVmd/kxlNsE96FRQBSLCGUO5PLEDzr8KhKfZ+PuWShmojDIWIkcNV7Kmb2eaLWeerzdIAM1T9/38m6xxmf2snE5WDa26CxY9vcHbTPnd0XZeGVcew+M7Wppvp1DHV+QJNMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767568661; c=relaxed/simple;
	bh=JTWuAqVCda3XcA65aB21SfD1V3R01MSETucYlkXUGZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7vr5Lfj442jEkLJek/NqtnJ5ACFUQvXoET+cWDdlXfPFPw1C8RsRloGtEH4GjL89op3mr1Ed34Qlt7FRaROFgV9ZR37MkfrY6smisPNja1hOUD4zQwyWS1Ek9Lou94z89NEg6Oyjq3TPQqClTXvZJExI1WcTqNtHKu6Oiiunxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQQ7Cpbx; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQQ7Cpbx"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b9728a353so163438471fa.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 15:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767568658; x=1768173458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmOnzM3O0tacehNp8y1E1jmB4ZOYRsBERU5Q7f5EfeM=;
        b=fQQ7CpbxdOmeMqhqUbDGWPtVCcGcN9p6FepETLi1N2h2kQCyfLBgT79UR59YYEeXIB
         gz+jW56rF6hzNNa3Ah+PK5uoXSy78B9qxEYViurcKGygpqJBKMB6/vm4/Ykp03DVK4ex
         h24Y0/7yM3wqCCIZi+ePfAdbxHZBtfN5jgfz/gbg2lTGi2rdXZPujJB4oNox7xtdFMKM
         tDsqemoA/0tgsK4ywU0CX0IkWfvpW9G4ueRaW7LRKl6djD5CH8VlqqwYYx4vdcNBr/PX
         vG3no7oMSj0JNMFfeBPCbu7XVWtITzjyqTXAjkokfFtcvC6xeqBIWy0BDhzLTnvub9iF
         9FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767568658; x=1768173458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmOnzM3O0tacehNp8y1E1jmB4ZOYRsBERU5Q7f5EfeM=;
        b=vJH+9nB0YqfkVGfoGP/USttmR3SFE9aS+ER7RH7tCosJQ96SL4hz9OzGEXWp3x8LmI
         vsL094Wp77HE8S0Z82jL1L420cCrCH12oqBeLdovOvuTCTn/A9RU/E8xVhcUFVADmDi9
         TTFbQQCssqjvUFfRouP8lyJtnDxXF8hd2RwuK9yeDRejPq3jI3Rb5bLRRiGQH0I5vZ3Z
         8yaL2/Ifk706s+OqMatRoXmISuwvkvDSl90fLpDrkJ6r0ps7E1WfU2y8eavzba7kIIoa
         UoeI7CFSDNiNOEr1JpN6wXab259jRfoawA7ndExh1rUi8BGITU+9glTKmptDVtvHchuM
         MBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCDw7+8K1J4odOOvSKDcl/nOz9u5sB3Qo/wW5GwsA/d1yzAm9O+ePtekbxBGL4fnLYoEezy7xNLIixMhIDBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YziVaZ8Kd0z3QUUJYWOk0udAH7Dd3VCviSO22VfwL8FAGeEq2LJ
	3quNjpao0d6Ja9WtJBq2FtGnTJtw84bq270aVKAsex3BY0kpKncHnUvEnEm1Ld0QNUNimGYG16o
	3MGb/2JeTC6l0BH9+d9g9K5DDFlLuRcA=
X-Gm-Gg: AY/fxX5rjGpeN+Gnzd5GBVhUEpGwxZR7u2rE74GLwwnI0y1nyDbKKZiWCK1EwBvSdx/
	UCiUJWGzdDFbTOTVQwmS3K4Xn0QnYYAOXMAeEH64+nSWs+xRTgqL8W8xHMJrg0EqKEr1E6Es6Gt
	4kShhESDEAHaiD1366U4dkZx9m2IewvAvvDcYK9bbxImib73A1dDBLFDaD5KHsW47CPn7fXk6MS
	uMyvD8annzlEm2nKLgERKFAYICXzxiIqt1GZOUpe24OSnVMt7PpyH/p8fW/240lAJ96Ey97z4in
	jvzjLzarI3ldk7d1GwIbDkNsWiPo60eegAukNEL5NraqfqNuFxuJ2TnGOunfIAsljKqTAHL+7xH
	SzKsH1Rsm2xw5QPgqJXOuiRBoWtQvRLBwL/syBiD+Dw==
X-Google-Smtp-Source: AGHT+IEnMQI2BZcnxnMuAvPtIAb5hrl4gzRoAhFhoiyy+xQf++LYKrbExvwy952sWnmU9/RRsyHoQBy8g+NcJdcKJB0=
X-Received: by 2002:a05:651c:1119:b0:37b:9615:e43a with SMTP id
 38308e7fff4ca-38121568308mr133822001fa.1.1767568657781; Sun, 04 Jan 2026
 15:17:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124151837.2184382-1-ojeda@kernel.org> <20251124151837.2184382-20-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-20-ojeda@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 4 Jan 2026 18:17:01 -0500
X-Gm-Features: AQt7F2qWpkSdf1y6pE7KQf8V1fRgZiCJdhji2uwBRomSReIpE82rv7uhwmQMTj8
Message-ID: <CAJ-ks9kSFp8CpyNr8zSKh6mniuXiYNrZCc8FC-8Z81GdbnaRog@mail.gmail.com>
Subject: Re: [PATCH v2 19/20] rust: syn: enable support in kbuild
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Jesung Yang <y.j3ms.n@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 10:25=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> With all the new files in place and ready from the new crate, enable
> the support for it in the build system.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: Gary Guo <gary@garyguo.net>
> Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Makefile                          |  1 +
>  rust/Makefile                     | 37 ++++++++++++++++++++++++++++---
>  scripts/generate_rust_analyzer.py |  7 ++++++
>  3 files changed, 42 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 85da055e4f00..96ddbaae7e12 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1835,6 +1835,7 @@ rustfmt:
>                 \( \
>                         -path $(srctree)/rust/proc-macro2 \
>                         -o -path $(srctree)/rust/quote \
> +                       -o -path $(srctree)/rust/syn \
>                 \) -prune -o \
>                 -type f -a -name '*.rs' -a ! -name '*generated*' -print \
>                 | xargs $(RUSTFMT) $(rustfmt_flags)
> diff --git a/rust/Makefile b/rust/Makefile
> index 4f4a00594142..8988ecf32531 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -27,7 +27,7 @@ endif
>
>  obj-$(CONFIG_RUST) +=3D exports.o
>
> -always-$(CONFIG_RUST) +=3D libproc_macro2.rlib libquote.rlib
> +always-$(CONFIG_RUST) +=3D libproc_macro2.rlib libquote.rlib libsyn.rlib
>
>  always-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel_generated.rs
>  always-$(CONFIG_RUST_KERNEL_DOCTESTS) +=3D doctests_kernel_generated_kun=
it.c
> @@ -101,6 +101,22 @@ quote-flags :=3D \
>      --extern proc_macro2 \
>      $(call cfgs-to-flags,$(quote-cfgs))
>
> +# `extra-traits`, `fold` and `visit` may be enabled if needed.
> +syn-cfgs :=3D \
> +    feature=3D"clone-impls" \
> +    feature=3D"derive" \
> +    feature=3D"full" \
> +    feature=3D"parsing" \
> +    feature=3D"printing" \
> +    feature=3D"proc-macro" \
> +    feature=3D"visit-mut"
> +
> +syn-flags :=3D \
> +    --cap-lints=3Dallow \
> +    --extern proc_macro2 \
> +    --extern quote \
> +    $(call cfgs-to-flags,$(syn-cfgs))
> +
>  # `rustdoc` did not save the target modifiers, thus workaround for
>  # the time being (https://github.com/rust-lang/rust/issues/144521).
>  rustdoc_modifiers_workaround :=3D $(if $(call rustc-min-version,108800),=
-Cunsafe-allow-abi-mismatch=3Dfixed-x18)
> @@ -161,11 +177,16 @@ rustdoc-quote: private skip_flags =3D $(quote-skip_=
flags)
>  rustdoc-quote: $(src)/quote/lib.rs rustdoc-clean rustdoc-proc_macro2 FOR=
CE
>         +$(call if_changed,rustdoc)
>
> +rustdoc-syn: private rustdoc_host =3D yes
> +rustdoc-syn: private rustc_target_flags =3D $(syn-flags)
> +rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE
> +       +$(call if_changed,rustdoc)
> +
>  rustdoc-macros: private rustdoc_host =3D yes
>  rustdoc-macros: private rustc_target_flags =3D --crate-type proc-macro \
>      --extern proc_macro
>  rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
> -    rustdoc-quote FORCE
> +    rustdoc-quote rustdoc-syn FORCE
>         +$(call if_changed,rustdoc)
>
>  # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` s=
hould
> @@ -231,6 +252,10 @@ rusttestlib-quote: private rustc_target_flags =3D $(=
quote-flags)
>  rusttestlib-quote: $(src)/quote/lib.rs rusttestlib-proc_macro2 FORCE
>         +$(call if_changed,rustc_test_library)
>
> +rusttestlib-syn: private rustc_target_flags =3D $(syn-flags)
> +rusttestlib-syn: $(src)/syn/lib.rs rusttestlib-quote FORCE
> +       +$(call if_changed,rustc_test_library)
> +
>  rusttestlib-macros: private rustc_target_flags =3D --extern proc_macro
>  rusttestlib-macros: private rustc_test_library_proc =3D yes
>  rusttestlib-macros: $(src)/macros/lib.rs FORCE
> @@ -488,6 +513,11 @@ $(obj)/libquote.rlib: private rustc_target_flags =3D=
 $(quote-flags)
>  $(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FOR=
CE
>         +$(call if_changed_dep,rustc_procmacrolibrary)
>
> +$(obj)/libsyn.rlib: private skip_clippy =3D 1
> +$(obj)/libsyn.rlib: private rustc_target_flags =3D $(syn-flags)
> +$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
> +       +$(call if_changed_dep,rustc_procmacrolibrary)
> +
>  quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro =3D \
>         $(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
> @@ -500,7 +530,7 @@ quiet_cmd_rustc_procmacro =3D $(RUSTC_OR_CLIPPY_QUIET=
) P $@
>
>  # Procedural macros can only be used with the `rustc` that compiled it.
>  $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rli=
b \
> -    $(obj)/libquote.rlib FORCE
> +    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
>         +$(call if_changed_dep,rustc_procmacro)
>
>  $(obj)/$(libpin_init_internal_name): private rustc_target_flags =3D --cf=
g kernel
> @@ -525,6 +555,7 @@ rust-analyzer:
>                 --cfgs=3D'core=3D$(core-cfgs)' $(core-edition) \
>                 --cfgs=3D'proc_macro2=3D$(proc_macro2-cfgs)' \
>                 --cfgs=3D'quote=3D$(quote-cfgs)' \
> +               --cfgs=3D'syn=3D$(syn-cfgs)' \
>                 $(realpath $(srctree)) $(realpath $(objtree)) \
>                 $(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(=
srcroot)) \
>                 > rust-project.json
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_an=
alyzer.py
> index 4faf153ed2ee..5b6f7b8d6918 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -100,6 +100,13 @@ def generate_crates(srctree, objtree, sysroot_src, e=
xternal_src, cfgs, core_edit
>          cfg=3Dcrates_cfgs["quote"],
>      )
>
> +    append_crate(
> +        "syn",
> +        srctree / "rust" / "syn" / "lib.rs",
> +        ["proc_macro", "proc_macro2", "quote"],
> +        cfg=3Dcrates_cfgs["syn"],
> +    )

I think we need to add "std" here -- without it, navigating to methods
on e.g. Vec items defined in syn doesn't work (it does work with "std"
added).

> +
>      append_crate(
>          "macros",
>          srctree / "rust" / "macros" / "lib.rs",
> --
> 2.52.0
>
>
