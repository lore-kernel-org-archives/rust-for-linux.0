Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FAD15990E
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jul 2024 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722263116; cv=none; b=LuMN/uSkzeyjNmDMpX5M1GBvMlvEZGDO8IKURGWUSGQ/5WyzT+ZzjDt2FoGLC2efuTxSQt2XnC+UNBFaUoo6CbX6J4A616glqyuaR6IAFHXDrquRS6brC3mS5duVi8Opl/wm7U0J+uWNgAlg8DA1Kh9v6on+9vpEWcSM4ASecSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722263116; c=relaxed/simple;
	bh=clEI/5DjTKK8Gr0xUcSiofFZ4Zx8J4sj7ss/BKmPTRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2Lpwbq3cDma42HBZVNVFNli1VRjl+bZf+2wM58+q4YMvnfrfTmu6zn8Xcyh5sFEEFc8cVgSpxtkL2NrceE7ALe4Za5yLsIIxoePG5PRYx90bk5ebbM0jircrSnpFj6gMTYhFzorFjQYC4+nS+CKR3jUYXlr0rvSlxwvD0Tm6cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SfpCyP88; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SfpCyP88"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso17662095e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jul 2024 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722263112; x=1722867912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVM829+EhcVia4VVprQ2SYbpXevJjHoUSFXsuwUogXI=;
        b=SfpCyP88BCiwTZ8eCGNkO+f06i2D0kVWax47fvS+o4zo4tnjwQ66sYBIZW+B9nL/pU
         d3/qCO9UNlYBYGeEdB9+LHSYIlLdIqpTl1OzViz9an5sHyo9C6S1kRuZjS9gT6uALv2H
         Kl9T5ABkIMDbeaDdkbwTVjttKnZXJYYTodkxwVCFreA2TZ5esTt1gbqlNDEalez2pns6
         /BXpiRCvJubCvkHumn3ZuRlcn0utuTFPIlT5IgjaVzLjuhQpFMK+XR64IqqenTR+yUil
         zPbfNm79sHCCEu01E+vj7cC1s5mV2bqL102zW3xvM/NiWvtOQ43HPrsY2CDEsNJmFmTA
         LpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263112; x=1722867912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVM829+EhcVia4VVprQ2SYbpXevJjHoUSFXsuwUogXI=;
        b=jTOLIQinF2j1HzBZxu/egujO/C6rZKnCl55PmENrFQwHRjDWMWz1+PtUu9Nocrku7V
         +Dlbibx4DdF9EMojZGphphX/pDDypXgwcuhk6tT2gnZq2HLoQiYd138X+rGeyj6jJwbN
         X4h7H8Zv0qAcdG9Lqe6ZwjEKZTxMamXTC/6KKDmSWIw5zD0ZR5ks4yFySSsA30/DZib1
         IQYyEvfYjisn287bGEe5LyVL7/h2SIljkRogSpFgw0URHNrb/dEE8YE+Of8uzE3oecgq
         xC4J4U2vkXVOVKolz9eZNJElnHeHW5ZgmqlnPEqz/zEkWuz/yDWZ4ZWCf0vO3gq8meuy
         WcOg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6Y/zLz9ZpU4z3zHIwgVMIHthRGlR7/V2y5dv57ZVU/M67SOHkwOKDTU/cfjNOZQQNez0Yzf4Q8jzhcfJeDUqgPNDc64UxXx17hJR/U4=
X-Gm-Message-State: AOJu0Ywo/Ylid8yfZYw+gZJ1UwhprTea9iDts/faD2gk5MDehC/lKRBl
	qaK4SHFX5RlL30V4ODw3CxovF9x1v2ajReNiXh3bSVQKfzPrZCkXaD0ITVjNgvmllofW+e9CIQo
	M98M9c+9AqxQ07wEukoDJmpsO5BVOD6Zhbc9J
X-Google-Smtp-Source: AGHT+IFQYU16YlEglKzW3eVXPMw2hulSYWVP3EJV0ND4LobHlD1MaRThQeUtYygtvMTEPmYpkrM4DSmQ7vHTTIR+RAE=
X-Received: by 2002:a05:600c:510d:b0:426:5ef5:bcb1 with SMTP id
 5b1f17b1804b1-42811d6dc50mr56509235e9.6.1722263112076; Mon, 29 Jul 2024
 07:25:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
 <20240704-shadow-call-stack-v3-1-d11c7a6ebe30@google.com> <20240704164548.GB1394865@thelio-3990X>
In-Reply-To: <20240704164548.GB1394865@thelio-3990X>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 29 Jul 2024 16:25:00 +0200
Message-ID: <CAH5fLgi-4FMeXQf2DjFYX85fPrfs8PeBarOFTbUtwf-+bPNz0A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: SHADOW_CALL_STACK is incompatible with Rust
To: Nathan Chancellor <nathan@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Kees Cook <keescook@chromium.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 6:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Thu, Jul 04, 2024 at 03:07:57PM +0000, Alice Ryhl wrote:
> > When using the shadow call stack sanitizer, all code must be compiled
> > with the -ffixed-x18 flag, but this flag is not currently being passed
> > to Rust. This results in crashes that are extremely difficult to debug.
> >
> > To ensure that nobody else has to go through the same debugging session
> > that I had to, prevent configurations that enable both SHADOW_CALL_STAC=
K
> > and RUST.
> >
> > It is rather common for people to backport 724a75ac9542 ("arm64: rust:
> > Enable Rust support for AArch64"), so I recommend applying this fix all
> > the way back to 6.1.
> >
> > Cc: <stable@vger.kernel.org> # 6.1 and later
> > Fixes: 724a75ac9542 ("arm64: rust: Enable Rust support for AArch64")
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Would it be better to move this to arch/arm64/Kconfig?
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 167e51067508..080907776db9 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -90,7 +90,7 @@ config ARM64
>         select ARCH_SUPPORTS_DEBUG_PAGEALLOC
>         select ARCH_SUPPORTS_HUGETLBFS
>         select ARCH_SUPPORTS_MEMORY_FAILURE
> -       select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STA=
CK
> +       select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STA=
CK && !RUST
>         select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
>         select ARCH_SUPPORTS_LTO_CLANG_THIN
>         select ARCH_SUPPORTS_CFI_CLANG
>
> RISC-V probably needs the same change, which further leads me to believe
> that this workaround should be architecture specific, as they may be
> fixed and enabled at different rates.
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6b4d71aa9bed..4d89afdd385d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -213,6 +213,7 @@ config HAVE_SHADOW_CALL_STACK
>         def_bool $(cc-option,-fsanitize=3Dshadow-call-stack)
>         # https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a48=
4e843e6eeb51f0cb7b8819e50da6d2444d769
>         depends on $(ld-option,--no-relax-gp)
> +       depends on !RUST
>
>  config RISCV_USE_LINKER_RELAXATION
>         def_bool y

Thanks for taking a look. For now, I went with placing the `depends
on` in CONFIG_RUST as suggested by the others. This avoids cases where
enabling Rust results in changes to how mitigations are configured.

As for riscv, it doesn't need any special flags. Please see the commit
message for more details on riscv support.

https://lore.kernel.org/all/20240729-shadow-call-stack-v4-0-2a664b082ea4@go=
ogle.com/

Alice
