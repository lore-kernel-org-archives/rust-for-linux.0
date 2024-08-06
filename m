Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CF1741D2
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 21:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979283; cv=none; b=RIewy/1tY2SBZZnXVt3CyqsI2q6MZ7qRxnUxkCU5Kr86Vnb9xWtwutt4gESPjh8R6dSJ2Dq5wehqiSzDMQHHskINRDqGFbGhoNZB7jOEsxEyorM5Sy414eQtke+fsiS9LVA2F51ff3aLSpP/0chIQjjUklhKhHwIbqtF2tkE6S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979283; c=relaxed/simple;
	bh=6GqSMULtD4el151RcDItMEF6Lt50YlB/q7Pl2DyHeAM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=triB7vTYxtfQqz3YSsZQhTCw7l9mRICPCBmnNy15z1rrpSQll1RVY1CICD8n1RlNTla+V7mazkEB8akKX0iOXZM3pTD1ITPfAqNkS5PP1s0nAqVf3rn7QPPafFPRcq055LOEwuxIgnVBYSey26WA5lJwrFwpH0KMIG/8fkoAoB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D9whd75a; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D9whd75a"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-664916e5b40so4050927b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 14:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979281; x=1723584081; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ3gIDpzvqifWGJTrfh1KRlyB6JYqqa8tRhgZU97bFA=;
        b=D9whd75amNQnRipHcMezPpPIHAcVKP4b0VeRdclHAcV7uFKuGdScMh9wDpGLiYFiaa
         zFEWltPpNcd5/Fih+fIFsGqlLa3OJI4alRfJy3XOa/bysydrFOHZpiPSc58GyR7TUxMt
         HP7N/l0J0IJrjGcfCJCZ46NexHwLJ/Hb02puo1P1GweRxbUWfrIVO2nkEVow2ck7TDKo
         a4/ws5TzaQhL0T5f3PPm92onlOMktY41pjJuchxrCMQcz+3lywldsnSHpNCGdUVE7JZY
         KhbBatiZOovw/f94CUYBshamY1CUAf/Fq4CnaY1F+AMCEmlAONhaIf/cJh6Gj+YDy1TQ
         hJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979281; x=1723584081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ3gIDpzvqifWGJTrfh1KRlyB6JYqqa8tRhgZU97bFA=;
        b=d0DyPkoJoeBazEhCqjNj8OA7/tHK5/Lp74djHb2edCDTivjFT9nixngMZ+G2dxuaZ4
         racosS0A2+h0DWaaNxjWEQMxBLtsSjw1WLrapGDwlwJg4uMy0fFwnIJT+L8V+/qpEeEf
         bVhUei+C/xOS7TTRAXiRomEWVnLGcPRCzPcLRGBZd/HSgXMB+6eTh9DviAp0e62H+ljF
         3REliO1tCuaWnufHDdSJTbi02hh7bVY74ubVsAY/3les4PQeCd1HjIq5BSLYeMvo27ck
         nKHJwBj3NO8YGTdmkGLplaFRMYnca1HryQmijgstL++gRXixm/U6BR8Pv2D9pA3TKcdC
         6rYg==
X-Forwarded-Encrypted: i=1; AJvYcCV+TyBKhbU+C9bUQ/rX3LQdQjfrcxJZIydwjU4W+Ondq822uDJv2gTP69BZu1+qWuXVFz3zX/O8i1xMccYQZXNWK3D1n57oQjL8TZuBJwg=
X-Gm-Message-State: AOJu0YyV0kSfZnn3E34ca95Zm6oAXVbCPhdsqbQu+mfDhV93AVucBOcT
	8tfHNkoGtw0PB8cQanyuXeOssLXErdVwzhsFyAIH3P2v4xofYkzQdV1YbYpWCjFivvuHFTMOBza
	tkQ1REw==
