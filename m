Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C308626ED45
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193926; cv=none; b=Z6/Q+kdpIfkc1N4j/ELOvK+PbCjrZhnAAEqGuMP+Ujqbpwz8faw5EQoxpjOPnJJT/xJ/hDtsXwHmWGDlNthPeUbUCLIoZy6suM7wFWqidusln5wN0fcQ3KykCY/wSYbq/U4TRBhgPSeS2ISkmmWIdvWoAMXeY9MxBaeGa5u0GKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193926; c=relaxed/simple;
	bh=skp6a1+i24vr3ZUetqOg5WmKTF0iU/JeJP6zzFcRmSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HUDXSdSGnODhZ7wswd6V4dsX7ypqAKc/GjNxJJHNopcZ4mDRhtnM7uEvcEAmuSsvp0sO6MUmu2oIToRaIVQRXsuPYcFUAhX6fD8JJWXk/d4T07TTe34+WlhF5yx9u0aN1k2JMeA191xC14BvvllZtykMNMw3JC1tiK9Eba4Y25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKFJMBl7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKFJMBl7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35e576110adso6294070a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193924; x=1777798724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SYhnvPVAJd1oaQ7E3w3ymi0iyxJM6QAUXA089o3vB8=;
        b=SKFJMBl7vC1PjQa3y6+uUar3RwHNVMrMY2iKubZT5vixfqAmtYrvgJ26Jaqt1X60M6
         64WQpsf7Lk86vNA4bBg7xbh0sMfeUClrc0csIoJcd4Ew7Wu1kiOHqycvR+tG2EfXiqCb
         tKO86JuxSKqYTChqIEWWyeIrna9NVE5dOm2DIp/G4HAOAkl35OtFlWYxpbYPsw1BevUK
         xOdwxg8xfNC3tx84onJzeMHbhnqQwL15GSUez+zN04Uu59U2wglNYjp4UmKoQ/W4XAzy
         8IQR1PXtetONlYRIxEYly/7pBMIwG7L5xV4ySLj0jI/4uwnqIuPvA7Pm4CEEylCK71sn
         CTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193924; x=1777798724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SYhnvPVAJd1oaQ7E3w3ymi0iyxJM6QAUXA089o3vB8=;
        b=DJJGw3VkP314vxGJnFrOp0F+C3ZhQ+N1ELeP1dsAslDUtiLiW1UxD0VxAF59Leki+N
         DqcJLJQQ7QB7IpBAZDYGdp4eGf25qW1xPSMsduzLvV3D9Lp44gE6KQddpuarLvk7huOc
         oInMIPQl5MxBe6l6j8zUxxxU+cXSELXJQcLRLMDmY9KpbWp0unKwO0nEwsnohrvCDq3r
         4vm92kAFAaEKhdzUBLKbwecTd84O9MA9QXisYV9zBzAsxuIANMUhrqOs6NlCtvjH8GAc
         Mt/CGplCV+l/4YfPKk3Z5v3S6ChBLghBLFEnZWK9O123fYImizvDItGUYwQcYGwPx1oJ
         xwjA==
X-Forwarded-Encrypted: i=1; AFNElJ/cFWFP+CUE9HYir7l4F35t84DBFB5N9Eyhhg0UV/WUIQ//kR1eQ64ZHZS3xUzy5nPJhMtSDn6VEinYi9p2Pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxioqqlMgI6I+UztQm9FyTrCDyXvDASLloVaMI1Dzz9Fn0PBQZm
	7ZI+QZiKDLdwEZ6qYku08d7Y2FXD9l0u8vl9TTEfmUQ4tOVJ+HF0OPNy
X-Gm-Gg: AeBDietExrhoCfZxqkR5P0kECBs3YVwn8VrOcdlxl1iLHgAEU1MBjnc51gY0iJTCem9
	ZGCbnribY5ttZQxapEv6Z6YqGGQ+zzva68R9Eyo9+GTesprXvT7bs03DM7AC1dAs2waZclNnWYd
	o4z9L+sAaSM1i9iyYHjr/s2wdFmbyy2DbNMX2aS9Nuaym+v+lYwO7nHV/oFx2bMWETFfeeVVYmE
	FZO24NdTwtPvpXwCfmi5W2Ci9+cHzH7XOrNAb5DgMSPo686XIwHNkwPZ3oaZRcNhGoxMm1mYyb0
	OtOeYcXbVDEUFyo57Em5fzgNMl8t6bSmZNiFzAv5QqP0YpY6sRh145v+zv/LrjF3LDIlQDCW9Ii
	6zk5NwJA90QqeDgFnzurW7EqcnP7DntnEfr1upZxk24UaouOla0IOKGMR0dEJrfYXzEv7uOg1rz
	GmFRgAgc/r5RFln5c0ocK/JhmXArjy+dLRGHHPa+lO6/rdw5H2r61uxZ2yfBT+PuqugMdSR0Doy
	OW0DfD9mCfMqJY=
X-Received: by 2002:a17:90b:52cf:b0:35f:b9f1:fded with SMTP id 98e67ed59e1d1-361402edcc2mr27986180a91.12.1777193924145;
        Sun, 26 Apr 2026 01:58:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:43 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V14 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Sun, 26 Apr 2026 14:27:23 +0530
Message-ID: <20260426085725.2090827-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
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
index f6369d121c50..9aa18cff2fae 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -615,6 +615,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
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

