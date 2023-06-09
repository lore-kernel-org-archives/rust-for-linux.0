Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16B0C7EE43
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 06:56:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238650AbjFIG4b (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 02:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237745AbjFIG4O (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 02:56:14 -0400
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B055A30FD
        for <rust-for-linux@vger.kernel.org>; Thu,  8 Jun 2023 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3085; q=dns/txt; s=iport;
  t=1686293744; x=1687503344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X7GBWl2my9SwbiwQ6hBntYOQqBoG3lzB+vCSQJvpmoM=;
  b=CsvZqCpg5XOZZaNbDhmKxQ8vHtUGsEhN6jZbJ2RGAPP6OInBT8DlG07m
   J+mQ+dcQUPRJ7/Ch62JvVOd/NawXuGiiWFQIutvYexh5ozoBJw4QxcD1x
   ug7bOKrK/HinlRtrsSQiV7qI9SeH1ehlBzYMFSvXxq77rKCuKuavYYGEL
   M=;
X-IronPort-AV: E=Sophos;i="6.00,228,1681171200"; 
   d="scan'208";a="7820472"
Received: from aer-iport-nat.cisco.com (HELO aer-core-5.cisco.com) ([173.38.203.22])
  by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 09 Jun 2023 06:31:58 +0000
Received: from archlinux-cisco.cisco.com ([10.61.198.236])
        (authenticated bits=0)
        by aer-core-5.cisco.com (8.15.2/8.15.2) with ESMTPSA id 3596VIE4055061
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 9 Jun 2023 06:31:57 GMT
From:   Ariel Miculas <amiculas@cisco.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Ariel Miculas <amiculas@cisco.com>
Subject: [PATCH 70/80] rust: Kbuild: enable `hex`
Date:   Fri,  9 Jun 2023 09:31:08 +0300
Message-Id: <20230609063118.24852-71-amiculas@cisco.com>
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

With all the new files in place from the hex crate, this patch
adds support for them in the build system.

Signed-off-by: Ariel Miculas <amiculas@cisco.com>
---
 rust/Makefile          | 21 ++++++++++++++++++---
 scripts/Makefile.build |  2 +-
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index c9feb8e1afe1..ba7f911d6919 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -13,7 +13,7 @@ always-$(CONFIG_RUST) += libserde_derive.so libmacros.so
 no-clean-files += libserde_derive.so libmacros.so
 
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
-obj-$(CONFIG_RUST) += alloc.o bindings.o serde.o serde_cbor.o kernel.o
+obj-$(CONFIG_RUST) += alloc.o bindings.o serde.o serde_cbor.o hex.o kernel.o
 always-$(CONFIG_RUST) += exports_alloc_generated.h exports_bindings_generated.h \
     exports_kernel_generated.h
 
@@ -137,6 +137,15 @@ serde_cbor-flags := \
     --extern alloc \
     --extern serde
 
+hex-skip_flags := \
+    --edition=2021 \
+    -Drust_2018_idioms \
+    -Dunreachable_pub
+
+hex-flags := \
+    --edition=2018 \
+    -Amissing_docs
+
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abspath $(objtree)) \
@@ -589,12 +598,18 @@ $(obj)/serde_cbor.o: private rustc_target_flags = $(serde_cbor-flags)
 $(obj)/serde_cbor.o: $(src)/serde_cbor/lib.rs $(obj)/compiler_builtins.o FORCE
 	$(call if_changed_dep,rustc_library)
 
+$(obj)/hex.o: private skip_clippy = 1
+$(obj)/hex.o: private skip_flags = $(hex-skip_flags)
+$(obj)/hex.o: private rustc_target_flags = $(hex-flags)
+$(obj)/hex.o: $(src)/hex/lib.rs $(obj)/compiler_builtins.o FORCE
+	$(call if_changed_dep,rustc_library)
+
 $(obj)/kernel.o: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi \
-    --extern serde --extern serde_derive --extern serde_cbor
+    --extern serde --extern serde_derive --extern serde_cbor --extern hex
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
     $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o \
-    $(obj)/serde.o $(obj)/libserde_derive.so $(obj)/serde_cbor.o FORCE
+    $(obj)/serde.o $(obj)/libserde_derive.so $(obj)/serde_cbor.o $(obj)/hex.o FORCE
 	$(call if_changed_dep,rustc_library)
 
 endif # CONFIG_RUST
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 758b327fd54d..e88cfd953833 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -284,7 +284,7 @@ rust_common_cmd = \
 	-Zallow-features=$(rust_allowed_features) \
 	-Zcrate-attr=no_std \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
-	--extern alloc --extern kernel --extern serde --extern serde_derive --extern serde_cbor \
+	--extern alloc --extern kernel --extern serde --extern serde_derive --extern serde_cbor --extern hex \
 	--crate-type rlib -L $(objtree)/rust/ \
 	--crate-name $(basename $(notdir $@)) \
 	--emit=dep-info=$(depfile)
-- 
2.40.1

