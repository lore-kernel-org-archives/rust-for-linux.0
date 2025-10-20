Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177AA3148B5
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 20:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993626; cv=none; b=p8vEAZLM1XEEd6Aft+q0EKCIQVKqWC0pX8/uWq9uGQbfDmfohO8PU7BKDPK8yy7QD+EGRaYdtK+j//tpFyajwXA5AlvyF7FXdpF5SofKQ/WyqCUmk1O6hWnBGFmbYCnyIHbdFH42Lq3ZTt6EKKaca0DM3GcSv43EHvOqlhpPKG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993626; c=relaxed/simple;
	bh=kcKAh3qiYa6u+vavoC8VVP4XbgP0FdaLB3/LKiPnoo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XF5hvNIlNPX/HxrJF7pPkBDt0qBsb/0gz5r16Pj8PhHoEMWUuV0vKf5hW3OZzHFZa3x1WyzCZZlUQopxgkgxXf533WdBHyhhA1kc8kJKUzkCKMLidWMThmwNlmOxHjQwbZisWAun6W5pwWUBnt3K9XPavCerDPSeFNZvKUI/FMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Hh/iuNWV; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Hh/iuNWV"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781001e3846so4456672b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 13:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760993623; x=1761598423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=Hh/iuNWVk029uzL0XUSS+j4ka3hcDylCb58Bd3y8T6DmyfNFLESpLKqJYZEKLH9DEu
         DB3dZGwxBeUgjcXLKMwDU3/fNYTgG+4RAMl7tDv+Dl1vHLWy9H3CMlbb+P6dMV8Rb8/Z
         LUx40ZhYYGng+VqTBri111WTKR9SjvA+eFmGy3fYtbpZT3cEFJNbjFpFN0rhBoHrT6o0
         eoikL5vcKFlI7uLAzuK+ACiHkeKnEEkCly1MOInRDEHk83u3jc+YDm1TNOm87UBNLpur
         aOghs1B218HFFkJpbfzL36SVSY4IVFhjfEN4p84Fg4vdr4FqOWmKz+vSXodRty0Q1AGZ
         AC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993623; x=1761598423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VM5DlrQCbRYqN6WQC0IO67CheqmNFMHVu1qXR64a+aw=;
        b=ofECzEh1PbwAjQKBEc/TzhsSpNWokSeVKzIkR9Jk8iQbAcgOoHIX+5mpIW2LGwoRMt
         TTrQxUTJUsPbwHDM5xgcmWCY23KigfiTksmbsNixwjhO/mdsgU7P4UVnwSO+OD5tgpsV
         vBqYbilOEgxsH6uFgt/A6tYbuRWy6zYANex072INbiT5cwfK3XHBImPoHAbw+fZ1B8he
         hxJhrBLJMx3h5Ydm8FD8xd8ZAKoBxUJhru4paIaeOvN/iAo3ZPj0WNCyzvlb1jA3pwGQ
         HoGHwIqXFQsWQTU6jblN4Wq4O+4W+I0Vi+i4W4znr0MmW1s1lI5J5dl1skG/O6sZ1DU+
         LFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq6UH/KLeu7Z8sUuW3htnGempJSurFIOUXJ+RsQltvoPwbQ5s0GnF645NmUpe9k78G5OjVl1LVrRchBuv30Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7f4kLLQ35Ni8+WUW8wQFycDoScp/mrWPZi5VwDZZfI9qT9bWw
	LxTc3sqrH//2Juxb0KGs6HHwLpvxPD/ZtkEHi6FtLs8508osP6vtjZBOpgZlzHcrPkI=
X-Gm-Gg: ASbGncv8Ip8Tlrr8kriS9jpbhIZvZei5u47ssja+ewr0s3KR4gwq6kQwd/SKkOE/b4z
	es4IR4N50VJj4I3JF94MoHWsrkzhad343+Y6X9Ez52g+dKYjuuh7vLQbat4DzgjVCXKVGueGjLf
	hNxpPPKXPzQVCsvAnSZ1+QFlckTNQr/Z6FSbWh7kzslwCXDyDphyBtu9HUk8AGZOAivR3jju8ZA
	ph/7t/uvZyNIO6pjICJb0uAt+EczZSnmO0o66hicJP/+75SBZMHZgcmTjwWCt5gasJKG96Z+AY/
	kvid9fAlm4pjSg4vBW8n2/w5wRWxt1/NDtWkBVxvypwqAN2HD7Q7REJLUQhXiMv53IMR7N/1QjP
	6yzXgLe8BFuO5A42SC6AvvUAdIOeUhpf9F1hPl1ohFQIN9J3JoCyNzqEkA/9BJAkI45xqAJ1Jsc
	DfWzzadutyVG7qXD2WfUvu
X-Google-Smtp-Source: AGHT+IH9TW913zfh4PW7FMgstLMuYEwVEH5t9QrKLz79ZwULZBMVRXbb7o1uPrVG0bYl8xQxOppecw==
X-Received: by 2002:a05:6a00:99a:b0:783:6042:114a with SMTP id d2e1a72fcca58-7a220b289bamr16527524b3a.25.1760993622997;
        Mon, 20 Oct 2025 13:53:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff1591dsm9453867b3a.7.2025.10.20.13.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:53:42 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:53:33 -0700
Subject: [PATCH v22 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-4-9ae5510d1c6f@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 4a37a98398ad..78f573ab4c53 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -212,6 +221,8 @@
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -230,6 +241,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM

-- 
2.43.0

