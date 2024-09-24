Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127A1AD3FE
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212851; cv=none; b=d34bE8D6jz5sTTfPb6ttr4tiJVlhrssbUC6Ed5+lblpCew0EMT2iKkcyF2Qq4rBJ3gy/oI/GzkrNYrJQX/4PeZ44hoij0P+9PjYXFDIa3R2X7lyN5hAfxuI182o7e6+6FJ6haaM+DtbfsB22iTj8WHEQyMQI28WZZ3+BTR18Vtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212851; c=relaxed/simple;
	bh=wM975yYhhnJbskoT3Xe/Z8RaXLTIAwoZIK7NoqKeDB8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=je4RyE0yTcFewcj/rAMPRo22jCaG8V5VHKFvM7jnP5jKfEyqLCpVAtLfPjWyGucs9cbn9XnzEcAfwdyf6fKu1KUanXNcQMG8vN9ZtTbPGxe6kpn2zF0ZePB0l9hCVf8QIrJ3jWtA6ckPepccheFFYDxr+D8GiM0uWsyBghf1zZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DFQA/zpZ; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DFQA/zpZ"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1cefe6afc4so9329938276.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 14:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727212848; x=1727817648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOjsxdYdAkInxupUorws184MmwFGmal1AWb/bAcHrOQ=;
        b=DFQA/zpZZMMwsPS9NnAIH9GEcWUkeezEU6kmEHTSwBgmKDWaYUSb7vInK/1x6jdTH6
         nD/+H2m9fC2jgdIK7gPFhCJZQ2odzNL5rK6TTBQvVRZJ9sOBj21YOf4W5LnLCSMjKCNi
         uEQoHAHWsn9Svu+3R4mAlEK1N0SPsIhaqW7Brd25VG2XNLMy55FDRR7sn8G8iy41tPYT
         iCs4zvLK9kOxvsgjKQUabzxnbsnDZb93EvBHRJf81HwD+0RWxfI2Wx8Ry8pHCiQrMDXG
         5QR/GaWMeFhyZKs5IvSe6n0q+JbvtifJfv1nmehd4rHwQq3wan8rLDSLYS+FvwDqhezC
         C70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727212848; x=1727817648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOjsxdYdAkInxupUorws184MmwFGmal1AWb/bAcHrOQ=;
        b=Zrg3QhT3h3du6xTsc85pJa9WBz9uVZHlsJjtI/PKQperlHo/Q5HwcD2pnq5C3w2Arg
         Uf34VGhXOdftNkHVs1aoBahjk+Vt/JIpOlypvA7vuQGOoLpqca3cmmYXGhf6pceCdIX4
         BbGay3QsTuv13f5YidgTi9EhA6/hYEWaZOf/AzCPSHSYWxhIlWFDZ3yrfL+77GYCjDqB
         o3mLY/aorKwYJcZJbOkm+er9lcrVeOnqOctpKiaC7soNWjvaU4cSjwCgzwM6Q7aGZg2Y
         yKKYaV/C2RS451U7lBj7ZRIoM1fW1vxQmAV33ZupANJBNhus5yGGjLqGFMn2VkkJZoVR
         cjSQ==
X-Gm-Message-State: AOJu0YxFkpANanhPgRxFJ2d6Jp4yZriQfXcnEnJmM2yZqjlBQW/vMD+j
	wQ19nWkO0bObo6sAxTIxJk6/Ncb0ilnHjyaS/p8K9wmv6l+R4JuDStk+/HiHiCVeLv7qXDOxA/9
	SaxrEOg==
X-Google-Smtp-Source: AGHT+IGFSH/4qSrZBqEqlTh529yD1/WBEgXQbh0dGeEOt+TtZiA9qDu1tsUd11c56UkfBMQHgYlEILsdYk48
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:dc0c:0:b0:e1a:8195:3c1b with SMTP id
 3f1490d57ef6-e24d9331a46mr447276.6.1727212848012; Tue, 24 Sep 2024 14:20:48
 -0700 (PDT)
Date: Tue, 24 Sep 2024 21:19:50 +0000
In-Reply-To: <20240924212024.540574-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240924212024.540574-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
Message-ID: <20240924212024.540574-9-mmaurer@google.com>
Subject: [PATCH v4 08/16] module: Factor out elf_validity_cache_index_str
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

Pull out index validation for the symbol string section.

Note that this does not validate the *contents* of the string table,
only shape and presence of the section.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/main.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 6be58b0a6468..43140475aac0 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2014,6 +2014,31 @@ static int elf_validity_cache_index_sym(struct load_info *info)
 	return 0;
 }
 
+/**
+ * elf_validity_cache_index_str() - Validate and cache strtab index
+ * @info: Load info to cache strtab index in.
+ *        Must have &load_info->sechdrs and &load_info->secstrings populated.
+ *        Must have &load_info->index.sym populated.
+ *
+ * Looks at the symbol table's associated string table, makes sure it is
+ * in-bounds, and caches it.
+ *
+ * Return: %0 if valid, %-ENOEXEC on failure.
+ */
+static int elf_validity_cache_index_str(struct load_info *info)
+{
+	unsigned int str_idx = info->sechdrs[info->index.sym].sh_link;
+
+	if (str_idx == SHN_UNDEF || str_idx >= info->hdr->e_shnum) {
+		pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
+		       str_idx, str_idx, info->hdr->e_shnum);
+		return -ENOEXEC;
+	}
+
+	info->index.str = str_idx;
+	return 0;
+}
+
 /*
  * Check userspace passed ELF module against our expectations, and cache
  * useful variables for further processing as we go.
@@ -2037,7 +2062,6 @@ static int elf_validity_cache_index_sym(struct load_info *info)
 static int elf_validity_cache_copy(struct load_info *info, int flags)
 {
 	int err;
-	int str_idx;
 
 	err = elf_validity_cache_sechdrs(info);
 	if (err < 0)
@@ -2054,16 +2078,11 @@ static int elf_validity_cache_copy(struct load_info *info, int flags)
 	err = elf_validity_cache_index_sym(info);
 	if (err < 0)
 		return err;
-
-	str_idx = info->sechdrs[info->index.sym].sh_link;
-	if (str_idx == SHN_UNDEF || str_idx >= info->hdr->e_shnum) {
-		pr_err("Invalid ELF sh_link!=SHN_UNDEF(%d) or (sh_link(%d) >= hdr->e_shnum(%d)\n",
-				str_idx, str_idx, info->hdr->e_shnum);
-		return -ENOEXEC;
-	}
+	err = elf_validity_cache_index_str(info);
+	if (err < 0)
+		return err;
 
 	/* Sets internal strings. */
-	info->index.str = str_idx;
 	info->strtab = (char *)info->hdr + info->sechdrs[info->index.str].sh_offset;
 
 	/* This is temporary: point mod into copy of data. */
-- 
2.46.1.824.gd892dcdcdd-goog

