Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6CF2517A5
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775305008; cv=none; b=ATnmpX2G52u4DGLNaiZMQym5mEyvxQV1vPAWgREvrNdzLlvi4KHnX9/bMcH4A8Fr7YVFjb0hj8zlLjKHedExeP25D52ctYheqmRV8b2hTjd8nSwEgzJQg1VltMtVizkB0GlrTgowS+I9duq8ccR8Ae/oWsPTRz5/osR6uTku6jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775305008; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4YJuDmc2AWbT+PSL0AMrUU8MQyepwm6XTihwJnS7Ze0ehENlEjpxhg4XRWEu0E3m7k8ARk4pkqKbLideteaL3z2rMZdwZfx2aZcLyzda9na6VmmDjVjkn04Fv/ICrGSdip+dxI9zaxTgyovKGE1pPT5TXW5LF+pNgMPygUTgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5m4zPT+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5m4zPT+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso1810835a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775305006; x=1775909806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=H5m4zPT+ONpGJmDxWqwKrnI8105ZrfdCRmK2Zbjcj6dXwfyVfCY/aCpKIoHDJ0ZqT/
         EJYSEcGQSkU7SsrL6tuR3mcZSo7m+8HimPcV4ZxkMDdDkUnMC0fj9N78x3ZUvVCbVNtB
         UINjgGQvrwY7X4PlXZR/USw9YsmqafTy+OKC0PFlcwfz+Yz24y5tQbNkAB/xjU+KfsTN
         RXH6pzUKi2sFZckEgpMyUTzblsW2sr8L1y4FB+uZuCMLUrdFRugt2P6Zdq1CKv3mIWeA
         VbTh4f+kucrp1g0diTl20+Scetr8L6osJmfbFOEMRITY+S4TQsWOvbIjtnNbQbSsRNQm
         8RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305006; x=1775909806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=hW7T5AsmEOqSxhXiJim4JNc45dy2Nb8lnuMX/O795cUvS2eEy/Vhjj8hKXqLUAZFDd
         TfAiD42LVRWUTIeXxFLyOTMmC+QLifcY7uS55oFHQW3kDv7CPf44MPGD4IX1tYsfypP8
         ehpiqNHJLKTy2TMNrO5zHCybFuQSdOdkvgnaEVCdk8HjJxgDeVPgmxBIINbHwUVVJg4x
         Vk2U5+otSj5VCIpCWwCv1C9gCbZorzXdPBSTEdrLW+vCfPtpcw8XXJCSVlihXzTqzlNH
         /C9Vg+UfG8XvRnsgJNaB2U12JcesPXmb6v0zHpqyX3IN+bYrVXYg57mZbRAAPR65/Tui
         +fnw==
X-Forwarded-Encrypted: i=1; AJvYcCV+wQrz6cZXfvnZ88CIm2AWTi3Q6wcnnpWAvliFZ0TJttYczB2evkcZlGODnrzSLd2bOVtyReMY6SRyiEw+zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPKHLwWAwGZCXfvdtDwVl+So2gqp7adaqB73Yx48Mz2h3e6bKt
	2ARLmmliI0kPV50odoeWtpWC7EhR06CPmcw10flikfo09aZa6QNY1hm4
X-Gm-Gg: AeBDietqNdNEE7x/hET28oqAA7LPoCX/nSqBU3Kp8URF8nAwJybtaZBKHKVdEwpQDrX
	LamDFLqT7wIh863BU6Y8sjTPZ2WK4/jMGAebunfXvwXVDqhYApTX+9XOvrOJCi0wf13oyFXZMES
	Vf2xAjp0fQw8ZIYhEqvQxHKQeWvqVZ2LTmZSA94Ak5cRFYFCvovonwTQg78hiGIQKipwoGSmOeq
	jHcYeaFPz2f/P2CP8stoV4+eTHqSAFsb2lV3sACzby1ZRRjUSVgvIeKTp/DZSpavhQMJNic8e/X
	7PG0dDzdDyHOdOPRdDwxzTnXNN90IBfHNRIw9WTJxhEiJ3krI5WvlX89mn3hyrFs97OdFeNXD31
	CbS/ttlvZh4WiWk809rlx0kaDn1ID8FkCEXolLr0LU0rM9VoGLdT5VM1ULRaqQg+cMjmTbKvQbK
	+HtozBM7gLoJYuaYDS3P7CKdHKLQP8PLvaKKHnySYkoe5a43fDYDcTjKEQxMWpV1jeMzIwM2QwH
	WM=
X-Received: by 2002:a17:90a:dfc3:b0:35d:8fdb:4f36 with SMTP id 98e67ed59e1d1-35de6941208mr5104917a91.18.1775305006017;
        Sat, 04 Apr 2026 05:16:46 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de500c42fsm2702745a91.0.2026.04.04.05.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:16:45 -0700 (PDT)
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
Subject: [PATCH V9 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Sat,  4 Apr 2026 17:46:08 +0530
Message-ID: <20260404121610.1956528-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404121610.1956528-1-mkchauras@gmail.com>
References: <20260404121610.1956528-1-mkchauras@gmail.com>
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

