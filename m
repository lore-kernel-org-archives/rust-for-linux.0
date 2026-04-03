Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C202374730
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228014; cv=none; b=DCiNAP5gag4EDoln9PcdSqNRAeq8b0XwD+AKnBvUsvdcyiJ6cSHcVV7KIr67blsOnV6rz+8FA/vLxxclPEB+Nj7luhOk/M/xI9+Bs5qSK7856fBFXS1TKYCcfAKdeWbjmfrYQOQMLLZ+usnnURCmySn/EEVP5FoAS9C0y287iOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228014; c=relaxed/simple;
	bh=s41PsyrgmivcxsEasV3F2vMv28LGN20R8nGi2RgZncQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LzcTaA2iMpVdqyGwOOKi4dOVufBQ3I24nV+6vAj2/k+P5q9tGjFPrPZ1ukZC8aojJEobY7cUGSYVpT6bPXFqPtu8sikI0L14ArSNFmlZnXI6D8YF27/lb/f0+nlqLcw4Cty9yHkpM6Q8r5LgV7C/Qndw4Wk9cjOiq/A0lDgU8Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+Y9/fF2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+Y9/fF2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82d03827316so600688b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228013; x=1775832813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUTSB1GcQ+ZgkTavCnlkXCyNO/5I/d2MoyKGgMKrfsE=;
        b=p+Y9/fF2HU/q9BM6BbAVdapW7m1xvPLhcfdI7s0Jyu8nnc9WTg15KQg0XTz6AcUEwY
         S4HvDQGIJd61RGDC4tPJJD5X/tJv7jyih9BKewfeDyEmJqa+fFfG7L+DmUyci6Be3E+8
         FYO/3303Kb62RAvjy2xhvnSzkTrVUyGb28c30wkM5Gwckl72ux0xVJ1tXLFZh/hhk/BE
         h7fvxPPbXfGz39inXdyg34pqUIuYpLu5WqJq8l3ExxLamI0Es2U+DH9tl3YByPgc+42s
         ufK7eab9lViUwX8lXC8zE9fVznZVptu812LD5XH6fu7xffru2oBuc2XdvQz/kP/W5L6w
         exZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228013; x=1775832813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fUTSB1GcQ+ZgkTavCnlkXCyNO/5I/d2MoyKGgMKrfsE=;
        b=Wu0KHgG2gs49TIVzvdpJ9DE/2pN0M+KySci8AGqIPyZ/9m0Evoi0kiBMdO2jstSUkX
         XWBCiftW1qgyeqtwEPkggB/8KqSskI5qxDKjxOw0YXfgS3n96jDfAOA9m594T1u6ZY3A
         ELy9JfeUO6ZShWdqa9PXKBzCKIbKWuZJO0Jtv+bfx3pwsKEgwV8tySXQ1B6g4M1aSdt2
         kElwcFrafXTm9m5v+uAsl/LiReeJJNTQMOQTTUzWKHBbvx4BQfIrJckWxYNQ2nGNTxgU
         oOCiSIWyBifAoQNtSwRcKZUt/86vxyE3uLye0IlgeYNLM6xvWGmFmE0JxkomuoSkCKvB
         05bw==
X-Forwarded-Encrypted: i=1; AJvYcCV29wyDRJIH4VoAbtt0QaDaZurMUXSQdkC6D1pE3nFxVK26L7Y4DkVt5KxFlvLcN+k6JbaVNNTb1VD6uQjvrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMKgX5L409Bcah/jVE9eSbbaKi+1Mztu8rTZZ+LyH66j5a/nga
	UU795dcf1MfWKU3BsS3dBAwaat3N5wP3t6S8kXTC6kxhFeQE93+RDm/K
X-Gm-Gg: AeBDiesumcrkjmbI6Xdb/cOYaHLnBTIerZ0mG72ZHd8iJHtQqyVR5B0rgKjALIsSmOF
	NBmCEkdzYU3vYCo08hV9k1+uHnu5eeRjPKgrtpGbEYY8lC80zEX8IgfsrZRw6sizLNydnCMpjwa
	PHv+H1ArGNTdQ/dxEFE/xc1u8bVMf/FHKa+tUfwxogkLiWYmTmBgR/VF8Ws3g94bHTV+slkviUO
	RMaYOKz1pvhDiHv470ETTnjrj/ySD3WDLiVcPbMJ00cuimXXiBxBzzqZZaqp8EgsXGWmVms+Job
	eZv71uBdBpQt86G3D6UmFkCMnZZWNO80hUgpwDPX64fqtjkGlMFZzWyVb24ZTZlMDHW7FS2c1rS
	Irm88XOcyeESBzXlKcofSpCLTaBag+MgYzC4RVm+ccwqlerTpC2pbbYXZ3Z4y5DFXU7Jr+w3dPO
	BqElMt+fdYmxcTY8jub+gr5uTy9ECVG4jejT9RLih4JQILvfnxb7yj0AL1qB9yniTRUIAiF9/L3
	qQ7ehUR5lkKrg==
