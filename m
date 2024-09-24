Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559AB1ACE07
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 21:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212849; cv=none; b=rR3VN9BqJCtt1JhCw7dy8dVUdpxz/kisu4WaKfjqKEYcG13Ro9X0GaMnwi+vYN40Qv810BKOBhWzfQtjGOIayWDV+M+qqu2nXKDV16C8tk/2ECqrUPQJpBpNN76I4p3NBdTmCL4kPGQ7Dd+wgfdhbCBPYqMD26Zjy+Q6MNGcvVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212849; c=relaxed/simple;
	bh=hPcayIG4Zzk7TfnQCe5VB/OkeMCLVNaFCb22SLuD7xA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n+XoUIZA/Ww3T6MVPpk8jWFET20DbbcVsQATskU0REzu6xDiR9gtVlwugQNnbvg82OeTJKkZH0iW9sqX50hg2u4dVOfio+bbJ7jFWHZRFfbEGIHtRVa/0h0CevnCc143GFXhyQZf8uOPGgrugvLhLG3M11H7FYX+VWUC69MBMS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YFA4vnhG; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YFA4vnhG"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1da662315aso9022300276.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 14:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212846; x=1727817646; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0kXAOzmEEQHXzTmLkL/vEUOj2egGiISa865No2odHA=;
        b=YFA4vnhG7v3wBEtJRSWPxljSAzlMN9QnEngViZVnd5PDdLWNLb0TIe1vq+uOBLMt8Z
         kcQ7DwG5Ba47eaBGIw1UZM4yGCOj9NPz30vGbA7kybcrY7ORgrAG+cKVXxTt9f6Dqebh
         bXTzpQTWhjRCqF2t9rBT+Svoe0/FMXIyGwoFI77fUqOKfiMqUrrT3kkuX5gZ8EUuZ3hA
         KF0AmhvkGLN9nxAKwWTdM/1OajsPW5z3fobqzK6IV7ZgUeiGIKlll6wbmTVfT4kTGbQD
         XI0Q0BcbBcryqiuPJRNeH/EY2aBAwoEGIRPuvshu477qzEZAzOf4IjYJe9Gd7hm0kSM2
         c9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212846; x=1727817646;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0kXAOzmEEQHXzTmLkL/vEUOj2egGiISa865No2odHA=;
        b=TYUf3upM/whlby6+XP383UqrDLfLnQEFp7hex2/0/FPegipSni2L0T2iU/gl8EI3qm
         0RtKBrxs2BgbsRn7mQJuvRmqPluGFIbh50glE48o4adS/YZMnGC++KcetDu3/2vzJ1WA
         QW92o+Nf+k+HYi8Bfyo9YYG8Ac2anWyPrlUiqfzAfLCBWRf3pjRQCKfAUItviDyc01l6
         ycs5zt7Ta5YfyVpGPKIOxMrQB3PI9mNh6HU9dHisN87vudXVFTJ0AwUpg150lOc1Y5+0
         RUrZKLqP1jN7tpn850jY2H9hl0DaTkH6Egm0UKRhh1eqHh2GVTqttiS1VhkoRDQFnDAN
         EoRQ==
X-Gm-Message-State: AOJu0Yyp4Q98w3RovDQqYOUs8yuj4jWNQS+rBzeCRwnxUVNDW682W8tK
	Dc2g2RlZ1FSNItcpnaj4DsxLCU0HAuKHMI4rIFnrXdVG1gfopE5/Hsq9qhNGmQcBK31ZmAyFZ/F
	T+Rnl/w==
X-Google-Smtp-Source: AGHT+IHDISpnfdzBaOTWR8C0ioj3uPYVqLGAlaWzdMvCzf+f+r+0H0cGN2cqc+XvC1wkkQdhXDCIGGe8xEvv
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:d608:0:b0:e0b:ab63:b9c8 with SMTP id
 3f1490d57ef6-e24da399c47mr364276.11.1727212846139; Tue, 24 Sep 2024 14:20:46
 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:49 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-8-mmaurer@google.com>
Subject: [PATCH v4 07/16] module: Factor out elf_validity_cache_index_sym
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, Matthew Maurer <mmaurer@google.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Centralize symbol table detection and property validation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 73 ++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index ec638187ffcf..6be58b0a6468 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1980,6 +1980,39 @@ static int elf_validity_cache_index_mod(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_sym() - Validate and cache symtab index
+ * @info: Load info to cache symtab index in.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *
+ * Checks that there is exactly one symbol table, then caches its index in
+ * &load_info->index.sym.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_cache_index_sym(struct load_info *info)
+{
+	unsigned int sym_idx;
+	unsigned int num_sym_secs = 0;
+	int i;
+
+	for (i = 1; i < info->hdr->e_shnum; i++) {
+		if (info->sechdrs[i].sh_type == SHT_SYMTAB) {
+			num_sym_secs++;
+			sym_idx = i;
+		}
+	}
+
+	if (num_sym_secs != 1) {
+		pr_warn("%s: module has no symbols (stripped?)\n",
+			info->name ?: "(missing .modinfo section or name field)");
+		return -ENOEXEC;
+	}
+
+	info->index.sym = sym_idx;
+
+	return 0;
+}
 
 /*
  * Check userspace passed ELF module against our expectations, and cache
@@ -2003,10 +2036,8 @@ static int elf_validity_cache_index_mod(struct load_info *info)
  */
 static int elf_validity_cache_copy(struct load_info *info, int flags)
 {
-	unsigned int i;
-	Elf_Shdr *shdr;
 	int err;
-	unsigned int num_sym_secs = 0, sym_idx;
+	int str_idx;
 
 	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
@@ -2018,34 +2049,21 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	if (err < 0)
 		return err;
 	err = elf_validity_cache_index_mod(info);
+	if (err < 0)
+		return err;
+	err = elf_validity_cache_index_sym(info);
 	if (err < 0)
 		return err;
 
-	for (i = 1; i < info->hdr->e_shnum; i++) {
-		shdr = &info->sechdrs[i];
-		if (shdr->sh_type == SHT_SYMTAB) {
-			if (shdr->sh_link == SHN_UNDEF
-			    || shdr->sh_link >= info->hdr->e_shnum) {
-				pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
-				       shdr->sh_link, shdr->sh_link,
-				       info->hdr->e_shnum);
-				goto no_exec;
-			}
-			num_sym_secs++;
-			sym_idx = i;
-		}
-	}
-
-	if (num_sym_secs != 1) {
-		pr_warn("%s: module has no symbols (stripped?)\n",
-			info->name ?: "(missing .modinfo section or name field)");
-		goto no_exec;
+	str_idx = info->sechdrs[info->index.sym].sh_link;
+	if (str_idx == SHN_UNDEF || str_idx >= info->hdr->e_shnum) {
+		pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
+				str_idx, str_idx, info->hdr->e_shnum);
+		return -ENOEXEC;
 	}
 
-	/* Sets internal symbols and strings. */
-	info->index.sym = sym_idx;
-	shdr = &info->sechdrs[sym_idx];
-	info->index.str = shdr->sh_link;
+	/* Sets internal strings. */
+	info->index.str = str_idx;
 	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
 
 	/* This is temporary: point mod into copy of data. */
@@ -2066,9 +2084,6 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	info->index.pcpu = find_pcpusec(info);
 
 	return 0;
-
-no_exec:
-	return -ENOEXEC;
 }
 
 #define COPY_CHUNK_SIZE (16*PAGE_SIZE)
-- 
2.46.1.824.gd892dcdcdd-goog

