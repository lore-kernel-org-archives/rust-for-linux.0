Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C217A26B75B
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201235; cv=none; b=aUw2EeKiDYF8O19gAlCHhDhvI93FuJnUr2tb3KbzXOluIOznqmqaZVowfHU1IdmhVvX7PvvAp3shd96Yh7UCGotI/7A/MUTYvPq6JWjyyD2tqm7h/CxRAuV2Jf54SRxv6KW5lx/Om1eNR3rdOlnTR+4CDm7XN/QaQ1EvRgU9ODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201235; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oh/v19NcQgAgJ2xrIDBqd6iZnY4Qr3Ve8qCUXc3dXfOTicm7N3H4DJxKqTQR5/MDwWFoIQwAkaLSJ2GNseAU4BseNYfvAbd0i9MSd1cXuKMW0sIIf6slYmg1PkfWiBm6tELSSKNXkQO5AcCH4ZwzjCvUm2OL5p0VWeRDaTQZpCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XErL/rho; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XErL/rho"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b788a98557so41958615ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 04:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201234; x=1777806034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=XErL/rhoiBsmos8EAmjKoNF/0O0H+55vZelUXDZP8fPPNiyvVHXkkws6qi580GrMPs
         70EZ/SxffCw8E5yr3dS7U6K4oNAPBMkyRaYydBs6rbq0ZHBcoSCM+IHn3QOnuZWf6aTX
         pF0lk6U138LWOzjuv09qvlIzWi7b87XB8dL6fyiyRpTMj89rOzbYJOsdzdhdxyDzKfHE
         xNv4bV4STMqFrKfTBfBy2E1rmVWXPQ5pJWwbQ1vf48t2TeOMBWr/0RTx7jSJR5M9+HWW
         59fAB2O75YKWTZHE4thY082FqPkVkHW601H743PbXGqygQFAZVWJeCybKh+WuuauLK2v
         gYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201234; x=1777806034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=n1ncE9BVPHvuH9FyUDIN0LPqAUvPZp7xnxypM8h5KH0DdB7ub7InzD/+mtjzliab8l
         mHaz0nBvdArQqo+w4xUdYyug9B9IR80951cfj+Me9hzavI9sFITBSyMYd5loD5YGIO6Z
         Ni1jWyxGflOTj0gnKtuEY9FJdxY/Ir/BbMVoeBXqPXwJmCJ0SHxlcjA8PC6xEjlYMVpc
         Mez6ZOXYhM599J+NeNZxqL+MaIM/G4MPEKZFAwkMO0W3ksw2FlpAUz1V+jIc9rUT6KNB
         QBKTUlkvyEisywxXWPR6I2ObbmUFtejMjv+aPMXlUdoB0n0Cxb4fwKBPhJwy80RqLPw1
         bvCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aNwD5Y3+YAbfX7ChkioA1MrpnHCA/jYK7Wchlsa5kTo3P6mHYFo/k2ldX48IvUSSqlNWSGavmBhVEAVpn1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ZWGMlifeecDWCzGIlpd3sxFIeaQCh+vVDnIDWCRbrfetofkw
	9Ke9Ti08tazWzHPbApCjNqx7yaVJyToI6oNy3RzyVJGnqEeCmrQvmw+H
X-Gm-Gg: AeBDiesNxAbQObwr3JJAqnPN4dW+hkaLG3Hub5blbz10U4ok1YpI14rsEQXFGTpZAzW
	6DSTDjqww9g9wG3BGbY6o6T4r/fsRu+VpcwM6Oa3L4Hw9zkj27+CfOIfxFyszq5OvKU9Ggju7fB
	up3taEhe0rZnCP4zL8qn4huMQuk8ZQUjoQ+c3a16cYdx4wX8V51RMZ8T+1FL1yl8OPaFhM35vFr
	wrCUMMIEEHP1pKpCZEI8XcEpayWza4FiEiZqeGHkC3IcCI9EaYbQG47I4jfRB783R70HMKgV24h
	margDOo8nlXADe9Tz0RcTlmLZrWpRI4aKKlw5M5cz+EPjhFOrMFjwy9pgXe5MLpcrw8e61Tqp7J
	QT95kAZUGVo8JE0Dm/TGL0ascbYL04FZOc2WXHeb9SWKXffGcZylAFGSGrZAof6DpZwQ69w64lv
	J4Q91HyP/Vkh27lfEqbjO621NKXcN9Pt4O8xqa0Y51MIOih9sZ39ZXpCNmWdd793O6KiX5NDsiE
	usnAiXoqnyIlesYQG5p54zeVQ==
X-Received: by 2002:a17:902:8649:b0:2b4:65ab:57cd with SMTP id d9443c01a7336-2b5f9fbdd39mr296814685ad.36.1777201228981;
        Sun, 26 Apr 2026 04:00:28 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:00:26 -0700 (PDT)
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
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V15 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Sun, 26 Apr 2026 16:29:28 +0530
Message-ID: <20260426105932.2270364-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
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

