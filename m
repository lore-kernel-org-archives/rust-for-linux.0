Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147EF34C98A
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764878692; cv=none; b=BGpISUtfuJAq7qM7Bqnnd+kqmSuYUUL2XilIoMaUjgFIYKTIAFHt+HRydPX3K9M4ZrzUcF+9hIQMlBH3CScuArDr5XgQWikR0+/v1Ftdo9+oHy2dFJK7GzXetfMZ6cYReWwznJe4IQyNJpE9KIe826kO2sYyVTZYUFXkmjnfSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764878692; c=relaxed/simple;
	bh=+ngELFAfNSDVPG1dfl4U/GNwgJgSLmHNPMTUuZ2hwrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8O8Wz2niAysFetY45aNY0vaugNJYHBJU3vHR0p6i2J4HlfhY9uVoaooSYHwGHoUCw/2O6oF6wP5edJ+TYmF9KRauPJuGzwKxW6UAOiaPxkIKhRyurJGdQIIy4+1cbi6llqShgfSELHTw4A/LJqjGECaVkQRN5CiYN9KefQa1dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=bA1sYoAG; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="bA1sYoAG"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so1549081b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878689; x=1765483489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uR2ANK1p/GtJMLoYkqluiVL+IiMuKNKdjgHs5HSKwC4=;
        b=bA1sYoAGNYrhIUtW0/k2h9N41N8tw+2Q0fwZJq5QR+6/K0p8JocSR2Cffm5XIia8A8
         Ts4HSQ3pUG5YyoYo4lXzWeBPud44DtrYHHOAiO89AOZvxjAnyKbtBaFf+1SzrFbpxC4Y
         AZw+rtzQY6Ti33fx1xZo3MJ1Jj7yxE+qiIfNvOC+jkjF60myYMRjMAkUVp0kbjbwYYnO
         2cUUYZwjiOMTbRb8RK3u535/lbs59fMJ6cbzfBc78qwi3utIC4bBhnsFYZMt9r7/OrbU
         zgnk5QINjpVFA8zbybxjabLE1mR9QWMgUnAa0T6igOkmfynOtyKgNpP1WvNEHFSXt0aw
         2D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878689; x=1765483489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uR2ANK1p/GtJMLoYkqluiVL+IiMuKNKdjgHs5HSKwC4=;
        b=XT/lMKG9UVJu10ivc5US72Rw05vOIlT0a9wg4H5wPJhmjkTXkuRBgI7JBfEC0Nijyq
         tJzSeTzz8ZiX1/14HvEz9JXVJwFMOieLYYWnaSNSh9MOKMgI1oMcO7r8dJEE2E2eYOv3
         I/lhUkuhKJCFrc5sVjUkP5LqZXtGRhIpxDKt+8Sv98oE6Nmj0gzHfbdNcK034/u4JjGL
         FcMTC0L9RJ9I+oRFUQkgEzxdsNMF+SULSpPAS3JB5bKP1fDcWb9/0AEEbhFcoiP250Ip
         WBFZZysnWd3opmOXz7+ahbJt2NVcMuh9hbi0apA+F/5t0ipBpx0xfQ/0Ui13+L2cRorH
         MZzw==
X-Forwarded-Encrypted: i=1; AJvYcCWjHJa/DLZzSlDW1nqHTVYTI3N7TGolXisDtTeGrUGzmN5EhEC850Nk6SRFIvMD9ZV4heryusKd0yN1SKAUHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9huCTbBUcVaRncngb+Ph4uTZ7rMnkc8BZaHZif6zmG3ljEoyv
	WoRdBjqSk0y2F2A+YD9+l4mpmGbewvp2/KonEDnt7nVuEG/OC2L3DH4Nde96s87ySsc=
X-Gm-Gg: ASbGncu/7adeTRT7ILjaao3kKzggzUDYEfQKWOyk6SbRO0sML6FuLsOkzSl1JGCfODS
	UuH1JMm5NG+BKvF5nTYWbCrpD+h9t15O5w77dZ3cOR1KNlCzqJY3JlzhGpejDcZ2q5Sgx+HIdiE
	uwSnt1p2wKHjVW0mLEN7QCFb45wstT/A10xq/HH7tzh004N/W5aYJa6ri32uwByMMeNZ1YejxGw
	l1Ifhehb7Q5VraF10N7ThuBNfzpZVGjwq6jXzpwWZk5Wz2iZNyD/uYr+xnlnafYrDbSltFvFFM8
	g9CcQ/fpEijCZqNeFLSTGxt09WgNUcFGgkA6qkcnsvWivvdalHax9wrVOedgXWcvw1qp+4z4usB
	gdzlKI1rRcr1Hvo6+vvML4p2hljcz53BGd1AyqLNtryAgRUBTQLi3oZ8nq/Q5ntJXSkTcGD6fgi
	wCQzOh4Ifcnf4VjeU+BaAk
X-Google-Smtp-Source: AGHT+IHr9eCZ7OoyJRMHMKZM3eAa0ZLkjuqDEJhukBTDFAFWWCXqX+gcmL/RFs0P9XhWOx4pRyl01w==
X-Received: by 2002:a05:7022:fe09:b0:119:e569:fb9b with SMTP id a92af1059eb24-11df0bd1799mr5495837c88.10.1764878689024;
        Thu, 04 Dec 2025 12:04:49 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:48 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:04:14 -0800
Subject: [PATCH v24 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-v5_user_cfi_series-v24-25-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878636; l=2507;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=+ngELFAfNSDVPG1dfl4U/GNwgJgSLmHNPMTUuZ2hwrY=;
 b=iBrp1RtTRh5oJZVzaOaeFhva2V5Z1q1JFj7rzOxyzprKnymzoWjN45RvOVAV8T5/wMd+G1JGu
 G1MvETpgLboC+3bOxlsHE8Ns8RB1GZmzEixY2AHWIc1eUxbU9mIcSne
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
`ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.

Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig                  | 22 ++++++++++++++++++++++
 arch/riscv/configs/hardening.config |  4 ++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c6038dc5dfd..f5574c6f66d8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1146,6 +1146,28 @@ config RANDOMIZE_BASE
 
           If unsure, say N.
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && \
+		$(cc-option,-mabi=lp64 -march=rv64ima_zicfiss_zicfilp -fcf-protection=full)
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
+	  default y.
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
2.45.0

