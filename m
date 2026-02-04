Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A041C31B
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 15:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220258; cv=none; b=jqcdHLWFRDwUO0WSAj1+5r4stQ1H2J6XFz9sYGX+m5V40HXK7j5tOsDhhm4pjf108Zt2YXnbvlZsvPOQravBtieyD0mtyF315DKONeXumsVW1P/i5bLIZfHmWtYOe590Ja3apYDgOSF03ilm9NaFmwzezBoUnECW6yek61WYYEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220258; c=relaxed/simple;
	bh=so9g/9Fhc/PnB/Oc41ncP75JhzHK9HwO8kVevup0eEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbJU/HeushsoLnF5udZECor3ojoSxvufltOS01HQ/6Il+SoN0IOOjFSVCGOLf/GtXtoAn2iFN0lJWDCWiIvrSciTigUYcq3MJM3Oq8E/weo5w+/yobWKm9/z33Q5JkZD3tEok6zI4d0pTsZ0MJBigMNbrjjbMy6/rZ3/M9roUak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IjXODi/M; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IjXODi/M"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so94693335e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 07:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770220256; x=1770825056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uT/xyZK4EJ/ek5utcqcmzn3TDnBpie0X0xrxkYJsyXI=;
        b=IjXODi/MB/Gm02Zeex7kWOOiYJqL3hfs51bPVGVLE+9eVxEKwyoQxvrPcbY54EPwar
         /wQSjJLcd5KH6f4bi93uSUnICvLAoZvwA5ZJCSRI6UJeWqVfdmdlgkmikPg5dyRh0ckb
         BjSZz13T/5tndXFhM91XDryN1un5MusRgcIlabzunMPJQ1nRd/QjRTdBfdc7M/lenbwO
         2wEG9Y9XfhlY+jE9J4wpUbXCop2HJGU68SKxSGZY5vDYWXpsE05YVszSnPu4oBB6XpP+
         wZmRjDkRJptP6Ee2JD5MKHTdEOwOrlr8hPKkxiWIDqV4W+xFD9an1QAAuwdfI3IxXQQu
         WV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770220256; x=1770825056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uT/xyZK4EJ/ek5utcqcmzn3TDnBpie0X0xrxkYJsyXI=;
        b=Jiv5M+1U16P0IjXU4pp5ylnj+MrnetLN3E4gWjFm846OFAxPjRdGoCymmG2KgpYmxd
         BIS+gtf3kpMsAx2aK2tZeB7BtxoQZA7aqKSI60KM4EXe1YKtIr07mipdhq6yUUI/GYsl
         egR11OWNa82OyFBD2Bpl/siwXN0xOrbvxU1XjLQTpSqFRvYVtIjAc5fcYWYj3w6hJBxt
         dEMQ8UElACNFPbl26VkZOXWHfmqDYmtwSLrmtuaivR85A8g0ukVNytb9po5Z1zOu6ClV
         AvHboiDA2AO0SqIw3fwGKU74Fdq4+CRqUayJJbEcSYb7yGKOdv+1EJfx4hAZJDVGpduT
         u/nA==
X-Forwarded-Encrypted: i=1; AJvYcCWSeMdICPtaLkfLlR1rV1EXKlCZCYME1ZrQ9FAsYjrDbZKIzo1fJhAvtM7VF7l0o/eME5u0ejchJDd7Na/qSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8EF5zscNL4LZTItqzI/ZIGQevHK5sod42a7qiyvaGlMPgGow
	bYQhlDmkVqtqeTD6NyEfi7F21Df6miDaEecgT7+pQh1Lrpax/KReUQlti2EMOB9Fw5o=
X-Gm-Gg: AZuq6aJHYMtgYfESfDgyGzwIGR5fIR4ZMPL8UTbuL7S6SOgdgocQAehhc0Y4+KH4Bpk
	8awMXLilxbxCjKL/k30H3EaYTYrokefVu6xlHE4jmfl7X6HsqyngL9mPqnhRy1dIsJqG/b0Or85
	79IEBwt2NDJ52XV9K15WQQ7Jn9ps8nzx41Bvw4ESJGF/1GwbbsBreCKRfbtgnhweDr2/RtiB7d4
	jR6a+LbZYQRsv3k3Ow79D6q9rBYQoSMY4ElrCup8vmaD/ufNZJ+9EjsMVbtiSw5QDoqF57mH9MF
	OkaJlglhrulIHL3RYOjSijYhpzZ8mYgvyL67OzZVSsSCMFjnuxL9VQ9M28Q7WmCfLcRbDTzOcD3
	xP+YNfXeyvyDYAMg0NHIfe1KI5jjHq8w8cW0+Ut559RWLkah9yiCGaHZROUABtPqTTIsOlqw/R1
	qEYIffvmQHLNO5
X-Received: by 2002:a05:600c:810b:b0:480:4a90:1af2 with SMTP id 5b1f17b1804b1-4830e979f7bmr45721295e9.35.1770220256456;
        Wed, 04 Feb 2026 07:50:56 -0800 (PST)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483107e62d6sm51879535e9.0.2026.02.04.07.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:50:56 -0800 (PST)
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
Subject: [PATCH v5 1/2] rust: add system_default() around the new system_dfl_wq
Date: Wed,  4 Feb 2026 16:50:36 +0100
Message-ID: <20260204155037.325482-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204155037.325482-1-marco.crivellari@suse.com>
References: <20260204155037.325482-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The C code defines 2 new workqueues: system_percpu_wq and system_dfl_wq,
respectively the futures replacement for system_wq and system_unbound_wq.

This change introduce system_default(), that use the new system_dfl_wq.

system_unbound_wq will be replaced in a future release cycle and should
not be used.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 rust/kernel/workqueue.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 706e833e9702..adbecdb2b3a9 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -968,11 +968,25 @@ pub fn system_long() -> &'static Queue {
 /// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
 /// are executed immediately as long as `max_active` limit is not reached and resources are
 /// available.
+///
+/// Note: `system_unbound_wq` will be removed in a future release cycle. Use `system_dfl_wq` instead.
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
+/// Note: `system_dfl_wq` will replace in a future release cycle `system_unbound_wq`.
+pub fn system_default() -> &'static Queue {
+    // SAFETY: `system_dfl_wq` is a C global, always available.
+    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
+}
+
 /// Returns the system freezable work queue (`system_freezable_wq`).
 ///
 /// It is equivalent to the one returned by [`system`] except that it's freezable.
-- 
2.52.0

