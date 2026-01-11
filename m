Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56533D50C
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768133018; cv=none; b=A5LDwzqHA9fqSz1rOfjWc8f10znQP2jxGR5GQxIV7gu0Hp57Zi7lUvU0mG3IRyZ4KbP2MfXG7YzskOSgJhXf7kZAvelu+n7i89OqIuGfheSu72sE0IbbWVZOnlDK4dZVfGIwbmBV5LAR5d8TWyirZEIdEzc+vvmEeWhN3ReJgp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768133018; c=relaxed/simple;
	bh=lrQHBE7d1WJWbGHSuCmYsYocNSHOqWWhB6ZblnGihS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lF/+YzsimTN6saBCQypW9e9/r7ar/8h2NlKPS92zxk/SJ28xQHa+FUaRFBt5EsJF5pUnUu5xeRbh6//4mn9ibIsBYLbgu4ePgp9UTduv7zmGAXrkSn/9fo07Y4Qm6x+TzK8m3Mcz/GHmpmKQs+7AqbNSoz+8VZjeViCkrHbqaRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJ5KXKE8; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJ5KXKE8"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8bc53dae8c2so829766485a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 04:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768133015; x=1768737815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXTOtxwex6FdrnsIKkhPwOAR5N/pY3FLlHdZL+u97wY=;
        b=EJ5KXKE8q74l/AldvFcDR7iaeBQSzT6NWJUfu6AoJhCQh30TEnlm3xcadqwH0k+wPr
         UukFIyNAt6w8bTRLHajDZbt4fBmWVlnLgW3XvEeofUr5T9y57MvCzR7gv+2GHUaXO1jI
         n11enQOF8ffWhvrY2z+oGtktTH+BmGsnT53TQWc0bziiMbnhAgIkpGPL1IeBxSU4YiVW
         1EuSHEJ0oHSKUYsoXS9x5eL+JKBgUtiiEwhqwRdCbsU+JGsvH0AlZsHGbC5Xjj9Zi8Nh
         JXmiWxA0lSmcNLbMCv13vLQIfNt+jL5r7gDNdR0BIvXc1eAW0jsZfpnsucbSykM/J8jN
         7lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768133015; x=1768737815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:feedback-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXTOtxwex6FdrnsIKkhPwOAR5N/pY3FLlHdZL+u97wY=;
        b=LVtVxkntA2wcJiUaEccchscHRasf2zDA6RO/ERm4BaXzdX5Zc/BcFH6ryoo/w9q0RK
         6AN4jtS9JcLsIYWp3O7z5tVW1gQ0XYlqeYwjWjXtRS+FecmDZD9xJKOUnRsLE1v6rmPv
         8LQIur4RKv6GNaOQm48n1g1gcpV8JdaDybS4abZbI7jusMvpfGYS/I0/xVOdTJ14t2Nt
         w5m1zmttjTybmJA5PrDBIMJbt9tIInCmvH985ZU49yZd70woUAQcnNSr0E72SGj/QaT5
         amMwilYSt+6EzApiC5ooyiuMtw/6BCPY9S56BsRvj1IUHAegu2EOyGAZJlvBT9vpWNMG
         vbiw==
X-Gm-Message-State: AOJu0YzZSBNhdjTmqb/hKsbsRZ1TQjizEHmr3lCPo8E9eXWFCDfZqJNB
	4abuEJnkItXlbJKaWVYUETrw4J+VX6BpkkA9FXBRqo0Y1uzl8yhR5nuB
X-Gm-Gg: AY/fxX52Kkv3u1tvb8jz5yK14aGApLS+psPX6Z8SsCm5fgxndr2fzcSNtYcD7IE12VA
	mxXQvNyuYKXVuTUn+j9pacCwDFz+CJE7cKiaDhuGLO6TKRnDJpFf88XvwhNtWOUX14v0O47W/dU
	snibubvtWbPp7LLbUBp6zlOAvNdOgbbo0z67gHc0ZxTlKJ9Ha3Nnqn+LVIw18hH+D3pj4KwDPXm
	V3qR/vaFpC5IaCeXB0hvOSZlA9/C7LefhR/tQEPTXjdH/P31PD92TdtvQ5uxsTfHbM2pCJmSlB/
	aXCavxMUW4dwIeayb2FUiglPc2zYssnH1faNwjtmhF/Cz25mnV5vN1iCghzn5NlzWKfMP7b8sR7
	qZaMlRMzJhDBG5qqKlTHQHH7Bo0FGSo2Lw7J5EkV8bpyLTZ074FxPrJX5fM2D87X559OB3EJB89
	3b9jWCuep4sNnIIT4I/WI3tuaPcSHw/YApQl9dqcsSYc3+1yyI2cqM+S2/olDAUxCrGKE6w/+Zq
	R/NhnEtDh2WKpw=
X-Google-Smtp-Source: AGHT+IEYLBcMKJyZz7PGUFHRmT0GN6TMhmQubQS0RRYJDJNx0LVgsRfvEsD6iUo+CgPP6GJbTpnUGA==
X-Received: by 2002:a05:620a:4444:b0:8b2:7290:27da with SMTP id af79cd13be357-8c38936c028mr1920045785a.12.1768133015617;
        Sun, 11 Jan 2026 04:03:35 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51c05csm1279702885a.30.2026.01.11.04.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 04:03:35 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 949C4F40068;
	Sun, 11 Jan 2026 07:03:34 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 11 Jan 2026 07:03:34 -0500
