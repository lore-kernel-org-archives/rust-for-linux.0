Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902184;
	b=zOU1t2QgY6iYCLzC3jZuT6D8lOI8AmZptK/w+9rs/KVesFwplVR1WzqDjRcctA7vDroS
	 f0a3ovoHtgNT4vqvvBOU2iB0rKiHVU2+sQbyOutYk0vcAVqHYuI0wrShvlAxUymwnKMCt
	 QlB4deW3vkShRctf78Jc89qPUYrdZqjmlTy8Hw0EuBB+DPstDgdHH75fCPQwMp7aIFBKT
	 3XnW8OLXSDGEJJNK1rNATP9ziJUSuan4MA8g9VdTejVQ5ygdxgUPUOxWjlJbLnJzpi746
	 WmkPH+zkvB+wCJpbeHlIkMTVjBibrkXGiTJmsrw1jvFBqI9m1+Z27htNrdxGH90WwjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=q9v+ZFLmNtqLPqYVOgg4GzeE1nfWAFRPZItFh8ERzVs=;
	b=GKyZQwrO/+tE6uCDxKdPwisB5DoozlOsvKCRILYjwTCymCRSJmj0n092ovXnojMf9Rm0
	 4rIh11b/uMsKoKRmTRjMoIsFF7xfotBOPFM+xkivHwYg5Qev79LSDSARrrEoliNfoU/5W
	 mfG+pNcmztoOuP5zbpisQY/U2oboP6M4GIjDBz+tv5Ha2TvSIwq84R2/hYy5actp9S1YL
	 2CNynn49Ha5zLjErSrjQzYwtDSU1riqt5dUSqIIB5vawgrp6HPiwD8lMSbCfRhWMGnUHO
	 xLPaqnllfP5LTyxwvzHz0uAbZEofaD7tx+JVXuXTstEW1gCfCqAUjOdrmLePoT0K3pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AbQR68x+;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6FC606A339
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 18:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD6FC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AbQR68x+
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1385117c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 10:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793902183; x=1794506983; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9v+ZFLmNtqLPqYVOgg4GzeE1nfWAFRPZItFh8ERzVs=;
        b=AbQR68x+I8ic8KNrtaEI58C2ggBWsjX8PIux08LY/t6RHO64onvdWLsyCvGVLvQIGx
         /rKft08r+pvhd6VuMAkuxunq19OY6mc93bbvDbJUm42bMIUfBaxDz84VlY7Xzqo6fHO9
         lK7jTrw/NF2U/6gk4RkM4lXqiH1iQXdTMcF+OyORVoCXXVj3j8gugj87hHQYzfyNwkow
         6+tmT6WN3cVpgTQMBxqJXbxzjPH/bULvJILJCVc9zGa2yjV2EQgAjDSkW02pFlj0niiz
         v5/0+SrG1qj+XmCcK1oGeyZRReGOoedvosBoqLQm089k4q8RlO7UZDN+8ufoROxO5o4Z
         U8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902183; x=1794506983;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9v+ZFLmNtqLPqYVOgg4GzeE1nfWAFRPZItFh8ERzVs=;
        b=FSPp1JZOGhIZAHrGm7LeF9nrAx36goO0YsW2p/8/9uIdmwFe10i4rN1oTw+qtM7pLM
         tzW8dB7n6Uv1bAEFyZ98TzonDZ71FsZSuLxtL7IfuTnzRaU5C849zJZ/emHvS4xJvuDU
         vsDSoaE2dwhTZgjjzSrHjRRWEV9PBauLfpm4OpcK/eRhuE25B77NSoQo3oBibrBbqc/8
         Nock/uuCjSb50dn4wty6efj0eDnvcYE6kSGp43oBQ4imgnRQv5sk8xheY2+eQTyPKg5r
         oBkhGLrFBViqmLxJRCBTbmpeRnRWi+aZuSM6GdH7cqwvG1kZSgpKCz7yUWb6Y6V8h2l8
         kLrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhoSmd/V14lnYURgLbq3Ntj7LyzzfbfRtRL7OTT9Mq5kPWxE0x8WMqc9wPZFPQb7TVckBHJ7ReDTnqHAApUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9uVC6jEGGV5wZTP0KXXS1s0hhvJurCZdk2KjwLgsl9Bsx/xhtT
	8soNa6E9qtXVKDazT2uFFDHZpFxS7rd1BdC///UCCRdpDlIX2N0FR+sco4PAFpqdXFkIfNVoclj
	KvvFZje9CEQ==