X-Google-Smtp-Source: AGHT+IG4aq7G8KmkD7iN5WibU+xEj88q/B5q5piN0dKYK4ohf6OT5yqQNxgPNSwh7gEkBbs93toGEJAb8w4p
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a0d:f143:0:b0:665:24b0:e936 with SMTP id
 00721157ae682-6991404e2b7mr1487b3.4.1722979280882; Tue, 06 Aug 2024 14:21:20
 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:31 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-6-mmaurer@google.com>
Subject: [PATCH v3 05/16] module: Factor out elf_validity_cache_index_info
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Centralize .modinfo detection and property validation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 82 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 14 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 252cfa9eee67..61325a767645 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -195,6 +195,38 @@ static unsigned int find_sec(const struct load_info *info, const char *name)
 	return 0;
 }
 
+/**
+ * find_any_unique_sec() - Find a unique section index by name
+ * @info: Load info for the module to scan
+ * @name: Name of the section we're looking for
+ *
+ * Locates a unique section by name. Ignores SHF_ALLOC.
+ *
+ * Return: Section index if found uniquely, zero if absent, negative count
+ *         of total instances if multiple were found.
+ */
+static int find_any_unique_sec(const struct load_info *info, const char *name)
+{
+	unsigned int idx;
+	unsigned int count = 0;
+	int i;
+
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		if (strcmp(info->secstrings + info->sechdrs[i].sh_name,
+			   name) == 0) {
+			count++;
+			idx = i;
+		}
+	}
+	if (count == 1) {
+		return idx;
+	} else if (count == 0) {
+		return 0;
+	} else {
+		return -count;
+	}
+}
+
 /* Find a module section, or NULL. */
 static void *section_addr(const struct load_info *info, const char *name)
 {
@@ -1854,6 +1886,39 @@ static int elf_validity_cache_secstrings(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_info() - Validate and cache modinfo section
+ * @info: Load info to populate the modinfo index on.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated
+ *
+ * Checks that if there is a .modinfo section, it is unique.
+ * Then, it caches its index in &load_info->index.info.
+ * Finally, it tries to populate the name to improve error messages.
+ *
+ * Return: %0 if valid, %-ENOEXEC if multiple modinfo sections were found.
+ */
+static int elf_validity_cache_index_info(struct load_info *info)
+{
+	int info_idx;
+
+	info_idx = find_any_unique_sec(info, ".modinfo");
+
+	if (info_idx == 0)
+		/* Early return, no .modinfo */
+		return 0;
+
+	if (info_idx < 0) {
+		pr_err("Only one .modinfo section must exist.\n");
+		return -ENOEXEC;
+	}
+
+	info->index.info = info_idx;
+	/* Try to find a name early so we can log errors with a module name */
+	info->name = get_modinfo(info, "name");
+
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1880,13 +1945,15 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	Elf_Shdr *shdr;
 	int err;
 	unsigned int num_mod_secs = 0, mod_idx;
-	unsigned int num_info_secs = 0, info_idx;
 	unsigned int num_sym_secs = 0, sym_idx;
 
 	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
 		return err;
 	err = elf_validity_cache_secstrings(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_info(info);
 	if (err < 0)
 		return err;
 
@@ -1912,24 +1979,11 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 				   ".gnu.linkonce.this_module") == 0) {
 				num_mod_secs++;
 				mod_idx = i;
-			} else if (strcmp(info->secstrings + shdr->sh_name,
-				   ".modinfo") == 0) {
-				num_info_secs++;
-				info_idx = i;
 			}
 			break;
 		}
 	}
 
-	if (num_info_secs > 1) {
-		pr_err("Only one .modinfo section must exist.\n");
-		goto no_exec;
-	} else if (num_info_secs == 1) {
-		/* Try to find a name early so we can log errors with a module name */
-		info->index.info = info_idx;
-		info->name = get_modinfo(info, "name");
-	}
-
 	if (num_sym_secs != 1) {
 		pr_warn("%s: module has no symbols (stripped?)\n",
 			info->name ?: "(missing .modinfo section or name field)");
-- 
2.46.0.rc2.264.g509ed76dc8-goog

