Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FFD2F8EB8
	for <rust-for-linux@vger.kernel.org>; Wed, 20 May 2026 06:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259647; cv=none; b=C/7Xj09A7gYnuvtXzxKLEh2HYSm6DmuxcSr7EYZnoKKS6jX6pk/SWE//UF8w1GsQkW34mzMSXbMgrmHiYczdWWmUK5aGEc9KYTDTaEQ9xkLBfgnYY2DURIjdP/g3e0WDtYuqsCfXdgyD7dW/Y3JyEb7gOo66AO3q1+GEjlyipX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259647; c=relaxed/simple;
	bh=K6MUpZgy5eBIAUkcIRYa1Whzr02Heqs2j5+IBpUoWqc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPdyC27X+PKcYaxojPdTKVfaFsDhm1p2uBBbmq/to1hK9qQPYUJE+t2c6CeiUYJnI6Nj5cHt/CQ3BgGSLUyDSiKj0di2i3iFM4ZBqfxfym4l2djvc3v7znp81NmI34+/QQ85y7x6Co+dR/vjw9Kk3q9sI2YZwuSEVo9SUdGnw+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaNjXXii; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaNjXXii"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-365d8e43759so2423858a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259646; x=1779864446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cHgHzHWAoKXE2eMaeg8MSzma23SMwAsMBQx7k/VOAI=;
        b=KaNjXXii4w1a9rmx9f8/k7giBofh6OXihv18O5SCLo+6uyYsfVlo3hHB0+bF+MgLsd
         S2eYqwxFQNjOYuPpt0cfpWIdjUHcSY6CGfnG4jpdBPJGv6p8KsXv2soXY5yFndMmP2CY
         V11BrsjiGQpXDSDd9mDJBQZg5xGD/BT35ZfDlqTaPHxS4QI/X9x+Vb/SV+KWoFZsAX9Y
         XZnXtS2Q4mgbFsaGzFXnaod6RwOdOCJ0vwiBCMkGgTRFJ3NFtz6ANPTQXrqe6XR0Gqqx
         9oSuSdtyBVzLCsrUWKA5WSSgB0A7O+y2ktCzgPixuCNbdbZP/RniDJCHuA4Ivf5DbYAt
         F7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259646; x=1779864446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1cHgHzHWAoKXE2eMaeg8MSzma23SMwAsMBQx7k/VOAI=;
        b=oG5s9exYK0BqtstU+L00A6dPAQLOwSn1Xd6krqbFjIWh2V+g839dCtL+mnkc+mnP32
         XppG24Q93n7I2JrM0XaUZrKOhDAWSFzTLYFHQDEO2EiRTKAHxciRG313z44gix/hHi3H
         XyKf12/XsHcguQLph2s029di0duMKi4T7Isnod67qYupHfyqdb6DklMkmNSl45Ax5nOC
         znUR/RkFPIjeJpe/JR7Onr0GW00Iu+VoJ1lDZiMf1Ir/o2idjbcxCAWKLnvu+eyNxIJZ
         y96CXA6kTAEWg7zC4VbojAsqkh8JTL52ubk86SRG46H3BlUIhG79OENT65st2vWxKQp5
         7Nig==
X-Forwarded-Encrypted: i=1; AFNElJ/D5Pn0zqeZedu1X/9GgcVhkUvWGiwe52TOnXwYGearIOLX28hTmkf3FP+Tg2PvKKsbpe6ZnxicLmDVdB57Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6as4EVIxx44AX9DI3AU+XeZt1VzKXbPdZv9VFQ5fMCWZYRzZc
	sg91+YfpBGYMyVVbaAr3/Nur51l1FwPN9ka24b2AeM8ADxBmLTql3I2I
X-Gm-Gg: Acq92OENrPBjHeTeo3B0C7o738Abj/xvNIRmEjKvrztnj940PMPvrCZj8O37TMUlzha
	x8N07fNWC9VTz/aaR4usXAgoeP1pfA18WjDuddpMfJvGeqVXvhD3vCDmOKsc2AjuKWMVYLSl128
	D/pixxEQPfGVGUx01i03Xf+UP/Zg8+1LoZC7B3Zy7aqIH43rsBObDMwNsJlrRYR4vvVUdbUaI/O
	OmiMaium6RwcK5j/T7S111O6mM4D9cIuFS+7kPUcC1IXhA8hb2lAtMHmmw9Lf2i50M6lnMJ5Xur
	SCRb0CPSgBXFwRpFsNn1UPUZIjy5L52u0cxF8N80pli52NrcumKpeI4EfnoznlWGP+Y4ijoo+wz
	Tn02wbUhSgzG2lxybFbRTGt6eo/lSlhIl/Bq0yuuRnwdqMA3JzlMRxOnKCGBVzEHde45RdqWzOa
	gZHCGZXNdGAQVuBOB7wHV+ogAZJi1lYYQPRPB/cw+JiZZ6mdIyuvti/YEnhs+0gSv8UdXRlK11F
	3+D
X-Received: by 2002:a17:90a:f10:b0:369:7944:d723 with SMTP id 98e67ed59e1d1-3697944defbmr7347179a91.4.1779259645871;
        Tue, 19 May 2026 23:47:25 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:47:25 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V16 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Wed, 20 May 2026 12:16:25 +0530
Message-ID: <20260520064630.1785283-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520064630.1785283-1-mkchauras@gmail.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
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
2.54.0

