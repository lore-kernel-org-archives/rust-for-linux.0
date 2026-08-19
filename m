Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F603CC315
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787129322; cv=none; b=bpjpFn/8A8wFmsI4fN+vbyM7jXjhBhWVo3FqoxYGm+pz7khCr0Whb4z9CBMbi8B9TDp3z1VqzluOIoLFDRxIKo1scVlatup8I0NeMNafvNDyDaFwUVu0Fv3fx5AYxW03sXooxj/c5W9lgFJWIzvyH7nVfotZY7slvsG4EiTYCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787129322; c=relaxed/simple;
	bh=q2agy3SY4JPunS4/hw2x5y3ijIlR2i0zVgfJGnnISmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MxLkbw0JvOj1OP77cE8kNrL0s3NFbdma5KHRnR1mP3WIzW1YE7SQR9bA4lBu7sfdRDGTWhIWzjaq5dJAspf1TWE/iMSgB0SIrhirIQ0/idThGDQiG+9ytplNFCinTpL1cZ0t/2qE8u0n1cpci8AFiVq1LTFcCHmhANc2kNLNo4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLW4V57N; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLW4V57N"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso967972a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 01:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787129321; x=1787734121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQ7keLJ8medHWvNAYhKdIsoM73FCKMrfDS9RRH+9RkI=;
        b=DLW4V57NGSBudUrLDRaQ5i6k+Ad/sTHCvAv5yT7ZNif7JMI+MdSHb2IT8aeIrX7o2Q
         9JLG3y/uEPS3BG+yHTnl2YEAsO5zLCWNhd6CjonqsBTnRK22WMEFueT4JPTs5lCn+IbS
         laYeY2BmX7kaTqkVNyPhvUDuwf2+5t6X9M8wkfkh3LYPCbM8qIrUVRuMc/qNYpE+EMsw
         1eItUUBMXSb7v9tpnrnQiYauORuz1TzNWdokSKmAkS1Yrrc9ZR4t/+6EQUxNH7ZFhTKe
         2ciGsljijVeS60tFeCz/iInf/UwtjkDGxhLHVEosUKKpu0H8Zn+jBTJaHs6O1qZfbL6k
         O8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787129321; x=1787734121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQ7keLJ8medHWvNAYhKdIsoM73FCKMrfDS9RRH+9RkI=;
        b=iCuhn95VS7FlV22igVo8RCk1yoYJvXX1ZZSKgaK9CTraUhVGNkfU6fE6t4ouVYTIBV
         5f8VqyKt3VFH23tDqWEqKVgJyhZ0OaYDlQNBNCrW13aHx7vsC2iWzApAK17MJW7L8y5D
         aBb7oSnwGJeMXdjWi8393R9HCPbUc44+5kCjwLWGBuRX+B0NIVYY8lnGTslCSDjWgU2a
         QjMQo1twKZIQu5RgUP81yuGR949hGedaPq0QNjLklBy5PvYAf8p3Id+z9gS9pBZFAwR4
         xQt8lNFZpfB1IuUG/9mDydOLGF+K+92wOZwRzEg52hrud4F0DJ4usCxUUmU3EkvL8fKi
         wgFw==
X-Forwarded-Encrypted: i=1; AHgh+RqDC6cRyza7OQDiQyY/tH1YlXRfLmFCZuOoqtJB79QiecGwAW8NLNIvag1CiNg1snc1m/kMERi7HhfhypsoQw==@vger.kernel.org
X-Gm-Message-State: AFuF++mXcSKtLOrKLNM26oYSJdJjiyDAxibuCpud2OQ4CO8hi8kP0mDX
	eiHMGmPKJPD7CljLH5JnIubxssxgvjBrE6fNTVZ1oieKduTBvbz9u+r0
X-Gm-Gg: AR+sD11Kjv9QhYvflQkxPahMGoV5IrzVeNZdRE9rpJg2HZHKX3+min80Xf8/3ARQWcP
	pj1mhSKtHMlZYZaowyqRf2XB2oJ+TWGzdV4qxWLIjTp5dc6WVzZfpRCQxIBaJV5ChzgwR6S6P8V
	MBhulVlxBr6HNoJa8SINr7p8SanYBCO3jFPT7VtNQTsfeumJpbxN1/BrSC73FTRXJ1FDftI/qzJ
	T09wN/Md0sVTnNCpJyzikf8iqPQIOqs60GTCnHuoACD3/1z9rqf+g/6Dfl5q2y+kwLzpkzh7YXk
	9hj9AZCpw418edWoCFWWYuIsarw+8GLMxJSqirAvH2elydOSl35ZiL3amh2WScSPU7MAVpGTpSE
	n4a8K6qW62rrjbRh9MhhnfKuKdG34PVkg+hnl2izMyrYR0/13T48tRjmCNl3WyTUklcMDXLAR/j
	F7rI+KlUyH3BofyWA3Q/F2lJY4Y359aa2wNyE5/M49NdnBDzastOxNhdObhDyLj+YT3yFh9X4+D
	vWATtOhT7MbVR1qC+QhQZOjf/8hIiPD6E0y1mnggA==
X-Received: by 2002:a17:90b:4cc5:b0:37c:6130:7a5b with SMTP id 98e67ed59e1d1-39580ed0a57mr6214530a91.8.1787129320646;
        Wed, 19 Aug 2026 01:48:40 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf13f4bdsm5154174eec.20.2026.08.19.01.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 01:48:40 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	thuth@redhat.com,
	mkchauras@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Cc: FUJITA Tomonori <tomo@flapping.org>
Subject: [PATCH] powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust support
Date: Wed, 19 Aug 2026 14:18:25 +0530
Message-ID: <20260819084825.969116-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Rust kernel infrastructure generates inline asm for WARN() via
ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
arch-specific asm template string for use in Rust's core::arch macros.

powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
Rust builds to fail on powerpc.

Refactor _EMIT_BUG_ENTRY to accept explicit (file, line, flags) string
arguments rather than relying on positional asm operand references
(%0, %1, %2, %3). This allows the macro to be composed as a plain
string concatenation, which is required for ARCH_WARN_ASM where no asm
operand context exists.

Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
the BUG_ENTRY() call site to preserve existing behaviour while enabling
ARCH_WARN_ASM to supply its own size operand independently.

Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
convention, indicating that no additional reachability annotation is
needed after a WARN on powerpc.

This brings powerpc into line with x86, arm64, s390, and riscv, all of
which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.

Suggested-by: FUJITA Tomonori <tomo@flapping.org>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/bug.h | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 0db48977c70c..8aba39e0cf26 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -32,34 +32,38 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLER__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.4byte " file " - .\n"		\
+	"	.short " line ", " flags "\n"
 #else
-#define _EMIT_BUG_ENTRY				\
+#define _EMIT_BUG_ENTRY(file, line, flags)	\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
-	".previous\n"
+	"	.short " flags "\n"
 #endif
 
 #define BUG_ENTRY(cond_str, insn, flags, ...)		\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
-		_EMIT_BUG_ENTRY				\
+		_EMIT_BUG_ENTRY("%0", "%1", "%2")	\
+		".org 2b+%3\n"				\
+		".previous\n"				\
 		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
 
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+		"1:	twi 31, 0, 0\n"			\
+		_EMIT_BUG_ENTRY(file, line, flags)	\
+		".org 2b+" size "\n"			\
+		".previous\n"
+
+#define ARCH_WARN_REACHABLE
+
 /*
  * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
  * optimisations. However depending on the complexity of the condition
-- 
2.55.0

