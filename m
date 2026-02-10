Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689B923EA87
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 07:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707918; cv=none; b=WUFU972z4z6mm4NEXjwIjkbaenT1Uqx4kMfHNq189gRZbFkUVouy9YmmZB3dbdIP6q4+9mc03D+fGH6elHiGq8M/cPU+4A/r1h6St1apbinSf2sFOEeDiQVrqI99GlPnqUW3v6awf3tPwVS101OpFf5mTv9hKB0RP94ZeW4mpqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707918; c=relaxed/simple;
	bh=4vMSjpDvokaDPJWcGhnJnR0EhkBdHN+zzZ41Z2GkwAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnDjM+oADfnXFsgfU81ENeTShu/fMydW1dg4KdjTOIcRnyEmjMeIeyAe/2rm9jWknrfDWU/+EWDAGskIyHo49EE+NA/F4UUMEXLmXtU5NKu2AmUqlrBPUbPWunENU0cqbQ+qCzmQhzk5SaU2jgcfxuZdBrMLiCKPEXE6ORFFcFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6Hc8lFf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6Hc8lFf"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f4e36512aso3532100b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 23:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770707917; x=1771312717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ELct8JbGFslmyeZtvX1PbcqdzEj+R+mb18t5qqOGr8=;
        b=e6Hc8lFf4CcA6Z6h4jjq739vRlW/1T8zrlCGqjJaFPUyBZFG/0bN93bZZ6UijU+UWV
         nRrkIF3awlwcrtpLmdg+QnvqNtuyKGRVl8+U0ozVjPkJGH7phBmdZDPC2Um53XmBGG3C
         WC698CguYlfdm4/Ku/fjYn+lCXC8gCI1MWZX42rlP1mQFC93IF0liiKaETb2pbtZvEu6
         +H4nB+uoEhqKUVEvtvStj9tyDJr7EkdUFqCV/6UtC83ObLLz/5aC40IYuVtO70WqLkU1
         cqpgMBastOSCNeWMDiASAlbOh7EOhbGt0dhCweE1oMrtOA08sA/QfPV2WrrbL4liN668
         L9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770707917; x=1771312717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ELct8JbGFslmyeZtvX1PbcqdzEj+R+mb18t5qqOGr8=;
        b=rdiiLrCYp+E1+X4IxTWXfb4XOjpRrYBZ0W1960GDXfWRTGqGM5NfV4TX2ogy99L3dO
         4JZedEwVfqbjgX4jl8pAvpKje7TV3xcAxcyC3LgMVoKmvN9C3drxNbDh/3JwRF5H8T0s
         KxHLSIoXxuocqtA69dhldHFOY666PZH1DtEZuj6url2NnppeH40QaDq6CI9JoRlE+43V
         v08eMmSzxLw901SjF3UGu3URHYt3y21nJTZLq+zyTVAw3EzJtH5PI7MxH/nxRV831xps
         hahdYRYkBWUORlkPHbHI5xmQsH+O8FrWilY2yZ7jS8shg4ox0+KIWdJXhHmZW9MFRRLf
         xCQw==
X-Forwarded-Encrypted: i=1; AJvYcCVdsy+beI+YZx3u4VTRq4mnplr0xWXtS95fvuCpdcO5Y2k1RKSQL12wRZsj2zUzCTD8JMKXCUKFAEqkPgp+Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/BISyKrtbAkNXLxGhkA5TFgtSUaQoAFssmHKGmoI+UhAZOayj
	SErbddOG5cvTqsyK82KAKlnoFHQ+78DVhzQhLG1Tcf0iYf8cIvDts0K0qzEcUw==
X-Gm-Gg: AZuq6aIRjGcDMOyM9Na98njIuqNST61abwWCKostyMRAEsnNSpe0jTZDfFqSm9oT8SN
	yBR61mrAWqpt/QiUJzOAzAAppDgnIyhagydiJS9rfP0qI3sLoN6XLKHGm6cMisLXMuSOXNUZU0R
	U4j1ey9CUgT3XOnGltZkAAg0Q1oCJlCfS2GwvudrO9sPMannWSLbJJED/AmEc7itA7EL1FOI8wf
	0fMH1CG4inXsmYIOC+d3SFoJWCvgnJrHilUbu0t+gFaG5hEO03fmdK3qpcbrA8sKlk8nkpJODlJ
	VAga2i73qoSt7snZdbxc1H0PAJv77MbNxzLegd1+STXF/kk4whhvSzH7ODXDs9oJg74rxG8ZVpe
	LVPDpB8/C6B2MfE4QFAnvAHsYJb+dkHfPcL67W78CGExRf2KsFWiBEhrOg2RHJNm/p0TVUO+fqM
	RqUvKAkoxhBs9HZRGqEFqVDguzcrF8eFNO/WafHbByNw7q4zsAFwtkrAMxFN50Z6yANnz7od0Z1
	SLeVItoXA==
