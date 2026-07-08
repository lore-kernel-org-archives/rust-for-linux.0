Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCD84028E8
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499136; cv=none; b=CHFKocoszucItr7HHnd1VUCquLkhoukfkgWBJhGk4YMObGEda2ETgOHUl49BLVt/5d6T3wjBDG6GD5ykqbuuc8fWz3g3Z3D64YvNC9LwzRRFAc6S4YOypZdTCbqhHNTAcrS2Iw7wdhv0KgAyXxRYmd2C7Ne0BG+Fj5T8vKq5mDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499136; c=relaxed/simple;
	bh=uV4k2f8/fiWG5QwZfIZIbmPLrhF5ER9yMDh4lwxe6QU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4Ek7ZCbu9b6vsCT7zRZhpCM+CLnKxljVwzHvc50VduXEEZRjQdd6JpzDffOQ1OYdrwZBNN8RUFceZfCxFEsU7RcHcXx8EawHzLUjpOVDFBYekKThDNccWYdNgQwpTAYBCvL16AHXVgqi4DUv5oGQr8623059niTPECDp3FYcRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p511J/g+; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p511J/g+"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso254704a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499124; x=1784103924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kqHcDJLpqtPG3b1h3n4CGDV6Uky+owIJPUMSqpt6iVU=;
        b=p511J/g+sLyuq1LlalUb/Fe256ZsWxOPxCOPCgn9hQh/2pn5ScO8rQtzezqLDfdplU
         Ph7/szVkEFw+S/oBaRq66Erut1tchmIIalayxN9DEMTS2/M1Az2sPc1+GVM8jLDYHAQ9
         ViyTd5TNDi5Lt5SpY4F9scgcL3/dHyZPcLg9R3sKSvHoryxRN302AheEkLr9T1TjlnoZ
         qt5J3trhds9V/w0r+LEnmHjv6Ak5Z6hM4iSRclBp869OHXsHVLkiyKpNq4Sdj9oqd809
         Fdt3VvmD/GSEmKp7C/xCe84F0TfYA4eJKuj0wjkNwW/Z3uuN6dSCdhcKwB9zvHXtLT4M
         1x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499124; x=1784103924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kqHcDJLpqtPG3b1h3n4CGDV6Uky+owIJPUMSqpt6iVU=;
        b=cXR573T6vDFB66J520MSNvQa4AVTbPfQfiLIYY461AM2Uw0lbSLlG7+DXSecvlKvFf
         OCZNNUhgiMnLQoLSL3EfY5qln93uCzreN2Qk13adtuEsVqKXxik8KwL0cED+ejepi9k/
         RzEL8KugyWRCJ3BdT8bNSbf3BHVxRO/YeerRvJwMe6sS0fYf8bsw7HEPlepPKCop4kp/
         tCgSfhGMjeTrjP+yNZND0Xp+We9EUurXMnVFIihFNWpoAOoJCtGbM6L1KssFTPF4kswl
         twl2PPwDchII0EY2flv1D91TSJ7+CtBvztlie6EFMaHYPPlC6+iIvDerIEJ3O79IiH6z
         njxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQAvdASIvVhlNERqwsGhAoAoIr+oGHiKdibj1EznJb5YDOATOvVhO+r3a72xBZ0L5EGcsBkdUguOU0E5gXxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYOTMf2lXms+an62QSqFRyF1pzC8drDz9BicdnDs1S/lXQXZPE
	+1yN/ExSklD908cBW6iFAkcFZXeiUPp1BQ3lUy0W755vVAvlpizCAPzS
X-Gm-Gg: AfdE7cnxthQ98quA+P5JaOFAxZNcsKxCcAJU1ckxdo6P8R47+jNEt13xGUJKRRZh77l
	B9+f5vAg5XlUycuU+PunewjIfX9eNnfr8SpEtJdCdaDR6Be5y7bG3oCP6Qd/yAn6Uf88afoo3e1
	6bhYHZJTdF20DT5zcEWY7PCNNABL+XHfIrdYK9XvvKCXFo3VfQrz30wKdW9/USYwyhUWg5CkcMt
	5X+9b5ttviOm6/3px2TkJloIKZ1Di0lE5eaWy5ckx0bb4u3a/Mbs6sb+wArmgfVjYRhOTRmhjC+
	VNSkm5X3V8TGOUv46og+aYznLKl1E9CiNBXXYYfuSkyex/r7JSflINyG1zrhDBjs4UrnUyC/vmM
	Rjrb0fAMnbuASqxkP5E7f4vXC8kHijlwnEEcWg6GOKXvtNzNYHwTOd5EwlZPzNAa3RWbCAsgyEm
	C9g+CHllB0RU0l7MXBnaM0FjxYGELakzaUFh9H5GVdtAPoKCCZL4b2TPQB/Q9/SV/ReA==
