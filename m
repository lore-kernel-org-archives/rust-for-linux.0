Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE59347BD1
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232874; cv=none; b=enlEq3Ea8x5V9+HyuEr0PzAl9MSWY6kldnFTKMKLGTkRcmpWDXbhHSldhz9+gNZaB99DZ+h2PkMn+nS42j0QjrjN4y8UgRAmOkwP6pstjup5wBb9r+AUJAa92Vyo6sxXVu+RQTPYdp49/ZOiObBs2QIaAvJluCFFCrTNl1j4hAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232874; c=relaxed/simple;
	bh=NYIkARnJg6Tmu3FMo8EnsSZ/Bddg9GYCkt/zCwlc108=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L64K0jgi69NpqlsQF17BNhnHwC8+sSwYg5H5WdAb3HKXRV0FxicZMRlUiXeP25ELA9X6D9eMhjHR5dN5fyFrpD/dI48jCH8U4fACXYSmfTezvptGtLEGe2x9SpAOEWjZ0StB7CvrM+llL/3kKvB3pBy7zUoeo6FqPa+hkkgNdqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XaVGOwSm; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XaVGOwSm"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34f634dbfd6so39433a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 11:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770232874; x=1770837674; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pZYRyfQm2slhoCJVBlbeRDVIuS1dZe2tpNE2WvBoIdw=;
        b=XaVGOwSmUYq+bI30domjDJqLvPTthd8R8raZSBeMLVbCbQVmbnI8nAovZh9A2IhF5X
         kMEtnQDi8djTfRkx9E74OSfaa6/S0DMt4HdnXhS3QXjb0/t+1/M/xs7qcsPb8Zu8YB7n
         SOlNYvEijUYGC2QqDPtrd6VcbP9wnvIDvvgyoyLM9P3RGxi/aaWXRB4MlGhlL9INo+XM
         maPZK0EWR4q8FphnEXd17Y2PsnEyEU98qt8w5iDIJdPRMwN4eZwckQsXNmGPbknlOM4j
         XUm/DMnpKld2gbZKrw9UHwYizHAwtrj3B6KvBtGC02b/xiwj0Y0PhV1DD464MoXrKCZU
         mD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770232874; x=1770837674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZYRyfQm2slhoCJVBlbeRDVIuS1dZe2tpNE2WvBoIdw=;
        b=FGjIASnWQAdoQjvE4l75L8dqOQNGsNlyc5Ummux5IBQ7zzudRu2bV8WqIR3N5y/heJ
         eIA5WNFSuQjFSm+J3V8T65xbhJa+/z2MWk+tbCrFzeZJKeJNL3oRj/c4OlPILOcnzcl/
         09SgbDdjGXBTa/m5KijRD+Bq3N/XWhOQfprsOYGaeZqjCaWrlDeRBgJAjCI9D1Lh8E+x
         fkmFOXLx6IJEMdw3B2xlcx1H16eSLkiqqBQqmtQegkOoBhv+Y2WSod4wjEZwvpmoMpKQ
         mSeazkfYXvX4dO30uke+sSJr4OIxNX/KetysANoc2kItNGD2cVnYe9rXzFWCnXZtgy6d
         8/ew==
X-Forwarded-Encrypted: i=1; AJvYcCVoz1+BWd3o9IDDYGFDriIkUPOVS1uP16Zjj+Hf2IDkwjcYXA4EtZS2PgNFpThfFkN+zi/jtpGsofpYt+MSwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQtnlLyyhKAju9Xq459Ttb3CWTpX0f4Mn1mUTufbQK1vCyGZ9j
	ewiYCxSD4WLJcAt3m5hHKOxPUkKtGwfccsJ8UtRkUtIrHSYY5mRuOVn4Kc2KAw==
X-Gm-Gg: AZuq6aJ1dXKrbSDLYZUG4X3WDDXIiMQ1/1+VgCMzwEiDh0ZlT/X98Q2jv7EkEJbGnhF
	u6HEXG57UpEbjrIxTVu9t5BfGBs8oAc6EAExyevqTMQ5MfJL428ZcO0nEm7u/TyPMs/yVPawhuz
	zgygPR1hmUxH+cXMAFBtDfOnEspyKFd7TG0o03PtwLwMagJbuwpC9fy2PtvGU6X5OGlimp6YfjS
	MJImGUY5TxvAr0E12uRZMKTbqGeItJqPx/BOChRvzqFRRwCeXwgVoddwnssZ0PnDTuxEg5+v/ex
	8wFwL2LyiW6oFgp1hJ9E+bLWhKx4wPUoOstPEVQbo1k5BUeoSxMymubR1/y9DaCm0LwomaeL0Hu
	lCegVMq+GFhh0qqw4Vnb72h6RraBbJnIUvDaD2MqEcMbgUgg1WpztnOGyZoaK5phXCq5nKTH6u/
	XAKUelxWMoFVhJNXA++r9kv/N6Ra6OwMZaqg8fmVYbOXbZlphehzPuvXnDVWM=
