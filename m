Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43901C77B7A
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jun 2023 14:59:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236071AbjFFO7B (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jun 2023 10:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238587AbjFFO6l (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jun 2023 10:58:41 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CC60D1981
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jun 2023 07:57:45 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F20A52F4;
        Tue,  6 Jun 2023 07:58:19 -0700 (PDT)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 667863F6C4;
        Tue,  6 Jun 2023 07:57:33 -0700 (PDT)
From:   Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>
Subject: [PATCH v2 1/3] arm64: rust: Enable Rust support for AArch64
Date:   Tue,  6 Jun 2023 15:56:04 +0100
Message-Id: <20230606145606.1153715-2-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
References: <20230606145606.1153715-1-Jamie.Cunliffe@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This commit provides the build flags for Rust for AArch64. The core Rust
support already in the kernel does the rest.

When disabling the neon and fp target features to avoid fp & simd
registers. The use of fp-armv8 will cause a warning from rustc about
an unknown feature that is specified. The target feature is still
passed through to LLVM, this behaviour is documented as part of the
warning. This will be fixed in a future version of the rustc
toolchain.

The Rust samples have been tested with this commit.

Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
---
 Documentation/rust/arch-support.rst | 1 +
 Makefile                            | 1 -
 arch/arm64/Kconfig                  | 1 +
 arch/arm64/Makefile                 | 2 ++
 arch/x86/Makefile                   | 1 +
 rust/Makefile                       | 6 +++++-
 scripts/Makefile                    | 5 +++--
 scripts/generate_rust_target.rs     | 4 +++-
 8 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index b91e9ef4d0c2..9b022af2f649 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,6 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 ============  ================  ==============================================
 Architecture  Level of support  Constraints
 ============  ================  ==============================================
+``arm64``     Maintained        None.
 ``um``        Maintained        ``x86_64`` only.
 ``x86``       Maintained        ``x86_64`` only.
 ============  ================  ==============================================
diff --git a/Makefile b/Makefile
index 9d765ebcccf1..16b1e4de70e3 100644
--- a/Makefile
+++ b/Makefile
@@ -561,7 +561,6 @@ KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -std=gnu11
 KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_RUSTFLAGS := $(rust_common_flags) \
-		    --target=$(objtree)/scripts/target.json \
 		    -Cpanic=abort -Cembed-bitcode=n -Clto=n \
 		    -Cforce-unwind-tables=n -Ccodegen-units=1 \
 		    -Csymbol-mangling-version=v0 \
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b1201d25a8a4..10e9399e8e2f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -217,6 +217,7 @@ config ARM64
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
+	select HAVE_RUST
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 2d49aea0ff67..2ce1555e9fc5 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -41,6 +41,8 @@ KBUILD_CFLAGS	+= -mgeneral-regs-only	\
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)
 
+KBUILD_RUSTFLAGS += --target aarch64-unknown-none -C target-feature="-neon,-fp-armv8"
+
 KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index b39975977c03..79cffe92c916 100644
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
index 7c9d9f11aec5..18d6fdb73fa9 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -262,6 +262,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET_arm64    := aarch64-linux-gnu
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
 # All warnings are inhibited since GCC builds are very experimental,
@@ -393,8 +394,11 @@ $(obj)/core.o: private skip_clippy = 1
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
index 32b6ba722728..633479d02e33 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -9,12 +9,13 @@ hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
 hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
 hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
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

