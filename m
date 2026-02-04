Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9021834CDD
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 21:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770238945; cv=none; b=mnpfsiNnf6NQ0j05qgfLQyv0nq/cKFWbZhDEgfOh/YF/2sr6wHFTAFU/DEXEjqICEVGB6vjBc3sEFyhOCwtfgYkmF5yVZVxHb/7XuxugU32th56pGseXCyoeRzQ3M2ZqFCqdUEvMF8CsbZOfBKZONQNWC1BrAy06sV2OxfSu3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770238945; c=relaxed/simple;
	bh=EzpOrLbanzoU/XKFGITxt6Om/X66hVN2Cw+4bKLo8ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FHMMeKW/U+eX2+7FeiVE25MPa/yZjHsDjijBi+DaW0UQozUjxP542EFmcH/67dEl0qOBLJym4PaxWYjePaw3aI96Qz8wCpZ1JpCBzPwsN+nYlzt4gyqdWbS7nbvICRRTvQ3t+STLU8mwJOLvTji6CG5LzWwxBOcRAyAiPOf8RD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdxNbJpk; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdxNbJpk"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82307c6902eso126196b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 13:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770238945; x=1770843745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JEXFfn5owLVtRFRZ2oa7tX5z5wOjOt9hQA1ZlR21y4=;
        b=DdxNbJpkP8Z9QhXeYC9lKxKT7bpQ8koLnXGEcFqvCtOsME5ESwce/Q0IvKks/W73S2
         QBNNIxJH7+DhFN4zhZ5skwW6HKzAfHIzaJK/ry8ZDq1cKaG1KO1pXbiEB9XEqJG8Abeo
         aYoqhKQl4iiFjHARZEkNbR0JMZfr7dOi8WeQHyTtDifs10bS0yaCzzxt+OtwqBGGz6Rx
         Pxgcok/H2bs6DB8U8gGMZ6++os6A4UiGplE1yctPFSgYKVv925q00qhzKhHtwAB1S7G6
         LU42O1wL2FjpT4ahcCthImAULttl6XAYQawyWqDm1MAYujZ/Nr1mho1hG9ge5Am129ps
         Lh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770238945; x=1770843745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JEXFfn5owLVtRFRZ2oa7tX5z5wOjOt9hQA1ZlR21y4=;
        b=Dm8CP1V/u+jKcTJXAD8CbVtXAPsM19JDpXfZOIxs2nCg1Fr1YegKWDhZK5N878zjOS
         h65tN8AXQQhULixU4MvdfVHPeMEuXcxSSZ4xgaemys/ZwUYmTtUXLt3mVkqzfHJLbi1r
         OUGZiPY7oG0K4LMMArjw7DnllDggp0O5qYlBn1bLl94gf4E4n4iAPhdNcRdO/aExjkN3
         vd7sn+v9o6qWLrksL3PBsq3aEmebJhKM9J4RfYb9rKbyD7gzB1MFYBlGoH7DhYpQ09A1
         xfEHzXM7WPSTzbXkMz8zRURt4VqGD55ZsO9bQjaYDruvxdS0dMpnDY7NwS95YyFPh5L3
         2nyA==
X-Forwarded-Encrypted: i=1; AJvYcCVV34qvD4dTuCFY0KP0jsR2CqjIfdHSdNEIjKUwXImwgihxdDrvAFJKZPMMM7QDeRKDQa+K2AHbQ5l4TLSK0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHhY97EprWboOFvjc+8UprG+qvmWVble0rpYqsGgzLunZwuTvp
	q2dk91ZXoUCI9RG2GCafy1BdIxwKhnO7AaffBBhH79JEUWbqzchM2ztN
X-Gm-Gg: AZuq6aI7opqO8ZfmlZ0wx39m6Oc6HD9l0yW6nEIEtgn/BPyA9nhmUZReY7VhDRZnA0j
	kvhe5LpQ+sd1VWdKB7w+NIm7/UpVqmGry4UsQ80jE4/3BLS5jnKrHzWHcdIx2drItuknkM7Kzqy
	+U0Ipzs0+1GdFiqlKFVPVe0S6UjuNjdfHG/rQPpfTfNFaUtrf0aMLE5tddA0Zpaulx7YXpBnuP0
	osBqYtWjQwG6025u2HStWEEJg3yzGM1I2WfRKVcQ6uuPQQidxfsTfwANUixrHN89A4pf+7hC2Q0
	VgC4fjl8oTYSm0uJ9iJv062zlclNXC1B47NzmTUWfMu9DaOTQf5aqQNNdUdcfvA4mwSAXHmfky3
	m+DHcndmL6StTkpopOIXOLvVOeLnRXUaUG86/ZG82x68fzN6FHVxAPQgr8rhGh2qf5WPYAOj+Jt
	A967BKRDIE+/B/BggNGoIQ+le6RI+gSvwVrILZnR9vddclLQft6HbU4L8oVcg3tflA
X-Received: by 2002:a05:6a00:a907:b0:823:88a:7f1d with SMTP id d2e1a72fcca58-8241c648432mr4248864b3a.62.1770238944810;
        Wed, 04 Feb 2026 13:02:24 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1bd466sm3277977b3a.20.2026.02.04.13.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:02:24 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: linkmauve@linkmauve.fr,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	corbet@lwn.net,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V2 2/3] rust: Add PowerPC support
Date: Thu,  5 Feb 2026 02:31:24 +0530
Message-ID: <20260204210125.613350-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204210125.613350-1-mkchauras@gmail.com>
References: <20260204210125.613350-1-mkchauras@gmail.com>
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
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 1 +
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 2 ++
 rust/Makefile                       | 4 +++-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6e6a515d0899..e26a94808e97 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
+``powerpc``    Experimental      32-bit Big Endian only.
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..17db23b82e91 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -283,6 +283,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..9fd82c75dcbd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
+KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
 KBUILD_LDFLAGS	+= -EL
diff --git a/rust/Makefile b/rust/Makefile
index 4dcc2eff51cb..ae22f2c5f0b3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -384,13 +384,15 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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
2.52.0