X-Received: by 2002:a05:6a00:3699:b0:81f:544b:3998 with SMTP id d2e1a72fcca58-82d0dd20f4amr2711320b3a.26.1775228012689;
        Fri, 03 Apr 2026 07:53:32 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm6301682b3a.61.2026.04.03.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:53:32 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V8 1/4] rust: Fix "multiple candidates for rmeta dependency core" error
Date: Fri,  3 Apr 2026 20:23:05 +0530
Message-ID: <20260403145308.1042622-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403145308.1042622-1-mkchauras@gmail.com>
References: <20260403145308.1042622-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building Rust code with LLVM=1 with -j1, rustc was encountering
an error:
"multiple candidates for `rmeta` dependency `core` found", with two
candidates:
1. The host's standard library from the rustup toolchain
2. The kernel's custom libcore.rmeta in the rust/ directory

This occurred because the build system was using `-L$(objtree)/rust`
for host library builds (proc_macro2, quote, syn), which caused rustc
to search the rust/ directory. During this search, rustc would find
both the kernel's custom libcore.rmeta and gain access to the host's
standard library, creating a conflict.

The solution is to separate host libraries into a dedicated rust/host/
subdirectory and use `-L$(objtree)/rust/host` for host builds instead
of `-L$(objtree)/rust`. This ensures that:

1. Host library builds (proc_macro2, quote, syn) only search rust/host/
   and never encounter the kernel's libcore.rmeta
2. Proc macro builds use `-L$(objtree)/rust/host` to find their
   dependencies
3. Test builds use `-L$(objtree)/rust/test` for their dependencies
4. Target builds continue to use `-L$(objtree)/rust` as before

Special handling is added for rustdoc-pin_init, which is a host build
(to access the alloc crate) but depends on proc macros from the main
rust/ directory. It uses explicit `--extern` paths with absolute paths
to reference the proc macros without adding `-L$(objtree)/rust`, which
would reintroduce the conflict.

The rust/host/ directory is added to clean-files to ensure it's removed
during `make clean`.

Changes:
- Add clean-files := host/ to clean the generated directory
- Change host library targets from lib*.rlib to host/lib*.rlib
- Update cmd_rustc_procmacrolibrary to create host/ directory
- Update cmd_rustc_procmacro to use -L$(objtree)/rust/host
- Update cmd_rustdoc to use -L$(objtree)/rust/host for host builds
- Update cmd_rustc_test_library to use -L$(objtree)/rust/test
- Update rustdoc-pin_init to use explicit --extern paths for proc macros

Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile | 63 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 9801af2e1e02..762bddc868e4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -3,6 +3,9 @@
 # Where to place rustdoc generated documentation
 rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 
+# Clean generated host directory
+clean-files := host/
+
 obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
 always-$(CONFIG_RUST) += exports_core_generated.h
 
@@ -27,7 +30,7 @@ endif
 
 obj-$(CONFIG_RUST) += exports.o
 
-always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
+always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
@@ -150,7 +153,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=% --remap-path-scope=%, \
 			$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
-		$(rustc_target_flags) -L$(objtree)/$(obj) \
+		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
 		--crate-name $(subst rustdoc-,,$@) \
@@ -193,13 +196,16 @@ rustdoc-proc_macro2: $(src)/proc-macro2/lib.rs rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-quote: private rustdoc_host = yes
-rustdoc-quote: private rustc_target_flags = $(quote-flags)
+rustdoc-quote: private rustc_target_flags = $(quote-flags) \
+    --extern proc_macro2=$(abspath $(objtree)/$(obj)/host/libproc_macro2.rlib)
 rustdoc-quote: private skip_flags = $(quote-skip_flags)
 rustdoc-quote: $(src)/quote/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-syn: private rustdoc_host = yes
