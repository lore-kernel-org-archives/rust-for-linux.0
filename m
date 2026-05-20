Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9E834D398
	for <rust-for-linux@vger.kernel.org>; Wed, 20 May 2026 06:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259697; cv=none; b=K7TdSC6/PN4JQgcQLr6j1ZoNvt2hVyuqsN+MfebNAtdBRghDrXr0Wo+zL3ACRqy611rdl9mYssykdb5H0JiUeTGhsyUhiV1XuN2qPdmxcprAm+AJkmh6WiMjlabGZ7PXPYdIYctUZu6xlCWRagZ0M+OqmKml2ekrKxnroUWB7SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259697; c=relaxed/simple;
	bh=HAf6ECKezOA+3NvXPCmYjsiWt1d847r48DEbKrtCXPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ozgbe96V2f3bRS+wbUh9LB/dExNSWwRU0C1kLDxDaPh2MSIBt2RCai+LZZZx9hqWszkfJs6mVQ9Bmcw5WLOuYKGbi4eHp+7Bn7LqheNeTRuewv/B6DNLF+iqYu/H9hNtHzDgo8Kg+agGdWuXH03wmoFjOWCbM4ORIGTkVLl4gf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNLvw4VG; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNLvw4VG"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-366375c4076so1640884a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 19 May 2026 23:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259696; x=1779864496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hlYuip95dmigZkw4KVozqME9yuDvS7t6KmHEYjYBjUM=;
        b=HNLvw4VGT8HeHW7teoLWM9aRiqLThXPvZ9wx9UdoOifyqIkvcBANTBBc4lQbbEa45s
         jghiQac3m9B9mRJuoh6vk7PtS1LkYS63nqqAkFtliedDiZBbQIvE2qLx/c+u9iKLc5M6
         hxMIVFf5UhbIg8/NhEhueMsPlCEwt994zfp1gDbZoyCQyvNsyl0nGhgUGJNpZM+qe4o3
         DIRwEqVpgiCFhdi8kR6CjVJvVIx8VZbtTALmYrB3ZkNe8VwJrEBKC5r3ddlWXmdWjLpo
         aRPvp1DWt3EwL6Waba/tiWiKag1Enshn4q/WyyC4RK7HLPvC3CVDVxA6CNMChL2yul8G
         tpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259696; x=1779864496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hlYuip95dmigZkw4KVozqME9yuDvS7t6KmHEYjYBjUM=;
        b=AFdB6HvVb3b46uLyWpyjqlDbKaalFmUlKo+T05FT4h7cI9wNe9DtPLJwe+ff1MOMBO
         rOn90RuztE4AZEPqY3JqwDp3g1B/Dz1ayGrbHayzE6OxGeeGVm/6z9QM8hFfKDhuYkE0
         BEu058EYZfWijeyJjYhNwfKE6JJq5m/w+yMiL6M/pIFC1z8xw4oKI756wQfRtkM/3QQi
         OpOUe8LiwKqhpL6Xt8r3avx58T0O0TPmMefGtRrVJzwRV73wS3d58+KkIqQ+13oqgHSJ
         wnvBjSIQtr8v6n5eFLTUV2tq1d+56dHyVXuOKzgFDm/SXH8r8M7bPMwn4ubKVozn9mVH
         8Hcw==
X-Forwarded-Encrypted: i=1; AFNElJ8OrZp5SYFoN25ojANjeQ2VR10XpNpc0oWsAogwwKkDJ0WjRJd95bpp00LW36PAfRcywadCAzthhe/t7cWtoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ5+TqC2ISnEvxim/krzI5aggTRnDEnGEwfGsdvSGK82GzONEr
	xu9ghLxmSFmUYr3Uc93pc1sujpesrExk6T3nnoJmR13IGnyEX2Su6TMZ
