Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1CF32E137
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 19:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770233749; cv=none; b=CthacaH0BNaZ7y6fi626M8N0RkFbH9Lq1/X+ZfDtxilhbuVi04Zjfi4RPgMSEYEHojHsiRyjranLG2l6eyN260kESPpj5V33Xk6y9toShUbkDPdUpNETljyuQjDKxV82pMbgLa0HEgnjkwYmweFXBJ56R8bGkeDg0tcLqQnzqfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770233749; c=relaxed/simple;
	bh=9vSWloqcRXaxL3gvmit7soCRVhcCNrs5LQ17VXzVgV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRJ14kQWKKgCZowARAidh4yp93KItC7WeyS2InyOGsFJR375jbu3BZhd75PKsmLeOoaihYxiGWFgCyya5shIsAOp+5YGqxYzyoA0z9DY2E7VLLGbyI9kfaKrFR1JtcabVzqAUgAW/Us63cZWwVeKjce5cxdup+Vi3u+l0NiPrfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bD4za/gb; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bD4za/gb"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c7146b0854so8882685a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 11:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770233748; x=1770838548; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qrnr88nIhCevN+aceQs8WpTSQON3sJePiJ1Sjfxvheg=;
        b=bD4za/gbp5Kuvfu2sklElgoVgKifc65Jd8n6/Mgfqci/ZJGzMAU9K9DfTvUNsnQOMC
         ynGAb8Sdfp+Fbw2cpHXXRxee+mfITJCIoKS3vaE5eCAxsH8r2j5/Sa3Q4JBsKV56VVFB
         dXioIliZV8/Wk95ms1X0G0iAsu5hS+zV3nvNo1O51+MZZQFqHajx0RKeFsHKDatPMVvG
         GuhTft2kYerXtadzre94of0YcGqBggXGmSiWO75GcmAK237uSKLy+Q7J6wOTul8imrk5
         Bdc/lCKCl2nEPn6T2WD0VBFGuBfoakS5634pcLmWoItiC3D/HReWDloEAzirRlVjylIV
         L+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770233748; x=1770838548;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrnr88nIhCevN+aceQs8WpTSQON3sJePiJ1Sjfxvheg=;
        b=ZrWcSM2TrU/ysRFlDuF00AW1IoSARWEiq4Xy4FUzo3a/hNue2DTFbFVHlJI/WOeH5+
         pn/yKO79xEuIQGUx2hBtR8rNeoegl6OhLj9DjSbEAOL3PGF/jYmJS5+DVlxDxuqAIbWg
         PqOqQDFd47BYbeb6kMsgwYmF7gYJg7oqeL/Ri8yP2cTIDlac83gSx04o4GXYcd3LNWRe
         Yk1Q39BMKpvzWCuFCYY2lYqRUN82rrtTeJpw3YP7AP/Y56W5snICplxVWTY7WQ3Jgjqx
         Fs31qrsdmPhWf5zKkvgQrnGsw7g5wqh2xk8tLkda4J0n4TxUt0SgOSp+fUnPy9EltOf6
         WelA==
X-Gm-Message-State: AOJu0YwHuQqoL2KcTwTtzoYYvaWv0cw8HeaFDwp8BhO8A9/n+/q69DS1
	drCQdoezZnBdCNbExEffUb4O7UdTSl2FPyg1ISFM344YaPjeR19Xxv8i
X-Gm-Gg: AZuq6aIvTXWIsdh9RWA07YDdmNYlo135R/iZB5JT4OeyDaiDWmISJG8wC4MKoGf1tm8
	LZYNQg3V7xWek2iM6xAyhGeaWGTgkQrmyucH/cnExE75RebFybjkJxM3XKBMuIvFTj0/7h67xjK
	ui86qoWhfC36u/ybpjLFJWjDFFwBfQ4LRuU0BiFhoY7rzojRoPBYID6kTdBSSuQQEbvuIV8o19w
	OsSOA+caT7rx8Jm1uOGU0asnoGeyOvcNYhpvDGFzjv+nwhS7VTib2AeJ/x+AcN97I7Li5DAyJ0l
	7UJvb9ONJCl9RlbyQsJySU0PLfvt6impdkuV//XSPFgvpFrIwUY4nmHD1TBoI9+pO5kxIK7OcOC
	1yBvMfmMPSXYfdVo7p4YIy33/Nnv+hxRVK8EkggMy2hcSsMKh64M7n79eaXFSbvx1auff79OTdL
	jtvoNLILGpMa0w/7KF0gWuxf2vJuDWQ5/KQYJ58Shu1K6AWywQm+vJdpCBHqw=
