Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973123B8409
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782207566; cv=none; b=urpmiZsGTvihmWGE2k2MPBRhQz4snWjVXD2NDKueSZI/GakodpPWO0hwOBe7nSgwVipYJGr/5IFVqCbWTh+k9kxPN51tQXt6OOwlERVV0ZB76IVu561lgEKvTMTdloVFKnwzvlUQ6RzJyvsdqz1H4LbCe7oz16ZIFHPQ9nBkx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782207566; c=relaxed/simple;
	bh=ZcHyr41M/8M6YLclZg1mgEARNpDLtQP/vCHoCmHog0w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VbmKB8/EnpVPKO8VnAsReTRwf42479IgAfEp3o9qWdxKgV6IrB1kT5M8kCzi0yytqNe8XmofBGZY0R2uG6m+hQtUNU2r+dLfvFO2v1gUQMq235GAcoje+r/AARO+7Xc/Tlj4FUa0r7XpxJASyjFG4bkFg7zr5wl4kfDbKFQDuGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV9KqJkV; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV9KqJkV"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso4787636b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 02:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782207565; x=1782812365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DtwYWbTvFN0sWtEuoeRWXsfMBBDZjVaL8kIzdLSt+aw=;
        b=kV9KqJkVttow9S9+ZzVJw4u2VfjjIX3EF9D+TdsXPEnFXdP6SZC9WJ4EJeQnKOYdvT
         wNef+l/vUuBiF0mA0HSIXt2eR/0XXgxFnDYehdMACN9VBOUvafpNRoMKAwZcp8Nw69Mc
         Zh6uCPyYPNbBmUozl+ELq2lR2JsRPZIwnF8BT0kLZyabYUZlTRr0MyrPUIpWtUeWAeq+
         3ya+MyJLK/AQ1mOVna60N7zlLATD+vwUaAJHnQaI+eh2BBt5IVLsWUrv2elQiuV2/0XF
         /XIRmoblGBSjF8ekEavC3jR0pmgJ6bUPZxOuxxnPKBj8+WFOo6ZH2uT4YVuiJcsY1VKf
         fXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207565; x=1782812365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtwYWbTvFN0sWtEuoeRWXsfMBBDZjVaL8kIzdLSt+aw=;
        b=nlu/G51TjRjX6SiBUour81xUPW37Y/mi4p6y5MfM7ILlLCnk94esHs8JaEh2KnWDv1
         4Xn7ZzgBH9THIlDOFW8OTVNUOXwD9tSt2BL8XdpWOSMy0AsF30LM/dJRUQqfvHfJG+0w
         H+4WcBo5746bBy1RexHyApGdbDBECvUGT01eGO1nltxU/uOzMiO1/Gn6ok47FF2tgANV
         QOpi+tzOwU5lKz3UdMYV4EuZKKngsii9rV8uctOXbe8aNPw+pn8JfQIyIMFPNj/QjQUt
         1PU9sSGdN3R8avK2m7TO0euI3J2hPBYpzPGV2RHEJGh98Azt1Dx3JuKR9jbCjJuTnTmj
         zzdw==
X-Gm-Message-State: AOJu0Yw3QD5wxbGMe9gn0SfxCudDy/jVaVBOwgrxQiLs1NH9LweC95Ca
	j8uvzOGukQ7q70UjVz9td06TOeFglpCau7jbBPIzRfqgzqroOqn/BDxAnL2sZYmQ7McUww==
X-Gm-Gg: AfdE7clu/L6Jb9TYvP8OKw1bWzgsQqIRqkQ7CL1bzw4BNWJJ6VWr40YGVbCctel6Fr8
	cJdOVTvlKX813GL4FyrIdqxFiiR0N8QZa2uGiQJlMRoWg7svDUdiKSBX5ov2QIhL1ic5OQtTpYR
	wPKp2pNA/HSIDBT21p+Jr4Ovu9lhHsmdUyLPrgt1blqjAxm3I2GapFH35UH21zSPkNtnNMvpsO3
	HUWL5Z97qIIFHqu3j/PZV0yKLJ/asgN0psiDZT3J8iPGB6ROyaU+TqbHg3YM9HlZU+VplS25fwc
	CvqvaOPq6TK2Hxa8R0PaSkT1YjRysReLezMOLCJwOzZafzHAVxl681IdbAgwU3/bwo+LFfU/fvM
	IB7kzod17wF9423kUXHogvbHctNRF9K6ynfr0ln8aw9NRWJ82TvZUMiyHscOcla4qrzyMUUdmY0
	DKQHSGJvvxJpgh05vYI1xPr8psZAnCB4O2ZRfqhfD3RkKUJTl8HK3WW+ewnLP8Nl5G4+7g5vmJp
	j7umcyAxzF3VXYvQbWGjICMj+Q5wYipFRNa8zzoAWMqKofvsw==
