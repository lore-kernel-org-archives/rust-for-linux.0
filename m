Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308703BED6A
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773994; cv=none; b=C8n6Skss0X7HK28NPh4PYWII4wAlIy+ECVUMye7HvN7KRmekIAQiI/AIHhqiG3/eUwJFiVBvQMDmIrIFYUR7M+6hhSTAT5/M13hnY9QDDVtUNW0AzlaOanFp7fAacIWiG8gK622weqt5aIrNlL/0BwV4IxHvKzD5G4LqYWZo774=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773994; c=relaxed/simple;
	bh=uuEnsLAquuAtP7sCAQcx0VYPWRp7oJPqq3wabZWKndQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3Yu5jAj3qdO2TnIldfsWmIqX3H5PXeXmscKaRV/2OxGTV5BOHTkTmx3+CHflVrQ9bdjouLD5TQOnAjHntmWR6YB7pMbRxpy4fM7y3kIBU239CcuoDxqZKhcwYUZzWuqZl9wD7xu5z5rjSPvAHUXOK+Rw036A1Vb2GaPIWkLF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QalxiSR2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QalxiSR2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f1f6103afso1883226b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773984; x=1777378784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vPHwFw5HHJka+xANCiAhcAPbp7wHGr/DNQOtUCyQXW0=;
        b=QalxiSR2c88KJ0fUuT1R6d13o025Iug7RwrUEXGbMWHPJO4HHFGRjnHKHp9JuQVhTC
         ittTAt2ymElGa83ijGqznBMsx+wqspUSRcyMI6uO7s/pDa1GHUH3gwhOYt6/IVFopbYc
         28U4sDkBVpNaI0mnXoH7I5PuWG6d3VGSbhupdaiY9RPcBDmBDU7zHq/IAe9TxDOqa01F
         jZyKzWWJvBtiUJfYuSmXz0Bh3RdmpDWExzSfHgsECma/PZ6N1eEJIP+fPwnRRDgxSvXC
         QSZCemcGe3uJfogs1TnXW2NP5WNd5jBqWRdSXBaDkIxnNonmPGHdq1XcknDXmwnkgUV3
         GaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773984; x=1777378784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPHwFw5HHJka+xANCiAhcAPbp7wHGr/DNQOtUCyQXW0=;
        b=e1s0lrXGL64VHDu208AfGQICbxqN0gT+ssUb1gwTdexeK9cEC+ai+xR3Fivc+8IDpk
         lqzfOnqgzHKifwa+IGZc5xnn3RKagILUAd4fRdyFfl13YMpWFAXjZvuISFQRyfYLfB1K
         oUnCdvJLw/X+Jg/zOgO1ZPDJnpdq7wJ3IhnLSTufzFm+/7Dk2rKSv7opphxobw3yNKhj
         00tGvO1PAjdYTA/YyUclnA5zeMJMXOgIGuAAaqC9lnTtZUGxU9YbV9OqsX+4bq7sST62
         uIvY3qKciOGOpfsz1QOTHdDUKbSypJAVTqLTLQAgW/m/RwvPRkBOC9lr5Bk6cillYNwX
         qzVA==
X-Forwarded-Encrypted: i=1; AFNElJ+bgT1eD1Gb8zyTcdtxU3ftNqFeGr8SK7GTX+QQqzID5JhG6++pjtxylSWqI+R+Oui3J7aOetCqM3r976QKiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2UwianSRBmFdEeOX0RTjPV3OzqpiyJlH7thVQUKaHlV28kV0c
	GNyqLuJz6N2HU6AWsySWMdrmU+M1rTMbsfbKE25JBquvS31AXyAawk2i
