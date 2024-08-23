Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C30F18595A
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 12:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724416716; cv=none; b=S8F3ju/CNaMlu1QO+KEP0vICp7BfCCLSsyf8KyNh/hwBqFVEbJJR5ibAkK+4WigAsm59zNWagBNSrewjsBp874jcgn3AVyiK0MLK6kjEv2SzR019n0WbRXyLuIaP4I0cTDrCV5skrBKZKZk76Kyi/bvL9Hyawgx/TWdjeR1Iz4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724416716; c=relaxed/simple;
	bh=z5SaCZZ/AUIYCLI7VswbL9y1d0sJZxAgykq+THwwxlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amppEZqfl8J2IRFhU3mLd6S5Av8orLUvTMn5zP/yOiTi36UcjwDbKIX4RAnKdcYATNkbA1YdWEVSrC7QIbClfJou21ZsebevZm9aCatbBk/Jn4RenIjza9zO+RjMFf2BeNlAhYer3OLcXsGikQ+yIKddKvfmP3ymO31X88Q6w/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pvOiDyA+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pvOiDyA+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428fb103724so15789175e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Aug 2024 05:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724416713; x=1725021513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbYvBXeiPiYl2EfYzcedvlACh6Ce3Qx+WvhSD95cnzQ=;
        b=pvOiDyA+wt5s8MIZeO8Vz/nio5ZzqHle7jbewrqFajHMxWB3ahESpnaYC7Ttc5VNJl
         5D+mrgV0fnPnLu7Q2T+nCdU6EJjH1An7XgSzoqa5/IFE9TjbP0FZJfXkK5hIhkhbaUMz
         CWxB+ba/KlG8c63Z6WmwRjhZum5GUaQezzUU9c/xz1JoOYR9BpCIqnM4ZO9xBhGKqisZ
         lZ9GAyD8cfPSxMMZC8sVAamx++/hok3PmLS6nNmQt87MooLOVXlWios7Qzva0oyqAGAD
         lUFXO0VlmSsZWizzul3WXcLeZGT7nJeQ+W2M9aST/9AV7MPfZwz+Tnb6EWZvYEBeG+iX
         PURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724416713; x=1725021513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbYvBXeiPiYl2EfYzcedvlACh6Ce3Qx+WvhSD95cnzQ=;
        b=IqxNNcmUUq5yyn22oJ1UAwYoQZlyOpiPHXWJ9OZGADHVESx75F3uix02ckYjFbGxNA
         gixOjD4iBEMWYVWxzmR9CSkMzq/t1j7elmYwQoQtE6pXo1ECWMfso4gjWoX7SKg8N8iD
         8MecF3VjlBkBzrUJWkhRqDmJroNrHd+mggmfsxnXLSCw3sZW309Wt3jMyeT4pZNF5ZjR
         J028PMCrea5bmbCqkqU2EHEMFm6U7NIxfjLJCrbvIxDrFTFoWhMhJOv9kIbCUxMvz4nS
         Y5s8qyCb+/5PYS4cw2pUjRzIGuv36wTpJ/VnzOp7MryegXBEnSJUNWE2tmJqv6OYy59q
         qLhw==
X-Forwarded-Encrypted: i=1; AJvYcCUW/WOPk8fDYIBSXXHmOtiTwMxfbCJcBkW6V1MIOZH9aiE9cSnX49btSxbnHtdEFzmX+PS4Zj38XY9ww6R7Fg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8MPjH9hfDx1T9WalJFunA+0UX4JCnBhn5KJmPU8ozUX5v0Eim
	XJIzKlY+ID0lLmOCmQ/qK4FaD+wOSBoa2gyFJLMld//7GDEZnBoD5SBDbtLwz1DyWR0khu96nEx
	40nilXATpCTKALfax7+DoyGe46eh6FL32px5k
X-Google-Smtp-Source: AGHT+IFlaiQ0Jcv3TORMtYNwY0QQq8NYizbqOD7zLYhpeGb8TkvD41g4v0klfzzcM2MWSSBbDjmZjPAfBIMdrEIyYrc=
X-Received: by 2002:a05:600c:3152:b0:427:ee01:ebf0 with SMTP id
 5b1f17b1804b1-42ac389b58cmr38475035e9.8.1724416712444; Fri, 23 Aug 2024
 05:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>
 <20240820143503.GD28338@willie-the-truck> <CAH5fLggN+A2RawC-cpmSUHxYm=xz=1EDpMUv5C803hj37re1qA@mail.gmail.com>
 <20240823122423.GB32110@willie-the-truck>
