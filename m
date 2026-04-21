Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCF38F635
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773430; cv=none; b=IDb02S5GpLP58S79ZKOAVkKRzqADW8LjqDqhDi+K7Yt/1fEdZ6eX4x3Zw4GOYrLVF8LL9DBqUxDfeDrZmOJyEsVGExM0tYvlCPusczdWKbONEv22UVtGAdkXHgzeARz9h8Cm6Rrv0xHVbOu6FO28rPje2l1JY5eiK1fCGIO5dIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773430; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mscngJ+UjRmfFMQ3TSu13Rnsla6wIgWO9iuoFZ9kLYN5Jy0AW4Yc2mZDqhJuWJ5qvPUXOGKBu8dxFLZfYU3W9AmdWhfbdL5VD/GybK2H6GqfFkvvkTCcfrB192mDZF72vBPUJy7PLccLtvRqlMRYdaja+oD6S9c6i9jk/pkOFHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFdupLIW; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFdupLIW"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c795a47186bso1630081a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773429; x=1777378229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=JFdupLIW16gJN+Qgle5y0+KM68yGwV2Rlvra7AiqdZ+xX6oHFM1F1z5WmSK3qG1uzR
         ZVHoClhQb5r9JqzllgTMFG7um1B75wHp4ZBO8o/xz0XTzobte5NuFIbhUeZ+A65R9tBC
         2/q8pVRvVwNPGpaTMmoedaJ796xaGQNBE1aTsevpiEs9Pc9meZmC5Afrd2/bSN1Go65V
         K+VvkbtHJJNrwiOMb80n/bdveCnyi8b5vDkeLfyBXN6njyyE/zF1NFC6sI4hGynsY6Yp
         /F7lXmGlELPGAdasLZlKe9iu+gg9IWuoqAP8pu4nWF5bpEQOpK4mYGy4mPHnqKnRgka3
         F7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773429; x=1777378229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=Egqjawu9pspOH1atkX5UoHMbc2uEKqteEuoqiAt8Pb4g1vICdqD6R2wfGCa4thHjjK
         7oeGB5vfSP6GHtX6TSzHh2CgdXESITCI4SLaVBhidZ6ZHf/6zqyKx5Ob/zLo9Npsat2i
         4k0QGC1FWcxLU/K1P8KgKbD8rnJyJ8MJnVCm6ZE07tcGjLD3KuC4S9CjSurJfJKvpheP
         ozZBMswQCYn2eZITy1CZBHr0khTBHWaAg+GXSHZ1maD19POd3IIniz5QFOdoGq96F8tt
         VyvesBvPglM41NWuMhML6/0lexfPefBqrERcU+B8NLwZGriVbdifDdktsZV94TtOGro7
         sdvw==
X-Forwarded-Encrypted: i=1; AFNElJ97JwWVtKBruqVfHsu4QswTMGc+gx8M4u2QXemP3HrAPKgdI6FWDYadIT6qzGB0ow0F244LH0Hh/B6fSZPWzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXX09Ml1QMCM8CNutrbSNTnBcpoQVlMSfY0cVaKkZutToFwBZZ
	I81026MyqfiamhGwdw2mqdGyioOtTwhR+FQjdYdp5CHTk/MCDp865xOa
X-Gm-Gg: AeBDiet7sJRtufGraz0AyCiCIkN3WkiPqM3b+a5fAcfEZX4mIwugCVcCm/3/y+UXdLt
	Ns6uUARgVsoKlgIFCaET4I3wUNEVUntvuszFKW7lN3DqYp5om3L/Ia0VhBPIUvTM+dwM7REl3Ku
	M7eC08kP6lM2uwQUKB60Sg62p1rQqCv9VjTvwOuNhVQ5km6+1yje1X8HpR/wD7Qif6W3NVMFnT9
	AaSAZL2SyfGecpvH1Xz3aJ0v2B5rdIHX5o4TkQ0Xdoec7ZqjueMN/fyXJD+oP0a3wRRhOrBOMM6
	691FY7/LBtGmuoSwPuLPmA0P8e77zU4VkQlqCGYJS4p2oM9funH/kUVqPxU5vYTdyy3Nh/nLryI
	+5uVmjAR9V1XgwLcYZjwe6X/LMgb5OzULTWr8UIaMj97nSDpcC7FAs+GEMoi0+9pPCoFIeV24+P
	KfV2zPkp5oTWPEChlPk1tA9NmQ1qETV7Oyjt+Xfjtp2gipRYcSBJ59mto0RQ/ijEpOAyFe5PxAw
	XcE1JqdeBZWeGHpS54yaYSoIw==
X-Received: by 2002:a05:6a20:6a10:b0:3a2:edff:296b with SMTP id adf61e73a8af0-3a2edff3a32mr1965327637.21.1776773428601;
        Tue, 21 Apr 2026 05:10:28 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm10045274a12.16.2026.04.21.05.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:10:27 -0700 (PDT)
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
Subject: [PATCH V12 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Tue, 21 Apr 2026 17:39:56 +0530
Message-ID: <20260421120958.190430-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421120958.190430-1-mkchauras@gmail.com>
References: <20260421120958.190430-1-mkchauras@gmail.com>
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

