Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C033DEE3
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 09:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714045; cv=none; b=isFqtQInORbs0QWctADfrNmbdJIfi+RNhDxHqDm8/dRg8CPptsn3QgpH/+D/y2ojuFVkzuuo4g2BCI82TChGIbv4KT3Rs7HWuBi+JnPkeld/u6tMS5uYjgbXlNK1IpwvSOFq+g1ifxnXhLh4FfJLCkt8b3sVpb7BSxJ1zmi21kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714045; c=relaxed/simple;
	bh=63ZYZ44YU4LogYL8Tr91C4w7OlzNcXn3CNTZsrHwj9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I8yFWovt59FkRjLFKmrWmOIQuuBUC9llKwAhn7Tubld22QpBaOhs6b1WbPxhYqn0C5UhCDcY8QR8n06xV/qTVvXs1satieMzjKIdlj3OVjj69g1Jh+a5cRiFrsJl6PU49I1gNtM9SFksbv1dTFqVpxUSMXCSKykeW4OR+7pC5ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAno01ce; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAno01ce"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a9296b3926so3676395ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 01:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770714044; x=1771318844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=WAno01ce1Yp8PbvRbac6UPYHTTTUWhq5vWKHmPiaRCFwqToRt9uoaVXk7eda2TuFbF
         sbkHVmsgSrpRxnhSAD2b0RWbWhjXjVgN53sd2l4Lj05jZ2/TbhNxypNk9C8D9BUio5tu
         erGLxloK2UayXhcI7wXCwr7DfXhjoD7cgELFjYn1qS+/Y2/AOOkMsoQizZj9n64bONYz
         fyZv6PTZ+vLo3Phg6ewl/JgmymTUVmpPy+niXVriro7I+//kZ9VjNa8Vv2XNo//gVq3n
         pbAet96hNYFUOY/ftuTbPmijBzp0SwUh0pFTI4wOFkKzTloZhQB6VtXc1meUwbKD17SG
         RiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714044; x=1771318844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=tw63+OYl9d6KGifR9gzBAg7W1y5+zrWhU2D0C8m++JPbZ63KyHTYvdioe3SBfxEwsJ
         Gx3Y32R59BZnDKJEnYaukXl29Ia7dps8mhqMORuvEw8G1ZdQv3zZFCgSVlAkPHR1r9ob
         SwIeA64Z+YkWW85RhlC4zK4pxAvlSIqmiBHMoerIAg3FlcvACpLYZ+InLU9WMXzOYeTc
         Yo/uvhApaQeejwrP+ZWW5Xhrv0iZTbsN58VGqCF7DbTYcM8zt6VCkuaXf0eTNL6EvUFH
         T+WUmMFuK5c0NNP3rNz7j1AJS/i9YKKqxivGtbP1Qa/GiLBxltUk5ETlWncW2I3OZtVb
         neXA==
X-Forwarded-Encrypted: i=1; AJvYcCWE/azax6piMND9p2dN3TDw8sDGygt/10FDRXhDHxKX+nvnMgU97yNlk2C26LMYedQpT2Smx0nwGSjagLtBRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQ18UBLMqutRprKc3goSESEjd4l+rNLqa5fFZU6AkbdDwviNw
	+WVHfeIJEXGNBoEYmJHXNF/gYw2v+lEUflcstEESBQX6pYxNqZXj79rv
X-Gm-Gg: AZuq6aLBDVjtESZ3pbsN5Efq1SbOimaV2tiLznpOx8X/9zXYW2+gjlyhtfrgarRDfIu
	cWXiSs7QmDHeL8vl/kMD+Cc6aCHnDPN7CHRKRZ49C9sctN5IobgCqXaQcI5vK/ol4WEEclbQR63
	pB4s7cnd+OkrC0oIm03XopM/NUdyKatw0Rb48WKfbzSNSewVfrZtwLxk0uANhmNyzw9Oo4LGapH
	1bbu6TGhqPQi6pDnyE+a6GCcIwNqW+w8Cd9SYup7DAlKD0YPLxXe4lzPAeRfHm4g+SqOr7JeVt3
	VQpc39PgQw/mpY9FPupkd/ak+TtuTtAHo1sKsr3mwX+IQCIK259zEaY0TnKV+cZeP3fsUENS8oa
	hcBGid/ObOKPru1Z7hwN2ncMcv94Bz0fY3PQlJSM2rXV2aEigj/LEF7/Fs+sQbxFVE+MjWJl/lY
	lyxuLHaiH/rFSwbRLuQha+YTMaFM2nR19eURBNljL+We360kQrOfl8iMkXT+fX5z9vSHyokUs=
X-Received: by 2002:a17:902:ea0f:b0:2a9:450b:104 with SMTP id d9443c01a7336-2a951969dedmr128874815ad.55.1770714041597;
        Tue, 10 Feb 2026 01:00:41 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c7a342sm129536605ad.26.2026.02.10.01.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:00:41 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V6 1/3] powerpc/jump_label: adjust inline asm to be consistent
Date: Tue, 10 Feb 2026 14:30:20 +0530
Message-ID: <20260210090023.2587534-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210090023.2587534-1-mkchauras@gmail.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
to avoid duplication of inline asm between C and Rust. This is
inline with commit aecaf181651c '("jump_label: adjust inline asm to be consistent")'

Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
index d4eaba459a0e..a6b211502bfe 100644
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
+	JUMP_TABLE_ENTRY(key,label)
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

