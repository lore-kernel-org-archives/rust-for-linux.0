Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369B617BEBF
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201271; cv=none; b=kaYxpM8RA9FwezL6dOI9HW50+NnS6O9ypyQ0qUCnABTJ1VSLHo6yJDIlYuG/YgI6HhDrXmrvg2bQh652EnMrwxBaFEXOyY5+Ao8r6TI+ItgtRxC8f0+I7oblZw+E5GPC8VkprM5guQunykq2oLlEJxcfShafzdjyD+FX49LIrWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201271; c=relaxed/simple;
	bh=Y35TwnGeAvMsWCZrToGDNiwgBNmhmSkpO5BQeJbV4PI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eiKXP9ZhUkqEk95XL8dZ5JZPimxVlx49zigkVGb6LM2qsVNMrRgPdyX+ECj7sBgVvzEKC4+GFGoI3M0JtP4rLZ2+Y/3mDsx72MZOwqAG2XjPPMLxvTWyXvJx1yH8aO4ivEyjtfUZwuWEfHO7o05JLPItKE6uduU1iPPYDM666vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3dSHFyt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3dSHFyt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a8fba3f769so41411325ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 04:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201269; x=1777806069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD1QHbTvqlDponwM5P/F4+a1PSB3+J8FyHG1ndeTEn0=;
        b=b3dSHFytDwdOWfbCv4RaZMOMETodx8N0wtEiNZTKH2BjTLHUSjZgqhjgPsGiJNoqxQ
         zCJPiKzaNvn0TgKBc8lnSXyGKR24KHHIleCQvOtQTGEUY8d3b4V27nkl9yAAZCJ8SwUn
         Q7pZcA8oHof3yq9fTE2OfoL0BMqpzK4/NnTgq7AivA+1R9B1HMdEKzfteSGEa70qpLS6
         eSW7re+ZIfRXLpH/cv7WMoElDN66cX7MG1g3wcLMXEYYNa7JDGRCr6KRUB7cfR6EqWZS
         nGZcf+DRC3ZjmVXUDEJrvzkQQWvY82/0n/1pXgvAedueviiY/Y9/k/KjaQbvbhR8J9De
         ic8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201269; x=1777806069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zD1QHbTvqlDponwM5P/F4+a1PSB3+J8FyHG1ndeTEn0=;
        b=Tv06jKzUcAQBbaQYao6exTppfjXC9xToZxZDxD/smuGUN5mr4Dxa1WDYvzMGxjgKj3
         FrRU2C58Ip3Xdd6ybAM1Fcwekgv2A3pjPa2KLQe8sTHLweh7wVdcoW/TnPs2or0Rlcy/
         GddMTRMTKFTzLkCKqgbt2n02THsdgDOCsOy5TEYLDB16mNVcIFxj6o4XoIsZ9vAWHQaH
         6VPAEcB58hkNpCc4laOlkSBC+juiBfhPAqLmwJzWfl27JC3pEnqL2LOgLIbBUBGytZnA
         i+zrpp4sUZDs0fUybSJgywlwwSjsAu40PxvJ2WIwu/buZHofxAoZbp3Jkt7BQpIcwLoF
         uRjA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ie8UP47N4wfl+j2MWXwTe+MlLHtum2ckoFWZ7tKFiCNttBYFwxM4dCmIYPaoJqIfKRpgmM9HtOO6TTJU47g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5I0qc6uik3ox9oToD/M4nSjUZZVUu77wVbHPrl0Lx/IZVqEq
	QroD+IyZAPukBbwrYuAWF0fbWnGTHOVpejB72dCRMxeMqvXf5Hs1IzY3
X-Gm-Gg: AeBDievmdTET7xosm+dkovzwwY7yjaQ1zLpNJeuEfvC+icjBnpTpueMteN3QqHGFZBZ
	rKIDGjMmQYkzFz5U8sMLIIS1lfb54DN/+egIX4AlwD8HtklAO+PcQm1yoO7NW4VyrI9OKR8Pc4a
	ss4/EKFBwFYhwqJYzhftpOWBE5djHQUqnCKfWjw9Ck5JU7gt/pKjB53t0jD4IDn60nAH1QOyAUi
	Zes9sdUbH+faWOgKywZZFnTwraEbgp5b7H0BHZRih/HJWwDXhKWZhrs1go6e4DcdeE0O4eyXKtl
	C1Hg+T7sXteLXVuI1bHm+V9UW8w25H2b//kmD46Vt4piHfBx8J6rbrVeatxWvGoKIK6MWGGhV/D
	dzp8SohGN1by6kn4feBa2kzIetVlAaITmUhwHHnLHjUlMvCRv6R8bEETH3W7Y5/mtIqNMG5yxsf
	kRa1ZstKW2njpCakJje0KhoGRBBP4idjmJX67YaQDLtC19SgG8NQRV553/kr/qSue/LfzdU6Xpz
	oZjSFZu1Ph3pmk=
X-Received: by 2002:a17:903:2287:b0:2b2:be01:5532 with SMTP id d9443c01a7336-2b5f9fdbb6cmr369613895ad.35.1777201269202;
        Sun, 26 Apr 2026 04:01:09 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:01:08 -0700 (PDT)
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
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH V15 6/7] rust: Add PowerPC support
Date: Sun, 26 Apr 2026 16:29:31 +0530
Message-ID: <20260426105932.2270364-7-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Link Mauve <linkmauve@linkmauve.fr>

For now only Big Endian 32-bit PowerPC is supported, as that is the only
hardware I have.  This has been tested on the Nintendo Wii so far, but I
plan on also using it on the GameCube, Wii U and Apple G4.

These changes aren’t the only ones required to get the kernel to compile
and link on PowerPC, libcore will also have to be changed to not use
integer division to format u64, u128 and core::time::Duration, otherwise
__udivdi3() and __umoddi3() will have to be added.  I have tested this
change by replacing the three implementations with unimplemented!() and
it linked just fine.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 2 ++
 rust/Makefile         | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e93df95b79e7..4ac897b650d4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..589613eaa5dc 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
+KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
+
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
diff --git a/rust/Makefile b/rust/Makefile
index d70fb186cae9..54096ce8a675 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -400,13 +400,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	-fdiagnostics-show-context -fdiagnostics-show-context=% \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.53.0

