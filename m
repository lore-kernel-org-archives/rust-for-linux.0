Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA570313550
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 05:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009735; cv=none; b=omrYAbhj0kvu7SdqClZ5D+cbLT/wb8wtS7muN/hbaRlKArLI0mGbwrZjzIFDkoy5nFn0G8iL5DoTTpoYsdi5CWwsmd3ykak9Q4rBX1aA92/FKzJylZPAw9frdJ4+fDGPOGKMNe2hQd2zvpyCI9t5c4ht9Zjv7rc/jFNO4lqQbNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009735; c=relaxed/simple;
	bh=8uYxXlCsfJ2qoRnT3JSJJZBu6F4nxjWNt9la1fSIEJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CpkcIR4wudC5kQYQeHwAPwONQzsvOrG15mO2DtIjOf65SI5YBa3zTxn2kbpofAD+u8A5Ix52IH3/bphp8Iu14xxGf0QNRIPwlKSPzoJ3AJ7NPeWItC7keu8Ptx4hlPukOqH/xvSLY6Hy6az+5VHSTDs5D7rynfBpvsfPsfgrEXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ+d3qB3; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ+d3qB3"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso4434944a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Apr 2026 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009732; x=1777614532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jOMf9sHPOP+Fk6bUCc/tdd0deN6bifNBcXjhksEyrM=;
        b=TJ+d3qB39ZfoGP1a8weDZ0sKdmP5QYZPrMXom4t09zQgy4oyTEiWwO0rwCEkA3d6iN
         6yX1DokORZ48Pv/ExE9+Fvq2shhd3Jzed9xdMrBAMYErZ0Ebz6dY/vMuP6/kT6uhkVhc
         Oa0fawmqNyE0/HbZEpbjWCI3lHhYlZ0d3sirDsiTN64cyP4U5QZBOK+IHsH0WjGGFN52
         b8a2GXaqKJrDkasG/SLxkmNbqYPs4jqItsQNr/MAGsVvIennvqBJVsYV3CNg0aZpBmwm
         HnTzG5QfqgI2YSrkPXj3amX9IvNHIBSlEAVq0j+2jFQusannO9ErtVgweqb69eEmyj3G
         pi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009732; x=1777614532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jOMf9sHPOP+Fk6bUCc/tdd0deN6bifNBcXjhksEyrM=;
        b=AERA9afHfUmMq+hX8DeIX9riDyw91y+lsXsncTS8rSDuWaEKx8I2L4vesjIrfeZj6b
         t0XX9aSfB9rVGrBPeLnhjId3frIR+MIh1Cll11SOy23we6h3LIw26YHbt12V3pprrOgi
         lP3rwN8JCk8AEeA/kASkGOaOaodRyUEl6YI8BqiQHozgsoAkGMe1rRuEV/rjiLm9t3S9
         r8GkyCPjcoXbu6BI0DerSeo6U5/7KfQ+vBropKCC+Dk8vpTlp5vuT7W5BYJsoAWutUae
         6rdetcXTrv9Z4lLfucEtIS/M0jAcSUJmLRXw+Biur92//ake5UotyjnPI8sX5NTVNEVk
         gOzw==
X-Forwarded-Encrypted: i=1; AFNElJ/oMSdAe0xv6GA/LhvNSKgw8ZRbBLpCL2dUBM73qyJnp8upgKIKl1B2GQLc1S5X0VgDobcQ0+MLWDIdgPUANA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxjfT9A6e6JWJTqpqLckduisxLNXxmwK4MpOeZSFriwZCiPaj+
	eC0RViZuepWDroh+dyZei+1/mNON0x6cNm5FEone21iuogd+ofw0bfGK
X-Gm-Gg: AeBDievRAYK7Mco1tQs7GLOnDvfIe9ZtrfH5E9qy3Loaj4vuDWEPGqbSFEyRM2x+D31
	Tgd24JtotLv6JCjIFERIgKpx3ETWZdBiLuqa2Z5BZZQYdk/nLttcVi6gwG/XL9VgNUdmIMoiFu8
	nLZjLviXt3WtxvMOqSd4/xTJCtxC60Cm5Kbq0vzYVmHr9FlC6mrNDdvVzdek7osPdFViOwRM/tP
	TonHU8E4Vy3v4aCQuGm2OLNxYYIn6KfcuLEb5MZG62duUgC7dMvM6vXA6wD7UrsrBDIGC2y0y0S
	vM4zA0b2F5TOeZYOto1dXSqjUUYKsBxsXA4hK2dVwRVgoIjUtbeFzP6h2pRbo+Qz1NTSeJldZCX
	K8/esmEybBYRxSTC5nO8l3p7tk1cTfcZZTd1cp9W/DoXIp2FK7/07+Ml2aOPnIxSu4TsDstlsBn
	ryITusVgIs/XWJA9L4q01dKmL+t0bJFOVSX2tsnX3qtbFftHNUEIty8K/2CMsLTNCwQtQ9KDKdB
	e/2NbwR1oQnrBE=
X-Received: by 2002:a17:90b:5185:b0:35c:29ba:bf92 with SMTP id 98e67ed59e1d1-361403d5988mr33141482a91.5.1777009732009;
        Thu, 23 Apr 2026 22:48:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:51 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Fri, 24 Apr 2026 11:17:40 +0530
Message-ID: <20260424054742.45832-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

The core crate currently depends on these two functions for i64/u64/
i128/u128/core::time::Duration formatting, but we shouldn’t use that in
the kernel so let’s panic if they are ever called.

This doesn’t yet fix drm_panic_qr.rs, which also uses __udivdi3 when
CONFIG_CC_OPTIMIZE_FOR_SIZE=y, but at least makes the rest of the kernel
build on PPC32.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile             | 4 ++++
 rust/compiler_builtins.rs | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 2a5428a5503d..ee11fba7a03d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -616,6 +616,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 		__ashrti3 \
 		__ashlti3 __lshrti3
 endif
+ifdef CONFIG_PPC32
+	redirect-intrinsics += \
+		__udivdi3 __umoddi3
+endif
 
 ifdef CONFIG_MODVERSIONS
 cmd_gendwarfksyms = $(if $(skip_gendwarfksyms),, \
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index dd16c1dc899c..fc6b54636dd5 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -97,5 +97,11 @@ pub extern "C" fn $ident() {
     __aeabi_uldivmod,
 });
 
+#[cfg(target_arch = "powerpc")]
+define_panicking_intrinsics!("`u64` division/modulo should not be used", {
+    __udivdi3,
+    __umoddi3,
+});
+
 // NOTE: if you are adding a new intrinsic here, you should also add it to
 // `redirect-intrinsics` in `rust/Makefile`.
-- 
2.53.0

