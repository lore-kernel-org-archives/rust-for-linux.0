Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C468361DA2;
	Thu,  5 Feb 2026 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279269; cv=none; b=cu1aYQYz+FZevBLn9s9Pm0pquzNl0gfqaxg7+rPifOOAjTnfCbzMi4jtioKh+3NOehK7a+aptbkp/xbPyVMBO2BknTCvICVHO8bYf/oiE+A+gam2UJp6NDUQiTk/g3jjZx5p7goc0dyHcfzmjaQbLGqYC2CXzeI505zqV/GGcHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279269; c=relaxed/simple;
	bh=FUwMNUGw/cKb8caxS4zPWsELhg0HADhxQNboK0Epa2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qAAisSwZP4fSfx1VtvUyT4gXx/t8q3iCVnVte/1YEP8RxjHdyT2Pd/EOOyeNuZJyG6s0+GCPbnRA88CFhJh4IOEHmRarGzI1gtdQ1Sb4iSew3PpO+i2u/RvWxB8rcPks75Ecs8ccqyNN4sZT4xycPlesg4jvzwf4l5x5QnOLs7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyaGNRv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyaGNRv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D34DC19421;
	Thu,  5 Feb 2026 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770279269;
	bh=FUwMNUGw/cKb8caxS4zPWsELhg0HADhxQNboK0Epa2E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iyaGNRv2Js5q9pgtoHuFBucTUOFUsUN1C2xgrkKqyESBhEHPj0pQKVVUlHpIo65s4
	 bGzpGqQWEmdfuOowPMZYKTQEQ/hjwstej2OE+O90+l2XPfpzbGaflh+LjF57tDss+e
	 21dJn313jpVF/pE2d4YAP4h80QMAJeWbE5kE5nbtYvHu/CJQ7wRkHMhE2fjACWNPny
	 JvySe+RFyzAbs8koXYQ3rTLHfwXV+I/C+89Ci4okrDFQ8jQSISg/FoppQ0E4kBQHSR
	 rl1SomuA9JxMXri6TO1hHNVxaR3vzYz2GD2Rl5zvvAZCIVqIZ+KWjSmfF1mIDai/8Z
	 WqEhN8JST13Ag==
