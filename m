Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E1327E7DD
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Sep 2025 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063313; cv=none; b=WviysZAVg5dffM8o01TFd91BjVZ+V6OsYstx7NvIhtCqco7jhEPKqK9iAOh0SmnvKbszL5V2a2pje5Xk6LswkguG1LIBnFKarDVGDqLpjhm0Xf7Rf5hgaPy42SM9pYhDfPJ14lM8AOlHCYTuyMoWEEvUiPwXQ2SGN6m65yrNDHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063313; c=relaxed/simple;
	bh=26Tb1NtsqwZ1rv+sVNZuBfdl1j0yHZvMb0KD02KS9aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaF24Y0XJdc+T4YqZ7kd0lvTABSsi7lmleiXDgGiRwYT3DEvsDQ3wXe9rRKIZA1D7OkIaEMHnCgughmxCJirynFM/k8mB16yzrJHi+STKDL/Q9fDRL0rqPrOvX7seaF0JcWkEDZsdtfR/fv/xYOcqC1yYKySNTw7ENrij25fKcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M7CRSVSI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M7CRSVSI"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso7518815e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Sep 2025 02:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757063310; x=1757668110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsx4ro+fg1Da+fZ6k37g0k5i+Ei4r7saLuhpbXY1yMw=;
        b=M7CRSVSIPdrVjHEiX3ynHHUpvetOiCRTKsJgCPWe7bseB9Q98YLQLGSBwHbZeGkpQE
         /aPocbNzlBPzXITNXx4BztXxA7ChXEiSD/SNq86d/6JBR/P3nzh1KWfjigJLMvgkg7m8
         J6O1ZbgnxFcrdNLJXuVy7D0i/REVhCWNQ1kC1desbMJ89+sJe39gBXmtq3jiB1KbN+J8
         y+VNjEF1H9xAuMwgxgu8MX0pob/s/HsQp7qsz+3zHu4zwuJogTmTtHkwqgfWLtzq9Bqi
         w8dfZY2DWBe8+3w8vLnPEo3zUY2OxdwCktLcbWtz1mk/uZzlMipltfboP7sP1M+3UMea
         nQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063310; x=1757668110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsx4ro+fg1Da+fZ6k37g0k5i+Ei4r7saLuhpbXY1yMw=;
        b=N/rxr4aqi/CKVuJlGpqPWlKmbwLZ22oeKMh99DinR3xWmxPRUZUrf60ry6o7My3DUO
         WnJX2r+djdG18F5uVSiuC0kWh7EzP51Im9rOceDpIYYoyPBg9dTht0A2hYLjR1nwQmau
         X/Ssd5sFxNimP7oZ9A7JaSCrOYpaEYLzoasxgcrkRAALvR5eQcWtMRoS5A/un1GExWAL
         FTQyCXTCp6GR5MNcIQ1SCYd/QEZv0k/h9nOKAjhF7trEGwCUwBST018EkpExQDLFa/rl
         w8HwzwZ4hBZiBpFS3eu+eG6JNeJOjVUb33/DvO+ZoJfcKX0htYuszmotiySHfOqYWTCo
         aIvw==
X-Forwarded-Encrypted: i=1; AJvYcCXb/g6LxYFndFeIwW//LKpcD70w017HnCPPo0Fxxk4JTofY1jpjJu/47VNkk3P5eIdFkVeXXlahA3cUBf/ASg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL35HzBFRtWKjl9CyFpO6u4+PXySSvngSS46nd/BRE8x1246ZT
	YTb6dyg49wmD4OZxyPzi1QR4DLBD8A92fAzm4Qj6nKysS2793d/OWoJOL8p6qmT65Lg=
X-Gm-Gg: ASbGncvRWLzx1BQwoKWGjinXud89lW1QFcxUSw+cD0QqcW4VGpQpKhpDiKK/UPyo7H/
	BxdIijJmHdZOCUX8BVBkpOaWFKCn8hOP28zQCjlqTDpKpOnV/yKaXHr3QMfBQBSdP3wsxycXim2
	6VsK8Af7c/HRq6RzhC/Nowk+9/oJ4RBfuI65l20ozzQC4gQ/uD5P38gYlvma2iml2FYD5drX1/U
	kBw85hEvUnPhIZhXKQiKjDUTV4FJMKjZqnm8CcRkoemb7J15RiW3Wqmcb63ZbIRpQ5a5hTWKdBh
	uPKRIIwtzIVm+y3b1XdkIl/WJuTSSXvw/k0PMGEmpcsMEgRR/0qSW13m0exoyEa0X659fK3AMVi
	f19CAGNjGWjHaQNQxCm2acvWL+U5s3JL3ThViHDYqPpLZl1ctHIWuBE1+hg==
X-Google-Smtp-Source: AGHT+IHUYSE4/MqB/EOjKjkztpcu59mOOTXF5Ahf/lvz7h2oStW1eg9hrquGPbwauw4p3kcS8EXfwA==
X-Received: by 2002:a05:600c:1c08:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-45dd54a5b31mr22217865e9.1.1757063310044;
        Fri, 05 Sep 2025 02:08:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0350e80sm68900805e9.22.2025.09.05.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 02:08:29 -0700 (PDT)
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
Subject: [PATCH 2/2] rust: replace use of system_wq with system_percpu_wq
Date: Fri,  5 Sep 2025 11:08:19 +0200
Message-ID: <20250905090819.107694-3-marco.crivellari@suse.com>
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

system_wq is a per-CPU worqueue, yet nothing in its name tells about that
CPU affinity constraint, which is very often not required by users. Make
it clear by adding a system_percpu_wq.

queue_work() / queue_delayed_work() mod_delayed_work() will now use the
new per-cpu wq: whether the user still stick on the old name a warn will
be printed along a wq redirect to the new one.

This patch add the new system_percpu_wq except for mm, fs and net
subsystem, whom are handled in separated patches.

The old wq will be kept for a few release cylces.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 rust/kernel/workqueue.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 8ca813d68a1a..6f508c3e37e4 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -633,15 +633,15 @@ unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
     }
 }
 
-/// Returns the system work queue (`system_wq`).
+/// Returns the system work queue (`system_percpu_wq`).
 ///
 /// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are
 /// users which expect relatively short queue flush time.
 ///
 /// Callers shouldn't queue work items which can run for too long.
 pub fn system() -> &'static Queue {
-    // SAFETY: `system_wq` is a C global, always available.
-    unsafe { Queue::from_raw(bindings::system_wq) }
+    // SAFETY: `system_percpu_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_percpu_wq) }
 }
 
 /// Returns the system high-priority work queue (`system_highpri_wq`).
-- 
2.51.0

