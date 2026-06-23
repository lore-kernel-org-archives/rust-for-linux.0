Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460C9376A17
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210300; cv=none; b=dOrB1o3L1gYQTbm53FyrEmMwEQCkPq6xllSWT/zfjQVaxpvjVZd0hykMHZdl+6CvKtKX5/+o1grV7YOilZha97Ro7bj3wgEjVsteEuKVsZujk8e6ARFLl3aqBethMvVPmXPyd9PywlZsPwA+BcCxqs3p71SKnVmlXsDhp1NWLCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210300; c=relaxed/simple;
	bh=2bLuCZFS5AIV49JzaZGOMxvIrS4BHHMfVW8bp4M2uog=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TIDDcTN0dyfcGfVUIEs7KO1hdUWY99P03T7wlzruOU6Yd/pZ1Jo/DHgPvgtZLP7kA2DTWrxHZ+K2Fjg5nxpLKgH5Al9LzsWnLzEz5CfnDfbNi+K+9biovWdK/q2omdQ4B7yn5UwKA/TB6JPNeDqo0SaQfTfA7cK32e/kC5l8Sq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsK/oHa2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsK/oHa2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf2247e38eso61625385ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782210298; x=1782815098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MN3pPDGcF8EmJYIIls8L0QT+n17wsCPpidJtsIu7n1Q=;
        b=KsK/oHa2yvlGRGpfp/TLNSwO2rkYuzSQrYx9BozxKQu78SPpRtwv5cf2iaP1WGxPy2
         RjyzM6ohk0ty91PWcCow3zPeu3cr3gYpl7OCReIN3qPvYTg977rIy8J4jPeFmXj4b7hu
         knUbFKKDvmhYMAzIbgFDcHw6B6lK20IIL+xxZPwVubcQamy4NKQJQNonNPApxcd7qoWY
         5sIaTsSybd36LQaC8RtJmO8aJ8mKPH/+JkdURjpTVT4sAqZNPSD7/5OaJX9H5rxOvyL9
         7+ElHybjeThCN+kVOQlnB7zCLFtEkrDM8gN0AA1DKZ+NcaaZWqhmCeXvXfVRZHxJI/hx
         zUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210298; x=1782815098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MN3pPDGcF8EmJYIIls8L0QT+n17wsCPpidJtsIu7n1Q=;
        b=I2xlAnBvYRiwNXmGci2ADnusORO79AePyqzS/RihR1ppFwwB8ewlJ+fPoBuUEw23RR
         XIxDaynpFT5sq0Yak48dg8SPdiOcx5wEU8CBvNK6Q0j+zXMYiCDZSDa3FhAp4Hqy4NSr
         orfpzA6/i+lFMkt0vcDBM6gicJhaSMZLBtGBWsAlHwngDDFhWFvl2/iycpbiqMgnNhEA
         DT4F/NVETluwt3rxaLIb10uWk5iKNktoAP46gIueiRaRPo98ZceBFGxH43nzyqGdCWsr
         6Ysjs6tskhAHdIiEc0dcG1nrWD2K7pnaZZzGh2pckhPoch48TB/bYHqcaPZ0uIT0Wwa1
         nJHQ==
X-Gm-Message-State: AOJu0YzbNAVXaMsYKvaV99Zz/f0OGvikbA5ZU5dBh/uuHjDpJ8oekyGs
	9xeWXJRb6D9JcWcKoXxOZAzXkTNFh4Eiq5x8BeCZtAfKssKy/xRtGj8F9GL/+5gg86RW2buM
X-Gm-Gg: AfdE7ckPR89y1dLcvo73LHkswi/+uPeRUqfTsmhy8O1IFfuzR7S/Emwmzq9sI1uPH1Q
	/oTkHYcC4/fqL36uvvdcR6vWdSnbhbBDyRhocdEjtToZ4SzzcBIilezlb840edCFDq2rlGhPxj6
	ApBgCyocntHyWyykASJrhDhXHBKR2DyKSBf4XOjESGd80KYukExnTppxQfXNSSFfnhJbrXmhiLA
	JnVQ2vLat22kZjSYdwk1vWjZkAiahISHy8Ci2T24Scpj4EHKqvqa4tXieesFIo+1VFt87IedndL
	ik+4ZsHBoGN0bn/a+uunV3yUaqb7x5esMYVzCvCdYQDuKM/8fid4C11IPaEhWiDAFzeoiIneGST
	v4QugTMPBrwx2IdB33czBVwyAUfhYirqFX5CF1OFGVqdyQVBE/Ot8Rc7pIyok3KF9jOkALBSJM+
	URSBieJo2O2Ipp/N0PGeUpG3Am/XPE9DyhuIuL+8kM+9elalYlCeezqIp760ePemoKjV5B2V0G+
	GTFV/RyAeUs/eQe3oN7cdezCzwqRYrit04C8V+Faw1CZIAmXA==
