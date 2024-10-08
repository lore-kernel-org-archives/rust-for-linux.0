Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6AA21A71D
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Oct 2024 18:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412752; cv=none; b=TnDFXTR+S5bj+O+oGol8aSFcUoJNF60dHnlfGHdoX3IWwxS9rcxtZKs9vxwFsPuclwLmejQlQICgDhZXuoh8y7uTKMUWe1ZGMf/5HdH8OBsHlsMFceCb0bpkd4b3Jx0Csr2kBXWfbBYlIBK2eEZ7LUj3gOjsArLrtQvNxvBpLjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412752; c=relaxed/simple;
	bh=cu13kRY3+mJ5cZSxocHr5Yb/1rJZvzr4RQDiYdBp4Ok=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qlRySq4Tei7TlHSSB8Slz7e6EmOSrLjysIDtgSIWjza91lhAtodc9JY7CLAaXYGuhkgH04C///X0AxIAZK2AlubGFAhY14A9iznJjt09lrYFnQQFRjrQsJjR/fF3oyyWiRw8Ydhb5oaCwiH3RcbVvv5QS1/rXkgG11Yd4gv46Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f5epyucS; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f5epyucS"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7c6b192a39bso5030130a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Oct 2024 11:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412750; x=1729017550; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaLa12BRozVfGYk63WojrW4fg6j3chZ7iM5FcwVR/BA=;
        b=f5epyucS+JMK/n0rZdTd3t1ea+qMaw4ky80HzghouWdnaSLprCO2CfGmNM5o90wwxZ
         CjnWqtFsszQK5mGqk8Xbv6Bk5Vkscmg9dipR88dM14s0kBYGIQkUPfId5U7NOzoBO0HF
         iEdhDFC0Dqjp6RvpLJ+CrKfD3Y33PyQBYbZ1j3aLt3wy3kTl8PyrQTzzzPnfDXYoQleX
         4RZwyNIibp7trm/qrIlueNuKbGxjAYcuvkLb2dZsDENwI+NICaNnjIG8vSGZGeShoaHI
         mAHcc9cguN0NecVU0Ljx5KVWYCT0Zde1D7xJiIuj1Y6VFv81TNlkr8QLA7ujPNI7K6IL
         6dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412750; x=1729017550;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaLa12BRozVfGYk63WojrW4fg6j3chZ7iM5FcwVR/BA=;
        b=J1G1yyzDO8A5Dpsy+oJtAZuGFs2x2VKR7MKVVcIbvY5SmC9ZKyxEBmfjc+8uqryBxO
         juE9PyB5A4n9yp3stoq3bgbDFPVd3kSvinQ6uOT97QU16acZHrtG8kZtFuqgwY/zvvY3
         WvNVdMaM1wxtK3k3EZQkOqrRLPo9EJGI8vH9hx7yfUsDZdVq6Nbkta305KI6yAvySDr/
         nxmn3mwkxCird7JGdXFkaQKidcgzyQ6Mw3z+7M1sJUDV8OveDLHCG6uGNNodjSQqvy/i
         9TSQd4eRS81WyD3Ub9V0uAKtQ2xm4mSzQ202q8DStHh6qSjhmzxDfbPCg90/SNAyuuyG
         kuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlz8b2x4zm0tbh/vWECsH8WCjrr7e7MxlCU0j9kojHeQ0levczPVdwNYkiTJsjhcGDO0JTgZcjuxUiMePDMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiwZCKDi5Kf7nKzLJV87XnPBvGmKmqF8CoPRrMgNNTWLEg7LZQ
	/A2QN4VyFNfxv7OmBnU7HwD7AQo6t8YkxwkL3ROgx1a1LBFjvPwvJ9P0cKmYpcydvuJ4oPTVoBx
	2QcoXdwDryXa7iSk9lGTut7h1wg==
X-Google-Smtp-Source: AGHT+IE1ARsuZR5MICYuQmn5iAsWmKU1pOr38cH5bK+78z1447fX+K+DtRTHFCEh7OVqUA+XdHcAISnHPXeFVjGnjgs=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a65:6886:0:b0:7e6:b6fb:b115 with SMTP
 id 41be03b00d2f7-7ea32071cb3mr39a12.1.1728412749298; Tue, 08 Oct 2024
 11:39:09 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:42 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5204; i=samitolvanen@google.com;
 h=from:subject; bh=cu13kRY3+mJ5cZSxocHr5Yb/1rJZvzr4RQDiYdBp4Ok=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNZp8M81P/XzpMEt8kXySwOLzX2ZLdotUP123Sc3/v
 7SbXpZxRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZgIuzLDP8UTt/Omhgg/cNPk
 KU+Jc7P+3HJEPolDMHvB2w12bvNFzzIyPMmYaeRs7mYZvOt4SdHt7Qbt0r1+l5/PrC3o8PZcWcP EBAA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-39-samitolvanen@google.com>
