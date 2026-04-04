Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D0320A37
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 12:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775305017; cv=none; b=DEHFzARxLNTtl1x2Ou1BmyqmR2NLscADS3m45b1XVE6yCVwssYSJv4hWfgbjzrzlAZBjFG1nN/4jFX5+cZCCRD3KImsuKaXexWRvEipEHMN3fo7bqhkXtP4892Quf5tlU9tqtGgC1mNM1llulznmQDslH/7hvHoMFNZbyQ/rpL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775305017; c=relaxed/simple;
	bh=3bfhmI0iIl4U5PndejMek+59b5mJkP37SyrMSjgmwFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MKflyqBOD/syOC5bY1yvsvnrCX5aWdb4gUkqMrl5jmSRD4tvNGBGLVWcJs72U66gH+DWfWsvDMWqiHunuyYkIKl6n5A8SLiJ4tXVJB4E5taZbOasVOXvtfDdrfD5tsGj/biiiYV+4yT01U6QE3D9V3HSRGkq0ZgQImRdKzIN2+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECdVNl0l; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECdVNl0l"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso1539898a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Apr 2026 05:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775305016; x=1775909816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKm0GCc95U5yVYTop7PGOFzPahS1W34+eH7uQUagHv4=;
        b=ECdVNl0lyTskdlFoC7nJM6z8dvMLEVDyP8hAueI8TN6xJpW/ROShOp4hWEFvYEukC1
         KjtJYzpy+S9EaKnFsv2/IyR68MOhGYte2NwKDwjp759JcAAdoNeTyLOFnsTAME3DvNny
         BxqnO3cyuAdiUfMeU3c3uuU38bH4G1tyXrM7tn+voVfmZlXYNJzi1RKXw9yaGf26YKtG
         1CkKfZpnngm7zfKNMcqOtaG+iQDfexb+pB9nRk+iIXmLxPqXmhWYnGYAg3g6IC9XcTAl
         c8BP2xUn2WmykNC6gHhlZrTYk8VmBY4IzubRQ9bYuS0HmbHcsB2i8BQNJAwQDZjdvJ/q
         biJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305016; x=1775909816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKm0GCc95U5yVYTop7PGOFzPahS1W34+eH7uQUagHv4=;
        b=VLMkd3l5Xofjs7wNqdNWkseGw+a0fsO1UvMlJVRvnwtBlyDVUzg7hSZ5Af7Rab/Ddl
         sTgbNke610Rd+SOv4m+YUhFF4cFP3iAOaKbtsFA+6sCv3ANuRJh8cVkexVFn7LWkx2OK
         Dx/GCccGS9MX2pbg2dmauggwb47JwFKH+lZvO6XOvLejZ77aqF2q7ZJaNvOcBUo9wLS/
         DSGvYIubrJOO0K1v/VTTJ61zC+lB+BajvGMRGwQ3T/jZ+P/K0f3Wu9yEzTAJpFYAbrUr
         Rhks6Xtj0HcMP5TWPgUBW95whvJZFs4/Tk1b40aJk0YZd991NJV5ZGWNauTyTBq8libR
         z+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ3sQ4JhU6aaVVx6PMD/s9nPYUMw6h/sR5vMT/anS03VUOetoZBtx9lJ66+/2XfqVSeUvNg/fovQyIN2/JAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYRgJzlLsBrrfKfnYAfObDpfKdpjfIJ8oPn/yJmKvR1w+QJ8DC
	yeJrewT03QG31RTxkdNzZaymVynyb64iclttLeOSUnXhSqQ+msVaapct
X-Gm-Gg: AeBDieusO3iJrhEaNw/bfXdU0hY/wOEONmW2e5VOglCyXv6/bvcq8NotztwRNA8DYmV
	uKLbs38pxWbxiBVlS1NvjzE0g2Nij+Z3/zk6xv4CxUpd0fqcmIcWMMHNUFUQNxl6ZA95t8xzjv/
	efCtq8zSoybAdTGv1leZpqipZ4W9aGWCDWjFUD38QGMcyONHRAPiUfVg7pG3JeqNv3LnP5GdIdg
	k6qZM/UlabfMfk6v9Llq5t4gk90O9vntgzWzInVgQdZoVSQScizOo4MP/39nFVjulbWdhIe+RsT
	5QuXEgM/aLgRbfIJJqJ3g8R0D0uxJPmUK7Yobneg7CNRPNH/M+cM6RGttLBCTQELByBH1gWkPrb
	0FvPtGCTTUbQMjbqZ/ckQrX/JW70TMfPU0XH0WOI2vVcYt/5qDq6i753lo7QPY2pdswf/xpEDdE
	kVkYa7ShLsDwtz+KKDhZ5MSytVS/T6YLGeUXMShhQN9UCc4YZSnNMmYGxOUUDGKqdKSdxjCafI2
	Hk=
X-Received: by 2002:a17:90b:2888:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-35de68f7f89mr5794773a91.18.1775305015943;
        Sat, 04 Apr 2026 05:16:55 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de500c42fsm2702745a91.0.2026.04.04.05.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:16:55 -0700 (PDT)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V9 3/4] rust: Add PowerPC support
Date: Sat,  4 Apr 2026 17:46:09 +0530
Message-ID: <20260404121610.1956528-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404121610.1956528-1-mkchauras@gmail.com>
References: <20260404121610.1956528-1-mkchauras@gmail.com>
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
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 2 ++
 rust/Makefile         | 4 +++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 10240cb80904..1246b3add8ff 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -284,6 +284,7 @@ config PPC
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
index 5f726a332d9e..04d8a849c6e4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -410,13 +410,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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