X-Received: by 2002:a05:6a20:5482:b0:3b3:be1f:c89b with SMTP id adf61e73a8af0-3c0bcff89edmr1826587637.22.1783499123695;
        Wed, 08 Jul 2026 01:25:23 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:23 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 1/7] rust: Fix "multiple candidates for rmeta dependency core" error
Date: Wed,  8 Jul 2026 13:54:48 +0530
Message-ID: <20260708082454.1254320-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building Rust code for powerpc64le with LLVM=1 and -j1, rustc
encounters an error: "multiple candidates for `rmeta` dependency `core`
found", with two candidates:
1. The host's standard library from the rustup toolchain
2. The kernel's custom libcore.rmeta in the rust/ directory

This occurs because the build system uses `-L$(objtree)/rust` for host
library builds (proc_macro2, quote, syn), which causes rustc to search
the rust/ directory. During this search, rustc finds both the kernel's
custom libcore.rmeta and gains access to the host's standard library,
creating a conflict.

The solution is to separate host libraries into a dedicated rust/host/
subdirectory and use `-L$(objtree)/rust/host` for host builds instead
of `-L$(objtree)/rust`. This ensures that:

1. Host library builds (proc_macro2, quote, syn) only search rust/host/
   and never encounter the kernel's libcore.rmeta
2. Proc macro builds use `-L$(objtree)/rust/host` to find their
   dependencies

Special handling is added for rustdoc-pin_init, which is a host build
(to access the alloc crate) but depends on proc macros from the main
rust/ directory. It uses explicit `--extern` paths to reference the
proc macros without adding `-L$(objtree)/rust`, which would reintroduce
the conflict.

The rust/host/ directory is added to clean-files to ensure it's removed
during `make clean`.

Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile | 42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index a870d1616c71..17b2f329c13d 100644
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
 
@@ -33,7 +36,7 @@ endif
 
 obj-$(CONFIG_RUST) += exports.o
 
-always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
+always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
@@ -163,7 +166,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-scope=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
-		$(rustc_target_flags) -L$(objtree)/$(obj) \
+		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
 		--crate-name $(subst rustdoc-,,$@) \
@@ -261,6 +264,7 @@ rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
 
 rustdoc-pin_init: private rustdoc_host = yes
 rustdoc-pin_init: private rustc_target_flags = $(pin_init-flags) \
+    --extern pin_init_internal=$(objtree)/$(obj)/$(libpin_init_internal_name) \
     --extern alloc --cfg feature=\"alloc\"
 rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
     rustdoc-macros FORCE
@@ -572,23 +576,23 @@ quiet_cmd_rustc_procmacrolibrary = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_Q
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --crate-type rlib -O \
-		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
+		--out-dir $(objtree)/$(obj)/host -L$(objtree)/$(obj)/host \
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
+$(obj)/host/libquote.rlib: private rustc_target_flags = $(quote-flags)
+$(obj)/host/libquote.rlib: $(src)/quote/lib.rs $(obj)/host/libproc_macro2.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
-$(obj)/libsyn.rlib: private skip_clippy = 1
-$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
-$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
+$(obj)/host/libsyn.rlib: private skip_clippy = 1
+$(obj)/host/libsyn.rlib: private rustc_target_flags = $(syn-flags)
+$(obj)/host/libsyn.rlib: $(src)/syn/lib.rs $(obj)/host/libquote.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
 quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) P $@
@@ -598,26 +602,26 @@ quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET))
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-		--crate-type proc-macro -L$(objtree)/$(obj) \
+		--crate-type proc-macro -L$(objtree)/$(obj)/host \
 		--crate-name $(patsubst lib%.$(procmacro-extension),%,$(notdir $@)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
 $(obj)/$(libzerocopy_derive_name): private skip_clippy = 1
 $(obj)/$(libzerocopy_derive_name): private rustc_target_flags = $(zerocopy_derive-flags)
-$(obj)/$(libzerocopy_derive_name): $(src)/zerocopy-derive/lib.rs $(obj)/libproc_macro2.rlib \
-    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+$(obj)/$(libzerocopy_derive_name): $(src)/zerocopy-derive/lib.rs $(obj)/host/libproc_macro2.rlib \
+    $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
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
2.55.0

