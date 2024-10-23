Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C175A7B8
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 02:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729650703; cv=none; b=e37h0ek2KyOH4NciZAWmplPNCSW/YqGJM4bTR8d8vsnM49pVWwVZXMnfCjk9PSzsJqiED3fE0jaEBmZ661D6Edbqo5PhSJ35+Qn7jNZANTYm1MZrcpqfFdXvW3KM3xku4oVsp2vmdk83zIGhzr2eXji1gAtbh/AEqQYCZRdZwG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729650703; c=relaxed/simple;
	bh=07WOpd6pS8o5NZU76ASGCKbHkL+bpfdBN1VfCi4fstc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eWm4luax2vc0aMmt1xYFu0zvFsmb26XCE91e9boNmf2ldux1gy0FzQ3sVSK14mVe9eomla1BEoewpON0Z3qpW/tuECG8Jz/0PMXNMXR7FokXYdGV1dQlMbzcGlTysuvA8Q0OJvlIEzM4VePDfnPMhQLjyU+SUkUG+BQdiL8gStY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cvmIHT+M; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cvmIHT+M"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2946a143efso727139276.1
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Oct 2024 19:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729650699; x=1730255499; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxsRLY8m7mibDpYpvy5d1k3wVugkJ3p+v8g3CAphG+U=;
        b=cvmIHT+MaVlIIna5vs/wNvrLHiEcMAF/maFctOtm3Km5n5R6EboMi2DKOifs3/10FA
         9Lp/2Se8gzLiYTdpjQC72d4FmB/0tX6ZpoiOQ3X8qcw0InVg9hZTJII7U+aw+DqpFl5Y
         V8nv8PQ+IZPrW8Apif2kNrGGHLCkT1RqKkgB6OpmpHDpxgdfHqqwl0CiksobmPL4Ib8y
         +ErmFOaD6Q4krrS5v9HYPRVFhwHwuKVDXc+w5c1sLDAIqd3EexCVa2tJKxKQI++zdu+9
         AR3CkQAW/75XwOFTcybA4iFp2Jk8qtXHrGer/7HG647xJKpaImIAMYq7qQDYpZdBm6Ur
         azDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729650699; x=1730255499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KxsRLY8m7mibDpYpvy5d1k3wVugkJ3p+v8g3CAphG+U=;
        b=dJklzSmvG0GxaHMydYRbJKdF6EuqhXP3zlcMfqW+OY7onFR39IRKeTqigm3VbIIUKU
         a7YFKDrbv6WLcg69GlwkrbQt7HeWrpLatx7SWNqtUsw+vslfatQLp1OV8Qtdfm9leJJC
         v+oP8iRUFDxXZ9k0RCXQbbijmLHue7RIDBVIWdtEJuvyjhojau6nhxscn6xVDqBUZ05V
         7vQxMhLiD04ClxvttTH5/twzWL8H4i/WTUDyCUtkJ1Y0Nb/5Qw0Nqh5/AofDVDBa9ivA
         Xje4FZbzCDe4o5kqGOrUEFDkwy1wlFK4AootpCBCSXJeAWqhse9VfOl5XnTeFIpXaHjs
         2mdg==
X-Forwarded-Encrypted: i=1; AJvYcCXQG/DHNNd/vF7Nx/RBpXDczdUTflz7LoSTEWj9ne7QTOovQoneW14s8rboPheI07v5wFKlxQ2ztc0HArDs1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHO2DWCWx0se4DpafovOWNIXwAv+f3ORuGmiLqXCyuPWSXPfsq
	Bu2xn+TEqzip4t79Kx5I34VnkW46B+xeoWilT1bxXg22E+EQf3N6P5ey7qhZz5Vt0o8fLskSZqB
	r2AXG9w==
X-Google-Smtp-Source: AGHT+IFpMVHCkR8AgZ605KZf1LWCU8pSaxNNXtSEGQvKuMHsAaz3TG1Yrn+f12iwiZICTNeQSH73fL+54Nxw
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:838f:0:b0:e29:7454:e773 with SMTP id
 3f1490d57ef6-e2e248357femr28567276.5.1729650699326; Tue, 22 Oct 2024 19:31:39
 -0700 (PDT)
