Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FECF15B56B
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713430778; cv=none; b=cNS4aPDCjV4XJPj/zlHsm+6IDzPjoo3/vTOP0+3/NnzOzhskMP+Cpy27TFXvwP2kzVCt8iVOUGCR9KaHusmPWftoCNn7HATwOaopiJfLzVemkwokezcEw0hVUAHrLqX8GxgrM3vgfDt/p/aNKOcb4eHeQT0Psn7dAewYKjEV3HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713430778; c=relaxed/simple;
	bh=MLZbMFrdM327Iliqelcm2H6dceUinbo2Qrr0nzN416M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A3cZSWdHUs+vJKkikHnPeFOHy0u0Dy2LeTRO0Fp8rwJskAk+Jdwak7xz10aKqUaBZRytjGZ4XdDx+Wv/nJ0rw2c4xdO5hrANb3H6UY1rtB1oA46PK0efvnMLoRew2tdmZ5JPvMcdXLEiXBuTHjnTe+TgQvTpjpyH5bhxeLPbGzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mbfVh5m7; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mbfVh5m7"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de465062289so1180772276.2
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 01:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713430776; x=1714035576; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MXu0ivdSThjPNuQSvbrqR8EgqUkoc/lgNPsqzGk09fE=;
        b=mbfVh5m7hOGpfGhG1YlQAPS1XMw5wBZmexgAcT7GiZ5pu5EkUkEO2YNGBAvZ1uBvdN
         onVuHCo7bXVhC8t6HTC0uCzrTbP8zqHAO5WSMoY5845fTVpo+NDaYDATdLZx71QyCKcx
         lECyehnElthO6FS1N9M2Rymm9a6fc2Wh2L5QtVImI8Ri8qEDOIi3iiF6A3Vazn/5Ixy9
         EVl68wv0NIghyCgTRbDp375FBFC5LtXxmSy9NiEWcLtDWPxJuh/MJGzSz6JAzz7KodJS
         FyEV2HsbyrOs+GgDky2zF9Lt3lAg6Osoe8LvUrj03745tICGAyRWWqdXhCsTNTG7kwhe
         UshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713430776; x=1714035576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXu0ivdSThjPNuQSvbrqR8EgqUkoc/lgNPsqzGk09fE=;
        b=XUXLQURX5YKCfc3uu6Dy1RlDp/tHxg1seqX7eueSSmhCcNtRAq610TTnWRw5guyaoA
         3cwvMzwi26uyaKPKg1RhKbvVwXKsvKGvNRyDvDxDg55dCsPvmzvde8ZhmI3q6K1fLVKE
         aaaq+bjUX5ma/j2Fur56m8q8fRkFs+XIqHWu2f4r28UUYLNis/tEkaPbE/v9NabNNmrK
         8nvb2FznIDSeIB5aXZ19hg9K4PhuTIaUhMDEFoG6PpEpHRvTstB05oceP0dl72blZZGn
         h9t9VxsCS9b7+U6ivWN1GhY79GUzikXidf3O57nIZIMH7ekxntH98CZWOqlw/v97L8rc
         j4fg==
X-Forwarded-Encrypted: i=1; AJvYcCXMNJeJ0ed07KksfeIfycShBpecYI6cGbZZcvJHKY8dsItGZ5qjcraaf99499V83KhT5sc/ZJXA5O7MALkFbKM0lTiGcHidTjSsZR3h+/g=
X-Gm-Message-State: AOJu0Yw4GQyuPY1Xw0jyMRTb3WDNLFwMl/wq9Lu+7zq4a6k4CyArZUXM
	aEJtdiAZkdYTgCcnX/3jCzvLws8N5JJRpvrxoarx0SUxJwXoa0FuN9kQhCHdHou2GRYnGHJB3zV
	yIz04xYUO3RvLOw==
