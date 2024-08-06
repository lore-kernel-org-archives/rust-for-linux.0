Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD25176AA1
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Aug 2024 21:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979285; cv=none; b=a/qQCdjH8SHCgOfdUrDcV7sen0nPMglkXbCux5Y12ztD7LMu7xhRKyOtT9XBpHH0nw3U5/C8oaLl+zcnQsg0dG8id3cq5f4zX/Mxmyp7ITANuzVlLwWLApzCUEtZEeSnhuzOjUhjW6CBGIzNmRoGUEA6UIlcnl27m1xjIqB63SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979285; c=relaxed/simple;
	bh=DpODGGDdw4VGENbXmwIPTQlzlI8dT45WdYd+kuaOmaY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mJaVYn+0blKvH3M8R9XUQeiZ3KHWTeGY8KreEuAzPpta1BJGCubANPoP41KyZAK7x667HGLwO8I+d+t64RJoKEibUISZnYWg6wblNrgSUDodMBun5pUK9n79T3Yr2xEZFWO5iaGJbuCdJuBd7jqbPMPZRJoTmRQDAwlpESIDuBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wI2Hp3BO; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wI2Hp3BO"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-664b7a67ad4so24086727b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Aug 2024 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722979283; x=1723584083; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGjn9Z6t3I+4/9jyC+rVgONUQ3rpezka6Bxop+Eg6Nw=;
        b=wI2Hp3BOY1qmZ3v9idf6u0HoMSIkLAJ/72fakcvQIdx+UIzPFWZps+WweCjhOfzofe
         krFUwTcs+eblsw+PM0DLXY+BtAs7Zdf7Hf/YQTvHYGTeFDvCedzqzd8nGwQlQPZ3Tf99
         AJpn7PXvYlld/lYwB1nMpAhG4NXjt2NcLmJfGg1HQjB8Xcmt6rHfvSfLvowYco4YKZ5f
         j9Ww+TdXZUYIvmy2/lZ0ntLsgXXmzmOYrPciLIL/JkAxQUfZmirLHJHqelgIu8oqQydm
         IgjOeZqKVl2NZn6NY0jxfkz6EnxogLLNFuWvjABd/qBdK2k+4eRXi8o7Z6OdKUXa2RlH
         H+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722979283; x=1723584083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGjn9Z6t3I+4/9jyC+rVgONUQ3rpezka6Bxop+Eg6Nw=;
        b=izEsQ6m0GptN5pPkxLGPCFbSnL+GUEzpX6TTHYqNdFbY229B1dli4RxArjRYKCOEvJ
         v8eQCAtAJ/NcLoYKzJGYeiOLxxekNmYMvw2vGdMUbD7dZus+DX87USExqBSL2xddVtar
         /S3VeumBgEdEquFkjeYG57dfDb8F1fxrdumNFdKs54VDS8qhidSFyN1ZQEgOeBTVrBs+
         PS5+7cm+UOs8rQNdFbcl+UxZTRvuEeOEyCJ8i11UW7bTMs2LE1XxZuYcSQRVqk8eayWT
         Fw/jZ95ST+n0o6Eb/Ryz9qirAj/ZMapdLxDbV85DnHomjXvnFERXxJ+nqyTryQNTsoPZ
         kQkg==
X-Forwarded-Encrypted: i=1; AJvYcCW/oo4yB0Cp5gWG0cHdD26QpYp8i0wjwLT+olftWsHVOMwOru+/jj8Z/615OhlB2kYh/NswyTe9TX/RMFOVoORTmI1AAUQBoJDxzbkhq2o=
X-Gm-Message-State: AOJu0YyBmD931LOs0Fq8x512WqEs4bFYaV9clW5fVTSEsnPxElN4zrdm
	FE7v1NDZ2w3lHt1yAeByIfJOK1K88Gu/IkFpc2Xl7QJKciJctJ6qsAUk2XWGMGLXlbxSq679E1l
	Up5A7ZA==
X-Google-Smtp-Source: AGHT+IFyCeNRyjHnqa3Pr4SiExKUtgZZoTIIoyrrFooy61j333PWvIbMWNrYvZteOAesuBL7Ip+0AcLQbPt0
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:2513:b0:e05:6532:166 with SMTP id
 3f1490d57ef6-e0bde213c22mr58855276.1.1722979282834; Tue, 06 Aug 2024 14:21:22
 -0700 (PDT)
Date: Tue,  6 Aug 2024 21:20:32 +0000
In-Reply-To: <20240806212106.617164-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240806212106.617164-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240806212106.617164-7-mmaurer@google.com>
Subject: [PATCH v3 06/16] module: Factor out elf_validity_cache_index_mod
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

