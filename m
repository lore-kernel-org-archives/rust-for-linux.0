Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FC4C8300C
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238531AbjFIGya (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbjFIGyQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:54:16 -0400
Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782A52D74
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=15535; q=dns/txt;
  s=iport; t=1686293653; x=1687503253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=668G+2AxS7wXdOBd3XmGTEic2gJ5S79PkH8dCJOXKL4=;
  b=KXSidUZexr0pgXwrTvdGGnLQiGanMBzMBoxndIIo7OJpc0/+/LPdce1R
   adlfdI6jZbGIKkR7JK2jO89iD8Fy4jba/TDMsIIPd0dGQlyuqqr10ZcQc
   rrBERcfbznwBRZRHEfjyDy7eQZlskeigTTX9PfwEVkLrESJx4HDnv/8bV
   k=;
X-IPAS-Result: =?us-ascii?q?A0AMAAAixoJklxbLJq1aHAEBAQEBAQcBARIBAQQEAQGBe?=
 =?us-ascii?q?wcBAQsBgyNVLhJHjG5fiFIDnWuBfg8BAQENAQExEwQBAYUGAoV1JjQJDgECB?=
 =?us-ascii?q?AEBAQEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBAQEBAQEBATcFEDWFOwYnDYYFA?=
 =?us-ascii?q?wMyAUYQIDFXGYJ+AYJcA60ZgiyBAZ9ggWiBQgGMFYVKQoFJRIEVgTyCLYsGB?=
 =?us-ascii?q?IkdghEOC4JogzaLcoEpb4EeOWl/AgkCEWeBCghcgXNAAg1UCwtjgR2CVQICE?=
 =?us-ascii?q?TwUUmIZHQMHBAKBBRAvBwQyKAYJGC8nBlMHFxYkCRMVQgSDWQqBEEAVDhGCX?=
 =?us-ascii?q?CoCPW8DCQMHBUlAAwsYDUgRLDUUHwZDgQcXY4F8IAQknkaCWS0HgQ8pIjBPQ?=
 =?us-ascii?q?V2iAoIVoCqEEot8lQQaM4VXo34ujlqJDqNdhC8CBAYFAhaBYzqBWzMaCBsVg?=
 =?us-ascii?q?yIJSRkPhQWJNB6CX4ZDMFyJC0ExOwIHCwEBAwmLRgEB?=
IronPort-Data: A9a23:+mxcjKMGuqFt/fbvrR3el8FynXyQoLVcMsEvi/4bfWQNrUon3zJVm
 DceCGqHO/6PZ2T0et8jYN6080tSvZDQn4JhSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgGPykUIYoBggrHVU/EHl52Uo48wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjhQDguE/M9lHU114pxiDsshw9
 Yh0sbXlHG/FPoWU8AgcexBVCWR1OrdLveKBKnmkusvVxErDG5fu66wxVwdtbctCor0xWzsmG
 f8wcFjhajiKguO93bayUcFnh98oK4/gO4Z3VnRInWyBXad8EPgvRY3Uyc5/xBE8mfxzR+7sb
 pYAVB9TQSnpNkgn1lA/UcJiw7jAamPEWzpapV6cjak6+W7eyEp2yreFGMDIYcDPS8JP20KZo
 H/W13r2DwtcN9GFzzeBtHW2iYfycTjTUY8IUbyg8eR2xVua2ioYCQYdUh2wpvzRZlOCt8x3E
 31EvS4pjvMI7mOHY9PQRxyF/UeAl0tJMzZPKNES5AaIw6vSxg+WAGkYUzJMAODKUudrFVTGM
 XfUw7vU6SxTXK69FCjGqObExd+mEXVPdDVTDcMRZVFdi+QPtr3fmTrpar6P+oacitj4Azy4+
 CyDoEDSbJ1K1pdWv0lX1X7DjiyropHPQmYICuTrsoCNs1kRiG2NPtLABb3nARBod9/xor6p5
 iJspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiDzI9oMsWkldBo4aK7onAMFh
 meN4mu9A7cObBOXgVNfOOpd9uxzl/G7TIS5PhwqRoMXMsMZmPC7ENFGPB7MgD+FfLkEmqAkM
 pDTate3EXsfEsxaIMmeGY8gPUsQ7nlmnwv7HMmjpzz+iOr2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0FC7SjOnSJqNFMRb3IRFBiba3LRwVsXrbrCmJb9KsJUpc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:nffctqiQYF5VN98vYxSlHF9pG3BQXvUji2hC6mlwRA09TyVXra
 yTdZMgpHvJYVkqNk3I9errBEDEewK+yXcX2/h1AV7dZmjbUQKTRekI0WKh+UyDJ8SUzIFgPM
 lbHpRWOZnZEUV6gcHm4AOxDtoshOWc/LvAv5a4854Ud2FXg2UK1XYBNu5deXcGIjV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AAdrXT2oEGjaswMY2+tn6ranmUfgUIjrZy1SLGVW?=
 =?us-ascii?q?XJUtjZaWUdAKp/Ioxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ABo5/EQ0koyv7sxn+aMx3hvyr4TUj/Yi/L1grnYo?=
 =?us-ascii?q?6hpOcByUsIgq4sBmKa9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="8508929"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:47 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDS055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:46 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 34/80] rust: Kbuild: enable `proc-macro2`, `quote`, `syn`, `serde` and `serde_derive`