X-Received: from dlbqs7.prod.google.com ([2002:a05:7023:d07:b0:19d:e7f1:171c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:223:b0:144:f089:b189
 with SMTP id a92af1059eb24-1ac5c369250mr41753129c88.36.1793902182332; Thu, 05
 Nov 2026 10:09:42 -0800 (PST)
Date: Thu,  5 Nov 2026 10:09:23 -0800
In-Reply-To: <20261105180923.3441359-1-irogers@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105180923.3441359-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261105180923.3441359-4-irogers@google.com>
Subject: [RFC PATCH v3 3/3] bpftool: Prefer zlib-rs over zlib when available
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Quentin Monnet <qmo@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add zlib-rs and zlib to FEATURE_TESTS and FEATURE_DISPLAY in
tools/bpf/bpftool/Makefile and use feature_rust_lib to configure
ZLIB_CFLAGS and ZLIB_LIBS when zlib-rs is detected (unless disabled with
NO_ZLIB_RS=1), falling back to -lz. Also replace -lz with $(ZLIB_LIBS)
in static llvm-config --system-libs.

Decompression of kernel configuration (/proc/config.gz) and compressed
ELF/BTF sections (via libbpf, and via libelf/libbfd/libLLVM in static
builds) processes data that benefits from a memory-safe implementation.
Preferring zlib-rs over C zlib provides memory safety and improved
decompression performance while keeping bpftool aligned with tools/perf
(including sharing libz_rs.a when building bootstrap bpftool for perf
BPF skeletons).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/bpf/bpftool/.gitignore |  1 +
 tools/bpf/bpftool/Makefile   | 59 +++++++++++++++++++++++++++++++-----
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/tools/bpf/bpftool/.gitignore b/tools/bpf/bpftool/.gitignore
index a736f64dc5dc..ea2222373634 100644
--- a/tools/bpf/bpftool/.gitignore
+++ b/tools/bpf/bpftool/.gitignore
@@ -6,5 +6,6 @@ bpftool*.8
 FEATURE-DUMP.bpftool
 feature
 libbpf
+libz_rs
 /*.skel.h
 /vmlinux.h
diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
index b0f7168e7943..0b5f3967465f 100644
--- a/tools/bpf/bpftool/Makefile
+++ b/tools/bpf/bpftool/Makefile
@@ -16,6 +16,8 @@ else
 endif
 BOOTSTRAP_OUTPUT := $(_OUTPUT)bootstrap/
 
+LIBZ_RS_OUTPUT := $(_OUTPUT)libz_rs/
+
 LIBBPF_OUTPUT := $(_OUTPUT)libbpf/
 LIBBPF_DESTDIR := $(LIBBPF_OUTPUT)
 LIBBPF_INCLUDE := $(LIBBPF_DESTDIR)include
@@ -38,7 +40,9 @@ $(LIBBPF_OUTPUT) $(BOOTSTRAP_OUTPUT) $(LIBBPF_BOOTSTRAP_OUTPUT) $(LIBBPF_HDRS_DI
 
 $(LIBBPF): $(wildcard $(BPF_DIR)/*.[ch] $(BPF_DIR)/Makefile) | $(LIBBPF_OUTPUT)
 	$(Q)$(MAKE) -C $(BPF_DIR) OUTPUT=$(LIBBPF_OUTPUT) \
-		DESTDIR=$(LIBBPF_DESTDIR:/=) prefix= $(LIBBPF) install_headers
+		DESTDIR=$(LIBBPF_DESTDIR:/=) prefix= \
+		$(if $(ZLIB_CFLAGS),EXTRA_CFLAGS="$(or $(EXTRA_CFLAGS),-g -O2) $(ZLIB_CFLAGS)") \
+		$(LIBBPF) install_headers
 
 $(LIBBPF_INTERNAL_HDRS): $(LIBBPF_HDRS_DIR)/%.h: $(BPF_DIR)/%.h | $(LIBBPF_HDRS_DIR)
 	$(call QUIET_INSTALL, $@)
@@ -115,8 +119,20 @@ ifneq ($(SKIP_CRYPTO),1)
   CRYPTO_LIBS := -lcrypto
 endif
 
+ifneq ($(CROSS_COMPILE),)
+  ifneq ($(MAKECMDGOALS),bootstrap)
+    ifneq ($(RUST_TARGET_FLAGS_$(ARCH)),)
+      RUST_FLAGS += --target=$(RUST_TARGET_FLAGS_$(ARCH))
+    else
+      NO_ZLIB_RS := 1
+    endif
+  else
+    NO_ZLIB_RS := 1
+  endif
+endif
+
 ifeq ($(MAKECMDGOALS),bootstrap)
-FEATURE_TESTS := libelf-zstd
+FEATURE_TESTS := libelf-zstd $(if $(NO_ZLIB_RS),,zlib-rs) zlib
 FEATURE_DISPLAY :=
 else
 FEATURE_TESTS := clang-bpf-co-re
@@ -128,6 +144,10 @@ FEATURE_TESTS += libbfd-liberty-z
 FEATURE_TESTS += disassembler-four-args
 FEATURE_TESTS += disassembler-init-styled
 FEATURE_TESTS += libelf-zstd
+ifeq ($(NO_ZLIB_RS),)
+FEATURE_TESTS += zlib-rs
+endif
+FEATURE_TESTS += zlib
 
 FEATURE_DISPLAY := clang-bpf-co-re
 FEATURE_DISPLAY += llvm
@@ -135,6 +155,10 @@ FEATURE_DISPLAY += libcap
 FEATURE_DISPLAY += libbfd
 FEATURE_DISPLAY += libbfd-liberty
 FEATURE_DISPLAY += libbfd-liberty-z
+ifeq ($(NO_ZLIB_RS),)
+FEATURE_DISPLAY += zlib-rs
+endif
+FEATURE_DISPLAY += zlib
 endif
 
 check_feat := 1
@@ -153,8 +177,29 @@ include $(FEATURES_DUMP)
 endif
 endif
 
-LIBS = $(LIBBPF) -lelf $(CRYPTO_LIBS) -lz
-LIBS_BOOTSTRAP = $(LIBBPF_BOOTSTRAP) -lelf $(CRYPTO_LIBS) -lz
+# Prefer zlib-rs over C zlib when detected (libz_rs.a exports the full zlib C
+# ABI including both gzopen and gzopen64, so it is also compatible with a
+# pre-built libbpf.a compiled against system <zlib.h> with _FILE_OFFSET_BITS=64).
+# When cross-compiling, the host bootstrap bpftool still links against the
+# host's -lz.
+ZLIB_LIBS := -lz
+ZLIB_BOOTSTRAP_LIBS := -lz
+ifeq ($(feature-zlib-rs),1)
+  ifeq ($(NO_ZLIB_RS),)
+    $(call feature_rust_lib,zlib-rs)
+    ZLIB_CFLAGS := $(FEATURE_CFLAGS-zlib-rs)
+    ZLIB_LIBS := $(FEATURE_LIBS-zlib-rs)
+    CFLAGS += $(ZLIB_CFLAGS)
+    ifeq ($(CROSS_COMPILE),)
+      HOST_CFLAGS += $(ZLIB_CFLAGS)
+      LIBBPF_BOOTSTRAP_CFLAGS += $(ZLIB_CFLAGS)
+      ZLIB_BOOTSTRAP_LIBS := $(ZLIB_LIBS)
+    endif
+  endif
+endif
+
+LIBS = $(LIBBPF) -lelf $(CRYPTO_LIBS) $(ZLIB_LIBS)
+LIBS_BOOTSTRAP = $(LIBBPF_BOOTSTRAP) -lelf $(CRYPTO_LIBS) $(ZLIB_BOOTSTRAP_LIBS)
 
 ifeq ($(feature-libelf-zstd),1)
 LIBS += -lzstd
@@ -188,7 +233,7 @@ ifeq ($(HAS_LLVM),1)
   CFLAGS  += $(filter-out -D_GNU_SOURCE,$(shell $(LLVM_CONFIG) --cflags))
   LIBS    += $(shell $(LLVM_CONFIG) --libs $(LLVM_CONFIG_LIB_COMPONENTS))
   ifeq ($(shell $(LLVM_CONFIG) --shared-mode),static)
-    LIBS += $(shell $(LLVM_CONFIG) --system-libs $(LLVM_CONFIG_LIB_COMPONENTS))
+    LIBS += $(patsubst -lz,$(ZLIB_LIBS),$(shell $(LLVM_CONFIG) --system-libs $(LLVM_CONFIG_LIB_COMPONENTS)))
     LIBS += -lstdc++
   endif
   LDFLAGS += $(shell $(LLVM_CONFIG) --ldflags)
@@ -200,7 +245,7 @@ else
   else ifeq ($(feature-libbfd-liberty),1)
     LIBS += -lbfd -ldl -lopcodes -liberty
   else ifeq ($(feature-libbfd-liberty-z),1)
-    LIBS += -lbfd -ldl -lopcodes -liberty -lz
+    LIBS += -lbfd -ldl -lopcodes -liberty $(ZLIB_LIBS)
   endif
 
   # If one of the above feature combinations is set, we support libbfd
@@ -304,7 +349,7 @@ clean: $(LIBBPF)-clean $(LIBBPF_BOOTSTRAP)-clean feature-detect-clean
 	$(call QUIET_CLEAN, bpftool)
 	$(Q)$(RM) -- $(OUTPUT)bpftool $(OUTPUT)*.o $(OUTPUT)*.d
 	$(Q)$(RM) -- $(OUTPUT)*.skel.h $(OUTPUT)vmlinux.h
-	$(Q)$(RM) -r -- $(LIBBPF_OUTPUT) $(BOOTSTRAP_OUTPUT)
+	$(Q)$(RM) -r -- $(LIBBPF_OUTPUT) $(BOOTSTRAP_OUTPUT) $(LIBZ_RS_OUTPUT)
 	$(call QUIET_CLEAN, core-gen)
 	$(Q)$(RM) -- $(OUTPUT)FEATURE-DUMP.bpftool
 	$(Q)$(RM) -r -- $(OUTPUT)feature/
-- 
2.56.0.455.g6c5a503b38-goog

