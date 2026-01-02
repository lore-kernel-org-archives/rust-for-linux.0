Received: from forward202a.mail.yandex.net (forward202a.mail.yandex.net [178.154.239.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CDF2FF172;
	Fri,  2 Jan 2026 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767376893; cv=none; b=IzPlPRt4SixYM0ruHM/COBtozpRwVWSjR6n1pXjX5iO4hjgLu+MO0wjNtHjO6VAr9iIIRyS8GFTllQ/ZddZYmiLzWQvpP41cXisDsioSShPrcBh0fUzabFsKD8yTKgvLdnGtiBLk5GL/1OpazbsrvWExosCkXgJkm3zwBkw15Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767376893; c=relaxed/simple;
	bh=6F/+tezkEB2vztihYOYq49PMzQhO8YkLYqMevzRARmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VFC6RE55MUwR6uLyOwABMeMOLpICn14rqzTgrXx3LP89aYmvqc6+DBodHBAoKAR5e77kASXbTCEDbpPIX6EHlAEtHFCfwkGnvjAC1TnZohLYCwUHQdbY608d7BTRfp9ec8WdcrlnO4t/rPRRNLFtpiJBhf/4/SNQE1viPnjDv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=RHrgWLqL; arc=none smtp.client-ip=178.154.239.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="RHrgWLqL"
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d103])
	by forward202a.mail.yandex.net (Yandex) with ESMTPS id F25DB83D85;
	Fri, 02 Jan 2026 20:55:02 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:582e:0:640:200:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id 4AD4780872;
	Fri, 02 Jan 2026 20:54:54 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id prp9aJGHE8c0-YrQU3jny;
	Fri, 02 Jan 2026 20:54:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767376493;
	bh=8pibJ9wAikpYKSyeQ9ysDFVDnPDbGtUh727m8wRpnxs=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=RHrgWLqLS8ib5ny2yvz5C4qr2VoTeAVQjTpkSr/vL83SVRCqQeKCnJJrT+xOCOnvx
	 7SeOaN3D2JjZq1jJAeDQ/+E8A9QOF8FTGHbzfMtzgoOj4nkjxF2PoaZM2L7fLigsom
	 I8oJ4fVJQPMdfHg1Fy5DXe1dUS2owC9UZIcUYHuA=
Authentication-Results: mail-nwsmtp-smtp-production-main-55.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH v9 2/7] ww_mutex: add ww_class field unconditionally
Date: Fri,  2 Jan 2026 20:52:57 +0300
Message-ID: <20260102175302.194435-3-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260102175302.194435-1-work@onurozkan.dev>
References: <20260102175302.194435-1-work@onurozkan.dev>
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
AcquireCtx, simplify AcquireCtx reinitialization logic and
validate Mutex and AcquireCtx class pairing in much simpler way.

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

