Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BBE27E7C3
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 00:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972252; cv=none; b=VscldLGsSeTHgdVkE3WRotLJwYG9rHUAzkr29MtHG0xhqQu0qTtUlDQyjC5+bcuOVqEnkw8YVG+HGZvWdnexIfaQBbKRr8GbDL+LhrGUFtJq7nrR7Ug4jKDIemxICBkyDYNOJZntMcazDpNiTV2axyrX6TWzCuBCj502SvyxH0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972252; c=relaxed/simple;
	bh=ZMNfJGQcTcXW+Ox6hYmgZeihjxgbaJ9GC8ja8XfQDIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkO+R/kcMP8B0G/CgUodAnKGtXnttaEQUMjbssQ2X7rKvm6pKOZQph1HrYEmbRpSFGo8ANQo/hIVNo33FZraMFoBFVUcud7RDSEYsU81N49K3vs4be1r5D9NEkae1qg+bbZ7kMMaA+zfcS1W+QgC/grUgbD7MURKc+lrr5ijYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1qd4ycqV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1qd4ycqV"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227c7e57da2so56965525ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 17:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972250; x=1746577050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=1qd4ycqVVXV6gRzk4zVnmBc2QQTTqKKLOW1HxqoQaweVitluUX6xSnvadAO2/RShId
         JT2Nxbj8g897Rj8FPcqiUS7Z2Id54pR+cRDSEYnBUC/v+NBc8G+kuRXCIv+lW60lT2Ff
         qbfMIESN2N1ndYXKb9zhvzr7PmIabQyPxOh7sGtXodtPU6LmfNH7+nCLF43Wm0dRR/Mq
         +w7AiRj1RkmmKGBBpm4SZAHHOWYzUgVYYdwiWnDNfwL8YshhhvN0znv6lx3dq4PQBYpC
         rLBcYhQvfq2pfvTmSGyygeDhwrB9b8XpK+xsMocdwsnnPrfec+QEHirFjH+hnjUKZl/x
         Iflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972250; x=1746577050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=VUYnSC2yDSzzTZE8vQgV3DMAoyVhi4xvpjTwNWhfvIFq68uJK90oBjZOsJNWUTHeia
         qUPCHHEOxPYgGkTRu9YsgcfmlXeuJ0BTaRdDzbIHQq3e6qG3nxWksQ5ZD2Pc5hFJk3XU
         rn+ENM7sy55/blIfUfQb+3VFxYuvtxHhFYWoQo3N4x7VZt7wJaZFn8NfRqS5xpVC+ihM
         pi9S+n+sRGKZfJL/HmLs40ehm/BJrJj3jytAmd2Jcn+2Nt1lpn0VBk4/KXd03kj1Rcxd
         dlz96o8QjS57VKj6XDYPZUNUROgde1dWILkp7W05ObNISQFDy2ZMoBqdCpYiXWor5JLX
         QJ5A==
X-Forwarded-Encrypted: i=1; AJvYcCUhQID877CLpU+tLt6D7oL8ymWT2Lldlgc1/0w1ztXRDajRb9XLgSE6eqQR179VPtZyGzLrVK35dVBTOcFIAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLKOFtCWT8SQVRzsP4tUKfSYum+K0M4jo9PwjQsVJ3eKlWCfe
	+fjwYH+Ntocd2NbOZk4d73HXsuq2ejp/Uz7KuHPpy6PF+Mvd8dMP5LjmFILWFqU=
X-Gm-Gg: ASbGnctu/Ouis1pViUYVsHl7dCs5LbJej0fs0Q7bx0fAjkJChpr3OAXPCt9pv55Dm7C
	blAK6dZV7yEtkSo+AHjkwYSkQqpnpwIOO/DVFipx02DrTV+OjYH0SuFY3ZSUNt+TQ8Do8X5/tLV
	JQp7T0oE50PUnHHHZv+Cl3Y71uPv1a5f/xprgeiCcYpzBiHG1hMNDgznD1m5WNmSTCKdxwUyBak
	WxujntYvoV3q1jS2UYt1hwVJVlTeWrxN2cmooRGOemPhzRbz59bqGERFyTN4p9N1x8rpEeTQVm1
	JjjbsABTml9U97BoERuRRYq9f7tQqyaScOJehzu6dfbWy6YyKnY=
X-Google-Smtp-Source: AGHT+IEv08Pi1B4n8aq/gama+rOHWezI3b9NXNMRL3JsLWbL6t5wIuHJZfTFW7KjphDiUJGfsha+Gg==
X-Received: by 2002:a17:902:dac3:b0:223:faf5:c82 with SMTP id d9443c01a7336-22df5769b69mr6013935ad.8.1745972249788;
        Tue, 29 Apr 2025 17:17:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:37 -0700
Subject: [PATCH v14 20/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-v5_user_cfi_series-v14-20-5239410d012a@rivosinc.com>
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

