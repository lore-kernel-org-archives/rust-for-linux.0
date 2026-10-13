Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36845476C3
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 20:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923520; cv=none; b=Nitp73p5ZKdW0at19f9PaIdLJIjwzjQlIiAAF8vzBtzAb2kxkdc0I8s7pBD5me7opQ/zrW1yHMGf8nseHLlMva0AYoOH4DZ9vWOIpUhUEMySAiEH7LK1WGPmLrLMr/YxvnSPcznmPWHAXykWyu7EbtHBHsJWFF/ERDKDuaik+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923520; c=relaxed/simple;
	bh=f9EkJkO0/YdEpyV9iZEvDv1BUADI4zTrdrfFh5OACE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MQl5Wl79kOXScoOkIUHc24F59XczxrBkE0em0m6DYz8M3AOTiUT/hK8W8xGVNpn0BO1SAY7LL9hf7a+wy6tGcof8qm3Ige5TRX5bhY728h71V4ii1QRhxULSjdZhkc3x4vzygE2pQsHWTadIfMxKV+rechn7HijslHoX+cPxE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvyU9O+b; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvyU9O+b"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so28238035e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923517; x=1792528317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSRlsCJ/5tvpWWe5VR84qQBeBhF4B6Pki9zDFnj6lNc=;
        b=JvyU9O+b8TuhIDYebZB2p6HUdZtbELUnoGK7yeN5ZHwiV+nlqYvIoVtx16bs7pVbot
         IfI6xxihqrjxmEK5W0k6OobbVaSEkribya1boFMU+h4ZpHYKJDV1Ha1AaiKS/XNftIQ9
         luZy2HPLZXVHViU9nEeiwjetwPTCj1izQtuL8Uv+oMVgZKXZqy8SIQbKMgwa5Li6cvEf
         WqBvNh/R9G9gQxiqLtCbBi3ocMqfRWPLm6ZlYXhBh08wkpJhDFs2TmjZ/w4H5L9Wgtzb
         cN/Kkwger4tfeU0PgWswN9j545gdUz5lCuL+fWncZ8x0Vkj9A48q8vIISLScfJEpo3Aj
         sHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923517; x=1792528317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSRlsCJ/5tvpWWe5VR84qQBeBhF4B6Pki9zDFnj6lNc=;
        b=qT0C8LKj6nfBXfJ6TqjutavbqIGtLD+R0A6JkxhFoCiyAM9Hu9pMGuRKNYIE/rJQeZ
         Gbq4wrfa9PFojV/CBWT3eh3A9lrv5N9QYJhEwPq1n5t986nyVRNcmcE2m4TBEDhx7Wn5
         He4hY6XAazx2yiWRw+ztHhaa0tTR7tW6VF8IuU+r9E4dN4c6cfe/Yd1FkRQnTW4svEc6
         1nFBvEp7Wbbe+rHemAL0SvP2gcAKK3MjpxIkF7cLRiFw+es6WqbbNnUPNwkhaez4s8QC
         WeFrGXY96iaWVsOMv59nBmCbDvzIqzmt5SJTJflkHXxV9AJHYm7gi/SijNOpGaxiiBzY
         A+RQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6TGf7RAKSzZq9u9kXILUyHqS0s4JcmVoP0g6Ar5myt0S0h1r5BxRBDq4HoyXHGfpejVKj40AFAFylEmi9CA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLWuTsIXdZsE15HqrYAmVipgbx11Y+xpbu7PLcKPbcwhntu4CEw
	npZykbqYKmzvVxqpB7locVDExizhZKCW6SbSrNGd9Wb7vrbPOGo6uTea
X-Gm-Gg: AYBFou0pzvMhpIEvsdGHDZdoKEA2gZxEnhXOnEA3J11h8I9YJ/msam4pXydxZBh3P9N
	a6THQWxBDilb8OQtqlj7Zek0YKRSq9NH7AUfUVfO0lz3PHJ5e7rwnU/TXEnvcRh6jE1rjI5gS6Z
	gYJhHstq7dBHDTamFRcrBUVeNM3diXylCUdeF9U+dB4IR+VvyqeCcrKfDdMRJpWtUHEniAQkZ8Z
	Blor5cl8GZMDsYgf/Y1pxAPbwQt1WDO5QYYNt+4fW+b49WKzHwjFoitEbBU1uUDiFFDB84950mT
	dPSTzamEc/2oruTW/C4DwSeZFAeniFC2OI5l4LOQJJTWiQpEwmbLnlesiRm3TGZcC4fons//Eav
	GnSIOcnELeI/slSpP7yGIziY4eDmyvBlT5QwwiwgDnoz2jtxLQ8YGIez4/wd9x5Ffc2om+W3Wye
	fVUTm2nOeswsnprBFsf6451MWmM8zgc40sguy3tbAE3wKuq3xjBxvTqPt+S1aJhlLgMOstKQVTJ
	3QdugmImAmbOkc4rmeDHo5xNzga0X7ImEvu/6YuPLlfjzqzsOL9h2Yngu5i8M5jDI2NFGfX0DKZ
	wJ800pmDJOcrXzSJ2M6+wOHaDjvdxUTNZEVXmAKaxlUvZcBIDQ4MguKKkHAglq9lx/lgj0jfb/m
	KFhy7/HpvJn624AyW
X-Received: by 2002:a05:600c:34d4:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a18e4d67d6mr260625985e9.32.1791923516977;
        Tue, 13 Oct 2026 13:31:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
Date: Tue, 13 Oct 2026 22:31:35 +0200
Message-Id: <20261013203140.31741-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__arch_xchg(), __cmpxchg() and __cmpxchg_local() rely on inlining to
remove their undefined-function calls for unsupported sizes.

With gcc 8.1.0 and CC_OPTIMIZE_FOR_SIZE, bcm2835_defconfig with RUST=y
fails to link. The compiler emits out-of-line copies for the many
callers in rust/helpers/helpers.c, retaining those calls:

  helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
  helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'

Mark the functions __always_inline so the compiler can remove the
unsupported-size path for each caller's constant size.

Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpers")
Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
Cc: stable@vger.kernel.org
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 9beb64d30586..0ce5225af442 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -26,7 +26,7 @@
 #define swp_is_buggy
 #endif
 
-static inline unsigned long
+static __always_inline unsigned long
 __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
@@ -155,8 +155,8 @@ extern void __bad_cmpxchg(volatile void *ptr, int size);
  * cmpxchg only support 32-bits operands on ARMv6.
  */
 
-static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
-				      unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	unsigned long oldval, res;
 
@@ -220,9 +220,9 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				      sizeof(*(ptr)));			\
 })
 
-static inline unsigned long __cmpxchg_local(volatile void *ptr,
-					    unsigned long old,
-					    unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg_local(volatile void *ptr, unsigned long old, unsigned long new,
+		int size)
 {
 	unsigned long ret;
 
-- 
2.39.5 (Apple Git-154)

