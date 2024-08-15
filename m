Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26DE7E591
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 17:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723743564; cv=none; b=uGBgl9gBeCyFMJdc/42bBHNyJ203V9RCp5Xubn6t9qWqQSuajFzDf3x6wFPhfgZTC+J/PGAe8GYpcbbfamV95GDC6SD2at69D5YHh8mamror6QnKbeG1ZCtDq1IFmtqF0MRiiZAwCVL8fENGZRdC4BkDvNQY3/aFX0MLXnkz4lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723743564; c=relaxed/simple;
	bh=wAhZomTPmGa8ryvnda7uC8r92v4iCWnU4YEmuivMqjE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CUP/GvLso7xFTL2SdmPCJ3sxHUIZxG6ALaSKgUy1SRboEbgut5ACZjwZsZmb+1KDn0Xhr2OdaIyP3g96fZvhd6eg0g3+Me7olX3iu6mPEF5cyIVB8DMD+EhBVyo1pugmd6k64vnCu3+fCeHa3Lbn4P720xIQKaGfnderQJIpFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ixZkCAkd; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ixZkCAkd"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-650fccfd1dfso19698857b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 10:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723743562; x=1724348362; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zxg9NiKzqD/TwsM/Agf4zY5teCnPcigN7w5EkB7vCvE=;
        b=ixZkCAkdyJ4ZF6Ij6tAB5MLlutGqZgqAW39/NJ8zXj88XLzZLC47nKFLnCjOhmoUT9
         /OWcmtzRmyO5Tqlc0M0+cko6A8inJqT3GKdQTXkv2LAgVtC35RRexnKpueeGOPFuNF36
         Zq0B1J41Ho0y9M59t3HpsjEmw2kguoEliOrej6XlTFmmttb9yasRYy+FkHzyty8tiJ9B
         fwjBx8XDrf5wbl0SP3h3HRRNgqtpmSEOeHkAWViRrYDNiL7rlT74ZwmefGMf6avc8aDi
         kWZ8fm1x2RDZc2wZlGVWdJxpykgS9St6zlZLGQOD1qV1UaKpTvJ96RkJVyZNJf9LbFMX
         xDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723743562; x=1724348362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxg9NiKzqD/TwsM/Agf4zY5teCnPcigN7w5EkB7vCvE=;
        b=luYgnZv3CfRi/FayCOrRbN9lTgQBe9Ouug07tDP2p2RWd2WMIkcKTmAWgSx0SM+iaX
         dRgDOGCV3nVY+LSVveO+TyNZSo/zwHMblzVilxwdBUC9IjutdCM0iM37gf9W7yjGAQu/
         IDBXL9rOEn++kUtnmn4phX4X43XyMDahZ8HvIaWT1YmXzdqtrCXuc6RON6uwJp3hnK5A
         sWDOhol1jz71h+9tuVyOS1rdj5kdzGf+wszGAfX1vpldq0pS6XXP5xLkLDqW6Kxe6zaS
         8mBcDxwf0/kCJrRIgN//jkrTEG+ov5kWKQrNsps78bkQIP5wvZrNrFVKOy3GO5iQFbn+
         7Log==
X-Forwarded-Encrypted: i=1; AJvYcCVz2qQjvBaa1vzPrX43NhPBtbkfmszKZjbgup2Y75Hk+Cw3HJH4VZxq3ZEDpWROHrH6A4vuDhzjVGFvXagiXZjGFjzitesQposvpWod8to=
X-Gm-Message-State: AOJu0Ywbjv9CHE5ky2NPjNnlcSi0twEhvRGnL+urG+Xy3rqK8WkhDn28
	0PaNXG+XUY1kqzbKuYnoDE3i50zCcSEU5s3TYIYDZ9U3/ZhhuqpWd3UBtVpBInI31wVjjCUc6Fe
	ByRZIVJdL5g62EM1yTQ9DSSMh2w==
X-Google-Smtp-Source: AGHT+IEm2CkybTf4Spyo/MEFaqpksIWJ+D50fZxqYSU9rkny7yJCVb9f0Vx4fBHM5Be0k5Bc4nMPKMdD8tOzCxicIIM=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:b049:0:b0:62c:67f4:4f5 with SMTP
 id 00721157ae682-6b1bc3f9536mr38907b3.9.1723743562048; Thu, 15 Aug 2024
 10:39:22 -0700 (PDT)
Date: Thu, 15 Aug 2024 17:39:09 +0000
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4989; i=samitolvanen@google.com;
 h=from:subject; bh=wAhZomTPmGa8ryvnda7uC8r92v4iCWnU4YEmuivMqjE=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBmvj04SCNuEsbV9MTLnBds7D9v786rWkJb6EcPG
 a6z0E0GsvqJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZr49OAAKCRBMtfaEi7xW
 7k5PC/98UAwkvYp0/qJJ5oId54CkqC3M3LFfbK9ZnGTiOW1giKs5ZBZG0ZqV74WC4cHKA8Z1I+4
 PT71JPV4gtivRDmpW6IZwt9J0KNGDn2GIoHBer5yePFvSbqXBDls34A8d0OnDCKPnoIy4Kg5ISo
 cmRogwN7ABCvaQKO0Vw+IJxL0Yyq8wXjTI0ZoTeHkXPv3fHVxvnexvaKnkQ7rMNSLFp0Sb9SdXT
 65ZFtkL61/K0DozliiRgTuNz2RNgwtyqs6gCbdn4J/1QNE7qgNLIvz4fevZi8j5A0pc9AbROhGs
 k91aBFnd5/bU5GslTX8XgofY4mqvCKSbOIqoTvr8CZL598auKvH7idFIOcfvoFcRVQanLkH0sgB
 sPeRaTfUF9bQjG2h/uoBn+YiKCDlXMCoy80iteYmyviXwD3ccyuVfdfockJ2P22uZgDEPQWeQw2 HwgHgltUS6CuI19QCKn0nCi3RrJO00a9HpskHvWnghNEtnWvbEuzoHHCTvI9JPJEMPjVI=
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240815173903.4172139-26-samitolvanen@google.com>
Subject: [PATCH v2 05/19] gendwarfksyms: Expand base_type
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

