Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09372F0C7E
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759936575; cv=none; b=BPeb4oqCcUWbBWhhNolD80w4O4eELjBBl/UTHLEY39pNpZBqUtXcli9HdYWYfvrmatfhB9/Qd0pv5vTKaw9PAwwrUgp7NYFjKQkTD14TwA2+Z9DG6lHo5RD+GRiF9IZo5w/LwUoiDsMs5A5mSh8aL6FvDkTTVLBK2yeBoS+nMxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759936575; c=relaxed/simple;
	bh=P3XtCirKpzXiFyLTIEO5zaf6KHOwFgqDimiakDRVvv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbRBEo6VGrvKIyzvBr4X1wbxB3vDxmVlXibWPUK5qg7z+g0IgBxYAvyJ1km+llgTdHl+tc5pZ09nXKK7tylBewBlLYeKOxdsYVaMSQD/84IMgfsy+5Stw2wfIXgCvOSwZdPBInaEyi02uj1fd0+DTsW2h9sicqdgpNUvSgZBD6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AuDUGqzO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AuDUGqzO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e2e363118so68928755e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 08:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759936572; x=1760541372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STZ9f1EAsyIXOB+9LRtr2f+ELao4rQK8RBLW3J9Lypk=;
        b=AuDUGqzO6edVCr8C8I7vSZTmBthuY88TUKCSlq+n9BsDKokp7biMrQvuuoHxbU07ad
         SiUn9rcDakSWWB/3lVFmwMvf3RRD+kxvtnN2zKrcQFcniIFY750iMBII1BXbx5NatJgF
         O3hc1xzvyJXFoX3958EA342s6Xjb7F7wo2/XXzF41DDnsknsoS5om6VUNUJvglWPwFsi
         2BK2JJTsn1FHgHw2pY+SjQUeIBFT7tmSHTj6b+VhH8w9CynQvt1Jiyt8u83wTr5uzsOj
         1IUNzQGJCzHZhmG7LXJyba9KKHG4KqCnBCpq2wIvuZ5HojTwR/inHKZz/encbmIDXMb2
         Kdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759936572; x=1760541372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STZ9f1EAsyIXOB+9LRtr2f+ELao4rQK8RBLW3J9Lypk=;
        b=Gk08WNkqrLl5xf9LuTgSSB0ClWKjvkj064opS+3nUmZPDSpHDdgHBbF/cHi1PMobUP
         fI/dQ1WeCdOqvaOUmzZb7meixC3fRcRSj/WvXC257U2KAwMVGSqSF9n1W9la9VCLIotj
         8K1YhcJv4N6ygBN4rBiztSXP2cSqSNcMlvvvw/EEB9Cpyd2UK+VclzsXyg4qgfe3Le9h
         /uZhwRv+1ELwa5HCgZ6ebEAslYMWYkKGQpXLXW2juCSJKlfL9qo48sw4XUJ4jQ2hqzJf
         kYdpOD872tHPoq8258mrT00ew69/kvYDY6X8IN1bWvjksNs4VvDPpXy5IK6yOE+gpqKL
         WgBA==
X-Forwarded-Encrypted: i=1; AJvYcCUGz/tFTT8xjZRNBvx4yU3x0YDqtZ13S0i82bPX14rg0EuSNBqKNAJ1u/za+Rmn5wOomznr4aihhOzedP8nSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSr/KoRa2zdCF+TMDjcSzivFdT0LwlkoqxJR8zVoRkDb1Jw8Ao
	vDGqeaVCG5/Ml8iHFruiSZMiQPPefko+aMYjJmu8WViyAYeb70Jp952qX/88Qxc0TKHsYIrbfjW
	qDlu/
X-Gm-Gg: ASbGncst6Czgwoyb89L/wVKBoZreL5ByhkAEoGesHW8iKO1Be0EvTNAJlyXa8HLQSXd
	GdYVE0s0CzEwp5rPxZKdJUrM262p5a6SsYUyudBwlHWwZ15GbVafueAuMsOvRGo9a612P0sv6ba
	bxTRfYpKv9kcE+uGQTKPkrkcPgWKmcceoRS4CeNC7ba/dbqzLpWJtJKyEoHl0eswg2uwnFaElbe
	NyO8vPinnzGPmxgJve3DUkYcZlgnZgQRwXC8htMCY3fYeAfTowIrqKnyLyb90K1eNunp21Fo111
	JfvTUENmZel+hubtwi1TRwbcO57GFV1qlQn19MFIiwKTBcYE8bR+2NFc1AQS+hAsIXbaBE99onU
	Yu5W9WuuiCJLxRU04bCIQAtVhom6PrglS+9PDxog4ZJnHmmWIWceVQSOvJBvGdZM=
X-Google-Smtp-Source: AGHT+IFKgYgrLRynw6bajlFj0xIITfwp5pN//xulWCMS54+UQh1/HQxMEhuAUHQLbli25xjWxnjpFQ==
X-Received: by 2002:a05:600c:4e94:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-46fa9aef553mr33537225e9.24.1759936572083;
        Wed, 08 Oct 2025 08:16:12 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf8288sm42480555e9.2.2025.10.08.08.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 08:16:11 -0700 (PDT)
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
Subject: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
Date: Wed,  8 Oct 2025 17:15:54 +0200
Message-ID: <20251008151554.340806-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008151554.340806-1-marco.crivellari@suse.com>
References: <20251008151554.340806-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C code defines 2 new workqueues: system_percpu_wq and system_dfl_wq,
respectively the futures replacement for system_wq and system_unbound_wq.

This change introduce system_percpu(), that use the new system_percpu_wq.

system_wq will be replaced in a future release cycle and should
not be used.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 rust/kernel/workqueue.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 300cc2bfe012..05f213444b91 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -940,11 +940,26 @@ unsafe impl<T, const ID: u64> RawDelayedWorkItem<ID> for Pin<KBox<T>>
 /// users which expect relatively short queue flush time.
 ///
 /// Callers shouldn't queue work items which can run for too long.
+///
+/// Note: `system_wq` will be removed in a future release cycle. Use [`system_percpu_wq`] instead.
 pub fn system() -> &'static Queue {
     // SAFETY: `system_wq` is a C global, always available.
     unsafe { Queue::from_raw(bindings::system_wq) }
 }
 
+/// Returns the system work queue (`system_percpu_wq`).
+///
+/// It is the one used by `schedule[_delayed]_work[_on]()`. Multi-CPU multi-threaded. There are
+/// users which expect relatively short queue flush time.
+///
+/// Callers shouldn't queue work items which can run for too long.
+///
+/// Note: `system_percpu_wq` will replace ['system_wq`] in a future relase cycle.
+pub fn system_percpu() -> &'static Queue {
+    // SAFETY: `system_percpu_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_percpu_wq) }
+}
+
 /// Returns the system high-priority work queue (`system_highpri_wq`).
 ///
 /// It is similar to the one returned by [`system`] but for work items which require higher
-- 
2.51.0

