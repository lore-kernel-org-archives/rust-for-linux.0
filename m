Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3F1C1F30
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jan 2025 20:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937150; cv=none; b=fiIHbB/zmzUUJ7/9iZRwZIDC8YayinHM9xxkFpLFmFMr+jH+W7dVZ5urKVZ2mDeFOe0WbX539XNe4v9QG9xf1njxjUyksE6eYV7EgeAeyReo3lb7VxLIN8U+IYnI+PHnjBiNnNv89KiVr3F9jHEckVNgbnZwW2ZDeWA+bWM3SqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937150; c=relaxed/simple;
	bh=yrWG/DLfaIaAG3roJ/5utp+xwkOJf1qHLLIwHK3efLM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dBrUPckYQ5/H3k+avPxBulwldD9mBXMzxrIJrMagQ2DhdxR1E0+O3IEBRwwLNbP49yt6pEQIySN66YasefRs5rGRvEwql3yRJNqLXwaqzvoSUOX6530nSQPycmrzzhnUebo4vjKSCGG09ZHj1183BDLyBpNs4IvluL6bbtoAXv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6bcVCnw; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6bcVCnw"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso17875493a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Jan 2025 12:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937144; x=1736541944; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FPHPHvsctuc5VzYf3oHMp0UrUbKfYCtMAQllWUKFUVU=;
        b=t6bcVCnw/hVQT+uaItvSjj5chOp1u6wMH4SW95GOlsVcvldU/US7zHTmJxVNhQcgfP
         ocrMnD122FetXvIepJmOz5mjgQppgGVz2wmIcLdVJpbpcIdj9gDZotzIzR1gXMMB8Jv1
         sJMNPRIknvHEkHdgXruQ0yYGraM1Kub2pxAMt9AuprdXF9sag8WcWDMZztGG1as+jYW0
         +yMX4DQjcSCrknJDziyPPjF8JBDOWPiuR1oEBCETssO0S+Em8lPuegVdkmyXm6ofMxcl
         9PR+WJrJpUHyobs6gvpzizjw52LxQ2DEgZCYueaQjtuzRwhMSaoYaqaa/Er6PQbrBDMx
         x/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937144; x=1736541944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPHPHvsctuc5VzYf3oHMp0UrUbKfYCtMAQllWUKFUVU=;
        b=L92lbzGmYg2ga9FjFTR8Bv6lkc/zcqGDJlTv7ajF0robkWm5x0+acPtK3a0VE9PRwS
         P/KKx/9oUFMrccltqFXfFwkNgQjvHll+ckWod7SHMkFdunqa1YuKDWnVgKdt6XJb5Or1
         RlZbCkhjSebNvqmWqvqp6f2aEWrhbEobXrTRmnxuxkqQtr+0R1yxTLRp96B6KYC698Iq
         nX7qD91MLTeVTZwmAdgeT8CcJ93Cd3LtQSMWz2/4rh4xy5L9SVqyEnsRLp+6L9eoM++K
         svD2Q4UZmJ09An722rlvqjRMsipJ+3XSzAhq6ZOpz7/9hxpNC6O+JZ5ubPh7ctLXXoqD
         IHBg==
X-Forwarded-Encrypted: i=1; AJvYcCWBjQPgGp1bAUvsjZ84YG9BR+RjKYacUB/gMAruZntFyQ2aQd9l2U7QSo5RRnvY4vuVBd7CfY6T/MFHArH4Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMP3REuJcnH0sJGEnSUhKAlcQBQS0T7wiiLbyu7P375GCcQzQk
	xQ8mRq86o2mk0u7oHLg6ObE6nGZrMHc/JVg+B35Zqw2zNup+tT2dJ8++JA2OcKKcNDn0J8jEb9r
	Pa133rJ9a3nGQ/cPBhkf3+bsGYQ==
X-Google-Smtp-Source: AGHT+IGr9LefLe17zYVk/80CHgEhfNzyA6sM6YAv0ArBWvUa2T71SYb9x/Qk/hPl9dzHSPbQ/2ubz9cfEBpJnbHCoSA=
X-Received: from pjtd9.prod.google.com ([2002:a17:90b:49:b0:2f2:e5c9:de99])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5183:b0:2ee:5111:a54b with SMTP id 98e67ed59e1d1-2f452eec7dcmr63378547a91.31.1735937144468;
 Fri, 03 Jan 2025 12:45:44 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:28 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5759; i=samitolvanen@google.com;
 h=from:subject; bh=yrWG/DLfaIaAG3roJ/5utp+xwkOJf1qHLLIwHK3efLM=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPinXypfvOnnVWfZ8SmhR2tXsyecXqs/a8KIlPa6Te
 fLxoJJjHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAilz4y/Pe73Rcckv9W7OZf
 xlZ53c4+9uLZUxbOjw1b9bxntkzeZ2dGhh8TbIS/rwo81Zz469C8BXIux8T+varvr9s5ldnz8bP zjTwA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-26-samitolvanen@google.com>
Subject: [PATCH v8 06/18] gendwarfksyms: Expand subroutine_type
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

Add support for expanding DW_TAG_subroutine_type and the parameters
in DW_TAG_formal_parameter. Use this to also expand subprograms.

