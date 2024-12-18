Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE99415853C;
	Wed, 18 Dec 2024 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734502877; cv=none; b=mGRbZ9j1oq4rjiesPcVR8pFii/Thy4HBtIi1nmRdhPvYpEx+QI4LnOaS1PCe2GKG1wYCR1hs+PLgAFdguJj63Fu3xXl6ADX1HDap9HRk+XzoNi9jRfbzmMkNLWlD5r6X7OocI24pya7+UGQypP1QAeFEBucw/Fa2N1p6hlse9gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734502877; c=relaxed/simple;
	bh=PphfExRm9WK9LCNvRjMF7+BNzJn3sHB2vfQS0MOjRdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yt8pClVMgk9VRl/MBBpjbyGX1m5r5eHWzv5BMpVf0gvP8eAx+KF1VvDU5GNRDYbOsiqI/gJOpfxRjDyj5mljQGsCkUnWJqJ6IY5bgY5c/uJ24jh+wVe+k+gFIFVzwtgZ/KzDx3+muWCCRLkA4y2K0TqpZtonQjOlvyvh7y7jGVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AU5YytX0; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AU5YytX0"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-728ec840a8aso6499980b3a.0;
        Tue, 17 Dec 2024 22:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502875; x=1735107675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=AU5YytX0iGhfkph91DOH9drWdShthW6GXZXmHuhx68bTJ/Mdqrc0hDk3lyU6gTIyX6
         zUlwnXedftTM/tduZutH53RM5h+OXnqN3F/nrRwfPE9EVbH/uxACTmz3tiUiXSxsNIXh
         rXtvc7n4R7Ukw4I43wGMG2uGfX21bYvEpB6vfgZRINIcR8v/4GPKJM+VLVviOGmxhtG1
         IERTW+Hi4mu089aLJlGYFAmi8z498lZoFGgzoFaaAEXzDiFxfoGaspoHLDvqIRlyLZBf
         MRIG9VhZP6iuSwswMF/q/ax7OLi12nqB+Z1CapEBqUhP5Hr8hZDVgAmPowtrVsUeHxdE
         EkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502875; x=1735107675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uE1ozcM0HS04q9lZpGc37IxiI38s9WgqP3M8QOeasQ4=;
        b=M0eHiCNOpOr9S4JY31Vez/+8f/rMFmaHXfrK5/IMMoFCE7fJSchshmZAO4+wquwFzW
         Z04dJD4pop3mj2t/Fd8p1VVjI8jITF+Xx9em7JpUzsgtyTMIvcZxnmTDzuetZUwXHJQf
         nUqtHskq8w85f57PROx+7R79sgJ2jIjBBAGBdytP79Jnye5JXHvxfeHQMILfC05461BV
         QzLQPu4AkNV+2ikqVvkYQFrps36oqsqZy/kzJup2Jxa1DDpzqNjNbnP49G1EgudWIica
         p6bWjXf9c/b5ZPyI68x+Fz4b8VNTns/PQRgqhCffjhjkneXlrn5ULHVdx6hm7UMmRDEB
         dJsw==
X-Forwarded-Encrypted: i=1; AJvYcCWeb8ZOK/iMoFeYlLvvT9KgJ8OviDKFtG2zmZ4ev8a+zgL35IGFcaTHKCTf9dMfeiRMIphPfz+E5Zi7u8rM3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg9cileKaPcjTFa/siBTBKodfGhv9ddwXWxnBfrhWOJzD9XesA
	7TdA6EF8lcH1v4ZjBasz8rsWGU11emqbBB61XRJ6cu9dJ2H4+4V0JK4Ct3Xk
X-Gm-Gg: ASbGncvCJIxqgNCobFErjx+L7xidf8Nzypx6n44V4k6yU5KF/oTLEE43/WHiFVISUBj
	wtq3aQmU1nwjy78XxAn7KBdBP2UE1I7fDUpjG7qYchTcdxzqm6diqPTr88oDdr2UAjolSQVgQRu
	fW+Y2NM3umQtleuKg9GsoFA13wmyH4yCzW7X+O3jTyYD02fE18RNV8aRoj6p2/WFJRlahrhqodd
	aSFAM7EM9Ze7a8cPZBR9nCL6J3PVvrg9WbJcKZogaloiPa125RVXWJLueMe02HEgORcAYlJXdFA
	sO2cbnaRgmA6LpR8FQ==
X-Google-Smtp-Source: AGHT+IE8Ef54dNMtI5iw0XGR0f6dNrZGSBFn2rHI6W1DYE3F710PsI3NNNPfVvjoBn7Wi42XdgnDdw==
X-Received: by 2002:a05:6a21:3382:b0:1e1:d22d:bc01 with SMTP id adf61e73a8af0-1e5b48831e7mr2645443637.30.1734502874926;
        Tue, 17 Dec 2024 22:21:14 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:14 -0800 (PST)
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
Subject: [PATCH v2 2/5] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:06 +0900
Message-ID: <20241218062009.2402650-3-fujita.tomonori@gmail.com>
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
 arch/riscv/include/asm/bug.h | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..ee6b9b787e46 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -31,40 +31,45 @@ typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_ENTRY_FILE(file)	RISCV_INT " " file " - ."
 #else
 #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_ENTRY_FILE(file)	RISCV_PTR " " file
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define __BUG_ENTRY			\
+#define __BUG_ENTRY(file, line, flags)	\
 	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_ENTRY_FILE(file) "\n\t"	\
+	RISCV_SHORT " " line "\n\t"	\
+	RISCV_SHORT " " flags
 #else
-#define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+#define __BUG_ENTRY(file, line, flags)		\
+	__BUG_ENTRY_ADDR "\n\t"			\
+	RISCV_SHORT " " flags
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
-do {								\
-	__asm__ __volatile__ (					\
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
 		"1:\n\t"					\
 			"ebreak\n"				\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
-			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
-			".popsection"				\
+		__BUG_ENTRY(file, line, flags) "\n\t"		\
+			".org 2b + " size "\n\t"                \
+			".popsection\n"				\
+
+#define __BUG_FLAGS(flags)					\
+do {								\
+	__asm__ __volatile__ (					\
+		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
 		:						\
 		: "i" (__FILE__), "i" (__LINE__),		\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
+
 #else /* CONFIG_GENERIC_BUG */
 #define __BUG_FLAGS(flags) do {					\
 	__asm__ __volatile__ ("ebreak\n");			\
-- 
2.43.0