X-Received: by 2002:a17:903:3d46:b0:2a0:de4f:ca7 with SMTP id d9443c01a7336-2a933cdd064mr26781485ad.1.1770226421229;
        Wed, 04 Feb 2026 09:33:41 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933884954sm26879545ad.28.2026.02.04.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:33:40 -0800 (PST)
Date: Wed, 4 Feb 2026 23:03:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, 
	officialTechflashYT@gmail.com, Ash Logan <ash@heyquark.com>, 
	Roberto Van Eeden <rw-r-r-0644@protonmail.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] rust: Add PowerPC support
Message-ID: <aYOCWHF4CwzDVPuA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204030507.8203-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204030507.8203-1-linkmauve@linkmauve.fr>

On Wed, Feb 04, 2026 at 04:05:04AM +0100, Link Mauve wrote:
> For now only Big Endian 32-bit PowerPC is supported, as that is the only
> hardware I have.  This has been tested on the Nintendo Wii so far, but I
> plan on also using it on the GameCube, Wii U and Apple G4.
> 
> These changes aren’t the only ones required to get the kernel to compile
> and link on PowerPC, libcore will also have to be changed to not use
> integer division to format u64, u128 and core::time::Duration, otherwise
> __udivdi3() and __umoddi3() will have to be added.  I have tested this
> change by replacing the three implementations with unimplemented!() and
> it linked just fine.
> 
Hey Link,
I sent a patch with ppc64le support. 
https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com/

Can i take this patch and put ppc64le support over it and send it out?

Regards,
Mukesh
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> ---
>  Documentation/rust/arch-support.rst   |  1 +
>  arch/powerpc/Kconfig                  |  1 +
>  arch/powerpc/Makefile                 |  2 ++
>  arch/powerpc/include/asm/jump_label.h | 16 ++++++++++------
>  rust/Makefile                         |  4 +++-
>  scripts/generate_rust_target.rs       | 10 ++++++++++
>  6 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6e6a515d0899..70b9e192a7a0 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
>  ``arm``        Maintained        ARMv7 Little Endian only.
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> +``powerpc``    Maintained        32-bit Big Endian only.
>  ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9537a61ebae0..17db23b82e91 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -283,6 +283,7 @@ config PPC
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
> +	select HAVE_RUST			if PPC32
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..9fd82c75dcbd 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -61,6 +61,8 @@ else
>  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>  endif
>  
> +KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
> +
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  KBUILD_CPPFLAGS	+= -mlittle-endian
>  KBUILD_LDFLAGS	+= -EL
> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
> index d4eaba459a0e..238f0f625a36 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,18 @@
>  #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>  #define JUMP_LABEL_NOP_SIZE	4
>  
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:\n\t"					\
> +	"nop # arch_static_branch\n\t"			\
> +	".pushsection __jump_table,  \"aw\"\n\t"	\
> +	".long 1b - ., " label " - .\n\t"		\
> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
> +	 ".popsection \n\t"
> +
>  static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>  {
> -	asm goto("1:\n\t"
> -		 "nop # arch_static_branch\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".long 1b - ., %l[l_yes] - .\n\t"
> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -		 ".popsection \n\t"
> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);
>  
>  	return false;
> diff --git a/rust/Makefile b/rust/Makefile
> index 5c0155b83454..377e6fd68524 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  	-fno-inline-functions-called-once -fsanitize=bounds-strict \
>  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
>  	-fzero-init-padding-bits=% -mno-fdpic \
> -	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
> +	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
> +	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
>  
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86	:= x86_64-linux-gnu
>  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
>  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
>  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
> +BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>  
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 38b3416bb979..0054880ba0ea 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -188,6 +188,16 @@ fn main() {
>          panic!("arm uses the builtin rustc target");
>      } else if cfg.has("ARM64") {
>          panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
> +    } else if cfg.has("PPC32") {
> +        ts.push("arch", "powerpc");
> +        ts.push("data-layout", "E-m:e-p:32:32-Fn32-i64:64-n32");
> +        ts.push("features", "+soft-float");
> +        ts.push("llvm-target", "powerpc-unknown-eabi");
> +        if cfg.rustc_version_atleast(1, 91, 0) {
> +            ts.push("target-pointer-width", 32);
> +        } else {
> +            ts.push("target-pointer-width", "32");
> +        }
>      } else if cfg.has("RISCV") {
>          if cfg.has("64BIT") {
>              panic!("64-bit RISC-V uses the builtin rustc riscv64-unknown-none-elf target");
> -- 
> 2.52.0
> 
