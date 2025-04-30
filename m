Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678CB24676E
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 00:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972214; cv=none; b=qhxuGfNEdyt1B3AFiKxUTwS+4XnOZT+9bb24M1d1WtRxQ8lATK39WZwzb6fikdPUL7V0MHutFLTqwBPRTBfMIrZvbPFOsBzXOm8qEx7IAIFwFAk4a+n7G0/nRc6ixQ8VIemh/rAMDpas5VbK/IM/R6F0rhhG+MuiSorE0V0WU18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972214; c=relaxed/simple;
	bh=botWNQij/L5jZa9ComPdhZ+E/aGmcXy6ciNlZPypsCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=diVdrpwBX0rxVa78sJYVUk8OJpxfxbYPw+jSMbrvLiPjsaC7zQdHuy16ePWVvk6+DMlUgodZiCdBZCY6xugD59lhTlO0YFmUv/rdsis2vVef4gkqGIu5P8PP9H/KclngCQL2vuyalxhwPGg/cwZPq9/jddTa+82XzW5mjUvwKls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QAPQrGCt; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QAPQrGCt"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2279915e06eso76249095ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 17:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972211; x=1746577011; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=QAPQrGCtsocsCJXp2akd2nkHWsE4YtVEH8c2xkjY2omoIEZcSOkJaIO055z5U1rU1J
         9UvcUR3UpEtG+3iZZd3GccK6u6EEatQpaS84gRPe7wewQG1UcBQUMLN9XnW9or0OzvIv
         2373qyfDdJWssVvmXVW0P5SgtPmKJlvyjQEAjQoyao9/U26+wHLuoTIPFJK6dv6k1zd7
         aD/h1hEvLdOAm+0dFgAugWqW/viZvxCnZF7aUCK/R3t2f08C96H9smjSFSf/5TqzWu/d
         m15M4Vz4w+DNEbchal9GAErfoTHqFM8hPl8cme4VTngTc2Wiq1x9ZKbM8NygRkJ/RiiE
         hFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972211; x=1746577011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=E8lT3hbmvUSm4sxCoFt+d+zfKZjVWXSWeqPh/tIn9yxXudK/hZgtANYw8hQ6LU/0T8
         M9XxlBC9qvZ2FVz+u1uZbwbrPKmfIb5RAnEW+7xQo4ZYxawc2m1r/oxhaD68hZwSC6t9
         0uDI4val8yohOHJCpQ7x11BR2r0mGc3+BZAyQ5ZSG2fY2dFJSc8/3QzCqKICogGmP+PH
         +CVicxXRzLbKX/FC1yQU69LWt0dXasL+0WsNzxhEW3VU3ykF+yRd3X90RPXHvYiUTSjm
         ZSvdNOcmGaYVW7myAnBhBQRsXvMM19XnADgOGFTkGwLJs/2ctWq1Ze/HQPWqOsxUk6v+
         h5dg==
X-Forwarded-Encrypted: i=1; AJvYcCUjDbKG1rDxVkAG/V9TF9TsUqBuaIik4UVwCejKqHjaDj7w1fghtitr28GTKoXvOE2iuqqseMD8AWMqoRMpHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9w91t1NfJ/5S206+nA48G7Eoi8lvLVXFyp46ZRHKv0zz17Jtg
	nCBwwyqPAgrI27Yh9egvmF/4lIfFKS0LKZ2BaCQFIOOXgA1bj229X7WlH6p7ZYk=
X-Gm-Gg: ASbGncuTDa6exlwh9tRph1U0+oadKcEbnmPKFZIxHJI7FXmeyGUCLAsShcWbYXWutrE
	yURUZiMVrrjA4ZrWVoNjwX9Kvic1focJ/OuOOxC6vBUHDEr4Ananm+zkbfHn++L71fzxPcEK0Ag
	zDOCjOUlvTNN8D+4zSxIP/vFzSdQA+W5aAo15lE8EQIgQT7abdtjFhRMO8bR5i1PKLTkipfq1fT
	2lhW36HvpWKS2fdUD5wSvqp6KvjRkBtmrdAAcmEY/L+IZUk2qhB1fgV3GgBmVyAIEgx60W6SKIQ
	P104PlrW2irWpAw0YiCAnOQ1EyACDZMVDbcKy1tSPFRCfdHQyIQ=
X-Google-Smtp-Source: AGHT+IFy7GE6JtLObwZnxUszukpaDqp+5LC/aQlBmZqdBbVLTaJAIv9ljsO1vQI41frLcmnjPyCwjg==
X-Received: by 2002:a17:902:ce82:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22df57a6ee4mr7211325ad.17.1745972211261;
        Tue, 29 Apr 2025 17:16:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:16:50 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:25 -0700
Subject: [PATCH v14 08/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-v5_user_cfi_series-v14-8-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
 arch/riscv/mm/pgtable.c          | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f21c888f59eb..60d4821627d2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -428,6 +428,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -778,6 +782,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 4ae67324f992..be5d38546bb3 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -155,3 +155,20 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
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
+

-- 
2.43.0

