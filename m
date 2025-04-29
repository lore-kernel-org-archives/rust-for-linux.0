Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42262561B6
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953162; cv=none; b=nun9Ym9L3yLdjUvsHqQYeAqVdUcy6h2HgvvjbYZ19kym+f1scr3OL4rTn6C+YkhlaMMd/tjAfTmJr3RgJRfOowYMT+GuqoEztcOjHWbaWlavTfxiZItOGay6P9tpJeoHi3oDuW+siazvAmS05l+JUQ2sNEhk23inzxcWkqMIHk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953162; c=relaxed/simple;
	bh=pLvxUdxndsr2wYkJQYg49ecez/cviTwRj3eN4nJwgxo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=guKeXWqTiBxDD7MXJZV6c47uLhNF/SlJAey3kXtylNiNyOCYMh5rxRdlHW7k3eSkEvmty2d8EzQ7eFbsTisMLDqkk+ThWy/ccxioorZGE8+L4qhkFu5ik07i52VU5tO2WIIM24SprEUcbOnzFqfFg/n/My/AzJY24w7eupSuekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zDymbMwI; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zDymbMwI"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7375e2642b4so4401282b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745953160; x=1746557960; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VWjkucJuMaosxMcy1Z3rSUNsLtdDY3ZZywavpz7InSY=;
        b=zDymbMwInQKAVcErEFRAR0EnDlvRzMLF6vT3IWe/I5jn6ZqKYWFMQTzDb/yKLiK8MQ
         0llb0Hz6Jj+P+dFCNAWXh6EGpTJ0Fr2BEVbldENl0IKRziQvzfiuLNwkszqIaIBtwEIu
         LQqnEA/4NCTx6le+xKRAAAyTWO387bdFwFjJMgFTmiD2eemwsUwEYxU5o9ARgFGu/Ja0
         2tbSQlPw6dR3elEFfbdi3Ur+fLZw09tCJQGzy/zPSqJXJMwkC18qgAu/N+5QfSugwpkE
         Y6hQrLKlhzHdbotbu5XpuyXIncHGemGaBe4mKv2S1dpF+ASEGDZY4c+bZ4OmtX0zhqPE
         lngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953160; x=1746557960;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWjkucJuMaosxMcy1Z3rSUNsLtdDY3ZZywavpz7InSY=;
        b=ejOkuRgTLZjcTebH8rFmk8Y2XflPnMNK2T1ApP/Z0RW9uyN2FmS9CnNMZQRuIWUKaM
         NZqcPD8+dmHig4ux2FHDGTT5/D/RwelWqQLg+6IujYdkzsUXhS4uDm8akvlHYFJZj7pg
         ALZdM0AdDKjIKPyQzfslNAdbTgQgYDNVbYn5k9ve3Ui8zFIyv+yPpn+g590H8SKSTaYY
         kq68FIdLPwZf9vlF1itNQvnd72QupO3YyRHGgVT9PiYNfz50dsBeHa7IPqe5TPNYx0Yh
         4vJRjCq4vqeXfCu+qBRg1h3D/s0WcAWZfTCmpH4DEULos7E0iWAc+1FtphoZz8RA/b0z
         u1+A==
X-Forwarded-Encrypted: i=1; AJvYcCWXgk8hNsTHtYW9djDntDE/sR2uD7z0Mmp8zHgU6kDRNamtAHoEg7At2bFkULr6LuAdnVpYlUfXO8XXf+69yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrrAARutgw6gbFw+KEaq2QWxnjTbzLqebNJ90qU6Ib/oAl2Gtg
	br6ZG3ohjvsa+SPfd0UTMRHKXWRmhSzWWuqCi2Gr29J+RPXVpO6An4Zlsx0cs4UHuLKPL1dntOd
	Vjiakag==
X-Google-Smtp-Source: AGHT+IE9GdSCCd1KtURt295JV/22SX3CPi6lw9sUTh1EaaTFjgWPJE0uM3WPfZxAJUze5crpoLd8uFNTRjF3
X-Received: from pfbkq4.prod.google.com ([2002:a05:6a00:4b04:b0:736:56a2:99ac])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d504:b0:1f5:7c6f:6c8a
 with SMTP id adf61e73a8af0-20a899fc238mr130852637.35.1745953160176; Tue, 29
 Apr 2025 11:59:20 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:58:38 -0700
In-Reply-To: <20250429185839.1807005-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429185839.1807005-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250429185839.1807005-7-irogers@google.com>
Subject: [PATCH v1 6/6] perf test demangle-ocaml: Switch to using dso__demangle_sym
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

The use of the demangle-ocaml APIs means we don't detect if a different
demangler is used before the OCaml one for the case that matters to
perf.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/demangle-ocaml-test.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tools/perf/tests/demangle-ocaml-test.c b/tools/perf/tests/demangle-ocaml-test.c
index 90a4285e2ad5..612c788b7e0d 100644
--- a/tools/perf/tests/demangle-ocaml-test.c
+++ b/tools/perf/tests/demangle-ocaml-test.c
@@ -2,10 +2,9 @@
 #include <string.h>
 #include <stdlib.h>
 #include <stdio.h>
-#include "tests.h"
-#include "session.h"
 #include "debug.h"
-#include "demangle-ocaml.h"
+#include "symbol.h"
+#include "tests.h"
 
 static int test__demangle_ocaml(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
 {
@@ -27,7 +26,7 @@ static int test__demangle_ocaml(struct test_suite *test __maybe_unused, int subt
 	};
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
-		buf = ocaml_demangle_sym(test_cases[i].mangled);
+		buf = dso__demangle_sym(/*dso=*/NULL, /*kmodule=*/0, test_cases[i].mangled);
 		if ((buf == NULL && test_cases[i].demangled != NULL)
 				|| (buf != NULL && test_cases[i].demangled == NULL)
 				|| (buf != NULL && strcmp(buf, test_cases[i].demangled))) {
-- 
2.49.0.901.g37484f566f-goog

