Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A3717C61
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706087577; cv=none; b=Cjvx9zaMbD0NCV1hVCrbScNwJgHj5TFti0uVFDUeJS7LcX7Wb4A3E/UzKZAvr5wdIPnVs/PkkHgc8RYwfZ32CeYYyvWJqMeFEOoHZFg0bq1kobKjIw1YCp5qlje6l8ALfJ1+GJHEJZx6mquU0XkJuwS1tfklxBzlkpAHEJhb7MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706087577; c=relaxed/simple;
	bh=PhszJK5xbJ5MrUQt5DKrPb6V7Pp3TuUk1CIG1+Q7Gas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vC7qiIO4+931geh17ZALpevU5QWFljQGSsyl0hAkDnaz6zyPNN0hXJcp4y+1+TuMvfl/wA4LB70t/1PTCp6Z+V4Eqi95ZhzQgUl2ljaC2IlgYwfTbbx+pYK1Scz2l6wCtbEpXHcScgs/NtVT7GbIDXHEuRt7qA5T2yd26iNYouc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyEfsTit; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyEfsTit"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E95C43394
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706087576;
	bh=PhszJK5xbJ5MrUQt5DKrPb6V7Pp3TuUk1CIG1+Q7Gas=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uyEfsTitblBdORC+RZNafcQnr6/HI3DXKRIcqZ/tLMSRLwRtUaqDbUcS39PXn6DPC
	 h8foMcZ2oTxbrd/M/6KVyQbZuVGf7mxZD5lY2yFEPMxk3vgXyokCAXghjCrZWr8059
	 nNvugnfrw5biyErR/RcDnA+xb/B5Rbm6mLyrqKgSbV0A/Vghihpmr2tqDhm7Oi2/0D
	 vu4BjMIR6unhQIq7Rod0xmvMyCOMI5/rWaQyBprldXnD01p3DE7rDpvfm3Cu72/z4v
	 Uzn74Qsk9nrpmlAlsygIz5n+aRrc/k+IlCQAQ4FNQ1gw43U6GQ5PIpFFmv6xD+4Ewz
	 o4mfXsxcB7A9A==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-595b3644acbso2864552eaf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 01:12:56 -0800 (PST)
X-Gm-Message-State: AOJu0YxIA2q1S67DVKNsHv9/K7HIrORllnbcpVc4WYFuIYZ2GB/m8XAL
	UagpMGbpIamS/ZmLdSovMM00J2XassqV4tnmV4LvfqH0yf9hZj0Y2Kw22SJF0EZ5n2051IouU8v
	9AuY6QtxzKzLtuCl0A+WFsJWceLg=
X-Google-Smtp-Source: AGHT+IGovKEzDdigedwmeRIb5ruc3kCVsjJL8vp7GnY6OUc8xjFPQvKoyJLHm+DMkdWjpL64EsEvXsTngYJThAms73g=
X-Received: by 2002:a05:6870:169c:b0:206:a784:f5e5 with SMTP id
 j28-20020a056870169c00b00206a784f5e5mr367957oae.47.1706087576009; Wed, 24 Jan
 2024 01:12:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com> <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
