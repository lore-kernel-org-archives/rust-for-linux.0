Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF295103F
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 17:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743559; cv=none; b=qPB6DW2euuThYAb6y401cqsJ0XJmny1hSgZr//Uj/Iz5nHNfwbkFCBj5C9nOGACPb6lsymWC1qP/vW5fKznvO9Wi6AXKFAHBj1TAds7xHd/XLaS+ugwS3OlMCDapv1xQARuCPf9piMgjjVap+2/bOLQcb/5n7OcthT9nuXVNW/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743559; c=relaxed/simple;
	bh=crG2z1QAVdcb8L1xI/ei1FGYqMQPcrm7Rlub8Vb9HSE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bb60Md3N78e4cf14xkGBK4IVcO3a9zqwWXGztBBgoJ4A1cpCxxonV/n5bkLcJOEN/+ErO6ZqCKKF9VodFdPSiGlxO+Wawi575QHiFZtRNIlFfT+nhKvhMl/kJmdyMSXkxXR5bHa6UrOGFqwu/3pwv8YyZBJhFLi460oP2cC8X0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rm0zeOK6; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rm0zeOK6"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-201f89c6b21so6235305ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 10:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743557; x=1724348357; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uov0CRlxy4YygtcVstLoe0vAl7pu4tWa+P/EEpIdGls=;
        b=Rm0zeOK6+sBDP5UqQNzCWa8QyjYf5pTR5Amg4ZM7utjm8by5hJPtFOMAGgtVc6vyl8
         0Oe8VUwD2e4DUwu0SmQ0PBBjv5reU0ytaE5y4ZmHeEpo0SUG/kyDkOPqNwD920G1c3M8
         +QRmWyQJM1cMAJ5ZCv6fDffMS2rQRHhd/F5e/KcBfAnsYiSdVmrynsM/5bzVkXKSpYUF
         6qNWjYcLToR5QbsGsZyAqbIOE32BaEnfxfnyHob88Tn3IS0pM7jm/7S5JXwLbbg1u0K+
         Naq+cEftef3I1g5OevGcRMtJgd0DsObzYOpHaono+QK1CzrHwarT1C3c3N30GfpVBGAJ
         HXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743557; x=1724348357;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uov0CRlxy4YygtcVstLoe0vAl7pu4tWa+P/EEpIdGls=;
        b=uDSMuUHV1kdTaQDgqThv/CfWl+0ovY6O5Fsg3+7bMjNzhkn8MBfrYOrUVUoKYvI/km
         Vo06j/GQ8ZWwb/B8crj8iR7jb+DYNnCV4qAF0vEVxokutYHU7wRJuwqqWSbpVGFDu8Rh
         QN9R93dQbZeMssjFTT1mV2xtW2kKP1WdM8yEK8/1XT/B7LcU+acC/hNGArlgoAfq/yIJ
         Q+Q7j9bYNK+Xyf3+WD1J+fw88oCT7koUOadldepPXJexaJv+Awbr70OvqjMwJ9pnjmWG
         pCpqpkP4Er6r77RzUF8jGZY3mU+nDMW+hRUxDTxpen1kYTwkqz42aoo8x2coYkdNumi+
         ag2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkpHSZRyAYe5VPod86AnHB/UCirof/bksblnqTpbndfNfzzzCLkCXcTxyEyeh6HH64thPHxbdVbu/Y51qiTD1CNVpg11jANrb00qgYBn0=
X-Gm-Message-State: AOJu0YwNk+JXnKBcUKMqSbnjtx6iDU2YcUsajwlq9jD4abtZNZZOPcLl
	rruw/uzcS9vx+gvRKMiBHZuKbFJga9jkMjMNiA8CmUZpsSLOOrHUKsSTBgfcZlY+04x1GYg3SdH
	EaSd1zvkx00aAXXn7qTRaD9rFaw==
