Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F131553BC
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 18:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718303567; cv=none; b=sdB6NmqwbJLvDgRh3135/KV+7452U/bpP2eU5BGAptI/M+96PwtpwrgJYF4R3Nj/Zwh1/aDbvR1mmxsrpgKlv66Yu2qxx1Szqh7ls0pshTij6p3HfRWobm6JunRn1D/AU3jwnwCPjjpi6GT6v60dHY1AyuTDCVKsn0kVh7YU+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718303567; c=relaxed/simple;
	bh=YCtNNA8v+ohwBpi9Rus0CYVSC7ZO/eTuaCLvVJt5XpM=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=fXmdEt2s2PCbZr/rW5ZRYBdHMjO0Od7/i4bC2wxE1BRDw0gFCPKyPfm2b3dP4kPrb0jriNbZR+OpQVnMasmeYudJNsRe0PyevYFwBvZc8NGMNVU138Y1jhwe7QPEdXPIOywevOfHlPw6T8xtc1mseb7UCpkOAS65035PsciQKBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sIGemxPJ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sIGemxPJ"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-627f43bec13so22886967b3.0
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 11:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718303564; x=1718908364; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VsC80hpqUOVrh72YOJDioHn4WeJ5/uS/HucL7CDuoyM=;
        b=sIGemxPJmbf2lKUHiAspy5SuPSh6XniGN2354rlm69qOLzNIs39f+llazou1DeLuA+
         PzLym+q31Sg0jZucPHTB4Dc0zq3UepFYf0k0Xdrf8fhs4pPnZjjpGn1usibd9PCpeGZb
         LQT/tSC7FIk+AU3swi8rvawYxXoxBFI+Q3shT2nW1fpf5ZNiT/AbcQgan8prj2cNwwjo
         vjThl9WMfPjsyorhwDOeVZ3GGFvinWp68lb/4QTUpEZiNMAvcvxLYFFg31b/WgToldIb
         KEkoWWdrkQfrEKtbK6SK57psm3+DLGzx1Y3wMyqocozQg8D37ujRj1Hw7cVtjQorcUjv
         epCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718303564; x=1718908364;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VsC80hpqUOVrh72YOJDioHn4WeJ5/uS/HucL7CDuoyM=;
        b=BOfM8owA0PI04tLCh0aLJTglY94iLjPPyJFV4TuFnZqyFQ2Rctk4anOP3RZM3QURTZ
         NG0SzV6yCRyJBa/lcgVrhDj7YTfELodQyDR+NwoYPjQ0xM7XVF3mCh4kvAW8vXvttN+P
         tDnHDTtJ+XZdWugFHl6sknwfPJbfzNvQ+gMXkE5FkwH0aox86dJnLT8v0DC8w9f5QEzs
         chJlye+br2k0EUbsOKP03MhSxE0Yuw6uHUxvzKMvDXCYV350R3zJg/EINJn5NGlqacnF
         3o6Q5hHN8GSU88NXCOuPitZn1WzrCepFcxrYoYAOQBpHHc/Fp+6LtPjJZM/ZajRV7jRV
         UMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMFA6EBSTx3EumYKrBQrc0aoLMQstO0s/IompOdSPuRg+I6R10ew8dIkHvEH7sR9jV4A+LQotPKdtbxnSKIxQ49qYGP35r2V0O7BN8qVU=
X-Gm-Message-State: AOJu0YyZQO1z4N1DcaEXlqL9JNYWunqIPfTIvCP7hsxNG3+ltMj1s+Ba
	KWsTNjTccTNoo/iP95K8jiXtaSV0QCegI8SDWVNYUmTXUKBxvHXv7AoGf5nInrI4tb+nVC8u5EJ
	b9oiwZQ==
X-Google-Smtp-Source: AGHT+IEdqa6Cq2DjAQ1hydcxNB6Fk+xXGdzWy6Gy93AqEv1pt5Ye/DroFSzoO6amfQnl0ylP95kficGysIqg
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:96dd:26a6:1493:53c8])
 (user=irogers job=sendgmr) by 2002:a05:690c:6ac8:b0:622:d1d3:124 with SMTP id
 00721157ae682-632248126c8mr799617b3.10.1718303563655; Thu, 13 Jun 2024
 11:32:43 -0700 (PDT)
Date: Thu, 13 Jun 2024 11:32:21 -0700
In-Reply-To: <20240613183224.3399628-1-irogers@google.com>
Message-Id: <20240613183224.3399628-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240613183224.3399628-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Subject: [PATCH v2 5/8] perf bench: Make bench its own library
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nick Terrell <terrelln@fb.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Kees Cook <keescook@chromium.org>, Andrei Vagin <avagin@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Ze Gao <zegao2021@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	coresight@lists.linaro.org, rust-for-linux@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Make the benchmark code into a library so it may be linked against
things like the python module to avoid compiling code twice.

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: James Clark <james.clark@arm.com>
---
 tools/perf/Build         |  4 ++--
 tools/perf/Makefile.perf | 11 +++++++++-
 tools/perf/bench/Build   | 46 ++++++++++++++++++++--------------------
 3 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/tools/perf/Build b/tools/perf/Build
