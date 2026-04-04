Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C79E222585
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775304996; cv=none; b=OdeWLdEDxgKoPVbqfNo+Ayl93Y1hibsV0xDlM16f95hjUJV0tiCeBn0PNCeFswIHeQfo1nFapJjepazOUVih+YIRExneO0XHS9UsHW4NX4I7y3mbg/QFsynCBOt+h1eTU+qy/fp4GDHg5ZeaXWuGCfT+HO6mC6w5BQxGahqAr8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775304996; c=relaxed/simple;
	bh=V6gRG34tCn/e450RJTTcFmxjzp+9fzaprTt6dAiYIxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qg7tgOGSwUMHF0QD//AU+Kf8yFq50+9XSo+c0hDu0D/KmXWNdZWKb3205Bnk5+ryg14yl/k5aMKt2tQXk9ZzGWaCpn/GbD51lQpYFZFUNGlvYBvbCO8x1R9WkoIb0uB/cotMNf2le9oTBiTgpjde0JO5+w/BZr3heg1a6Kz91X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUpj7klE; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUpj7klE"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d90833cacso1552378a91.2
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 05:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775304994; x=1775909794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRC8yozcX9QSmNG0yIA7nVyNQgWhlHJbCL9t4pSEkxw=;
        b=qUpj7klEWWBbzAB8BpxGtqwxwQpGd9bJw601OI1G+eeLnjr8bSCLsFhZmJk4YP/Mdk
         AI5LHbsVuJ1frAKTVb/fGamL5mKhy16BMWt/a2Y908IL2cVRmblauBKqwaBqY+7nkN7v
         b2J21m7WF+j0zpo41oLfPypmCd4ZOVKwEUDwAp1vpeMeWySyPD1qCL/mHtU50iyTweTt
         UBhxQI1XV+jSfKu/6ccIOKVdYQHZzPvIACBdsutyvi4BPFmHV4jxOC06C3Whk0v5DKMz
         eIiJHXYmcTupUtNnkETR/Znx5jeHfYQkUt3meb8teW+FKe+6j612GJQerk7X/7WCXUpI
         LY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775304994; x=1775909794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QRC8yozcX9QSmNG0yIA7nVyNQgWhlHJbCL9t4pSEkxw=;
        b=YCbEjzxhs/xiDAHhmWlrp4W428SKYVC2A1pIfYhYmfSFSmgVK9fUsEtkXC54/NwSLK
         FhoEfCHg1WiP1E5s1N+TBrhp82YKke7CSBLtVV2/SKL2ifOr2kN3bO3FJdvG5urf+g3W
         A/wdS1c07qekt5HMYgxEBbnljI3Y0J6QdIIja1R39iXvlZAjDMAALFQW3lEVIhZIyjSC
         7xjMvMlaK3eY9nf9RZYWBSv47/SZZ3V9A8kp2Rvgnbc8t8JuBAXJU+Pmo7DSRZK+PXkF
         rSf7MGTo671UpZdorHoTFkmzjzUmXMgsFz/9sbDFks2PdrMCtQO4dx8VlCd0ppzIwdmx
         asEg==
X-Forwarded-Encrypted: i=1; AJvYcCW2lnqUsOlL/8+zIZEa21Ps8N8U95Kl6Yn5TZfo4nJR/QWy/pTiKUcAEtTP9FJoa9F42kIqAkN+oPh3v619RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0T/eaW+3ZTVibMOuyfAvH9rfMViA18slaJzunTmGLhQyRKew/
	UnhFRFcg5pDsAXOgVxNumggeXHcGYcTAxplxgMIhbheLA1z3WbmxiBLDMgR2Ng==
