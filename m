Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ECD30B518
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 21:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760392576; cv=none; b=lg7k3cIJyGDLQtFoNPJ91jkSNSk0JbOxpZ7rhti9CQVw9mn4Bma0JAsIqrk2VzXKpEJTvnXOWLIGkBvD0XBFk1rEIAtlJRArG3OS3ekXnEQBzE1gez3xCPGRKRGZAmDFo+wbrLEFAbN0yLDPuEBW1cQczEQCIIjlo8+Qilbplko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760392576; c=relaxed/simple;
	bh=9AtWvDKQ9q5op9YLRgkrDiWaHEAhrRbEgloHu05lQww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsCDsvONwkOoGgIKyWjTvJqA9x+9pMRq+k5iIy6Yz5+eBzpiYmy1G6khttGoXciuWMjUqhG+PIXHGZvdAZOqVZ9N9rDWDJtGeM4DyBAsMlhzRfwhB6OGZ5rdOIxZQ8ZrfPI7P9XhDT3eRiyIWxEBaHZs+6tnJgG2buPtE90Rc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=QBUEKLQp; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="QBUEKLQp"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so6604598a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392574; x=1760997374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=QBUEKLQp1iPNpdR1b7MEUWSC0iuUvWmpOPfy+VUuc4aXanzuH1NwJBy58S8uHFi0O9
         jKmVAj4zze4J9Wz5k/q808mKT8ro65+A6Q3p+Z01bVlqRWSBnTj7YJ3mLhpYrQ+xKziQ
         CfgybQFHbFRQE5aLRD9ayodStv2sd0DckipCJJw4WwDdZdd8R4Sbc0Fhg91LC+hbUIyx
         QKz1xXAuHaJOdtnmByvYadKq5sAhMnFzRSMniyNlsxYrqhq+616fjXY862CB9vawC19o
         QcdH7k1Y44h70Kz9hdjmz1izdZRtiqqKgD3L4gFrRFqV3CXnQj+DV9lMMbxYf9wvQ6aL
         TOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392574; x=1760997374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=j15/8UWeSX1L+lMwqEjRdBLoEJDUuf7lityr6bBTzoD3MY7oT7NzbTQdkmauUAZa5N
         ychGYiq7BkzF8pypuLfv2/uE1EATTVWG8mMesCn0ujPh/w/kjVX0jS8iSXS/x9HIxXKZ
         1zLNi5iBNW86c8tpdNc+Ew3S5wjCZt00/Nhn8rZSOn/dSVJenv4DJmvnEebNl+wQDWvH
         7o21Ms/7EWtUjDMqmIwUegVrOeHh766vKhussbqkR8sviMG9wcUYCcByQZV2fhFVVddM
         CGUwXh8LFWApu8kmmqgWfv9ZWw/jGsnTCTjoqHR9yytVWZHiyXrXlqsMBgYP+TbxD2/A
         oB6A==
X-Forwarded-Encrypted: i=1; AJvYcCWhmIcK2EFD9VhzR1ZXjKpDxIbih7qe70UCcphQ83/RXSCf4DOBPfnFDH22zj/hjDPHE03VbBKxtZubN5mUTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBkjzPHgksp6c9WGYKuiiK9ZRkx+5ACHFNyLCo6vSog3mf+OiN
	0eEV5+7ykBJq4+1btyXeUg5/u4S09ieDUmJolWe8RN1KkosZ6wtAxvLJAlNgOcmvYC8=
X-Gm-Gg: ASbGncv0kwIqPxQdjWHWyqxNmUlGH/Vaj9E2aa1stkQx/QQIvKV3WWfo79cBXP9fCod
	x0VE+qlBSSrQz756EC9FKFN04yyBTKBQvP9hjPQu7qPBzjclly6DfXgqbf1/IxilxygAJKunnGs
	HoNWnlas8APyvA8juRy4XcpgqIfRw40pU69ZVwLdKPPjGpG0TT/P2gyTpBFLUW51UqujyfbiKPH
	u5KP+BZFA8utv4yZtUcSkGaxQILPGJLsUUy8pu2lDK4GR92NagWraJN5Lxu6ir7/tbRkROC3mR3
	LaxhfBGwY0CwE4DSIacGWJ2DD0ZDfmksNv5slB6MI5ucLJ8AxhZlcdLrB8orsEj5nY1lCe4aitK
	Tn0Z3oDtSQobCUthTLLfZ73+NVemB0MS+B5gJp0RTJYpFiCUNLQva+x+AFYT7YA==
X-Google-Smtp-Source: AGHT+IEUAWjhmzUKMOgHv62clTaql2Vz2Fmw36KBCgN93ODbgLaTEoxZmk2agT6d2TO/fNRpseH/5Q==
X-Received: by 2002:a17:90b:3d87:b0:32e:d011:ea1c with SMTP id 98e67ed59e1d1-33b51112272mr33908736a91.15.1760392574224;
        Mon, 13 Oct 2025 14:56:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:55:59 -0700
Subject: [PATCH v20 07/28] riscv/mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-v5_user_cfi_series-v20-7-b9de4be9912e@rivosinc.com>
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
2.43.0

