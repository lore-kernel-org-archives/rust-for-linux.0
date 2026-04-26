Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8CE301486
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193901; cv=none; b=T7fXLBKt2FYyv26DUL7jz4klDMYmxigHQFMDjEeH6yhOqMdQntjHfP6nA1CtnOCQOLLPLtCU+3UwQKlmJ+m86N0WjZSWSuGyX8bCvljzNcMi8AgmpGje/YwS5Wv2Xe2juL+T9UJokdHALI9ZLZi8zDH5AJaiTGS8y7NI0MqDX1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193901; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmIMbjbtQ732dohIaaVjGrwWY6S7Irujj4jsl8goUjyKb86ZKoJWt3ZvbhqpCB6bNboNthIarDvCA1Id6ZXeps+Rg/iPV5uXis6Z0/1hdbS1vCX03Yz+4/uMonTUqdZlYacMOYRi0aQodIuzckWVWbiPD2UBXSWs9GghPhdXoaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+96q5zw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+96q5zw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so6231091a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193899; x=1777798699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=m+96q5zwnMQd+kcmnGOY0Ns9ZcThDEqrSTHZ7kIct2RuuFNoFhYsw9CxElJ7/XAszL
         aa9w33ZvMnKFwy08jsbPejuC6TIBSyKjjGc/QuRjue3PubOfnEgto0tMFOHQhjSvpH+i
         2eGE+KSYu0+j4G4RN+jvCsOp5uSWXpcdpXVOopXpTLK2dSB/oNLP9LYiH6xcS/yMoFYs
         IvQb1BORHqHf1WutQGSjA5WSq8k1aIVGVfxAc5eI6dd40AVlBKq8RkSCVgASz9reyjN3
         wghS6ikwiHJnTGGqAnLDQXOEDlyBIzPp9fXna1d0cXkiwLSY3Qj94M5NDqoM8MEl7aNK
         kKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193899; x=1777798699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=ZKY71Cp3Drjt3hb7p5UjlJOfZ4irAkP/Yx0sykax6A0xHYDglPnBYJA0844ndM3VQF
         pZVXl6Fd98JnfLXVX/Ba8UvjkdJNxzoZvyly4rIK/lDPDOiYu2cQ4hdreBdr3BP+jPBp
         UnkaTekZik/p5l5yQk1BLhoxoBDu40C5oxw1X4nEA1IgFsaFtqePdKNhflgfaCLyZBPw
         9nck6qSdver05bGJEEDseMW0E7FWm8FTJIa+sjb1KjWp5spDf/uEWK3NsDmKJG3FBLKX
         jBzJrwVf1otg4AWWyVRe2qLSmK1u5qWKgGirlxjyYv+c7sMoNRCVARn0obDwkH+FiZP4
         ax+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+bvhn2AxMspf3LgVMkhWf7AAfHgKb1Q+8C8v3lpDgquADfjM6Qk77weFVE8f7hYfUvTwSu/6kPwtHcrrMB7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxa8Mc+ds1q6RV2hSO+h+IQz6zi4QLu/QvLtoRCm0uQHDL9vK
	8JaD5eKmrYFgmHdIuz/VS8EgxWXIYon8CujKjgx1iSwApa2OZKLuiWka
X-Gm-Gg: AeBDietIbJXlQC5qXwpbg/TkooNbHHc0yJicU9m2Vj2l2PBxIy4CSQop42l93t/CyfI
	RvO4EOOZBG8Im5reWUKJI9gseqYJNis2azBoYCDZqzzgKKmQAV0jXU4K4oeWZM3Iln5VAhxSN9V
	UcKa4F+Z63Jip7DuHvA4UhJw0d5JAoRxWke3y96ITAzT0fYaTYM8RcYS3iXdJnniVVQxX8+9ePd
	prQByK2WK1zixyYwuUO81pbxSFvd9eKdbP3JGor0WxqkWVBN1JuF/hh7LJrVigZsqxnKdXSdoLt
	YX+16c5fY5SXpC/YFJ1wVp2cKtEojCAbIP4Hbr8smJhdCMpnMWDF3i+zFlWkKV1QNukG3vj8aJi
	tYJBL/o2pCtxv0BTwMGLsB8hE6ZgWY+Nf4HSiPbM+qWdEVHjBYG0uQS6vOBLpaOEc7mxMqFCl5+
	7qjTGNHGeXfh6EnuXF9AiC856VoudA+4KpsniRX9CG+XazmphcG3QUzgIDWKpPGQhIQh2kvq6BA
	6HqQtPjXqUx6bU=
X-Received: by 2002:a17:90b:3f47:b0:35f:b1ad:fded with SMTP id 98e67ed59e1d1-36140474686mr40098125a91.18.1777193899315;
        Sun, 26 Apr 2026 01:58:19 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:18 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V14 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Sun, 26 Apr 2026 14:27:21 +0530
Message-ID: <20260426085725.2090827-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
to avoid duplication of inline asm between C and Rust. This is
inline with 'commit aecaf181651c ("jump_label: adjust inline asm to be consistent")'

Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
index d4eaba459a0e..3016e9c8d6bc 100644
--- a/arch/powerpc/include/asm/jump_label.h
+++ b/arch/powerpc/include/asm/jump_label.h
@@ -15,14 +15,20 @@
 #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
 #define JUMP_LABEL_NOP_SIZE	4
 
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection __jump_table,  \"aw\"	\n\t"	\
+	".long 1b - ., " label " - .		\n\t"	\
+	JUMP_ENTRY_TYPE key " - .		\n\t"	\
+	".popsection 				\n\t"
+
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+
 static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
 {
-	asm goto("1:\n\t"
-		 "nop # arch_static_branch\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+	asm goto(
+		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
@@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 {
 	asm goto("1:\n\t"
 		 "b %l[l_yes] # arch_static_branch_jump\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
-- 
2.53.0