Date: Wed, 23 Oct 2024 02:31:29 +0000
In-Reply-To: <20241023-extended-modversions-v7-0-339787b43373@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241023-extended-modversions-v7-2-339787b43373@google.com>
Subject: [PATCH v7 2/3] modpost: Produce extended MODVERSIONS information
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Generate both the existing modversions format and the new extended one
when running modpost. Presence of this metadata in the final .ko is
guarded by CONFIG_EXTENDED_MODVERSIONS.

We no longer generate an error on long symbols in modpost if
CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
encoded in the extended section. These symbols will be skipped in the
previous encoding. An error will still be generated if
CONFIG_EXTENDED_MODVERSIONS is not set.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig    | 10 ++++++++
 scripts/Makefile.modpost |  1 +
 scripts/mod/modpost.c    | 65 +++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index e6b2427e5c190aacf7b9c5c1bb57fca39d311564..a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -208,6 +208,16 @@ config ASM_MODVERSIONS
 	  assembly. This can be enabled only when the target architecture
 	  supports it.
 
+config EXTENDED_MODVERSIONS
+	bool "Extended Module Versioning Support"
+	depends on MODVERSIONS
+	help
+	  This enables extended MODVERSIONs support, allowing long symbol
+	  names to be versioned.
+
+	  The most likely reason you would enable this is to enable Rust
+	  support. If unsure, say N.
+
 config MODULE_SRCVERSION_ALL
 	bool "Source checksum for all modules"
 	help
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 44936ebad161e914cbcc40ac74a2d651596d7b07..765da63d592be56fe93c0f4a35f1bfbcb924541a 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -43,6 +43,7 @@ MODPOST = scripts/mod/modpost
 modpost-args =										\
 	$(if $(CONFIG_MODULES),-M)							\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
+	$(if $(CONFIG_EXTENDED_MODVERSIONS),-x)						\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
 	$(if $(KBUILD_MODPOST_WARN),-w)							\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a5993dbe456702fec0652a967ee86..bd38f33fd41fbd98bce34f8924b2fb0ac04297ee 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -32,6 +32,8 @@ static bool module_enabled;
 static bool modversions;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static bool all_versions;
+/* Is CONFIG_EXTENDED_MODVERSIONS set? */
+static bool extended_modversions;
 /* If we are modposting external module set to 1 */
 static bool external_module;
 /* Only warn about unresolved symbols */
@@ -1817,6 +1819,52 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 	}
 }
 
+/**
+ * Record CRCs for unresolved symbols, supporting long names
+ */
+static void add_extended_versions(struct buffer *b, struct module *mod)
+{
+	struct symbol *s;
+
+	if (!extended_modversions)
+		return;
+
+	buf_printf(b, "\n");
+	buf_printf(b, "static const s32 ____version_ext_crcs[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_crcs\") = {\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t%#8x,\n", s->crc);
+	}
+	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const char ____version_ext_names[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_names\") =\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 * We need to skip its name too, as the indexes in
+			 * both tables need to align.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t\"%s\\0\"\n", s->name);
+	}
+	buf_printf(b, ";\n");
+}
+
 /**
  * Record CRCs for unresolved symbols
  **/
@@ -1840,9 +1888,14 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+			if (extended_modversions)
+				/* this symbol will only be in the extended info */
+				continue;
+			else {
+				error("too long symbol \"%s\" [%s.ko]\n",
+				      s->name, mod->name);
+				break;
+			}
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
 			   s->crc, s->name);
@@ -1972,6 +2025,7 @@ static void write_mod_c_file(struct module *mod)
 	add_header(&buf, mod);
 	add_exported_symbols(&buf, mod);
 	add_versions(&buf, mod);
+	add_extended_versions(&buf, mod);
 	add_depends(&buf, mod);
 	add_moddevtable(&buf, mod);
 	add_srcversion(&buf, mod);
@@ -2130,7 +2184,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2179,6 +2233,9 @@ int main(int argc, char **argv)
 		case 'd':
 			missing_namespace_deps = optarg;
 			break;
+		case 'x':
+			extended_modversions = true;
+			break;
 		default:
 			exit(1);
 		}

-- 
2.47.0.105.g07ac214952-goog

