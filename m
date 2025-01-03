Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FFC1BEF89
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jan 2025 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937151; cv=none; b=cCJtTcO18Meil4bSgxFIf7SqQa0xc0f0M7C0WRMHH0S6F4Z4Sa2tagrPeqbWeUZPvfbrPsUkyASJ+vYtOs5gGBwAJU74C3dk51riMFnExntO67PwHGUzQCj2aPAkZOTU746/bkFSJKq74x/D23z26p3CAWkMbI2IJ4RCPZX3Ers=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937151; c=relaxed/simple;
	bh=V88Ux5YpLtipLnwT7oAorrJvHrfCrHoGnWDZa7njhBA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GBy7z4M8aP0UMPj55uWzshKlFPcYhZYMInsCjWSw9k3cHPqYzJSA8kjCNX+bXcaVsamD8Lq3hqepOYocl2x5jJJl62T/QITdUF32nYNQXZQ6ArUBDr1va5b8ZuDKKj+6wgurmXMNgy0tPCUCcLDPOmlihcMt8fAl2tPJdY1mFHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CuLldDum; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CuLldDum"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so17012430a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Jan 2025 12:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937146; x=1736541946; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=12wMWYmdUy+3imKc/VOk9UykTDeV6/VQokbuwTAWfVw=;
        b=CuLldDumKynO2wrmBWnrVjZG8g2FFtyeVJav+OgJldr8b6fGv0W1TcXwdoT6Iu+63j
         bE+2S5wBLlSQ1XWAaZ7efPTav1R2/CoP0FKluFm79GkBPYDvBCelqCAWW5Qb0tkJo0BM
         j8nGUJhlDYPYLqPz0yHpXSNvX62pcjBjAFXRSbQhv6+c0w9mcyhrSViWFrXqzLRxeIBx
         Df4oAA3oyauFpERj7vJNLMY7sZ0etfoNhH65X3EIftV+bBs4rxDayQ8DXsRPObI9sNCq
         WrxPFDFbtE2RSH0Xv/gYGXSP2xjlWQFBQ31CTjUBuunTHHKfVI3ZY/VkdOkV8Ael3qpQ
         iJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937146; x=1736541946;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12wMWYmdUy+3imKc/VOk9UykTDeV6/VQokbuwTAWfVw=;
        b=C7gEG3PrU+2v+ZFL62/GsJih5CenC2bJbkU5vboG+02Dmnth7E3RngoJd7ffBQb/hv
         kbkYXqptmgOO5eoD9s7Z3PWTJgr2NyVLFv2HDHu2UQTlyQvhzpzr2BEZpZLpvVGrIYlk
         Gg/nToz3rgmrWlfvIHwt8z7JBuDUrHShp9X8+vBfucNp3umrjWc+yfrhJwzMsgoflP07
         sQwxgsDslHWGDaNBwFP0lT1oVfI3gwNPH+Rpxoi0AjBfD0396JRWXUSpfUL6+uJdJ4BA
         UPYs5d5Up/OL9+9yS46vthVeFc/3O4m+v+hFNIRjJZkLqDOw/iQCjKfuNKqQ9o0Ewoyb
         i6aA==
X-Forwarded-Encrypted: i=1; AJvYcCUNs6aSIOxN3wVMiqESCq3B5s63mQFt0yUKQu+Z2gj6jAri6xQknJKChcBM+c0I9/JvKAs/MhFsSutXYldX2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF/TiIS9JBmLJOvVgP8MlbXsZXFXVMDgz0h31FNV7eNSjKhTKl
	7R3ydUrTs9INHiznubiquw5STnknvQxLOAKHhmwz9AvOkBLvdIeJFtU07I7HGFY74NbWwjukt9r
	5Fpk017p2DgPsu4ALV5meiHfmUA==