X-Received: by 2002:a05:6a00:1889:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-845970ac3e2mr2173451b3a.26.1782207564833;
        Tue, 23 Jun 2026 02:39:24 -0700 (PDT)
Received: from localhost.localdomain (ec2-54-199-123-161.ap-northeast-1.compute.amazonaws.com. [54.199.123.161])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ea22c7sm10005480b3a.44.2026.06.23.02.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:39:24 -0700 (PDT)
From: Xiaobo Liu <cppcoffee@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	Xiaobo Liu <cppcoffee@gmail.com>
Subject: [PATCH] rust: helpers: move list_lru and task_work helpers out of binder.c
Date: Tue, 23 Jun 2026 17:39:19 +0800
Message-Id: <20260623093919.3543473-1-cppcoffee@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The helpers in binder.c wrap generic list_lru and task_work inline
functions and have nothing to do with binder. Move them to mm.c and
task_work.c respectively, where they belong by subsystem.

Signed-off-by: Xiaobo Liu <cppcoffee@gmail.com>
---
 rust/helpers/binder.c    | 27 ---------------------------
 rust/helpers/helpers.c   |  2 +-
 rust/helpers/mm.c        | 14 ++++++++++++++
 rust/helpers/task_work.c |  9 +++++++++
 4 files changed, 24 insertions(+), 28 deletions(-)
 delete mode 100644 rust/helpers/binder.c
 create mode 100644 rust/helpers/task_work.c

diff --git a/rust/helpers/binder.c b/rust/helpers/binder.c
deleted file mode 100644
index a2327f1b3..000000000
--- a/rust/helpers/binder.c
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-/*
- * Copyright (C) 2025 Google LLC.
- */
-
-#include <linux/list_lru.h>
-#include <linux/task_work.h>
-
-__rust_helper unsigned long rust_helper_list_lru_count(struct list_lru *lru)
-{
-	return list_lru_count(lru);
-}
-
-__rust_helper unsigned long rust_helper_list_lru_walk(struct list_lru *lru,
-						      list_lru_walk_cb isolate,
-						      void *cb_arg,
-						      unsigned long nr_to_walk)
-{
-	return list_lru_walk(lru, isolate, cb_arg, nr_to_walk);
-}
-
-__rust_helper void rust_helper_init_task_work(struct callback_head *twork,
-					      task_work_func_t func)
-{
-	init_task_work(twork, func);
-}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 998e31052..fe0883b33 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -43,7 +43,6 @@
 #include "atomic_ext.c"
 #include "auxiliary.c"
 #include "barrier.c"
-#include "binder.c"
 #include "bitmap.c"
 #include "bitops.c"
 #include "blk.c"
@@ -93,6 +92,7 @@
 #include "string.c"
 #include "sync.c"
 #include "task.c"
+#include "task_work.c"
 #include "time.c"
 #include "uaccess.c"
 #include "usb.c"
diff --git a/rust/helpers/mm.c b/rust/helpers/mm.c
index b5540997b..941984feb 100644
--- a/rust/helpers/mm.c
+++ b/rust/helpers/mm.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/list_lru.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
 
@@ -8,6 +9,19 @@ __rust_helper void rust_helper_mmgrab(struct mm_struct *mm)
 	mmgrab(mm);
 }
 
+__rust_helper unsigned long rust_helper_list_lru_count(struct list_lru *lru)
+{
+	return list_lru_count(lru);
+}
+
+__rust_helper unsigned long rust_helper_list_lru_walk(struct list_lru *lru,
+						      list_lru_walk_cb isolate,
+						      void *cb_arg,
+						      unsigned long nr_to_walk)
+{
+	return list_lru_walk(lru, isolate, cb_arg, nr_to_walk);
+}
+
 __rust_helper void rust_helper_mmdrop(struct mm_struct *mm)
 {
 	mmdrop(mm);
diff --git a/rust/helpers/task_work.c b/rust/helpers/task_work.c
new file mode 100644
index 000000000..5bdb752cb
--- /dev/null
+++ b/rust/helpers/task_work.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/task_work.h>
+
+__rust_helper void rust_helper_init_task_work(struct callback_head *twork,
+					      task_work_func_t func)
+{
+	init_task_work(twork, func);
+}
-- 
2.34.1