X-Gm-Gg: AeBDietYUbqaCF5dKP3L5tH20LQDKW3j//TDawsLig5aMHx2fU7mCK2jpV9TXcq5ebW
	qRAz/UBBpi+2+xb9B+PVVfT7hCJwwe8+OmECyUtcW4qGMs/L7SCjuQP4C45uIjj/f+iG1EdV7p6
	LRpifDnzEbCHhWjUk+2Oea9s9598rYKHQsaXDpLolE5avfPTpTCANGU+R72u8SgwMBDWeoajXf2
	Z+4GxYB1jYA8T7vCQ5EXO0w66SQYyBDyfcsCUWwZnauUrSO52ZLFYFej5qAbIFtoFXDXF0BD7KQ
	FMfync+W70v4xBH6bJk2FZIlnfBLyuhBVstYmAgnYLljbUPY5GufKYkwIcztwkFEG1sneaaGut4
	m2Tfgl1UxyxPiROKAIl7n9HTtDf9VYspmSbS1TU7YIEviga+TCDpSU+lRrJQuGX8VZIythZFnVu
	RkqZDz7Q8txX5MIajw6rIW7DFKRUW0BldnpjEE1DRcQyLBwgY4fNehauqqXvmn4jb7EkQiB7USW
	73W1g==
X-Received: by 2002:a05:6a00:2d1f:b0:82f:bd8:70eb with SMTP id d2e1a72fcca58-82f8c876febmr17561225b3a.21.1776773984383;
        Tue, 21 Apr 2026 05:19:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9f7735sm14090875b3a.21.2026.04.21.05.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:19:43 -0700 (PDT)
Date: Tue, 21 Apr 2026 17:49:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aedQ629D0x-5KuKw@luna>

On Tue, Apr 21, 2026 at 12:26:51PM +0200, Link Mauve wrote:
> On Tue, Apr 21, 2026 at 03:25:22PM +0530, Mukesh Kumar Chaurasiya wrote:
> > On Tue, Apr 21, 2026 at 11:38:08AM +0200, Link Mauve wrote:
> > > Hi Mukesh,
> > > 
> > > This patch doesn’t apply on top of mainline, which tree did you base it
> > > off?
> > > 
> > It was on mainline v7.0 tag.
> 
> Great thanks, they do apply there!
> 
> I needed three more patches for the kernel to build on PPC32, I’ve
> attached them but they are absolutely not patches which could go into
> the kernel (except for the second, enabling asm_experimental_arch).
> 
> What do you think we should do about them?
> 
Regarding the 2nd patch you sent, As the support is experimental as of
now, Let's wait till we get everything stablized, till then we'll use
nightly build for all variants of powerpc. Once we mark it as
maintained, then we can try to push that patch.

Maybe Miguel can comment better on this.

Regarding other patches, I am planning to work on ppc32 once ppc64le
stabilizes.

Regards,
Mukesh