X-Received: by 2002:a05:6a20:734f:b0:37e:7e93:99cf with SMTP id adf61e73a8af0-393ad310a05mr12386368637.37.1770701906995;
        Mon, 09 Feb 2026 21:38:26 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8245b62d773sm7529056b3a.36.2026.02.09.21.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:38:26 -0800 (PST)
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
Subject: [PATCH V5 3/3] powerpc: Enable Rust for ppc64le
Date: Tue, 10 Feb 2026 11:07:56 +0530
Message-ID: <20260210053756.2088302-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210053756.2088302-1-mkchauras@gmail.com>
References: <20260210053756.2088302-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling rust support for ppc64le only.

Tested on powernv9:

$ uname -rm
6.19.0-rc8+ ppc64le

$ sudo modprobe rust_minimal
[  632.890850] rust_minimal: Rust minimal sample (init)
[  632.890881] rust_minimal: Am I built-in? false
[  632.890898] rust_minimal: test_parameter: 1

$ sudo rmmod rust_minimal
[  648.272832] rust_minimal: My numbers are [72, 108, 200]
[  648.272873] rust_minimal: Rust minimal sample (exit)

$ sudo modprobe rust_print
[  843.410391] rust_print: Rust printing macros sample (init)
[  843.410424] rust_print: Emergency message (level 0) without args
[  843.410451] rust_print: Alert message (level 1) without args
[  843.410477] rust_print: Critical message (level 2) without args
[  843.410503] rust_print: Error message (level 3) without args
[  843.410530] rust_print: Warning message (level 4) without args
[  843.410557] rust_print: Notice message (level 5) without args
[  843.410594] rust_print: Info message (level 6) without args
[  843.410617] rust_print: A line that is continued without args
[  843.410646] rust_print: Emergency message (level 0) with args
[  843.410675] rust_print: Alert message (level 1) with args
[  843.410691] rust_print: Critical message (level 2) with args
[  843.410727] rust_print: Error message (level 3) with args
[  843.410761] rust_print: Warning message (level 4) with args
[  843.410796] rust_print: Notice message (level 5) with args
[  843.410821] rust_print: Info message (level 6) with args
[  843.410854] rust_print: A line that is continued with args
[  843.410892] rust_print: 1
[  843.410895] rust_print: "hello, world"
[  843.410924] rust_print: [samples/rust/rust_print_main.rs:35:5] c = "hello, world"
[  843.410977] rust_print: Arc<dyn Display> says 42
[  843.410979] rust_print: Arc<dyn Display> says hello, world

$ sudo rmmod rust_print
[  843.411003] rust_print: "hello, world"
[  888.499935] rust_print: Rust printing macros sample (exit)

Reviewed-by: Link Mauve <linkmauve@linkmauve.fr>
Tested-by: Link Mauve <linkmauve@linkmauve.fr>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/powerpc/Kconfig                | 1 +
 arch/powerpc/Makefile               | 9 ++++++++-
 rust/Makefile                       | 6 ++++++
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index e26a94808e97..627471ac9238 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``powerpc``    Experimental      32-bit Big Endian only.
+``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian.
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 17db23b82e91..954af27e10c5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -284,6 +284,7 @@ config PPC
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
 	select HAVE_RUST			if PPC32
+	select HAVE_RUST			if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9fd82c75dcbd..f93816ddc036 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,7 +61,14 @@ else
 KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
-KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+ifdef CONFIG_PPC64
+ifdef CONFIG_CPU_LITTLE_ENDIAN
+KBUILD_RUSTFLAGS	+= --target=powerpc64le-unknown-linux-gnu
+endif
+KBUILD_RUSTFLAGS	+= -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
+else
+KBUILD_RUSTFLAGS	+= --target=powerpc-unknown-linux-gnu
+endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 KBUILD_CPPFLAGS	+= -mlittle-endian
diff --git a/rust/Makefile b/rust/Makefile
index ae22f2c5f0b3..0aef472c6cf5 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -392,7 +392,13 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
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
2.53.0

