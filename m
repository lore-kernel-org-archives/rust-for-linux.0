Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4CC1DA5F
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 15:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B3B8D7
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 08:53:36 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A490143D;
	Fri, 20 Oct 2023 08:54:17 -0700 (PDT)
Received: from capper-ampere.manchester.arm.com (capper-ampere.manchester.arm.com [10.32.100.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 020413F5A1;
	Fri, 20 Oct 2023 08:53:34 -0700 (PDT)
From: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>,
	boqun.feng@gmail.com,
	andrew@lunn.ch
Subject: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Date: Fri, 20 Oct 2023 16:50:56 +0100
Message-Id: <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit provides the build flags for Rust for AArch64. The core Rust
support already in the kernel does the rest. This enables the PAC ret
and BTI options in the Rust build flags to match the options that are
used when building C.

The Rust samples have been tested with this commit.

Signed-off-by: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Acked-by: Will Deacon <will@kernel.org>
---
 Documentation/rust/arch-support.rst | 1 +
 arch/arm64/Kconfig                  | 1 +
 arch/arm64/Makefile                 | 4 ++++
 rust/Makefile                       | 1 +
 scripts/generate_rust_target.rs     | 4 +++-
 5 files changed, 10 insertions(+), 1 deletion(-)

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
index 2d49aea0ff67..52d75c9483a9 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -41,6 +41,8 @@ KBUILD_CFLAGS	+= -mgeneral-regs-only	\
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)
 
+KBUILD_RUSTFLAGS += --target=aarch64-unknown-none -Ctarget-feature="-neon"
+
 KBUILD_CFLAGS	+= $(call cc-option,-mabi=lp64)
 KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 
@@ -65,7 +67,9 @@ endif
 
 ifeq ($(CONFIG_ARM64_BTI_KERNEL),y)
   KBUILD_CFLAGS += -mbranch-protection=pac-ret+bti
+  KBUILD_RUSTFLAGS += -Zbranch-protection=bti,pac-ret
 else ifeq ($(CONFIG_ARM64_PTR_AUTH_KERNEL),y)
+  KBUILD_RUSTFLAGS += -Zbranch-protection=pac-ret
   ifeq ($(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET),y)
     KBUILD_CFLAGS += -mbranch-protection=pac-ret
   else
diff --git a/rust/Makefile b/rust/Makefile
index 8d75a6ffe951..8ced65c9b905 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -294,6 +294,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
 # All warnings are inhibited since GCC builds are very experimental,
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