Date:   Fri,  9 Jun 2023 09:30:32 +0300
Message-Id: <20230609063118.24852-35-amiculas@cisco.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609063118.24852-1-amiculas@cisco.com>
References: <20230609063118.24852-1-amiculas@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-User: amiculas
X-Outbound-SMTP-Client: 10.61.198.236, [10.61.198.236]
X-Outbound-Node: aer-core-5.cisco.com
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

With all the new files in place from the new crates, this patch
adds support for them in the build system.

Note that, if we decide to add third-party crates support to upstream, we would
probably want to do it in a different way. But this is useful for playing around
with these crates, experimenting, etc.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile               |  12 ++-
 rust/.gitignore        |   1 +
 rust/Makefile          | 194 ++++++++++++++++++++++++++++++++++++-----
 scripts/Makefile.build |   2 +-
 4 files changed, 185 insertions(+), 24 deletions(-)

diff --git a/Makefile b/Makefile
index 836643eaefee..3b7f37977f04 100644
--- a/Makefile
+++ b/Makefile
@@ -1606,7 +1606,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \
 		  *.spec rpmbuild \
-		  rust/libmacros.so
+		  rust/libmacros.so rust/libserde_derive.so
 
 # clean - Delete most, but leave enough to build external modules
 #
@@ -1848,8 +1848,18 @@ PHONY += rustfmt rustfmtcheck
 rustfmt:
 	$(Q)find $(abs_srctree) -type f -name '*.rs' \
 		-o -path $(abs_srctree)/rust/alloc -prune \
+		-o -path $(abs_srctree)/rust/proc-macro2 -prune \
+		-o -path $(abs_srctree)/rust/quote -prune \
+		-o -path $(abs_srctree)/rust/syn -prune \
+		-o -path $(abs_srctree)/rust/serde -prune \
+		-o -path $(abs_srctree)/rust/serde_derive -prune \
 		-o -path $(abs_objtree)/rust/test -prune \
 		| grep -Fv $(abs_srctree)/rust/alloc \
+		| grep -Fv $(abs_srctree)/rust/proc-macro2 \
+		| grep -Fv $(abs_srctree)/rust/quote \
+		| grep -Fv $(abs_srctree)/rust/syn \
+		| grep -Fv $(abs_srctree)/rust/serde \
+		| grep -Fv $(abs_srctree)/rust/serde_derive \
 		| grep -Fv $(abs_objtree)/rust/test \
 		| grep -Fv generated \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
diff --git a/rust/.gitignore b/rust/.gitignore
index 21552992b401..f6c521160123 100644
--- a/rust/.gitignore
+++ b/rust/.gitignore
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+*.rlib
 bindings_generated.rs
 bindings_helpers_generated.rs
 uapi_generated.rs
diff --git a/rust/Makefile b/rust/Makefile
index 7c9d9f11aec5..37952e93ff06 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -8,11 +8,12 @@ always-$(CONFIG_RUST) += exports_core_generated.h
 obj-$(CONFIG_RUST) += helpers.o
 CFLAGS_REMOVE_helpers.o = -Wmissing-prototypes -Wmissing-declarations
 
-always-$(CONFIG_RUST) += libmacros.so
-no-clean-files += libmacros.so
+always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
+always-$(CONFIG_RUST) += libserde_derive.so libmacros.so
+no-clean-files += libserde_derive.so libmacros.so
 
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
-obj-$(CONFIG_RUST) += alloc.o bindings.o kernel.o
+obj-$(CONFIG_RUST) += alloc.o bindings.o serde.o kernel.o
 always-$(CONFIG_RUST) += exports_alloc_generated.h exports_bindings_generated.h \
     exports_kernel_generated.h
 
