Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524A34FF5B
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 18:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959859; cv=none; b=WAKV21bp7oi9suWFu9st2sLgox5m5zOkBn1Y4O1mWoh/7f2dPm5TBz2+cUKrDMnACHrBEVTQCI2h8/L1hhcUkavV7Y3Iyx8+gXMxrGGgFbqqta/rHTWBeNezeoGLBAgo9eZPwcNj/RchOeMLp1+2bu6HpSFgFm5w2whpFeeAGE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959859; c=relaxed/simple;
	bh=5pCsCIMJf4iBOvf300q6+KPihTaIQ8ZBfY4WmoGUnLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcAywlm3B1lliR31BC8pc5GWs1LKdtq/QVY/0bHDr54j1cMHK3c1VooHG5eTOSkTX0I2T9Q90pr0/wuxBmgUgh48YzE6jrssuDew+GZ3ffiuh9l+fYH/+pPZlJ99o1Wh06C+icQi7+Gi3xfYaaSjM9SPpviHWAdTiJ9r4iOcPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Hg1w6IbF; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Hg1w6IbF"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2a45877bd5eso4568105eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 10:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959845; x=1765564645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7cVA4V+tsTGYh8faQvOG85ZxC8pPRVoW62aZwUk0L0=;
        b=Hg1w6IbFq7J3oJTjZQMV2a3n1TVZ5ezwfniSFN8ubnhi6A7ZVt/IB0dnZcHekEqntY
         CcmCDuWuAwUOM/ehPvqvfAEqGj/UXsNDLwj7evTRL/v0vVaTe4l7QbdCs7By2HIGRj/e
         XAd6H8dbPS89TkTUPh9QZuSf7dvtBjFvpQ5XTzCIulapezJ/aDEcbA+UAzomUslmcQbx
         CTNE2PYDuGBDc+AFVZUoxNvB5/5GPwhNsvrbZDRqvPG5ESUpKU2LZCAe+FnCvptMQUjx
         4hNe5rhc1lK5JNyO4OcO7qEIv46GF/6UhIFSw2lj1Enhdc/WOtwJ5GVs0HtNm5EjQYmg
         C1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959845; x=1765564645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7cVA4V+tsTGYh8faQvOG85ZxC8pPRVoW62aZwUk0L0=;
        b=RiqIMyp93aIAjIHfZQfMFZdfdMZ5b6WHhWXPxZql1e+y12n1c64DGrwC/R4ZF9hlkt
         6/Unqjs3TUwgaKdwizst0DJxXv3g6UGEAPtKPRzOey+dVifcNQxuUzPwT+h0nZbNNwAl
         qe1Z814vq9sZpOoNeNcsmS66KgIqi1UTC/pq6LtcGeT2SooB9Skbs1eS7VsoLlrrEDqX
         ybFFLZIRndCe0DOpIUEox4T6+ra2UQ7i703AmyDj9xvYzTft/fqH6qiJQSlSQySYaVfE
         k6eQlp5QpW/6pa0PV1g0xkbZghWSzLn9jJoUwIp4jj/rAQrw/xLA6Rg5MzlomW6lk6yV
         J2eA==
X-Forwarded-Encrypted: i=1; AJvYcCVc8rJBcircM4IDZ3SUU2QDFxECwaof2300ovBYZTGMWO3qlscJyEU7ro0aSzTpQcDDsAgkQ7buhV9RIvrgRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKzV4V3Glzrb6IKPMtxEObNZEHNGUnYsAXPE4se6YwZvot0NGC
	A+z2FnXyHCrjhdLHsPCwIhL3y3tge4wTHadmk22zpvjetsKprfTHPdray/8KqGHpjvM=
X-Gm-Gg: ASbGncuaTAGRN3YmDoqDVttSQ00Pot+jYvJlXFD6AoRcCYocjbEbPmVz+p17e7oOlNh
	jpXQ+9dcqIpimdV17yAKfJLoD+69WmAL+SLS9bp8pauv3EpD7zLMuonOT4wsAepFn8GOjyeHKEK
	hoML/zFTUTvTKF/v9zs7BT2Kq+RwNf8/DkCsNLiWZeCxiN4qnflQDo9q1ZjYjiY4IHorVAykLp6
	Ckvncr6dztjYzcxgoEQFbGkKcQqsjPOgwykamddxP1uUpveyLVjLUlZOOVPmq/NYqV8kwHirUGu
	aUuT/fgh3gE9FIThsBJvcWZrazOx6NRZb0zKgtl1wlwT76Kx8XwksZSOPRhm04ZReibTCr6CbvX
	1YoLqa72vcdp/D1XRzkyc1Sy1f0EWjPzURdvYlaFKhfOiJcmdIXlVsuVa3v6RhrEHCLEm7pzF9B
	5ZX0JO6zo2JexkYL73a+hJ
X-Google-Smtp-Source: AGHT+IHpgKa7H8AahzL7MXJDXATVAt8op9HJLZz6q1O1yZv7iAcmKoVC4X9a7AcjVimql64o0x0uoQ==
X-Received: by 2002:a05:7301:1e82:b0:2a4:5c33:ff7e with SMTP id 5a478bee46e88-2aba34e598cmr5659789eec.19.1764959844877;
        Fri, 05 Dec 2025 10:37:24 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:24 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:37:04 -0800
Subject: [PATCH v25 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-v5_user_cfi_series-v25-18-8a3570c3e145@rivosinc.com>
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
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=1182;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=5pCsCIMJf4iBOvf300q6+KPihTaIQ8ZBfY4WmoGUnLE=;
 b=YUOAVPCuxUM5Gbaa6opv1masEPHIuQa83DUGc+CGXyeJ5A4kfQSjMwPJRS+2ZDYG/CTYlt+hh
 XoV55OqqjBBArKRtE/ICcgJfxzIDFQra1KnJGP2v9aOA7JvRD/LcfRN
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 49f527e3acfd..aacb23978f93 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -93,8 +93,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.45.0

