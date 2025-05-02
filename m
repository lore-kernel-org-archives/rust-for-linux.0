Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65DF26D4D8
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 23:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746228703; cv=none; b=Jerwm9YbMh5mqpBBzjW2imq6LZYBGsyp5LJJm5z2rCcb5ZlZBtDJKHsC5/1m2dpdyuzx9fk7IZfZZwh0PChU75V+9GSlg1rSGdD3evS8uSemHCUejaxFj3kHVPh0zcs+aRIGupqnSkVpXt97NsbHdnSJ/hA6MfAoem3qLgfweb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746228703; c=relaxed/simple;
	bh=ZMNfJGQcTcXW+Ox6hYmgZeihjxgbaJ9GC8ja8XfQDIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3h6FbzGVo37xAjcCeAYYOroEqB5IyjzG0cDBz98qOAe48nZSvHMNLvLN/MJRMDZB3PC+1abpQ2uXZZa4RMXmXJeC4zqEFOlwws0w0in1as7AnXvphvO//MaM6nTmHrDqM2MEJY6xb29MRU9Pdi8z56ZBq7IhP5sBF9AiCl2sgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=18HwJNA+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="18HwJNA+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e033a3a07so28822685ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 16:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228701; x=1746833501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=18HwJNA+jNEjHssSdz8k35ksx/YcNamXZ509Y0daT++K9avwIxdxcPPuFnO7T0GBUY
         vQMdvlme7HIxYCrmJxgiS18xpMt8El8BKdM6lN5KMM6iGwPQnWTXVrhDac5PjVMlrkeK
         oAn3trOAOHyQu0ktns8YAoBKtY3uPer/pxjrYRX97jeOzLFTXP1aly65Mi2KQvFPAFnK
         3TMNxoo8dFtkpwbP0pmWHW5sLMx5TDqKiBSQ1njJQ0V5vo1zf82AK8Qxoch7BXGIaORc
         KyV5mfFc8zeBDU/LCvUkN7Kn58v1ePG2fZR3bLhH8VqlyuwVurW4WVOhsq5FffkJ2aVJ
         cDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228701; x=1746833501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=ab4k8lOqrS5ppde3uE6irGAV4fAJVTGWGA5dN2xK/if4F05cWEWtrnDvgFTXk8fby9
         HQCX10DML3p6HQfpdQh/+rZf+ZR7KB/aqBzuHyMVB0u+mgREDHcRPkWhgDLrVFQbIqx1
         rOGwOxyWLqYqXMl6v8VxB+xk4uToIzUD1O1U8M3ND8L8ufVZqp7fZpgeKwHkN1bfVUD2
         7JdoVo8x0teuv9kxUG3xrYrRFHy7AHV6upuzHOHM+Rpu3EJktFOQlj8xoWVJM9oabJ85
         VtJUAUHhW6pPy+A8iHJOFpg0eIwkdLIs7KwRoA+fgwJiJacQDQ9jWiemI92s32rQ+i2y
         bFDg==
X-Forwarded-Encrypted: i=1; AJvYcCWBUCk1txwNJRjPx0owx3B4l1QCEbYMac771twTtvZ3FOrXRqduthwAp0tp60QAqEvOcY9+PZq0LBzgeembsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyQ2bmIWhA29hYO43egl6KZGnTFsjkaGw1xibbDbmjEJY2bxXB
	zq3zBZnKddKnH+V/ClGvozw3tMZTb+J//Y94WK72J2N6Hpzzao4DBOU6kBD9iY/gYNWENrtxLuf
	y
X-Gm-Gg: ASbGncui034r6w9yWJMhKBj7ByUw24a4FB8IhmFeQIh7rz7vxAOPTYujKI6CPQ7Memn
	eR1IVMSDbVBao2mieTN5m59EfSZ83zYkvXokXALM595svdOKhEhi4mDjdrfiHuPQ91RWYyIxnOb
	N7pXaXUMT9fWce0RGkX6Rghku8lDFUKtymtmZi9coJ4ACrpPmVwSCdPAEYr5AWAVtA5OLsYHCDn
	N933W770drHkF6qgc5ngJ3Pr1RJuEgS8lT6oHZgW+1VCdjSSk+5QeWy8MP/NKgyFJldLSK72Lsd
	ya206EFY5KTyzjjPX9gmoIVI6A3UysZZojV2h6m13LfcahayDg8=
X-Google-Smtp-Source: AGHT+IGRr6wQ1qcGc/lz4VxDCk43KskABVIwgRKbdbOIqZA8WBWJNWwxAj/SPcLzrSkmv2eXNnxADw==
X-Received: by 2002:a17:903:194f:b0:22d:e57a:279b with SMTP id d9443c01a7336-22e18be2486mr17248525ad.24.1746228700973;
        Fri, 02 May 2025 16:31:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:51 -0700
Subject: [PATCH v15 20/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-v5_user_cfi_series-v15-20-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3c2fce939673..9bc96881dc9b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -81,6 +81,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 55)
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..c86cba0e4506 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICNTR);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);

-- 
2.43.0

