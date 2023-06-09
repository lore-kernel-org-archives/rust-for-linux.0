Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503C1C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:55:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238122AbjFIGzu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjFIGzl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:55:41 -0400
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1438D2D7E
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3793; q=dns/txt; s=iport;
  t=1686293711; x=1687503311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NuR8H3rikJQyYd811bOAQKZlSzQVen8SweDJIF9ZB6Y=;
  b=FNkXN8ctlbGJBLtwco0x4SKa70aHovVLHaT/BEX2J7uCJyGyD+JnQKDj
   KWzobQevGD2ndy7XTkh2oSEwsv6WKrGa2GTc5IGM9kESmwmpWV3LLko47
   SGd+t2H7v3r9y7CvF6mSyou6fqdqvEv3zam4DAAxTcC1+6GZ/TpcnhpP7
   0=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="5279098"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:49 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIDZ055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:48 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 41/80] rust: Kbuild: enable serde_cbor
Date:   Fri,  9 Jun 2023 09:30:39 +0300
Message-Id: <20230609063118.24852-42-amiculas@cisco.com>
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

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 Makefile               |  2 ++
 rust/Makefile          | 23 ++++++++++++++++++++---
 scripts/Makefile.build |  2 +-
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 3b7f37977f04..0abe8aaee974 100644
--- a/Makefile
+++ b/Makefile
@@ -1853,6 +1853,7 @@ rustfmt:
 		-o -path $(abs_srctree)/rust/syn -prune \
 		-o -path $(abs_srctree)/rust/serde -prune \
 		-o -path $(abs_srctree)/rust/serde_derive -prune \
+		-o -path $(abs_srctree)/rust/serde_cbor -prune \
 		-o -path $(abs_objtree)/rust/test -prune \
 		| grep -Fv $(abs_srctree)/rust/alloc \
 		| grep -Fv $(abs_srctree)/rust/proc-macro2 \
@@ -1860,6 +1861,7 @@ rustfmt:
 		| grep -Fv $(abs_srctree)/rust/syn \
 		| grep -Fv $(abs_srctree)/rust/serde \
 		| grep -Fv $(abs_srctree)/rust/serde_derive \
+		| grep -Fv $(abs_srctree)/rust/serde_cbor \
 		| grep -Fv $(abs_objtree)/rust/test \
 		| grep -Fv generated \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
diff --git a/rust/Makefile b/rust/Makefile
index 37952e93ff06..129d5a6dd07e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -13,7 +13,7 @@ always-$(CONFIG_RUST) += libserde_derive.so libmacros.so
 no-clean-files += libserde_derive.so libmacros.so
 
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
-obj-$(CONFIG_RUST) += alloc.o bindings.o serde.o kernel.o
+obj-$(CONFIG_RUST) += alloc.o bindings.o serde.o serde_cbor.o kernel.o
 always-$(CONFIG_RUST) += exports_alloc_generated.h exports_bindings_generated.h \
     exports_kernel_generated.h
 
@@ -122,6 +122,17 @@ serde-flags := \
     -Amissing_docs \
     --cfg no_fp_fmt_parse
 
+serde_cbor-skip_flags := \
+    --edition=2021 \
+    -Drust_2018_idioms \
+    -Dunreachable_pub
+
+serde_cbor-flags := \
+    --edition=2018 \
+    -Amissing_docs \
+    --cfg no_fp_fmt_parse \
+    --extern serde
+
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abspath $(objtree)) \
@@ -568,12 +579,18 @@ $(obj)/serde.o: private rustc_target_flags = $(serde-flags)
 $(obj)/serde.o: $(src)/serde/lib.rs $(obj)/compiler_builtins.o FORCE
 	$(call if_changed_dep,rustc_library)
 
+$(obj)/serde_cbor.o: private skip_clippy = 1
+$(obj)/serde_cbor.o: private skip_flags = $(serde_cbor-skip_flags)
+$(obj)/serde_cbor.o: private rustc_target_flags = $(serde_cbor-flags)
+$(obj)/serde_cbor.o: $(src)/serde_cbor/lib.rs $(obj)/compiler_builtins.o FORCE
+	$(call if_changed_dep,rustc_library)
+
 $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi \
-    --extern serde --extern serde_derive
+    --extern serde --extern serde_derive --extern serde_cbor
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
     $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o \
-    $(obj)/serde.o $(obj)/libserde_derive.so FORCE
+    $(obj)/serde.o $(obj)/libserde_derive.so $(obj)/serde_cbor.o FORCE
 	$(call if_changed_dep,rustc_library)
 
 endif # CONFIG_RUST
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3fa298bb7c31..758b327fd54d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -284,7 +284,7 @@ rust_common_cmd = \
 	-Zallow-features=$(rust_allowed_features) \
 	-Zcrate-attr=no_std \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
-	--extern alloc --extern kernel --extern serde --extern serde_derive \
+	--extern alloc --extern kernel --extern serde --extern serde_derive --extern serde_cbor \
 	--crate-type rlib -L $(objtree)/rust/ \
 	--crate-name $(basename $(notdir $@)) \
 	--emit=dep-info=$(depfile)
-- 
2.40.1

