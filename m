Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7986563D7
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Oct 2023 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50731C433C7;
	Sun, 22 Oct 2023 10:55:07 +0000 (UTC)
Date: Sun, 22 Oct 2023 11:55:03 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
	steve.capper@arm.com, Asahi Lina <lina@asahilina.net>,
	boqun.feng@gmail.com, andrew@lunn.ch,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v4 1/2] rust: Refactor the build target to allow the use
 of builtin targets
Message-ID: <ZTT/h5wKL7STeOhC@arm.com>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020155056.3495121-2-Jamie.Cunliffe@arm.com>

On Fri, Oct 20, 2023 at 04:50:55PM +0100, Jamie Cunliffe wrote:
> Eventually we want all architectures to be using the target as defined
> by rustc. However currently some architectures can't do that and are
> using the target.json specification. This puts in place the foundation
> to allow the use of the builtin target definition or a target.json
> specification.
> 
> Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
> ---
>  Makefile          | 1 -
>  arch/x86/Makefile | 1 +
>  rust/Makefile     | 5 ++++-
>  scripts/Makefile  | 4 +++-
>  4 files changed, 8 insertions(+), 3 deletions(-)

Adding the x86 maintainers - no functional change for x86, any objection
to this patch going in via the arm64 tree (part of the two-patch series
enabling Rust for arm64)?

Thanks.

(keeping the rest of the patch below for your reference)

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
> index 87958e864be0..8d75a6ffe951 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -428,8 +428,11 @@ $(obj)/core.o: private skip_clippy = 1
>  $(obj)/core.o: private skip_flags = -Dunreachable_pub
>  $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
>  $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
> -$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs scripts/target.json FORCE
> +$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
>  	$(call if_changed_dep,rustc_library)
> +ifdef CONFIG_X86_64
> +$(obj)/core.o: scripts/target.json
> +endif
>  
>  $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
>  $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
> diff --git a/scripts/Makefile b/scripts/Makefile
> index 576cf64be667..c85d130a4125 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -11,12 +11,14 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
>  hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
>  hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
> -always-$(CONFIG_RUST)					+= target.json
>  
> +ifdef CONFIG_X86_64
> +always-$(CONFIG_RUST)					+= target.json
>  filechk_rust_target = $< < include/config/auto.conf
>  
>  $(obj)/target.json: scripts/generate_rust_target include/config/auto.conf FORCE
>  	$(call filechk,rust_target)
> +endif
>  
>  hostprogs += generate_rust_target
>  generate_rust_target-rust := y
> -- 
> 2.30.2
