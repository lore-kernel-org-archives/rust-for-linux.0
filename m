Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F9533374F
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991776; cv=none; b=j0D5hu4mH/qAjkjfYNapisz/VH7mrtIFDzAYtFnp525Hhwp/TCmKeH6W1sQBYbnAfmkX4YobKVjnSruKU/aDrq82mwpxIqDFk8fL56y9wz3kBwA4Uot69wvUKgzuQqMX8YEQ33Fx6qJpH7WovJPGK7qMEuyw+0bgKW7osMzqNbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991776; c=relaxed/simple;
	bh=w8K8YWqvQ+k+ul0JfJs7USW+kWSgKZqY/8VTLLDGvdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6/Zp+ucmcMlJdPas827rQoKQP9MRKPC/ojd1CI/nWQPO9xT+eRcM1CGUzW08XEmfsiV4/7qr68U+iMcoIUuqmrtFkncLkshK6YFVD46wj9F6VrvavFVCnUS4BLfvbWQJIzo4FQ/jSYe5F6T6qqDECjUZM0TPMmx9/NhpQSRCx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=XPP/CeFm; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="XPP/CeFm"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4338021b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991773; x=1761596573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRwldBzHIQH4g/MXesqTddRa2wH3mKxscowbsdJ3rFs=;
        b=XPP/CeFm0Hi/WJJwiw1rXrmau3NkKsOl0GHaqNM+IKyIRfn4NJjHR/qC0HdV4s0MID
         N5d3YzGxOLBfFKGCa3ZGtVRFW7qk8TnpAjyDIPgZ95xkYyIDqIjSpJ91BW1hr+w0/KSc
         D0WUSYcp8ia/IqXMb6TPEFKmOYHLUelS5PYS+wxl+PI+NSn4Fm4bp31wAFf3bUweXNvF
         SUR52RUPQtOXcnimFzgrqyfSDsb8IWenem9VLjxK74NE+gq/s93daxbURM0JrNBpXhDq
         yqOG4/oUnSpg6bYynqaf19nqVIj6oGt+weNS3mkJFj9USHlG3UPsOWMnIcIPrKqWNJq5
         +pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991773; x=1761596573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cRwldBzHIQH4g/MXesqTddRa2wH3mKxscowbsdJ3rFs=;
        b=ggXwqr8EnrGivsbgKNm5hhI7W5v+ZOusXNrapxXyX7LkK578cf3fm0n/EzhTFF7M1C
         4YlzFrZ6HZk8s1YChK2tIJGEXOiV5Ij3/eT5YR/KztxV2kXHUTiqRdzOHHC756TnubBR
         wcfP6Iai90zDX53LXgcngubeXrMOul7/9lysZfiavsBIZ3dmZYCiyV8C/tvGQift+OE8
         P5D/OvNKwiUjZKj2foM4GPsX6sj/p6TqroyyPM3rqtwHCpJR1eXSCihGY8S38asB9am3
         i8J2Lw+YAT6tzsBneTjYqNwsXXinI98sD+eqBQ9AlkuV3agSeiIiSGj8SEUBPgnBka5x
         70pA==
X-Forwarded-Encrypted: i=1; AJvYcCWeRePTfvIhlkUouBJYoGR11bJ1ehHIwZDiu+pzH+vSk2CJi+DGNqrcqU0L0hprHV0Ao7+LRjLjmSdaV/00Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/WpOMurSvU8yP/cy5jJ5ilTrla4e8Xx0mIIY0j1Su2OQbUHwA
	hNdveqcIg8TO9AJGD9O6ncDSPvl/KzWjlp2AQm2dbAgVbDSl83/NzFH8kKB4LUIk33s=
X-Gm-Gg: ASbGncsd5f0yc+PVwL7aRCyMYNuqIpjCRcd0Bha6tIBEcLhzhmlnrgkyYtThuwVkwFe
	B0VlEEXv+A9Cezd/84DnA0XEByW3r9nmcya8qDhN5WVhL7tHV0pIrkJ19BxoQMFO/l2L3R07cjc
	pwv9T+UYXnsEjj2eGwM6AJIOk+tkI8E5qlP66vnGjxKwVh7EFraPhuL+EvVMYTIZLeig4f4sVlW
	Xx6/kNk6tWHaK17UkqzPH8QWOFISY+17ZKDsIPZu1Vy4xFdXHdp/JwQZKAqpu27RKJgABf8NeaW
	lmn+XQ07QAy2ive3CMdIP66mcj8Wer92/JrRWEsyp/husPffxBUAFhzOojdsN5/1TioXoLh0gM8
	7iGuX7dUsdOFsroA1pfRKhEW6PAYdizHhid7h2iJMCPjFgY+YCJY/GZkTlanHvJ0oC2rNR6EQO1
	M2UDu9OjhBCw==
X-Google-Smtp-Source: AGHT+IEWBLf7wq6f3FV6257yUouPbLkY/Mk/oWHqmnpiJ0fcsMsMtz1kgTZV512lCf/qTagDTur4QA==
X-Received: by 2002:a05:6a20:9148:b0:2be:8ead:1bec with SMTP id adf61e73a8af0-33495e6781fmr24121585637.24.1760991773177;
        Mon, 20 Oct 2025 13:22:53 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:52 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:36 -0700
Subject: [PATCH v22 07/28] riscv/mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-7-66732256ad8f@rivosinc.com>
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4c4057a2550e..e4eb4657e1b6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -425,6 +425,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -765,6 +770,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.45.0