X-Google-Smtp-Source: AGHT+IHdfVcKVoPiPlpiDb0DCfsPBeLtuqfqmnxj7xMZGx9Qm1K0+hUlDTztZt4v1TmPArak9C3LMWmStqR6NYxUgyQ=
X-Received: from pfbbw26.prod.google.com ([2002:a05:6a00:409a:b0:725:d8bc:33e1])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:808f:b0:727:64c8:2c44 with SMTP id d2e1a72fcca58-72abdeaab15mr73526380b3a.19.1735937146085;
 Fri, 03 Jan 2025 12:45:46 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:29 +0000
In-Reply-To: <20250103204521.1885406-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103204521.1885406-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300; i=samitolvanen@google.com;
 h=from:subject; bh=V88Ux5YpLtipLnwT7oAorrJvHrfCrHoGnWDZa7njhBA=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPqnvp/H9tv5kvenc6S9TLjAISJ2d27a1NzJd4Onzq
 8Lz2vjmd5SyMIhxMMiKKbK0fF29dfd3p9RXn4skYOawMoEMYeDiFICJFEky/E+av5zp04GW1VO1
 Lr5uDEvwMutYwf3cXyFQIue+UEeCzQaGf6aFfMlHfp+6cNRffErq62D21rLEq10/AzTLS5umOqm /ZAIA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-27-samitolvanen@google.com>
Subject: [PATCH v8 07/18] gendwarfksyms: Expand array_type
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

Add support for expanding DW_TAG_array_type, and the subrange type
indicating array size.

Example source code:

  const char *s[34];

Output with --dump-dies:

  variable array_type[34] {
    pointer_type {
      const_type {
        base_type char byte_size(1) encoding(6)
      }
    } byte_size(8)
  }

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/dwarf.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
index 7d8a4eb6c387..46ce17b2459b 100644
--- a/scripts/gendwarfksyms/dwarf.c
+++ b/scripts/gendwarfksyms/dwarf.c
@@ -220,6 +220,7 @@ DEFINE_PROCESS_UDATA_ATTRIBUTE(encoding)
 	}
 
 DEFINE_MATCH(formal_parameter)
+DEFINE_MATCH(subrange)
 
 bool match_all(Dwarf_Die *die)
 {
@@ -342,6 +343,33 @@ DEFINE_PROCESS_TYPE(shared)
 DEFINE_PROCESS_TYPE(volatile)
 DEFINE_PROCESS_TYPE(typedef)
 
+static void process_subrange_type(struct state *state, struct die *cache,
+				  Dwarf_Die *die)
+{
+	Dwarf_Word count = 0;
+
+	if (get_udata_attr(die, DW_AT_count, &count))
+		process_fmt(cache, "[%" PRIu64 "]", count);
+	else if (get_udata_attr(die, DW_AT_upper_bound, &count))
+		process_fmt(cache, "[%" PRIu64 "]", count + 1);
+	else
+		process(cache, "[]");
+}
+
+static void process_array_type(struct state *state, struct die *cache,
+			       Dwarf_Die *die)
+{
+	process(cache, "array_type");
+	/* Array size */
+	check(process_die_container(state, cache, die, process_type,
+				    match_subrange_type));
+	process(cache, " {");
+	process_linebreak(cache, 1);
+	process_type_attr(state, cache, die);
+	process_linebreak(cache, -1);
+	process(cache, "}");
+}
+
 static void __process_subroutine_type(struct state *state, struct die *cache,
 				      Dwarf_Die *die, const char *type)
 {
@@ -437,7 +465,9 @@ static int process_type(struct state *state, struct die *parent, Dwarf_Die *die)
 	PROCESS_TYPE(volatile)
 	/* Subtypes */
 	PROCESS_TYPE(formal_parameter)
+	PROCESS_TYPE(subrange)
 	/* Other types */
+	PROCESS_TYPE(array)
 	PROCESS_TYPE(base)
 	PROCESS_TYPE(subroutine)
 	PROCESS_TYPE(typedef)
-- 
2.47.1.613.gc27f4b7a9f-goog