@@ -60,11 +61,73 @@ alloc-cfgs = \
     --cfg no_sync \
     --cfg no_thin
 
+proc_macro2-skip_flags := \
+    --edition=2021 \
+    -Drust_2018_idioms \
+    -Dunreachable_pub \
+    -Dunsafe_op_in_unsafe_fn
+
+proc_macro2-flags := \
+    --edition=2018 \
+    -Amissing_docs \
+    --cfg 'feature="proc-macro"' \
+    --cfg use_proc_macro \
+    --cfg wrap_proc_macro
+
+quote-skip_flags := \
+    --edition=2021 \
+    -Drust_2018_idioms
+
+quote-flags := \
+    --edition=2018 \
+    -Amissing_docs \
+    --extern proc_macro2 \
+    --cfg 'feature="proc-macro"'
+
+syn-skip_flags := \
+    --edition=2021 \
+    -Drust_2018_idioms \
+    -Dunreachable_pub \
+    -Dunsafe_op_in_unsafe_fn
+
+syn-flags := \
+    --edition=2018 \
+    -Amissing_docs \
+    --cfg 'feature="clone-impls"' \
+    --cfg 'feature="derive"' \
+    --cfg 'feature="extra-traits"' \
+    --cfg 'feature="fold"' \
+    --cfg 'feature="full"' \
+    --cfg 'feature="parsing"' \
+    --cfg 'feature="printing"' \
+    --cfg 'feature="proc-macro"' \
+    --cfg 'feature="quote"' \
+    --cfg 'feature="visit"' \
+    --cfg 'feature="visit-mut"'
+
+serde_derive-skip_flags := \
+    --edition=2021 \
+    -Drust_2018_idioms \
+    -Dunreachable_pub
+
+serde_derive-flags := \
+    -Amissing_docs
+
+serde-skip_flags := \
+    --edition=2021 \
+    -Drust_2018_idioms \
+    -Dunreachable_pub
+
+serde-flags := \
+    -Amissing_docs \
+    --cfg no_fp_fmt_parse
+
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTDOC) $(if $(rustdoc_host),$(rust_common_flags),$(rust_flags)) \
+	$(RUSTDOC) $(filter-out $(skip_flags),$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
 		$(rustc_target_flags) -L$(objtree)/$(obj) \
+		--extern quote --extern syn \
 		--output $(objtree)/$(obj)/doc \
 		--crate-name $(subst rustdoc-,,$@) \
 		@$(objtree)/include/generated/rustc_cfg $<
@@ -81,7 +144,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 # command-like flags to solve the issue. Meanwhile, we use the non-custom case
 # and then retouch the generated files.
 rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
-    rustdoc-alloc rustdoc-kernel
+    rustdoc-alloc rustdoc-kernel rustdoc-serde rustdoc-serde_derive
 	$(Q)cp $(srctree)/Documentation/images/logo.svg $(objtree)/$(obj)/doc
 	$(Q)cp $(srctree)/Documentation/images/COPYING-logo $(objtree)/$(obj)/doc
 	$(Q)find $(objtree)/$(obj)/doc -name '*.html' -type f -print0 | xargs -0 sed -Ei \
@@ -116,17 +179,31 @@ rustdoc-alloc: $(src)/alloc/lib.rs rustdoc-core rustdoc-compiler_builtins FORCE
 
 rustdoc-kernel: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros=$(objtree)/$(obj)/libmacros.so \
-    --extern bindings --extern uapi
+    --extern bindings --extern uapi --extern serde --extern serde_derive
 rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-macros \
-    rustdoc-compiler_builtins rustdoc-alloc $(obj)/libmacros.so \
-    $(obj)/bindings.o FORCE
+    rustdoc-compiler_builtins rustdoc-alloc rustdoc-serde $(obj)/libmacros.so \
+    $(obj)/bindings.o $(obj)/libserde_derive.so FORCE
+	$(call if_changed,rustdoc)
+
+rustdoc-serde_derive: private rustdoc_host = yes
+rustdoc-serde_derive: private skip_flags = $(serde_derive-skip_flags)
+rustdoc-serde_derive: private rustc_target_flags = --crate-type proc-macro \
+    --extern proc_macro -Amissing_docs
+rustdoc-serde_derive: $(src)/serde_derive/lib.rs FORCE
+	$(call if_changed,rustdoc)
+
+rustdoc-serde: private skip_flags = $(serde-skip_flags)
+rustdoc-serde: private rustc_target_flags = --extern alloc --extern serde \
+    -Arustdoc::broken_intra_doc_links
+rustdoc-serde: $(src)/serde/lib.rs rustdoc-core FORCE
 	$(call if_changed,rustdoc)
 
 quiet_cmd_rustc_test_library = RUSTC TL $<
       cmd_rustc_test_library = \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTC) $(rust_common_flags) \
