Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E813F3090C2
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Sep 2025 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063313; cv=none; b=oGniqeyfFkrtrb5FWKv9oHL/Fd8nN5RCmd2xCBUJNjRMnJts6jX9YG+Q2UsJzRry+T9HobC9tIO3rhpAQ6HnjXiY9R3G1HR/9O6BQStpXoSH0/I/PK0h4e25SGgM+521UQwaVUvbYnYjzxLXwJjAWNIhsnG0rku7fPg8MrLgCgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063313; c=relaxed/simple;
	bh=k+ixhQPGGF72LjHNNF5qNcmLsCiq464i8JXv41ZYhso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFQlYk7AI5hZKeIvkm/4JVsdNANywoY8+2lSVOYOzwJjtz2rDMfc0elmVrpEI1arX3P0b807w7WOAECCAAFfbLrGRCT07YrzqMNWrkv0cEbbz5g9u8T8vNeqpbn7id+9UmLfYASiUWVs0z/tVdcWP/23j1+HfFVcWZ2fer+1qM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ah0tmg8e; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ah0tmg8e"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso17257075e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Sep 2025 02:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757063309; x=1757668109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMpbE6VafRyeOOP29fdsM3EDpozD5yF3rEIxtn+59NM=;
        b=Ah0tmg8e1B9z2LnN3sOiJ2+WgecqgThPr+eTgN7oPxnYlp0W8NtQ6Z/U+AgGQUBJfL
         vwon7GE2oAhbZL8Hs2JtI9wy6xwpFkMWiGqDnGPTNLeBfyWZt0BIfIOW3F4BJ/NX/Kpx
         gzLSHlBgwnwAUwENMGRkqrxPmkeHseWJuIs+FPZ6R963TZzyos+oAwKa1EzS4drOOJsa
         DLrN2ecNC+HJRUDe4FjOudgQW5DKHecTYIUn+ZJwGNMtbCj2rA98tT0laH8UkkRoUOoL
         qx3PFSFdUMeUz8rC2l/RLPP/ayT5HrCm1tH/UVwvDHeLb3S1Cw7XlB6yqmRrQlgzk8s9
         yabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063309; x=1757668109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMpbE6VafRyeOOP29fdsM3EDpozD5yF3rEIxtn+59NM=;
        b=N+ZkphZrLWt9cGoeYNydmUBcSg73kYDkJxI4lHy14062kWs0YTYv/dqO8ntbKQK9rO
         WgRmqCL+0LGu0i5OYQA46NqMlysfIp2L8Gy9J56wXgr2t/eXSfKYoOZAhSwcEpYBDvma
         5IdcdXKDA/Cd/F1qqaWo+L2geHMNEdTbPlkViUYtHLxS7doMt+i2LoBb1Eq/u7S1o06D
         eg5uKCoxPiAphkS307sEGuYoPFoINyrMUILp6Z7iF2d22zdfNMKIs30IwAScWR7Xw5Dr
         CVAQ4ZoT/Ey0LSw9BP4lvFsPFf3tX0FK6H2AZ/nrMD3Rkx+WhE7JNthyaHSrY+f/P2mb
         /sOw==
X-Forwarded-Encrypted: i=1; AJvYcCU3yoOaiydo2X8aVw4YugyojZLniLIsjsPJB05XJiZnfHmv28VX3UeLoQYZg6VnG15YDpgE9gyiQo64gk73aw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+/F29O9w0U2GeGOehk0IcQ6ejRSNoAVY4ZX4hCvZfHjdS5psH
	5oabNRkXfgSqaPudyV2CURuqRtO3etC8JEXhyolom8B4MafHvB5wHFxuRk5q1Wqc6C4=
X-Gm-Gg: ASbGncuKblzpLIqvLOAbl0Esmo9NkjgFqIVdcWzW4rSBnAcwbeLlehT20/1SjRE8INz
	tOkm95nwmN1FPDV11G2CBqHiLHPrKgRyhHYxI2AiMH0mVSQ8b9yoPSKj+bdeXY0OzpacK8GjRfg
	0QZ4I0+LP3dHwbRH1AAOsixxZHt1W28x9pSarXzfHfJpQxDlrnkaoobeWtq1mPwM6zHDzUyPiBC
	5l4Yz8EfLSdxMTrS6T8M+aabqbfcsWw+xj8/4UJeKOkAsQB3nSaGRRkP0snKA/o4q52UGCp0a2y
	kG2oGAiL3+wfk9zliqZRYWZDZeYHKQv2fy5O8POQTcwSTQt0fLCFJGS0ogn8k1fiwTcagys5Uly
	k1T+sQ1JpafzVOSQO8esg9Qyc616YRT43SM8ujzE3/MbeZl27fjPGPTn1Bw==
X-Google-Smtp-Source: AGHT+IEQ7iICtAFI26qq7I6gkL+FcH2hfR1NxHLVFsStd3ArLDcFGJmIecq7OFAY9rQ+tTYgegYx2w==
X-Received: by 2002:a05:600c:3556:b0:45b:8822:d6c4 with SMTP id 5b1f17b1804b1-45b88321ca0mr179252895e9.33.1757063309076;
        Fri, 05 Sep 2025 02:08:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0350e80sm68900805e9.22.2025.09.05.02.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:08:28 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Subject: [PATCH 1/2] rust: replace use of system_unbound_wq with system_dfl_wq
Date: Fri,  5 Sep 2025 11:08:18 +0200
Message-ID: <20250905090819.107694-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250905090819.107694-1-marco.crivellari@suse.com>
References: <20250905090819.107694-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistentcy cannot be addressed without refactoring the API.

system_unbound_wq should be the default workqueue so as not to enforce
locality constraints for random work whenever it's not required.

Adding system_dfl_wq to encourage its use when unbound work should be used.

queue_work() / queue_delayed_work() / mod_delayed_work() will now use the
new unbound wq: whether the user still use the old wq a warn will be
printed along with a wq redirect to the new one.

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 rust/kernel/workqueue.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index f98bd02b838f..8ca813d68a1a 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -662,14 +662,14 @@ pub fn system_long() -> &'static Queue {
     unsafe { Queue::from_raw(bindings::system_long_wq) }
 }
 
-/// Returns the system unbound work queue (`system_unbound_wq`).
+/// Returns the system unbound work queue (`system_dfl_wq`).
 ///
 /// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
 /// are executed immediately as long as `max_active` limit is not reached and resources are
 /// available.
 pub fn system_unbound() -> &'static Queue {
-    // SAFETY: `system_unbound_wq` is a C global, always available.
-    unsafe { Queue::from_raw(bindings::system_unbound_wq) }
+    // SAFETY: `system_dfl_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
 }
 
 /// Returns the system freezable work queue (`system_freezable_wq`).
-- 
2.51.0

