Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92EC3FC5BE
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499154; cv=none; b=oEZEP5fkQsTemZ316nLiySlB6aWbJwIxZV++Kp7MfShlPbTq0Za2mTu3B5lSnRIQOvOioO4sovI7smnijgnVNGcbvLSUxZejnx++K3c43FwC0ZFKF3+O5HEzZ6n6E+MtDFXl3OSuiJGoWrWoFFbah39/d3e0BorUjSQTeYqSbvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499154; c=relaxed/simple;
	bh=jsGopDHOfXXkIl6WT5aY2aPVGfW1NHdrHUQMy1rh4mU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=esP6r5EWnx5AXkLSZ/0NUMhuDUbomVUZ8uKbpmyQXMHi2hDoiJJspbQOApVkQmGPjLDEzBirrgO96BsKDO+6c8ueSPkSlZftPmL433d3I7BdtGgCPf0zzzUl15010YWXVf+fMlo/PlPDd929BdxwFQxfdW5PUH1h/mstPZtJDe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hRFtGt0U; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hRFtGt0U"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso268224a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499148; x=1784103948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IU8cHdVeDTqUeczB1eq13oLH6Kg182LaK9ECFYg1DHk=;
        b=hRFtGt0URm7InsYy5UpHnSWEEAMsX2zmnwMJMcgyNUy12UNXwuCcebFSoVlSOcnPju
         CwCKR6MHdi7K1Mvfd9KjRjiMvIWW+hPuEbT83+pNRgcWED0XhRxZ4prXdwIafUGyBaWp
         KjlzoenuFBXE6cANAN+M2uh4apFfS/JbnSWcpxUzhwS5eCJD73o/doKi/957uAXN9eKl
         wSS4Xu+Dlbo1YqggZmMPyKEy6f3NZxNTiNWFalY2HMBTL9Ivu9+19c9hpYg8azQK5JVw
         /1e8rNcOMzZSvG0X8lEIJtPBf8SnQiw/cdctiRuoHcrPbmE5JcHLVssjAm22J7WaoyS2
         TtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499148; x=1784103948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IU8cHdVeDTqUeczB1eq13oLH6Kg182LaK9ECFYg1DHk=;
        b=PwOgFoJYUP6cAiiD0WjX19btgkjo/tdn1KKKcbsfTGK245sFVCNYAh0qdk59wmD/vQ
         2+UOxQajGiE988k4km0kKZTLVkjFXMZsfRRsLBoCa+YIKrCCy7BiPTn4z+GEIx5SAzcI
         C8+vTfp4Smm6xX8oYkb2yTz4oEBHHoAZgmMG064iL78iFhd/m4Q908r2cK4h0E3rQoWA
         J/zUQ27Hed9jpBA8Cos8hk+Ek9jLWcNHSQl+shrA56kwWNljF76GHHXJlEte6JyfyIr8
         FC27swH+vGinpGqenqLJ42CLaeHc9NDgaMELfMB5kTy6Pqsp42UiugMonUC3e8d/NUe/
         ULEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqr50iKV6IR7A7hh+pcVBUdtwrBE2Ox7C64fpR4i+WNFsrjE4gycuyI81iB/ojB1Fqmy3jTBMGIxMt2MVEyOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuIG/e45OLHuXcEgqB2GecGsEZKSQe3iyHUDv9/M1rc3DSKxYu
	PVj6ZvFKn6e3LJArHE63yx8dWO2QVVD0FmVKojgFgwRHemUSWcfdoKf1
X-Gm-Gg: AfdE7cmOyt5qmNorUmHJm8sVMnvc60TZpxQTeVL482qSr4bRbCbZniz2bbdRE6N59sO
	L9gLNb+ZduZmkx5US4fMcQMESCeBQ94yRzDnIYxYA6sDQX2R4kNoMN2Rzsc4CxFEsF5n3E6hs9N
	XG3EJOl4bbWZz+N9UerJKGQG/X+ezqJv5G6kXB4cnrR7w/2L4QwhLbndo75uQuVZpfB1JuGzZEf
	yIa0rnJ8vO8Ik2pXlyAaspGgFZzTV0awURJafGyXnXp4esgYEuMwZNiNhMCqwkJbib3KbQdkPWM
	tFuIWoFlj+XGws3hPQ2XR2gPCnncBeRgVTrRfNG7qbiiUJcPc+15lcwHUvoYxdes+UrwpUqYsFB
	OF1BA0NIITKHoc6BpvxgP/ao2tNLsVIlMiwWPPQpRuNzrtBWJddSEQ8Z7jrg1J41lCTnxEO7Uu5
	7oz3U2yR8uWx6nlsp4b0qvqCESdUcgspPEE+t1iFKEL5Z+wS78baelRCWbLF/j5TUUDon300Ei+
	cGW
X-Received: by 2002:a05:6a20:4308:b0:3c0:9c19:65c3 with SMTP id adf61e73a8af0-3c0bcd26715mr1623869637.75.1783499147997;
        Wed, 08 Jul 2026 01:25:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:47 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Wed,  8 Jul 2026 13:54:50 +0530
Message-ID: <20260708082454.1254320-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
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
2.55.0

