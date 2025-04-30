Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD28881E
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 00:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745973699; cv=none; b=AuboOwnGwZyZkaY0+8GK5IRwCHd5LWx8gjLs7Ujq8XAzYqMJOxwjDicdJ+KEm75BjqmZLbFpO+7aBInBQ5cASkvKqiN/Fot7egziIibCPvOB49O/PaXJzNxnPv7z9OGzvAZRGhRB0kUXSteke5F+fMMWOWNNYszWoai1toKD/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745973699; c=relaxed/simple;
	bh=TOqGYGaZz9fvoejadFEUP6gpffSVdtLwcV7I+VdXHNY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kCuW3hO1wYwI5oTdP+zzaG3u5SOx0P709DZAfO97S2NsJtLdTE+229NxrVDB57mepU95Q1kzWzy9SPBkI/S0PwqyKJ4/s5Ih5JR1PnaC1TEgueivJslEJv6yFJK/Yb4ctTusJ1Weuim9UVfGZseAsRGAAQeFDbsYcz1g9cuNnhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=27RO7OP3; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="27RO7OP3"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30a2a2c99f6so1558620a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 17:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745973697; x=1746578497; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nhesGxbQSaQBAbqhCwSPE3SFnfsQfgQz+PVunKpo4yY=;
        b=27RO7OP3CLJD6mZHbzeX5RSBWkKTgm0vMD/y6XxBMQ96/sHF1XHlDGXbryODXHQfZF
         s+IhvPkzb/BWK4IKtI7ZdBql72UgeL8GnzdAwbz1V7t/Z5OR1ShIBEMqGnG/ncfr0Sn5
         L60tmdBBthGoGOR6GKScZV56i/UDBUkCz6+3vVHvf4tgfRhSVGJPfKPQSWNZLVfmQYRz
         WrIBnYOSMknGgdGWR1Pc1/c9GAIzvWQxOxOaH+Oc/UVntdYwr1AJUSAWCS7heodRHkDu
         yICzwE3NJAdYOh7w/RX33fYhW0BhWC/bk7GSIn+GMPxwZCT6SdHBz+NvH75AP7Xcfgge
         KjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745973697; x=1746578497;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhesGxbQSaQBAbqhCwSPE3SFnfsQfgQz+PVunKpo4yY=;
        b=hyWQQb1Gm2H0nkzr4audY6PdsvYz7c6US4Hd7XWxaGB+zv0Utci5cIecmQ2x880adG
         mK1pveqDpA40+PaLbpfCABkudJf9M3yaR68sNrXG4k8d/eMe10VPR+GW48scfkoSk0Yu
         z8dmKI9h6HmKGRJFIAXBhwaQj3HYzSLYKBxnbbMLlo9HwWvLZtf3CfCVUyQqYmSl75G/
         1a7n/7zu+B0p7H2zALQaxRil7uVzVuNcOTiBqmqfjcya3AjpZ4AJkg6A2iYL6suSfKny
         kY7/3osnbz0BWlCmyK7qG9GldKXlpeDWcr3hRmYqhtuJcr5rUx2Yb1cWVIYrWpGc6OP/
         50nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6S7KwjG05QTW5oS66mRi/b+coC73DkewzrSON6x9UX71wbwggSBXlmIcfF/2ctEAuZJibGEoVdQWUa0Ztbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrDDE6h0gStiX11o9rmbGfCTtO+M/83dmTufB7N8u769JEhYp
	KbL2kMurrAzLsOiRQr4ms+vHRSF8FJpgeBwbsy8MMXKzzj6ZnTfyH+jjm1+jPNiZrFHAIPUkp7S
	AsnT24Q==
X-Google-Smtp-Source: AGHT+IHgctZQ0WCaEoa8Pxu0muUZeCA140D06nFHu0NZvmHnGRqOdyuKNhChOgWLSlk7PS9sR8xmBckQ5Ptv
X-Received: from pjbtd4.prod.google.com ([2002:a17:90b:5444:b0:2fa:1fac:2695])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5883:b0:2f6:be57:49d2
 with SMTP id 98e67ed59e1d1-30a33300eb6mr1898732a91.17.1745973697119; Tue, 29
 Apr 2025 17:41:37 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:41:22 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250430004128.474388-1-irogers@google.com>
Subject: [PATCH v2 0/6] Use rustc-demangle for Rust demangling
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
	Daniel Xu <dxu@dxuuu.xyz>, Ariel Ben-Yehuda <ariel.byd@gmail.com>
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Discussion of improved Rust demangling started with:
https://lore.kernel.org/lkml/jgxfnphfo3nzlfipnuuzdlfc4ehbr2tnh2evz3mdhynd6wvrsu@fcz6vrvepybb/
that led to implementing a Rust v0 demangler:
https://lore.kernel.org/lkml/20250129193037.573431-1-irogers@google.com/
Discussion on that patch series led to the rust-lang issue:
https://github.com/rust-lang/rust/issues/60705
where the pre-existing Rust C demangler, authored by Ariel Ben-Yehuda
 <ariel.byd@gmail.com>, was mentioned. There wasn't progress on that
issue and so I've pulled that work into perf as discussed on the
issue.

v2: Changes to references from arielb1 to "Ariel Ben Yehuda
    <ariel.byd@gmail.com>", license tidying as suggested by Miguel
    Ojeda" <ojeda@kernel.org>. Don't change from alternate demangling
    flag from false to true in the test change, make it true from the
    beginning (patch 2).

Ian Rogers (6):
  perf demangle-rust: Add rustc-demangle C demangler
  perf symbol-elf: Integrate rust-v0 demangling
  perf demangle-rust: Remove previous legacy rust decoder
  perf test demangle-rust: Add Rust demangling test
  perf test demangle-java: Switch to using dso__demangle_sym
  perf test demangle-ocaml: Switch to using dso__demangle_sym

 tools/perf/tests/Build                   |    1 +
 tools/perf/tests/builtin-test.c          |    1 +
 tools/perf/tests/demangle-java-test.c    |   17 +-
 tools/perf/tests/demangle-ocaml-test.c   |    7 +-
 tools/perf/tests/demangle-rust-v0-test.c |   74 +
 tools/perf/tests/tests.h                 |    1 +
 tools/perf/util/Build                    |    5 +-
 tools/perf/util/demangle-rust-v0.c       | 2042 ++++++++++++++++++++++
 tools/perf/util/demangle-rust-v0.h       |   88 +
 tools/perf/util/demangle-rust.c          |  269 ---
 tools/perf/util/demangle-rust.h          |    8 -
 tools/perf/util/symbol-elf.c             |   49 +-
 12 files changed, 2257 insertions(+), 305 deletions(-)
 create mode 100644 tools/perf/tests/demangle-rust-v0-test.c
 create mode 100644 tools/perf/util/demangle-rust-v0.c
 create mode 100644 tools/perf/util/demangle-rust-v0.h
 delete mode 100644 tools/perf/util/demangle-rust.c
 delete mode 100644 tools/perf/util/demangle-rust.h

-- 
2.49.0.901.g37484f566f-goog

