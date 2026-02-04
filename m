Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6859E369979
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 06:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770184963; cv=none; b=QSv5d3HwP0MmKqlaeVS4vbEkYO7BIgGqLPG0B3jng+4l5CChk8xyhCURhF7RwIN0h/6obwaLvcY0NUmY8Zf0X5GCmJCQZRdOI8c2tmZxgQKyAu64xRAOGSQDthB1FjWx6YmG6JQkBvaU6N8KNAC4ULuWO1dQ5rER6Lo3q9ptF/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770184963; c=relaxed/simple;
	bh=Nu0j7/QTMwXNybcCccfMDqePArqp9NasPFKFagIBk5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EXeR0pPaZqT95/278i/WnPn1Jee9sRBif2uQK3mnABcIxIxl6zlNVwyFW7R1CL970r+2FUxki4gyFdnYpEdN3C85gdZ9FV/YVxvMdxfHyZiJk57cPkvDgie8NezkSEbuIxC14/+sJ4+DrGYj+tvq0Nu3klCZ6SzQvUGZggMvoLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFRouCu6; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFRouCu6"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b785801c93so4580519eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 22:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770184962; x=1770789762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VL5of/f5KyDAfjTDwdEWFiFC2+YlHapoLTi3UvRqx5s=;
        b=KFRouCu61W4iCgh3Hi6M6Dsujb1012wpaz3gzw4qXOwuGMWdzdTn3GY0Vg3nTo0FLr
         cG7SitmMWFHcfW21i9qv8wSDKLYpiUWZClqbN1MjX25Rp6m6sS8mR/HL9a9jXhna0ID+
         rJvkdN+/8S/QpHzb5E3GUoS17aowBKzsdOjG0GqY0zsQxNiLIAlctRFycBIDlDBto1Zu
         OBqaGj5A38+Q7jtDLOM6MbqZKoELFz//6j9JVNoMC5VIPLY3i0Tkt3HwiLym6PzGIbsT
         hMvbx223NB+/uwFokZdzkmewr2i469K1VYhlJ4zvPUJ6PYfBkbQW3mdu10mJYiex0GBG
         uw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770184962; x=1770789762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL5of/f5KyDAfjTDwdEWFiFC2+YlHapoLTi3UvRqx5s=;
        b=cpgm/sMeu9K0dk/s+yBelPdu/FxUoNPiNLcOBJDxjUEoUcyR0dr9ad9jalv8+TVS/z
         MtEPsX5MynL6sdjh/z0DfiL1ypHW575KWoMqaqmX1nKYDN8bnYWuIRlWhpzEoyPlYYk4
         qcRJpD1tzOMkR1FH1YK/lSXTg0i4kkdRhcvG8FMPkrXwrIG4fM+ck9auYfzOpH3SU3mt
         xOst8+9qrP52ruQplOiTNrnZhjTyOL7CqZuRolxtRD7JzAzkGxZuSNojfGi/U+MkIeKT
         33vdEDhDaQIjjRdqSyKdSrhHgImvOym/zabrpTrYHn4hzcGghKwJJz45UuC8m/+EMn/b
         1EmA==
X-Forwarded-Encrypted: i=1; AJvYcCXmXk9hijwKjftWicrnAuE5baEq0EuVzeHpflonC8c0A2E7lR8CzgrY5svaEqU0pCyMOow3t2/09JE8cNfgWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJvNocHEyjDQEDg6fw62+Gw409oksXwTcz0iPYNG32yx3nifxj
	lHTfb4Puu6Nm4r+YivxOQk9NZM7PHF8HUdXCpwYwWBK1zNCTCoZWRb6Wn+DYQw==
X-Gm-Gg: AZuq6aIDHo/dDgS65bQl5e/xLAwZwJRoH8513IoKp5OQaedkEfZ03X5scMoqmLs+GWT
	HX4Mgi19XTy/PIVQuwKvttMqSk0iX9QTzsazjOCSPXaHZUlQEcef1HwlNkP5u1VdIBGtaQKpYSV
	RElaydZDJvX9WhWXXiFUoP8XcH31nuT1ibQBF/wZ4xUS3kp9k1e1J98EDuyV1R+1lNcNCbvEiUd
	veIlfoJcQq4yyptZKwNYMh7cKPtJ0d4SkXKhZ0oIOXaqfhLyY5XzDdFNmFBvyiFfT39EcihDWq2
	hpiGAbI38FOxLiFtpDblhqeICdSsf3wXn/FpTw+gvcTs8Sqm9pznJIIW3SlW1kPQ8Gs3O0U7IeK
	1v6gsv/63HEBJHiloUSQlQP1TZZYGRNZ92QVfy6b7PNU3YXh8TMf2wS1uU8HQhTdE8z+abYj6SC
	UYtVXd8UorbAW0gzZzmP7nRHar5M3k0LV9bjwN7NResjTKzpafFkZIEKpNFvo=