X-ME-Sender: <xms:lpFjaZgj3Ye6hN528Q3YjicAEyONaYVabIRbn9pvfIhwTIA7bPuohA>
    <xme:lpFjaTP_wle0qWecYJ-WA_r77AE0rwbmqbl73jCA1jOLajy1LzE3rnpSfUns4pdwu
    _oRhbfVrZV_sGN3dUQWj480tLNCedygFt4BxdrO_i-LQr3Fkw7jpg>
X-ME-Received: <xmr:lpFjaccCvSvWMzsc98UFi8DFP8SLPax-ohtq6fX2DFT13WhO3BuKGzpV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeghedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedvveekvddtffelffelfedvudefffeuheejgeeivedufffgledvgeduveffueeh
    leenucffohhmrghinhepmhhsghhiugdrlhhinhhknecuvehluhhsthgvrhfuihiivgepfe
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:lpFjadw3iy_HvOpPf-g6CQjsSIz_iyK72EIjJ91bjwPkYyjDBxS7-g>
    <xmx:lpFjaR0EwnuAs_H3FoBECQbL6lELW3WWkTTvLtzyMHT2oIe9L_A19g>
    <xmx:lpFjaUdO6jIR7qwbYtY94NIydBB09Mc5AqQ-X34Uf1mH4XgeX4zIQQ>
    <xmx:lpFjaWWvRi7ZfZSvU-4bDG_xdc_VVSFFTmu4-GvVpckxSOMyvIJAQw>
    <xmx:lpFjac-A_gMu76Z8EfiJqqkp0sldg32KG_fj9PQbIZZc3pS-TigpscOM>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 07:03:34 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 31/36] rust: sync: Add __rust_helper to helpers
Date: Sun, 11 Jan 2026 20:02:04 +0800
Message-ID: <20260111120209.6133-29-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111120209.6133-1-boqun.feng@gmail.com>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
 <20260111120209.6133-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alice Ryhl <aliceryhl@google.com>

This is needed to inline these helpers into Rust code.

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://patch.msgid.link/20260105-define-rust-helper-v2-20-51da5f454a67@google.com
---
 rust/helpers/mutex.c    | 13 +++++++------
 rust/helpers/spinlock.c | 13 +++++++------
 rust/helpers/sync.c     |  4 ++--
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/rust/helpers/mutex.c b/rust/helpers/mutex.c
index e487819125f0..1b07d6e64299 100644
--- a/rust/helpers/mutex.c
+++ b/rust/helpers/mutex.c
@@ -2,28 +2,29 @@
 
 #include <linux/mutex.h>
 
-void rust_helper_mutex_lock(struct mutex *lock)
+__rust_helper void rust_helper_mutex_lock(struct mutex *lock)
 {
 	mutex_lock(lock);
 }
 
-int rust_helper_mutex_trylock(struct mutex *lock)
+__rust_helper int rust_helper_mutex_trylock(struct mutex *lock)
 {
 	return mutex_trylock(lock);
 }
 
-void rust_helper___mutex_init(struct mutex *mutex, const char *name,
-			      struct lock_class_key *key)
+__rust_helper void rust_helper___mutex_init(struct mutex *mutex,
+					    const char *name,
+					    struct lock_class_key *key)
 {
 	__mutex_init(mutex, name, key);
 }
 
-void rust_helper_mutex_assert_is_held(struct mutex *mutex)
+__rust_helper void rust_helper_mutex_assert_is_held(struct mutex *mutex)
 {
 	lockdep_assert_held(mutex);
 }
 
-void rust_helper_mutex_destroy(struct mutex *lock)
+__rust_helper void rust_helper_mutex_destroy(struct mutex *lock)
 {
 	mutex_destroy(lock);
 }
diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index 42c4bf01a23e..4d13062cf253 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -2,8 +2,9 @@
 
 #include <linux/spinlock.h>
 
-void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
-				  struct lock_class_key *key)
+__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock,
+						const char *name,
+						struct lock_class_key *key)
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
 # if defined(CONFIG_PREEMPT_RT)
@@ -16,22 +17,22 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
 #endif /* CONFIG_DEBUG_SPINLOCK */
 }
 
-void rust_helper_spin_lock(spinlock_t *lock)
+__rust_helper void rust_helper_spin_lock(spinlock_t *lock)
 {
 	spin_lock(lock);
 }
 
-void rust_helper_spin_unlock(spinlock_t *lock)
+__rust_helper void rust_helper_spin_unlock(spinlock_t *lock)
 {
 	spin_unlock(lock);
 }
 
-int rust_helper_spin_trylock(spinlock_t *lock)
+__rust_helper int rust_helper_spin_trylock(spinlock_t *lock)
 {
 	return spin_trylock(lock);
 }
 
-void rust_helper_spin_assert_is_held(spinlock_t *lock)
+__rust_helper void rust_helper_spin_assert_is_held(spinlock_t *lock)
 {
 	lockdep_assert_held(lock);
 }
diff --git a/rust/helpers/sync.c b/rust/helpers/sync.c
index ff7e68b48810..82d6aff73b04 100644
--- a/rust/helpers/sync.c
+++ b/rust/helpers/sync.c
@@ -2,12 +2,12 @@
 
 #include <linux/lockdep.h>
 
-void rust_helper_lockdep_register_key(struct lock_class_key *k)
+__rust_helper void rust_helper_lockdep_register_key(struct lock_class_key *k)
 {
 	lockdep_register_key(k);
 }
 
-void rust_helper_lockdep_unregister_key(struct lock_class_key *k)
+__rust_helper void rust_helper_lockdep_unregister_key(struct lock_class_key *k)
 {
 	lockdep_unregister_key(k);
 }
-- 
2.51.0

