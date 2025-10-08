Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F872ED16B
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759936574; cv=none; b=lz0UGadw8fPhNi/bqwl579d7AMa1V9HIrUuJHfFk1VqnEbE6IdPkJg5puS4FFitbMzmh59f/ppb+TUKl2lqZPC1hCIWzWPvUZxvQ0jLyoGmdnl9FZBIZ023IbQjmWT2Q/kKA5Up4aDb1f+Yba5feIN0E1feGdHuCjATuRM255gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759936574; c=relaxed/simple;
	bh=ais4VBo+OWtnTKJxBodRn7FQGVFsUHCZFYAfIWOzwCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VANZJ7iVCypeO5Mzog3qtrxYeCAxBQo0tLllRMXwNnRUO0SyG8nRvVoc265R7ADXR+pVvFYkRYZG77YSc9Qqftu+dgUl8GRyqc+OYfk3tF9t/Sixlzh8WT2JHN7MNk9L+/Z4Ok82gCQF0+mvDreVXmpRuE/EM6pnAGHiV49nEwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PLLrhrOT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PLLrhrOT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so71623305e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 08:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759936571; x=1760541371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPMYQnkDuAf+CRUJRE2Sk8y1N15ePx71ZP84+oRsHdc=;
        b=PLLrhrOTvjYcR2EbQTuW1lTnVWPsWn2+dTY/2Cp9o6HBVZ1bb7UcoDKpvShSAeS6ZD
         T0g1J5l950R5/3BNEtBV/Epo41fIml5UqXo0U7sxAXRURHhHE7jm8Pjg9kmc/I+vR0fE
         ERfI+dpZu4hQQfziu1k7uTz3QgdLFlq+cfOz9djmuLNQxwz/9KRhxuOMYtF8XbhY46zl
         1FwEC6VgT1ZdjmuabBz4Zae8edt4s+hBItO9+QLL2VvK1ei39PQ3Ckgy4OlCT7JXp0TW
         a7mrnvkVt7TTsxVpD+pitBUfIU5n9SZGS6XGDbnnXCMY+46eyd9Y67PW2xvednY9YWrU
         MJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759936571; x=1760541371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPMYQnkDuAf+CRUJRE2Sk8y1N15ePx71ZP84+oRsHdc=;
        b=Z3jw5FVDI5rMNMwtCw89KnjPD0jgGmd/LXSyxfFX+awxCcvFPQu4YmCCxL4XHK7qvb
         YUACDqswb+t+xNADlnoPAQs7fiw/LhEzwwLn2NgaBI9A6qxmp7NwT6gBKCMAHKOAdIBv
         ux7YVlhdrQZN69gRSD4ihR6qQBVfud0bQEPynuwYEpLKE4uuF6Qn8pCYglNHPlUwEWoB
         DKGBu+H3sNqPErjqPKxdVGUIt1+usY+QPo2zye/IuahKh2R2VE1qD9zkw5xQrYuAxHl4
         lfpC2rktvUmdsMoEzRgiddQJCZhpuDcjXDiS7//NgsYeEtCuxQGnYAAyg4WAnzFYnGOC
         A1kw==
X-Forwarded-Encrypted: i=1; AJvYcCUXQshhOgJODARiD0/3YVdUc/ZASI8NPg16LVoQGiqvc1axjo7roMfiXU+gbGfUid5G+HBWaTTq55DSjdkPQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSYqoldplfWCrHdRgEO1fAFF6JKrZHgkfyeNQgqDs69dIDm82/
	mvggAXbv0rMi0Lo+kl9whl+IrDL9EjIY9nSUeupDMDL5bqn5m6F0sfEdmnsWejHsbo8=
X-Gm-Gg: ASbGncvw/q/7mmeS7Dj8kUwvYqtjFSMyxEXDO2HoVw0aP5JWucc7bXDcc0XY48XnjpF
	jpAoc/AJI1vh5ADBCh4Y0eZIWy+7fAfEW/++ESe9D1+Xb9T65Qg7GKlh82NgzHlktK2P5w7e95e
	ekzxyRi2TH49BID4a0U5F2NsIx66cF2WXD8/ZeGldpJkcTuac50GyKoJzsJ56xQ1Q2MmUADlml2
	j2I7SNPTTb6ykDee3QdIpy2C+Ah1O/Hq4QGRKXDQQP8N3A9raURash8gb4hMLPLGf2SXvhyYMmn
	dxCVOglHltolG7kad9rRnbScM27cWanHSSqjXo+ecpP8LVk955pzyD3/mr9Hgu+pXIn113Aiv3A
	shtNMFEUPFxDXuhnmsPU+YRagKJ+JY2dsgS4F6uMK75oPMa8hAqJnAAWUqKiX2VSRN0ZXDcbw4A
	==
X-Google-Smtp-Source: AGHT+IGTlYpcQn5B2r7Od+8utSka0uBV7TXKo0uGzLvdZkLEJ4rBleisEUkROXH+El3mxXEyM+w5Ow==
X-Received: by 2002:a05:600c:1e8c:b0:46e:46c7:b79a with SMTP id 5b1f17b1804b1-46fa9a8efbcmr27903965e9.2.1759936571060;
        Wed, 08 Oct 2025 08:16:11 -0700 (PDT)
Received: from linux.fritz.box ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf8288sm42480555e9.2.2025.10.08.08.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 08:16:10 -0700 (PDT)
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
Subject: [PATCH v3 1/2] rust: add system_dfl() around the new system_dfl_wq
Date: Wed,  8 Oct 2025 17:15:53 +0200
Message-ID: <20251008151554.340806-2-marco.crivellari@suse.com>
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
2.51.0

