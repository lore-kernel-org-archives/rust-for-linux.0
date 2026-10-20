Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.106
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510290;
	b=4woU8C4obvO5zNmrl2aPuw5WHIqoRNiyoOr4i5+ccaszKXsPS2naGUoZ9LykCNTPUNv0
	 Llg9oBnvEk75L4G6Qpkn6mLxj5qV0zsEKZb+9G2fcBM6kXPTn5V54gZsPgMHSFHsTeQUI
	 XDH3YI6xfVVXe6hqzGhFuMh1WIiYczgCedcx0Ckgdv37WDdrqNMjbSVzUqoBLFJwCEbj9
	 8nbg8XbgVn3BeFim3VO0zWZZq4KKxVMM2jIhixTjjZE5wRpV48JiPigKJd9zCL8lXP0Co
	 mQeduDfB3hZbK3xOjHhk0jl4TDNugAR3OyiXiDkEqO+Zi5yVyINtxGWJotx++WChjfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510290;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=m6aEaT0CjR3fe+SONkIOdkGfxxDGCs2scfVlFjChNIE=;
	b=iPdSzmR8ynyFL9bCuyWgMm/Lhl4PFS3U9eaMPTolOKZ/AUky6gmxiOuPymcimnXUgkJF
	 Ywg45Hu31lyrNKTEKi9zuWBaY815Pay91yLhgVuOBkU+1gO4x05NLj+eEyTFtFaR6TPC6
	 ApzJPc6OAg3ZPYvcCrwwL4k4Aha9fqJwk0r3p91MEUr12HYRdyPnmNQ2RKTkwyO2cDs8j
	 TQPsMvf3WS8lk3epZ54KltNlsy9tjlBbBOnIWV4oolPx8pYMVJwwNMGA8i7BZwrMl52xK
	 +0tk9kkox2sqi/Xc73J4ID11FiXI+VRQji0WMyoKS/Qyqlt79BPwAvO6+Uc1lruqaeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=pQX1af0h;
	arc=none smtp.remote-ip=109.224.244.106
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC5B606A33D;
	Tue, 20 Oct 2026 15:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AC5B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=pQX1af0h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792510286; x=1792769486;
	bh=m6aEaT0CjR3fe+SONkIOdkGfxxDGCs2scfVlFjChNIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=pQX1af0hBheMCTSLROPPUEtfPIo1TsM3aIFQIwbAwlT8edXu39fuX9gGS67lVktsO
	 pCdmG/nlzHzKyGFV/oAEcQsOPR31wSnmAYKX4KMsjMkM6tk5i280Vr828ersBHx09h
	 vmqXe3TsL06Gr9SqzFtwYZu10X5zgv+V3AjnzA3GHdxCGzHG45sJSzPbM9GygqqjQM
	 Itjwd6xJ/SbvsfQxf4txqL8k+3oEqEgT9262ahXojlrjro/del36MULhCrYses/AV7
	 YH/kCNTJ3Es/zXEBKkPz3Km7J0N1m9QFTfByKBTezhfFdyI0r7wUXHoW4a1yjX6SIB
	 3jZ4et4r6Ol6Q==
X-Pm-Submission-Id: 4j8GbZ5gVYz2ScPc
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
Subject: [PATCH v13 2/7] ww_mutex: add ww_class field unconditionally
Date: Tue, 20 Oct 2026 18:29:38 +0300
Message-ID: <20261020153112.299745-3-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20261020153112.299745-1-work@onurozkan.dev>
References: <20261020153112.299745-1-work@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
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