-rustdoc-syn: private rustc_target_flags = $(syn-flags)
+rustdoc-syn: private rustc_target_flags = $(syn-flags) \
+    --extern proc_macro2=$(abspath $(objtree)/$(obj)/host/libproc_macro2.rlib) \
+    --extern quote=$(abspath $(objtree)/$(obj)/host/libquote.rlib)
 rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE
 	+$(call if_changed,rustdoc)
 
@@ -236,7 +242,10 @@ rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
 	+$(call if_changed,rustdoc)
 
 rustdoc-pin_init: private rustdoc_host = yes
-rustdoc-pin_init: private rustc_target_flags = $(pin_init-flags) \
+rustdoc-pin_init: private rustc_target_flags = \
+    --extern pin_init_internal=$(abspath $(objtree)/$(obj)/$(libpin_init_internal_name)) \
+    --extern macros=$(abspath $(objtree)/$(obj)/$(libmacros_name)) \
+    $(call cfgs-to-flags,$(pin_init-cfgs)) \
     --extern alloc --cfg feature=\"alloc\"
 rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
     rustdoc-macros FORCE
@@ -369,7 +378,9 @@ rusttest: rusttest-macros
 
 rusttest-macros: private rustc_target_flags = --extern proc_macro \
     --extern macros --extern kernel --extern pin_init \
-    --extern proc_macro2 --extern quote --extern syn
+    --extern proc_macro2=$(abspath $(objtree)/$(obj)/test/libproc_macro2.rlib) \
+    --extern quote=$(abspath $(objtree)/$(obj)/test/libquote.rlib) \
+    --extern syn=$(abspath $(objtree)/$(obj)/test/libsyn.rlib)
 rusttest-macros: private rustdoc_test_target_flags = --crate-type proc-macro
 rusttest-macros: $(src)/macros/lib.rs \
     rusttestlib-macros rusttestlib-kernel rusttestlib-pin_init FORCE
@@ -525,48 +536,54 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 
 quiet_cmd_rustc_procmacrolibrary = $(RUSTC_OR_CLIPPY_QUIET) PL $@
       cmd_rustc_procmacrolibrary = \
+	mkdir -p $(dir $@); \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --crate-type rlib -O \
-		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
 		--crate-name $(patsubst lib%.rlib,%,$(notdir $@)) $<
 
-$(obj)/libproc_macro2.rlib: private skip_clippy = 1
-$(obj)/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
-$(obj)/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
+$(obj)/host/libproc_macro2.rlib: private skip_clippy = 1
+$(obj)/host/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
+$(obj)/host/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
-$(obj)/libquote.rlib: private skip_clippy = 1
-$(obj)/libquote.rlib: private skip_flags = $(quote-skip_flags)
-$(obj)/libquote.rlib: private rustc_target_flags = $(quote-flags)
-$(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FORCE
+$(obj)/host/libquote.rlib: private skip_clippy = 1
+$(obj)/host/libquote.rlib: private skip_flags = $(quote-skip_flags)
+$(obj)/host/libquote.rlib: private rustc_target_flags = $(quote-flags) \
+	--extern proc_macro2=$(abspath $(objtree)/$(obj)/host/libproc_macro2.rlib)
+$(obj)/host/libquote.rlib: $(src)/quote/lib.rs $(obj)/host/libproc_macro2.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
-$(obj)/libsyn.rlib: private skip_clippy = 1
-$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
-$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
+$(obj)/host/libsyn.rlib: private skip_clippy = 1
+$(obj)/host/libsyn.rlib: private rustc_target_flags = $(syn-flags) \
+	--extern proc_macro2=$(abspath $(objtree)/$(obj)/host/libproc_macro2.rlib) \
+	--extern quote=$(abspath $(objtree)/$(obj)/host/libquote.rlib)
+$(obj)/host/libsyn.rlib: $(src)/syn/lib.rs $(obj)/host/libquote.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
-	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
+	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-		--crate-type proc-macro -L$(objtree)/$(obj) \
+		--crate-type proc-macro \
+		-L$(objtree)/$(obj)/host \
 		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
-		@$(objtree)/include/generated/rustc_cfg $<
+		@$(objtree)/include/generated/rustc_cfg \
+		$(rustc_target_flags) \
+		$<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
 $(obj)/$(libmacros_name): private rustc_target_flags = \
     --extern proc_macro2 --extern quote --extern syn
-$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
-    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/host/libproc_macro2.rlib \
+    $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = $(pin_init_internal-flags)
 $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
-    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+    $(obj)/host/libproc_macro2.rlib $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 # `rustc` requires `-Zunstable-options` to use custom target specifications
-- 
2.53.0

