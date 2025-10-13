Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA9A310629
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760392617; cv=none; b=o26NKZdpyJkqTVoxRgvUDSjgzN6z6SBSFE2oCkLlO7BV0hmH0FIRzwHv7WdDztYIipPzd2BrD3HdjfPuOk0Lwp1E41mpmbp1W0TkPuYPrQmMjoZBlRc9i5T3oqTJHWm5zrHjrQ9xPIzm94gKYfGgkVrVgf24MeUMrvPFH2JXGBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760392617; c=relaxed/simple;
	bh=zp1GtZ2xtYk4tzcgCMIiTQFkQH3SwEi1+kZi/xCoKAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rHAZ+AwhF9spqHXuN0PNrI483y+CQxMArZHtv8IsBRXYGDQbTftTsouWwST92eqCB0h+V8raEngWyawUx90x0Xu9AdLES0E/jW03iOqszU7zVBsmZdnaMpWyZWBTDl19Jz3abpNjJpJ6rNgURz2/5+QZcIOxxbNUXGigSOpbcvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=V8mASPhK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="V8mASPhK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so4987982a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 14:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392614; x=1760997414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=;
        b=V8mASPhKpPJDH7gQpMCCswPofmgkg/sLI6OxMuqPy5r5T3SM8VHxeSI9AxB42Md5UY
         EV4LziKADGfaBf07YLxbDwlzeM5yhb3neFK57GbYweCkfl0sSjU1c1kJVs6324Hg+bCo
         SAdNG2IPSln47DSbT6kqVrhI4/qCr+lBAh6Q450oZcXEgeKh/xf9TnKpDVIhzlved6km
         N1usrbJ0tHy+y0e81vAtL/vTqkMqlHOmPCeqWuZlwnMcGbqxjiBd6wcIOpG9foeQyPGx
         nL5q8n1nnaovZEXWYtwBmKdUGQ8g96uea2m1xFxQN4/hUS0leTqcXi9Yn6cURraantBQ
         hnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392614; x=1760997414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dbof0LYINd4D+dAMCbCh8LGflH6StFg2c2dYAuc2+YY=;
        b=vFEXbNT3caOVtx3niF/8qQmqvTkkLxE6L8fUItMuSnq1e+JTAK8LYJYkDPAUskhbVx
         YBccE6BdgdAb6glHmj3hPoqT5EKIT7GJwzMQBfmOtjQpObiBu8MFSvhh4p1159PoRGXc
         rR9+obOzUA8yGS7ll60B8rg3a4D4Tjjncp2begQDkrMEYU8Tr/OqNz1KFLx39QELx9cE
         lCxf7Wylnmel/LXQkHJkTzPm6iDa+IA83r5FsyJq243j3EwTvTZKtOTl7xfzYolVAtKw
         xXeBj2cpC/FxG9ddiBEh+hksbKrvtKtdkh+RN5vmY9QgmyvzSkHI8xbn0aGERG81LEBY
         46Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWZlan36Bo5bW6C2dqjRlxEu+pV0BNpD/C/D+FQA/wpwminU9jwMQDZStC7NctlugmmYAD99p1Dq7DUT7HYYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIFK3QT5Mrzqy32+raRpsf8yeFuKWWyBmHAT5GzZWaWvBeM3EH
	yn0wYt8ij31rQP5RPHqU9hCqrL4YjRfloFGwD7lyEmXbtELX+OcSQYJiGlUv+1Ge58o=
X-Gm-Gg: ASbGncvTYcDlEAotXooQ2bgV7rUJV1opmhEHLT37Ug/lAF6aQ90g+kHvXJESmY7POBz
	UiJRSCEX0fnQQndvbFjZxaTGMLP+GrnH6thnsWeekFN/uZLxcodIAWUsoQ5Dg1PNQ7R2brywpL1
	1bNN2yGCauZAmNGr/VoZ8k3MmPSGKcbUsEEcfWrYPOak7PcmVb05k6tYMzGT2L7UBHDtbcAj1OD
	70yu60W3ZDhfCVQnxg872XoYqnZ48+EJuWo6Vp9croQk4DRPlp7zTRW2Xll9oUwDmrQ8NpHX3Gi
	QjJnuiUX1hdPBwb5a8bl6iRxUhHdqTLxSnSCVAPAVU4dyc1Rnbdpg9lp9oWIB2HMEptpLSa7xL4
	r/P3Wvmf6+D6BorIEHY0MYt+Ie/7oo65x9BBeWqxQnOXd95e9Vbzj2yXLgxF48w==
X-Google-Smtp-Source: AGHT+IFIgzSXP/F7dXAlqZ2LJnQcYWDmxG36zDHOJJWTPgNoALO0OawBjU2puecWF73352ydInfFiA==
X-Received: by 2002:a17:90b:1d8b:b0:32b:355a:9de with SMTP id 98e67ed59e1d1-33b513d005amr30620659a91.32.1760392614454;
        Mon, 13 Oct 2025 14:56:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:54 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:17 -0700
Subject: [PATCH v20 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-v5_user_cfi_series-v20-25-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
`ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig                  | 21 +++++++++++++++++++++
 arch/riscv/configs/hardening.config |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c6038dc5dfd..aed033e2b526 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1146,6 +1146,27 @@ config RANDOMIZE_BASE
 
           If unsure, say N.
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select RISCV_SBI
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	select DYNAMIC_SIGFRAME
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default n.
+
 endmenu # "Kernel features"
 
 menu "Boot options"
diff --git a/arch/riscv/configs/hardening.config b/arch/riscv/configs/hardening.config
new file mode 100644
index 000000000000..089f4cee82f4
--- /dev/null
+++ b/arch/riscv/configs/hardening.config
@@ -0,0 +1,4 @@
+# RISCV specific kernel hardening options
+
+# Enable control flow integrity support for usermode.
+CONFIG_RISCV_USER_CFI=y

-- 
2.43.0

