Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9491262AA
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Oct 2023 13:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E174AB
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Oct 2023 06:16:05 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 501382F4;
	Mon, 16 Oct 2023 06:16:45 -0700 (PDT)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FE6A3F5A1;
	Mon, 16 Oct 2023 06:16:03 -0700 (PDT)
From: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>,
	boqun.feng@gmail.com
Subject: [PATCH v3 1/1] arm64: rust: Enable Rust support for AArch64
Date: Mon, 16 Oct 2023 14:15:23 +0100
Message-Id: <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com>
References: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This commit provides the build flags for Rust for AArch64. The core Rust
support already in the kernel does the rest. This enables the PAC ret
and BTI options in the Rust build flags to match the options that are
used when building C.

The Rust samples have been tested with this commit.

Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
---
 Documentation/rust/arch-support.rst | 1 +
 Makefile                            | 1 -
 arch/arm64/Kconfig                  | 1 +
 arch/arm64/Makefile                 | 4 ++++
 arch/x86/Makefile                   | 1 +
 rust/Makefile                       | 6 +++++-
 scripts/Makefile                    | 5 +++--
 scripts/generate_rust_target.rs     | 4 +++-
 8 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index b91e9ef4d0c2..6bcb3b97c5b6 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,6 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 ============  ================  ==============================================
 Architecture  Level of support  Constraints
 ============  ================  ==============================================
+``arm64``     Maintained        Little Endian only.
 ``um``        Maintained        ``x86_64`` only.
 ``x86``       Maintained        ``x86_64`` only.
 ============  ================  ==============================================
diff --git a/Makefile b/Makefile
index 88ebf6547964..23100f193da3 100644
--- a/Makefile
+++ b/Makefile
@@ -566,7 +566,6 @@ KBUILD_CFLAGS += -fno-strict-aliasing
 
 KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_RUSTFLAGS := $(rust_common_flags) \
-		    --target=$(objtree)/scripts/target.json \
 		    -Cpanic=abort -Cembed-bitcode=n -Clto=n \
 		    -Cforce-unwind-tables=n -Ccodegen-units=1 \
 		    -Csymbol-mangling-version=v0 \
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 78f20e632712..d72618433521 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -227,6 +227,7 @@ config ARM64
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
+	select HAVE_RUST if CPU_LITTLE_ENDIAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 2d49aea0ff67..4562a8173e90 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -41,6 +41,8 @@ KBUILD_CFLAGS	+= -mgeneral-regs-only	\
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)
 
+KBUILD_RUSTFLAGS += --target aarch64-unknown-none -C target-feature="-neon"
+
 KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 
@@ -65,7 +67,9 @@ endif
 
 ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
   KBUILD_CFLAGS += -mbranch-protection=pac-ret+bti
+  KBUILD_RUSTFLAGS += -Z branch-protection=bti,pac-ret
 else ifeq ($(CONFIG_ARM64_PTR_AUTH_KERNEL),y)
+  KBUILD_RUSTFLAGS += -Z branch-protection=pac-ret
   ifeq ($(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET),y)
     KBUILD_CFLAGS += -mbranch-protection=pac-ret
   else
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 5bfe5caaa444..0f339d4abd40 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -68,6 +68,7 @@ export BITS
 #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
 #
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
+KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 
 ifeq ($(CONFIG_X86_KERNEL_IBT),y)
diff --git a/rust/Makefile b/rust/Makefile
index 87958e864be0..b3127501e0e1 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -294,6 +294,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET_arm64    := aarch64-linux-gnu
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
 # All warnings are inhibited since GCC builds are very experimental,
@@ -428,8 +429,11 @@ $(obj)/core.o: private skip_clippy = 1
 $(obj)/core.o: private skip_flags = -Dunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
-$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs scripts/target.json FORCE
+$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
 	$(call if_changed_dep,rustc_library)
+ifeq ($(ARCH),x86_64)
+$(obj)/core.o: scripts/target.json
+endif
 
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
 $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
diff --git a/scripts/Makefile b/scripts/Makefile
index 576cf64be667..0aa78339128c 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -11,12 +11,13 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
 hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
-always-$(CONFIG_RUST)					+= target.json
 
+ifeq ($(ARCH),x86_64)
+always-$(CONFIG_RUST)					+= target.json
 filechk_rust_target = $< < include/config/auto.conf
-
 $(obj)/target.json: scripts/generate_rust_target include/config/auto.conf FORCE
 	$(call filechk,rust_target)
+endif
 
 hostprogs += generate_rust_target
 generate_rust_target-rust := y
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 3c6cbe2b278d..ec5ef35dbe52 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -148,7 +148,9 @@ fn main() {
     let mut ts = TargetSpec::new();
 
     // `llvm-target`s are taken from `scripts/Makefile.clang`.
-    if cfg.has("X86_64") {
+    if cfg.has("ARM64") {
+        panic!("arm64 uses the builtin rustc aarch64-unknown-none target");
+    } else if cfg.has("X86_64") {
         ts.push("arch", "x86_64");
         ts.push(
             "data-layout",
-- 
2.30.2