> > On latest there is a confilict. I'll send out a rebased version.
> > 
> > > On Fri, Apr 17, 2026 at 08:52:50PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > > > When building Rust code for powerpc64le with LLVM=1 and -j1, rustc
> > > > encounters an error: "multiple candidates for `rmeta` dependency `core`
> > > > found", with two candidates:
> > > > 1. The host's standard library from the rustup toolchain
> > > > 2. The kernel's custom libcore.rmeta in the rust/ directory
> > > > 
> > > > This occurs because the build system uses `-L$(objtree)/rust` for host
> > > > library builds (proc_macro2, quote, syn), which causes rustc to search
> > > > the rust/ directory. During this search, rustc finds both the kernel's
> > > > custom libcore.rmeta and gains access to the host's standard library,
> > > > creating a conflict.
> > > > 
> > > > The solution is to separate host libraries into a dedicated rust/host/
> > > > subdirectory and use `-L$(objtree)/rust/host` for host builds instead
> > > > of `-L$(objtree)/rust`. This ensures that:
> > > > 
> > > > 1. Host library builds (proc_macro2, quote, syn) only search rust/host/
> > > >    and never encounter the kernel's libcore.rmeta
> > > > 2. Proc macro builds use `-L$(objtree)/rust/host` to find their
> > > >    dependencies
> > > > 
> > > > Special handling is added for rustdoc-pin_init, which is a host build
> > > > (to access the alloc crate) but depends on proc macros from the main
> > > > rust/ directory. It uses explicit `--extern` paths to reference the
> > > > proc macros without adding `-L$(objtree)/rust`, which would reintroduce
> > > > the conflict.
> > > > 
> > > > The rust/host/ directory is added to clean-files to ensure it's removed
> > > > during `make clean`.
> > > > 
> > > > Link: https://github.com/Rust-for-Linux/linux/issues/105
> > > > Link: https://github.com/linuxppc/issues/issues/451
> > > > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > > > ---
> > > >  rust/Makefile | 38 +++++++++++++++++++++-----------------
> > > >  1 file changed, 21 insertions(+), 17 deletions(-)
> > > > 
> > > > diff --git a/rust/Makefile b/rust/Makefile
> > > > index 9801af2e1e02..e234b8a39358 100644
> > > > --- a/rust/Makefile
> > > > +++ b/rust/Makefile
> > > > @@ -3,6 +3,9 @@
> > > >  # Where to place rustdoc generated documentation
> > > >  rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
> > > >  
> > > > +# Clean generated host directory
> > > > +clean-files := host/
> > > > +
> > > >  obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
> > > >  always-$(CONFIG_RUST) += exports_core_generated.h
> > > >  
> > > > @@ -27,7 +30,7 @@ endif
> > > >  
> > > >  obj-$(CONFIG_RUST) += exports.o
> > > >  
> > > > -always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
> > > > +always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
> > > >  
> > > >  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
> > > >  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
> > > > @@ -150,7 +153,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
> > > >  	OBJTREE=$(abspath $(objtree)) \
> > > >  	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=% --remap-path-scope=%, \
> > > >  			$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
> > > 
> > > The issue is here ↑, --remap-path-prefix=% got removed and the two
> > > previous lines got merged into one.
> > > 
> > Yeah will fix this.
> > > > -		$(rustc_target_flags) -L$(objtree)/$(obj) \
> > > > +		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
> > > >  		-Zunstable-options --generate-link-to-definition \
> > > >  		--output $(rustdoc_output) \
> > > >  		--crate-name $(subst rustdoc-,,$@) \
> > > […]
> > > 
> > > Thanks anyway for iterating on this series!  I’ve started writing a DRM
> > > driver based off a previous version. :)
> > > 
> > That's cool. Thanks.
> > 
> > Regards,
> > Mukesh
> > > -- 
> > > Link Mauve
> > > 
> 
> -- 
> Link Mauve