index fddd45ab35b4..2787f5630ff7 100644
--- a/tools/perf/Build
+++ b/tools/perf/Build
@@ -1,4 +1,4 @@
-perf-y += builtin-bench.o
+perf-bench-y += builtin-bench.o
 perf-y += builtin-annotate.o
 perf-y += builtin-config.o
 perf-y += builtin-diff.o
@@ -35,7 +35,7 @@ endif
 
 perf-$(CONFIG_LIBELF) += builtin-probe.o
 
-perf-y += bench/
+perf-bench-y += bench/
 perf-test-y += tests/
 
 perf-y += perf.o
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 9fa69dd0b472..4a3c000b9845 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -425,6 +425,9 @@ endif
 
 export PERL_PATH
 
+LIBPERF_BENCH_IN := $(OUTPUT)perf-bench-in.o
+LIBPERF_BENCH := $(OUTPUT)libperf-bench.a
+
 LIBPERF_TEST_IN := $(OUTPUT)perf-test-in.o
 LIBPERF_TEST := $(OUTPUT)libperf-test.a
 
@@ -438,7 +441,7 @@ PERFLIBS = $(LIBAPI) $(LIBPERF) $(LIBSUBCMD) $(LIBSYMBOL)
 ifdef LIBBPF_STATIC
   PERFLIBS += $(LIBBPF)
 endif
-PERFLIBS += $(LIBPERF_TEST) $(LIBPERF_UI) $(LIBPMU_EVENTS)
+PERFLIBS += $(LIBPERF_BENCH) $(LIBPERF_TEST) $(LIBPERF_UI) $(LIBPMU_EVENTS)
 
 # We choose to avoid "if .. else if .. else .. endif endif"
 # because maintaining the nesting to match is a pain.  If
@@ -740,6 +743,12 @@ $(LIBPMU_EVENTS_IN): FORCE prepare
 $(LIBPMU_EVENTS): $(LIBPMU_EVENTS_IN)
 	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $<
 
+$(LIBPERF_BENCH_IN): FORCE prepare
+	$(Q)$(MAKE) $(build)=perf-bench
+
+$(LIBPERF_BENCH): $(LIBPERF_BENCH_IN)
+	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $<
+
 $(LIBPERF_TEST_IN): FORCE prepare
 	$(Q)$(MAKE) $(build)=perf-test
 
diff --git a/tools/perf/bench/Build b/tools/perf/bench/Build
index c2ab30907ae7..279ab2ab4abe 100644
--- a/tools/perf/bench/Build
+++ b/tools/perf/bench/Build
@@ -1,25 +1,25 @@
-perf-y += sched-messaging.o
-perf-y += sched-pipe.o
-perf-y += sched-seccomp-notify.o
-perf-y += syscall.o
-perf-y += mem-functions.o
-perf-y += futex-hash.o
-perf-y += futex-wake.o
-perf-y += futex-wake-parallel.o
-perf-y += futex-requeue.o
-perf-y += futex-lock-pi.o
-perf-y += epoll-wait.o
-perf-y += epoll-ctl.o
-perf-y += synthesize.o
-perf-y += kallsyms-parse.o
-perf-y += find-bit-bench.o
-perf-y += inject-buildid.o
-perf-y += evlist-open-close.o
-perf-y += breakpoint.o
-perf-y += pmu-scan.o
-perf-y += uprobe.o
+perf-bench-y += sched-messaging.o
+perf-bench-y += sched-pipe.o
+perf-bench-y += sched-seccomp-notify.o
+perf-bench-y += syscall.o
+perf-bench-y += mem-functions.o
+perf-bench-y += futex-hash.o
+perf-bench-y += futex-wake.o
+perf-bench-y += futex-wake-parallel.o
+perf-bench-y += futex-requeue.o
+perf-bench-y += futex-lock-pi.o
+perf-bench-y += epoll-wait.o
+perf-bench-y += epoll-ctl.o
+perf-bench-y += synthesize.o
+perf-bench-y += kallsyms-parse.o
+perf-bench-y += find-bit-bench.o
+perf-bench-y += inject-buildid.o
+perf-bench-y += evlist-open-close.o
+perf-bench-y += breakpoint.o
+perf-bench-y += pmu-scan.o
+perf-bench-y += uprobe.o
 
-perf-$(CONFIG_X86_64) += mem-memcpy-x86-64-asm.o
-perf-$(CONFIG_X86_64) += mem-memset-x86-64-asm.o
+perf-bench-$(CONFIG_X86_64) += mem-memcpy-x86-64-asm.o
+perf-bench-$(CONFIG_X86_64) += mem-memset-x86-64-asm.o
 
-perf-$(CONFIG_NUMA) += numa.o
+perf-bench-$(CONFIG_NUMA) += numa.o
-- 
2.45.2.627.g7a2c4fd464-goog