X-Google-Smtp-Source: AGHT+IEwcQof9vpv5owFCL5xlAGrgWbmahy7qEGDiupJWRGzXkesK5qX16rh6dI20h9d+J+ztNbd8gVLvvi1kFjdtlI=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:247:b0:1fb:b3f:b9bf with SMTP
 id d9443c01a7336-20203b1111bmr437945ad.0.1723743556647; Thu, 15 Aug 2024
 10:39:16 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:06 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=7173; i=samitolvanen@google.com;
 h=from:subject; bh=crG2z1QAVdcb8L1xI/ei1FGYqMQPcrm7Rlub8Vb9HSE=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj03h2SYn2IwipBF/1mhMjbft2puh5x1VQQtr
 hR01w5wx0KJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49NwAKCRBMtfaEi7xW
 7pkjDACi1TmSidtdqQ3U+ev+m7j+aMyKSXe/Gpe/+wqmXzcKHpCrZV34O2WWIa2Bc5hGXypNm5V
 eHNXgPkLe+AXEwwgUwoaNU6rKfBCZAjmXHdVbOCdBphz+xu28FY0HSJFKjnoLw/xtSVaAbbLCAh
 I1yCgQBj4gqzMfYqha8ctveVZlw5W7dtQXhaTgUj+rGYPR2qgIEXDPW7eWVw7HfekSyLrVYWwBz
 L4Bfw+K81fUy1g/72UJla2QO91v4M3ifIHNPljAAHPYCqtMyJ5T6vuF0t15ZXozltgqNputiGft
 wzaMoje6OXefn1A5egVjauNrv2nlkM2kyYjVjUbUlOl3oxJ8dPad2cgyOloqrGjprhXXACyIoq3
 JwfZG9i21qdpGPHhuYOoA4V/hYTf5MYMciXTqktnc+zxNv7HmjeVp7JIVRCO8z6iWwvfPmPTYuP SB4eGS+06dcO2UxmaFoWsIn1Zfgn4z1wulHhu0jABiCD7+q8lRLkSqsejCA2m1Dv41neQ=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-23-samitolvanen@google.com>
Subject: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for passing a list of exported symbols to gendwarfksyms
via stdin and filter out non-exported symbols from the output.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/Makefile        |  1 +
 scripts/gendwarfksyms/dwarf.c         | 53 ++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.c |  4 +-
 scripts/gendwarfksyms/gendwarfksyms.h | 21 ++++++
 scripts/gendwarfksyms/symbols.c       | 96 +++++++++++++++++++++++++++
 5 files changed, 171 insertions(+), 4 deletions(-)
 create mode 100644 scripts/gendwarfksyms/symbols.c

diff --git a/scripts/gendwarfksyms/Makefile b/scripts/gendwarfksyms/Makefile
index c1389c161f9c..623f8fc975ea 100644
--- a/scripts/gendwarfksyms/Makefile
+++ b/scripts/gendwarfksyms/Makefile
@@ -2,6 +2,7 @@ hostprogs-always-y += gendwarfksyms
 
 gendwarfksyms-objs += gendwarfksyms.o
 gendwarfksyms-objs += dwarf.o
+gendwarfksyms-objs += symbols.o
 
 HOST_EXTRACFLAGS := -I $(srctree)/tools/include
 HOSTLDLIBS_gendwarfksyms := -ldw -lelf
diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 65a29d0bd8f4..71cfab0553da 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -5,6 +5,48 @@
 
 #include "gendwarfksyms.h"
 
+static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
+{
+	Dwarf_Attribute da;
+
+	/* dwarf_formref_die returns a pointer instead of an error value. */
+	return dwarf_attr(die, id, &da) && dwarf_formref_die(&da, value);
+}
+
+static const char *get_name(Dwarf_Die *die)
+{
+	Dwarf_Attribute attr;
+
+	/* rustc uses DW_AT_linkage_name for exported symbols */
+	if (dwarf_attr(die, DW_AT_linkage_name, &attr) ||
+	    dwarf_attr(die, DW_AT_name, &attr)) {
+		return dwarf_formstring(&attr);
+	}
+
+	return NULL;
+}
+
+static bool is_export_symbol(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die *source = die;
+	Dwarf_Die origin;
+
+	state->sym = NULL;
+
+	/* If the DIE has an abstract origin, use it for type information. */
+	if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
+		source = &origin;
+
+	state->sym = symbol_get(get_name(die));
+
+	/* Look up using the origin name if there are no matches. */
+	if (!state->sym && source != die)
+		state->sym = symbol_get(get_name(source));
+
+	state->die = *source;
+	return !!state->sym;
+}
+
 /*
  * Type string processing
  */
