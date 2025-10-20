Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34662EA177
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 20:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993625; cv=none; b=uuWbAfD0/Pa5+GQm37Fp0M14lQ2m7X7AfnQz1u/YDpyr//jcU7mKBMZZuzrifwuS+HMYkEhgDNk7t5C6QLzSBb+AXTrWhhCdPr7kXZFV84cPLMJpMZA9THMMVueJ+T2B/WVnw7ZIAemT9EYceIT30gCw+gpC2ROLROrdepSEtD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993625; c=relaxed/simple;
	bh=deI8AoZPctoPZRL1uqTvQmr6gi6xgPskQ2JbS5WJlvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mtmHygZ9NmvuUmYmUivZlfvKFHEuvd3S120fhtGRtYiumDaKJK3/850GrQ4bMUNIFnVuJrtX0LHSXv9bc2WwnuZlMIz3+jUnjN4zxCqHRFxw9s6Id+3ty5a+gQwxFjOKouGed94luXX1+n2OMT3ybdHu2FkSrDBXrhWa1CWdUn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Nl6uRA3d; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Nl6uRA3d"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-782e93932ffso4105097b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993621; x=1761598421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njWxpRWfJB7aZ6YZP/EJ8dyU7DPEUOfUxx+ytpaopVc=;
        b=Nl6uRA3dneHuFsYyY38HX5Kpgs9vGP3agTT9rVbqtm5UuYJzmQp27ylQ4XmFzPvqy7
         3jmpfmxLgWjJIxYgMFe9v5fawL+Qtbk3LtGyxWZGghyyweFPlIH/XJrtaLk5i8DByqT7
         2FN9XZ2d1zrSgohPVOT+3cC939eR+03/pb4zLpBQ2DEKdpogTz8so8oa1vb7wKgaPR+A
         e9cMWcB06DafZkYKTEagk8+RnZRzEldHikRLIFuoze3tswDZSh+74+V9yl0bMjsytFA8
         QHYHB76kMadaGQjor0OaSlqEAq0Flu6xNiYw+nAYOl506/L6PZ7wPnrBT/6fL8B1Hi8S
         XxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993621; x=1761598421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njWxpRWfJB7aZ6YZP/EJ8dyU7DPEUOfUxx+ytpaopVc=;
        b=v25hvrjaIx2p///Rb8lKBLs7XxQ0W+ihd/JL2oJ/QBjy5u/Lk5JDsNFpM4L4+9Beoc
         jqR9g1b/GKPb8UX/ZSMiOlFbss++oi758L0XQFJTAwqQpSjCmZEN8wzbfvV+iKupuvMA
         zZl2XA4ry8iAjzkZSNv3WYDtkJEAMjwojpUJ83H/UBP8BXmiizizG0wV8L62o46eQIHI
         TN7rkmWi48iQwgCvaFaD/MWaJruiXsFyJ3dED4h46+htE9EijR6wCBgbnO1HZ45jcf8L
         at5y15FjX3EbEGCat9kpz/Z0RcPjlqyWPe2z1PJv5Mg3clfTY/aFGkJRAYO/o7q4ym79
         Soxg==
X-Forwarded-Encrypted: i=1; AJvYcCXEV1apSbfE/SIu/qX2rK8+SZqHn+jQ1mFrQB09cwNh91qjUfcYJAYmHW8D0XHrrw4IskrwZLm9sMRFKgjGEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcYCcGBbmA1O7GD/yNPqgQPi6nzenv1VM/IH7P/605hQQsSEhY
	zeTBelo0h8O/Q3+yqNAyFsNBof4epyGhIfhlQ/6JuTmg6hQ7tp1lLx4WNKlW3kg+3mE=
X-Gm-Gg: ASbGncsnEnpXRn+4G+SzgyKZn3UhWyIN4NUbmPyoe4A9iak4Nsi9jurpiOOqZjeWtZf
	25nZUKo1o4R6DE9R57KbgcE4F0q9+eVrqWSg0gM8gy1dNZsDnhXnvhTP+RtiRP9ojlOuAOOBZGD
	RxfOLJgcyvo0XI0vOwTa0XzEVeBG84KII9EJCZNKhIXkMFyF1D/icldbCb3kTPohgA5kqTY6NVi
	FbGneE07jPr1yQUMFCuSIItmWfPccLsSFxbf4CdJmtyibKt/Lp0Y1ikkGo/98W+cB6peNbCThVt
	OE5aJTy21a5xcKkEFHpcqpbGJ2nU9w2fBhOCnzekL8s/QVWEEp+7PivgdZ6S49CugpMBnShJoXe
	WAIgRTrmL+1ub124EzwKsBGVXBxr5BEk0RR67WuO2IxzLT8Ls2WSXMZRIGuAfluAPhIhfNAW0vT
	AJGMjrwcRVIw==
X-Google-Smtp-Source: AGHT+IGB6G0bjj0maMKHmuua0hMqc4EqHyqktS5DWO/T8lTTtYUZ5oM/r59RE+hpsUE5upyZQqaDWw==
X-Received: by 2002:a05:6a20:72a4:b0:334:974b:6e0f with SMTP id adf61e73a8af0-334a86256c3mr18865281637.40.1760993620849;
        Mon, 20 Oct 2025 13:53:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:32 -0700
Subject: [PATCH v22 03/28] riscv: zicfiss / zicfilp enumeration
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-3-9ae5510d1c6f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-9ae5510d1c6f@rivosinc.com>
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
2.43.0

