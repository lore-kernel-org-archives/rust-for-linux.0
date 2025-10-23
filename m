Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFBD2D2481
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761239772; cv=none; b=c6mnnSPVphrZm1bDonUU3fXD4O4dbdSVdX5b3/5dCQ82nevrBUoReK+P3sG09OZ1q9WTNEabug2qBAtNtvMMBlsR+1G2PzvcfNt5xMzXpJrNE6yay9TwFL+QujdwHQaW75bE9EBZqvpoOmY9CIhQndf7c1UXK4JT/rsL4RkxG1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761239772; c=relaxed/simple;
	bh=OFXY+MUOP+8Y/CCUUhXO0LVlD5TFWIEKLsX65S4vUHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qga0WGxMasqz4U2bH9ELLjhu8aHsVZw2Qqk6uJzDViz5UdGehONfjeo4Rg7aHKmWoNIY9OHxRWJUeNJRws4ndX1xRnwf1nqTV1ZJyY3aLMFCEiefSdpXFwwxopkW9nJgXTWmZSC+4T+B5VCQ/LIY+2SgrbOY7Bu3rFHJnvcGwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgpth9zE; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgpth9zE"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-87c1f3f4373so16372246d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761239770; x=1761844570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jNMd4vA/95M+VKKUUTCyOXkzNHKfGBp1ZY+J8a7Y14=;
        b=kgpth9zEapf2Wc+voLSmj3Rp00KQorTjuN6lu9boN4ZuR5jVcI2nSrc92fNB9XJba+
         LeluDkJm2oQ79XkupNCqWA3J+tXkAnxfBMC3lrMCmTAtyHM+QeO9Zl2NDP9wANoT3917
         yNKSud79l0whsTrfb3mIXcyWGwVV6UNEAGgrzz+AKccvmaPq+yZe/A5QL4eVQ+xHDTp2
         YBM2eIF5ZC3qiGjyL1l8RXEuWb4L7NqzlHVf3Qb49w7LOn1LzG2apGQYCBpc6e7Syf0B
         u/4TobM7HTSBR4iAxKP6EqhIuWaxa0RdB0sM2h9usJMUeDOLlNktxXN7YufroIl+Otgp
         ndpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761239770; x=1761844570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jNMd4vA/95M+VKKUUTCyOXkzNHKfGBp1ZY+J8a7Y14=;
        b=II+HMj13DpTpYwLF5G0mctHp/i4ga09PJJgKGiq0rRcBJw4r7uFIP3PTdQZsU+QH4d
         b8tfzAS0nQM5hUfvqHM6qQ33MywlOyIqEAYCGM3FcranSRhIEK0Oe/sQ4h1Mf+7z/eJR
         kXjDYQ0VGIZAPazhn+uBGLHn7a+Wt72YxvfCOGXZbe85/yHMjm1cIhNqF8G7iFduqzup
         zQ/scCF2rr97UHMU75J8/qTT6LLCUWKGkSZkSZdM61zhZUwc3dWSfbAgQvXG8v+7pg2q
         QcK53JYH7n89QD7mXIsUg8peHrZGpGsZGexZsiRJ59iUYEcKQ/309HNQjX7Z1wVrXqrI
         m6iA==
X-Forwarded-Encrypted: i=1; AJvYcCVbOAkzi+1EoW9WiPhChW2nerjXJPUWl4q1CwNf9kyAn8SpQRfYKpG/Auq5GEl2TDxOVW2LknIlFQ/VFkjR8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYNw+PFdn0GhHqsFgcMz9zjAuw6XXB/58cruTwxrm5t8LCNasv
	Iv+w7fqXqUztiYmsB8Jekv+5d1MJm4l6dHZdZ+OjYEx1HshyInNz39VE
X-Gm-Gg: ASbGnctbWGOTI7DBOsYsQ8asEvp2HQxjGgzUgfFJzWt9r+juIaGnToNFpTX4T+HAPfK
	MCxhUr79e5cawMAR6BfCA8bk5mbPP2J2KsUZ8IUt+/dKSo5efJRWrleCSW+eYmhx4DsYkEl+syC
	2dlv3fUxMTA3aFKyQsuPBU0GCeLi7DUflNSGImnPmE4YlgAYpoQp/KPQdeaWu2PFFMTEmk0oscC
	z/xCBjYpVfSlYj6BQx54GG+inR8uOVMbsliUNwHN5dNBToMv97pzP6erq3JX51SU4yY1Isb2MfG
	+9jlwu6tDAyP8hptr3t+/Xtc8G2SCPNVHnOzu2vPBR0keaOKspRQVML1HD+gc/oiSMxDZOuHZT1
	f8P9133wuHPcv26Qk0aX8OJ/L5lpwDPhXATm4yECUbk89yqnt2dgaaJmbAEf1M9HUWu+ouQHb
X-Google-Smtp-Source: AGHT+IEztWYoBs06abPB+Ng5TILZNZBwSb7b5djQJWRLRDbxap619QyU24vmkV9lb0CaXbn6mXi9sQ==
X-Received: by 2002:ad4:5ca9:0:b0:796:3a6f:f931 with SMTP id 6a1803df08f44-87c2055e0fcmr324235476d6.12.1761239769652;
        Thu, 23 Oct 2025 10:16:09 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f9e824cc2sm18692156d6.61.2025.10.23.10.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:16:09 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
Date: Thu, 23 Oct 2025 13:16:06 -0400
Message-ID: <20251023171607.1171534-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user with
CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
is enabled. This pollutes exported symbols namespace, and spreads RUST
ifdefery in core files.

It's better to declare a corresponding helper under the rust/helpers,
similarly to how non-underscored copy_{from,to}_user() is handled.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 lib/usercopy.c         |  4 ++--
 rust/helpers/uaccess.c | 12 ++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/lib/usercopy.c b/lib/usercopy.c
index 7b17b83c8042..b00a3a957de6 100644
--- a/lib/usercopy.c
+++ b/lib/usercopy.c
@@ -12,7 +12,7 @@
 
 /* out-of-line parts */
 
-#if !defined(INLINE_COPY_FROM_USER) || defined(CONFIG_RUST)
+#if !defined(INLINE_COPY_FROM_USER)
 unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n)
 {
 	return _inline_copy_from_user(to, from, n);
@@ -20,7 +20,7 @@ unsigned long _copy_from_user(void *to, const void __user *from, unsigned long n
 EXPORT_SYMBOL(_copy_from_user);
 #endif
 
-#if !defined(INLINE_COPY_TO_USER) || defined(CONFIG_RUST)
+#if !defined(INLINE_COPY_TO_USER)
 unsigned long _copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	return _inline_copy_to_user(to, from, n);
diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
index f49076f813cd..4629b2d15529 100644
--- a/rust/helpers/uaccess.c
+++ b/rust/helpers/uaccess.c
@@ -13,3 +13,15 @@ unsigned long rust_helper_copy_to_user(void __user *to, const void *from,
 {
 	return copy_to_user(to, from, n);
 }
+
+#ifdef INLINE_COPY_FROM_USER
+unsigned long rust_helper__copy_from_user(void *to, const void __user *from, unsigned long n)
+{
+	return _inline_copy_from_user(to, from, n);
+}
+
+unsigned long rust_helper__copy_to_user(void __user *to, const void *from, unsigned long n)
+{
+	return _inline_copy_to_user(to, from, n);
+}
+#endif
-- 
2.43.0

