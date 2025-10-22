Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CE530F7F0
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 23:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761175801; cv=none; b=orWhukfkeDxOBXzSkgW4/3WFEIdBf5keHFBwvOtpp/dNHcUijDVx8xlikDCmDCoJ5IELx/O5IqHVy322IgKn9XZr5eMQbes3DHOB68QDoLQf9yutODYNuTU3wk7E1mUBirITnD292cKtXHTKWduoA0ZAwICk5wUsXKuFU6B31SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761175801; c=relaxed/simple;
	bh=zG1PvbsubgVB7UstpLjRtN915FxsRLFbcnYegAn0YwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSnd1NZYXiYOr69n9/36imfk4MDI6U3vnBV+MZKgFmQ3VoW67D4+1dXeva61ebqjDriyuIlTWl8uRrqI/BKX8qZf3q9wcIyhix/Z/puRzM23vZjZLoJ1v7gKbz69diwnAWHFbcMgCEo5WZJX7qXu/IRZFS5okQ9B7gxuaMP/yJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=XiZefY9Y; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="XiZefY9Y"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a2754a7f6aso195308b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 16:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1761175797; x=1761780597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=XiZefY9YC14Z4QiRms+DZWHai9TQsRuAlZteJAJsaA3smRfQwCfGDfq2ebg6mBQVQ9
         EL6l2vpyTJQt7rgwbIh9ZUq9VBG3MmtsMZOnmQuEEwfCSPpqM1gGKdxHrZ+SWdYv9/xp
         2lT5X3otdscMZm18GixahE76/y6ZdF57aCJiHUf8jqR5OF86oeTGcp+ih0hAnnAf0EWo
         VSTc7TMNI0GzW7vwsEiOAqCsKegymgJCDNuRgQcsjWQ3e2zzwHojvTyeYPXLQs3NYANB
         9Mip3poeFObV33JHQTuUVerqflkvQT/Ix1zJej2QLkP1muQVnf3XUpnLdXVqxJ26lDRy
         n+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761175797; x=1761780597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9H2LPWU9+l2k2EeL07qQml9rdpRAXigNCc3vd68LC0=;
        b=Bjp1AlBYRzCWjapveuwHdKJNKI+dQ/Ksrm+0yFMaWnBQlQ8YfFAb2Y5Kde9LwOJYPq
         elx4MAFNb4tV89Iv62IJKaog/QqhANEAMgrO3yWiBl7IVzfkAMdZ1XRLkNriKdYvCzor
         llH+kC8R0dOWAsDCXL739Lqt36G6XfUSgIT+Bny86RTdR+vS24EiOWKUJz2dIeofgnhi
         z+rk+dwQZTnm8OB08fZ1r0tyCxDjbj27e7id7HBZUaBFQ28tkn6vZBSDOMwAidnWtX3Z
         iYDYJDliJYYCZw/hxRyB15/TD4TQgIh278crkMNfHIgal8G2K/4yvzsptd/4J3P9ckPg
         t/CA==
X-Forwarded-Encrypted: i=1; AJvYcCXMmqp3SBw16QmXIZwFyg+aHtvHqvUOUrCJJKAXI5oLTQ+MhyMztzzZQXqHozrRJuw93NhgKaXB2VcZG9gTZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9UepvXyUppS+Gl4IsHp3UycPbFrvVyBQaWVdD3x/phECjTLLk
	wZ7Bw16Q4vJuxf1d0ODv4X8DXFkZQ/eqtzXBiCxCzx70IkVTdpFCROG/T96tYAPJ8kY=
X-Gm-Gg: ASbGnctlp1vOSh4/KvAkbr0WlDnFdz4hAs4VP20288aoA8uOJ6g59BpMxXQuLVW0/2x
	/pwecezFf6zRhYqdJzr+XAUOPxZfake2VxBC3KcmJMXbwqVwPeNVCNUbAIPEcIl4pKGhT1DRpv5
	D1KUJnN35DUXIUzZN1vUOUXcARZDZ3OzGC3GSnypSvC0kGQ6y4UH/F6tw2Ami+pTrX9t9ROlbRC
	8D4vXtU6lAxLSHAfLlE6pmgnsNrH/O9SRtkc8o5y2WPd7ZVM/8VWS8cckNxK73uErTTpjmZIQd4
	k3sXrFBnxSBAH48CejoaE3BielzhNJuLkxpREGlVxvzuDtkD3HREfoY92c4SVMfOIJN5kTF+5Lz
	rugzrKqiTEAlZPtA2eZimI/A8mSD51aVGaucGrxAwzn3RIrHYMP+DQNJvmqXQU08Eb/q84sZ6MP
	PKwbTBz4WtNQ==
X-Google-Smtp-Source: AGHT+IGvZf6To3hIDIuPP1h5aY9xKK3vy32PO8rqsycDPXi+APixSYDQ01ElkQxBZ+x0aZsdxcUr1A==
X-Received: by 2002:a05:6a00:6f8c:b0:7a2:6519:f90c with SMTP id d2e1a72fcca58-7a26519fb7fmr4281251b3a.1.1761175797589;
        Wed, 22 Oct 2025 16:29:57 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274dc12b2sm392646b3a.67.2025.10.22.16.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 16:29:57 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 22 Oct 2025 16:29:35 -0700
Subject: [PATCH v22 09/28] riscv/mm: write protect and shadow stack
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-v5_user_cfi_series-v22-9-fdaa7e4022aa@rivosinc.com>
References: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
In-Reply-To: <20251022-v5_user_cfi_series-v22-0-fdaa7e4022aa@rivosinc.com>
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
2.43.0