X-Received: by 2002:a17:903:22c5:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2c718f953c5mr188846435ad.31.1782210298472;
        Tue, 23 Jun 2026 03:24:58 -0700 (PDT)
Received: from localhost.localdomain (ec2-54-199-123-161.ap-northeast-1.compute.amazonaws.com. [54.199.123.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436ee37csm103161525ad.26.2026.06.23.03.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:24:57 -0700 (PDT)
From: Xiaobo Liu <cppcoffee@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	akpm@linux-foundation.org,
	david@fromorbit.com,
	qi.zheng@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Xiaobo Liu <cppcoffee@gmail.com>
Subject: [PATCH v2] rust: helpers: move list_lru and task_work helpers out of binder.c
Date: Tue, 23 Jun 2026 18:24:31 +0800
Message-Id: <20260623102431.3577627-1-cppcoffee@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANiq72=sSkApehxg6eEpAoNU8zSsRAfqD+RVymM3UQGuvfKyeQ@mail.gmail.com>
References: <CANiq72=sSkApehxg6eEpAoNU8zSsRAfqD+RVymM3UQGuvfKyeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The helpers in binder.c wrap generic list_lru and task_work inline
functions and have nothing to do with binder. Move each of them to a
file named after its own C header:

  - list_lru helpers move to list_lru.c,
  - init_task_work moves to task_work.c.

Add the new list_lru.c to the SHRINKER entry in MAINTAINERS, which
already covers include/linux/list_lru.h.

Signed-off-by: Xiaobo Liu <cppcoffee@gmail.com>
---
 MAINTAINERS                           |  1 +
 rust/helpers/helpers.c                |  3 ++-
 rust/helpers/{binder.c => list_lru.c} |  7 -------
 rust/helpers/task_work.c              | 13 +++++++++++++
 4 files changed, 16 insertions(+), 8 deletions(-)
 rename rust/helpers/{binder.c => list_lru.c} (72%)
 create mode 100644 rust/helpers/task_work.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ba45953bb..428992431 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24590,6 +24590,7 @@ S:	Maintained
 F:	Documentation/admin-guide/mm/shrinker_debugfs.rst
 F:	include/linux/list_lru.h
 F:	include/linux/shrinker.h
+F:	rust/helpers/list_lru.c
 F:	mm/list_lru.c
 F:	mm/shrinker.c
 F:	mm/shrinker_debug.c
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 998e31052..ea34101b9 100644
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
@@ -69,6 +68,7 @@
 #include "jump_label.c"
 #include "kunit.c"
 #include "list.c"
+#include "list_lru.c"
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
@@ -93,6 +93,7 @@
 #include "string.c"
 #include "sync.c"
 #include "task.c"
+#include "task_work.c"
 #include "time.c"
 #include "uaccess.c"
 #include "usb.c"
diff --git a/rust/helpers/binder.c b/rust/helpers/list_lru.c
similarity index 72%
rename from rust/helpers/binder.c
rename to rust/helpers/list_lru.c
index a2327f1b3..3b88d1a96 100644
--- a/rust/helpers/binder.c
+++ b/rust/helpers/list_lru.c
@@ -5,7 +5,6 @@
  */
 
 #include <linux/list_lru.h>
-#include <linux/task_work.h>
 
 __rust_helper unsigned long rust_helper_list_lru_count(struct list_lru *lru)
 {
@@ -19,9 +18,3 @@ __rust_helper unsigned long rust_helper_list_lru_walk(struct list_lru *lru,
 {
 	return list_lru_walk(lru, isolate, cb_arg, nr_to_walk);
 }
-
-__rust_helper void rust_helper_init_task_work(struct callback_head *twork,
-					      task_work_func_t func)
-{
-	init_task_work(twork, func);
-}
diff --git a/rust/helpers/task_work.c b/rust/helpers/task_work.c
new file mode 100644
index 000000000..cb961cd22
--- /dev/null
+++ b/rust/helpers/task_work.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2025 Google LLC.
+ */
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

