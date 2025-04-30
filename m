Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FB253F32
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014123; cv=none; b=sJp6/O8lw1xzfQlQ7QeCuVxk2zb3EimPtym599kdkUh41Tbfndc1gHOBMwQbtLUrzocF1SRLpTu90bFMQU9uRQdoCrB8Ogwob87v0lcZLHVkMWAnFgobyTpBvp9WdNUzYoKRqPemOoq/V5UZtUxhOT1MSoOCtfT4fNejVrsSMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014123; c=relaxed/simple;
	bh=cEafmn+CQvRdDtyXdQjjjTvqE/nBCdUlVRZYmX2VXog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGf5+keWpjPBnEF6HFcQrCBY8Q8n+Ncw+uS5KTODoxK+d+r3WUzaAe7ah2yrVx1O7Ts2BrdNzz0zgwaxRI3zqPUC8vXLy2TPRDODav7MJ7aUR5S4goTVmWtLCNyCFX4DV/SyY7BwmRRIQS4aXONeBq/VfHexJPJZv7Joc7SJh1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YoJ+ndUL; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YoJ+ndUL"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so6683936a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746014120; x=1746618920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuyGNzxgDiOkjQwKgLR+DPXNIJCg0WiL8KUtY79VEQs=;
        b=YoJ+ndULHvhDDEaOaEviI4jkJJ55/+UgDZdUpuZX3Yg7aXH44j24FW2HPRc6neAjB3
         QMuJFyjSMM3HzbrIwJ1eBkxer5cYtPgS8In+F2nEM0drWzg8fLlNlyFSAb/+KKIi+/qx
         KExhH+iQYaU1RWKP6tfLQillpfBjgmxsKElcjI1JBDrut5D4/KYKZ49MZ7OuTyIcLc+S
         FG/esUVPqhypZ6OAJsWiFQw13wwT7PEuff/RWm6i2yLEGCs+4+Vp1csnoRZ3HQM5HsmN
         b2LWovWx7uuXjlAnsafGySecjRuec7/AFNBUg4FZCprNBHXB559rWOX5KCsbO4q+biEB
         83DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746014120; x=1746618920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuyGNzxgDiOkjQwKgLR+DPXNIJCg0WiL8KUtY79VEQs=;
        b=mUmX24g8Rvk8GFe4wXtIbiG36Y0NwqB+wvHVn4u4YUa98BhOZBPJfFivWBqrFLuX1f
         aIws72HZnCyZ7j6nkHECZVWmuFSmOkBD3mSAJsRAxaDyrVH4xmWzYpMlKOcJN5XG8jgC
         P9kGUn82amrFsVzeKrXqUR9ki3XFWrWXJNzRt+IEHyA3QhYk1dxEYPbWkdcbp9IabL5c
         uDi5MYSFYAUrjPenlsfwqYgYz+VT4Uvyc84ooUGMt+QY16UMIulBnL9AbE2QFIjxLz87
         6/MR0HayOpbB9mkl9JfRox8gyxC3UwwjYTScJN8wZatO9QbDJVezH09JbERw0Yd8LWXv
         +KTw==
X-Forwarded-Encrypted: i=1; AJvYcCUPsYFcrRLZr1Vl4UK0QKKxm31KW8rmWkbk1WPfgSAcUSRjJQ30mlcgHM8ffdo9dG6FgDlkpf90a65eVz6+JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdOVdw30MbA946Ua8Dsq3vxPkJXm8ElFajnob6JAx1Oc286G5M
	C44+ycScnXBSFfRZM52xaBeCtybPPhUccvg/7wOR9Mx8A7cqbBMnAgMxxVuH2jQLCTf4hVxBycu
	EtfgZM93TkewYeMe2lhzY4f7tkfaAVSmZ9M1f
X-Gm-Gg: ASbGncsbEFMXyEOdXYCovCZVESlOp6Bci9PzseLZy0BqhSfSRgMiKB76ByS5ky/UH27
	1YiFZCcb3i7LmwKW2mhxD8W8N1DIeNbKR+U0ajhBTYmNmoFG6FWV0qGpBaqYezwhABMfqb1eTi/
	BTru4UCn1fkk7ayBHqFJu3nMoeiLRAxz4fQJbOx4MY5VCB5n+UMhp7
X-Google-Smtp-Source: AGHT+IGwJXAzQrRYamfgcjkePkCyZD/+tcwqKUOPh3vaz9WJg9ywHz6ypW3p7A0p0mLXG8BPw3/UYz781u1FtNYWFzs=
X-Received: by 2002:a17:90a:da83:b0:305:2d27:7c9f with SMTP id
 98e67ed59e1d1-30a3331eebbmr4689528a91.16.1746014119912; Wed, 30 Apr 2025
 04:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
In-Reply-To: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 30 Apr 2025 13:55:06 +0200
X-Gm-Features: ATxdqUGMpC2B1RGjyZnHvqdqDFG5FAFUqW_p8EIC04ZX-V4PP8t0Bammv6S-GJE
Message-ID: <CANp29Y4o8o6gz6GbM6NhP9sJUi94q29=aa+tLc1aCk0UVpgj0w@mail.gmail.com>
Subject: Re: [PATCH] kcov: rust: add flags for KCOV with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:04=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Rust code is currently not instrumented properly when KCOV is enabled.
> Thus, add the relevant flags to perform instrumentation correctly. This
> is necessary for efficient fuzzing of Rust code.
>
> The sanitizer-coverage features of LLVM have existed for long enough
> that they are available on any LLVM version supported by rustc, so we do
> not need any Kconfig feature detection.
>
> The coverage level is set to 3, as that is the level needed by trace-pc.
>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Thanks!

I've run syzkaller against a kernel built with the patch applied and
the tool was able to successfully obtain coverage feedback from the
Rust code, so
Tested-by: Aleksandr Nogikh <nogikh@google.com>

As a side note, in the resulting code coverage I also see a lot of PCs
from rustlib, which isn't the primary target when fuzzing the kernel.
Do you find it reasonable not to instrument rustlib with coverage
callbacks? For C code, there do exist some exceptions for KCOV, see
e.g. lib/Makefile.

> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 3 +++
>  2 files changed, 9 insertions(+)
>
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07b8=
efa106e8dffa640 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    +=3D -fsa=
nitize-coverage=3Dtrace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverage=
=3Dtrace-cmp
>  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         +=3D -fplugin=3D$(objtree=
)/scripts/gcc-plugins/sancov_plugin.so
>
> +kcov-rflags-y                                  +=3D -Cpasses=3Dsancov-mo=
dule
> +kcov-rflags-y                                  +=3D -Cllvm-args=3D-sanit=
izer-coverage-level=3D3
> +kcov-rflags-y                                  +=3D -Cllvm-args=3D-sanit=
izer-coverage-trace-pc
> +kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  +=3D -Cllvm-args=3D-sanit=
izer-coverage-trace-compares
> +
>  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> +export RUSTFLAGS_KCOV :=3D $(kcov-rflags-y)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb5e=
129effb8846d5b8 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>         $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-ke=
rnel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
>         $(CFLAGS_KCOV))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +       $(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-ke=
rnel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
> +       $(RUSTFLAGS_KCOV))
>  endif
>
>  #
>
> ---
> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> change-id: 20250430-rust-kcov-6c74fd0f1f06
>
> Best regards,
> --
> Alice Ryhl <aliceryhl@google.com>
>