Centralize .gnu.linkonce.this_module detection and property validation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 129 ++++++++++++++++++++++---------------------
 1 file changed, 67 insertions(+), 62 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 61325a767645..281cc1a7dee6 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1919,6 +1919,68 @@ static int elf_validity_cache_index_info(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_mod() - Validates and caches this_module section
+ * @info: Load info to cache this_module on.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated
+ *
+ * The ".gnu.linkonce.this_module" ELF section is special. It is what modpost
+ * uses to refer to __this_module and let's use rely on THIS_MODULE to point
+ * to &__this_module properly. The kernel's modpost declares it on each
+ * modules's *.mod.c file. If the struct module of the kernel changes a full
+ * kernel rebuild is required.
+ *
+ * We have a few expectations for this special section, this function
+ * validates all this for us:
+ *
+ * * The section has contents
+ * * The section is unique
+ * * We expect the kernel to always have to allocate it: SHF_ALLOC
+ * * The section size must match the kernel's run time's struct module
+ *   size
+ *
+ * If all checks pass, the index will be cached in &load_info->index.mod
+ *
+ * Return: %0 on validation success, %-ENOEXEC on failure
+ */
+static int elf_validity_cache_index_mod(struct load_info *info)
+{
+	Elf_Shdr *shdr;
+	int mod_idx;
+
+	mod_idx = find_any_unique_sec(info, ".gnu.linkonce.this_module");
+	if (mod_idx <= 0) {
+		pr_err("module %s: Exactly one .gnu.linkonce.this_module section must exist.\n",
+		       info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	shdr = &info->sechdrs[mod_idx];
+
+	if (shdr->sh_type == SHT_NOBITS) {
+		pr_err("module %s: .gnu.linkonce.this_module section must have a size set\n",
+		       info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	if (!(shdr->sh_flags & SHF_ALLOC)) {
+		pr_err("module %s: .gnu.linkonce.this_module must occupy memory during process execution\n",
+		       info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	if (shdr->sh_size != sizeof(struct module)) {
+		pr_err("module %s: .gnu.linkonce.this_module section size must match the kernel's built struct module size at run time\n",
+		       info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	info->index.mod = mod_idx;
+
+	return 0;
+}
+
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -1944,7 +2006,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	unsigned int i;
 	Elf_Shdr *shdr;
 	int err;
-	unsigned int num_mod_secs = 0, mod_idx;
 	unsigned int num_sym_secs = 0, sym_idx;
 
 	err = elf_validity_cache_sechdrs(info);
@@ -1954,16 +2015,15 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	if (err < 0)
 		return err;
 	err = elf_validity_cache_index_info(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_mod(info);
 	if (err < 0)
 		return err;
 
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &info->sechdrs[i];
-		switch (shdr->sh_type) {
-		case SHT_NULL:
-		case SHT_NOBITS:
-			continue;
-		case SHT_SYMTAB:
+		if (shdr->sh_type == SHT_SYMTAB) {
 			if (shdr->sh_link == SHN_UNDEF
 			    || shdr->sh_link >= info->hdr->e_shnum) {
 				pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
@@ -1973,14 +2033,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 			}
 			num_sym_secs++;
 			sym_idx = i;
-			fallthrough;
-		default:
-			if (strcmp(info->secstrings + shdr->sh_name,
-				   ".gnu.linkonce.this_module") == 0) {
-				num_mod_secs++;
-				mod_idx = i;
-			}
-			break;
 		}
 	}
 
@@ -1996,55 +2048,8 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	info->index.str = shdr->sh_link;
 	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
 
-	/*
-	 * The ".gnu.linkonce.this_module" ELF section is special. It is
-	 * what modpost uses to refer to __this_module and let's use rely
-	 * on THIS_MODULE to point to &__this_module properly. The kernel's
-	 * modpost declares it on each modules's *.mod.c file. If the struct
-	 * module of the kernel changes a full kernel rebuild is required.
-	 *
-	 * We have a few expectaions for this special section, the following
-	 * code validates all this for us:
-	 *
-	 *   o Only one section must exist
-	 *   o We expect the kernel to always have to allocate it: SHF_ALLOC
-	 *   o The section size must match the kernel's run time's struct module
-	 *     size
-	 */
-	if (num_mod_secs != 1) {
-		pr_err("module %s: Only one .gnu.linkonce.this_module section must exist.\n",
-		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
-	}
-
-	shdr = &info->sechdrs[mod_idx];
-
-	/*
-	 * This is already implied on the switch above, however let's be
-	 * pedantic about it.
-	 */
-	if (shdr->sh_type == SHT_NOBITS) {
-		pr_err("module %s: .gnu.linkonce.this_module section must have a size set\n",
-		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
-	}
-
-	if (!(shdr->sh_flags & SHF_ALLOC)) {
-		pr_err("module %s: .gnu.linkonce.this_module must occupy memory during process execution\n",
-		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
-	}
-
-	if (shdr->sh_size != sizeof(struct module)) {
-		pr_err("module %s: .gnu.linkonce.this_module section size must match the kernel's built struct module size at run time\n",
-		       info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
-	}
-
-	info->index.mod = mod_idx;
-
 	/* This is temporary: point mod into copy of data. */
-	info->mod = (void *)info->hdr + shdr->sh_offset;
+	info->mod = (void *)info->hdr + info->sechdrs[info->index.mod].sh_offset;
 
 	/*
 	 * If we didn't load the .modinfo 'name' field earlier, fall back to
-- 
2.46.0.rc2.264.g509ed76dc8-goog

