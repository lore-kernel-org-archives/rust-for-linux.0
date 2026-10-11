Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052113B9D98
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744036; cv=none; b=cD4xkgv/Ens4p3ZB/X0YyGHwjkxWdwfnzDCpE3tEXBO81gUSXryy/GnQ7Uu7ibSqrfS2RjS+/WhW7yHPfE264W/KKhI/W4VduakbfBDyn5thpeocnL5PVE16+1hYMUZttbS6z/d8B/pIvLgft08lcozKR2mv8TiCLlCnEzhTLdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744036; c=relaxed/simple;
	bh=Z86mjKI472/ryMt+u4v9Pxr9NS1edfdPbUycTrCuXqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/wzkbJLlm1rpM/cBqR++SR+OxqaswleoFMnyziqQZYBG2kY7BUQeKjfDM7bGr4eRpaGbgZv0zqXuk26kfwYbVaO+rmyNC1MBUehVsFhz11qEGuMDeZX3ucQUDic/EBFGbNhgCZd23R5A5TMNAXQ61xYncd7gbFXWdRCB0FX2F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=FEsxAHvG; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="FEsxAHvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791744029; x=1792003229;
	bh=MPz0oVlvt31o+L8avQXCMu8C8UJN10DqLxQnl6KMaio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FEsxAHvGcc2wWRW2/C+UW6nRHqUvK8PWp/lh+2se2rQOE2JLdJp29yb3X+aLH9NsQ
	 bkw3BdPDCcyKBBGmKiCJ3BYTqQAt3TTZvzSACmMFeyMGW0ZHfqdPN00x7E4suhN4GL
	 5aZY+KF2kDLNA08Xu5LAeA9gDwWEjXvZ2sepya2etPl/ye9n47lhiIKRfK0Gaq6rtF
	 aRPbGKsAoCzgpG6/pn326iPsMUhm+JrCGB7km7gquorKlrHYykVHbg32x9dV2H8crf
	 NBxjyJEMO3/u52AAD6zJF+zxytcmM/iY2aEjK82PmfOWM83eAPTOD9/l/RNlQVdDQt
	 aFtWDI7pO1tWQ==
X-Pm-Submission-Id: 4j2qCs4yvtz2ScPd
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	lossin@kernel.org,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 2/6] ww_mutex: add ww_class field unconditionally
Date: Sun, 11 Oct 2026 21:39:20 +0300
Message-ID: <168394bb52a6c68b0b760fe00413c899ab95f8e3.1791743500.git.work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1791743500.git.work@onurozkan.dev>
References: <cover.1791743500.git.work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removes DEBUG_WW_MUTEXES guard around the ww_class field
in struct ww_mutex and struct ww_acquire_ctx to always
initialize it.

Keeping the class pointer available unconditionally allows
Rust abstractions to keep from_raw() simple on Mutex and
AcquireCtx and validate Mutex and AcquireCtx class pairing
in much simpler way.

Link: https://lore.kernel.org/all/ECC0425A-8B18-4626-8EA8-2F843C45E0A1@collabora.com/
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 include/linux/ww_mutex.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index 0c95ead5a297..c955824aa5d4 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -48,9 +48,7 @@ struct ww_class {
 context_lock_struct(ww_mutex) {
 	struct WW_MUTEX_BASE base;
 	struct ww_acquire_ctx *ctx;
-#ifdef DEBUG_WW_MUTEXES
 	struct ww_class *ww_class;
-#endif
 };
 
 context_lock_struct(ww_acquire_ctx) {
@@ -59,9 +57,9 @@ context_lock_struct(ww_acquire_ctx) {
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
@@ -111,9 +109,7 @@ static inline void ww_mutex_init(struct ww_mutex *lock,
 {
 	ww_mutex_base_init(&lock->base, ww_class->mutex_name, &ww_class->mutex_key);
 	lock->ctx = NULL;
-#ifdef DEBUG_WW_MUTEXES
 	lock->ww_class = ww_class;
-#endif
 }
 
 /**
@@ -149,8 +145,8 @@ static inline void ww_acquire_init(struct ww_acquire_ctx *ctx,
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

