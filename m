Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50805326927
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404480; cv=none; b=J4E1vvTmoJYrbAiO8zm5oDTgEvNK8amUMfkeBjQ2bcO7197vvfjyq4iOH6lUr2lfM/H/gs5uLm8wz7gHJNuZll+yGvNXaXL6ve5Ep2/3N+QBIWJDW3M9Np0VdQ3osj+6HrkqM7QMFuE3lun+iTCndLmMDkk2i1nMVEXK5kVj0K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404480; c=relaxed/simple;
	bh=db8UoqXBuWlXRrOvDWR6NTe1jADOw1CPeFcMqQs31ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LiskK6bE78DZmTsz4t1VhwdicQVhcumOcK+UhkaejpOjTEqqkrY0WuwYit89p6sZOwrJhkFM6qb82MGufb78RCaq0Cytn+0LA3bwGe8SxliQeocP+kHJ0+CqA8VNnWleqXOF3W9pHTze0K3i72e8VVUTR3hln+Tht5rUDxu/te4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ia9dWHdk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia9dWHdk"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b884d5c787bso686311066b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 00:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771404478; x=1772009278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E/5hsVF/ES9WFVEKAhexr1uhkj6T0T0kWE33e5/ideo=;
        b=ia9dWHdkFSmapGtt7InHJ9ylZD+FIhNJxzak6qdgRKDs5NaLvhPrmo1fG76sZrOPFr
         BeZdgy5FdFiN1xPCOzb8Ica/ZaAfR6L//kzmfy68vAbl/aIakPgdi46CAtQYY+3PhKxU
         dT+2Hf5YHFR1idOH0aWXNU2Rn3E+ydmWZF2hm8jfX2zk1eSTPL/ZU+desn/rZuRzLABq
         z+2jBVPo6SaumzydqAVwmA4442Sg4Y88pxLePlfby1+Zno0oMv2s+Z6Gu30h5UhRYRQ8
         DwNCiHfukvrBScxm2cd9vjBDSxN47dZvK67FrKsN9CyzSpKKCV5tnbnc0dvm0ZuZb4T/
         gZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404478; x=1772009278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/5hsVF/ES9WFVEKAhexr1uhkj6T0T0kWE33e5/ideo=;
        b=XyO885iCAYU0Pi0Mbmxclxc1dUieXT66JwwTpWnhKiP4Iu91wgNdmMxpU85OjolbEn
         78uLC3Z/uF/P7hwipYLmJA6Z5qhcTdPgXDAYTCZ1E4lEcRJ6U3KHAm9HVGt0NQOhoOHA
         IFDFsAvIjfAKSOssEvKa4D02yIJ6Yr4vHdfQqzL98orCP6aLnsbgSoQZyyn6vzv+3US9
         7A51m8E6mq/yANOaBLiN8kACOi9HTc87n++s35gh1272Dx8u4HwvCUQJeycUo9L6v05h
         sxuIpDJL3aYB93RX46xoRG0/IvlgtzvrgaIrhuCY68hi+3mR4ZJuv5xvbZHStRxPwWey
         myNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdUubzwawdWJPRiDLGmIGgrGsC5o1yhl77jkBqtigi/3DZ1ftKZYbdORrrtDptxCh6e2FArRKcODlT2VDeCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ilqh/TzT5sXCt3DNJW4cdYaBUL8371fkAgFT2XchRX2LOiUr
	OnUaaXnMBMvvVlPED+Td8qgRXdfMgIpTBRjJck5G7W/lEhU9L7ykj73j
X-Gm-Gg: AZuq6aIwj2iZpZ1eP8KBIESWmW0Bt+Kgae44rnpwVm6Uvs067b3SsrJsWHQvGAo2M+q
	aSltGK/Z8HCJKuU3lI4BX1l4oz6p3u1+A4l6Cv9EL0ZwcxbkhHmfQxecxCisenkJk1i4S1jz9AK
	VVnes0HDswQLGcuVpVtqHCgac/kfWiwG9HNom3wyVW9qSq4MXZz4zKx0aLycx5wojWuao89OU+q
	IoxJqjvFcISvSfbTDC/tJEG0XJiAv/ALEyZMo/kqihwnloHtiVHb/1tqcw6izGGtO5Mq0syBZHX
	5V95FlfvF3ffMNOaGxSWsQTkf0DDT4F+NYVjUUr8P3N3RWXakiFDiTzcVFjMeJGCIQhPJ8Nd//i
	OA/HS6uPwtUFiN/SafqWMUSvc74hm5Mbz7d2X35trAraakpwUojBlzxpICPF9X0u7lOPa+fnqtC
	mEw1xNHPvlHKUjHdXGs+E0w1lvxpWjWfWrYApD6HXKtPWK7tTrPKlZ+R9wl7IO/8kbyb9X12Yei
	MT7HXZSvSNmTQ5EOG6DNl3Iif0Jyl0=
