Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861BA334C1C
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 20:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991780; cv=none; b=BhaBcbdv6bGogkHoJePBe29hOdLEPtL5qEf+eLioPFxamltye9n05N+rCFNF4l97AyHMi0I6KM8MnnjsKG7XK8KRo9jYnB/ytoWH1JlIerDle4x0ObVUI8JfhG/tXDCyBCzNAQ9sIwxnwUIX8pfhuZaVlSCcc3uzicVf0fh1KTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991780; c=relaxed/simple;
	bh=vcSFEpMi188ecJ1a+8U/vzSq8fWrIzbce5udSf1uoe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/x1fi+J/FThEZ3LsyM8TrO3P0jiWdQSgEmSMGlcqi3Euo2dDd88Wyc1Y6I5i2UtenTHlEuMMfbTxOV8hoyJ3nYQGJuZeGSpKSkSpFw4pBvCu6gO2CT0BJoQ6tx188MkRU1dop9pL/tOEDYwkgLHJqU1l9xSnOU+RA4LtTu3md4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=XxfPOI9M; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="XxfPOI9M"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-290cd62acc3so42698585ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 13:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991778; x=1761596578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kF1sb2xLtNJ95mXf4y9UUDJse6Qaa7/WyS6RZ/Me9sw=;
        b=XxfPOI9MJN9UY5fGh9Plxv9DBnD9x2MFUTfZdD99FqYhOvM4c6YwKrC50tnyoiiQnF
         uu3BYqEnGp+8VZrD8pAgZ7/odUIiExkeqc+4d77bQCsGh3A1pp5tGGgpihjqmIEaA6wt
         T4DPcWEaURvmzXQzw4bDq3nr4NiFR7txr/Bjp3exjCxlc7Hbv6GUrQCo7rBdsb/89m+6
         hcrxSGXwklbqzNg4mMjHoz86RLvVPvJ/3jzS+yMNJ2uMqsJRKhPOnVRHkArpdoFY5Sz2
         8UzziOQlkg1lK+kT4V+gbxVzv2h0G5rQBo7fp3Yl3lksoaw4MAyvrrCxJEiJ7suj7DLT
         DxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991778; x=1761596578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kF1sb2xLtNJ95mXf4y9UUDJse6Qaa7/WyS6RZ/Me9sw=;
        b=wILZ8F8WtiwNirq9rpdkhQEGuqwPWJFREZ2Xtl7L//JqsjhoT/ZtNBd35GhOnPcwXq
         Ibc+m5OpN6nJx0PlhYPTNguxtpGD4FkeoKOOSZOJ7DWNaS87aVDMUhZcjSkKCgVWgiky
         K98GfFvSSqIQv6ELnhfO6Yc5qWsRIBGighfzSXJznlvUmLQXqdhZ1HZvjysDQgn2Oq+P
         //WMxOm70lkOYO7sP4m1YwhwwdMoD0cTWavVCzf0kYwJnVhI/tdtHqWetCb5l41ECnAh
         +3AmpJ2GSEbtKA0fWnEG3XEjKbg0+a3xykqdBRIwxPI6e0dawzxk7EjGFbTje2nkS6vo
         eFhg==
X-Forwarded-Encrypted: i=1; AJvYcCX/5OzeX/8heYvCIMzllFaErGyTtETJAZKgPi8NcS7nbjLx6Rp3PbSIEgDeSCbohgFMVRoZg6JIYgWcDA3d5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBDKJzoD7r1COM7UaVmyq924+CVwn/zw5v2veqj4Znq4GEfIbT
	k7RT/qguB7NJj2sKSpLSID8zyNqTTx/5GmqEsGo5Q04Y/OKcQ/34GInQvdDaRIjVDcU=
X-Gm-Gg: ASbGncvzz2AAcAkSAMq6gsKkgsTSYWLFDlzzk1YOA3g4Y0NbYwmTo/l2besot8VCNYi
	xKY40od1Xb2ltLWijjOFpXlq424jxX31IutSGWJ4fS+tuZwAf9Ksbeepmny6rZJWDhmdH4qrTZc
	x8cWT9CEw4YXjDnZff8oYkBkGgGJ+rLKP5Sl7cM6zQApbnDaymTgeA9oOg9L9Vl6buA3ZQ/hKcU
	YvFDqughZEK7N1LenpcXsS9APcpPsE/5Dfxam9v0zTRqk1Oj1AROV4O+AMIq3BzZO9UPA11+Fl9
	JmkKoWJb7L3zEmOcdWtpDMkWI0ZW1Yt49x69qrbwKKDFev/ekLgI4CEz/vxLkLQQlZ2EKHymyVl
	7cB7Sl0dfX/L3++vmXjgQLN06ZaBSJ+jS5NdkXKFcRphpk8zez6Kz8O6Gp1KFLsTeQacSyFPpkm
	FsmRBveDyFXg==
X-Google-Smtp-Source: AGHT+IFjI+Eo/gAZahP1YhdcXcRCsIf19VRdgdLmzm3oNcVwOeVwlLY6tG5kcvmHgKRdDvnCUjEyIA==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id d9443c01a7336-290c9cf8e7fmr180686115ad.12.1760991777715;
        Mon, 20 Oct 2025 13:22:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:57 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:38 -0700
Subject: [PATCH v22 09/28] riscv/mm: write protect and shadow stack
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-9-66732256ad8f@rivosinc.com>
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

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on shadow stack pages, clearing up W bit makes them XWR =
000. This will result in wrong PTE setting which says no perms but V=1 and
PFN field pointing to final page. Instead desired behavior is to turn it
into a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b03e8f85221f..df4a04b64944 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,7 +415,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -611,7 +611,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t read_pte = READ_ONCE(*ptep);
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH

-- 
2.45.0

