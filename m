Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87922E7160
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991766; cv=none; b=u3MtxnK0whourAaMwHkoGTuMJySEFlvPQLQ8acUnUndMAjF8UPn/CNXH0W2WWIqZySJgDllIHBXsTMCJpI3Tpy/EjZ80Rn5XX6WZtXc2k8jIH/Jm0EBvHfMvALVhxvAG7+647qnU5YY4EB4e7ZWnMzOH/iYQf62nUttdQnHQvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991766; c=relaxed/simple;
	bh=QmOCI5teNpDHuuf8TRkOoWYXJD3VbdMoeFZqR6rWQMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUNSAggWYr6tBqISJclc2SRVwyUz9iy4tGNgo/4Fy3bBqFpsm7laLDKdBLmfQFoUVnrjJ8nU8tnQSgn8dTy0tL7eAW4UXlbXfTUeJW65Thje67ugARZz8W8q4GwxDgAvx2DBayXq/UFXrmGVYS3lNe3z5AYCMMZUm8XTP1V0L1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Hhcqw0RL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Hhcqw0RL"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so4382112b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991764; x=1761596564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8lTWrnuaZtUDDzLxyuxBqYWe/ZHwy+gfZN7UuG+M9I=;
        b=Hhcqw0RLPoYbiwW1/EUxXxv2FFZCrZhfqR8YggRbda2lFvHvLz+6//J0XsR3+OWIxO
         Jc9h4BmqQMa+gKO3f+d7sJj5xc4Po0CbXXfweZZ3sl+zV6LsRw57KM92Da5Neh0QGTv9
         RbMY+FHVBBwjKLTWQ1lffD2UOccSc4EVyHZOfhOnQ/Wl17Ko/8AkQqGcc6SqM/QnN/EP
         McqEz2cx4CZRhp2XPjGC3OAiZvJ7do0W+OXrxthiqWq9eDkh61jz1XUsjbirWxkuzaQo
         /E+E9zavk5s6Wf56BzkOfLaZOBK/5Fc/Q2If2abc+cPj+WOqzuHl6Mouy6E5sqQOcB7a
         JAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991764; x=1761596564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8lTWrnuaZtUDDzLxyuxBqYWe/ZHwy+gfZN7UuG+M9I=;
        b=wklAsMJ+CDATJykxvQqlXw8jkT1NqNq9YKJ4hqStiCSVA8OW1DXHNQi68XsEhTiZBo
         C9fP9JdnHFKMM5u2A4Dwtbo27aJ1pZVUcE02CmS7sObXv/RbqXxTW+hyqLS2EtSIOVYR
         3NVsiBho0vqJD96To2ENPR129sohOYImxFRTuk2uGr8plsBx2HO3urxmvsnUHFR+/THj
         fAKVty8L5BUtSw21JJVLcSMTDKdf5f5ErF9LAA95KBm25wzVRuJJN68U3SbWUeA7l+IR
         M0NoLh2JSRAl5y6RY7lHmy1BNppd9y9mdbtMiBEskVt/SxdvQVFaut0Z0EAmtY6xXQuY
         GIfw==
X-Forwarded-Encrypted: i=1; AJvYcCXnUIBgwtBxMzcXuBPOU1oIt/Va/74+4dMhHnUFfpXbvol7Uo0gfxSRY+JeJE2iFr9qPWeCaMbwAtYaNswA3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzIXFAG6BSKEL9puhczrl+WBFmdiPNACRCv3RGeK//thuM7krT
	+N0eQdqaDDkuKlCrvFaYer250iWW48Z9FlevlEpYOe5chguhUbBdg6WQ4V26y5jZVSo=
X-Gm-Gg: ASbGncum30pw+kavL/713+MXX+6IDZfysB2z5Qkov/uu0qh1YGiS/R+uJjSrQ8F2Uqy
	rd5A5Ay7lysDMgKhzeKloXAVfSqVq1/e6BeAGeCk0Uyhn/vwjrMijQufLTuNBRmfGfk/URHSWLU
	TkTT3JPt7jfvIb8XXR2smG3EFnjdiVAdZsCl4KvQ8IBL5VoANatUh6tB+S/Mjt52YBqF6ZtZx8X
	N4Kqsyputn0bKgTONxLeZ3HwWAkjnp3htXE58XEyGNqfLBfbivuQgv+yjnBKHom56n/z/Zv5J9i
	sQGBrvHGvMsI8QTOe55rK8czDdhTgc+wpnfwNLU+KNymkRb6hNRnJ0QAg/GvAGwK2Jfv1xlbWR1
	DsdFslYgI/8EVw/HoWk3Jr1+9pUiX0SMeG4xB+sREuSWuIqUVs6uika+v1qeP09w8VNyZK9dHE6
	fQatdwYsb+WV93kCfR3F5R
X-Google-Smtp-Source: AGHT+IFYCNd5k3pGg0Gz/iIE7tYiAa0kkuCVaIcl8Ah/rVJcGwXUTlIvT7nX8rovlHoPNgWT7bMyjQ==
X-Received: by 2002:a05:6a20:1592:b0:32d:a91a:74d8 with SMTP id adf61e73a8af0-334a854654fmr19468716637.27.1760991763968;
        Mon, 20 Oct 2025 13:22:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:32 -0700
Subject: [PATCH v22 03/28] riscv: zicfiss / zicfilp enumeration
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-3-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

This patch adds support for detecting zicfiss and zicfilp. zicfiss and
zicfilp stands for unprivleged integer spec extension for shadow stack
and branch tracking on indirect branches, respectively.

This patch looks for zicfiss and zicfilp in device tree and accordinlgy
lights up bit in cpu feature bitmap. Furthermore this patch adds detection
utility functions to return whether shadow stack or landing pads are
supported by cpu.

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 12 ++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/kernel/cpufeature.c      | 22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index fbd0e4306c93..481f483ebf15 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -150,4 +150,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS));
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a..7c4619a6d70d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,8 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZICFILP		100
+#define RISCV_ISA_EXT_ZICFISS		101
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 67b59699357d..5a1a194e1180 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,6 +274,24 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -461,6 +479,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
+					  riscv_cfilp_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,
+					  riscv_cfiss_validate),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

-- 
2.45.0

