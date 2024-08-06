Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95E2171675
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979280; cv=none; b=kbFlMuFJZh/4dn0gEZB+gJ3fsC6hdIKhoEc+H+2jYOdaS0IitpYQ+Dcpso0mgJyLMDQeR6sHqVbLC5+sXdTxw47Vo5WkfdFeAxIS6mIylNihnguN4baToNgOCPLI1uOV5iTqpVDmpy3rdNERSQaikg/fiSM9T0BfIx6TPHPiyuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979280; c=relaxed/simple;
	bh=AVuM77XBvRTP7CQN/96dK2QzyY+wZxWUme8oRgVt+OQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S7kQQrBEvYiT09zusbTuILwKRgBXOJzfuZf1Ey4txevJBlwN8hNIjJjGzXIlHXiRDraxwRhlKXjZUttk7GUaReqZyEatDlMfr2MSgNhBiuuPcCtfBKGOKxo0UpQmy8DL/sANYB6SE9zx+lvscjxBp4m9VvE6t4VTLpFNMNWYA9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w1C04Dfb; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w1C04Dfb"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e05e9e4dfbeso1784676276.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 14:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979277; x=1723584077; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cGYSjKifnIb4d4VsO6oPWhpN1+4ZSxOFZf0ATG4/qxc=;
        b=w1C04DfbqFGqRgd9rFSUW7b+OnHqGCoEMJNsNPXldlk/MjtRZxtFxFmn6ryTNbvmXY
         0otSdBDp7zf5kO+M40Ud1heIXl+04wHChIEflTaWY2zOoios7a36GXzOQWkL52DtwzYz
         BZBN0KTeYSEGuvVJDhuagf4QuXRt0pJmAFEdWK08sF9JZsuriw6PYnPTLULn1HDVJpgu
         wOFcrS5nr+Wg6SrqzRDztZXum63D81I1lsV9q8kVFjsFJvSY8uUiCXu0dxpXVQ8Cq8QD
         ccAmnCris34u9oSW9PPY7ibtFn5V4RHT6f2IlB+B3A3dPWwhibkdCJyM0bmmpwUQob8f
         B+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979277; x=1723584077;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGYSjKifnIb4d4VsO6oPWhpN1+4ZSxOFZf0ATG4/qxc=;
        b=noOQLA748lcrtsE8DPYONoFTkyZUkVqSM5wPqDOBwHpVYGueXNb04zhtxj5uAAoy5L
         ZJlFgD45NCP7u2V1+SfGbK9Kmp+PAa9/E59OQ8+BGBhPbdMP4dtPeZ2Zy+/sFYpfrzT1
         EHXG+JjlDAFRVAGToVXznP3fLi8Y+ic1ZU4g1rWhIXo/6WXsrdyPYmt4v4B15MV9A2Q4
         IaYZ2djBi3HBxdrO5DdWgWIHtk6vfNlj4IHgJKe7u9j3TAvvvLp5MkA0Fj4DtIjyj8FE
         GyOIylgp1vL1CzebWlvqWHIsjARXlxwsN2euzc/kMa6bLh6bM7lk1+7TmvaOygPIssUi
         p+sg==
X-Forwarded-Encrypted: i=1; AJvYcCXqG53IKdc6IZmGIZQ+ZAxNQ0FBt5KyBjC52NHmDI8P8FjDt8YyT0XDVxBjKrdQy2lsMOEFbj80Cwua2vOiEF8Za/Kv5Y5TyzPJaiDUnbQ=
X-Gm-Message-State: AOJu0YzZ+RpinEF29w00CXD2WHuUhiaOzGgx9pcPUrEWQdNy4Qk+L16z
	higVbwqcQAyO9Ar4wUsI37GFrvtWClcX646UQd9qtFDF2VPjRmkoWMQx08DaA1mti4ooFLJGbbK
	8GIJBTQ==
X-Google-Smtp-Source: AGHT+IFSYvmkaodRJOM+NJzUc1TZcIArEkVrs4l6TsWHjv221yZbaqYbrPbNVyJZ/JmOpD2YsJPdd4415EZ+
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:118f:b0:e0e:4e5d:c414 with SMTP
 id 3f1490d57ef6-e0e4e5dc564mr88686276.10.1722979276827; Tue, 06 Aug 2024
 14:21:16 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:29 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-4-mmaurer@google.com>
Subject: [PATCH v3 03/16] module: Factor out elf_validity_cache_sechdrs
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

Factor out and document the validation of section headers.