Start making gendwarfksyms more useful by adding support for
expanding DW_TAG_base_type types and basic DWARF attributes.

Example:

  $ echo loops_per_jiffy | \
      scripts/gendwarfksyms/gendwarfksyms --debug vmlinux.o
  ...
  gendwarfksyms: process_exported_symbols: loops_per_jiffy
  variable base_type unsigned long byte_size(8) encoding(7);
  ...

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/gendwarfksyms/dwarf.c | 121 +++++++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 956b30224316..a37c9049d18e 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -5,6 +5,17 @@
 
 #include "gendwarfksyms.h"
 
+#define DEFINE_GET_ATTR(attr, type)                                    \
+	static bool get_##attr##_attr(Dwarf_Die *die, unsigned int id, \
+				      type *value)                     \
+	{                                                              \
+		Dwarf_Attribute da;                                    \
+		return dwarf_attr(die, id, &da) &&                     \
+		       !dwarf_form##attr(&da, value);                  \
+	}
+
+DEFINE_GET_ATTR(udata, Dwarf_Word)
+
 static bool get_ref_die_attr(Dwarf_Die *die, unsigned int id, Dwarf_Die *value)
 {
 	Dwarf_Attribute da;
@@ -60,6 +71,74 @@ static int process(struct state *state, const char *s)
 	return 0;
 }
 
+#define MAX_FMT_BUFFER_SIZE 128
+
+static int process_fmt(struct state *state, const char *fmt, ...)
+{
+	char buf[MAX_FMT_BUFFER_SIZE];
+	va_list args;
+	int res;
+
+	va_start(args, fmt);
+
+	res = checkp(vsnprintf(buf, sizeof(buf), fmt, args));
+	if (res >= MAX_FMT_BUFFER_SIZE - 1) {
+		error("vsnprintf overflow: increase MAX_FMT_BUFFER_SIZE");
+		res = -1;
+	} else {
+		res = check(process(state, buf));
+	}
+
+	va_end(args);
+	return res;
+}
+
+/* Process a fully qualified name from DWARF scopes */
+static int process_fqn(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die *scopes = NULL;
+	const char *name;
+	int res;
+	int i;
+
+	res = checkp(dwarf_getscopes_die(die, &scopes));
+	if (!res) {
+		name = get_name(die);
+		name = name ?: "<unnamed>";
+		return check(process(state, name));
+	}
+
+	for (i = res - 1; i >= 0; i--) {
+		if (dwarf_tag(&scopes[i]) == DW_TAG_compile_unit)
+			continue;
+
+		name = get_name(&scopes[i]);
+		name = name ?: "<unnamed>";
+		check(process(state, name));
+		if (i > 0)
+			check(process(state, "::"));
+	}
+
+	free(scopes);
+	return 0;
+}
+
+#define DEFINE_PROCESS_UDATA_ATTRIBUTE(attribute)                         \
+	static int process_##attribute##_attr(struct state *state,        \
+					      Dwarf_Die *die)             \
+	{                                                                 \
+		Dwarf_Word value;                                         \
+		if (get_udata_attr(die, DW_AT_##attribute, &value))       \
+			check(process_fmt(state,                          \
+					  " " #attribute "(%" PRIu64 ")", \
+					  value));                        \
+		return 0;                                                 \
+	}
+
+DEFINE_PROCESS_UDATA_ATTRIBUTE(alignment)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(byte_size)
+DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
+
 bool match_all(Dwarf_Die *die)
 {
 	return true;
@@ -81,6 +160,44 @@ int process_die_container(struct state *state, Dwarf_Die *die,
 	return 0;
 }
 
+static int process_type(struct state *state, Dwarf_Die *die);
+
+static int process_type_attr(struct state *state, Dwarf_Die *die)
+{
+	Dwarf_Die type;
+
+	if (get_ref_die_attr(die, DW_AT_type, &type))
+		return check(process_type(state, &type));
+
+	/* Compilers can omit DW_AT_type -- print out 'void' to clarify */
+	return check(process(state, "base_type void"));
+}
+
+static int process_base_type(struct state *state, Dwarf_Die *die)
+{
+	check(process(state, "base_type "));
+	check(process_fqn(state, die));
+	check(process_byte_size_attr(state, die));
+	check(process_encoding_attr(state, die));
+	return check(process_alignment_attr(state, die));
+}
+
+static int process_type(struct state *state, Dwarf_Die *die)
+{
+	int tag = dwarf_tag(die);
+
+	switch (tag) {
+	case DW_TAG_base_type:
+		check(process_base_type(state, die));
+		break;
+	default:
+		debug("unimplemented type: %x", tag);
+		break;
+	}
+
+	return 0;
+}
+
 /*
  * Exported symbol processing
  */
@@ -91,7 +208,9 @@ static int process_subprogram(struct state *state, Dwarf_Die *die)
 
 static int process_variable(struct state *state, Dwarf_Die *die)
 {
-	return check(process(state, "variable;\n"));
+	check(process(state, "variable "));
+	check(process_type_attr(state, die));
+	return check(process(state, ";\n"));
 }
 
 static int process_symbol_ptr(struct state *state, Dwarf_Die *die)
-- 
2.46.0.184.g6999bdac58-goog