X-Google-Smtp-Source: AGHT+IGse7NZQ2hEZ3xo8zQMgk9GxHVA8CNqzQiXXjRdYigAwKQOE+Tfaeop+mtM1YJnE9wBINVVlzrjz7ZKuzM=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:1141:b0:dc6:5396:c0d4 with SMTP
 id p1-20020a056902114100b00dc65396c0d4mr546819ybu.1.1713430776218; Thu, 18
 Apr 2024 01:59:36 -0700 (PDT)
Date: Thu, 18 Apr 2024 08:59:18 +0000
In-Reply-To: <20240418-alice-mm-v6-0-cb8f3e5d688f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240418-alice-mm-v6-0-cb8f3e5d688f@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5122; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=x1NaT6C4DcUL7cPQ6UUi0mTx75zJnB9XyZJjsIRI3Ns=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmIODuRjVdfd6NY/1+Lcn75vkKinRf3CAdt5vul
 8uvXQyrNxSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZiDg7gAKCRAEWL7uWMY5
 RsQMD/9U/ASnGmCDYMWUzDaCj6mk7qk2+xp5uBW1ucNBWrMyAEFMHPc5z03wfq4unBKyUtxuda3
 cVebYAtbaZbp63wjQikTVnWr0A/vRMMbHK4rrmsUpppJWFebPLU5dwepofmDp1dUe4AsB7b4v44
 Jn+7LT1sf4rD/QVa/iBoA1/HkJF3dbe5DL9LlCgW/jjTpTjCZF6vyyTPBonT3KKig+kGVf/mDXW
 SclM6B4dwaEHWE0iDwimbzGZ8olTZkYgOFHe27YIGru8D0vpepxeUE/iWloev4BSDHBgwwgmQKq
 LBBbgpJsR9jRU8oDstOfLK8AsYQxwhrvsJ0jeTIETH+3NwaB4KRpj1oMXBoKKLWZub9Kp9t+A5M
 X1bYRKt82+DXipxSeLK3h6XfUzxER09cfcT8U+Q2yixZ9gATa3U7PDUwp6JuKVlkr6Z1CMWH2Fv
 iy2Rj3azGJ9KQTkRTM2WpdQzShrIQPxjmkLdeub4Tr8oN+5W0UT/ywuAUF9UDsEn/+0N5N71PpP
 m+0Dpv35ERh8DmxzzX4Vsoh/qEjJlG2mAloMcUfjjyMt7ooKb3Id971TlasNffkGf6yIaIsBpXl
 79SLRmMpdwi7FC/KENaINLCDuv9cayQySDvWxrjE1LMAvl61aKImCYsNgbngS3vnO/CiR+/W2Hv PVWyg3BJIZCYi/A==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240418-alice-mm-v6-2-cb8f3e5d688f@google.com>
Subject: [PATCH v6 2/4] uaccess: always export _copy_[from|to]_user with CONFIG_RUST
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, Trevor Gross <tmgross@umich.edu>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Arnd Bergmann <arnd@arndb.de>

Rust code needs to be able to access _copy_from_user and _copy_to_user
so that it can skip the check_copy_size check in cases where the length
is known at compile-time, mirroring the logic for when C code will skip
check_copy_size. To do this, we ensure that exported versions of these
methods are available when CONFIG_RUST is enabled.

Alice has verified that this patch passes the CONFIG_TEST_USER_COPY test
on x86 using the Android cuttlefish emulator.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/uaccess.h | 38 ++++++++++++++++++++++++--------------
 lib/usercopy.c          | 30 ++++--------------------------
 2 files changed, 28 insertions(+), 40 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 3064314f4832..2ebfce98b5cc 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -5,6 +5,7 @@
 #include <linux/fault-inject-usercopy.h>
 #include <linux/instrumented.h>
 #include <linux/minmax.h>
+#include <linux/nospec.h>
 #include <linux/sched.h>
 #include <linux/thread_info.h>
 
@@ -138,13 +139,18 @@ __copy_to_user(void __user *to, const void *from, unsigned long n)
 	return raw_copy_to_user(to, from, n);
 }
 
-#ifdef INLINE_COPY_FROM_USER
 static inline __must_check unsigned long
