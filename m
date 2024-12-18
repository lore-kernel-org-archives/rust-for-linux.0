Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D7166F34;
	Wed, 18 Dec 2024 06:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502889; cv=none; b=sJTONHrahupmJm/97Bi12reYTSfAKedbqjhE60h1S+/ADu54oNpBUhFQy6GuUAaaZhHWEOWuG/bH1XAfXhhwjcJNUSEUQGmTMK74A3reA3c0e0rVlxcxzs0b8DLtNHLBzeuB9ektRL2E2ZxQlK4p/P0E8PYjdQiVARpXNOJ0SIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502889; c=relaxed/simple;
	bh=poPMKuxFCyNN+k+FyvPioVRFCtbD9iybhG3EXgL//Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2atBQimv+4EjSod0TF6Tski3hjTx5aoE7OGpxERx9d76ZcrAcDdugCGGecdAmad/AKjmpRGISAeYK2+VrEp2neFscwcg4pEXv8Vg81TvPujLKqYJIrOwuzqIL6ZSMS7yjQA6hlJAFNDIEFo7d06e9na2PFy10PldDaRZ2GiUGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZL8lXwj+; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZL8lXwj+"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-725ee27e905so7757952b3a.2;
        Tue, 17 Dec 2024 22:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502887; x=1735107687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV4HRBWZxkX47QY6JDDMA6tt+8zgh76SAzdokkmEw1Y=;
        b=ZL8lXwj+81K1eQvaoNcEMSB9FM1prR6MY81IF4z9FcjA6xkyGdsCQ9CSbqV+Szz0dl
         G2WbWtfopfBYLVdqoZHO3/9T9Np5Ef5LJSor2J7RqyZUPiTQmzlbmegCq1GNkLmJHBIA
         5qgLlTU9x96GiS6UiznhYGaxvq3hog4ZAlokApgHLzMFo3DHVQTuTSMfanSviginRuon
         55CtoolBlzShjwnhvslfzPOL3j12hyN2/WHUviox38Nd5FyY/bfhO9+NjW53avBB676R
         OqVtYn8lbY2MvR+g72+k9hlf8YV3CXKvQg08BEKnArHyR92ThR9C07s7bLhhD4FGcTsN
         0E0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502887; x=1735107687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV4HRBWZxkX47QY6JDDMA6tt+8zgh76SAzdokkmEw1Y=;
        b=DRJSB8BlWwJM1wSTXZ6fbcP0LmtE0ZkRAEXnarBtGWCHofn570S5/L/oCTNljngGxh
         4RMUyD+qXXA33RQf9KiwLPy2e2Lz20LOUUtCpdZdYWu0V4Y3f0qIhtNRM6TqIcTMv0GT
         Ixe1ZP7WgnIY2/6cM2adhNHDU/pKCENF2QULzAYGVyn8RZhSOWOFBNTH/oEsZtehlkXz
         D1iF2t7uvJwfUY0gTC6fxtmV6fltWNBrPV4gxltZuv5K6H2MJ/CS3AVce1AUK3YFH3Rb
         Dk/xE3dbjvfhv3+sKqIf4VuVaha9NEQyAvnqpi6Vqml4oc+/hoDThYuwZMMP50TYJAk1
         /oeg==
X-Forwarded-Encrypted: i=1; AJvYcCWd/QlbTR2C9MagQ/Tqx6xb2Mta2G8OgD588ZWHo1+FGqkhu6ji2f7HTyP7p8YSmoOCTxFdzP3uOJuUSMv/MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydxHEJH+QfRwx5t4BeO00YdwbBhVOfl9/7OIPaREwGR0FLPMzO
	MIOeuRHReQNkUX21kWOUBJPZByoFr78XGU7nRv/F3ZLv0b2wQDk2oaiOrGLa
X-Gm-Gg: ASbGncvdLUEPC263pgL26uBYeTP6482YS51QZkKKOHJwWsv/Tl7P7GfbmtYCbhmnlrD
	RvB6IbghdpQLtMYHSkQ7K43sqmVXw8x0zPDKnVN4JP49ZrWdT63Ta5Q7o00+Cz53DSIgsf+hiJw
	YCKfIh3ydhazxKZTMv39zH/CtaHMvZsRBj8wPViSzXBOZap4focwTAfz3BKpdN7BuBQdS5VQEF1
	Spv6dO0IflXeMW5WHXhiPr5ky1QSVDlMZRNJHYoAgBqra16zuF/OhO8qRYVDnve8UGuHxMWFvuB
	welYKm00w2WZTg6oTA==
X-Google-Smtp-Source: AGHT+IFlF8vY4Xu+YyeQGqBnLgvAT6KCSD+NGgBHnqg25UXCR6Ho2esifXRrWSvDZ1rmidOkpqKkqw==
X-Received: by 2002:a05:6a00:2c87:b0:729:597:4fb2 with SMTP id d2e1a72fcca58-72a8cd37353mr3156867b3a.0.1734502887210;
        Tue, 17 Dec 2024 22:21:27 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:26 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v2 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:08 +0900
Message-ID: <20241218062009.2402650-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
Rust to avoid the duplication.

No functional changes.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/loongarch/include/asm/bug.h | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 08388876ade4..5cac2d3efd75 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -21,14 +21,21 @@
 #ifndef CONFIG_GENERIC_BUG
 #define __BUG_ENTRY(flags)
 #else
-#define __BUG_ENTRY(flags) 					\
+
+#define __BUG_ENTRY_START					\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
-		.short flags; 					\
+
+#define __BUG_ENTRY_END						\
 		.popsection;					\
 	10001:
+
+#define __BUG_ENTRY(flags)					\
+		__BUG_ENTRY_START			\
+		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		.short flags;					\
+		__BUG_ENTRY_END
 #endif
 
 #define ASM_BUG_FLAGS(flags)					\
@@ -55,6 +62,24 @@ do {								\
 	unreachable();						\
 } while (0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)			\
+		".long " file "- .;"				\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)			\
+		__stringify(__BUG_ENTRY_START)			\
+		__BUG_LOCATION_STRING(file, line)		\
+		".short " flags ";"				\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
+	__BUG_ENTRY_STRING(file, line, flags)			\
+	__stringify(break BRK_BUG) ";"
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0

