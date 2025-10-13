Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641FE30B522
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 21:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760392579; cv=none; b=bh8gT8d11HAzgXfSsp428dVMqb+UdbYbLm2CNIs6+FD1ty+Zh24YuES91BhNJceqgxbT6hn+yKUbUg9nbGaBZ4dTcSo0wXykl/ql8vkSdDuzWKIh5RekeWtOhrTKEdoz8yir4f7UH+BXDYtiNDn0wJgy+aCJePxWS2ydskT5AGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760392579; c=relaxed/simple;
	bh=hYnrlxG2aSy5XgBcW07Fd+5qY0pd1xI872KUOKzj6JI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FQj63JZOKQvyTzS9FyJd0ZhrCP+Qu15PSemffn+lWmM+8XmGkKWPKC4rfLO11PeFpY/QK7JOA9SWZrBOJ11FhCfoTZRQp5kXKlf8JcuR9yYizBwMJqBI8N7Lx9i0boxhGhXlRP753SgMQdI/BjqUnVMV4zP6w0sDxJDfF2cbfJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Vi3br7Ww; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Vi3br7Ww"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32ec291a325so3365558a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 14:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392576; x=1760997376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=Vi3br7WwzMwpAfRdyOpvqLk6q5pnTd14mfZTyVI40X1YgUsZM2MRQWyqQxYySZg9Bf
         jrYUbcU6yVxv5/HI9qljEj5qSMm5OYputLtmtazb9f7i+eQ39qi8bNS+BAy4Vfxa+YmD
         nyydpvmai2inpJYYebsI2spnoAUQq05Q3z1WjK2bcuqBXaVR4lWRomPWifCTnueKAhyD
         DNaUAWeoccXdlyiSv4b17tV/2BwkE6MLL2PbwEoGIYgyQZyp2EPJqSOpWPGliae8WZgl
         ZmldrxCpra+GyIAqxNAqj7QDSflG2gq18KYC+Twxyeqyb+MFlyrsQW8mbmbk8gaHq10N
         s7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392577; x=1760997377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aU5JHaPOPUGgukhD3bad891ElerIE5ocm+VeTPJz1C8=;
        b=PHhX9Ybuf7sEDO+SdJxGk6S8iyo2DGQwDEziPwiWJSFKE7I9xDeo2UDiWo+wmEVzox
         OzRNl13eMSQrPjx8WDCL9OHApRBnCtMIBNV6e19dXxzZYp+cjj7Nk7agrDYNkbUBmqrG
         a5XN/tmWvZ1NHgSY3V0Z+61HAtZeLdVmw0VuXi0F9Btr3+hitiUZ7KV7QgxldH3kkPsM
         YV/2Cz5OWOXl2ffnzGMIpkme3RnYIiTJ1DBvNgIcjaM1zNM25So6HZrf6z6jaW7W/b0f
         wSH+Ev5Aq5tz1eBBpmTKL9UmZXQegzpNFbGb/rmXWh3uk441ys0m+/paUxpHuRt2JB2s
         8yVw==
X-Forwarded-Encrypted: i=1; AJvYcCUrDiTf86j9syaxEYhDFuc6Biu1QuXmCZuXCNZwYA9JHAdn9XRjQltfJCUK5joNsB6d7g3kKQ57vseBYLdhcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRz2laSZGug1HvL90IiwJtcgAN10PF/9D36zsMfY0Q1TpkSF2H
	nvpJW4Hyy2PBXI31pnU45VshwqYttPzya+jtSStwWNiq4V1AanWaQ/iC8TsJmcPXgRQ=
X-Gm-Gg: ASbGncvJ2hlZ/waUXo1aq4czoQLggvl4QCWoHBmAIQ57uj1rV32EpI85+CjMQ6rd/fy
	nV5q/W0EelxSoG9qeBXB9MLBpfUlvfoSfDZcf+ku7rAqZ+noHXoazr60zdUazJz5s5Ooci0s8Zm
	27p5d2bABPWGEsRFBrdyCl0hNlME1K20qPfGtnctBfe6vnmHr9Bw5obRxzvs37yphpDxeJmILkL
	No+nZmXzJzeAqk+So8X7XiQtg9Fr9JSuKWsic2HH1ePfeJ+3Usb2fEMZ8KvyD62RYI7oCZjNuxk
	LJDC/GT/CUPpvCVqy0LauiE+KPUFO3wLL/W92R3hZ5z7qf85KAtmS/9lEUYxqjqnDXiqGaTqM77
	/snGZJMejghV4zJv4Y66drhkPSJKYT4VsMsD6KqOksPXZEyiw9FY=
X-Google-Smtp-Source: AGHT+IG0kvBEZL2UesWt3Zf4jl6C+rIEnaQvMgWf27eK5kYtzg5PKWU/1867wQV0n3ggQ6xsWgb06w==
X-Received: by 2002:a17:90b:3512:b0:32e:345c:54fe with SMTP id 98e67ed59e1d1-33b5127ac29mr31362526a91.20.1760392576576;
        Mon, 13 Oct 2025 14:56:16 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:00 -0700
Subject: [PATCH v20 08/28] riscv/mm: teach pte_mkwrite to manufacture
 shadow stack PTEs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-v5_user_cfi_series-v20-8-b9de4be9912e@rivosinc.com>
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

pte_mkwrite creates PTEs with WRITE encodings for underlying arch.
Underlying arch can have two types of writeable mappings. One that can be
written using regular store instructions. Another one that can only be
written using specialized store instructions (like shadow stack stores).
pte_mkwrite can select write PTE encoding based on VMA range (i.e.
VM_SHADOW_STACK)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e4eb4657e1b6..b03e8f85221f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -420,6 +420,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -765,6 +769,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 8b6c0a112a8d..17a4bd05a02f 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -165,3 +165,19 @@ pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	return old;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pte_mkwrite_shstk(pte);
+
+	return pte_mkwrite_novma(pte);
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pmd_mkwrite_shstk(pmd);
+
+	return pmd_mkwrite_novma(pmd);
+}

-- 
2.43.0

