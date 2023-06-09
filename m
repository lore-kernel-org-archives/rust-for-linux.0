Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35F8C7EE2E
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 17:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjFIRtB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 13:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjFIRs7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 13:48:59 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB90DD
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 10:48:58 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-3f9c1735984so18194811cf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 10:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686332937; x=1688924937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRXTUAHiF1EUVkvinLaQkRIQJ59+ttPzaaP9Qux/DJM=;
        b=ff/RwmH/Wz598UUZOe64Q9W/lZvynEghp7zSPhhlt5PdSBvGpmBObcHvYpQOlpGIty
         1TLbEtI3Vs9YY/+gBN1h627hzgY30YjeL4hddfs7M/u6YZN2FykNFbR2zz6OlN9n2Lq1
         WDF1gs0YpKH4J5f9Z2zTJYCAWne8h8dG+LA9f5isN5HALZsikiqszSW5xlqmgcdVy9GT
         CvyJSj54coCyrHeOhQMumZVOtU5TOPbASRCEFPYS5foZtUVbWwqIC+5EjyibajjkBy7o
         lH+DS+fYc4eKKLF7AhSDvLH7f7kVl/Pe/FGPSJpuNe9Nhy/wjm2cuPpQbFpZp4SkJ3sF
         NYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686332937; x=1688924937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRXTUAHiF1EUVkvinLaQkRIQJ59+ttPzaaP9Qux/DJM=;
        b=X95iE/EC9WjKYxw1vbShhwMqFH1G1yHQMJK6zOINHGxzEq3lOwub64KC7do+JWPKUj
         MmGB2k7AYWwWnJGXwOJ6KrJnFkKx7lOp1Hfcy8cm5Mkx90bxWMeQB5f6wtrAsmusEp26
         AWxdBqmkpHZFScmoepu9FZsA+ga05YoFvYDijIcQtymN1zBnZ1+CM2sjlHro7DMgvczR
         wasMqkgPbQv+BGFxef4iP45WznXUHzYZywOWHO71iknONFJyUJqYSPjeQ+Ox5gO95E0G
         buLVRSQirGlMCfcvVMBmqky23mWQ0nNT6dRy9barEJ5SSSIUn3eaQX4oo1nm6qpV/Vq8
         xvtw==
X-Gm-Message-State: AC+VfDwSnh+7kvdWhFRRfakTBQeeWPvSfhFXqLURR6TcdtuqbQAblqFm
        zEEsvcS9ZI4qrSnto4VktTk=
X-Google-Smtp-Source: ACHHUZ4R0JtAV5w6lFFr2y1byGry15RkFGQ8hh0ZaLWFPWrPvHBmBsjY23neqfPTTYAv8uyHTfq2fA==
X-Received: by 2002:a05:6214:518a:b0:5f7:8b31:4522 with SMTP id kl10-20020a056214518a00b005f78b314522mr2479650qvb.5.1686332937128;
        Fri, 09 Jun 2023 10:48:57 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id n6-20020a0ce546000000b0062383edece8sm1304337qvm.91.2023.06.09.10.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 10:48:56 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailauth.nyi.internal (Postfix) with ESMTP id 3F2EC27C0054;
        Fri,  9 Jun 2023 13:48:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 09 Jun 2023 13:48:56 -0400
X-ME-Sender: <xms:BmaDZA1dRJdtnznOugYmdW59IoKQ1m0KWsZjrXxiQm9SiojXBYoMhA>
    <xme:BmaDZLFopylRFRz4CEkdmNeK5Mit_mOd18Ioz4ZNaovRtm5EEr7aAD18sD7SgLJ05
    HtrqbZS22lihoPi_Q>
X-ME-Received: <xmr:BmaDZI7x4hwws-_zgG5b_F329h2YSTwejbaY1TBdgKbQiD8N4uHq8QTg7Qc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtkedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepffehkeeuhfeigeevveejvefftdehueevfeetleevfefgudeitedvudev
    ieevkedunecuffhomhgrihhnpehgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:BmaDZJ3ZcUm_puhE4K99dM-1ANTC7JLrkPaVz4GeVpHfU4w6UOCpBg>
    <xmx:BmaDZDF6_I3i9MTo8AMtHyIeRZ6WUUfWtTTOoNZTx-tZmYWg5mCLWw>
    <xmx:BmaDZC-pWu4EZrOStEqiMksGRztktiOb0pB8vEF3CB6eRcD_hcisJQ>
    <xmx:B2aDZC2B8KSHYPAxk-E2X3tl83bvnrsVPINGqS1-qv9X1mJSxhsFew>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jun 2023 13:48:53 -0400 (EDT)