X-Received: by 2002:a17:906:6a28:b0:b8f:a195:bad8 with SMTP id a640c23a62f3a-b8fc3cb90f5mr718449766b.45.1771404477251;
        Wed, 18 Feb 2026 00:47:57 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.local (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7629b56sm447920766b.37.2026.02.18.00.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:47:56 -0800 (PST)
From: Dmitrii Dolgov <9erthalion6@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Dmitrii Dolgov <9erthalion6@gmail.com>
Subject: [PATCH v3] tools build: Fix rust cross compilation
Date: Wed, 18 Feb 2026 09:47:25 +0100
Message-ID: <20260218084736.33114-1-9erthalion6@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently no target is specified to compile rust code when needed, which
breaks cross compilation. E.g. for arm64:

      LD      /tmp/build/tests/workloads/perf-test-in.o
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
    [...repeated...]
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(code_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in generic ELF (EM: 62)
    aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a: error adding symbols: file in wrong format
    make[5]: *** [/perf/tools/build/Makefile.build:162: /tmp/build/tests/workloads/perf-test-in.o] Error 1
    make[4]: *** [/perf/tools/build/Makefile.build:156: workloads] Error 2
    make[3]: *** [/perf/tools/build/Makefile.build:156: tests] Error 2
    make[2]: *** [Makefile.perf:785: /tmp/build/perf-test-in.o] Error 2
    make[2]: *** Waiting for unfinished jobs....
    make[1]: *** [Makefile.perf:289: sub-make] Error 2
    make: *** [Makefile:76: all] Error 2

Detect required target and pass it via rust_flags to the compiler.

Note that CROSS_COMPILE might be different from what rust compiler
expects, since it may omit the target vendor value, e.g.
"aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus
explicitly map supported CROSS_COMPILE values to corresponding Rust
versions, as suggested by Miguel Ojeda.

Tested using arm64 cross-compilation example from [1].

Fixes: 2e05bb52a12 ("perf test workload: Add code_with_type test workload")
Link: https://perfwiki.github.io/main/arm64-cross-compilation-dockerfile/ [1]
Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>
---
Changes in v3
- Improved commit message, add an example of the compilation failure

Changes in v2:
- Map supported CROSS_COMPILE values to corresponding Rust targets

 tools/build/Build.include  |  9 +++++++++
 tools/perf/Makefile.config | 14 ++++++++++++++
 tools/perf/Makefile.perf   |  2 +-
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/build/Build.include b/tools/build/Build.include
index e45b2eb0d24..cd0baa7a168 100644
--- a/tools/build/Build.include
+++ b/tools/build/Build.include
@@ -98,6 +98,15 @@ c_flags_2 = $(filter-out $(CFLAGS_REMOVE_$(basetarget).o), $(c_flags_1))
 c_flags   = $(filter-out $(CFLAGS_REMOVE_$(obj)), $(c_flags_2))
 cxx_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=\#s" $(CXXFLAGS_$(basetarget).o) $(CXXFLAGS_$(obj))
 
+###
+# Rust flags to be used on rule definition, includes:
+# - global $(RUST_FLAGS)
+# - per target Rust flags
+# - per object Rust flags
+rust_flags_1 = $(RUST_FLAGS) $(RUST_FLAGS_$(basetarget).o) $(RUST_FLAGS_$(obj))
+rust_flags_2 = $(filter-out $(RUST_FLAGS_REMOVE_$(basetarget).o), $(rust_flags_1))
+rust_flags   = $(filter-out $(RUST_FLAGS_REMOVE_$(obj)), $(rust_flags_2))
+
 ###
 ## HOSTCC C flags
 
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index a8dc72cfe48..f40c5a70520 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1163,6 +1163,20 @@ ifndef NO_RUST
     CFLAGS += -DHAVE_RUST_SUPPORT
     $(call detected,CONFIG_RUST_SUPPORT)
   endif
+
+  ifneq ($(CROSS_COMPILE),)
+    RUST_TARGET_FLAGS_arm	:= arm-unknown-linux-gnueabi
+    RUST_TARGET_FLAGS_arm64	:= aarch64-unknown-linux-gnu
+    RUST_TARGET_FLAGS_m68k	:= m68k-unknown-linux-gnu
+    RUST_TARGET_FLAGS_mips	:= mipsel-unknown-linux-gnu
+    RUST_TARGET_FLAGS_powerpc	:= powerpc64le-unknown-linux-gnu
+    RUST_TARGET_FLAGS_riscv	:= riscv64-unknown-linux-gnu
+    RUST_TARGET_FLAGS_s390	:= s390x-unknown-linux-gnu
+    RUST_TARGET_FLAGS_x86	:= x86_64-unknown-linux-gnu
+    RUST_TARGET_FLAGS_x86_64	:= x86_64-unknown-linux-gnu
+
+    RUST_FLAGS += --target=$(RUST_TARGET_FLAGS_$(ARCH))
+  endif
 endif
 
 # Among the variables below, these:
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 11b63bafdb2..f7b936deeaa 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -274,7 +274,7 @@ ifeq ($(PYLINT),1)
   PYLINT := $(shell which pylint 2> /dev/null)
 endif
 
-export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS V BISON FLEX AWK
+export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS RUST_FLAGS V BISON FLEX AWK
 export HOSTCC HOSTLD HOSTAR HOSTCFLAGS SHELLCHECK MYPY PYLINT
 
 include $(srctree)/tools/build/Makefile.include

base-commit: dbf0108347bdb5d4ccef8910555b16c1f1a505f8
-- 
2.52.0

