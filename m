Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2B33992
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Oct 2023 18:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEWkeVMm"
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8E2E1
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Oct 2023 11:20:52 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7af45084eso62087747b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Oct 2023 11:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697480451; x=1698085251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2hbLwa0eLT+Vb8yhgn8soCjFIBKAl9L0lZ79nnYDbk=;
        b=HEWkeVMm20QvL253jKFKmKdqp85RQSwAxYdkVo8K2+0tdIfdDeH5w9z9j4Pb/E0Lra
         MbX5k5QMNcjETjqQKhJGiTrbHTihw3FZ49wiVoXMjL/nnJGrr1MDdklDnfYZU/TldEtq
         +zlrIuGtkb4bDnYxkfxqnTbZhDi5seLAUjUDrGD+xY8zY+7ue1R4nkt46J/bO6M2ZPmS
         vz506kJo94TbdehnWEnb/MpimkygeoTq6Z0Iy0gzHL5I3simqdxsILUqYagB8IHrYRrp
         x2Sm9PZJ0xiHa0z4jDSVvanybBF+Urj9QUVIVHdqjg5yIYgSiURLjb6DpYbXI1ppoAEn
         AA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697480451; x=1698085251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2hbLwa0eLT+Vb8yhgn8soCjFIBKAl9L0lZ79nnYDbk=;
        b=NdMnTHJ5/xa5PWGy7ZYqp78iM9KqTbSRLwveBHCVJJ98a46rE4lqPv/m7Z9iaOQoxH
         TZ+Ax791COGhQcRXu9zMQX3+kVIyLe2lEGeKZFUWORbjXow68MyF2H9ZpTE3UpwLqwXI
         FpA8098vqHP40L9fy+s2uVRHuFj02mwnuVZLFz/Vin/TpDpwOOmLMOe909l9qX6XwnuA
         rfBRLY32QMer87wfg9UO092DdSxBgrnVGSPGYGHh9H0t2+FLjf8eKSLB8Wzql5C9z2b5
         X9E9iamdetRvQ/GzQ7gFntHlwOgZNelNhyGNk7cCDsbC5uhD3dxruR8K5KSgo2fo5wwf
         Ywiw==
X-Gm-Message-State: AOJu0YxR4W/bcYV6FnG54ReHEbQD7D/JBotuZRqPSFwS1xRk5NdY71VY
	3hTI3lolJj+OKtbQ86H2yLM=
X-Google-Smtp-Source: AGHT+IFXgN9slTtbkWdGlIRbsA7VWIkpDWAuyOFo2z7l+gxKIHkG5JvnKTL/ed7IV1VBEykdd38OEA==
X-Received: by 2002:a81:8307:0:b0:5a8:62f2:b602 with SMTP id t7-20020a818307000000b005a862f2b602mr5250122ywf.13.1697480451547;
        Mon, 16 Oct 2023 11:20:51 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id ec3-20020ad44e63000000b0066cf6f202cdsm3638671qvb.122.2023.10.16.11.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 11:20:51 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id 0328F27C0071;
	Mon, 16 Oct 2023 14:14:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 16 Oct 2023 14:14:28 -0400
X-ME-Sender: <xms:g30tZT2wHYoT1DEupPeqpNy-ZmxGpHmsaMKs-OV7vIos-1M0fRZocg>
    <xme:g30tZSH0LCGtbWs3OwgTi5W6VPDrPwmUoX8lInuMkmsteuM77iWTaPgHFpElgwbCn
    1hAZ6xeA5FDuXklCA>
X-ME-Received: <xmr:g30tZT7wRSd5177q0ldafeOcWXpCCJiuqmP6o3uNdAhg8nxfwSnVWtP9g6E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjedtgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpeetjeeggfejledvgfdufeekvdfgteejhfeuudekieejleegteehtdfhhffh
    tdevieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdpgh
    hnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvge
    ehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhm
    sehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:g30tZY1qqhBOcKPh8MMbL21QJvvVtn8ZEqlGNJHfraqcCsnrXP9fjQ>
    <xmx:g30tZWHQifAV-VtAtXu4Yph3ImssOSq6docncLzItpajTB1xrdL-vA>
    <xmx:g30tZZ97N_QVtvj0N8adLWOgkvGz2j5KFkXYgoOQcWnL3QIW09iXUw>
    <xmx:hH0tZZ3Ir7ekeh3VZ4qo1_HLS1c0xUjN98NzhPCLRN8oh3XFBALa0g>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Oct 2023 14:14:26 -0400 (EDT)
Date: Mon, 16 Oct 2023 11:14:11 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v3 1/1] arm64: rust: Enable Rust support for AArch64
Message-ID: <ZS19c5MAFaGg4OGe@boqun-archlinux>
References: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com>
 <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 16, 2023 at 02:15:23PM +0100, Jamie Cunliffe wrote:
> This commit provides the build flags for Rust for AArch64. The core Rust
> support already in the kernel does the rest. This enables the PAC ret
> and BTI options in the Rust build flags to match the options that are
> used when building C.
> 
> The Rust samples have been tested with this commit.
> 
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>

Like I post previouly, the following is needed upon this to make the
command "make LLVM=1" still work on x86:

(the reason is https://lore.kernel.org/rust-for-linux/ZNu9JhYlsFWmliQE@boqun-archlinux/)

diff --git a/rust/Makefile b/rust/Makefile
index 3a784aa3a8a9..ac2ae21b830f 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -429,7 +429,7 @@ $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--re
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
        $(call if_changed_dep,rustc_library)
-ifeq ($(ARCH),x86_64)
+ifdef CONFIG_X86_64
 $(obj)/core.o: scripts/target.json
 endif

diff --git a/scripts/Makefile b/scripts/Makefile
index 0aa78339128c..a1b01c16688d 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -12,7 +12,7 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)   += insert-sys-cert
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                += rustdoc_test_builder
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)                += rustdoc_test_gen

