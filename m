Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4AC54DAD3
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 20:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923523; cv=none; b=E7xJ01Wj6dd0+wQF/cjijtPjYPHgTgZMArnxGUrFK0ykcbPgd8m3ucRBfLSgrXTDjR1l89uZIDlQLcMyBnNXjhb/a0BE4uigxz4Gxdz1QZdDTAO/8z6VY0zeYg/9BP1lmsr8nO7gviBqkqN/9PYCVqhHwj3JvT+bFBBucFt/qTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923523; c=relaxed/simple;
	bh=rvDjT6+rkk/VmCiFIRydEcSy1yOMxPWIRLLIGRibt+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QXcRgc6jC/w+cmZ94N4ELREIgjC0XKeWZb06hDRxyeqdNyvg6rsUQ9V6jwvuNaJoidK2QCrZ/bF9CpjXpd3jjEUDlwSxRvnksO9NLYxD7+l1zMEjgJTsV/1DNkNeFDZsd7E+YqyYffU/PIsMrJuEodGtEK+0BoSEPys9s0GuAao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLKhU1rG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLKhU1rG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so20918745e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923519; x=1792528319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=eLKhU1rG49q88ag/gWs1HMDAUcoZLOb6EXdOJLFUyd0O0SXt5VPvOklW/Qz6A+7VnF
         lvPo/hXub3Gqi9ui2+6NPw1jfnKAhtsaO3fKD4XZyMmKi07Z7Eow1RNm1cW6DTvaXUzZ
         qj4vhQ2qTTLCH6gEc1n/VJYGiwzBwHwowpnm+8Qiz/Sp480Y8wv3gcopAf3PWSjXxmjB
         NYgcQzhjNYouv2+RrWeqgxqJF3+MiFlJ5XwOlwYdDBeJL3s2F6lQVN6oV1ZLU4pzynut
         Sj94e2JC3YRfq0fH4GC1vp4slwDQC1c/3j2DljXg+OlmVg66fbdjwwAGPJQOLBn0NGgk
         46og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923519; x=1792528319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=HhH+8UAEaUOtcxuaNlt2El5hh3uBpWnMbXvLUdKmWDlFr+RF5CM5WAnOE0XWIPTlGA
         HLyLFGVOZ7SAGXvvaptHcux1ep9fVutUkIMjweo39ij4AOzAakM+k6gyyfkE8vEuviPQ
         Bq4ojEFo6PnjHkgDBFH9JAiWoigRSKdJVfIdzmQPKVgBQHRyC5K/xCvNhbxxeCsCJqdH
         G1np1knX/guMFzyN9sCyfpwNk9r1XtGfIYqHoLqNvcIzgR23ORcRh1ZhzA5onzi1z6F6
         ed/VtSOZmvxI60J1wtKXIsnBJPXrFNgH+iC67zYLKkbpHpGwTf/84MvRyiy3FJy2wUyX
         HTKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiRBJWMW3A7JpHXXiw1IEJcfIbM8jpkRgBVjzCdxB18DwAOkrU2JMAqjuKq0vw8jr5EdhxMXPyiDBfpFbN6g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwwoq1ZB6oG0Y4v/kTVN/AR9Qrat0ZfLaBOQcKUiERHN5vGRhp
	jXPFJbbwjf9LrMcN83L6Sk8De7iV51Yjqdc7yULd2ZTZMBNjyV4YHW0M
X-Gm-Gg: AYBFou0QiSC8UaPCvSoPAeIyQFkFTn6zYREpxv3LFnw5WTfN69vYGQSq6v3ERpnXwVI
	pWGEb8Y4ZRDfWJEdSYvUICIg3Ig1c3N2WBhhCXe0JTK1g7kgc6XcxDy90Olx9T6O79/uf89fSZO
	yobMNV7Cansm4Q74NPvDtWiV3OErqm4X5LxdJSszFn6N8eWn4fGUyBGyfeyGWsqVT9SG7eqmD5b
	5HvrHZKd5k6yqGdef7HvSTheNsHltLfV65rIhqhvIq7gBfpL1hZ24h86GRckuWTCL9hahF6yMWG
	VRIGjlBUw87p+DfhfgY8oLe7wF5KQpR1DACuWtv/dA+U7eQm7GCNpo5oNqkZOIzci0NmY6pAWmi
	rgLtYmQ1F5pMJT9GTto+q3PAAKslvVJ1JUrFkUmp3S22Gpsvi+x7E9mmEbh9/lGqaY8CXK2/xLz
	LDDZEVphEGNt5kmh/0+TMaJrrMZuHQe1UaM2IS4LGm28cMWOCPzhhqzFv4zg2z7OKMO9rCjw7PN
	4ISg0tGVlrG+jRn+oIhvNFPGxys2RUeGCPn2gI33ZY4tbn7bMN52h/oMjdtcKd6wC2/hAWBfeXh
	qhZeUtUSsHbtUe8OmzzkTjbtuXkKjMswmRA2Ph3zcF9uUXzPiXtz3xuYyZh0Do2/0NF64ELysQQ
	Z3nEzTQ==
X-Received: by 2002:a05:600c:4ecb:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a18e43a29fmr276884405e9.2.1791923518889;
        Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
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
Subject: [PATCH v3 2/6] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Tue, 13 Oct 2026 22:31:36 +0200
Message-Id: <20261013203140.31741-3-kmehltretter@gmail.com>
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

Pre-ARMv6 CPUs have no halfword swp, so __arch_xchg() only handles 1-
and 4-byte exchanges there and turns any other size into a link error
via __bad_xchg().

No C code needs a 16-bit xchg() on these CPUs, but the Rust atomic
helpers in rust/helpers/atomic_ext.c provide xchg() for Atomic<i16>
unconditionally, so building with CONFIG_RUST=y for ARMv5 fails:

  ld.lld: error: undefined symbol: __bad_xchg
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg)

Implement the 2-byte case with interrupts disabled, as the pre-ARMv6
atomic_t operations already do. This is safe because a kernel built
for ARMv5 or older is never SMP.

ARMv6 before ARMv6K (ARM1136r0) has no 16-bit exclusive access either.
It is not handled here. Rust stays disabled for those kernels, and
they cannot be SMP since commit d70242427110 ("ARM: rework ARM11 CPU
selection logic").

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 0ce5225af442..18555ae22893 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -31,11 +31,10 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
 	unsigned long ret;
-#ifdef swp_is_buggy
-	unsigned long flags;
-#endif
 #if __LINUX_ARM_ARCH__ >= 6
 	unsigned int tmp;
+#else
+	unsigned long flags;
 #endif
 
 	prefetchw((const void *)ptr);
@@ -106,6 +105,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 			: "r" (x), "r" (ptr)
 			: "memory", "cc");
 		break;
+#endif
+#if __LINUX_ARM_ARCH__ < 6
+	case 2:
+		/* swp has no halfword form. Pre-ARMv6 is never SMP. */
+		raw_local_irq_save(flags);
+		ret = *(volatile unsigned short *)ptr;
+		*(volatile unsigned short *)ptr = x;
+		raw_local_irq_restore(flags);
+		break;
 #endif
 	default:
 		/* Cause a link-time error, the xchg() size is not supported */
-- 
2.39.5 (Apple Git-154)

