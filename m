Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BE334C806
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 20:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764878651; cv=none; b=B32rcb/TOUQWaBwBamVhIEMw9n81sYmnjOFBrj8krGldWjpwKYBSgBpGhetJadPnWb8nyg/6zIx/KUuRKxayNYGXUuQ6mvel/XRYqeNu3YxUmcDpinOI+80QoduqYy0I/0kK1GxYZVBuTzGheQOhIJzhmZjxx1t95UWlDthuK+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764878651; c=relaxed/simple;
	bh=n7bR1NnVFI/AqRJ5DRrpGqIuuKL5t/EAGbECncFah4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TpkTG06v97f6L7FyTYxHY9jg/9TICrC5fCmAHMNrPBr84Heie/thj6XcSrfiXpOQk7T3jMt3EALm/fn9The2Hltow0XLjDAdZZuozEbZC43PpSqro1OWEzRFkUpi6YcDbrToFfU3hmJ2aui23CRx2uWbf5bNdwlTPm8TMlkbd8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Q9uVbgur; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Q9uVbgur"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-298250d7769so10552615ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 12:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878647; x=1765483447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cETj36wQ9Li8D++iY1PBxUMbJIR6wBVZ7mUW8zqZ2ak=;
        b=Q9uVbgurTJDBvPbc05iQDXB2Q/1SVqO4qpypcUuckBxY5cCMF+wWViWcIIwq7aYwDP
         p/wys1JMTd4ytKCHLBIQVjZkoWuEbx6D7o6+1FZMqHWPqXhUN4+JVYSn23QLb/Ez1whZ
         LPFnOJU5duhxBqimZDz8ms0cBzNyslhxZMJ3ZwnIHDhSsonSrIwc+8Z+lyXWvVld3NuJ
         pli2XGhwlv3TOdw5qTOeBtKg8OXu/3g4fAycXEhd2LrhdyTcY3LOkHXs21Vx836rqaeK
         HIrT8Fr7z4U6/H4oE/Z1xsZnhQyzBHSmesGUR8fH8VQR4oJ/0aeBX0rmofDcoeUFwpTI
         iZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878647; x=1765483447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cETj36wQ9Li8D++iY1PBxUMbJIR6wBVZ7mUW8zqZ2ak=;
        b=jHU491vjeOQJ9auGtuszUrcjkMJf2eDaAd39yddlsxN0jn+Up4svLbqwm/U5mMS/cw
         2ffSAOKYfxeuZvHABROSC1CAYLEp0RmJe0ZIw5t4WjrkHelujK3ZPWUlT1fhY99u+ahO
         F43fXyfGBbrR4LzBdRMxvzqlfQqEY4yZSJnFjdhDz9Ls5YtKBWGubCBsz5/vfgpbhe08
         Q1pYohMkOWlgVZ3auXxqZ2B1um1M2p3qvvLBo0HV7KdeAc/4A6M2PoZj6Yc9V29FkXnf
         FiE96wP0k5+T5CpvJ/lP39KywmeMpP0GlPwbowVHndEZ+2VvN340PcXLAfHsEPP5PB5q
         9pLw==
X-Forwarded-Encrypted: i=1; AJvYcCULoMkdq+U8G1fZltWR4TrmtHlMekrTfZt5CTiSwnN20cFXUC2gryVceRKu/cn8an5xVz6pbZ9S1JY2S0J7SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfFFv1m+bsbyjINQ7rZ88/eFmv1G2Skiq6nR52hxwcYexpaQqQ
	iPhBz4jFJYpVCwpxvrNXUsjm33g3ZXWORBY3LMoDMTCiPMyXPSmZtzikM50/sQEOErQ=
X-Gm-Gg: ASbGncsegsNULkm2tJqn1ytqqo1uoWkwFMhA14BVaCwSrsd0MVDbxsyzEWLEjQL2wb/
	pnLByHAh1nuH6Pq0JZiESDz6tSJXgaHEYOtD1RgdLNIx+gxO4akFfTHWb3v5r7PUPIbfzCfmU63
	TW74BqVWe46YPy2e2zSPzznmGMzAlY6qvexP9Cgo+2/BZiyYkMLkSBQMJPU5Y+yjX248bP+ksQo
	xnwo2Ps248BTEFtkOL+LI5SsgGcVBy89ZJ7wvDj+Wq38H+rUoiZFnbDgCsEMnKmNR9nNXhXzQ5v
	/+Jc8o6MZFGYybIRROhPgUkU+MdzNZiM7FqGqCPdFwWowR1+u20RTkUTqQQeU8mbRpHS1KcsvKS
	pT8EuS6N00u9tIkcl6S86GKmY6EFRCQbymUj40DCGNXeM5g69Vhj6R/xjTEY8lV9xkwQ2vOIqXM
	he473a0RF8jbq2FzdoJo/3
X-Google-Smtp-Source: AGHT+IFWuqKYnQSvLkeJOo70BOomylUNzBut9o8ts33EDbsDYkfEsTuZ3Pa7zWK5UOQJ525hf7WoDw==
X-Received: by 2002:a05:7301:4283:b0:2a4:3594:d54a with SMTP id 5a478bee46e88-2ab92e3a972mr4143173eec.23.1764878646675;
        Thu, 04 Dec 2025 12:04:06 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:06 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:53 -0800
Subject: [PATCH v24 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-v5_user_cfi_series-v24-4-ada7a3ba14dc@rivosinc.com>
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
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=2422;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=n7bR1NnVFI/AqRJ5DRrpGqIuuKL5t/EAGbECncFah4k=;
 b=4TAIrpmfuAfPnl8tn/VIyCTK2V1JPV1OlmYCd1ZA/LG2RWhQpYMma8sPJT70bjwwoSMUdt5tn
 ECJHYi4ghjZBSfdrpryBl6eil4hs/VFJwegf9Jsy36h+Tc2IQMN9sui
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

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

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
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
2.45.0