Example output with --dump-dies:

  subprogram (
    formal_parameter pointer_type {
      const_type {
        base_type char byte_size(1) encoding(6)
      }
    }
  )
  -> base_type unsigned long byte_size(8) encoding(7)

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c         | 84 ++++++++++++++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h |  4 ++
 2 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 3e08a32b7b16..7d8a4eb6c387 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -212,6 +212,15 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
 DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 
+/* Match functions -- die_match_callback_t */
+#define DEFINE_MATCH(type)                                     \
+	static bool match_##type##_type(Dwarf_Die *die)        \
+	{                                                      \
+		return dwarf_tag(die) == DW_TAG_##type##_type; \
+	}
+
+DEFINE_MATCH(formal_parameter)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -224,19 +233,28 @@ int process_die_container(struct state *state, struct die *cache,
 	Dwarf_Die current;
 	int res;
 
+	/* Track the first item in lists. */
+	if (state)
+		state->first_list_item = true;
+
 	res = checkp(dwarf_child(die, &current));
 	while (!res) {
 		if (match(&current)) {
 			/* <0 = error, 0 = continue, >0 = stop */
 			res = checkp(func(state, cache, &current));
 			if (res)
-				return res;
+				goto out;
 		}
 
 		res = checkp(dwarf_siblingof(&current, &current));
 	}
 
-	return 0;
+	res = 0;
+out:
+	if (state)
+		state->first_list_item = false;
+
+	return res;
 }
 
 static int process_type(struct state *state, struct die *parent,
@@ -256,6 +274,40 @@ static void process_type_attr(struct state *state, struct die *cache,
 	process(cache, "base_type void");
 }
 
+static void process_list_comma(struct state *state, struct die *cache)
+{
+	if (state->first_list_item) {
+		state->first_list_item = false;
+	} else {
+		process(cache, " ,");
+		process_linebreak(cache, 0);
+	}
+}
+
+/* Comma-separated with DW_AT_type */
+static void __process_list_type(struct state *state, struct die *cache,
+				Dwarf_Die *die, const char *type)
+{
+	const char *name = get_name_attr(die);
+
+	process_list_comma(state, cache);
+	process(cache, type);
+	process_type_attr(state, cache, die);
+	if (name) {
+		process(cache, " ");
+		process(cache, name);
+	}
+}
+
+#define DEFINE_PROCESS_LIST_TYPE(type)                                       \
+	static void process_##type##_type(struct state *state,               \
+					  struct die *cache, Dwarf_Die *die) \
+	{                                                                    \
+		__process_list_type(state, cache, die, #type " ");           \
+	}
+
+DEFINE_PROCESS_LIST_TYPE(formal_parameter)
+
 /* Container types with DW_AT_type */
 static void __process_type(struct state *state, struct die *cache,
 			   Dwarf_Die *die, const char *type)
@@ -290,6 +342,29 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static void __process_subroutine_type(struct state *state, struct die *cache,
+				      Dwarf_Die *die, const char *type)
+{
+	process(cache, type);
+	process(cache, " (");
+	process_linebreak(cache, 1);
+	/* Parameters */
+	check(process_die_container(state, cache, die, process_type,
+				    match_formal_parameter_type));
+	process_linebreak(cache, -1);
+	process(cache, ")");
+	process_linebreak(cache, 0);
+	/* Return type */
+	process(cache, "-> ");
+	process_type_attr(state, cache, die);
+}
+
+static void process_subroutine_type(struct state *state, struct die *cache,
+				    Dwarf_Die *die)
+{
+	__process_subroutine_type(state, cache, die, "subroutine_type");
+}
+
 static void process_base_type(struct state *state, struct die *cache,
 			      Dwarf_Die *die)
 {
@@ -360,8 +435,11 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(rvalue_reference)
 	PROCESS_TYPE(shared)
 	PROCESS_TYPE(volatile)
+	/* Subtypes */
+	PROCESS_TYPE(formal_parameter)
 	/* Other types */
 	PROCESS_TYPE(base)
+	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
 	default:
 		debug("unimplemented type: %x", tag);
@@ -391,7 +469,7 @@ static void process_symbol(struct state *state, Dwarf_Die *die,
 static int __process_subprogram(struct state *state, struct die *cache,
 				Dwarf_Die *die)
 {
-	process(cache, "subprogram");
+	__process_subroutine_type(state, cache, die, "subprogram");
 	return 0;
 }
 
diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
index 832d05b4fc1c..0746a36f4924 100644
--- a/scripts/gendwarfksyms/gendwarfksyms.h
+++ b/scripts/gendwarfksyms/gendwarfksyms.h
@@ -60,6 +60,7 @@ extern int dump_dies;
 #define checkp(expr) __check(expr, __res < 0)
 
 /* Consistent aliases (DW_TAG_<type>_type) for DWARF tags */
+#define DW_TAG_formal_parameter_type DW_TAG_formal_parameter
 #define DW_TAG_typedef_type DW_TAG_typedef
 
 /*
@@ -154,6 +155,9 @@ void die_map_free(void);
 struct state {
 	struct symbol *sym;
 	Dwarf_Die die;
+
+	/* List expansion */
+	bool first_list_item;
 };
 
 typedef int (*die_callback_t)(struct state *state, struct die *cache,
-- 
2.47.1.613.gc27f4b7a9f-goog

