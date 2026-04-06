Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F223559DF
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 20:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505743; cv=none; b=nhCIq6HWPiIKZVzPNZXFZme33PopFDs/sW626oGlcU1ID/SHS2B3jaE3fP2N6I7gkRoWGu+mGzoE5siLdxya0Irrjj3TmW16889BXRPjaRQP+WwSl0T8yxImWe9Hh35Y5psyZdfnMz2wSkhYkHOMBwa/b8gfydwMsXKTl6/Ec8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505743; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2OWSYOLnP6OgH02Jjqa8+Mg5oyUu7qZagSJ69TvQpTWFe0PsabsQpeiesB0i5AjgdGDX/53sp7xX6C5UIQ6SeXgGK1O4atCKlxX3AlEuebc491MVELOYKlNOuGYlcEu9vm4Ssxea7xY7s4w8pmEkquyHirm7hVtKVymzRBqSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4mlnCRx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4mlnCRx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aaed195901so18602535ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775505742; x=1776110542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=D4mlnCRxK/ADlobN0yK0+v8R4+Tw75UB82yOwkLE4f+tNFUxMn9En6rLrLyr4CZv3Y
         RaCA9F60SA5MBqAx515PgouqFo9lPTUN0LzUVfztyGmTqTBcRC8BSnRvIVK8G2m1NbUW
         mgMdrjSvVmA9wx9gwAI1FT4usdrwBOxhN+LP+jXrPS9zjZ2Rb4sXtJTbnQsgO2WwTnzn
         cPFlnqbDk9BAHIQNOL3Ef1XrOPTPTmfL4zzhzW4v1kHHNik+WgRmITtJEn8LjkMAM7Bf
         hd0FgjPe7+Bnxte09f5HKpmBQyIdebzEE40EbbbZrKvJfw0mJqSKszrNkaGt7U2AWVds
         ScBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775505742; x=1776110542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=ocFTP7F6mXRdWfHhOgHNI2DiBS+lnK9OH/PTH01sgEZHHS1VBeF0mDFn9GsAUeFhUV
         2bZDOZsGWvBd5QrUlNL8Cp9gdgEe1A/T14TxnclX0mNwJKHo4c2NKcW5AJqwx/yZaNSB
         vPm0zOwPjQ28RIHdDaWr7hf8Ncc5JrXW3ngWSIpb7W2Kb07oWxszqTXZqFt/tl5bO7y1
         yFKqTZdvx8Tjc8OElYkr/qXmHuUfcdpDJ81t9YWBtRo6JUcrCmurhZ1SN5gu9FJbC7Ku
         Av0UsnakOHWoCMfTFfYw4EZr17S5Srr84J84QggAixxvF4e6GXZPdqc92k7qdW5hUDKv
         5JGw==
X-Forwarded-Encrypted: i=1; AJvYcCU+v4Ff3H7pxfF2AJAu/ubla/5Q1ecHxw7iLRLgO1kwNtRL+X5mp/cPeor6t50XJ7gchScBNLn40N22CMQ9Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjiYL3a/TukRfGFyor+dullECdP+Q6Xo0SpCKIZi73vLIS2XTf
	m5yzMt2woCwmgILAC4m+7EViudJfR5LMrQ1PRtpSs16DKbTjjlrZpejJ
X-Gm-Gg: AeBDieuOBEgJ5PYibdtgdCmcqZVGstTNir7TZm1293ZF2dfqvwLl32VImFvEIFHf99O
	FR1bbA8RSF3t3NgxmL4OF/jfz/6I5n02atCqKlCg7yWTMnRSfbb7FafICGDrfQ+Ua0+jnPwxqRg
	lUBN/lVVPjKdyoogf0ZamcCRnvAM97BDNPDYZIOuRHJnRw2fpIgcKJaD8hC5VnM/MuF+GNOGG45
	oIXRR9asgHnOAK1WhPxzndYaQJnjzb1DN5Kw2yH0/OSFXxPUyI7JQunjay/aDS+GPIrSEX9K49/
	Muo+T8WRlDLJGq0xCc0gcqX6RohcNC8oxh5bSFdyQXd292v67MKUIs1jmEsEMWxvzXFdiD6+7bY
	PSVkI13UuhO8c6bGaNpj9pd+ot/9QZNZSkuCfexmEh3DhM0u2GGx+k7ABOkLJBh4SXyX5Mfrfpa
	EHXOJLkAn6RggzgOyMFe3aiYRElL8VjdPES1j0Nchsa9mRQAsJiySD+LKyDr5QOMXziqN5yYkQa
	aQ/CUxVH1TcWw==
X-Received: by 2002:a17:902:f54f:b0:2ae:5eab:132e with SMTP id d9443c01a7336-2b28173fa9dmr143439795ad.12.1775505741829;
        Mon, 06 Apr 2026 13:02:21 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af26sm151098205ad.49.2026.04.06.13.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:02:21 -0700 (PDT)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V10 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Tue,  7 Apr 2026 01:31:47 +0530
Message-ID: <20260406200149.3727922-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406200149.3727922-1-mkchauras@gmail.com>
References: <20260406200149.3727922-1-mkchauras@gmail.com>
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

