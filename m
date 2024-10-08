Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF2E770E2
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Oct 2024 18:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728410619; cv=none; b=UNQyWNpAkBq7MHWuGsIv9yh10jScLuFHOerTuFExgbUoU2IDonkitnG3AMogzhMRKV6M2LJ7FgpOvayQxxcdHruyoAokp88fojK1+dZI3wa57jGiYDurQqjizrah35eYucfl5avvATWRUya0zSkSG4TDsSFLiTzVkWbtCI+jbok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728410619; c=relaxed/simple;
	bh=nZUKVsnp39Ax6izs5UfPAyZnwnNiyFjckMQTU5MdG4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFUiIBlzUVzIirPBDmCF+xWkP/mgtE+PDT1VN4fvzoPxgPkzvwndkBD5713d+XzYZYd4QGzk1gALFg6o946KvmM/Jt5nkY3OCEIUJ+FI7E3aogSdGArK2Z5fyGE8LJBtvU1RM9rqqB5XmGqsnn8KBBnChWY74gpS1BLer0pxlL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wjPCkTkI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wjPCkTkI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb1dd2886so31435e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Oct 2024 11:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728410616; x=1729015416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THVJVpm9CroTXgxx7CCtrvcQtkVmkvNvwfBVgRAIWbg=;
        b=wjPCkTkI/RwQ4I8aSgxUaXiFj1r4Q7C2EGeozjwoLOsJ6k5VXvwsxUqS1dCmj6PnN6
         9jQkwiF9E/ZrJG5pp97PHcamuAiA/9RQ8qF33RHb/YAktZi0vNQwLruy0QvcSQ8zdI3N
         Gj+Nc05C5GceeMC3TYazGjPFKVeISKe25+bOIqWrfS8atvB9rmdVzVzUV+k2uYkHtapm
         ub6ZKsmfQACBm7mQ4uE8AScILgq6UH7b1PdSBOzo0atKBRQCoXskXSwNjbeVs45eAvFG
         rTuUjOIMqwFXLByTHkJnty/UjBszdr4kVbNCFuvl6MVZylQxK6G2xs4TvafPplnTwsFE
         JbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728410616; x=1729015416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THVJVpm9CroTXgxx7CCtrvcQtkVmkvNvwfBVgRAIWbg=;
        b=bnoN3JYKAnxjF8uj3NS/pxSgFIftwW/TuKi3bSRoPxfICqswSat4DIyU2Lhi1SBFB7
         nAbSZmMlVnGE6LGmRMb+WTWAsrqMiqcjYxPU2Z7vlOW+yTNvWym3aWfpxFc4ndTeB7uu
         jN8aBh/ATe5DcjZr+PGIGPXjV8bqX8qHcv+5f868u/iT8b6ca7p9u2udru99X1Gjyfv+
         /Gh6stENAML87VUOCzPnz20W/KGSiVqI924zo6L4dMExDC0ejonAMC8J/8CE8jxBFCLt
         XzIVc5Plht/k4IeZnyv8WtITNGT/Mjog0XLpivoc5DGn/r7rCRbdrVoBqwnMT+MQMIWv
         v2mw==
X-Forwarded-Encrypted: i=1; AJvYcCUyugLp8JaUWFdm9DrDSPzEY8Wxmlah3noUqkw/3qm5Vw5mo4fHWqnv7pVkSf8iQogVWI1KttJY5jssXJFVxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBnvzaOOQuaBKb9EQQny3EJrMgPOt/UIj5ubDDNTJRcv92coNa
	WyDISIOHyNmcIlP6gx1tBek3koHk8Rddemn3pWl5oycBmmBgLi5B3xvWtFEMOkcvl/NEDKp6ZNL
	8Ky1s6U55/EGe2oAnCYx4tDudNpKyN8Hl6s6J
X-Google-Smtp-Source: AGHT+IGLPWiBhNaGWxzJa35MIEUtbEoBbJvrKEtwGkm5uJvBWdhv96ZlqUkMFTdq2dojXV6d5nhx/HwjG/P7bBbmQJc=
X-Received: by 2002:a05:600c:a00c:b0:426:6edd:61a7 with SMTP id
 5b1f17b1804b1-43058e04e51mr112205e9.7.1728410616124; Tue, 08 Oct 2024
 11:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
