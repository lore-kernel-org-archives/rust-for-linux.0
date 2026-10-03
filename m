Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCED3B4EB2
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020318; cv=none; b=f4hxr+UTE7dC+cP9itLlVF1x/RV5janmZU44sbZw5v8Igzi9m57LBs4lRXt7ekIob+A9FTUZASzft+uKRsjWNpFz8eA8TZmY5Fn7x7XBVW4dEnSX8EtcY6y1L1x1EARWmapecLaPSd/byyRFaF8HDk2B/l6fJadaaRTlNLJ/COI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020318; c=relaxed/simple;
	bh=uTYa46AOecaM3RDzRZ4DKoJ5GDtP/85SSs5HVTQp0vg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eLZpJMIHqAvubxmmegUJD1OhUwyuaWxm4ngGtvwjyxYwMc+sdkhyaYOOEI7pF9oDpDnWJT3wjIYrpdzXAjx3EARrrA1g/kmHo9qaBR5DYlVT0A/ixyHg65jmoWnixf3DnfeKFZthdJvWEujCDTBWRS7lorLAknybpedw9bMD6HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sfIulzPo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfIulzPo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so3392705e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Oct 2026 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791020315; x=1791625115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrelwCgc63us5GOG6C+qGomuUs412KLBJjKZV/Gge/o=;
        b=sfIulzPoqg0k5KH8D0JBBjkSOt+OvH8D6BMIrPN0kzGW/pBAlHNEbvV+3vGnA60NBn
         h+qSsCLK2G17w1+uySmZs9AkhSbMMsnnNaGUpONLGbxOBi7wl+lbBbO+Xa3InvZ3hQnX
         I+yCsXt+jDK10hitN8KCRUDyJlZM5hfFx9PRu+VupM8BQB4clz4cF94LcKTf/wBsdDun
         ToQlGzTNJV1vENjYGW8wZPBTwkCH7wsdWWUJQPqoIfeAhdhitlzl4uGOtA5cOK9dDn60
         fdeKWDFs6oXSRvQsuKF3TWYJZthwXi2hgRnMZUp1cAZ/b46S++aYbk4x3TYzZPFBD1Cj
         1sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791020315; x=1791625115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrelwCgc63us5GOG6C+qGomuUs412KLBJjKZV/Gge/o=;
        b=e8OiEkW8Lq/rXe2YMb4R/ilMkkUQcdrVR8ocYMEg58Vz6lxuCDacDygAkY/ml7n9WR
         +nyTCNhhqNqi+L5El9PFZ6/q+eMf5NQ0hOuaHaqLqalDtUDtEuBcVCkBc0g1gc1W0dpT
         /jNQPmhVWX/ZiZsXV6ojWOhrX+eKBhrNn27iHPUGbcPY7aXO0hxb1wswJ/FN82HE5fZN
         T1AZ0NRpKjBKJV7mXRQ6V6tv42QsRpnwyg0j/itYQNuQdiLH7FrZPtnj8kK982PuTNMJ
         ltTA9vvrsCHCrnrpa/7sWY+kImtGPyNi2yiXogfMe4Va4Q2MIW+JnGVIEgvOdgViDuEO
         f4Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzbC74g7wfeVylzS6UVl4oGS9cj2cfBgpLJP/yU+/JfagRNP6GDNKEgXp1HOot3DH4u4lyM+EkxFhFdO1NoFQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lwmrR/3a3+60V4fnfG6/YmGPzkQfPZ43LGW3lKMAvgnkJ+q5rf
	gWkaLIAsAkMGbTQRL741Wq0SQhcZawUFiPSon5fPpmuIy9wEOz3psm/u
X-Gm-Gg: AYBFou1YDoPIxhYRuvPxbSuDvNMTqIjJtEx5ftiIYehZuSt6wJuTb14L8SWUKLu/nFv
	VKlqfMdtTz4Y9CGcZ9VMTjlZj431dx8r29AL4fWqGrWoqT/A0wlNNhvlUyxWq9GDnNreaJf17Ts
	acrGhLbq9MRuMc7f4yM+vJGG/0bxRdfP7dvjv6C3vzpdRMRt4eJybOBFAjpNjC8Q8MfBoMechfI
	Ji0wlGyVJ+CXVQnsoPIMI/8JQ3RS8Blx8IfRpzD1j0zho3UsozXUIaplzlX1MJr9xsRoWG3KXh/
	d0ObuMoDBal0ZBr54vW+EyJ0tIn14tI9AVT+5eJDExZrKKMqbd9bmfSOqYK+W/lXook9PTAMHzG
	Jitiw/b4sZ+wG3fCFp4rAaUDBPs0gUKebVoGJJYxSaUWiHZUpD86FvdnlZjiwEds0HjU4P7j8WQ
	ISGZIwiL77v0ioIonyhiP9v9kwJoHNHCcpkob3jB42mS08msZ2+b260+vIPuh6cfi2HjjT11amg
	lXbH2ruzz1OP43wsVAD2hpi6yyXrNe9kx39OjdywElTX/xB0ioxoJ81l3AwlieckQcIm1Mivu3A
	68DIJfz5fBGtFu6+BQafsHr1veKcd7DT9BWOdYdE1GUa3e/1G0RAuWITjH6wWcOrLSOVsyw4z2y
	62aIGlWAK
X-Received: by 2002:a05:600c:8b88:b0:4a0:258a:b25c with SMTP id 5b1f17b1804b1-4a0276abde3mr84502655e9.29.1791020315095;
        Sat, 03 Oct 2026 02:38:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2e2-2001-c47f-5a89-3d9a-cd2d.310.pool.telefonica.de. [2a02:3100:b2e2:2001:c47f:5a89:3d9a:cd2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm136528375e9.6.2026.10.03.02.38.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 03 Oct 2026 02:38:34 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Sat,  3 Oct 2026 11:38:26 +0200
Message-Id: <20261003093827.77857-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261003093827.77857-1-kmehltretter@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
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
atomic_t operations already do. This is safe because SMP requires
ARMv6K or later.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 9beb64d30586..3077f7d7f520 100644
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

