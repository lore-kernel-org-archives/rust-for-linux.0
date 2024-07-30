Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947DF168489
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 22:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722379445; cv=none; b=QfmMW4aotwF7VzzBsj2VAhp7atSDUpd0HXvQFfP5U6OFuoxPKmTR9nNPz3Dm5OFd2hP21PzKifYsrTaN8X9s2b5Krm+LiYIdOCrZuIL+Dj9g8lclHW9MEkwMAhEkArx0RgwYMiVcci2h61oiz2hhthAn3ODqlVUphhKeZcurk3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722379445; c=relaxed/simple;
	bh=TaOuQjCmRa/f2uxkkHdwn9N7dLnJsN/fT8I8JS34eio=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=M53CMosncU5rLfCo0OBUHZfmOCQHvQ3iAwQ0CEQEqEHviFyNLU8FjKDxrco8RaLrFkbwWb/d8PHqOfyRYUOU46s66Sfvpu4qODrQYGfOPYktxh/XhsUvcybAxx/3BwW3Vr2UWNCAZUu1Wz74Mi7/2HFNuML5rb5FI6Ip4KGHJmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hGqHKUu4; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hGqHKUu4"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6698f11853aso88250397b3.0
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 15:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722379442; x=1722984242; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6rLogURdEUgVuohDxoI/z6kah3N3XGw4tvUvw1JX3Aw=;
        b=hGqHKUu4DhlzNKOt4QElOwBtNHNEEcu8v1WCw/unTr0dnZOsiru52Kwsopo3jMvdMb
         /5Bk6ggTv4Z3hy60UW92YnFsO8rM3V0rbfzp1H+fwjM+Er4JbpSTqfDUsz542TbKbzYv
         j7CT+Dd0ahz0Hl1ccpj7PQuQUKpAuVyQN3g7M5Qjz9yJNtXiPWP7hZPIFcPytLhiVh3d
         AlDMl1YVc+lEzjIM5GZEV9k9IG4nAI6lHpVuUllM4VwzIHDtOiAiO+UnU+tRXrU0mOWW
         IlRRdDqdqZdgA1RYdwybkwxw1gy3BmEvf61Kjeg6LvXiRxjn4llcbmkpJwroI69kjyOh
         RcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722379442; x=1722984242;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6rLogURdEUgVuohDxoI/z6kah3N3XGw4tvUvw1JX3Aw=;
        b=BBZzJ/co4sKY3H9t6L6WyQ6jpS0l63zDUslHfgZt+L+w1szRQz+l+Kqbc88im516jJ
         2GkD/noTFcbVom5/7y9pEhuUGPpvhzomQv7LdmHo7xCkDVwu5QLaVb+AtMNxlmu8rc6M
         kGJR8weitcyD/+MATJ/Wd89tTF720MKMx7k/y+bEX0ez5odDj6+eKzata9d3klahs7PI
         x67IihZxCSLDEy1EJbpfJ5KrNi+7XP4pFJ9PZN94E0pMQwavRvCxLXYohZus3VwGGoxj
         Wr08nUn3R9mfSx+zGsC/FV7ZBP31Qn9AcQj+GHNZXj+UUWRckVsunvjecu6ibZooKmTB
         hJQA==
X-Gm-Message-State: AOJu0Yz6Hi2m+3rjArz5+OVK4vDAXgHqVIPIozxFFzINZ8GX2RcKHd0w
	hvHyrA9r2BP09h/+WrL+Q0IrN3POBKsskVsfgXDmXsdMmYaJcsJSQLP3QCs2f1r0+IHarhWNkCE
	uJH+s5A==
X-Google-Smtp-Source: AGHT+IGOvkaxnFruP/oROarFKnoqnlXkVf92ieXY1PpWplaN9r3BDmqn6TBprHl1KdZxogiiCKrITwBcRyre
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:b04b:0:b0:65c:4528:d91c with SMTP id
 00721157ae682-67a004a28b7mr1818107b3.0.1722379442636; Tue, 30 Jul 2024
 15:44:02 -0700 (PDT)
Date: Tue, 30 Jul 2024 22:43:50 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240730224350.4039790-1-mmaurer@google.com>
Subject: [PATCH] pahole: Apply CU-level filters early in loading
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
 pahole.c       |  1 +
 3 files changed, 12 insertions(+)

diff --git a/dwarf_loader.c b/dwarf_loader.c
index b832c93..c48dfef 100644
--- a/dwarf_loader.c
+++ b/dwarf_loader.c
@@ -2854,6 +2854,16 @@ static int die__process(Dwarf_Die *die, struct cu *cu, struct conf_load *conf)
 
 	cu->language = attr_numeric(die, DW_AT_language);
 
+	if (conf->early_cu_filter)
+		cu = (conf->early_cu_filter)(cu);
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
index 954498d..937b0a1 100644
--- a/pahole.c
+++ b/pahole.c
@@ -3765,6 +3765,7 @@ int main(int argc, char *argv[])
 	memset(tab, ' ', sizeof(tab) - 1);
 
 	conf_load.steal = pahole_stealer;
+	conf_load.early_cu_filter = cu__filter;
 	conf_load.thread_exit = pahole_thread_exit;
 
 	if (conf_load.reproducible_build) {
-- 
2.46.0.rc1.232.g9752f9e123-goog

