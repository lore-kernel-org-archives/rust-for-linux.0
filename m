Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1AD3ACEED
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800866; cv=none; b=TsMqqMaA4VKbOrQkXoPoSvr4EvgP5FWtOyg1LSvxhblkFzwjMcjXhr7lOGSzMkcKD4CscgTK7I5xqqIi85P1zFU5tooj01NZbw0mNFg6RW1fN3zV2QEnD/+REmLMVhZilyoOpgd30vXAXDTMu54eVai34t/l/Zq5VoxeAPLg8EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800866; c=relaxed/simple;
	bh=kw+Rryx1Ul7TuL+zy0rLv7h6BS4vupVr7tkWKHMII90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LH/k7X1FCNQ3id+f4LQ2IzTuYGEu4MaipYEelvwEH/k5oA+BM3IY6T6IfdGLqX4dONJ0/oAWOdidmilJPHN0/FZRJ02sSJQe2ZWtUIVrxf0TQQL4EagOy0AVmWZs9M9gf8g1tZbj9ARyfHDA7/LV2diEfJgM9EIFL8y9lmSlTd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Nqwdj8Yn; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Nqwdj8Yn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791800852; x=1792060052;
	bh=m6aEaT0CjR3fe+SONkIOdkGfxxDGCs2scfVlFjChNIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Nqwdj8YnBMm69TZnpvD5vt5VPRnC1DHkPoPRh9dMkEGqqQRTUzjZNnE3AyuqKaAdg
	 LACAFvMmagz+q5tt7D9fKxhDIFTaBb2BEzxaAy4fwI8VMGC+KwAdk5czvgNDFqNQEN
	 g5kpUakl/ny9abitMaYEM9bynrG9v2Z3GeU0eSFEnIZkN3wieE2MkJ2epvm3dw7FYq
	 JRlEJQK12+W97tFxVsmx+PTw58iVnw570Yw8e1A03+V5h83M3m/S5rxLPEeo8aWHH8
	 78peT8Pt0C9SfijOHAzXq3HI5T3GQBpewpFq6u5aCFbUWTuM8EtujNgzmbUpfhWMNC
	 nc91qFcQrF4KA==
X-Pm-Submission-Id: 4j3DDc3vC7z2ScWx
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
Subject: [PATCH v12 2/6] ww_mutex: add ww_class field unconditionally
Date: Mon, 12 Oct 2026 13:26:29 +0300
Message-ID: <168394bb52a6c68b0b760fe00413c899ab95f8e3.1791799752.git.work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1791799751.git.work@onurozkan.dev>
References: <cover.1791799751.git.work@onurozkan.dev>
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
index 0c95ead5a2977..c955824aa5d48 100644
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