X-Gm-Gg: AeBDiesWG8u39hkT9kwmt1RYrCXT3k0uYfdO6dr6G30oLLWHu0HorJZU+pdYIt10Eec
	l2eeOZlbrP484GHqr8P5lzKUBLjI1LAF8ehS4gPOwolOfcTa4gPppTPaWHNW1jdquzyb/9WpmUX
	854o9TRTcV6bdGMqXqX+0n2yWZ15oxx3rlnYSnpNTqsPbxX1HlNH7LEifMS6APpmZ4pqh/Codj3
	3+W2FJvUQU7av/OxRInBIfyQXtD+SeuwvDmNqysp6za1OV98uDC55b+ko5oTtlHxIdmzcR0wFgD
	EZW+OvSO1+L/TsSheSWXadAeiRbKgui1531aTM9I3lEUoCJ8jDKzJIoDCRuPtQaY7qf+qSvNTx9
	4FrD8SJXX+hj/2PT2xJSJrf0q8zlDeye8MewJVAIa/ERyIBMwDc9X+6g+P08JqVS+8ajCXDMNEx
	WzHZte0YMxGM+A++f9JotMP82iCKlYqNtTZmHBCjfbWL9q/6vNTZc72Gu2QjtmLgHrFzrlv/l4h
	dc=
X-Received: by 2002:a17:90b:2fcb:b0:35d:972c:b3d6 with SMTP id 98e67ed59e1d1-35de68688damr6047728a91.9.1775304994508;
        Sat, 04 Apr 2026 05:16:34 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de500c42fsm2702745a91.0.2026.04.04.05.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:16:33 -0700 (PDT)
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
Subject: [PATCH V9 1/4] rust: Fix "multiple candidates for rmeta dependency core" error
Date: Sat,  4 Apr 2026 17:46:07 +0530
Message-ID: <20260404121610.1956528-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404121610.1956528-1-mkchauras@gmail.com>
References: <20260404121610.1956528-1-mkchauras@gmail.com>
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

Special handling is added for rustdoc-pin_init, which is a host build
(to access the alloc crate) but depends on proc macros from the main
rust/ directory. It uses explicit `--extern` paths with absolute paths
to reference the proc macros without adding `-L$(objtree)/rust`, which
would reintroduce the conflict.

The rust/host/ directory is added to clean-files to ensure it's removed
during `make clean`.

As there is a lot going on, here's a summary of changes:
- Add clean-files := host/ to clean the generated directory
- Change host library targets from lib*.rlib to host/lib*.rlib
- Update cmd_rustc_procmacrolibrary to create host/ directory
- Update cmd_rustc_procmacro to use -L$(objtree)/rust/host
- Update cmd_rustdoc to use -L$(objtree)/rust/host for host builds
- Update rustdoc-pin_init to use explicit --extern paths for proc macros
  as pin-init also needs alloc crate from -L$(objtree)/rust. So the proc
  macros needs an absolute path

Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile | 57 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 9801af2e1e02..5f726a332d9e 100644
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
@@ -193,13 +196,15 @@ rustdoc-proc_macro2: $(src)/proc-macro2/lib.rs rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-quote: private rustdoc_host = yes
-rustdoc-quote: private rustc_target_flags = $(quote-flags)
+rustdoc-quote: private rustc_target_flags = $(quote-flags) \
+    --extern proc_macro2
 rustdoc-quote: private skip_flags = $(quote-skip_flags)
 rustdoc-quote: $(src)/quote/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-syn: private rustdoc_host = yes
-rustdoc-syn: private rustc_target_flags = $(syn-flags)
+rustdoc-syn: private rustc_target_flags = $(syn-flags) \
+    --extern proc_macro2 --extern quote
 rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE
 	+$(call if_changed,rustdoc)
 
@@ -236,7 +241,10 @@ rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
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
@@ -525,48 +533,53 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 
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
+	-L$(objtree)/$(obj)/host --extern proc_macro2
+$(obj)/host/libquote.rlib: $(src)/quote/lib.rs $(obj)/host/libproc_macro2.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
-$(obj)/libsyn.rlib: private skip_clippy = 1
-$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
-$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
+$(obj)/host/libsyn.rlib: private skip_clippy = 1
+$(obj)/host/libsyn.rlib: private rustc_target_flags = $(syn-flags) \
+	-L$(objtree)/$(obj)/host --extern proc_macro2 --extern quote
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

