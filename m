Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E451D6BB
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 16:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757347379; cv=none; b=UAGVUTBBL5W+HMFmhvBj+anLtHOWhHf+IxKHwzXKoW656RnvcGIRake6Dcbhr/vvNlRbHVIQMbzti+p78asGFtSpS88t6uK/+/kwdqlZRBTQ5I5lJXOkS6tvKLchX+sudSXCLdJ0Gb5ATm3WuP1F0FGYO8kusz7G2bVBAzLD2vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757347379; c=relaxed/simple;
	bh=muHMziR6xLMl/Nc8dXnmMmFgMfjZIGHcsmFG/iG/AVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sWPTHlO/EUkMp6Ejk5j/I8kstx73VBYktwyG1klvuN5CMYtPjUlSy9yqm7JEDBs2CYfzdY60OmVxPfjsE9siMAJzuXy/ynB4hLIiAz2BnAeIAKTX2VqcAJo8ygMV8qzjeSdEWk05jBLDCq2veFAgBMyoVWHZKZjS3LJr/fc4e+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GVbdwwkg; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GVbdwwkg"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso26107185e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757347376; x=1757952176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKLYuj1zBe0tw28xEet32waA8kdE40/dkPVFZ16WtA4=;
        b=GVbdwwkg6ZB/MQ028GQpD9wfeQ1pMxs53SKGv1LkLGlT6VL4eL6Kf1/yUHtjhsJcK7
         6Axpcnin+Rke50/kiXp1tAJiniCrQ2A/qllPz9ARo1Rv/7M5OZgslx3AgB9kNdExHQ4X
         YR9XpXa699KW0ajTysyT2LTmFSfQnAZ0BbFWIMqE118eogrYOzA9kJmVLf6/X73yUZFP
         T61Au4g5bgPU5nrZDVYB01yfR1SMSdzJQH9KmU+frkS0vViWmdir27kcJPlhfs018SD8
         UAVNCdumW+pj0B3lh1lnge2mBOjUdzKzFky0IAR7njT9HeQDzWtavjkg4HrHYJ37++0f
         78yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757347376; x=1757952176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKLYuj1zBe0tw28xEet32waA8kdE40/dkPVFZ16WtA4=;
        b=h7oqvu+R1LwykHslXTG4ep6gIE25zzUWeiXAU/HBMpbAC2xKFQjyS/Wurd31jLvlbx
         2Ehqw9xgji/xZXmgPq3ZxBQu8JHFS50xLM+R8rbA6YJUYNNv1pfMfUutuO/JfHiP6vdl
         rewi+zXiAwYBopZqH9G1aCh1xJemhg3hxkeFXn9fwsBMK70DSQT4uqu4NvX7PZYZdELg
         g9ousSsUK2caEVaftgJPQtMF9UTUokRfkxXTrjAhuOWzSbf2YYN5/DCfF3mhK7/YfGDX
         AoArNhIXq64+y3g6fzz3VltcfmFEx9YwtI0hQwJXGy6K1CiX7HdHB/LRnIx6adKtQmB9
         VOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT7lt1G789PB2qShhJW3X+z5RB7ht20lbl7N5gm7dEb9y9/WAgfSSAG9tkx0nnUkUoZEudYm7l66/XVxnurg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgfVYlNt3mgs2vTaPc9U5MMNxJARL63Qg/4qkJgn2t0NhiXF9j
	r1FecTvXRRDo6koh/ym36gtbXBNBXyeQMbeE+Hkoob60XPJ5mjUWn3qSQfiOr6YA3h2oG44++Is
	mPTBh
X-Gm-Gg: ASbGncuh41Fsj3ukPnyad6EaUkJrnwUCVSVaZBScaWekK8YmFPafxPJjiKBy4ReXKWv
	XMrdel65OTXOnuEEz+/UoxIJ41S4dvRAImh0Iln5BHUc5oEy24uQdPIW7dUlIRoAUo/pwX8k2He
	UR85OYWseOdfP61FFRfgjrfUlqqegznaTsLSK46qnD2sEK6ranHRQ1dF4at7CDWRcO0u27F5+9k
	gQ1N8Kr8xZYe8V00Iszl3dZAkjoZSjtaxQOUKe0Nyt/z6XkzMrjl3+mGsvRhdNjFTPcC2A7EwUM
	iCKp2KeVQmeqYuq3sx2T0lC5s5dpFfNsVwmabekIMf9RQbM8C9i715TkCESpaIpq9535UBQs9Jj
	Lzo2hzoWscJMsw8/mQLrnNyDvPKVQh28DtIipHwJJs0zKFvAe/qf9uNYTT5r3ZJegypLF
X-Google-Smtp-Source: AGHT+IFJVlzkmZHaBFQ14oRcj4jOEGD8Cc/KwQLz2s3/80/2vatwZ7I8ZaHS4qGcVAYrVKzg+U3RXw==
X-Received: by 2002:a05:600c:4688:b0:45d:d2d2:f095 with SMTP id 5b1f17b1804b1-45deb702e1dmr14497635e9.19.1757347376105;
        Mon, 08 Sep 2025 09:02:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45de5eabdb0sm55358075e9.8.2025.09.08.09.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:02:55 -0700 (PDT)
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
Subject: [PATCH v2 1/2] rust: replace use of system_unbound_wq with system_dfl_wq
Date: Mon,  8 Sep 2025 18:02:23 +0200
Message-ID: <20250908160224.376634-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908160224.376634-1-marco.crivellari@suse.com>
References: <20250908160224.376634-1-marco.crivellari@suse.com>
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

The old system_unbound_wq will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 rust/kernel/workqueue.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index f98bd02b838f..01e331a1f11b 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -667,11 +667,18 @@ pub fn system_long() -> &'static Queue {
 /// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
 /// are executed immediately as long as `max_active` limit is not reached and resources are
 /// available.
+///
+/// Note: `system_unbound_wq` will be removed in a future release cycle. Use [`system_dfl_wq`] instead.
 pub fn system_unbound() -> &'static Queue {
     // SAFETY: `system_unbound_wq` is a C global, always available.
     unsafe { Queue::from_raw(bindings::system_unbound_wq) }
 }
 
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

