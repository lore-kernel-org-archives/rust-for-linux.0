Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392055;
	b=fCwn0D26dHuEZEDqvZsIvVsAl0hY6nWUA/Q1mP/HfBWxoB6M8Y7mldX6C4H4fHmMGpKU
	 mIXVYclUtg33DltU69I3A0rRwdUHa805DvixK5uBzOUrFtgendYHvo6w1JcMukr5YiT9y
	 fDB/1Kv2cgzTeKHdBFFXQwZGvvez845tHvBzraRo2O+6MmEN7XWL7v0OyNmWrsP/HXxkL
	 j+HJQG4yF4L384I0fho5+294m8X9ncQa98VwCwbpJT+8h+CIU4ic6sEdsEEFiIA6by6ib
	 Gecmlsru1nneDqKJpk6ZSxS/mtkM/Z+5cZCEOuxXBSLKQ/Lem0JjP/lebpATpgGQ/Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NnfkInwAya7NjTTuK2jMhJRA1ZIvM/sYAn41UgqtpW8=;
	b=KP3pMBbBY7G6dxwJswRdxny5t7rMB4dr8PDmLJ/0fUllFIM0QL4uCwZqwPnRUGgJJOmG
	 oNsZpfzrEGNcPUImJzf1mTO8s/h/oM8T37Qde9cYAvwrLbdn93Ew+3yA+PjFWfzxT0IEM
	 Z95KbbEUdtbQZp5dkybieobUnutUrn1BqgKrMNx6+kyKeqB1YUVJ0fUIMDyo3JVHTOdXI
	 3diPuMVztVF/Z9ltbsZlBnd4HwbtRZS7YvahB/WrHRR67i1+1uwcs3ugP/RahvkSY2ep5
	 NwvDwF6w+EWkbbg3QoMQiJV4prrsaw+xhSbOT+9v86qjTZAfmYbG5vTBgRdu3XhNCoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XhBM2jb4;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E9B60A2623
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 20:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2E9B60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XhBM2jb4
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2014612eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 13:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793392054; x=1793996854; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NnfkInwAya7NjTTuK2jMhJRA1ZIvM/sYAn41UgqtpW8=;
        b=XhBM2jb4qnAK6dqETtRuQ4F65UIHT5LAthvKE/Vx23AjVebMk9MVHh16ivQEitPqB7
         7K8HXPPJod9V4gevN6F8Gbd3EVklkW5Uy1rn/paPvb3T9klLrGq5KK1SxnMVOy06fVf/
         oagOK0GynljaGZateriqQdgu3C6xAW108TDSCN4d4ex1++2NDg1a2R6K3Oof0GCNMErx
         ABEEjPxGRTLZsN1mnctFkwLQMeJ6IEKZuftpsu5c/TI86cEV0hn6FFb1t4xIfflCBpMU
         6HyKPcin3E2N6pSK982nqIf7DdD0BXOl7kYVZakPln6t6qrgi8/IYRUJFHEZbu1cclrA
         8sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392054; x=1793996854;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnfkInwAya7NjTTuK2jMhJRA1ZIvM/sYAn41UgqtpW8=;
        b=SXvQwdE9nL/l8vR+RjO7SvJ37Pa+NjJSgFZvIOt8/HqE+/MlabdocppigFs4E8legW
         WUtMuc1Yd41y/AhQo7equ2WlXai8whAzj++LaUYkAcmPbfOABBuDWqulvkwPuo5G5hFA
         c93kY2KgYa5nh3GgKoSZKlPsMk1LAHmZRTYnWj9JzRG069kSBbaO30tK4829epgYWbpZ
         NPxmywp/s0d/o6iqD0eJ3W40vbzKlhytU3fJkbqP71H86T+uyVXUDUqmoiHBeBkY3+7o
         MApxgwiTXIsohrEbT8qDdgfcpI4KRopH1j2aiWFZ+pBhWFONtCGJXTEqS0ZH8tUOX1IE
         ZyXA==
X-Forwarded-Encrypted: i=1; AKwUvBwbRwhgiCkQT9hxTgbVGuwUMqtXg5/pb2+IsoVtZY7vOGc6tri8JzRA0/X6dVfiwZA2aQEbRihO9P7QEMhQdw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKaSIYY970jVzCjVQxhOv+SakSxwq3DZu6XsCRDz3wzjTx/bwjZ
	vifEbWP548Nzb6iDtcvIZC697qJrYilS0d147ksVwex17QUgLOhXpAgDL7Kxx5Zt8UcXGxNU3Y4
	OEK41vQPh9g==
X-Received: from dlef13.prod.google.com ([2002:a05:7022:b0cd:b0:1ad:689e:820])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7e0c:b0:192:fd91:c567
 with SMTP id a92af1059eb24-1ac5d88cb60mr4940019c88.11.1793392053377; Fri, 30
 Oct 2026 13:27:33 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:27:10 -0700
In-Reply-To: <20261030202710.3863806-1-irogers@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030202710.3863806-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261030202710.3863806-4-irogers@google.com>
Subject: [RFC PATCH v2 3/3] bpftool: Prefer zlib-rs over zlib when available
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
NO_ZLIB_RS=1), falling back to -lz.

Decompression of kernel configuration (/proc/config.gz) and compressed
ELF/BTF sections (via libbpf, libelf, and libbfd) processes data that
benefits from a memory-safe implementation. Preferring zlib-rs over C
zlib provides memory safety and improved decompression performance while
keeping bpftool aligned with tools/perf (including sharing libz_rs.a
when building bootstrap bpftool for perf BPF skeletons).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/bpf/bpftool/.gitignore |  1 +
 tools/bpf/bpftool/Makefile   | 57 ++++++++++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 6 deletions(-)

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
index b0f7168e7943..16b9a00963e3 100644
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
2.56.0.317.g454f8302e1-goog

