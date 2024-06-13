Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18114F10B
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 23:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718321504; cv=none; b=Bq8LypDdN/POdnPIFdhsPbJe/dJVQzFbpfZufhphkPIb8+7zBRel0DxNucHak2yT9EEI0J3A2jzzkd3kOG6j0MNX8d5EXFtZDb9rx8zdwsnfUVXi4SrVa7ZkFiqaZc0Sv41cYjvrpp034eEAHMcKbJDA+u0LMQPQr9a4vP+okrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718321504; c=relaxed/simple;
	bh=ERrHbjKpSrLndzYhYX3mAlB26TR8JNOzocZcSDYCu0o=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=C9U7PLdAe1Q2tnEPI7xkCmrx794iyT4D5gNc4OiYzehnSFrA+clfQOxZj+s8xZ7956gQLzYmT9Z0cm6enCZSSYxU7H+lknqHoHfkPqHCPk6XBhHkknzHQqjaLspUwosZUlK23nIn0B6ZiVXOtLFtsJyv3hXRZqaYIIAgZUa9ULQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H757mI7r; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H757mI7r"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62f8a1b2969so28813867b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 16:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718321501; x=1718926301; darn=vger.kernel.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbSOB/P6de3ygMIG7fdBTW+eS92Yyh1ZhXc/HewO9bA=;
        b=H757mI7rXcdwMc7RqT84wjqCNsslS7Dbcq4i+lTRPlyCJ9P2El/c3bh/VmBHGTkl45
         qeXaKeiIjnCG+LdUNZ1lx8Z3FTpbMkKA/SorZmkj5kaEqXF7L7TYi4eCK0SVCIKyGwQ/
         Aeim6hodHDGdFKp9ZGhlMAach1u16QOKemf0iPa/wVMvm98cMakuQFj+4SOIDBm8s3rx
         xFkI7uMEUiQzKE2LoTeo429sA8/TMcD7FZXRRl3tZgK1DPKgRr8N9Wh8PsKrF8xzpkOg
         gqEE0rJlE8oPKohPLTealsZ/EYdeR1nVt0zp9ookmOHFb/iAqPbqg3CWkrYj2+eyPiny
         lqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718321501; x=1718926301;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbSOB/P6de3ygMIG7fdBTW+eS92Yyh1ZhXc/HewO9bA=;
        b=pf5l6Kvxo1m0KmSISbXkcalPNwlCYIXy+fSy9S7TIWCdw2IHJPxiGlg6xyk+BFtSVN
         knjbtZzIXWORpYeDvitauiZ8YO1k6jd0inK1HWAbpcZphsNJSJMqelmFmYc40ipU6icA
         Y22enCWmD9fn7XqogDkOJm0i/0x9UMYL8d0inc5ytrGIdw51kG/t93LaxT4bxYwbeICp
         QL+nAOgk2Z+BBp5XX01UbepcOVy3Rnz9VnQoB218alGFRzls2x/kHU07Kh96HRexfiEq
         Yc/Kz05fKkpZuN1pYzoheRAGqFg/25yRpRFyrFXtq5Iz93HTCmuezDH6jR8ISH87skwy
         qFFg==
X-Forwarded-Encrypted: i=1; AJvYcCXqNADyJHcqb56U4cWOjvzbXezkrRvXs4B5jJxEZlulIlqBmMl4o07iKUIyuiwUVUJDybzqEiBka5MMOUBO2gmu1ihw98cHzEFCdcfc8Rg=
X-Gm-Message-State: AOJu0YytHorCiEZRI09OOShvF7xDynRrpC3d2we6snfKHJKY/Tb1YBxd
	QYdXVq53pkBxjqZQl2jmeIM7INdtWhMFoz05ZgxvqDsE+K+jUEIHIRo3PiFVey2zUEm3UhTUNf6
	/YvDJGA==
X-Google-Smtp-Source: AGHT+IHE5wM91COFyENsSJs6TdkrEyube8x5jVXFZVcONmu94l5YziFn9V2oVKc/3BzWS0BiAYO2r5J5dtvN
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:96dd:26a6:1493:53c8])
 (user=irogers job=sendgmr) by 2002:a05:690c:d1b:b0:61d:ece5:2bf with SMTP id
 00721157ae682-6322265e839mr3417667b3.4.1718321500762; Thu, 13 Jun 2024
 16:31:40 -0700 (PDT)
Date: Thu, 13 Jun 2024 16:31:15 -0700
In-Reply-To: <20240613233122.3564730-1-irogers@google.com>
Message-Id: <20240613233122.3564730-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240613233122.3564730-1-irogers@google.com>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
Subject: [PATCH v3 1/8] perf build: Add '*.a' to clean targets
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

Fix some excessively long lines by deploying '\'.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.perf | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 5c35c0d89306..acc41a6717db 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -1201,12 +1201,19 @@ endif # CONFIG_PERF_BPF_SKEL
 bpf-skel-clean:
 	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS) $(SKEL_OUT)/vmlinux.h
 
-clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean arm64-sysreg-defs-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
-	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
-	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete -o -name '*.shellcheck_log' -delete
+clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean \
+		arm64-sysreg-defs-clean fixdep-clean python-clean bpf-skel-clean \
+		tests-coresight-targets-clean
+	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive \
+		$(OUTPUT)perf-iostat $(LANG_BINDINGS)
+	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '*.a' -delete -o \
+		-name '\.*.cmd' -delete -o -name '\.*.d' -delete -o -name '*.shellcheck_log' -delete
 	$(Q)$(RM) $(OUTPUT).config-detected
-	$(call QUIET_CLEAN, core-progs) $(RM) $(ALL_PROGRAMS) perf perf-read-vdso32 perf-read-vdsox32 $(OUTPUT)$(LIBJVMTI).so
-	$(call QUIET_CLEAN, core-gen)   $(RM)  *.spec *.pyc *.pyo */*.pyc */*.pyo $(OUTPUT)common-cmds.h TAGS tags cscope* $(OUTPUT)PERF-VERSION-FILE $(OUTPUT)FEATURE-DUMP $(OUTPUT)util/*-bison* $(OUTPUT)util/*-flex* \
+	$(call QUIET_CLEAN, core-progs) $(RM) $(ALL_PROGRAMS) perf perf-read-vdso32 \
+		perf-read-vdsox32 $(OUTPUT)$(LIBJVMTI).so
+	$(call QUIET_CLEAN, core-gen)   $(RM)  *.spec *.pyc *.pyo */*.pyc */*.pyo \
+		$(OUTPUT)common-cmds.h TAGS tags cscope* $(OUTPUT)PERF-VERSION-FILE \
+		$(OUTPUT)FEATURE-DUMP $(OUTPUT)util/*-bison* $(OUTPUT)util/*-flex* \
 		$(OUTPUT)util/intel-pt-decoder/inat-tables.c \
 		$(OUTPUT)tests/llvm-src-{base,kbuild,prologue,relocation}.c \
 		$(OUTPUT)pmu-events/pmu-events.c \
-- 
2.45.2.627.g7a2c4fd464-goog

