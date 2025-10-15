Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96630216D
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552042; cv=none; b=T8otg/OUOkJvjB8Aa2J6Pf0ADVWpA1rPBzVQ+4koaBNfchkfBvM+xoiqmFLpSsDUj3j06coxIVrVE9jvUIIIIn47TM4nMgcwy7/ydGoZzkWtk3ZzXQ/22wzDqFfX7mNlJtJPV12+S0p9Qh6CtVXQnuvK8SdULNzHZWS0Uc++5MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552042; c=relaxed/simple;
	bh=9AtWvDKQ9q5op9YLRgkrDiWaHEAhrRbEgloHu05lQww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTA23LDAKtVhkZ+6qdgX29k1HSEDbGjO+VydUW5naJXWtohx5BfYMBEMyBUienm+6RL39ZgcMgQ3uZkhSMmm9lxZwObyjgPGT2KucOT6DuiCr/e+EKK1YQOhNIE1oFQ6CeNJVx29stoC+Sy3W5XyMlvl5LKPq2JIN63kowk2iV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Exwb/QXP; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Exwb/QXP"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so92350325ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Oct 2025 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552039; x=1761156839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=Exwb/QXPbXfTOGKP7tu8Nf+GnckXTCgO3BYpd7Cp6ZZmF4JBSu7v65V7OQg5628JQh
         mrfP5+WbGWFkv8usSO0tOTQksriHHmb5tatsmPN/qWRpuZ0rZBv2ZNzgaURgJ9O8asIX
         oQqa59/xel+mVz/UP9DgoS3liRs8q3sI8sr8vud2xzFq2GZ9oWJnBa1+Jmj2LCarrFrw
         +H+ZAu3u2G7oy0u/rAi7yXtNm/xumj99wekv3M6e1Fc7YewqajUcJClxNcSqenB0HZU2
         pWYCRNiKDBePIm4hyRYQMOTlANSE8cU3pE8w8EKAQ13buypysM+OTiB333atTIkCOS2O
         Smgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552039; x=1761156839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=Sh4mJOpw5y3NJUrwB4k8RKDjnvygv2LMrSFZzY9x2V4cV6/ascWCXy4E2m1zqHty7p
         M69G1c6RZ5PFOFUUWnlkP8DgNe6lIv68/RUTZq4oLy6odAlE2v7k+0AELOpJ+7UZDLeu
         bziG/7roPCR/+xqXqaeDg1lfpfJml7YJAloghAK+3DjQUnQnIlG7Rduk8bzWCdMn27M4
         HAeReki3aSjNiIUj0aztGJOegOQ4c2NHoglxfiQlVPV9Ue7O7JPnyRbliYhPGUSy04Lg
         HqmsNlPvUrq3fDkyf6kyVxEDKRM1S3IgLiufIE9TAlsk5BWmgx71c6bYAaeciZ61L5ZO
         nblQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSKd/+XwexizKp3aPCQ0eA3xM+AlBorNysIBBm8h8RDX/gkH2/RX9deeYRsReIgcYmglqbnCWi7lR/0eM9Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6ntWk6mqRJ7+nfUUcyybdcrPbLRYcdZcHxZsIpinQCbtIVvJ
	iRBDHqb82S/Qst+kQxfxO/85Q8elXradqljqBvWmw9wlUTw74NIPhx8sIay6KrQnWRA=
X-Gm-Gg: ASbGncubY/WMRYbg75L+Wh0PP3lBXjyIkb+6qbi2fp5CnQST/LBWPpWYlpuvnbpzpO3
	z8PmScK/OXO/Q+APZK3nt3SLydgFyghvwo0BaZ4POXNAMBqvS9tqIdhQqR9Y92KuNFe+A8jRMAO
	E3Vdn+Z71jeBZCmMt1kz8G8pWjUnqq3wWNRO0OnUBOTgoOpcFQqlPUL0ejl5O/xTB6B9R4ykd+/
	lTGlgwSQLEKHendaqbSBSzKzDVW7/icy5JlctnSOtIxI44LoE1ioJUKGtd616T+6n7l6JC0e2wn
	YUX6aAY3STAYyktFXE8SZSZpGSzSVVXM7TkkzvYNAQgY3foWzCv8UbmyuyRR4vMI84gXydkkm5J
	oBRGvwoIQOjB6EVvCF1fp8jXbnrTlx8LRVPUGo7FqC242vPj8fGQ=
X-Google-Smtp-Source: AGHT+IF7+0siZoxu9qB67nOXjy9vTyzrCE83G46axDJgPfnYJq92ADj9EdTAyl+KZI2DWODagqgyog==
X-Received: by 2002:a17:902:e786:b0:26e:7468:8a99 with SMTP id d9443c01a7336-290272c18e1mr357750345ad.36.1760552038791;
        Wed, 15 Oct 2025 11:13:58 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:13:58 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:39 -0700
Subject: [PATCH v21 07/28] riscv/mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-v5_user_cfi_series-v21-7-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
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

