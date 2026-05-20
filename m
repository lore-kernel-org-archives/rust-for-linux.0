Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3234E3115AF
	for <rust-for-linux@vger.kernel.org>; Wed, 20 May 2026 06:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259673; cv=none; b=A5ExVl6tlCyp30TaduGxEdRv8QMlTPsuQm0S0KpBW3K2lSU9C8k5O5RKJeZBB5E38IDtBV3ucOWzIVWxitReeva1mGdKTXDZDrpknB232NY/kuOtf1XrXUoFyWNfYkiXMeJWrowHRuB01S/vLd+yS4M+9+4C4ZqxiDvsttRBRWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259673; c=relaxed/simple;
	bh=Dg93UDfgNMmf3frCyrzgybqXjzCFSicmCtGflkVWgoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SS4Ms0V5KWHjBqW4DXp3dIRz5Y4BgmF0VFAoeMQBti4ocXzu19hC1QYfvAfhn2iTNSKU0HdAwwDEaCYkFQcpo1+6RgJbsQTo0vBlVggaknr2O1RdIKKWfihSqiqVem6YW3lXhaPj+mC/sIkaqsfP8vwazixREUSxEUY/9l6TnfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7gblgcf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7gblgcf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36643b96b99so4166373a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 23:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259671; x=1779864471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwFpdmrQysTo8snbwtDD0b/CRHKgzW4YRIXP8JLk4/Y=;
        b=i7gblgcfoIi1xx+xF9A6RdmgqMOfa6HAnYa8iE8Mo5sWRf7SPrgE81eNx1Y4iD1s4r
         hl1+9trNBHRc7ZLWnQJRvWpMTYG81QoubXxxxZ3nMif03RbnX6YJkKdh19/PwDJeyc96
         3QdxWw7L5o35n+ONzEgZ8zbeUaOiu4TDycqa8tdzQ0wEUpa1q8znG74FY1CMZHRmNuxw
         eIVQfaomuUL93+p0C5hDBuWr3P9PfNpJpBvhC9KAEZfmkp/oNHanqbqomem59g1oB/Is
         x2KUw0pE8vYt2UhWN0z7dQFLYhemOXp1H2++LMiM40Y+6PPWN3Xfr/cVaKh7ZY6EsPb2
         qkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259671; x=1779864471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DwFpdmrQysTo8snbwtDD0b/CRHKgzW4YRIXP8JLk4/Y=;
        b=SId/4L2/BKqQ+wMjHmLdKWIa/kxV+p5dxECjbhdRZrOs/I7jubI99d1cPVl9H3Yucl
         RdHGrB7l4QF6pP60OknCYIVf1dlbMbILnzN1sszmm7WFoY8RCE6C/F8DbxmypSWd4uNO
         2YPbB8AK8iJqJYQd3N/HNX/Gsw4tU0IpgdCMZA5bE4dpjPCLGaDG1k4Xv9ohvpnXBRBl
         hoFU80UgKb4vS62kH9gcnj4st8kBmPK+hxpSTWY6YA2ChuZzHw4Rh6dIklVRXKKug0oQ
         TIClH55u1w5sQGHB17nbLeQCeH08x07ubMwLpqIQctw1IUQ8//XnLXJbp1j/NV9BUrZF
         bgng==
X-Forwarded-Encrypted: i=1; AFNElJ8vN17gvagc5pk8qfMS5fQJQ77Kx/8tjn/ylbAgubZF9sfnUmP4agHJJY4fQYFnKxl1Sd+4ARSan8v6gm32Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuIWrar1C3niUox1JwvsJF3D2f65hHEW6beNZ3dVvonI2dGAbe
	AIR6vnoD9p9oXoWfhc3jaJLo6A1GjpjLYuuL3aIGP2tIsQ812gKf5bWb
X-Gm-Gg: Acq92OHsxXPCr4Cyprk2Q+PPladlQgnAMBWYzsiUIMW7FzVWifk8G4siLVJAlFeIbGv
	zaEYG3zerSvQ+P+n9Y5+i4LCgedzJmX7YrR76wQJasm1wypRrda03ju13toWMibMV2929rk3692
	92ETZpma7tNr7DrYNknAbN6tLcuuIg1wlIfdnV6PUm9ux4EJBxaILRfmcYba3Zw7AlaXTP8p+Q+
	8scydkupYn5CqVrENVYvLTSSCf3G3Np95kPbKNAUDRPBxvB5YR2MjgB2OyIPr5me9m4oUYiOvOa
	XV0aEuVnPO1BkL3cDr4c/qIDSJoYpIbRhd7eDveEO4mpXP2RNX7biCMuBYeA75NhCiKQPk5lRKU
	8+SPykn24Bfjyi0CBhrzSXFiyKEDGj20n9g5GHcaCImoYXWkmqnqmy8uVY2vJHTzLkni7isYuzU
	+vNG8KZs3DP45oU5wCyxBAjzJuAO3esO+HxgPmCGr/aLsfTmkdpRhPWiZg7VJnsdPggFTwZsfUZ
	o59
X-Received: by 2002:a17:90b:5290:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36951a044b5mr22090513a91.7.1779259670620;
        Tue, 19 May 2026 23:47:50 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:47:50 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V16 5/7] rust: Make __udivdi3() and __umoddi3() panic
Date: Wed, 20 May 2026 12:16:27 +0530
Message-ID: <20260520064630.1785283-6-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520064630.1785283-1-mkchauras@gmail.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
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
index 6d7ed7a1ff18..8ce4fa0e5e57 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -618,6 +618,10 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
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
2.54.0