-_copy_from_user(void *to, const void __user *from, unsigned long n)
+_inline_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
 	unsigned long res = n;
 	might_fault();
 	if (!should_fail_usercopy() && likely(access_ok(from, n))) {
+		/*
+		 * Ensure that bad access_ok() speculation will not
+		 * lead to nasty side effects *after* the copy is
+		 * finished:
+		 */
+		barrier_nospec();
 		instrument_copy_from_user_before(to, from, n);
 		res = raw_copy_from_user(to, from, n);
 		instrument_copy_from_user_after(to, from, n, res);
@@ -153,14 +159,11 @@ _copy_from_user(void *to, const void __user *from, unsigned long n)
 		memset(to + (n - res), 0, res);
 	return res;
 }
-#else
 extern __must_check unsigned long
 _copy_from_user(void *, const void __user *, unsigned long);
-#endif
 
-#ifdef INLINE_COPY_TO_USER
 static inline __must_check unsigned long
-_copy_to_user(void __user *to, const void *from, unsigned long n)
+_inline_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	might_fault();
 	if (should_fail_usercopy())
@@ -171,25 +174,32 @@ _copy_to_user(void __user *to, const void *from, unsigned long n)
 	}
 	return n;
 }
-#else
 extern __must_check unsigned long
 _copy_to_user(void __user *, const void *, unsigned long);
-#endif
 
 static __always_inline unsigned long __must_check
 copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	if (check_copy_size(to, n, false))
-		n = _copy_from_user(to, from, n);
-	return n;
+	if (!check_copy_size(to, n, false))
+		return n;
+#ifdef INLINE_COPY_FROM_USER
+	return _inline_copy_from_user(to, from, n);
+#else
+	return _copy_from_user(to, from, n);
+#endif
 }
 
 static __always_inline unsigned long __must_check
 copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	if (check_copy_size(from, n, true))
-		n = _copy_to_user(to, from, n);
-	return n;
+	if (!check_copy_size(from, n, true))
+		return n;
+
+#ifdef INLINE_COPY_TO_USER
+	return _inline_copy_to_user(to, from, n);
+#else
+	return _copy_to_user(to, from, n);
+#endif
 }
 
 #ifndef copy_mc_to_kernel
diff --git a/lib/usercopy.c b/lib/usercopy.c
index d29fe29c6849..de7f30618293 100644
--- a/lib/usercopy.c
+++ b/lib/usercopy.c
@@ -7,40 +7,18 @@
 
 /* out-of-line parts */
 
-#ifndef INLINE_COPY_FROM_USER
+#if !defined(INLINE_COPY_FROM_USER) || defined(CONFIG_RUST)
 unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	unsigned long res = n;
-	might_fault();
-	if (!should_fail_usercopy() && likely(access_ok(from, n))) {
-		/*
-		 * Ensure that bad access_ok() speculation will not
-		 * lead to nasty side effects *after* the copy is
-		 * finished:
-		 */
-		barrier_nospec();
-		instrument_copy_from_user_before(to, from, n);
-		res = raw_copy_from_user(to, from, n);
-		instrument_copy_from_user_after(to, from, n, res);
-	}
-	if (unlikely(res))
-		memset(to + (n - res), 0, res);
-	return res;
+	return _inline_copy_from_user(to, from, n);
 }
 EXPORT_SYMBOL(_copy_from_user);
 #endif
 
-#ifndef INLINE_COPY_TO_USER
+#if !defined(INLINE_COPY_TO_USER) || defined(CONFIG_RUST)
 unsigned long _copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	might_fault();
-	if (should_fail_usercopy())
-		return n;
-	if (likely(access_ok(to, n))) {
-		instrument_copy_to_user(to, from, n);
-		n = raw_copy_to_user(to, from, n);
-	}
-	return n;
+	return _inline_copy_to_user(to, from, n);
 }
 EXPORT_SYMBOL(_copy_to_user);
 #endif

-- 
2.44.0.683.g7961c838ac-goog

