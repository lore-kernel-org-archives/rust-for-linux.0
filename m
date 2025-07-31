Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5027F178
	for <rust-for-linux@vger.kernel.org>; Thu, 31 Jul 2025 23:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754004021; cv=none; b=XyKx2mp0OMksLoImhwrCHJwNDfOastKGWFZ2dpMQLLDsbhXpCaIvGUQlRxdjhdDagp2iaw8etaVTD/e7yId1pm3lHNxAjwbyEPiTMxrd9mYLDSSSwdMP148YJsps0UKnj+6EeciQooWr3RCip1KqomPW03z06pwpJcHGkhUmyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754004021; c=relaxed/simple;
	bh=sFaiwL1IAfb6PyE/FjSk9WIwHTzXUZv50mJ+nuqII80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C3W6IxzoARN/3udt5gBDjW1JBAsxgWz1wo6Ik/INuVhM6r0mFuAX1b5QGubA5NTv8GsTQ9wP/vurAxVXpe2M3F4nuJmQmY4Cyv2Vcqp7GntiVqF2VVb+Q7Vv2FeXB8JwZMtmotKTxCskKgJK0lTl+ZGEgqeAfNdIwlUbEUc3IHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DWgm5KeJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DWgm5KeJ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748e378ba4fso2067923b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 31 Jul 2025 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754004020; x=1754608820; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97idN3yevHtenW1UOqMmzI1HJzUNQ+IzroMxOnaMZVo=;
        b=DWgm5KeJHRXq8rpP4vQ7Pz6RMg4EfxVx8W1fvDSahCSPwo6IULM6br2rHH8ilMQEpw
         CKQ3xB4YoQ6fJBMn6GaCWN0TaZFBkWL7rPIqODbga0cn7DLoaC0CwlPde6F1SMhP3vgj
         nTBXE9+lxUunhMnBl7vTeVXDrZqhEZ4EguFhWonILA9pd4dyKnDOgFv0aD/kNgoAPDZG
         M32GQ0QhRtSGao1ShAVt6N5Qfordw4y5ELAf6Ci78uik1jhsmfTI+c8yH88iMGtQvLfv
         ZC2ZuR925kaOYx0d4I9QqexbJlaABmXtTd9et6RIxpW8c2FmI5m0Q815CYXyZ6eblhqL
         6N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754004020; x=1754608820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97idN3yevHtenW1UOqMmzI1HJzUNQ+IzroMxOnaMZVo=;
        b=wCfCxx+wvbkqLwjMKmZ6okreG7iDpRuvWvLctx9aP0KN9A9+rvq7syUBEGiEjlhpGx
         9G6svobKV1pvIx5Vlw46OO6O8ma6lKEIIg93/4BCe9eRrIjriNHBWcGD/pFng0ncOxEN
         xycXRNW5VISG8OlZonnsKgV3MSTVt0YWNdUV7rw34J79/MInBtviZhh1qC/Kvd/2KqyM
         iWH0taKVaywcWQ8E4FnMywsgMmcngI3vyWo4zjwd3mI82rq4V561eTXVr70FrrXpLmXm
         9MkfDRd8GT/zaJv5BwFX6jmfa9MqDagwthbrMFBHFxbCYD00sps6mbI/e5UMy789+8zP
         Q3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUIJvtumMTHposdHzKEzuD/9VNGGFtIIByXTKutfZ+sz1TQRLUkoMWsQzVPRhDnthALu6HQ3/6NIDe293otQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv6XdPb/Jhmjc+FI++LtkU1/SrGlAiOWe1ZUveq3VczTrRGAgW
	Fs9vb/lFEbeFeucr0UjjtZ5bZDv5cypnEw1iT8nAtwHjXZ4NZHPzOjqI7DW3kG4icDg=
X-Gm-Gg: ASbGnctokHK8V10ZkZEhS6fIB2y+F5kSIVSD1BxDtRu8wjySCJRpGfUa4nfpTVUBW0f
	RshP6q88szonCFhlmf/5hRekVdI6eshlXOC2oeIsli48SbLSqhsqJSMXLUEXHD2e4lY5tBR92xo
	jBPLgjyHuAZyG11QSxG4rI+EoTqwtDzyn4AhEEX+m6N1R9RhXNtgbT42TTh445JK/tsuoD5jc1P
	W6EXBeiNgl5W/c8HqAGtGgpFogCSYCvQIMExkOf/cD2mr5iDv+QQ8pVszg0iVeeUrO8D+37ZKG8
	P10mii9eACTRtXlzqXOVvLK77xKgz/lwgQKTiYv18KgTjJA5i+brFDbAOxVQM3oxQI3L5EB9vJO
	7tPSxP20xb1+JadM8vN3gioseLtE27oLx
X-Google-Smtp-Source: AGHT+IEUoMa+BXtql9s2cZFjETmhAnatI7rWJGQzevop4U/kycX0Vn34mEDUpI8kYIcAJsoiygP9Nw==
X-Received: by 2002:a05:6a21:b98:b0:23d:e370:ccfd with SMTP id adf61e73a8af0-23de370d395mr2848807637.41.1754004019603;
        Thu, 31 Jul 2025 16:20:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:20:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:30 -0700
Subject: [PATCH v19 20/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-v5_user_cfi_series-v19-20-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index aaf6ad970499..45ac92452e13 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 59)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 60)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2be..59fbc9c2d126 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -113,6 +113,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
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

