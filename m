Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E7334403F
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009712; cv=none; b=d92QN699BGvGfPYyIEzD2wAcY/aoxZgzqtAjMTvqnQMKjmEzazvv0dfBJ3nMqHtISx8Qy11IoWRZcDUv/lWhZhRfBC80PM/1L1Ns+ywHUxS2fxV+IU8AbWDIias2234rWDgCl69QY7i58VpKJX8128DCBs5G7pZHbcVKj5AapkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009712; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KAwupe1npLMUu2W9vQV6MVv8qRp2kMm8QYSy2wyiu/3wwamGVoe+riai0/wy24PAH+CfJH6o/eF6GaVEJGWa0dTyclsQosyjGzqL+Cj4565QZdM59rCcDDXJ6Fv9oCan0F5p/IBrOhTLxong97vhAQ6TAS93fMMPf5G6C09AdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kgq/AAuJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kgq/AAuJ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2b788a98557so28454405ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 22:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009710; x=1777614510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=Kgq/AAuJfwXlMN6AnV68dG0YgWDXy/sx8PcSL0lMnGSevlqyBG9D1pc4jgzsr3iQMk
         pX58MCHcEROMSVmWLsUrUOi1e3UOL60X2LgVoKji2jSZtgIimE42NXR8IbucUvDIjANQ
         uvf4DxTjWhB/i0RVytg3e/oC49XowL60MpYaN/4chh7b1/E9Qp4mL1Z5NvuKibHiDKCW
         /kRvQfuZxxMmct1N9CtBr8DbfpxhWFbZ+vQLNEppoAlMiLkRdB0tfXyfBLbetr5slSZV
         IlKWCSqNzYbxApCiIp4PyM/bky3+Ngs1xLqdu7GBJjg3Dby2BL0v109qlwa/K4E6kPRb
         fpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009710; x=1777614510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=tAmtIaoG4t7QcaC7hatAiepwIL5atcZpSJ+aOlNwbg2dzm7lALea0nzV/QAyeF3tGF
         OPFLnxfe3v+pjhfr0k2GrIo8k0xKfoYJ665H0DTEs4K0qx5E633c6mVOLPqO6W7wISev
         KoFgH7nMV2y7yq25cHsl90SUs1tZv8rOxKRkomp38wq8G2jpJ+HhT8uVtDPA3/gAfyqf
         DHunnIIbnN670IR948uFiRXJ8I7TW2SSk8vMFH8C1ZL/Jffmxk+hSPBTndkSr0XOohfl
         FiZ2Nrqr53XhLT3EI9OJKlkgue91gAArA2CW+eVzj+7Oeg/rMwUQ/a6pBRwEQNHHwrU2
         +Bhg==
X-Forwarded-Encrypted: i=1; AFNElJ/zyQRhWqe+VCjvX0gXp05qEx91iY79+6mG9P9wUFhAwW9A2IGVCMf0y7zZ+768EIILNU7bPvW7d5L2GO8GzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrlJ9WHeybUBUCuA+5FILY9nOfXmVxhkC5equHIak98D8ASNv8
	QNJw0SlRbCX2Diyh5MVFocaVR16qvWKoRNzw3uPweN5GndMtB2UgB9BA
X-Gm-Gg: AeBDieue4BftXU2aQAxGffQ6bYcCYFwa6H8ZnANAwZ7/2vu2YL86RPty1IupHOMBdnu
	yFSG629QcOBAB8XDvPH5q5bO7WHPwHdA0pqUlH7rm873w6A4lMJ7Fa+d/EtdB9hVji2StllXwwX
	HD8yAIBNe6pqqh7qTy6MBBzJGk24AjnHnwFwUb+6cmq3Rg7l95dadWWBoYkjuLUcU8n5ywnlxcy
	sWMDc7HEN8Ia3cgHvyRb1sPP2lgy0rpNbMcycnXxv+tuDmew0RV8CbPB0FGlEDt/2hvG8H5x08/
	v//tSwe40xa0mUysscj2AQLTAzEMaCdrznmnHY8xDYhFl6OA77tK0SfCgfzahrR9bts6u94kzcn
	gzlkv3SKDVEt68CrNNZRl+NFOtxg4HZiZK0OKnxG1oNp97WYxlXPHq1gu1aLhjjvsYby26hmWO/
	Sc6eBJuomeyXT1jdxCLo3iGc+se6MSaMJxMXlBY2/ViJZXlMJ4KPs/GS7y+Vcw6X51Fm8Ik8HlO
	+Z8xUyQ9yv3hmg=
X-Received: by 2002:a17:903:1a88:b0:2b2:5ec6:dcf6 with SMTP id d9443c01a7336-2b5f9e85f20mr310774475ad.8.1777009710516;
        Thu, 23 Apr 2026 22:48:30 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:30 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Fri, 24 Apr 2026 11:17:38 +0530
Message-ID: <20260424054742.45832-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
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

