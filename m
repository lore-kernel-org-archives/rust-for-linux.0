Received: from forward206a.mail.yandex.net (forward206a.mail.yandex.net [178.154.239.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEA1849C;
	Mon,  1 Dec 2025 10:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764585308; cv=none; b=XXUWVibzefKg2R221guDoCDceZ41nTb9wT9ued70hh/I5s18byMOFFNku4MXwGpi/0bqyqYu71ZuiLepoEE/xNwW0RDZqBNgfyUbCi6k25wuwgpCJY3Zck09p51wuNjvvwyU4JWYOmBpe2O3Xyl0j3aXhvDVra7qjQM05RnzRtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764585308; c=relaxed/simple;
	bh=UxZJpuzvkI+pRjztOGLbPlkADkxS2KmZP3kBFUhNfIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oc+ANwDVzaOBhrVYRZUMWh1xFvUNq4wFTRjaJMypx+gVoAUTEsNbLHITqEs8BrsEeHKEhmx5Us9SpWso3B0O2zh1ipcLA+WQsAkyNl1pyiya8OjegTx46tVOocuy5cD0s6SBOjtdjtRblIkvlMDikFKvesL5FCiH9Flg/sFP3Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=qV1xcmsr; arc=none smtp.client-ip=178.154.239.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="qV1xcmsr"
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
	by forward206a.mail.yandex.net (Yandex) with ESMTPS id BC8C486D62;
	Mon, 01 Dec 2025 13:29:21 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8a9a:0:640:e327:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id AD358C0113;
	Mon, 01 Dec 2025 13:29:13 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id wSfJU4kLMiE0-Anm5W89U;
	Mon, 01 Dec 2025 13:29:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764584952;
	bh=Um4AVQqdyl0PjnSlni/Z3hqSa8GEEEGbwaNnG1ThBAQ=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=qV1xcmsraqmG14csZNCBLtVGyYPICDtAKBvAaZmb2gNA+vf9/m67VyNzoQWxJGuXn
	 g0/Pyn7W94uZOhYEZC1Jw42vOjWRlYIkcs257cD/wn+a1UindDuNIzz3sRr1TvPr1X
	 0pLzM1eh1QFNt+bPziV216ZMomjoCb0MfXWY2FiM=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v8 2/6] ww_mutex: add `ww_class` field unconditionally
Date: Mon,  1 Dec 2025 13:28:51 +0300
Message-ID: <20251201102855.4413-3-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251201102855.4413-1-work@onurozkan.dev>
References: <20251201102855.4413-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removes `DEBUG_WW_MUTEXES` guard on ww_class field
from ww_acquire_ctx and ww_mutex.

This helps us to write much safer Rust abstraction
in very simple way.

Link: https://lore.kernel.org/all/ECC0425A-8B18-4626-8EA8-2F843C45E0A1@collabora.com/
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 include/linux/ww_mutex.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index 45ff6f7a872b..c9835035b6d6 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -47,9 +47,7 @@ struct ww_class {
 struct ww_mutex {
 	struct WW_MUTEX_BASE base;
 	struct ww_acquire_ctx *ctx;
-#ifdef DEBUG_WW_MUTEXES
 	struct ww_class *ww_class;
-#endif
 };
 
 struct ww_acquire_ctx {
@@ -58,9 +56,9 @@ struct ww_acquire_ctx {
 	unsigned int acquired;
 	unsigned short wounded;
 	unsigned short is_wait_die;
+	struct ww_class *ww_class;
 #ifdef DEBUG_WW_MUTEXES
 	unsigned int done_acquire;
-	struct ww_class *ww_class;
 	void *contending_lock;
 #endif
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
@@ -110,9 +108,7 @@ static inline void ww_mutex_init(struct ww_mutex *lock,
 {
 	ww_mutex_base_init(&lock->base, ww_class->mutex_name, &ww_class->mutex_key);
 	lock->ctx = NULL;
-#ifdef DEBUG_WW_MUTEXES
 	lock->ww_class = ww_class;
-#endif
 }
 
 /**
@@ -147,8 +143,8 @@ static inline void ww_acquire_init(struct ww_acquire_ctx *ctx,
 	ctx->acquired = 0;
 	ctx->wounded = false;
 	ctx->is_wait_die = ww_class->is_wait_die;
-#ifdef DEBUG_WW_MUTEXES
 	ctx->ww_class = ww_class;
+#ifdef DEBUG_WW_MUTEXES
 	ctx->done_acquire = 0;
 	ctx->contending_lock = NULL;
 #endif
-- 
2.51.2

