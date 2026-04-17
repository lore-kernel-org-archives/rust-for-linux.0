Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C843101D4
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439428; cv=none; b=ISeEPXqvAJhvQ+fP8kMuJ+vhNu4OL8/VYX8w8eX4VeYZTGGsNZB3LS3QQGVXAbjmCHamqOP+KpitgtO8kzREeV4JKR7gzSswUbdI7cZDRXNnpEkUJlCMWOavcQN9lbwnGpiO56l82gYmhRZIYnp/Svj609lKgq/RNMWyumeY3NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439428; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a55JSvlAx3MjAAMqIYfnMEDjXm2dRtAESy3R227n7xwv+E+NKg3RKWvGlyDELbvunplES/g3iCseTIsfgdcD4Nq3uCU2KboTUUBPVsrMkXHOdX3TkIccv0KNLUtiGKswNsRF7cxt/p5fvmz+loH4a5+Q9d7BuQKpl91gclaM6rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TbZaUz6H; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TbZaUz6H"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c6e2355739dso319124a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776439425; x=1777044225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=TbZaUz6H3O0m1xGl8hvdU7eggKnjETDRAEDLN00BZJUQhNLHWTFzuGEQxUOBPJR+iy
         8ql+hs9AbQ/6YIgQbRmsvxHc+p+1onywT+nXUJCsPPxRxPlip9lbBc/RhlG1GhVYyW20
         8UDkgiVI7FZMkc59JnZHRqGJe8krinhFVGh881gzh7Ag9sMH+iidJz/7NZXe5JGrvjmv
         ItkvZvtBFTpkURuozeiSR5UV2tzJBg08Af8+B422FJscFZD3I5HCo+cOUpQtDxZG+m+A
         923sGzYe6wVlCVOlL9ycg2AcUj8uJPCupYDPRlK4c4Mn0icCPsvPL8eA/zGNPRAVFTnX
         OtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439425; x=1777044225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=VhvRzSNsDqS174/YKV/OQq36Vdg/+vXS7XPlog/HBle/ydt5o3gXJ6nEaoGvTy81lq
         Lo7AYhIrd49OEQ1Y0KVyK5jL21MCEXZSrCg9svXqsKPjojXFasvcznYTwFLF0GT5tRTi
         ZJjBVf9+uWXxMVKP7SfI7vIhVcA/fSTjGL9USZXmnp5rLolnf7UrERm7mgb+3p/hoA8b
         uOaCD5F5qkNkzFY/n9YMqhbtdrPIWCilHKl5H24ahBpzeZ+IHckVXfACs6uh/cfSNmX4
         /dCLRCGbqxjA6dKZxlxL+/cnOIUcQ+g9fwFiYlBnbi1I94nhcp3j8TndW3dkoXOZLmEn
         u0Rw==
X-Forwarded-Encrypted: i=1; AFNElJ+qtSXUjiocNsRvP4IiaKEFEa7sXDvwYpSVTF+YRnmn2TH1o/LN+tDQH3DJzmOwAD7W0BL/lx4LsKWj3jHTnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU14Oj35oVxJOjYE0cLoXg6txVs0fvuiVb5PcNsG0YX25kGWEg
	JeF0GKKWvD0war6HtYWnU6piEaiWI2xzecKNZNNWhAG82+9Yrpd0zm0L
X-Gm-Gg: AeBDies1vEGgS8ebqJyTnR0+3s169ekjuu6Ake4gp0O8MEFcXUMxCMMr4boiUeBExhm
	/mfIxnEuelgheYPe8H3wNT0FGUpdo8pxoZ9wpQND5FWgLurv98CpaHiOO5NQk7PI4/Xvay7wrPp
	d1ZEXzWBNNpQB5AUFQ7SWkthWioymh6YTwMMhwisuHJX24q+ZhgseanithABP2ALWHvni2qo4ji
	YKnu/zou+ele8weBW6HSpLuDSxb4z4Gl7onx9ZfPkbXRfREUwpVUUPzguez+04LiMubiXpwSegh
	R/I6HR9vXkQQWTQq3CDEZpvR3RJnnATHmj5KXSf+23G2frk2DooSH8D8DPScT1GtlUQtoo+Yhp+
	TMguIGfS9+rIEhE6eWz+HQuUi7ISxyirY42jlMxY5PKsGZ9aQPrhvUcXv14dVn1MaAbixd8VBtd
	meo+ELMtc4CgyZ3XpcvbfCpu5beR0WktJLenZHqpI25Y8y/IcvgyKiDt4KWOV6M7gsTZu7gfhKQ
	Lorg+1Ck/CUr90=
X-Received: by 2002:a05:6a20:7491:b0:398:ac0d:9a06 with SMTP id adf61e73a8af0-3a08d933c68mr3614755637.55.1776439425364;
        Fri, 17 Apr 2026 08:23:45 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm2384373b3a.31.2026.04.17.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:23:45 -0700 (PDT)
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
Subject: [PATCH V11 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Fri, 17 Apr 2026 20:52:51 +0530
Message-ID: <20260417152253.2312961-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417152253.2312961-1-mkchauras@gmail.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
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

