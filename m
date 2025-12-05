Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C09B34B19A
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 18:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959861; cv=none; b=nlFDzDcrShenKia0ypflB9iD/RyV5YDPAGNpJiedO+VizRe557qXw/2e//lflVyji6l9dbd3iBjiA8grYZX0ukVHRFajLaFA0E2Rlq8ol34ANs/knAYLnGVLwL7VcWo6k62mMOdtCcvlmNWD26IQJO8O0oltPo4CDT2SN8fff+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959861; c=relaxed/simple;
	bh=UW9zPS2E4TbdsfJtyu+1aU02XU1fbJS+cjnllb5pNMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AClt7AtfyhtV7BudMmYmvc7JxhJbz1sAHARo8mt+rPQv8+ArDrp7/2HYI7CWJRy+SUTFbewenqREfda5Ps+KSgvlVTwJI8/pAJyAJLUKiq6rAdU1QY77isuaTIFzxeFYjanrd/HEcq5eIR9jRrLmSkgLxZIns7D+oVA+hhXeV2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Eti7NAMz; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Eti7NAMz"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b553412a19bso2097616a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 10:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959852; x=1765564652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RnuI2UkBizC29w22/jrSl2sQbK2qqJuozv4nJOkh7A=;
        b=Eti7NAMzlBvkKb6WAYOU/DO+PWtVDnlK+f42aTLd1VbFwYn50ahDvXPFmnwEl66rI7
         ZQt0U5j79/QuPOT7lUQFd9N7wSM/JdmUj9GM8HiI6RCPYIYzZWdbjZxaLZyyqV/l879R
         O4Tr50OaJi8Dr0v2ik0XpwWQEwFO2mxKJo/ZlFj06HBXr62CpryH95qj1rgzAQcCAo0w
         FeeVbWtuK1BWa1A+KV6J+i0iyyfspy8CyjLIb87DneabUsG/ibckBzViafa1TeFB6zYn
         IeORzFVtYr4N1goBgXd0CI61nOJBq1Ith78X1WutIdqd1argMkMTUUgQX3Bggswvefu8
         bzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959852; x=1765564652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7RnuI2UkBizC29w22/jrSl2sQbK2qqJuozv4nJOkh7A=;
        b=rmCeIpwrtOGCOs0W8PS3zE++t8tco0dIv67YBrzjx+900wclCauBvGLGGvMyXe9mBm
         jehsK/WkuPQqK548WkZ5UsL2rZRBxf8EiuNw5MkOEnEz6Zx6LBNZtgC50g+ddDBMFpST
         XXC7R0eZToiWAx3c2l7F7O9EXgotxU4I7mjrxPzhPUvcerONjEMOOdiNnu5gmUEjjuh5
         XmTsL48LQz0KCaKov7qXk2cXu05a3OjQ7Dhgioh1BSHcUs1Fb8aN67rEoaJQZDWT0WvL
         6zkO3fZCxZ8dO/Vx5F2LtoO+hZVkJPWvLSlG9+zIsoHBCqHFIpj8vPus8pM/hm3VIbM6
         eVxA==
X-Forwarded-Encrypted: i=1; AJvYcCWOIucX6Vv+5QgitCz3EG4L/+wA/j/o5MTxqyNgRAmRJevl3vZ0ygtKz3JTUr60mKrXOoJ1zNy+fPKiF4j9cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFlqfDD2E03xsIBgW2WfmtCrqHqUdnrlHloajXlewqwPwRgUZa
	r6Z1tcDbjIe5ZUGq+luzJq+YuHy48xTfBuSAPNh8GQOAhfyts2yAJa7qpExL6w5fVjY=
X-Gm-Gg: ASbGncs+4jeW6asT+ytLzcfew2Boa87Xo7XT55YpGEtgdxTJm4Cbjb63/Vh69B4uhhr
	yk6Ofy7YMQ+obiUVrfBafljP3FLtNqMCwgAI1aR+/LOz1uKOaO8foqOu3DksryCrhsDZroqamxC
	n6e5Um5122+zQGkKzje00Jqw4C48rNn6GSFiqQXfUrUUH1gkUCwQg/oZVtfuk0ZCBNyFs1HbGCh
	yplUPY0LTH8GqEvhCOmItLlF2OE/p9WPTXNRbXQgMPxu9VcDzMkPFkRi2dJlhy2Wxqk4fIkzIEE
	225o12SuPWLtq4vkpl0DzInPhX0LUAqiPROSP5Thm5uNV04Gyn5h8pjyYZ1yIVwT27j3fP2NRCe
	MQJqtxXmfFj0XkVBDQQV7efnXs/2awkIrKs9gmsoBL5Z8stFid9sgXUVo91JlAab6LK0Zl81wYJ
	og5uw3rb4sawtzjp7SN4fx
X-Google-Smtp-Source: AGHT+IFwWQQuMqwR1+ed74jDMY/CSXapqooDG8iNUOlxCqzdKYEOKwnXkGf4vaTbspDREQ1pfREY3Q==
X-Received: by 2002:a05:7300:ce8d:b0:2a4:3593:6450 with SMTP id 5a478bee46e88-2abc6f4d29dmr119392eec.0.1764959852461;
        Fri, 05 Dec 2025 10:37:32 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:31 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:37:08 -0800
Subject: [PATCH v25 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-v5_user_cfi_series-v25-22-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=2983;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=UW9zPS2E4TbdsfJtyu+1aU02XU1fbJS+cjnllb5pNMY=;
 b=f2KU+fCOkVj7mMjxZQYYSKXqi4DC7zhXlZZWWremH2iJ9TKnGVTmf9UQKwNWQYisAJhI9NDY8
 wDPYzH1n8XfDJHQBz0URPXJgVJBe8mEcqmkwauMK0YTBxPK3RkLVc7B
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

Kernel will have to perform shadow stack operations on user shadow stack.
Like during signal delivery and sigreturn, shadow stack token must be
created and validated respectively. Thus shadow stack access for kernel
must be enabled.

In future when kernel shadow stacks are enabled for linux kernel, it must
be enabled as early as possible for better coverage and prevent imbalance
between regular stack and shadow stack. After `relocate_enable_mmu` has
been done, this is as early as possible it can enabled.

Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  6 ++++++
 arch/riscv/kernel/head.S        | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 8a2b2656cb2f..af827448a609 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -533,4 +533,10 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+#ifdef CONFIG_RISCV_SBI
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
+#endif
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..9c99c5ad6fe8 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -170,6 +171,19 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
+#endif
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -330,6 +344,19 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
+#endif
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.45.0

