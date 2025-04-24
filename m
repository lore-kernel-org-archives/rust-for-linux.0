Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4EF207A22
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 07:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479247; cv=none; b=IBgzt4oW9o3OdRtJk+2FI8BBeYFDXi3SlB1BrAi9M1o1sLQBYgeqpoMtHm7ers+PGkREJZE/ri3lHcH27j+eTeIvaR0XSR9CE0UB6ck+bm0E5EFGKYYAYnUA+s8kA4riKxIRffbWYkF/aUJ5Po0GitsmiAK8PjkOKa88+6S3LpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479247; c=relaxed/simple;
	bh=R7oEwbD3/y5k7o3aqwxIBGjnZGUlgVxW90n9VyI9wfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJTwrPO317FcLuusIlMLT+/GqNG8IxYQJlF+UlMuUgOr99MofHi5iQwkhj8jo58nQ1bqP1jNmeBec15eJuDGEPlV1mfjk6m8jGxPfs2DtN2DbbV0sDfqoyeYeAnuoL3Ax8Z+ME8JPNMu2kAbxZQHdoCaPrj91UcOcmKYEIRHKGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hC0kaWUU; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hC0kaWUU"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so527200a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 00:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479244; x=1746084044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwh9x6lD2MO9lJ//kvPDhOJNTq6ZrmIfW44uUh8vro0=;
        b=hC0kaWUUvw8UhWRSNIv3VogUZl5cUyWKZmn6QViXD2eyqwp4Ov5EEJHafUNWpcedgQ
         bOPoxvR07fIIgDTC7B+pi8+EuSx2ZeioOjg/6N7XZ4hX3qO5MgIA/5zZzONP1LzjxtBz
         zIKnwNx4kPgpDLM19/uy14ebsFN4Fu6h3BV68Zns6GSZwQP9Dboz3fuJ/EBwcO5SAsme
         5ijwjAzBdb5fjt7uVw4XqZd4RrQbiWs6FwHOn2w2eylm1WZXQPpahAQIFD/5JcZ6EEEy
         RP1DmzM5dRhopw2j6ZjPw+yhQJINjT9e3GG9nDHDrBAhLcxQ2Sp3ZLNk0glcB9qCX02X
         icGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479244; x=1746084044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwh9x6lD2MO9lJ//kvPDhOJNTq6ZrmIfW44uUh8vro0=;
        b=dYzqZVH43uTC3QfyMN0gVkFmo/lvYe4gHJG+CCZTxgzXit8PsKLhZjQrS8nTEO1LDS
         DT1ySDammta2mnc3eeWbB3UekaWZ9at4PcQNqXz6K9k4FCwrj1iJVhcdM/Vz+KD4jcGE
         AFhqyGcl5xCb+x2TE2iyLNe2HUOQ2eaHOd+a1BlrrongOS/PVMF13fWvs/zNnS3dbn0H
         IH3VMWZ29bF8XHT5QR5KRSZtHM73UuAkTDRqvzIfwHOItQTLQ1O0DVE2gCt5ahQ/KeZm
         Ei+nwLij2Xjp4JIOgkKLDHZEjHGEYJcumrdym/wIgWV/Sf/9zeQfQ0hxSekvPPT8sV0E
         8RFw==
X-Forwarded-Encrypted: i=1; AJvYcCXjulvz8tO6XcMvbYy4YAlXKoy6kbQRMjdQHHkCi/mzVBxd3iVNxreahFn95Ehtr4YadheBSJS5lCiwMr9nJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzevz06EqkrXNDNR6TVmeAlY1EJfVN+kbyADUYPS90fEOEzieXQ
	+DL0AA0oElgYo2ZH8TOSmbwvww26dqlMjfRGoTVjVUDNZmFu76qRk22/2PiB684=
X-Gm-Gg: ASbGncs312xzRDRMu0GEhtd7Hz9Otb0ERA6hLN4Gyxmco/bp0pthN4Dd1G3/i+p8Pkj
	I5G54Mer6s7UkmhAKmmX9PJhoXj0psaqISrZ9ICyZwJP54KVgvk+uR68yPUZLi/5fWKU5d1KrNW
	/0Tsm3AE7ioFYgXQcSITFCpfI/5mFneDM1vAMlAf3HYQ1m6dLaN8KbuARMad++5faoygq5UZ6Uu
	7r6wet1kzNJsiWWF0rTkzEz6ftxoym8yXWopmYQl8DbIoxmbil8Hre5/D7rxBqZgs3SjjoOihdZ
	TU4LvaOnNnozrwDeMJwtuVQQX/D/iL2wod+UGkur/5F4EwZJjSQ=
X-Google-Smtp-Source: AGHT+IEC5A9t3KljY5+oPEDMiuLjjOrgYWWUXALnuXXsSvtsWmrcbar9Dh97NMWpjDuX0nmNsvCGcA==
X-Received: by 2002:a17:90b:6c3:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-309ed31aeeemr2671578a91.24.1745479244474;
        Thu, 24 Apr 2025 00:20:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:44 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:22 -0700
Subject: [PATCH v13 07/28] riscv mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-v5_user_cfi_series-v13-7-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8c528cd7347a..ede43185ffdf 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -421,6 +421,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -749,6 +754,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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