X-Received: by 2002:a17:90b:2889:b0:335:2747:a9b3 with SMTP id 98e67ed59e1d1-3548720a3eamr1376264a91.32.1770179086053;
        Tue, 03 Feb 2026 20:24:46 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.in.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35485eb8d4csm1017430a91.10.2026.02.03.20.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 20:24:45 -0800 (PST)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
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
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH] powerpc: Enable Rust for ppc64le
Date: Wed,  4 Feb 2026 09:54:17 +0530
Message-ID: <20260204042417.83903-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling rust support for ppc64 only.

To support rust a new macro ARCH_STATIC_BRANCH_ASM in powerpc
is added to avoid duplication of inline asm between C and Rust.
This is inline with commit
aecaf181651c '("jump_label: adjust inline asm to be consistent")'

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

Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig                  |  1 +
 arch/powerpc/Makefile                 |  9 +++++----
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 rust/Makefile                         |  1 +
 scripts/generate_rust_target.rs       | 24 ++++++++++++++++++++++++
 5 files changed, 44 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..e9b8d761ed52 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,6 +285,7 @@ config PPC
 	select HAVE_RSEQ
 	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	select HAVE_RUST			if PPC64
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..7ad28cf0fd35 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -172,10 +172,11 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
-KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
-KBUILD_AFLAGS	+= $(AFLAGS-y)
-KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
-KBUILD_CFLAGS	+= $(CFLAGS-y)
+KBUILD_CPPFLAGS		+= -I $(srctree)/arch/powerpc $(asinstr)
+KBUILD_AFLAGS		+= $(AFLAGS-y)
+KBUILD_CFLAGS		+= $(CC_FLAGS_NO_FPU)
+KBUILD_CFLAGS		+= $(CFLAGS-y)
+KBUILD_RUSTFLAGS        += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
 
 CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
index d4eaba459a0e..a6b211502bfe 100644
--- a/arch/powerpc/include/asm/jump_label.h
+++ b/arch/powerpc/include/asm/jump_label.h
@@ -15,14 +15,20 @@
 #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
 #define JUMP_LABEL_NOP_SIZE	4
 
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection __jump_table,  \"aw\"	\n\t"	\
+	".long 1b - ., " label " - .		\n\t"	\
+	JUMP_ENTRY_TYPE key " - .		\n\t"	\
+	".popsection 				\n\t"
+
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key,label)
+
 static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
 {
-	asm goto("1:\n\t"
-		 "nop # arch_static_branch\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+	asm goto(
+		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
@@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 {
 	asm goto("1:\n\t"
 		 "b %l[l_yes] # arch_static_branch_jump\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..7a6daa822cbc 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -390,6 +390,7 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 38b3416bb979..875579b37424 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -256,6 +256,30 @@ fn main() {
         }
     } else if cfg.has("LOONGARCH") {
         panic!("loongarch uses the builtin rustc loongarch64-unknown-none-softfloat target");
+    } else if cfg.has("PPC64") {
+        ts.push("arch", "powerpc64");
+        ts.push(
+            "data-layout",
+            if cfg.has("CPU_LITTLE_ENDIAN") {
+                "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+            } else {
+                "E-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+            },
+        );
+        ts.push("features", "-mma,-altivec,-vsx,-hard-float");
+        ts.push(
+            "llvm-target",
+            if cfg.has("CPU_LITTLE_ENDIAN") {
+                "powerpc64le-linux-gnu"
+            } else {
+                "powerpc64-linux-gnu"
+            },
+        );
+        if cfg.rustc_version_atleast(1, 91, 0) {
+            ts.push("target-pointer-width", 64);
+        } else {
+            ts.push("target-pointer-width", "64");
+        }
     } else {
         panic!("Unsupported architecture");
     }
-- 
2.52.0