@@ -40,7 +82,7 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 }
 
 /*
- * Symbol processing
+ * Exported symbol processing
  */
 static int process_subprogram(struct state *state, Dwarf_Die *die)
 {
@@ -67,10 +109,15 @@ static int process_exported_symbols(struct state *state, Dwarf_Die *die)
 	/* Possible exported symbols */
 	case DW_TAG_subprogram:
 	case DW_TAG_variable:
+		if (!is_export_symbol(state, die))
+			return 0;
+
+		debug("%s", state->sym->name);
+
 		if (tag == DW_TAG_subprogram)
-			check(process_subprogram(state, die));
+			check(process_subprogram(state, &state->die));
 		else
-			check(process_variable(state, die));
+			check(process_variable(state, &state->die));
 
 		return 0;
 	default:
diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
index 27f2d6423c45..d209b237766b 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.c
+++ b/scripts/gendwarfksyms/gendwarfksyms.c
@@ -27,7 +27,7 @@ static const struct {
 
 static int usage(void)
 {
-	error("usage: gendwarfksyms [options] elf-object-file ...");
+	error("usage: gendwarfksyms [options] elf-object-file ... < symbol-list");
 	return -1;
 }
 
@@ -105,6 +105,8 @@ int main(int argc, const char **argv)
 	if (parse_options(argc, argv) < 0)
 		return usage();
 
+	check(symbol_read_exports(stdin));
+
 	for (n = 0; n < object_count; n++) {
 		Dwfl *dwfl;
 		int fd;
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 5ab7ce7d4efb..03f3e408a839 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -7,9 +7,11 @@
 #include <elfutils/libdw.h>
 #include <elfutils/libdwfl.h>
 #include <linux/hashtable.h>
+#include <linux/jhash.h>
 #include <inttypes.h>
 #include <stdlib.h>
 #include <stdio.h>
+#include <string.h>
 
 #ifndef __GENDWARFKSYMS_H
 #define __GENDWARFKSYMS_H
@@ -56,6 +58,23 @@ extern bool debug;
 /* Error == negative values */
 #define checkp(expr) __check(expr, __res < 0, __res)
 
+/*
+ * symbols.c
+ */
+
+static inline u32 name_hash(const char *name)
+{
+	return jhash(name, strlen(name), 0);
+}
+
+struct symbol {
+	const char *name;
+	struct hlist_node name_hash;
+};
+
+extern int symbol_read_exports(FILE *file);
+extern struct symbol *symbol_get(const char *name);
+
 /*
  * dwarf.c
  */
@@ -63,6 +82,8 @@ extern bool debug;
 struct state {
 	Dwfl_Module *mod;
 	Dwarf *dbg;
+	struct symbol *sym;
+	Dwarf_Die die;
 };
 
 typedef int (*die_callback_t)(struct state *state, Dwarf_Die *die);
diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
new file mode 100644
index 000000000000..673ad9cf9e77
--- /dev/null
+++ b/scripts/gendwarfksyms/symbols.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include "gendwarfksyms.h"
+
+#define SYMBOL_HASH_BITS 15
+static DEFINE_HASHTABLE(symbol_names, SYMBOL_HASH_BITS);
+
+typedef int (*symbol_callback_t)(struct symbol *, void *arg);
+
+static int for_each(const char *name, symbol_callback_t func, void *data)
+{
+	struct hlist_node *tmp;
+	struct symbol *match;
+
+	if (!name || !*name)
+		return 0;
+
+	hash_for_each_possible_safe(symbol_names, match, tmp, name_hash,
+				    name_hash(name)) {
+		if (strcmp(match->name, name))
+			continue;
+
+		if (func)
+			check(func(match, data));
+
+		return 1;
+	}
+
+	return 0;
+}
+
+static bool is_exported(const char *name)
+{
+	return checkp(for_each(name, NULL, NULL)) > 0;
+}
+
+int symbol_read_exports(FILE *file)
+{
+	struct symbol *sym;
+	char *line = NULL;
+	char *name = NULL;
+	size_t size = 0;
+	int nsym = 0;
+
+	while (getline(&line, &size, file) > 0) {
+		if (sscanf(line, "%ms\n", &name) != 1) {
+			error("malformed input line: %s", line);
+			return -1;
+		}
+
+		free(line);
+		line = NULL;
+
+		if (is_exported(name))
+			continue; /* Ignore duplicates */
+
+		sym = malloc(sizeof(struct symbol));
+		if (!sym) {
+			error("malloc failed");
+			return -1;
+		}
+
+		sym->name = name;
+		name = NULL;
+
+		hash_add(symbol_names, &sym->name_hash, name_hash(sym->name));
+		++nsym;
+
+		debug("%s", sym->name);
+	}
+
+	if (line)
+		free(line);
+
+	debug("%d exported symbols", nsym);
+	return 0;
+}
+
+static int get_symbol(struct symbol *sym, void *arg)
+{
+	struct symbol **res = arg;
+
+	*res = sym;
+	return 0;
+}
+
+struct symbol *symbol_get(const char *name)
+{
+	struct symbol *sym = NULL;
+
+	for_each(name, get_symbol, &sym);
+	return sym;
+}
-- 
2.46.0.184.g6999bdac58-goog

