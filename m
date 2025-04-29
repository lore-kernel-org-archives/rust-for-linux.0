Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E19A25485C
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953160; cv=none; b=rFEpF+WUHpn76ayne+EfKsvHuYurVRJOjjf3OjOYAzoJyrP0IS+q8+vo8hd4cHHSwSicQ4Fyf7vl1NTtZdT09BfcD91zTW8xKZgraj1ybvdb5W4KdDO/Co0/Gn5JH7iBCt+8FthcMIhFFW/wpHgHx7/G1zoSn+AOjrjzC4YgJgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953160; c=relaxed/simple;
	bh=YsSJK+JBgrMChothMITffQgSKnUI35D9iUSvUi32+oo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ASqxYOKMKurg45ayTGaLJK3eaIwnYqwYG2yvqu++9dVTrv91DdgVzrHankXONXn3azGND3MrpMlwQhtml+qVMQpBNdT+dbbAbK0YYIlcKw7Wgvb292IAEVO3IfEi4TakKnvLTCvVRa0n6U4Xcg52BcGOxc5UKjBP5sw4jaxB+XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zqOFKBB3; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zqOFKBB3"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394792f83cso4693089b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 11:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745953158; x=1746557958; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cYhstsrbro2bvVLigEn3Nm+qEHX+oY+qpb1akXLGPE=;
        b=zqOFKBB31doJ2mqyVNcp2B53kL/uMma/BsIzglHEylFgkHtGK09mbWyai9I4UwwXlg
         36srNy9b0Ap1BDp31wTcLcbfWW0I4d+lNVscJKYsDVOeOBuyaNBPBF+GSGF91GqHfUYo
         XGFTr/4IqW6qCF9v2bzYDnJSnET2FA3QclgIxn5lV6nJDCmsPBIo3/nK7tBdkCd89Hg8
         BbhDNCx7zW3Zr87tTL0VEOsqp8Zyq4dNkridDaFEUuiS4WKJoccMMLPgDsOzOeDdyv+X
         dRdfUVtcqpO/PtWhVisB8WqfxeszgiEC5T9IqbWlXipFfgFfnYwFQPILvCh1o0NQGJ+q
         u0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953158; x=1746557958;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cYhstsrbro2bvVLigEn3Nm+qEHX+oY+qpb1akXLGPE=;
        b=u2Ds0iWte/hNlC/JFy+H21Fp7II+pt2fhOFvK6kg8bLT+Y2YBTycV9hhoWEBWnxWCx
         vtkEGeYuyPvGkO+8WmiD49kQqGzBuhhRvHILFzXkxIW5sjQh0xtmaXNNPcjah7zjVp31
         ArUuUiQlxdnAoaDWAGNx6n/OMGB22r33GaryXGwNgMQpcXTnN8lM1++lVe+76kiI4/D7
         tYUokMPIAjsGbAVEcc6A+cCI1ycBalNphNNv8l8irN8phyF/04g4C122ophrUtF04bJ/
         bh8COTUi7Sv4vxLLLFJw9yf6q0a1ymUdVh7Ewkrh6F93M1/9iBqNbsAsUr5/hwGWcC6w
         Zrtg==
X-Forwarded-Encrypted: i=1; AJvYcCVrqTmBgy7MXveIeZEexe5r8rD9VJnZOxy0W09drK3uA5fwM2I3ZuPHDn1CM9Gj1s0TnLOvw1/5xjiTY8o78Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnaSv4FJvu2hLaDFR9gCX16tS3TxFID2g8AOWsbRu7Qt08zwt9
	ONMvX7LCbrsiD+wPQbWs5Y9m1vgyMsCjV/e/qMhsCUVuxWctCZIgndim8v/3dgncp808iKjBSZh
	oZXsIlQ==
X-Google-Smtp-Source: AGHT+IHLURQcORFZUyCUqj8vJLBwbANzxkfzIIQ8cSeqkoyYPkmTVhIgayBTFK2Pn7ZLE0MZ25TyzB0tZWfm
X-Received: from pgac2.prod.google.com ([2002:a05:6a02:2942:b0:af3:30b9:99a4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d07:b0:1f5:6c94:2cd7
 with SMTP id adf61e73a8af0-20a899fc1ddmr96977637.42.1745953158400; Tue, 29
 Apr 2025 11:59:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:58:37 -0700
In-Reply-To: <20250429185839.1807005-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429185839.1807005-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250429185839.1807005-6-irogers@google.com>
Subject: [PATCH v1 5/6] perf test demangle-java: Switch to using dso__demangle_sym
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@linaro.org>, Howard Chu <howardchu95@gmail.com>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"

The use of the demangle-java APIs means we don't detect if a different
demangler is used before the Java one for the case that matters to
perf. Remove the return types from the demangled names as
dso__demangle_sym removes those.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/demangle-java-test.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/perf/tests/demangle-java-test.c b/tools/perf/tests/demangle-java-test.c
index 93c94408bdc8..ebaf60cdfa99 100644
--- a/tools/perf/tests/demangle-java-test.c
+++ b/tools/perf/tests/demangle-java-test.c
@@ -3,10 +3,9 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <linux/kernel.h>
-#include "tests.h"
-#include "session.h"
 #include "debug.h"
-#include "demangle-java.h"
+#include "symbol.h"
+#include "tests.h"
 
 static int test__demangle_java(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
 {
@@ -18,19 +17,19 @@ static int test__demangle_java(struct test_suite *test __maybe_unused, int subte
 		const char *mangled, *demangled;
 	} test_cases[] = {
 		{ "Ljava/lang/StringLatin1;equals([B[B)Z",
-		  "boolean java.lang.StringLatin1.equals(byte[], byte[])" },
+		  "java.lang.StringLatin1.equals(byte[], byte[])" },
 		{ "Ljava/util/zip/ZipUtils;CENSIZ([BI)J",
-		  "long java.util.zip.ZipUtils.CENSIZ(byte[], int)" },
+		  "java.util.zip.ZipUtils.CENSIZ(byte[], int)" },
 		{ "Ljava/util/regex/Pattern$BmpCharProperty;match(Ljava/util/regex/Matcher;ILjava/lang/CharSequence;)Z",
-		  "boolean java.util.regex.Pattern$BmpCharProperty.match(java.util.regex.Matcher, int, java.lang.CharSequence)" },
+		  "java.util.regex.Pattern$BmpCharProperty.match(java.util.regex.Matcher, int, java.lang.CharSequence)" },
 		{ "Ljava/lang/AbstractStringBuilder;appendChars(Ljava/lang/String;II)V",
-		  "void java.lang.AbstractStringBuilder.appendChars(java.lang.String, int, int)" },
+		  "java.lang.AbstractStringBuilder.appendChars(java.lang.String, int, int)" },
 		{ "Ljava/lang/Object;<init>()V",
-		  "void java.lang.Object<init>()" },
+		  "java.lang.Object<init>()" },
 	};
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
-		buf = java_demangle_sym(test_cases[i].mangled, 0);
+		buf = dso__demangle_sym(/*dso=*/NULL, /*kmodule=*/0, test_cases[i].mangled);
 		if (strcmp(buf, test_cases[i].demangled)) {
 			pr_debug("FAILED: %s: %s != %s\n", test_cases[i].mangled,
 				 buf, test_cases[i].demangled);
-- 
2.49.0.901.g37484f566f-goog