X-Received: by 2002:a05:6a00:1391:b0:823:5270:f8d3 with SMTP id d2e1a72fcca58-8241c64d75cmr3547890b3a.54.1770226094264;
        Wed, 04 Feb 2026 09:28:14 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d434d12sm3016772b3a.40.2026.02.04.09.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:28:13 -0800 (PST)
Date: Wed, 4 Feb 2026 22:58:02 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Link Mauve <linkmauve@linkmauve.fr>
Subject: Re: [PATCH] powerpc: Enable Rust for ppc64le
Message-ID: <aYN_3P6aUaBWwQYo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260204042417.83903-1-mkchauras@gmail.com>
 <da26fa6a-5262-45bf-890c-7afbf94d0897@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da26fa6a-5262-45bf-890c-7afbf94d0897@kernel.org>

On Wed, Feb 04, 2026 at 06:11:13PM +0100, Christophe Leroy (CS GROUP) wrote:
> Hi Mukesh, hi Link,
> 
> Le 04/02/2026 à 05:24, Mukesh Kumar Chaurasiya (IBM) a écrit :
> > [Vous ne recevez pas souvent de courriers de mkchauras@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Enabling rust support for ppc64 only.
> 
> Link Mauve has sent a patch for rust support on PPC32 a few hours before
> you, see
> https://lore.kernel.org/r/20260204030507.8203-1-linkmauve@linkmauve.fr
> Could you coordinate together to provide something supporting both PPC32 and
> PPC64 ?
> 
Hey Christophe,
Sure.
> I see the following conflicts at the time being. I also have a few comments
> down.
> 
Ohk.
> diff --git a/Documentation/rust/arch-support.rst
> b/Documentation/rust/arch-support.rst
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
> index b8d36a261009..80b2666fc5af 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -283,8 +283,10 @@ config PPC
>  	select HAVE_REGS_AND_STACK_ACCESS_API
>  	select HAVE_RELIABLE_STACKTRACE
>  	select HAVE_RSEQ
> +	select HAVE_RUST			if PPC32
>  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if
> HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> +	select HAVE_RUST			if PPC64
>  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
>  	select HAVE_SOFTIRQ_ON_OWN_STACK
>  	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag)
> -mstack-protector-guard=tls -mstack-protector-guard-reg=r2
> -mstack-protector-guard-offset=0)
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..ac6fe8cc4ece 100644
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
> @@ -172,10 +174,11 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
> 
>  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
> 
> -KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
> -KBUILD_AFLAGS	+= $(AFLAGS-y)
> -KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
> -KBUILD_CFLAGS	+= $(CFLAGS-y)
> +KBUILD_CPPFLAGS		+= -I $(srctree)/arch/powerpc $(asinstr)
> +KBUILD_AFLAGS		+= $(AFLAGS-y)
> +KBUILD_CFLAGS		+= $(CC_FLAGS_NO_FPU)
> +KBUILD_CFLAGS		+= $(CFLAGS-y)
> +KBUILD_RUSTFLAGS        += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
> 
>  CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
>  ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/powerpc/include/asm/jump_label.h
> b/arch/powerpc/include/asm/jump_label.h
> index d4eaba459a0e..d2284c72d21b 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,35 @@
>  #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
>  #define JUMP_LABEL_NOP_SIZE	4
> 
> +<<<<<<< HEAD
> +/* This macro is also expanded on the Rust side. */
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:\n\t"					\
> +	"nop # arch_static_branch\n\t"			\
> +	".pushsection __jump_table,  \"aw\"\n\t"	\
> +	".long 1b - ., " label " - .\n\t"		\
> +	 JUMP_ENTRY_TYPE key " - .\n\t"			\
> +	 ".popsection \n\t"
> +
>  static __always_inline bool arch_static_branch(struct static_key *key, bool
> branch)
>  {
> -	asm goto("1:\n\t"
> -		 "nop # arch_static_branch\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".long 1b - ., %l[l_yes] - .\n\t"
> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -		 ".popsection \n\t"
> +	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
> +=======
> +#define JUMP_TABLE_ENTRY(key, label)			\
> +	".pushsection __jump_table,  \"aw\"	\n\t"	\
> +	".long 1b - ., " label " - .		\n\t"	\
> +	JUMP_ENTRY_TYPE key " - .		\n\t"	\
> +	".popsection 				\n\t"
> +
> +#define ARCH_STATIC_BRANCH_ASM(key, label)		\
> +	"1:	nop				\n\t"	\
> +	JUMP_TABLE_ENTRY(key,label)
> +
> +static __always_inline bool arch_static_branch(struct static_key *key, bool
> branch)
> +{
> +	asm goto(
> +		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
> +>>>>>>> rust64
>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>  	return false;
> @@ -34,10 +55,7 @@ static __always_inline bool
> arch_static_branch_jump(struct static_key *key, bool
>  {
>  	asm goto("1:\n\t"
>  		 "b %l[l_yes] # arch_static_branch_jump\n\t"
> -		 ".pushsection __jump_table,  \"aw\"\n\t"
> -		 ".long 1b - ., %l[l_yes] - .\n\t"
> -		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -		 ".popsection \n\t"
> +		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
>  		 : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>  	return false;
> diff --git a/rust/Makefile b/rust/Makefile
> index 5d357dce1704..9b72c1e96191 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -383,13 +383,19 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387
> -mpreferred-stack-boundary=% \
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
> +<<<<<<< HEAD
> +BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
> +=======
> +BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
> +>>>>>>> rust64
>  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
> 
> diff --git a/scripts/generate_rust_target.rs
> b/scripts/generate_rust_target.rs
> index 38b3416bb979..1860af50b926 100644
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
>              panic!("64-bit RISC-V uses the builtin rustc
> riscv64-unknown-none-elf target");
> @@ -256,6 +266,30 @@ fn main() {
>          }
>      } else if cfg.has("LOONGARCH") {
>          panic!("loongarch uses the builtin rustc
> loongarch64-unknown-none-softfloat target");
> +    } else if cfg.has("PPC64") {
> +        ts.push("arch", "powerpc64");
> +        ts.push(
> +            "data-layout",
> +            if cfg.has("CPU_LITTLE_ENDIAN") {
> +                "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> +            } else {
> +                "E-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> +            },
> +        );
> +        ts.push("features", "-mma,-altivec,-vsx,-hard-float");
> +        ts.push(
> +            "llvm-target",
> +            if cfg.has("CPU_LITTLE_ENDIAN") {
> +                "powerpc64le-linux-gnu"
> +            } else {
> +                "powerpc64-linux-gnu"
> +            },
> +        );
> +        if cfg.rustc_version_atleast(1, 91, 0) {
> +            ts.push("target-pointer-width", 64);
> +        } else {
> +            ts.push("target-pointer-width", "64");
> +        }
>      } else {
>          panic!("Unsupported architecture");
>      }
> 
> [...]
> 
> > ---
> >   arch/powerpc/Kconfig                  |  1 +
> >   arch/powerpc/Makefile                 |  9 +++++----
> >   arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
> >   rust/Makefile                         |  1 +
> >   scripts/generate_rust_target.rs       | 24 ++++++++++++++++++++++++
> >   5 files changed, 44 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 9537a61ebae0..e9b8d761ed52 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -285,6 +285,7 @@ config PPC
> >          select HAVE_RSEQ
> >          select HAVE_SAMPLE_FTRACE_DIRECT        if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> >          select HAVE_SAMPLE_FTRACE_DIRECT_MULTI  if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> > +       select HAVE_RUST                        if PPC64
> 
> Keep in alphabetic order
> 
Sure.
> >          select HAVE_SETUP_PER_CPU_AREA          if PPC64
> >          select HAVE_SOFTIRQ_ON_OWN_STACK
> >          select HAVE_STACKPROTECTOR              if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index a58b1029592c..7ad28cf0fd35 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -172,10 +172,11 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
> > 
> >   asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
> > 
> > -KBUILD_CPPFLAGS        += -I $(srctree)/arch/powerpc $(asinstr)
> > -KBUILD_AFLAGS  += $(AFLAGS-y)
> > -KBUILD_CFLAGS  += $(CC_FLAGS_NO_FPU)
> > -KBUILD_CFLAGS  += $(CFLAGS-y)
> > +KBUILD_CPPFLAGS                += -I $(srctree)/arch/powerpc $(asinstr)
> > +KBUILD_AFLAGS          += $(AFLAGS-y)
> > +KBUILD_CFLAGS          += $(CC_FLAGS_NO_FPU)
> > +KBUILD_CFLAGS          += $(CFLAGS-y)
> > +KBUILD_RUSTFLAGS        += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
> > 
> >   CHECKFLAGS     += -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
> >   ifdef CONFIG_CPU_BIG_ENDIAN
> > diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
> > index d4eaba459a0e..a6b211502bfe 100644
> > --- a/arch/powerpc/include/asm/jump_label.h
> > +++ b/arch/powerpc/include/asm/jump_label.h
> > @@ -15,14 +15,20 @@
> >   #define JUMP_ENTRY_TYPE                stringify_in_c(FTR_ENTRY_LONG)
> >   #define JUMP_LABEL_NOP_SIZE    4
> > 
> > +#define JUMP_TABLE_ENTRY(key, label)                   \
> > +       ".pushsection __jump_table,  \"aw\"     \n\t"   \
> > +       ".long 1b - ., " label " - .            \n\t"   \
> > +       JUMP_ENTRY_TYPE key " - .               \n\t"   \
> > +       ".popsection                            \n\t"
> > +
> > +#define ARCH_STATIC_BRANCH_ASM(key, label)             \
> > +       "1:     nop                             \n\t"   \
> > +       JUMP_TABLE_ENTRY(key,label)
> > +
> >   static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
> >   {
> > -       asm goto("1:\n\t"
> > -                "nop # arch_static_branch\n\t"
> > -                ".pushsection __jump_table,  \"aw\"\n\t"
> > -                ".long 1b - ., %l[l_yes] - .\n\t"
> > -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> > -                ".popsection \n\t"
> > +       asm goto(
> > +                ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
> >                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> > 
> >          return false;
> > @@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
> >   {
> >          asm goto("1:\n\t"
> >                   "b %l[l_yes] # arch_static_branch_jump\n\t"
> > -                ".pushsection __jump_table,  \"aw\"\n\t"
> > -                ".long 1b - ., %l[l_yes] - .\n\t"
> > -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> > -                ".popsection \n\t"
> > +                JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
> >                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> > 
> >          return false;
> > diff --git a/rust/Makefile b/rust/Makefile
> > index 5d357dce1704..7a6daa822cbc 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -390,6 +390,7 @@ BINDGEN_TARGET_x86  := x86_64-linux-gnu
> >   BINDGEN_TARGET_arm64   := aarch64-linux-gnu
> >   BINDGEN_TARGET_arm     := arm-linux-gnueabi
> >   BINDGEN_TARGET_loongarch       := loongarch64-linux-gnusf
> > +BINDGEN_TARGET_powerpc := powerpc64le-linux-gnu
> 
> This needs to depend on CONFIG_PPC64 and CONFIG_CPU_LITTLE_ENDIAN.
> 
Yeah, will fix this.
> 
> >   BINDGEN_TARGET_um      := $(BINDGEN_TARGET_$(SUBARCH))
> >   BINDGEN_TARGET         := $(BINDGEN_TARGET_$(SRCARCH))
> > 
> > diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> > index 38b3416bb979..875579b37424 100644
> > --- a/scripts/generate_rust_target.rs
> > +++ b/scripts/generate_rust_target.rs
> > @@ -256,6 +256,30 @@ fn main() {
> >           }
> >       } else if cfg.has("LOONGARCH") {
> >           panic!("loongarch uses the builtin rustc loongarch64-unknown-none-softfloat target");
> > +    } else if cfg.has("PPC64") {
> 
> Shouldn't this be done closer to PPC32 ?
> 
Yeah, I will build the 64 support over 32 and keep them together.
> > +        ts.push("arch", "powerpc64");
> > +        ts.push(
> > +            "data-layout",
> > +            if cfg.has("CPU_LITTLE_ENDIAN") {
> > +                "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> > +            } else {
> > +                "E-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> > +            },
> > +        );
> > +        ts.push("features", "-mma,-altivec,-vsx,-hard-float");
> > +        ts.push(
> > +            "llvm-target",
> > +            if cfg.has("CPU_LITTLE_ENDIAN") {
> > +                "powerpc64le-linux-gnu"
> > +            } else {
> > +                "powerpc64-linux-gnu"
> > +            },
> > +        );
> > +        if cfg.rustc_version_atleast(1, 91, 0) {
> > +            ts.push("target-pointer-width", 64);
> > +        } else {
> > +            ts.push("target-pointer-width", "64");
> > +        }
> >       } else {
> >           panic!("Unsupported architecture");
> >       }
> > --
> > 2.52.0
> > 
> 