-		@$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
+	$(RUSTC) \
+		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
+		@$(objtree)/include/generated/rustc_cfg \
 		--crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
 		--out-dir $(objtree)/$(obj)/test --cfg testlib \
 		--sysroot $(objtree)/$(obj)/test/sysroot \
@@ -136,9 +213,25 @@ quiet_cmd_rustc_test_library = RUSTC TL $<
 rusttestlib-build_error: $(src)/build_error.rs rusttest-prepare FORCE
 	$(call if_changed,rustc_test_library)
 
-rusttestlib-macros: private rustc_target_flags = --extern proc_macro
+rusttestlib-proc_macro2: private skip_flags = $(proc_macro2-skip_flags)
+rusttestlib-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
+rusttestlib-proc_macro2: $(src)/proc-macro2/lib.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test_library)
+
+rusttestlib-quote: private skip_flags = $(quote-skip_flags)
+rusttestlib-quote: private rustc_target_flags = $(quote-flags)
+rusttestlib-quote: $(src)/quote/lib.rs rusttestlib-proc_macro2 FORCE
+	$(call if_changed,rustc_test_library)
+
+rusttestlib-syn: private skip_flags = $(syn-skip_flags)
+rusttestlib-syn: private rustc_target_flags = $(syn-flags)
+rusttestlib-syn: $(src)/syn/lib.rs rusttestlib-quote FORCE
+	$(call if_changed,rustc_test_library)
+
+rusttestlib-macros: private rustc_target_flags = --extern proc_macro \
+    --extern quote --extern syn
 rusttestlib-macros: private rustc_test_library_proc = yes
-rusttestlib-macros: $(src)/macros/lib.rs rusttest-prepare FORCE
+rusttestlib-macros: $(src)/macros/lib.rs rusttestlib-syn FORCE
 	$(call if_changed,rustc_test_library)
 
 rusttestlib-bindings: $(src)/bindings/lib.rs rusttest-prepare FORCE
@@ -147,6 +240,18 @@ rusttestlib-bindings: $(src)/bindings/lib.rs rusttest-prepare FORCE
 rusttestlib-uapi: $(src)/uapi/lib.rs rusttest-prepare FORCE
 	$(call if_changed,rustc_test_library)
 
+rusttestlib-serde_derive: private skip_flags = $(serde_derive-skip_flags)
+rusttestlib-serde_derive: private rustc_target_flags = --extern proc_macro \
+    --extern quote --extern syn $(serde_derive-flags)
+rusttestlib-serde_derive: private rustc_test_library_proc = yes
+rusttestlib-serde_derive: $(src)/serde_derive/lib.rs rusttestlib-syn FORCE
+	$(call if_changed,rustc_test_library)
+
+rusttestlib-serde: private skip_flags = $(serde-skip_flags)
+rusttestlib-serde: private rustc_target_flags = $(serde-flags)
+rusttestlib-serde: $(src)/serde/lib.rs rusttest-prepare FORCE
+	$(call if_changed,rustc_test_library)
+
 quiet_cmd_rustdoc_test = RUSTDOC T $<
       cmd_rustdoc_test = \
 	OBJTREE=$(abspath $(objtree)) \
@@ -222,17 +327,19 @@ quiet_cmd_rustsysroot = RUSTSYSROOT
 rusttest-prepare: FORCE
 	$(call if_changed,rustsysroot)
 
-rusttest-macros: private rustc_target_flags = --extern proc_macro
+rusttest-macros: private rustc_target_flags = --extern proc_macro \
+    --extern quote --extern syn
 rusttest-macros: private rustdoc_test_target_flags = --crate-type proc-macro
-rusttest-macros: $(src)/macros/lib.rs rusttest-prepare FORCE
+rusttest-macros: $(src)/macros/lib.rs rusttestlib-syn FORCE
 	$(call if_changed,rustc_test)
 	$(call if_changed,rustdoc_test)
 
 rusttest-kernel: private rustc_target_flags = --extern alloc \