In-Reply-To: <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 24 Jan 2024 18:12:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATknuOCweRaQcsvw6k7vVQVVtQnbc=Q-NX-EA3J5yzZAA@mail.gmail.com>
Message-ID: <CAK7LNATknuOCweRaQcsvw6k7vVQVVtQnbc=Q-NX-EA3J5yzZAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 21, 2023 at 12:53=E2=80=AFAM Jamie Cunliffe <Jamie.Cunliffe@arm=
.com> wrote:
>
> Eventually we want all architectures to be using the target as defined
> by rustc. However currently some architectures can't do that and are
> using the target.json specification. This puts in place the foundation
> to allow the use of the builtin target definition or a target.json
> specification.
>
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> ---
>  Makefile          | 1 -
>  arch/x86/Makefile | 1 +
>  rust/Makefile     | 5 ++++-
>  scripts/Makefile  | 4 +++-
>  4 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 88ebf6547964..23100f193da3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -566,7 +566,6 @@ KBUILD_CFLAGS +=3D -fno-strict-aliasing
>
>  KBUILD_CPPFLAGS :=3D -D__KERNEL__
>  KBUILD_RUSTFLAGS :=3D $(rust_common_flags) \
> -                   --target=3D$(objtree)/scripts/target.json \
>                     -Cpanic=3Dabort -Cembed-bitcode=3Dn -Clto=3Dn \
>                     -Cforce-unwind-tables=3Dn -Ccodegen-units=3D1 \
>                     -Csymbol-mangling-version=3Dv0 \
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 5bfe5caaa444..0f339d4abd40 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -68,6 +68,7 @@ export BITS
>  #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D53383
>  #
>  KBUILD_CFLAGS +=3D -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> +KBUILD_RUSTFLAGS +=3D --target=3D$(objtree)/scripts/target.json
>  KBUILD_RUSTFLAGS +=3D -Ctarget-feature=3D-sse,-sse2,-sse3,-ssse3,-sse4.1=
,-sse4.2,-avx,-avx2
>
>  ifeq ($(CONFIG_X86_KERNEL_IBT),y)
> diff --git a/rust/Makefile b/rust/Makefile
> index 87958e864be0..8d75a6ffe951 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -428,8 +428,11 @@ $(obj)/core.o: private skip_clippy =3D 1
>  $(obj)/core.o: private skip_flags =3D -Dunreachable_pub
>  $(obj)/core.o: private rustc_objcopy =3D $(foreach sym,$(redirect-intrin=
sics),--redefine-sym $(sym)=3D__rust$(sym))
>  $(obj)/core.o: private rustc_target_flags =3D $(core-cfgs)
> -$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs scripts/target.json FORCE
> +$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
>         $(call if_changed_dep,rustc_library)
> +ifdef CONFIG_X86_64
> +$(obj)/core.o: scripts/target.json
> +endif
>
>  $(obj)/compiler_builtins.o: private rustc_objcopy =3D -w -W '__*'
>  $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FO=
RCE
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 576cf64be667..c85d130a4125 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -11,12 +11,14 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)         =
       +=3D sign-file
>  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)    +=3D insert-sys-c=
ert
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D rust=
doc_test_builder
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                +=3D rust=
doc_test_gen
> -always-$(CONFIG_RUST)                                  +=3D target.json
>
> +ifdef CONFIG_X86_64


Sorry for the delay.

I did not notice that this was waiting for my Ack.




Now, Rust for loongarch is upstreamed, and it also
uses the custom target.


This block should be changed to:

ifneq ($(CONFIG_X86_64)$(CONFIG_LOONGARCH),)
...
endif



With that changed,

Acked-by: Masahiro Yamada <masahiroy@kernel.org>





Or, if you want to make it a little bit cleaner,
perhaps you can introduce a new CONFIG option.

Let's say CONFIG_RUST_USE_CUSTOM_TARGET
(please pick up any option name you like).




In scripts/Makefile,


-always-$(CONFIG_RUST)                     +=3D target.json
+always-$(CONFIG_RUST_USE_CUSTOM_TARGET)   +=3D target.json



In the top Makefile,

ifdef CONFIG_RUST_USE_CUSTOM_TARGET
KBUILD_RUSTFLAGS +=3D --target=3D$(objtree)/scripts/target.json
endif











> +always-$(CONFIG_RUST)                                  +=3D target.json
>  filechk_rust_target =3D $< < include/config/auto.conf
>
>  $(obj)/target.json: scripts/generate_rust_target include/config/auto.con=
f FORCE
>         $(call filechk,rust_target)
> +endif
>
>  hostprogs +=3D generate_rust_target
>  generate_rust_target-rust :=3D y
> --
> 2.30.2
>
>


--=20
Best Regards
Masahiro Yamada