X-Gm-Gg: Acq92OGuqy3L79Q0Jqpof/l+UgZdQppcVmFIOz3j12UtMNOCe7l1+I8s+Bw87TYj5Xy
	V2CDQB3VMw3Z2mKAPuOOFIEygvq1KYnb+g5YWoHLy55GuqjcJLjagm6Y4v/kxSCg2FH5u6a5spJ
	Hba1x02FO+zSiYLqBPR7hPP6UQ7m6INTAwx8ML23H14PIdMLw1TvdZAPjJgTjxOcpT66Tq0gU8+
	OI6yDyd6RO0Uv9L6+w9veYjOZQBFLDrtwoi+fs/4XMPFxTzPePYiOGWFNsn9NOM0JxcC6wiZR0j
	EXqmaRC+1X/Ybl18TJLtQMN6pZxy3CEtq7wbVj1fs+7pWJ237gdD3rn3tqHCIqzbEvlVfNQ/17p
	zREH68KdzjPjiRU2Lxhv8iKtNH2Q2LMzF+CxrCogWloj2lepTsH8avDLGDhuAmidSptoPn6RQ5p
	Wi9RXUAApX4FYndkzXz/W2om57jvIOsPjD5i5AEpDeB/w1Ij5fq0WPNnZh9+cF2VF4i+Ejb+4Xd
	aOT
X-Received: by 2002:a17:90b:5863:b0:368:3854:3a2e with SMTP id 98e67ed59e1d1-36951dc4062mr21724088a91.26.1779259696091;
        Tue, 19 May 2026 23:48:16 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:48:15 -0700 (PDT)
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
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH V16 7/7] powerpc: Enable Rust for ppc64le
Date: Wed, 20 May 2026 12:16:29 +0530
Message-ID: <20260520064630.1785283-8-mkchauras@gmail.com>
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

Enabling rust support for ppc64le.

Tested on pseries Power11:
╰─❯ dmesg | grep rust
[    0.225728] Initialise system trusted keyrings
[    0.270961] rust_minimal: Rust minimal sample (init)
[    0.270968] rust_minimal: Am I built-in? true
[    0.270974] rust_minimal: test_parameter: 1
[    0.270983] rust_misc_device: Initialising Rust Misc Device Sample
[    0.271012] rust_print: Rust printing macros sample (init)
[    0.271019] rust_print: Emergency message (level 0) without args
[    0.271023] rust_print: Alert message (level 1) without args
[    0.271026] rust_print: Critical message (level 2) without args
[    0.271030] rust_print: Error message (level 3) without args
[    0.271033] rust_print: Warning message (level 4) without args
[    0.271037] rust_print: Notice message (level 5) without args
[    0.271040] rust_print: Info message (level 6) without args
[    0.271043] rust_print: A line that is continued without args
[    0.271054] rust_print: Emergency message (level 0) with args
[    0.271064] rust_print: Alert message (level 1) with args
[    0.271072] rust_print: Critical message (level 2) with args
[    0.271077] rust_print: Error message (level 3) with args
[    0.271083] rust_print: Warning message (level 4) with args
[    0.271091] rust_print: Notice message (level 5) with args
[    0.271097] rust_print: Info message (level 6) with args
[    0.271102] rust_print: A line that is continued with args
[    0.271110] rust_print: 1
[    0.271113] rust_print: "hello, world"
[    0.271121] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
[    0.271129] rust_print: Arc<dyn Display> says 42
[    0.271130] rust_print: Arc<dyn Display> says hello, world
[    0.271136] rust_print: "hello, world"
[    0.271198] usbcore: registered new interface driver rust_driver_usb
[    0.271207] rust_faux_driver: Initialising Rust Faux Device Sample
[    0.271227] faux_driver rust-faux-sample-device: Hello from faux device!
[    0.271297] rust_configfs: Rust configfs sample (init)

Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Acked-by: Gary Guo <gary@garyguo.net>
Link: https://github.com/rust-lang/compiler-team/issues/987
Link: https://github.com/rust-lang/compiler-team/issues/988
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig  | 1 +
 arch/powerpc/Makefile | 7 ++++++-
 rust/Makefile         | 6 ++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4ac897b650d4..2e3065bce9cd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -286,6 +286,7 @@ config PPC
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
 	select HAVE_RUST			if PPC32
+	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 589613eaa5dc..9385db478c59 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,12 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS 	+= --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
+KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
+else
+KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
+endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
diff --git a/rust/Makefile b/rust/Makefile
index d9485f5e95e6..91c6d5fac15f 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -410,7 +410,13 @@ BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 # This is only for i386 UM builds, which need the 32-bit target not -m32
 BINDGEN_TARGET_i386	:= i386-linux-gnu
+
+ifdef CONFIG_PPC64
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+else
 BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+endif
+
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
-- 
2.54.0

