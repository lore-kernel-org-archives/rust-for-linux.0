Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C361D14373A
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722538259; cv=none; b=tnd2YbgC9X9NV9ggXdHy6Js1DmJHsPjlvT9O4/Ogoi1ZCdQ17xmBULj/Dt7q933C9Wdy9aA/WWYPJj6GT5WF7mamC3gRy6RUN+bpqvv7uuyVOo0Jk9gGtlSmTpHeWKfNtL+RdQNOnnnBpISJAZc7icM3W81u6cuBdrK/dcEjS5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722538259; c=relaxed/simple;
	bh=2Q5d8tOrw4Hi1xtBW/4AyVlOvnuU7sBSLcDkSaX2tu8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZieUZVd6tYLl/A7/iTlg4w0NCuR3tpqYftScCLayr5mBgB3Z7eKu3wm7eIXXtdqma9uI0lwZW6xriCBHIIpls1bGQlSRVDMwM7lOxgyqSEtuM+n8l5The4dNKIJ3QbwdjF/hVc342LkFs56sLC0cMtdRJPnVwlB+Qqkhntn1Yss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1eIWT/uV; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1eIWT/uV"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e03b3f48c65so10753196276.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722538257; x=1723143057; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T1eixLZmlF7lWWMkZkzQnmYhc2qV+9L/edGbXjzQ+dg=;
        b=1eIWT/uVUGHDl3cv/HDTwZ09ADKBwHYHIB3DeubEfsId8FKSQ8TLAaVhTv8E/njcE5
         mcQJ9GGFebayuMKjn69Nu5BOloTF+QrSezI+8Hlld1OzAfkTXtFnu3n11lBtpB+G0LRk
         Pr34g85xez5QoqHOZAnTziWpgqlmmHH11BdffQaFDvFmjTXTHRzWe1xJiMmRde31QBAT
         zngM3k0PUdFNMSMFg91C5zH0YveD0w8M1YYeFqeuTytmS9u+j42wxDkClU0GOeOdw5Iq
         +pnxLMYSElIH16emj7EY6BwfGjiZsW8acVa49ADEkXvGG68WW99kLG18hXDqgN2s0j3w
         5UrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722538257; x=1723143057;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1eixLZmlF7lWWMkZkzQnmYhc2qV+9L/edGbXjzQ+dg=;
        b=Igos2fRJIy97HoymhmEd5gGiNtstwt5u4wLGpaf06qEOLxCrFcp3x3ked2TmzTDJF4
         kuIwKIKhxUx3ZUkWZfjla0oLj44RF2Pfy7EheOBPwO99YrVXqEHsVyBj/x2xM+ERE2aP
         8YzsZTxP8tsYQgsNryJFHPj7+QQNIUR7/cpmCa6c20/gueU8StbuRzFBPf74OJkLum8T
         cKif61OC16zCdwgRM5vUaD2Lw+lTx7Sg9jcnPzqrI6PVahaBNVAjUOkWmnBLy5Yv5ahC
         VUGKfh9hvyDx+tNNZOwCFqwAD08T1yesds54vrYu00kOHT0pqoX01w+8/rlq0wL9K8tl
         vzPg==
X-Gm-Message-State: AOJu0YyBD0TIhQZ0v7dm5LbZ8VvryFInDhQceEgAv3RZHYcTf/Bcondg
	9JSL60sijrWO3uDbmYkP3uLPnFaLiehAe8+pFOOOiZuPKF70A6Xq/nm1Rfl/kqlTExKew2a+TXG
	6BodTQw==
X-Google-Smtp-Source: AGHT+IFWI+8i+PX0TeoUdUb1gBZdBr9ZoC+KhYCemjWo3qnGMiKUFaxNcZedoFT9NYQvBHHGapNwwS2HTTDr
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:6902:1004:b0:e0b:bafe:a7f6 with SMTP
 id 3f1490d57ef6-e0bde439e04mr12473276.8.1722538256699; Thu, 01 Aug 2024
 11:50:56 -0700 (PDT)
Date: Thu,  1 Aug 2024 18:50:54 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240801185054.2518383-1-mmaurer@google.com>
Subject: [PATCH v2] pahole: Apply CU-level filters early in loading
From: Matthew Maurer <mmaurer@google.com>
To: acme@kernel.org
Cc: rust-for-linux@vger.kernel.org, dwarves@vger.kernel.org, 
	aliceryhl@google.com, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"

Without this, even with `--lang_exclude=rust` set, running on `vmlinux`
with `CONFIG_RUST` enabled will lead to errors like:
die__process_function: tag not supported 0x2f (template_type_parameter)!
because the filtering doesn't happen until finalization, but unsupported
tags are reported during loading.

As an added bonus, this should speed up processing of large objects with
filtered CUs, as their details will no longer be walked.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 dwarf_loader.c | 10 ++++++++++
 dwarves.h      |  1 +
 pahole.c       |  4 ++++
 3 files changed, 15 insertions(+)

diff --git a/dwarf_loader.c b/dwarf_loader.c
index b832c93..02a17f4 100644
--- a/dwarf_loader.c
+++ b/dwarf_loader.c
@@ -2854,6 +2854,16 @@ static int die__process(Dwarf_Die *die, struct cu *cu, struct conf_load *conf)
 
 	cu->language = attr_numeric(die, DW_AT_language);
 
+	if (conf->early_cu_filter)
+		cu = conf->early_cu_filter(cu);
+
+	/*
+	 * If we filtered this CU out, we still want to keep iterating, but
+	 * there's no need to walk the rest of the CU info.
+	 */
+	if (cu == NULL)
+		return DWARF_CB_OK;
+
 	if (dwarf_child(die, &child) == 0) {
 		int err = die__process_unit(&child, cu, conf);
 		if (err)
diff --git a/dwarves.h b/dwarves.h
index f5ae79f..92d102b 100644
--- a/dwarves.h
+++ b/dwarves.h
@@ -72,6 +72,7 @@ struct conf_load {
 	enum load_steal_kind	(*steal)(struct cu *cu,
 					 struct conf_load *conf,
 					 void *thr_data);
+	struct cu *		(*early_cu_filter)(struct cu *cu);
 	int			(*thread_exit)(struct conf_load *conf, void *thr_data);
 	void			*cookie;
 	char			*format_path;
diff --git a/pahole.c b/pahole.c
index 954498d..42a9c16 100644
--- a/pahole.c
+++ b/pahole.c
@@ -3765,6 +3765,10 @@ int main(int argc, char *argv[])
 	memset(tab, ' ', sizeof(tab) - 1);
 
 	conf_load.steal = pahole_stealer;
+
+	if (languages.exclude)
+		conf_load.early_cu_filter = cu__filter;
+
 	conf_load.thread_exit = pahole_thread_exit;
 
 	if (conf_load.reproducible_build) {
-- 
2.46.0.rc2.264.g509ed76dc8-goog