Message-ID: <f3de29ec-ae58-4108-862b-a9457e8ac7eb@kernel.org>
Date: Thu, 5 Feb 2026 09:14:22 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-4-mkchauras@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260204210125.613350-4-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 04/02/2026 à 22:01, Mukesh Kumar Chaurasiya (IBM) a écrit :
> [Vous ne recevez pas souvent de courriers de mkchauras@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Enabling rust support for ppc64le only.
> 
> Tested on powernv9:
> 
> $ uname -rm
> 6.19.0-rc8+ ppc64le
> 
> $ sudo modprobe rust_minimal
> [  632.890850] rust_minimal: Rust minimal sample (init)
> [  632.890881] rust_minimal: Am I built-in? false
> [  632.890898] rust_minimal: test_parameter: 1
> 
> $ sudo rmmod rust_minimal
> [  648.272832] rust_minimal: My numbers are [72, 108, 200]
> [  648.272873] rust_minimal: Rust minimal sample (exit)
> 
> $ sudo modprobe rust_print
> [  843.410391] rust_print: Rust printing macros sample (init)
> [  843.410424] rust_print: Emergency message (level 0) without args
> [  843.410451] rust_print: Alert message (level 1) without args
> [  843.410477] rust_print: Critical message (level 2) without args
> [  843.410503] rust_print: Error message (level 3) without args
> [  843.410530] rust_print: Warning message (level 4) without args
> [  843.410557] rust_print: Notice message (level 5) without args
> [  843.410594] rust_print: Info message (level 6) without args
> [  843.410617] rust_print: A line that is continued without args
> [  843.410646] rust_print: Emergency message (level 0) with args
> [  843.410675] rust_print: Alert message (level 1) with args
> [  843.410691] rust_print: Critical message (level 2) with args
> [  843.410727] rust_print: Error message (level 3) with args
> [  843.410761] rust_print: Warning message (level 4) with args
> [  843.410796] rust_print: Notice message (level 5) with args
> [  843.410821] rust_print: Info message (level 6) with args
> [  843.410854] rust_print: A line that is continued with args
> [  843.410892] rust_print: 1
> [  843.410895] rust_print: "hello, world"
> [  843.410924] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
> [  843.410977] rust_print: Arc<dyn Display> says 42
> [  843.410979] rust_print: Arc<dyn Display> says hello, world
> 
> $ sudo rmmod rust_print
> [  843.411003] rust_print: "hello, world"
> [  888.499935] rust_print: Rust printing macros sample (exit)
> 
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

Small comment below

> ---
>   Documentation/rust/arch-support.rst | 2 +-
>   arch/powerpc/Kconfig                | 2 +-
>   arch/powerpc/Makefile               | 9 ++++++++-
>   rust/Makefile                       | 9 ++++++++-
>   4 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index e26a94808e97..627471ac9238 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
>   ``arm``        Maintained        ARMv7 Little Endian only.
>   ``arm64``      Maintained        Little Endian only.
>   ``loongarch``  Maintained        \-
> -``powerpc``    Experimental      32-bit Big Endian only.
> +``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian.
>   ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>   ``um``         Maintained        \-
>   ``x86``        Maintained        ``x86_64`` only.
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 17db23b82e91..c5dd03713af2 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -283,7 +283,7 @@ config PPC
>          select HAVE_REGS_AND_STACK_ACCESS_API
>          select HAVE_RELIABLE_STACKTRACE
>          select HAVE_RSEQ
> -       select HAVE_RUST                        if PPC32
> +       select HAVE_RUST                        if PPC32 || (PPC64 && CPU_LITTLE_ENDIAN)

Would be better to leave the first line as is and add a second line as 
follows:

	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN

>          select HAVE_SAMPLE_FTRACE_DIRECT        if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>          select HAVE_SAMPLE_FTRACE_DIRECT_MULTI  if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>          select HAVE_SETUP_PER_CPU_AREA          if PPC64
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 9fd82c75dcbd..f93816ddc036 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,7 +61,14 @@ else
>   KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>   endif
> 
> -KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
> +ifdef CONFIG_PPC64
> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> +KBUILD_RUSTFLAGS       += --target=powerpc64le-unknown-linux-gnu
> +endif
> +KBUILD_RUSTFLAGS       += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
> +else
> +KBUILD_RUSTFLAGS       += --target=powerpc-unknown-linux-gnu
> +endif
> 
>   ifdef CONFIG_CPU_LITTLE_ENDIAN
>   KBUILD_CPPFLAGS        += -mlittle-endian
> diff --git a/rust/Makefile b/rust/Makefile
> index ae22f2c5f0b3..c3961fd0d9a4 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -392,10 +392,17 @@ BINDGEN_TARGET_x86        := x86_64-linux-gnu
>   BINDGEN_TARGET_arm64   := aarch64-linux-gnu
>   BINDGEN_TARGET_arm     := arm-linux-gnueabi
>   BINDGEN_TARGET_loongarch       := loongarch64-linux-gnusf
> -BINDGEN_TARGET_powerpc := powerpc-linux-gnu
>   BINDGEN_TARGET_um      := $(BINDGEN_TARGET_$(SUBARCH))
>   BINDGEN_TARGET         := $(BINDGEN_TARGET_$(SRCARCH))
> 
> +ifdef CONFIG_PPC64
> +ifdef CONFIG_CPU_LITTLE_ENDIAN
> +BINDGEN_TARGET_powerpc := powerpc64le-linux-gnu
> +endif
> +else
> +BINDGEN_TARGET_powerpc := powerpc-linux-gnu
> +endif
> +
>   # All warnings are inhibited since GCC builds are very experimental,
>   # many GCC warnings are not supported by Clang, they may only appear in
>   # some configurations, with new GCC versions, etc.
> --
> 2.52.0
> 