> From 79b614dd7be16a1108e1f0176a7bc235fa163a4e Mon Sep 17 00:00:00 2001
> From: Link Mauve <linkmauve@linkmauve.fr>
> Date: Wed, 8 Apr 2026 14:16:04 +0200
> Subject: [PATCH 1/3] XXX: Workaround sstep.c
> 
> These variables are used only on CONFIG_PPC64, which causes compilation
> to fail on PPC32.
> ---
>  arch/powerpc/lib/sstep.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index ac3ee19531d8..dc129f0cb6a0 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1354,15 +1354,15 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  #ifdef CONFIG_PPC64
>  	unsigned int suffixopcode, prefixtype, prefix_r;
>  #endif
> -	unsigned int opcode, ra, rb, rc, rd, spr, u;
> +	unsigned int opcode, ra, rb/*, rc*/, rd, spr, u;
>  	unsigned long int imm;
>  	unsigned long int val, val2;
>  	unsigned int mb, me, sh;
> -	unsigned int word, suffix;
> +	unsigned int word/*, suffix*/;
>  	long ival;
>  
>  	word = ppc_inst_val(instr);
> -	suffix = ppc_inst_suffix(instr);
> +	//suffix = ppc_inst_suffix(instr);
>  
>  	op->type = COMPUTE;
>  
> @@ -1480,7 +1480,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  	rd = (word >> 21) & 0x1f;
>  	ra = (word >> 16) & 0x1f;
>  	rb = (word >> 11) & 0x1f;
> -	rc = (word >> 6) & 0x1f;
> +	//rc = (word >> 6) & 0x1f;
>  
>  	switch (opcode) {
>  #ifdef __powerpc64__
> -- 
> 2.54.0
> 

> From d4e72fad43175bde99287b8efdece900e5b53444 Mon Sep 17 00:00:00 2001
> From: Link Mauve <linkmauve@linkmauve.fr>
> Date: Fri, 10 Apr 2026 13:05:24 +0200
> Subject: [PATCH 2/3] XXX: Enable asm_experimental_arch for PowerPC asm!()
> 
> This is needed to compile the kernel crate, otherwise this error
> happens:
> 
> error[E0658]: inline assembly is not stable yet on this architecture
>   --> ../rust/kernel/sync/barrier.rs:19:14
>    |
> 19 |     unsafe { core::arch::asm!("") };
>    |              ^^^^^^^^^^^^^^^^^^^^
>    |
>    = note: see issue #93335 <https://github.com/rust-lang/rust/issues/93335> for more information
>    = help: add `#![feature(asm_experimental_arch)]` to the crate attributes to enable
>    = note: this compiler was built on 2026-03-25; consider upgrading it if it is out of date
> 
> error: aborting due to 1 previous error
> 
> For more information about this error, try `rustc --explain E0658`.
> ---
>  rust/kernel/lib.rs     | 3 +++
>  scripts/Makefile.build | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index d93292d47420..92ccd47dc3ee 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -47,6 +47,9 @@
>  // To be determined.
>  #![feature(used_with_arg)]
>  //
> +// Needed for PowerPC inline assembly.
> +#![feature(asm_experimental_arch)]
> +//
>  // `feature(derive_coerce_pointee)` is expected to become stable. Before Rust
>  // 1.84.0, it did not exist, so enable the predecessor features.
>  #![cfg_attr(CONFIG_RUSTC_HAS_COERCE_POINTEE, feature(derive_coerce_pointee))]
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3652b85be545..c7cc21994c5a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -321,7 +321,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  #
>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
>  # the unstable features in use.
> -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_with_arg
> +rust_allowed_features := asm_const,asm_goto,asm_experimental_arch,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_ptr_len,strict_provenance,used_with_arg
>  
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree
> -- 
> 2.54.0
> 

> From 2c0a3ec3da6fa1f0151225c05159f7a812317d32 Mon Sep 17 00:00:00 2001
> From: Link Mauve <linkmauve@linkmauve.fr>
> Date: Fri, 10 Apr 2026 13:51:24 +0200
> Subject: [PATCH 3/3] XXX: Workaround for __udivdi3() and __umoddi3()
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The core crate currently depends on these two functions for i64/u64/
> i128/u128/core::time::Duration formatting, but we shouldn’t use that in
> the kernel so let’s panic if they are ever called.
> ---
>  rust/exports.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/rust/exports.c b/rust/exports.c
> index 587f0e776aba..5f1cdf13882e 100644
> --- a/rust/exports.c
> +++ b/rust/exports.c
> @@ -12,6 +12,7 @@
>   */
>  
>  #include <linux/export.h>
> +#include <linux/panic.h>
>  
>  #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
>  
> @@ -20,6 +21,14 @@
>  #include "exports_bindings_generated.h"
>  #include "exports_kernel_generated.h"
>  
> +void __udivdi3(void) {
> +	panic("__udivdi3() called but shouldn’t be made available on this architecture!\n");
> +}
> +
> +void __umoddi3(void) {
> +	panic("__umoddi3() called but shouldn’t be made available on this architecture!\n");
> +}
> +
>  // For modules using `rust/build_error.rs`.
>  #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
>  EXPORT_SYMBOL_RUST_GPL(rust_build_error);
> -- 
> 2.54.0
> 