Because we now validate all section offsets and lengths before accessing
them, we can remove the ad-hoc checks.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 125 ++++++++++++++++++++++++++++---------------
 1 file changed, 82 insertions(+), 43 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 1218cc7e1196..c480fd33861a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1708,6 +1708,87 @@ static int elf_validity_ehdr(const struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_sechdrs() - Cache section headers if valid
+ * @info: Load info to compute section headers from
+ *
+ * Checks:
+ *
+ * * ELF header is valid (see elf_validity_ehdr())
+ * * Section headers are the size we expect
+ * * Section array fits in the user provided data
+ * * Section index 0 is NULL
+ * * Section contents are inbounds
+ *
+ * Then updates @info with a &load_info->sechdrs pointer if valid.
+ *
+ * Return: %0 if valid, negative error code if validation failed.
+ */
+static int elf_validity_cache_sechdrs(struct load_info *info)
+{
+	Elf_Shdr *sechdrs;
+	Elf_Shdr *shdr;
+	int i;
+	int err;
+
+	err = elf_validity_ehdr(info);
+	if (err < 0)
+		return err;
+
+	if (info->hdr->e_shentsize != sizeof(Elf_Shdr)) {
+		pr_err("Invalid ELF section header size\n");
+		return -ENOEXEC;
+	}
+
+	/*
+	 * e_shnum is 16 bits, and sizeof(Elf_Shdr) is
+	 * known and small. So e_shnum * sizeof(Elf_Shdr)
+	 * will not overflow unsigned long on any platform.
+	 */
+	if (info->hdr->e_shoff >= info->len
+	    || (info->hdr->e_shnum * sizeof(Elf_Shdr) >
+		info->len - info->hdr->e_shoff)) {
+		pr_err("Invalid ELF section header overflow\n");
+		return -ENOEXEC;
+	}
+
+	sechdrs = (void *)info->hdr + info->hdr->e_shoff;
+
+	/*
+	 * The code assumes that section 0 has a length of zero and
+	 * an addr of zero, so check for it.
+	 */
+	if (sechdrs[0].sh_type != SHT_NULL
+	    || sechdrs[0].sh_size != 0
+	    || sechdrs[0].sh_addr != 0) {
+		pr_err("ELF Spec violation: section 0 type(%d)!=SH_NULL or non-zero len or addr\n",
+		       sechdrs[0].sh_type);
+		return -ENOEXEC;
+	}
+
+	/* Validate contents are inbounds */
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		shdr = &sechdrs[i];
+		switch (shdr->sh_type) {
+		case SHT_NULL:
+		case SHT_NOBITS:
+			/* No contents, offset/size don't mean anything */
+			continue;
+		default:
+			err = validate_section_offset(info, shdr);
+			if (err < 0) {
+				pr_err("Invalid ELF section in module (section %u type %u)\n",
+				       i, shdr->sh_type);
+				return err;
+			}
+		}
+	}
+
+	info->sechdrs = sechdrs;
+
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1737,29 +1818,10 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	unsigned int num_info_secs = 0, info_idx;
 	unsigned int num_sym_secs = 0, sym_idx;
 
-	err = elf_validity_ehdr(info);
+	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
 		return err;
 
-	if (info->hdr->e_shentsize != sizeof(Elf_Shdr)) {
-		pr_err("Invalid ELF section header size\n");
-		goto no_exec;
-	}
-
-	/*
-	 * e_shnum is 16 bits, and sizeof(Elf_Shdr) is
-	 * known and small. So e_shnum * sizeof(Elf_Shdr)
-	 * will not overflow unsigned long on any platform.
-	 */
-	if (info->hdr->e_shoff >= info->len
-	    || (info->hdr->e_shnum * sizeof(Elf_Shdr) >
-		info->len - info->hdr->e_shoff)) {
-		pr_err("Invalid ELF section header overflow\n");
-		goto no_exec;
-	}
-
-	info->sechdrs = (void *)info->hdr + info->hdr->e_shoff;
-
 	/*
 	 * Verify if the section name table index is valid.
 	 */
@@ -1772,11 +1834,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	}
 
 	strhdr = &info->sechdrs[info->hdr->e_shstrndx];
-	err = validate_section_offset(info, strhdr);
-	if (err < 0) {
-		pr_err("Invalid ELF section hdr(type %u)\n", strhdr->sh_type);
-		return err;
-	}
 
 	/*
 	 * The section name table must be NUL-terminated, as required
@@ -1793,18 +1850,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 		goto no_exec;
 	}
 
-	/*
-	 * The code assumes that section 0 has a length of zero and
-	 * an addr of zero, so check for it.
-	 */
-	if (info->sechdrs[0].sh_type != SHT_NULL
-	    || info->sechdrs[0].sh_size != 0
-	    || info->sechdrs[0].sh_addr != 0) {
-		pr_err("ELF Spec violation: section 0 type(%d)!=SH_NULL or non-zero len or addr\n",
-		       info->sechdrs[0].sh_type);
-		goto no_exec;
-	}
-
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &info->sechdrs[i];
 		switch (shdr->sh_type) {
@@ -1823,12 +1868,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 			sym_idx = i;
 			fallthrough;
 		default:
-			err = validate_section_offset(info, shdr);
-			if (err < 0) {
-				pr_err("Invalid ELF section in module (section %u type %u)\n",
-					i, shdr->sh_type);
-				return err;
-			}
 			if (strcmp(info->secstrings + shdr->sh_name,
 				   ".gnu.linkonce.this_module") == 0) {
 				num_mod_secs++;
-- 
2.46.0.rc2.264.g509ed76dc8-goog