In-Reply-To: <20241008-cfi-patchable-all-v1-1-512481fd731d@google.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 8 Oct 2024 11:03:23 -0700
Message-ID: <CAGSQo013VE060aiHyQBonyRn8-sAMs-H751JfYiTMSRH23Me6A@mail.gmail.com>
Subject: Re: [PATCH] cfi: rust: pass -Zpatchable-function-entry on all architectures
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-By: Matthew Maurer <mmaurer@google.com>


On Tue, Oct 8, 2024 at 10:37=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> The KCFI sanitizer stores the CFI tag of a function just before its
> machine code. However, the patchable-function-entry flag can be used to
> introduce additional nop instructions before the machine code, taking up
> the space that normally holds the CFI tag. In this case, a backwards
> offset is applied to the CFI tag to move them out of the way of the nop
> instructions. To ensure that C and Rust agree on the offset used by CFI
> tags, pass the -Zpatchable-function-entry to rustc whenever it is passed
> to the C compiler.
>
> The required rustc version is bumped to 1.81.0 to ensure that the
> -Zpatchable-function-entry flag is available when CFI is used.
>
> Fixes: ca627e636551 ("rust: cfi: add support for CFI_CLANG with Rust")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Note that this fix uses rustc-option which has a pending fix:
> https://lore.kernel.org/all/20241008-rustc-option-bootstrap-v2-1-e6e155b8=
f9f3@google.com/
> ---
>  arch/arm64/Makefile     | 2 ++
>  arch/loongarch/Makefile | 1 +
>  arch/riscv/Makefile     | 2 ++
>  init/Kconfig            | 2 +-
>  4 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 9efd3f37c2fd..d7ec0bb09fc4 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -143,9 +143,11 @@ CHECKFLAGS +=3D -D__aarch64__
>  ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS),y)
>    KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>    CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4,2
> +  KBUILD_RUSTFLAGS +=3D $(call rustc-option,-Zpatchable-function-entry=
=3D4$(comma)2)
>  else ifeq ($(CONFIG_DYNAMIC_FTRACE_WITH_ARGS),y)
>    KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>    CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D2
> +  KBUILD_RUSTFLAGS +=3D $(call rustc-option,-Zpatchable-function-entry=
=3D2)
>  endif
>
>  ifeq ($(CONFIG_KASAN_SW_TAGS), y)
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index ae3f80622f4c..f9cef31d1f0e 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -44,6 +44,7 @@ endif
>  ifdef CONFIG_DYNAMIC_FTRACE
>  KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>  CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D2
> +KBUILD_RUSTFLAGS +=3D $(call rustc-option,-Zpatchable-function-entry=3D2=
)
>  endif
>
>  ifdef CONFIG_64BIT
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index d469db9f46f4..65d4dcba309a 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -16,8 +16,10 @@ ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>         KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>  ifeq ($(CONFIG_RISCV_ISA_C),y)
>         CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D4
> +       KBUILD_RUSTFLAGS +=3D $(call rustc-option,-Zpatchable-function-en=
try=3D4)
>  else
>         CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D2
> +       KBUILD_RUSTFLAGS +=3D $(call rustc-option,-Zpatchable-function-en=
try=3D2)
>  endif
>  endif
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 530a382ee0fe..43434b681c3f 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1946,7 +1946,7 @@ config RUST
>         depends on !GCC_PLUGIN_RANDSTRUCT
>         depends on !RANDSTRUCT
>         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> -       depends on !CFI_CLANG || RUSTC_VERSION >=3D 107900 && HAVE_CFI_IC=
ALL_NORMALIZE_INTEGERS
> +       depends on !CFI_CLANG || RUSTC_VERSION >=3D 108100 && HAVE_CFI_IC=
ALL_NORMALIZE_INTEGERS
>         select CFI_ICALL_NORMALIZE_INTEGERS if CFI_CLANG
>         depends on !CALL_PADDING || RUSTC_VERSION >=3D 108100
>         depends on !KASAN_SW_TAGS
>
> ---
> base-commit: 4a335f920bc78e51b1d7d216d11f2ecbb6dd949f
> change-id: 20241008-cfi-patchable-all-ddd6275eaf4f
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