Date:   Fri, 9 Jun 2023 10:47:21 -0700
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v2 1/3] arm64: rust: Enable Rust support for AArch64
Message-ID: <ZINlqb3XHmz+dyLr@boqun-archlinux>
References: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
 <20230606145606.1153715-2-Jamie.Cunliffe@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606145606.1153715-2-Jamie.Cunliffe@arm.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jun 06, 2023 at 03:56:04PM +0100, Jamie Cunliffe wrote:
> This commit provides the build flags for Rust for AArch64. The core Rust
> support already in the kernel does the rest.
> 
> When disabling the neon and fp target features to avoid fp & simd
> registers. The use of fp-armv8 will cause a warning from rustc about
> an unknown feature that is specified. The target feature is still
> passed through to LLVM, this behaviour is documented as part of the
> warning. This will be fixed in a future version of the rustc
> toolchain.
> 
> The Rust samples have been tested with this commit.
> 
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> ---
>  Documentation/rust/arch-support.rst | 1 +
>  Makefile                            | 1 -
>  arch/arm64/Kconfig                  | 1 +
>  arch/arm64/Makefile                 | 2 ++
>  arch/x86/Makefile                   | 1 +
>  rust/Makefile                       | 6 +++++-
>  scripts/Makefile                    | 5 +++--
>  scripts/generate_rust_target.rs     | 4 +++-
>  8 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index b91e9ef4d0c2..9b022af2f649 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -15,6 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
>  ============  ================  ==============================================
>  Architecture  Level of support  Constraints
>  ============  ================  ==============================================
> +``arm64``     Maintained        None.
>  ``um``        Maintained        ``x86_64`` only.
>  ``x86``       Maintained        ``x86_64`` only.
>  ============  ================  ==============================================
> diff --git a/Makefile b/Makefile
> index 9d765ebcccf1..16b1e4de70e3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -561,7 +561,6 @@ KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
>  		   -std=gnu11
>  KBUILD_CPPFLAGS := -D__KERNEL__
>  KBUILD_RUSTFLAGS := $(rust_common_flags) \
> -		    --target=$(objtree)/scripts/target.json \
>  		    -Cpanic=abort -Cembed-bitcode=n -Clto=n \
>  		    -Cforce-unwind-tables=n -Ccodegen-units=1 \
>  		    -Csymbol-mangling-version=v0 \
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b1201d25a8a4..10e9399e8e2f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -217,6 +217,7 @@ config ARM64
>  	select HAVE_FUNCTION_ARG_ACCESS_API
>  	select MMU_GATHER_RCU_TABLE_FREE
>  	select HAVE_RSEQ
> +	select HAVE_RUST
>  	select HAVE_STACKPROTECTOR
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_KPROBES
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 2d49aea0ff67..2ce1555e9fc5 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -41,6 +41,8 @@ KBUILD_CFLAGS	+= -mgeneral-regs-only	\
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS	+= $(compat_vdso)
>  
> +KBUILD_RUSTFLAGS += --target aarch64-unknown-none -C target-feature="-neon,-fp-armv8"

I don't think you need "-fp-armv8" here, because "aarch64-unknown-none"
target doesn't have the target-feature "fp-arm64":

	rustc +1.68.2 --print cfg --target aarch64-unknown-none | grep target_feature

	target_feature="neon"

, and having the "-fp-armv8" gave me a warning at compile time:

	  RUSTC L rust/core.o warning: unknown feature specified for `-Ctarget-feature`: `fp-armv8`
	  |
	  = note: it is still passed through to the codegen backend
	  = help: consider filing a feature request

Regards,
Boqun

> +
>  KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
>  KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
>  
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index b39975977c03..79cffe92c916 100644
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
> index 7c9d9f11aec5..18d6fdb73fa9 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -262,6 +262,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
>  
>  # Derived from `scripts/Makefile.clang`.
>  BINDGEN_TARGET_x86	:= x86_64-linux-gnu
> +BINDGEN_TARGET_arm64    := aarch64-linux-gnu
>  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
>  
>  # All warnings are inhibited since GCC builds are very experimental,
> @@ -393,8 +394,11 @@ $(obj)/core.o: private skip_clippy = 1
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
> index 32b6ba722728..633479d02e33 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -9,12 +9,13 @@ hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
>  hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
>  hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
>  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
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
> 
> -- 
> 2.30.2
> 