In-Reply-To: <20240823122423.GB32110@willie-the-truck>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 23 Aug 2024 14:38:20 +0200
Message-ID: <CAH5fLgh6ywHeFSwbnaOu-QYrt_Jytv_y3zb1QbJzK-w4kQ617w@mail.gmail.com>
Subject: Re: [PATCH v5] rust: support for shadow call stack sanitizer
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 2:24=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Aug 20, 2024 at 05:13:58PM +0200, Alice Ryhl wrote:
> > On Tue, Aug 20, 2024 at 4:35=E2=80=AFPM Will Deacon <will@kernel.org> w=
rote:
> > > On Tue, Aug 06, 2024 at 10:01:44AM +0000, Alice Ryhl wrote:
> > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > index fe76c5d0a72e..d857f6f90885 100644
> > > > --- a/init/Kconfig
> > > > +++ b/init/Kconfig
> > > > @@ -1909,7 +1909,7 @@ config RUST
> > > >       depends on !MODVERSIONS
> > > >       depends on !GCC_PLUGINS
> > > >       depends on !RANDSTRUCT
> > > > -     depends on !SHADOW_CALL_STACK
> > > > +     depends on !SHADOW_CALL_STACK || RUSTC_VERSION >=3D 108000 &&=
 UNWIND_PATCH_PAC_INTO_SCS
> > >
> > > Sorry, I didn't spot this in v4, but since UNWIND_PATCH_PAC_INTO_SCS =
is
> > > specific to arm64 and the only other architecture selecting
> > > ARCH_SUPPORTS_SHADOW_CALL_STACK is riscv, I can't help but feel it wo=
uld
> > > be cleaner to move this logic into the arch code selecting HAVE_RUST.
> > >
> > > That is, it's up to the architecture to make sure that it has whateve=
r
> > > it needs for SCS to work with Rust if it claims to support Rust.
> > >
> > > What do you think?
> >
> > The `select RUST if ...` is going to get really complicated if we
> > apply that rule in general. Having options here allows us to split
> > them across several `depends on` clauses. I'm not sure it will even
> > work, I had issues with cyclic Kconfig errors previously. I also don't
> > think it's unreasonable for the architecture to say it supports both
> > options when it really does support both; they are just mutually
> > exclusive. I also think there is value in having all of the options
> > that Rust doesn't work with in one place.
>
> I'm not sure I follow why this will get really complicated. Isn't it as
> straightforward as the diff below, or did I miss something?

Hmm. I tried this but I wasn't able to enable Rust with this setup.
Even though the deps of RUSTC_SUPPORTS_ARM64 are ok, it doesn't seem
to be enabled and I can't find it in menuconfig. I think we need to
have a `select RUSTC_SUPPORTS_ARM64` somewhere.

Alice

> --->8
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index a2f8ff354ca6..2f5702cb9dac 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -231,7 +231,7 @@ config ARM64
>         select HAVE_FUNCTION_ARG_ACCESS_API
>         select MMU_GATHER_RCU_TABLE_FREE
>         select HAVE_RSEQ
> -       select HAVE_RUST if CPU_LITTLE_ENDIAN
> +       select HAVE_RUST if RUSTC_SUPPORTS_ARM64
>         select HAVE_STACKPROTECTOR
>         select HAVE_SYSCALL_TRACEPOINTS
>         select HAVE_KPROBES
> @@ -265,6 +265,11 @@ config ARM64
>         help
>           ARM 64-bit (AArch64) Linux support.
>
> +config RUSTC_SUPPORTS_ARM64
> +       bool
> +       depends on CPU_LITTLE_ENDIAN
> +       depends on !SHADOW_CALL_STACK || RUSTC_VERSION >=3D 108000 && UNW=
IND_PATCH_PAC_INTO_SC
> +
>  config CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
>         def_bool CC_IS_CLANG
>         # https://github.com/ClangBuiltLinux/linux/issues/1507
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0f3cd7c3a436..93858dbfefc0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -172,7 +172,7 @@ config RISCV
>         select HAVE_REGS_AND_STACK_ACCESS_API
>         select HAVE_RETHOOK if !XIP_KERNEL
>         select HAVE_RSEQ
> -       select HAVE_RUST if 64BIT
> +       select HAVE_RUST if 64BIT && !SHADOW_CALL_STACK
>         select HAVE_SAMPLE_FTRACE_DIRECT
>         select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>         select HAVE_STACKPROTECTOR
> diff --git a/init/Kconfig b/init/Kconfig
> index 5783a0b87517..3ada33b1d681 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1902,7 +1902,6 @@ config RUST
>         depends on !MODVERSIONS
>         depends on !GCC_PLUGINS
>         depends on !RANDSTRUCT
> -       depends on !SHADOW_CALL_STACK
>         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
>         help
>           Enables Rust support in the kernel.
>