-ifeq ($(ARCH),x86_64)
+ifdef CONFIG_X86_64
 always-$(CONFIG_RUST)                                  += target.json
 filechk_rust_target = $< < include/config/auto.conf
 $(obj)/target.json: scripts/generate_rust_target include/config/auto.conf FORCE

I put an updated version in the rust-dev branch:

	https://github.com/Rust-for-Linux/linux/commits/rust-dev

and have tested it (with kunit), so feel free to add:

Tested-by: Boqun Feng <boqun.feng@gmail.com>

More information for ARM64 maintainers, I have queued the previous
version for a while and tested with it whenever I updated the rust-dev,
so far no problem. I also have accesses to some ARM64 VMs (on Microsoft
Azure), if you want to see more testing, feel free to let me know.

Regards,
Boqun

> ---
>  Documentation/rust/arch-support.rst | 1 +
>  Makefile                            | 1 -
>  arch/arm64/Kconfig                  | 1 +
>  arch/arm64/Makefile                 | 4 ++++
>  arch/x86/Makefile                   | 1 +
>  rust/Makefile                       | 6 +++++-
>  scripts/Makefile                    | 5 +++--
>  scripts/generate_rust_target.rs     | 4 +++-
>  8 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index b91e9ef4d0c2..6bcb3b97c5b6 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -15,6 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
>  ============  ================  ==============================================
>  Architecture  Level of support  Constraints
>  ============  ================  ==============================================
> +``arm64``     Maintained        Little Endian only.
>  ``um``        Maintained        ``x86_64`` only.
>  ``x86``       Maintained        ``x86_64`` only.
>  ============  ================  ==============================================
> diff --git a/Makefile b/Makefile
> index 88ebf6547964..23100f193da3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -566,7 +566,6 @@ KBUILD_CFLAGS += -fno-strict-aliasing
>  
>  KBUILD_CPPFLAGS := -D__KERNEL__
>  KBUILD_RUSTFLAGS := $(rust_common_flags) \
> -		    --target=$(objtree)/scripts/target.json \
>  		    -Cpanic=abort -Cembed-bitcode=n -Clto=n \
>  		    -Cforce-unwind-tables=n -Ccodegen-units=1 \
>  		    -Csymbol-mangling-version=v0 \
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 78f20e632712..d72618433521 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -227,6 +227,7 @@ config ARM64
>  	select HAVE_FUNCTION_ARG_ACCESS_API
>  	select MMU_GATHER_RCU_TABLE_FREE
>  	select HAVE_RSEQ
> +	select HAVE_RUST if CPU_LITTLE_ENDIAN
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 2d49aea0ff67..4562a8173e90 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -41,6 +41,8 @@ KBUILD_CFLAGS	+= -mgeneral-regs-only	\
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS	+= $(compat_vdso)
>  
> +KBUILD_RUSTFLAGS += --target aarch64-unknown-none -C target-feature="-neon"
> +
>  KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
>  KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
>  
> @@ -65,7 +67,9 @@ endif
>  
>  ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
>    KBUILD_CFLAGS += -mbranch-protection=pac-ret+bti
> +  KBUILD_RUSTFLAGS += -Z branch-protection=bti,pac-ret
>  else ifeq ($(CONFIG_ARM64_PTR_AUTH_KERNEL),y)
> +  KBUILD_RUSTFLAGS += -Z branch-protection=pac-ret
>    ifeq ($(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET),y)
>      KBUILD_CFLAGS += -mbranch-protection=pac-ret
>    else
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 5bfe5caaa444..0f339d4abd40 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -68,6 +68,7 @@ export BITS
>  #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
>  #
>  KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> +KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
>  KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
>  
>  ifeq ($(CONFIG_X86_KERNEL_IBT),y)
> diff --git a/rust/Makefile b/rust/Makefile
> index 87958e864be0..b3127501e0e1 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -294,6 +294,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86	:= x86_64-linux-gnu
> +BINDGEN_TARGET_arm64    := aarch64-linux-gnu
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>  
>  # All warnings are inhibited since GCC builds are very experimental,
> @@ -428,8 +429,11 @@ $(obj)/core.o: private skip_clippy = 1
>  $(obj)/core.o: private skip_flags = -Dunreachable_pub
>  $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
>  $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
> -$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs scripts/target.json FORCE
> +$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
>  	$(call if_changed_dep,rustc_library)
> +ifeq ($(ARCH),x86_64)
> +$(obj)/core.o: scripts/target.json
> +endif
>  
>  $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
>  $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 576cf64be667..0aa78339128c 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -11,12 +11,13 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
>  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
> -always-$(CONFIG_RUST)					+= target.json
>  
> +ifeq ($(ARCH),x86_64)
> +always-$(CONFIG_RUST)					+= target.json
>  filechk_rust_target = $< < include/config/auto.conf
> -
>  $(obj)/target.json: scripts/generate_rust_target include/config/auto.conf FORCE
>  	$(call filechk,rust_target)
> +endif
>  
>  hostprogs += generate_rust_target
>  generate_rust_target-rust := y
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 3c6cbe2b278d..ec5ef35dbe52 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -148,7 +148,9 @@ fn main() {
>      let mut ts = TargetSpec::new();
>  
>      // `llvm-target`s are taken from `scripts/Makefile.clang`.
> -    if cfg.has("X86_64") {
> +    if cfg.has("ARM64") {
> +        panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
> +    } else if cfg.has("X86_64") {
>          ts.push("arch", "x86_64");
>          ts.push(
>              "data-layout",
> -- 
> 2.30.2
> 
