Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCE1F4607
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479290; cv=none; b=efkp2wOVbvwgIujxQvfMgWw6yY1CkUpm5efmtIyea4lFaU8DP+/cUzd5j+7Hom4Mfj6Cgxe8vdR1L7FcTgkE1Ha192IDvqLnBRyfHfznYOXLq6vs3IfJHD6H/cU4dCq2s32TX9lcfmMtxxvamgeBXyvUTVBueeIbxndFHhYCC/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479290; c=relaxed/simple;
	bh=zlFZINb76FMBoVli7x5G/rJ3gW2orU8ElvZAB3SBxII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqKWL6JmZRcdwzrYO6ov0vDFMLkUxdpFVwpOtE/PeCAMXpUFeMUwk8WNKsABJpsx6Ij9XmSZX6xTIqLZ/8VwthJc9u4eYPSjyI2OW+pK3EskPZ++76l/gaWEiOtSW3ZU6hUQB4ZcEef4EKP0tNGEL6eF1Wj2EpLCLMNF8Xp/er8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fiVHsPJQ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fiVHsPJQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227d6b530d8so6997735ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479288; x=1746084088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eeH2xWhp7150dL05xNnwhOrsm/0dm8O4b6IoAKLk28=;
        b=fiVHsPJQxvR2aPUQlNOxkEqQ9Pzg1OKJ5WeMIl/l12booTnJD2qIgl6w6yNcDtN/hm
         L1YPthvuL8ROd0HxvgxEBsyoHuMeSL1z1H17gkiGEmfGeAmc/l/6sneZzpagBKGOMy0Y
         YKkgALzOjYReeHhElSSzZHUc7ZUG4QGIPPLjaPEcrpFKFYUvQPImplR/fK/J66HFkX7x
         aIdC7gdUclq3E4TYuZa52wPYnLBpSP9D92Z9vp5I89suOdinqhFFAZ+pcBg5Pf+RDtKx
         ZzcsTb6I0Bx1yoszoP5Z630SJZx1qLvvAHBBMNZaqZ75fhYuFrLqU28vcqQ7PsdM7jRO
         31IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479288; x=1746084088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eeH2xWhp7150dL05xNnwhOrsm/0dm8O4b6IoAKLk28=;
        b=G5AX0++HatUgS4m/bVd6scIUDwru6jSGukr2pYHENtxA8LVC33lLlMqiLmNEOP6bS8
         9PAkvdy1IWHVhTrFuoau6EnYtFR67Vi4UYlnLlHyJlWHUND5MX69zNp9AeNef73SbsYb
         FGJxCVBelz3tGiVi0XXn+Ae0aUfJ+bytfR1JqEzYjsP+eFpw1zz0NmA/nqDpB0hx9z1I
         6j98E/Ol1cGk4hlMqwybjS8f/vvcEmSLWHv0DFVz8gTp48NjQOVi811Qtfxe4m3N9rEx
         BaUip3RubT4SHGEekPRhZrb+9pYm9VPpXCIkWqvZNtuoeUKTzKIO1GKnZ7icl1vCCIpi
         Ybsw==
X-Forwarded-Encrypted: i=1; AJvYcCX/V928CZs25FlX5GPnIXTrYp1TzSIlCS8Q1sei2Wkl05a/8gw3nJ1tInQ4MP3iR2iSpKcIwadDkRL8d9kb0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP2ovvulOJgIN8lQMTHM5jh6pvEh2J2PeFsa8gqN7jKuAzhfZ4
	R3l/fTluNNM5nyIl3AMZK3L2v1St521FPwG+Pdf8Z8nE+cLAMtWC1c1+bFP+2Cg=
X-Gm-Gg: ASbGncsRV5U/EefEPOmVMmv5ewaGECyjZ4L+EhQ9P6bvT3p3fdX+Y5FUXAdbtTD4dTf
	easDqSOmj+ozYki3c8eUK9hQSA5EAU3Zr6eZ/ayaQVNYf1i5kpRLMrXGdJFpOxiKW6pMGHDw4sz
	grVLtnnta/nMSn0ldBBJba5AeApQThLJ8SdB/kIG/Ju61yJSx3M8LAWFDpdlj8kx7H5UFmXLxDB
	rP/kq8Lf/PJdjEdN9c8KirC7/RVkeOPBLzLgCw546MDqDyRbB9b4uu+GgV1Z5Tm7YrJ3oQY/Edz
	mhfIF6J9JaERPUa0B5bbk849QQXL6FSStckQKUl9UKKe392rkqSVdItZ2/CpgA==
X-Google-Smtp-Source: AGHT+IHQaPNWR8AWB4C6qrLbgpXQ/uCnelvpmMXGyE7SN/TZw8kP+Kpttxym0RazMvhkr34F2t3brw==
X-Received: by 2002:a17:902:f64c:b0:223:4537:65b1 with SMTP id d9443c01a7336-22db3d99508mr26205085ad.36.1745479288201;
        Thu, 24 Apr 2025 00:21:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:35 -0700
Subject: [PATCH v13 20/28] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-v5_user_cfi_series-v13-20-971437de586a@rivosinc.com>
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c3c1cc951cb9..c1b537b50158 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 50)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 51)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bcd3b816306c..d802ff707913 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -108,6 +108,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);

-- 
2.43.0

