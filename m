Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22ED2773EE
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771009947; cv=none; b=JVMqpnyEjFB5xeW2mThX43XJmtUyVYc/hRlBVAN+ErQKDEZM9v3dqfV+N9aiq2wYfbQp/yMM/pvLy7BZWseCdNOVgFiqBBgcMe1bd/+ny+IKMNwrCo/itD4u7Nw0nMgLH3irvjOyJuOPgddGAxnovkUr4GVUJEra9PwicRJ2YdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771009947; c=relaxed/simple;
	bh=OcH8w7RuyScwYrcF3u0PgWhZiy0vC1nFvdfSLmhr6ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dFFcBUdEtvDutekua0DS+x+hT+QZM/Yrv8WwfwhmnLHQZYBgjZtehUSLnXu5aUPe/inLHIumUfoJ4xfIAOIQC9+cZa3eaxkrQCePRzcRd7oBDhtwoK2eJw4R+ji3wU9mebttSxiqp1DgyjUBPngnyoxWo5lxlgDdXb4ylB710q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KfKmG/+S; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KfKmG/+S"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65a3c6f587cso1747101a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 11:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771009944; x=1771614744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZpqJAf35CDxn8PSc9O1hec1UhW5JRewyjQeoYcibqk=;
        b=KfKmG/+S5I3jS7qi+NNZtD2TJT/B/XSCTFgYBBgAkw6kMU4v8iC4KwGvE8SzVLFKAD
         ztdL+1st3kRIDvu2auoIi/oGvDEHzV83nptV9i8K2XDb1pUMwFQopfM00UgEzMARHrdi
         EBgxshMgO6gxZD7LzEeNxRTp4HhiBoNe9lUus+q+0F6u9SsEY0k/x93V0252j0L0CUkb
         Liqf3qqcdwJfyjy6+6fDPueamJxgsxNzsYriXIm/rde5XNzborbmf8WRp9wvcBnkRKh0
         SlpElXek8dEdr4hWV+4/XvzNsRcQ8e/ScRrGa3g2cnQHtscFuPklzm09pBsqJVHIQUfU
         tT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771009944; x=1771614744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZpqJAf35CDxn8PSc9O1hec1UhW5JRewyjQeoYcibqk=;
        b=nlqMxbT1X1LF+694V0GAWrX/hkqU6L9wPU6s+OH+ITW0IyLvxd4srEblYTu8dwcTVn
         xxaTzIj/oThPAwcMRDmcso0ltZXIM0kNf5I5MiyCJk8O9kJzeiY9cc9k3/WK1pstg3n6
         qf7OJ/mMpLmukvKGpL97hy1WZ+6ET7qHhzeCNgqugOjnx2DkjlrhDsrj5Epwk6yvXWr/
         YYN/aoGbWWNrCt4b+Ivku+/SnBBxDinVVz5L6Mu6kJdGkUmrYWyP8LWKUhzYv1yseuk1
         ipg22IiNlMeygRC+2jZvrhl9OAZJ2cd4X9pznveltoakbDX2IZlahOzHHpC3n59dBDpb
         0KgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhTqZJxuLZjUoaQ0E/F6Y5cx4sqDvlnPzjc/nVzw+g8o2HvWeVWaEH81MxfsShH4FqKRtqELazJKJTr0VzHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpcseLgMxCmIV4eUq9W1andri1XByaPdIQcLN9d04jHC4dk2EI
	qmupBIKe/a5NKBuKz8FzbBsQZa+U64H2/2PqGy0Lx8ZPO8RNbm4hUuN2
X-Gm-Gg: AZuq6aKFwgvOX8nGhor1PHUpvZKlV8/xekr86WVLur/sqXyTjj7RbGBnd1z4dlo7Zsn
	Gt+L4LhFXsvyrrqZsXyF8SmJnkwn8cXqSHIEkdt6nlgY4C8x3JgJLWyeRTjMpL78/JbdlIJxaH/
	YSH9Uikgpoep+AUGK2vIPIpuk1iVW59XF98hI5LdS7cHJfb9vJOQJYx5MhwE0Aig6HaF1TmQV0E
	Bw6fxUqugzgSl3dqFXNnhdqbwua3sm/8B9eIFnL+GJ4YLqjWcMMHGB6Vb/mWVeRoIKaYH5S7qP8
	K7Ms9X2mvqBxE3Z+KPHp9URDHbef1jr9y1qJiIq69dYkV09KxVOW8NDkgtTd6bXxRsqTrhADRKR
	cK/c0+y6hFPNsVVr6qoYEjf1ZMWC34faK6RN1pNA8SaSYLdXJbtYJHnEtArgXjZVJzUIFThq8t5
	+AhnxsUBbdR3bAcpKAX1tu/bY01rj6F+lpU4TiiBfXCnrPCPXzvWwdBRCJbdM/Blc4H+rBn+4Yj
	Bl04wPVB2ZxABetuKWESjmanRDs0yY=
X-Received: by 2002:a05:6402:398c:b0:65a:3c1b:d87d with SMTP id 4fb4d7f45d1cf-65bb10f4224mr1096630a12.6.1771009943923;
        Fri, 13 Feb 2026 11:12:23 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.local (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f0b55sm950830a12.23.2026.02.13.11.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 11:12:23 -0800 (PST)
From: Dmitrii Dolgov <9erthalion6@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ian Rogers <irogers@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Dmitrii Dolgov <9erthalion6@gmail.com>
Subject: [PATCH v1] tools build: Fix rust cross compilation
Date: Fri, 13 Feb 2026 20:12:09 +0100
Message-ID: <20260213191212.33328-1-9erthalion6@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently no target is specified to compile rust code when needed, which
breaks cross compilation. Detect required target and pass it via
rust_flags to the compiler.

Note that CROSS_COMPILE might be different from what rust compiler
expects, since it may omit the target vendor value, e.g.
"aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus
explicitly map supported CROSS_COMPILE values to corresponding Rust
versions, as suggested by Miguel Ojeda.

Tested using arm64 cross-compilation example from [1].

[1]: https://perfwiki.github.io/main/arm64-cross-compilation-dockerfile/

Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>
---
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
index a6d8ca3e923..f3919838243 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -271,7 +271,7 @@ ifeq ($(PYLINT),1)
   PYLINT := $(shell which pylint 2> /dev/null)
 endif
 
-export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS V BISON FLEX AWK
+export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS RUST_FLAGS V BISON FLEX AWK
 export HOSTCC HOSTLD HOSTAR HOSTCFLAGS SHELLCHECK MYPY PYLINT
 
 include $(srctree)/tools/build/Makefile.include

base-commit: 5d1ab659fb93eed85d6d8b2937013360157032f4
-- 
2.52.0