-    --extern build_error --extern macros --extern bindings --extern uapi
+    --extern build_error --extern macros --extern bindings --extern uapi \
+    --extern serde --extern serde_derive
 rusttest-kernel: $(src)/kernel/lib.rs rusttest-prepare \
     rusttestlib-build_error rusttestlib-macros rusttestlib-bindings \
-    rusttestlib-uapi FORCE
+    rusttestlib-uapi rusttestlib-serde rusttestlib-serde_derive FORCE
 	$(call if_changed,rustc_test)
 	$(call if_changed,rustc_test_library)
 
@@ -348,17 +455,52 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings.o FORCE
 $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 	$(call if_changed,exports)
 
+quiet_cmd_rustc_hostlibrary = $(RUSTC_OR_CLIPPY_QUIET) H $@
+      cmd_rustc_hostlibrary = \
+	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
+		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
+		--emit=dep-info,link --crate-type rlib -O \
+		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
+		--crate-name $(patsubst lib%.rlib,%,$(notdir $@)) $<; \
+	mv $(objtree)/$(obj)/$(patsubst lib%.rlib,%,$(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile)
+
+$(obj)/libproc_macro2.rlib: private skip_clippy = 1
+$(obj)/libproc_macro2.rlib: private skip_flags = $(proc_macro2-skip_flags)
+$(obj)/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
+$(obj)/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
+	$(call if_changed_dep,rustc_hostlibrary)
+
+$(obj)/libquote.rlib: private skip_clippy = 1
+$(obj)/libquote.rlib: private skip_flags = $(quote-skip_flags)
+$(obj)/libquote.rlib: private rustc_target_flags = $(quote-flags)
+$(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FORCE
+	$(call if_changed_dep,rustc_hostlibrary)
+
+$(obj)/libsyn.rlib: private skip_clippy = 1
+$(obj)/libsyn.rlib: private skip_flags = $(syn-skip_flags)
+$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
+$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
+	$(call if_changed_dep,rustc_hostlibrary)
+
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
-	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
+		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-		--crate-type proc-macro \
-		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
+		--extern quote --extern syn --crate-type proc-macro \
+		-L$(objtree)/$(obj) --crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
 # Therefore, to get `libmacros.so` automatically recompiled when the compiler
 # version changes, we add `core.o` as a dependency (even if it is not needed).
-$(obj)/libmacros.so: $(src)/macros/lib.rs $(obj)/core.o FORCE
+$(obj)/libserde_derive.so: private skip_clippy = 1
+$(obj)/libserde_derive.so: private skip_flags = $(serde_derive-skip_flags)
+$(obj)/libserde_derive.so: private rustc_target_flags = $(serde_derive-flags)
+$(obj)/libserde_derive.so: $(src)/serde_derive/lib.rs $(obj)/libsyn.rlib $(obj)/core.o FORCE
+	$(call if_changed_dep,rustc_procmacro)
+
+$(obj)/libmacros.so: $(src)/macros/lib.rs $(obj)/libsyn.rlib $(obj)/core.o FORCE
 	$(call if_changed_dep,rustc_procmacro)
 
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
@@ -420,10 +562,18 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/uapi/uapi_generated.rs FORCE
 	$(call if_changed_dep,rustc_library)
 
+$(obj)/serde.o: private skip_clippy = 1
+$(obj)/serde.o: private skip_flags = $(serde-skip_flags)
+$(obj)/serde.o: private rustc_target_flags = $(serde-flags)
+$(obj)/serde.o: $(src)/serde/lib.rs $(obj)/compiler_builtins.o FORCE
+	$(call if_changed_dep,rustc_library)
+
 $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
-    --extern build_error --extern macros --extern bindings --extern uapi
+    --extern build_error --extern macros --extern bindings --extern uapi \
+    --extern serde --extern serde_derive
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
-    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o \
+    $(obj)/serde.o $(obj)/libserde_derive.so FORCE
 	$(call if_changed_dep,rustc_library)
 
 endif # CONFIG_RUST
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 1404967e908e..3fa298bb7c31 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -284,7 +284,7 @@ rust_common_cmd = \
 	-Zallow-features=$(rust_allowed_features) \
 	-Zcrate-attr=no_std \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
-	--extern alloc --extern kernel \
+	--extern alloc --extern kernel --extern serde --extern serde_derive \
 	--crate-type rlib -L $(objtree)/rust/ \
 	--crate-name $(basename $(notdir $@)) \
 	--emit=dep-info=$(depfile)
-- 
2.40.1

