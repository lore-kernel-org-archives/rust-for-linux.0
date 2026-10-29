Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291409;
	b=SxvbT0YR22LPnlZR4qM5vA1Qhg7ISA/ee91sV1VV6iVq+TUYQcwq955IuIOEMlKuB21M
	 bsAmYcDSfAFQhzjUG9d5HaMKnV6TtNmQC940eXu2TWfOm645GdVq6nOvvukFHWlOvVyzl
	 6Hg9WkcofTf0/F6ATj0HZ133kqdpDmFkVn/Tu58w1JpwA/SDv6XMEkDapPiPGoSvjwWEI
	 ukxVtm4taCbX7ssu3NkyAybIwW3Bn45EA79gnBOgjEurPr68eDXDnBJfI5L+6cN9vnA61
	 pINWozsI11SnFjagWq7FUrsQg8XNqDVet09m62JtbYtfqiPQ+JesJ+hJydCeOC7qFcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1tQISsVXH4MuUL5EvY+YfKzRDahSJ0kOI6iHukWqnAw=;
	b=PoFCupO22mXqaKwAFvTvxekH/vvBrBWEd7BZO4sfOeNlNyyNn2PUTRXiqDhsqnuKX44B
	 50pqf9lSkTmjVAONCqQcUEV54HEu80S5ubV0yrsOt00kKZDyCX4YlFMBGzaEjTCYnoNZV
	 26enpa5H3ZKf06aZe9bH7IjI73bWuG3E8iPSUQFfcwg6ddoJoFTJjm3knYkpH2CjgSvkd
	 MG1IDq/gdxfNpvkhK/q5vUVXHwNNu4HJw8GjtTIO68cB5g46sZPNObm7+wT+rmhcqHz5D
	 oBoJ5D7xqF27//N8f4QA387+R3suJCkcRX2P+kP1EQVYcgpSV5H2Yqaae1NT4Q2aAfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=czCLSThh;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E8606A326
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 16:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8E8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=czCLSThh
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso3833880c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793291408; x=1793896208; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1tQISsVXH4MuUL5EvY+YfKzRDahSJ0kOI6iHukWqnAw=;
        b=czCLSThhIDCywQeLmh/kVNL/gnPzvxIfDx3CfVfnUPYHpebo1Qsjc6ipuHZMSdpl7i
         GqNnoO3rfV/USNuFL6DOlEvo3x875BYiP7sb2R/yO2V30snu2oUDUncTGUbautoK7Ooy
         QCuqlU3QrkteclxcPGsCPWE7sSzaUNoqZI+K2QjB7IlzFeuaZbVi8wg485cCwBLE2jFv
         0w3xHyCj/2p8+ht+GIvK8n+82iHIm5mEkuzAfLqoYgt3l1U35j4Y513WYXUQhOxFIblm
         Fv/Q+7I9+1pXMHeuotg4GbcCeP2uvDtydj6s/XVAdt0/5RNxkkx50HRs6wlBWGjsAPDQ
         B6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793291408; x=1793896208;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tQISsVXH4MuUL5EvY+YfKzRDahSJ0kOI6iHukWqnAw=;
        b=xYbHlI627WtvzIwZdNVUxyCBzib9KGC1HkRQoL2t+9ichM6YgCehpOeF6ORuHp6tVC
         z7eSGmHkiQx363HgLj8GLcNtAcWqquGacs7W8Obz6G7cwiCemwKjKM8hODKi5elrcGQ6
         AwWXhVh0102wiy2BJG5kTUqm7Rug93c2atwCfL7ZOisyfwjoGJ9mrj7x8jFUwXm35yB/
         cC1pYxQVRuTz4sY4MI6YKtkbKvK8IKyhPWtBkRkpgP1P34gXkWfCAoAoyh0WYUGlDzel
         EzDwV0h4zKecuMyvkb3TJNeJiCE8o90jUXJTKInAE7QjuS0Rr3HWPOSZFBRNM1U/lwZC
         2csg==
X-Forwarded-Encrypted: i=1; AKwUvBwS433EqVJWfltSHsEuUJSIie6JBo5EbpwgqCGimaSBnZLZFPsypav00ljad8i7uYRrkLR/px6xsIi4gae/SA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKQCBGqxPWdTm8Ni0lXWBBHyn39IS4UiPi6a5QTWwAlia7HmDG7
	Id0DCHoB9Gwaj8WawI5mkI0Ko/He6Ic9pOulgT2+EB6B37WsJmRj2002Uxj35mTifd5zw0wBd8x
	uLR/iKhHPHg==
