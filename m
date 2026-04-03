Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA142248A5
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228025; cv=none; b=Y8CZX7ucUFrEB67bLjGdrvbs3EGYEMQ19Pu6LZbSZZxJ6062i750sZ/DJB8NtsbNJFx/bG8Mj9lVY2mIL7CrSZ5e266Cry1jz52Hi9wYjKJKzouu5aXGEEzfKWavqI079cjrIie3yMh3OeP7zz4JXRxjn2/rvbTFNeDiFigpJdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228025; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIXfYC4Wtv2G5eA42nZBMWilJCPmDBLQ7K+fmy9j20crwO2bNHrAf6QQXq0BtKB4/vpMTAPvqMaZA35rmcuEPGs0LuV44tYmVpynaEwoF9fF7A7SzKn6BeXmUrB5a+IPs9B33LZbfFgYWZT/0Tk6i4956Nrjozf9iwyv7kRCNXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q+Iy4yN1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+Iy4yN1"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so883658b3a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Apr 2026 07:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228022; x=1775832822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=q+Iy4yN17nA7Z90UqWxkrbrvCXUr0bZgVn0JykyfefcL+DijJlO1wrzBgjV+3MpzKb
         jASPIuwF7i+vExD0S1tRhCXxx4C3FJUbUhKxN2O30dY6PAVlRPY+0dOapR2VrhC8ZeK3
         XNBmLfW9JNEYrLZtcLxpMvVOHXY2e5aCptnd9qgIvKrY77hWeNMYA7l4NKarJHYa2lfz
         ym7FeoPTBhZW+GbtsOwxemvKZnZWRPB+nd6wNw50wTLFVgsWDOCQVxZplXz6IjjjPkLf
         TKjFpYZ2NCsh8vYfd+Sg/3NGcQVd2ubfgEZ7XpXSHEq7B521WOHg9ruWDLfghjoUiJLx
         UiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228022; x=1775832822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=LD5+jXvBgNToo51uQU6Mm1vzb2V/82zQ/03YB81CDamUOohWcBN+pR6E98LopI9vqE
         t5rMauyj38awxTVZdp/7z7yKywPJoUXxQtTdQ/n5kpmsppyPmee8N7FmcbEs9iBUMrnQ
         pl8STG0IYNGWqYRKBcbyYzhg/866695+rx91qMRqmuAq+inqbVxxwvVs4z1/fMWOSgP/
         I6O0Uj1YpqXeSXP1hTIp4/F6Wl2FLJGGgLva+9twOWy86zXdsjf+Dl9r2nZ0w4CaayIk
         xgYRM5ntYhPHLpCu1vb2yb9PtgyC0WbLoMxuWbtnW8kykitlUQ3WcnlT16yaWsYxNzp8
         Cz1g==
X-Forwarded-Encrypted: i=1; AJvYcCW0/rltUky+0pmVPJGVhpEyHnrDZZBhf57/JU82QDx4rBaeNf7FbgzijivKq2/5V+aEY7qUTElZ0lLZ4IdCHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGnvHcrkyoWPV8UEc8oAete2Zp78Ybs2zPhAI9zDqAoPIZyMnj
	9QRlVMnBW44WP+eh8GXWpgHRvuLIHy1NbVFZWYgR6DPq78cJK0RiUB29
X-Gm-Gg: ATEYQzzdINsJrm1wZz5OvbH9It1EPoQS2nXkZ4JRXBoUy3775dCi7r9HSRmg/HPfTiL
	hNFhlxULDESwV4tExDkMM4e9se0FOJGM/G0jzvwdLhoNyvZ8N7MNu4nN9ZOd9zHUvuvGf8h9LPn
	oPAnzPXSc37nmvCdYrTdmR77M0WaEby/1aSokRye59JpNnENxQ12VzRAqMCHZ/lQLbK2zvaufDz
	BfdBGwHbwx8t26eGqA6Yb87u4Fbq/B5KSVO6pVWL2mpl2m1fgWgsH97KM78chakFovzaUTXNSs7
	93UguCO1QcNOQdfAF2FZciZMPsbO3pIDTY+qrePazlEaLL2WtGLIpWR+BcVA7pKQqjyyFQG9Tql
	sotr+rWTQSOpH85kTv3Q+5vV31TwKhdXurLM1S865nlaSu8ylmlZ4Ko+H7i8GuwfrrJt/hwlC0T
	AIX66jhqh0s9tFSt99mm/rprpDAFM052jKLkyrG9XjErUvW+mj/Dxkxsw+OEowldci0LfLlyy/9
	Fc=
X-Received: by 2002:a05:6a00:414c:b0:82c:fe17:5af5 with SMTP id d2e1a72fcca58-82d0db96d9emr2983355b3a.44.1775228022326;
        Fri, 03 Apr 2026 07:53:42 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm6301682b3a.61.2026.04.03.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:53:41 -0700 (PDT)
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
Subject: [PATCH V8 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Fri,  3 Apr 2026 20:23:06 +0530
Message-ID: <20260403145308.1042622-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403145308.1042622-1-mkchauras@gmail.com>
References: <20260403145308.1042622-1-mkchauras@gmail.com>
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

