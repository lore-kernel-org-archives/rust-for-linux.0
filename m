Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0922834B18B
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 18:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959830; cv=none; b=hYnDtx4cyXu7jfm/xRgOjrmfknbGJzXAHfNrG3BS6avAV03z6pzp6ZQTMfb1AdKAwm0KnfcVMHZgLazelAxorhrvm5fHlnrkYGKgJZETlQdkANQDfNLf180UsJltCsHSpnCzUG1WMzLIjepWB0/hhP1Sp65pMbZDNh8TdUuPNhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959830; c=relaxed/simple;
	bh=nBM+gKOHTmPMkti0DTh5flAX5grcW8t0U+G6mikLn4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfyzLP7LzqjFJkJMofn9JbnSeJMuAVuxKqIaVJFAz3F5T0POuBp0tVvtr9RgNkod7qRPjZPC2YQQxxuaLmXrDGJ+LgRpFG0T/3dUZFRUrftbrxHw7ZxoksKJ7PqMS6xhOn4+dbrbQVjAilZ63qTDDZX9Y9kij5Unyxu0ZRkB7Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Rrla7csw; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Rrla7csw"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1596724a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 10:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959825; x=1765564625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FldpuJVG3boWADnTyrci9WEZv61t3vqu/iLtDVGsedQ=;
        b=Rrla7csw/D4Y48tNeeroQx7VexPXXrYHUA8bEQ0w5LxZ/FELeyVsT0oBjyTL58vj/u
         U9RFzPUPVAi+m+XEU+hH6m3t0zDP+3juCIt5CxS1Q3tvEI4pfGqPCo6l79SQYum5TV7K
         uU2zLkbD5nwW4erP4JSRvDxQSZdpbrMoisFZaXaNo/I2fcP7z61jGdmP243CpnFBp+Xi
         9i2Tscbb0ctX2J/gOWL/NoGK90SPRYQ8H/fTUVSWmx9C800SxbXhDYxOWFFA06k5WpxU
         6j0qRv1tb5wmAYlHUyh1nbE7Mw9QwGuOd9TDy6/uoo6rqhULuOG0rvoenhRPvmzDRhPN
         3oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959825; x=1765564625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FldpuJVG3boWADnTyrci9WEZv61t3vqu/iLtDVGsedQ=;
        b=BH33O4/H7v+jxC/t2rNfrtdN1wXfCXf9dNX8Z+x3NZNx5bw05/vZLD2iyWR0OstnD5
         aOUH2a0BxmAc6XmFOZ5i5P2DIrTnQnJybBeB2aykU/Soko/fbLHqPzl9KQrt1ddPVFPg
         ZsHji7+hbvZ+MP7QNPt+BxZIYcfG5Jp71aB4Goe0R6QgZGwnIJbYu++6SuD0HyziuYC+
         +wc1DLXJxqHSJDBXrug+FOxJzuss8l1IMqy3sruKP3J3fns6BiqftQbgJrGzyEFWPAK6
         mgKFiAVtbyBCmvKad7iQsudLubX14JRIDbCTNvqALF36MvDlA1oWxPANSaXdWz/p+hme
         4f7w==
X-Forwarded-Encrypted: i=1; AJvYcCUprIRWEW/xKLqLpxlhJ7c7xUBosFxU32KnQTIHbONw+8O6O8wTb1/MaGgVakxg5YQnwFWVsOrl27yNNa/zGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYj0x9uTv4XylUkllAhP+jwiOPnR9wf4eFVBR7VjgpW86E2LqZ
	5OtxNPURadhm9oy3KbYfQmp2AC3F/n9GZ9Wu4Cyu+WMUMDZT2zbWpfGMj51obgkqFck=
X-Gm-Gg: ASbGncu5kNJm1QD6iQy+iSmNATJ5c1LEh7PNOycoVSRkwF/apPfKMQ8mXYZOQT0+S+k
	8lv0jL16oAX6b62NxPWVp1P2W4PO7RSILLzAzks16NumWobrDiDO0Pqv9lg2jKZmqBXCrHwi8vx
	e5RH0waFovF+d6VL2WbJxX8RLMGU9O9ygPIluQyE8ZFkV+MstNIWn8+0ybnC7xIzCa1lQ/VtT/i
	KI5bCPjPoZt7AlMV6GWVIbLnmztcQ8n/2criOx7M1zd9p8r/bFd/3SNO3SzLMyH3zpHrzgVqaYl
	Isjp3IBRMGW6JuItr6UHd4BeiJqElujEIDRY73MDr74yuA8wsZq1vlJj5n4NliWviuTXyDFKyLi
	SFHGuV3goLybz2LQ6wyyt/6pVmrOVJhkyVPWSXd3wRAZ8xlo5fsSjWeWHez/A5jdGhAKzBUcDvz
	1tZZliHIA468wsH0Ohj4J2dp0VJRHo6yU=
X-Google-Smtp-Source: AGHT+IHWIa+CUlLJ0qe8tt+iE2caT6nKD2wfDSY1g0hDmU5iV9uKmwprZ5K8BpaoIbktQvNqImb1UA==
X-Received: by 2002:a05:7301:60c:b0:2a4:87e2:bcca with SMTP id 5a478bee46e88-2abc712e3acmr123339eec.13.1764959824396;
        Fri, 05 Dec 2025 10:37:04 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:03 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:36:53 -0800
Subject: [PATCH v25 07/28] riscv/mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-v5_user_cfi_series-v25-7-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=1430;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=nBM+gKOHTmPMkti0DTh5flAX5grcW8t0U+G6mikLn4g=;
 b=oyiVB2mV2Xr0Lyb4BupLSuiXGMjHkUrkc1x6guHAqwdwHbYglV/kn8YYY3hQ4vZqsYqYf0IH/
 luTeFhKyqPYALE6hb1xL5HYvgU1E78HSbMsFrb/HbDOtyeGcM4VZWOy
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
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
2.45.0

