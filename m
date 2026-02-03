Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104F73B8D42
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132514; cv=none; b=dvPO8ibaFNHYMI+a+HiGfHNQ3gFajo41dJ7dDZPfyLDWxY9vJ9O4bIZZouzLDMBL/cAdo8vZf0sz5js1fdP+uY1e5ouBl7JSOJNVNJOJtohUcN+u0AimqDDvjl09H9voGjl1U4+iiCeyJdjVBzi4th5mhZaxddZpMAisBTijQi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132514; c=relaxed/simple;
	bh=VjzLcMYnMGzKi+vu/uescVXSKcvPTOypNKURUrKD0zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dIDRWv+bJ+eIbygTvWn/2pHRfWFgjrxtu7nQSPkhpiv1sQH0QhuGaaZ9/SHqTBHK0NqPMPvqr7uF7zbB2xfzfGcLSMzI7qZW6ZRxX5I+HWJ9oAAqZnBzWEg1YxXHxUxjb3dvZTmo4StOkBztEdROKKMtp+KGjYDGC0BnsOKj3vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GQq/6thX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GQq/6thX"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4807068eacbso48118545e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 07:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770132511; x=1770737311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jptYRhOowxSmX36W8by/N3vMS3FFkCDr4M7jwT5m6nk=;
        b=GQq/6thXahLRrplzKuyBshQHOLW+RobAKmuZvK2fq3g4wkjHm7zNq+Wdc+RI1G5+y4
         d0zSrEC95E32QadKehXxUdTkDRDSRuigqyyD+ylyAkgToyZqMGLxaL2qkAW7EouNF+HA
         peP6hv5QMHaUN64K+LZ8yvlXByRBgJY3PFu3PDS1aDxjrTrXaiCbL8I+/3dZ1PcL24G7
         XSZsiDk2ROGy8tKGN7d3ut1mvsGZ+t5HwydS6mE2+me9lkEAU59DVk7l4FcjQsiO/6op
         PNXHidwK8qvsDFy0HwxSQ/N4pMiz+fKBGmfq/bhc9ez5Ozoq/XLxxX2s2to7dRqOiEUS
         0zNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770132511; x=1770737311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jptYRhOowxSmX36W8by/N3vMS3FFkCDr4M7jwT5m6nk=;
        b=C5xtnkLVk2NWRYYfxR8jPW+CagLB7fLzSenFKpXABiaN6M6zV6b2TAo5EkIuGi5Yw1
         o9d5JuP2TBOyNVKL74Q4H3GiiW1tQk4+mMx5cekm6EdIGySnXSK8ZQ0mCgkfGekCPpqu
         0LBhz3+pJ9kWY51AbENIpN8beSO9Gl676HN/wj59hLS3H77eXESJHR4Ac/E7D5o181LY
         ir1zjjPY/a0AQthHVt6A/arHpz7UJn9Omm+kEGoget7Sy1L6Hyu2Px0hMyWD9Q0buSvx
         DEsQXuLP7WMGObiUiSz6STyPKxYDbl459HQgtRh1KnJ03/hixrXLQlPTqtl/USTYAizl
         fmhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqSB+l9tp1q0EwBLunwGrEwDcw+8HaIHJfnnCHEUckkSPRjDtxjDlXDL8D0KaFgvUq2w2rSTqbMVNOFTobtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgd+n7kJNAwKCbcYLi/uxqo6abCVKvpqIKe7L8o0Gj9hKfeWCq
	UvEaIQtKwXcpngfVGTDjnxS6LbqLSACzgY0rFHMr5Nzbn6VUL+Ep/oZ2aF5yXvixTGI=
X-Gm-Gg: AZuq6aJyi3N7jyIt82m5uuEOQ9EVImPOuTy9IoA1S2ed95ZSMeChEiGm8BWbMkU1wMW
	mGmkjssBOO4uOIsW6+WW7NWJo0m1nyliX+IQa3o4liu/Ae+l/S8k+iwiuLPECPmK7wgDXRgjtJl
	OnT16ehvaSuJs7VotVY8sa/p6dLYsuYd9fB0gwcBn6jrbHHtAayJdR3UUAYMQTiOqAirk+9vwI+
	FPbrhg+Id0uTlZBSTpY7eAySa+EJeEcWF2YtAPMrB041QvO4XJhUCxGQCVbL/BMwMn1vQZpU73h
	umMPsCFURMgZTcymAJc6fEfKrrINwctkzpmY4a7KjKUSDXNsMgTG9tuKQm4ElIHrPs+nBWSLit0
	9VjtK0+Zy51eO4GB79j/qbqQw/u/yXAnNv1QGY4X4mYUTr0PbMaU+KTvz/0+iW34X3+yfGd7ttg
	97jjKUy4+aDNG6ELbztV3AkPqZF8aYa1qRbBsp
X-Received: by 2002:a05:600c:5491:b0:480:46c6:bf4b with SMTP id 5b1f17b1804b1-4830e92a73bmr467905e9.5.1770132511405;
        Tue, 03 Feb 2026 07:28:31 -0800 (PST)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483050dd79fsm71316005e9.0.2026.02.03.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:28:31 -0800 (PST)
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
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [PATCH v4 1/2] rust: add system_dfl() around the new system_dfl_wq
Date: Tue,  3 Feb 2026 16:28:16 +0100
Message-ID: <20260203152818.317806-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203152818.317806-1-marco.crivellari@suse.com>
References: <20260203152818.317806-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C code defines 2 new workqueues: system_percpu_wq and system_dfl_wq,
respectively the futures replacement for system_wq and system_unbound_wq.

This change introduce system_dfl(), that use the new system_dfl_wq.

system_unbound_wq will be replaced in a future release cycle and should
not be used.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 rust/kernel/workqueue.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..300cc2bfe012 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -968,11 +968,25 @@ pub fn system_long() -> &'static Queue {
 /// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
 /// are executed immediately as long as `max_active` limit is not reached and resources are
 /// available.
+///
+/// Note: `system_unbound_wq` will be removed in a future release cycle. Use [`system_dfl_wq`] instead.
 pub fn system_unbound() -> &'static Queue {
     // SAFETY: `system_unbound_wq` is a C global, always available.
     unsafe { Queue::from_raw(bindings::system_unbound_wq) }
 }
 
+/// Returns the system unbound work queue (`system_dfl_wq`).
+///
+/// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
+/// are executed immediately as long as `max_active` limit is not reached and resources are
+/// available.
+///
+/// Note: `system_dfl_wq` will replace in a future release cycle [`system_unbound_wq`].
+pub fn system_dfl() -> &'static Queue {
+    // SAFETY: `system_dfl_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
+}
+
 /// Returns the system freezable work queue (`system_freezable_wq`).
 ///
 /// It is equivalent to the one returned by [`system`] except that it's freezable.
-- 
2.52.0

