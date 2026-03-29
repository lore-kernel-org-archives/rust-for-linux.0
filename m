Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDF437D12A
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 16:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800205; cv=none; b=szYCKV+LbtnnJn97DAv18Y5gWk/UoAjMeEHfZP/H6Uv5AL4iN+D/wljob1X43ZT6Y6LwgwItsOsLxoV9Or9Mp/lYQSqSJH3odtHm+qLe7MLxXsSiP9tYNnogQUPruFNh6qIUlOiH2dQW5YPQoEqVio5xWf0m5QJaU2cVhkJ4wzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800205; c=relaxed/simple;
	bh=63ZYZ44YU4LogYL8Tr91C4w7OlzNcXn3CNTZsrHwj9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SEQ8GuPSjW6VyNO1VEk0QF94YAcsga7X4WNaM0edjpaHLvuRXecfcaU1eUqA05IiHkskTS9AA0cmPnzGy+Di8M2fchela/zQq1UdKwizwoLoGOiwneTf32/FpyogGRtjl7j7IYZ5YWC1qOMZ8NujLE7mBPnYT4NFzp7cNNdOEek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWgXT74D; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWgXT74D"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad9f316d68so16331865ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800204; x=1775405004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=VWgXT74DkMi680cmziTIekz5gZy6yS72oZpg12R3bjP4a4dA8kBgARGEvMYS5JYlQ/
         4Jux5ctmI2ZweWVdjA//ITucTw6JLI0h28Q/sOh9BWldvDW8noYRB6+01/LvLr2V+HOM
         hBninkI4xwnN9Ahkk3BCGY8i18gSwPJPN3eARrtrbclnB/dr4k/WSZW8QXU/A5JYs3iP
         VfdOXYV2cxEgyyFStM0hB09eeBtHrj+FSVcbMwb76A5tSi1rzrtAeChirWtuH1D0LRvx
         4e5BI0pVkjGIIDKSQh4m/KFIEE9HdQ9KnRwfpg+26XwvdB0tJIKQyUyyqFjdJ5DzxSpS
         fz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800204; x=1775405004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWQDA/EkiuOrnzzQZpTgk67yZSDsyGvnGU0WBzxGHSc=;
        b=PyWbmowLVS7OP/PRR2WhyISnCfeLFxb6AVs7Lj7MmL8vxUbmcVeU0fHgoVeFhr9k4Y
         VX1LKL6bAlsJCSZHOcmAmFJBt6Yp8Rc2EZZmdftC4PEAUpGgiIBbHXRS5cuATQclH2EW
         K4yEqrCpuBGHS3V8p6GDoqBlWo1IJjoF90fEk1a4+gc+aIIHpdvcdMOSERkso6F7ws6I
         mzD0ULf3EnIU9ajr2G/LcHXPalFRgbmpGlxff/mUoUTuTg24/mM28I+HqiwR1oObaapE
         zP82auXg4Y5ekoXs195HIXqyBavHqjLTPA12qkNQEOGXtJ54Fnlax2Yf+ltR0MVvmL6F
         +flw==
X-Forwarded-Encrypted: i=1; AJvYcCXE01gQGAtehGHp12yHtzNRCxEZHs8e7uvzcrJ+4gaNcMFGqj3sxw2n95naxpUHGUk5GFoMPY3/CW0HphhCdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YywMcBYHLAcn6/Fb2NrVCxekeUF3SBd9KvKoLbrGzI7y+rGu99I
	hbGU9bAenr9uMd1PqSFHAeL79yXJP8N2HL7+zsemut4kLjNkZmcLTM0x
X-Gm-Gg: ATEYQzxyRKsCbJeToDFLxGtr/75Ti7kzrCFue4WaTitnQsQDCctL11T/Rc9Qm8344HQ
	UQ60RXONr9AwCjpqQeGtBl94QBasZeeZaDPniu3Qe7AIYptKJkAmYVrFTY+pKEsYKLTmjzcr7On
	iuU7JM8D4VNxa26yImBUyIPUnN0tz3CUBtry8YuB3t3rlWWwzBnvDnZ7SEnNt/dUfipRuflpubG
	Nr1fstU0+9QMaR9Ov0lrEWq6ZfJWi8IANsRKNPUhQ5ELsgjn4GBMrC65lPoeDVliGUuRPrxwTp5
	wfjc6RN1nsR3KNJB5FbDN1TyqPHpSkzn2CZC4CyBPXqRWkhS/Gwqc3TIbxtjLpFVcKoJrl4jror
	eWDCz34EgIYl+1Px9mHvSl4oP/TNOJNDHbKrYqHgn+o5it+Ox0xn5xjQOtkgelXlBt98P+p6pj4
	TENqvqFXi5lk6xZ/j81MUn7SSoOOiH0q5r47tcUC5kqJl6ltTKvLN+8wdnJIsQTS/TRaetSCax2
	Oc=
X-Received: by 2002:a17:902:da91:b0:2b0:9101:1b77 with SMTP id d9443c01a7336-2b0cdc4389cmr105487125ad.17.1774800204027;
        Sun, 29 Mar 2026 09:03:24 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c176fsm52521175ad.77.2026.03.29.09.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:03:23 -0700 (PDT)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V7 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Sun, 29 Mar 2026 21:32:52 +0530
Message-ID: <20260329160254.2592207-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329160254.2592207-1-mkchauras@gmail.com>
References: <20260329160254.2592207-1-mkchauras@gmail.com>
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