X-Received: from dlbsv1.prod.google.com ([2002:a05:7022:3a01:b0:1a1:3ce6:560b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4513:10b0:147:8a40:cdf3
 with SMTP id a92af1059eb24-1a6ce209ce7mr7204887c88.24.1793291407265; Thu, 29
 Oct 2026 09:30:07 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:29:55 -0700
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029162958.3224280-1-irogers@google.com>
Subject: [RFC PATCH v1 0/3] tools: Add Rust library build infrastructure and
 prefer zlib-rs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Quentin Monnet <qmo@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The zlib-rs project (https://github.com/trifectatechfoundation/zlib-rs)
provides a memory-safe, high-performance Rust implementation of the zlib
compression specification along with a C ABI layer (libz-rs-sys) that is a
drop-in replacement for the standard C zlib library.

On many Linux distributions (such as Debian and Ubuntu), Rust crates like
zlib-rs and libz-rs-sys are packaged as Cargo registry sources under
/usr/share/cargo/registry/ (e.g. librust-libz-rs-sys-dev) rather than as
prebuilt C shared libraries, while other environments may install prebuilt
libz_rs libraries via pkg-config or a custom prefix (LIBZ_RS_DIR).

This RFC series lays the groundwork for building and linking Rust crate
libraries in tools/ (without requiring network access or invoking cargo) and
integrates zlib-rs support into perf and bpftool, preferring zlib-rs over C
zlib when available:

1. **tools build: Add Rust library build infrastructure and zlib-rs feature test**:
   - Adds `tools/build/Makefile.rust` with helpers to locate Cargo crate
     sources in distro (`/usr/share/cargo/registry`) or local Cargo
     registries (`CARGO_HOME` / `~/.cargo`), map `.rlib` prerequisites to
     explicit `--extern <crate>=<path>` flags, and compile `.rlib` and `.a`
     targets directly with `rustc`.
   - Resolves `zlib-rs` compiler and linker flags via `LIBZ_RS_DIR`,
     `pkg-config` (`libz-rs-sys-cdylib`, `zlib-rs`, `z_rs`), or compiling
     `liblibc.rlib`, `libzlib_rs.rlib`, and `libz_rs.a` (with the
     `export-symbols`, `c-allocator`, `std`, and `gz` features) into
     `$(OUTPUT)libz_rs/`.
   - Adds `tools/build/feature/test-zlib-rs.c` checking
     `ZLIB_VER_SUBREVISION == 15` (`0xf`, which distinguishes
     `libz-rs-sys`'s `zlib.h` from standard C `zlib.h`) and linking against
     `inflateInit()`.
   - Extends `tools/build/Build.include`, `tools/build/Makefile.build`,
     `tools/scripts/Makefile.arch`, and `tools/scripts/Makefile.include`
     with reusable Rust build rules, cross-compilation target triples
     (`RUST_TARGET_FLAGS_<arch>`), and the `feature_rust_lib` macro.

2. **perf build: Prefer zlib-rs over zlib when available**:
   - Moves Rust detection ahead of zlib detection in
     `tools/perf/Makefile.config` and prefers `zlib-rs` over C `zlib` unless
     `NO_ZLIB_RS=1` (or `NO_ZLIB=1` / `NO_RUST=1`) is set.
   - Defines both `HAVE_ZLIB_SUPPORT` and `HAVE_ZLIB_RS_SUPPORT` when
     `zlib-rs` is used so existing zlib call sites in `perf` work unchanged
     while `perf version --build-options` and `perf check feature zlib-rs`
     report whether `zlib-rs` is active.
   - Shares `$(OUTPUT)libz_rs/` with the host bootstrap `bpftool` build in
     `tools/perf/bpf_skel.mak` and adds `NO_ZLIB` / `NO_ZLIB_RS` tests to
     `tools/perf/tests/make`.

3. **bpftool: Prefer zlib-rs over zlib when available**:
   - Adds `zlib-rs` and `zlib` to `FEATURE_TESTS` and `FEATURE_DISPLAY` in
     `tools/bpf/bpftool/Makefile` and configures `ZLIB_CFLAGS` and
     `ZLIB_LIBS` via `feature_rust_lib` when `zlib-rs` is detected.

AI Assistance Disclosure (per Documentation/process/coding-assistants.rst
and Documentation/process/generated-content.rst):
- Tools used: Antigravity coding assistant and Sashiko automated patch
  review using Gemini 4 LLMs.
- Summary of prompts and assistance: Interactive pair-programming session to
  identify distro packaging for zlib-rs/libz-rs-sys, implement the zlib-rs
  feature test and Makefile.rust crate build rules, integrate zlib-rs
  detection into perf and bpftool, separate Rust library outputs into
  $(OUTPUT)libz_rs/, and address automated review feedback on crate version
  sorting, cross-compilation flags, and libbpf EXTRA_CFLAGS handling.
- Testing performed: Built and tested perf and bpftool with zlib-rs
  (default), NO_ZLIB_RS=1 (fallback to C zlib), NO_ZLIB=1, and MINIMAL=1;
  verified `perf version --build-options`, `perf check feature`, and the
  `make_no_zlib` / `make_no_zlib_rs` tests in `tools/perf/tests/make`; and
  checked all commits with `scripts/checkpatch.pl`.

Assisted-by: Antigravity:gemini-4

Ian Rogers (3):
  tools build: Add Rust library build infrastructure and zlib-rs feature
    test
  perf build: Prefer zlib-rs over zlib when available
  bpftool: Prefer zlib-rs over zlib when available

 tools/bpf/bpftool/.gitignore             |   1 +
 tools/bpf/bpftool/Makefile               |  56 ++++++++-
 tools/build/Build.include                |  14 ++-
 tools/build/Makefile.build               |  13 +-
 tools/build/Makefile.feature             |   9 +-
 tools/build/Makefile.rust                | 149 +++++++++++++++++++++++
 tools/build/feature/.gitignore           |   1 +
 tools/build/feature/Makefile             |   9 +-
 tools/build/feature/test-zlib-rs.c       |  19 +++
 tools/perf/.gitignore                    |   1 +
 tools/perf/Documentation/perf-check.txt  |   1 +
 tools/perf/Makefile.config               |  89 ++++++++------
 tools/perf/Makefile.perf                 |  32 ++++-
 tools/perf/bpf_skel.mak                  |   8 +-
 tools/perf/builtin-check.c               |   1 +
 tools/perf/scripts/install-build-deps.sh |   6 +
 tools/perf/tests/make                    |   9 ++
 tools/scripts/Makefile.arch              |  14 +++
 tools/scripts/Makefile.include           |  10 ++
 19 files changed, 385 insertions(+), 57 deletions(-)
 create mode 100644 tools/build/Makefile.rust
 create mode 100644 tools/build/feature/test-zlib-rs.c

-- 
2.56.0.313.g2479322e68-goog