Subject: [PATCH v4 18/19] kbuild: Add gendwarfksyms as an alternative to genksyms
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
implementation, but default to genksyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Neal Gompa <neal@gompa.dev>
---
 kernel/module/Kconfig  | 25 ++++++++++++++++++++++++-
 scripts/Makefile       |  2 +-
 scripts/Makefile.build | 39 +++++++++++++++++++++++++++++++--------
 3 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index f9e5f82fa88b..e6b2427e5c19 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -169,13 +169,36 @@ config MODVERSIONS
 	  make them incompatible with the kernel you are running.  If
 	  unsure, say N.
 
+choice
+	prompt "Module versioning implementation"
+	depends on MODVERSIONS
+	default GENKSYMS
+	help
+	  Select the tool used to calculate symbol versions for modules.
+
+	  If unsure, select GENKSYMS.
+
+config GENKSYMS
+	bool "genksyms (from source code)"
+	help
+	  Calculate symbol versions from pre-processed source code using
+	  genksyms.
+
+	  If unsure, say Y.
+
 config GENDWARFKSYMS
-	bool
+	bool "gendwarfksyms (from debugging information)"
 	depends on DEBUG_INFO
 	# Requires full debugging information, split DWARF not supported.
 	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
 	# Requires ELF object files.
 	depends on !LTO
+	help
+	  Calculate symbol versions from DWARF debugging information using
+	  gendwarfksyms. Requires DEBUG_INFO to be enabled.
+
+	  If unsure, say N.
+endchoice
 
 config ASM_MODVERSIONS
 	bool
diff --git a/scripts/Makefile b/scripts/Makefile
index d7fec46d38c0..8533f4498885 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -53,7 +53,7 @@ hostprogs += unifdef
 targets += module.lds
 
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
-subdir-$(CONFIG_MODVERSIONS) += genksyms
+subdir-$(CONFIG_GENKSYMS) += genksyms
 subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
 subdir-$(CONFIG_SECURITY_IPE) += ipe
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8f423a1faf50..ae13afb71123 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -107,18 +107,28 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
 $(obj)/%.i: $(obj)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
+gendwarfksyms := scripts/gendwarfksyms/gendwarfksyms
+getexportsymbols = $(NM) $(1) | sed -n 's/.* __export_symbol_\(.*\)/$(2)/p'
+
 genksyms = scripts/genksyms/genksyms		\
 	$(if $(1), -T $(2))			\
 	$(if $(KBUILD_PRESERVE), -p)		\
 	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
 
 # These mirror gensymtypes_S and co below, keep them in synch.
+ifdef CONFIG_GENDWARFKSYMS
+symtypes_dep_c = $(obj)/%.o
+cmd_gensymtypes_c = $(if $(skip_gendwarfksyms),,			\
+	$(call getexportsymbols,$(2:.symtypes=.o),\1) |			\
+	$(gendwarfksyms) $(2:.symtypes=.o) $(if $(1), --symtypes $(2)))
+else
 cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_c = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_c = $(call cmd_gensymtypes_c,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.c FORCE
+$(obj)/%.symtypes : $(obj)/%.c $(symtypes_dep_c) FORCE
 	$(call cmd,cc_symtypes_c)
 
 # LLVM assembly
@@ -314,19 +324,32 @@ $(obj)/%.ll: $(obj)/%.rs FORCE
 # This is convoluted. The .S file must first be preprocessed to run guards and
 # expand names, then the resulting exports must be constructed into plain
 # EXPORT_SYMBOL(symbol); to build our dummy C file, and that gets preprocessed
-# to make the genksyms input.
+# to make the genksyms input or compiled into an object for gendwarfksyms.
 #
 # These mirror gensymtypes_c and co above, keep them in synch.
-cmd_gensymtypes_S =                                                         \
-   { echo "\#include <linux/kernel.h>" ;                                    \
-     echo "\#include <asm/asm-prototypes.h>" ;                              \
-     $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/EXPORT_SYMBOL(\1);/p' ; } | \
-    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+getasmexports =								\
+   { echo "\#include <linux/kernel.h>" ;				\
+     echo "\#include <linux/string.h>" ;				\
+     echo "\#include <asm/asm-prototypes.h>" ;				\
+     $(call getexportsymbols,$(2:.symtypes=.o),EXPORT_SYMBOL(\1);) ; }
+
+ifdef CONFIG_GENDWARFKSYMS
+cmd_gensymtypes_S =							\
+	$(getasmexports) |						\
+	$(CC) $(c_flags) -c -o $(2:.symtypes=.gendwarfksyms.o) -xc -;	\
+	$(call getexportsymbols,$(2:.symtypes=.o),\1) |			\
+	$(gendwarfksyms) $(2:.symtypes=.gendwarfksyms.o)		\
+		$(if $(1), --symtypes $(2))
+else
+cmd_gensymtypes_S =							\
+	$(getasmexports) |						\
+	$(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
+endif # CONFIG_GENDWARFKSYMS
 
 quiet_cmd_cc_symtypes_S = SYM $(quiet_modtag) $@
       cmd_cc_symtypes_S = $(call cmd_gensymtypes_S,true,$@) >/dev/null
 
-$(obj)/%.symtypes : $(obj)/%.S FORCE
+$(obj)/%.symtypes : $(obj)/%.S $(obj)/%.o FORCE
 	$(call cmd,cc_symtypes_S)
 
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog

