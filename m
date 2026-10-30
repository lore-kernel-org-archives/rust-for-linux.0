Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392048;
	b=Uvkv/OOGyEu7g33TNl3Zq/Zu8tS4/7Cu6kdHgkngS60rCQw3ZDeemEFFrnN225LjOyCo
	 fMvWWlLy+m6gOQb5jzy8+DdN9SeSJMPDBrW9Boi6+HTTGd1l3KWK1N7KRJuIdurtS+GoZ
	 zXYkFSI6kpZpQxpv16cX5lsOqxI1BH5+B4Jko1DtBvpXKaas6isnvuWAjDYch8fZ+WKyW
	 uj+9P+lr3Tsx/Ujrw/Sh2RAKPVAGDWJaL9Sxh+tjD82eB1eb0nxGNsmqt6CDqLcTe1300
	 Z9COpBhJLVMX45/8/whc8QRd2K37lEWxGt2urZ0buJAwA9jG9fzIrtXdiGne7ja1mLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=5lyHfD9gDVe46qmCqsjdgsoBvqJkPXERQXV0cBBlSa4=;
	b=Eyh1gC47RdIN1sesCa+r3v0BviQi299nUYKV9t6c5PMQIXKDkbM0GHoZgeO3RWj/Hdsy
	 lgSfVxwAvsL/qtfg2QbKfLZGTKLXZS/Jdt/fygVGb5bnvzhl3PTfhabrAomy9J4PW37e9
	 kcED3oFIyMT2CbW1U65BFYunBHlc7SdXVw2wuDnoT0Svvn79LIb8++ZAe7Pd9x7rHX3M+
	 LJI3FZELPtnKeKhMozjGIW4vD4ir7cSKzKHc8zNGNH2W7qrTU+EfaCy2bQWp/mwbu2R+e
	 iaS/+W/exWvCb+RD49qTGLAoTtz8eFHbeYalids/EevQmuItqd1G30NNM+y2kQ2Gbqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="F5F/X96P";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D64606A31F
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 20:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D64606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F5F/X96P
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so1633471eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 13:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793392047; x=1793996847; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lyHfD9gDVe46qmCqsjdgsoBvqJkPXERQXV0cBBlSa4=;
        b=F5F/X96P1iqUjyleF+j+g+WMxCXe8TUdoAZ9XNl+xhg6eBka4wv1Je+Fp8Acg1oyi0
         pcRS08rsh5H8DOB4G0zbvClmRh6T3oKDS5qXv1tMV6k1Nwf9AdWosKfnO4cq9esqjjp/
         iroU6gt2PY/vbz4JDwzwzQwy7ZdLQVw+IYMILW+FWPvHx1wd8yFWV7rCERIPgfexW7dF
         gzxLi7Dz7rAJwAkUvRQNLbUP9LPN4mdgOMJxJSDpj/bQEMaDxf/U/pNy5eOyJ2XBYkXi
         ICBIwL9mst9ncb13ysGM6hO1jj2up3SkvMxRqkYBqhQYxF5ysalWZ6MHNZDB+eBgoi05
         FvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392047; x=1793996847;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lyHfD9gDVe46qmCqsjdgsoBvqJkPXERQXV0cBBlSa4=;
        b=mpJYfmncbCaiChFiyWAk+34EfU4njWnkjb+xWXDsmcVXFbb/9ea3CkxEbbnYFpr2DB
         qrR5mHlk/Ehhu1pt2gxhF2EScyQ/6jnyiz04iVdN6daYLcSCbKhK68anUGM3DCU7yZGW
         PMrnJDIuen9GlSMpO5JsBvM6WI7MMfNkQ4rvoDWtTXIv5mBHDjMwn84v3Bezi9fJ8sV4
         f4jpfZOOwXAEIBmXxIFTEATjxoxXN0ETlBy/7ejn6NbqRp2+UlAwRaVb0frWed5+BkL4
         9KK21dXSva36KoVcsvenZlzrRXDl0YchZ90+wh/yXymhjmABmxFJAmkBXeBWa2/04eQd
         iSsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyJ7wekpAv4jxofJoi2Ibpm1eR+9hMLskU9DIDIyzPjXAKpU/VDt8sG80RB6BS08R3zKJynpxtZtYRmefxsw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIYsA/lVW13w8U2o6Bpx8Gso1uggu7WiqBOOroWY0A7b6NsaMcS
	kPpLrmzdt769rpL+WP3mBm+ie4FUPNv9trtwcxX9X/31qWTLrwVfgXC4CKoKg41w3xYs7lMJVkL
	zl1LapSeESw==
X-Received: from dlbtp7.prod.google.com ([2002:a05:7022:3b87:b0:15f:5ef4:b896])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1602:b0:1a8:4997:65f6
 with SMTP id a92af1059eb24-1ac5d88c579mr6176377c88.20.1793392046539; Fri, 30
 Oct 2026 13:27:26 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:27:07 -0700
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
Message-ID: <20261030202710.3863806-1-irogers@google.com>
Subject: [RFC PATCH v2 0/3] tools: Add Rust library build infrastructure and
 prefer zlib-rs
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

The zlib-rs project (https://github.com/trifectatechfoundation/zlib-rs)
provides a memory-safe, high-performance Rust implementation of the zlib
compression specification along with a C ABI layer (libz-rs-sys) that is a
drop-in replacement for the standard C zlib library. Transitioning
decompression of kernel configuration files (/proc/config.gz), compressed
ELF/BTF sections, and perf data from C zlib to zlib-rs improves both memory
safety and decompression performance.

On many Linux distributions (such as Debian, Ubuntu, and Fedora), Rust
crates like zlib-rs and libz-rs-sys are packaged as Cargo registry sources
under /usr/share/cargo/registry/ (e.g. librust-libz-rs-sys-dev or
rust-libz-rs-sys-devel) rather than as prebuilt C shared libraries, while
other environments may install prebuilt libz_rs libraries via pkg-config or
a custom prefix (LIBZ_RS_DIR).

This RFC series lays the groundwork for building and linking Rust crate
libraries in tools/ offline from the system Cargo registry and integrates
zlib-rs support into perf and bpftool, preferring zlib-rs over C zlib when
available:

1. **tools build: Add Rust library build infrastructure and zlib-rs feature test**:
   - Adds `tools/build/Makefile.rust` with helpers to resolve C compiler and
     linker flags for Rust libraries via `%-cflags` and `%-libs` targets.
   - Resolves `zlib-rs` compiler and linker flags via `LIBZ_RS_DIR`,
     `pkg-config` (`libz-rs-sys-cdylib`, `zlib-rs`, `z_rs`), or building
     `libz_rs.a` (with the `export-symbols`, `c-allocator`, `std`, and `gz`
     features) into `$(OUTPUT)libz_rs/` from `/usr/share/cargo/registry`
     using offline Cargo (`cargo metadata --offline` and
     `cargo build --offline`).
   - Adds `tools/build/feature/test-zlib-rs.c` checking
     `ZLIB_VER_SUBREVISION == 15` (`0xf`, which distinguishes
     `libz-rs-sys`'s `zlib.h` from standard C `zlib.h`) and linking against
     `inflateInit()`.
   - Extends `tools/scripts/Makefile.include` with cross-compilation target
     triples (`RUST_TARGET_FLAGS_<arch>`) and the `feature_rust_lib` macro.

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

Changes in v2:
- Use offline Cargo (`cargo metadata --offline` and `cargo build --offline`
  configured against `CARGO_REGISTRY_DIR` = `/usr/share/cargo/registry` and
  isolated from `~/.cargo`) to resolve crate versions, dependency graphs,
  features, and build scripts instead of manually globbing crate directory
  names and invoking `rustc` on hardcoded `.rlib` edges (Miguel Ojeda).
- Avoid including `../../scripts/Makefile.arch` in `tools/bpf/bpftool/Makefile`
  (to keep the standalone bpftool mirror self-contained) by placing
  `RUST_TARGET_FLAGS_<arch>` in `tools/scripts/Makefile.include`, and expand
  the bpftool commit message on the security and performance motivation for
  preferring `zlib-rs` (Quentin Monnet).
- Drop unused `.rlib` pattern rules and helpers from `tools/build/Build.include`
  and `tools/build/Makefile.build` (Sashiko).
- Address Sashiko review feedback on `PKG_CONFIG` handling when unset or with
  `-static`, `test-all.bin` re-checking `zlib-rs` and `rust`, preserving
  `EXTRA_CFLAGS` optimization defaults when building `libbpf.a`, and
  honoring `NO_ZLIB_RS=1` in `bpftool` when `FEATURES_DUMP` is used.

AI Assistance Disclosure (per Documentation/process/coding-assistants.rst
and Documentation/process/generated-content.rst):
- Tools used: Antigravity coding assistant and Sashiko automated patch
  review using Gemini 4 LLMs.
- Summary of prompts and assistance: Interactive pair-programming session to
  identify distro packaging for zlib-rs/libz-rs-sys, implement the zlib-rs
  feature test and offline Cargo build rules in Makefile.rust, integrate
  zlib-rs detection into perf and bpftool, separate Rust library outputs
  into $(OUTPUT)libz_rs/, and address reviewer and automated Sashiko
  feedback.
- Testing performed: Built and tested perf and bpftool with zlib-rs
  (default), NO_ZLIB_RS=1 (fallback to C zlib), NO_ZLIB=1, and MINIMAL=1;
  verified `perf version --build-options`, `perf check feature`, and the
  `make_no_zlib` / `make_no_zlib_rs` tests in `tools/perf/tests/make`; and
  checked all commits with `scripts/checkpatch.pl`.

Ian Rogers (3):
  tools build: Add Rust library build infrastructure and zlib-rs feature
    test
  perf build: Prefer zlib-rs over zlib when available
  bpftool: Prefer zlib-rs over zlib when available

 tools/bpf/bpftool/.gitignore             |   1 +
 tools/bpf/bpftool/Makefile               |  57 +++++++++-
 tools/build/Makefile.feature             |  12 +-
 tools/build/Makefile.rust                | 160 +++++++++++++++++++++++
 tools/build/feature/.gitignore           |   1 +
 tools/build/feature/Makefile             |  11 +-
 tools/build/feature/test-zlib-rs.c       |  19 +++
 tools/perf/.gitignore                    |   1 +
 tools/perf/Documentation/perf-check.txt  |   1 +
 tools/perf/Makefile.config               |  88 +++++++------
 tools/perf/Makefile.perf                 |  32 ++++-
 tools/perf/bpf_skel.mak                  |   8 +-
 tools/perf/builtin-check.c               |   1 +
 tools/perf/scripts/install-build-deps.sh |   6 +
 tools/perf/tests/make                    |   9 ++
 tools/scripts/Makefile.include           |  25 ++++
 16 files changed, 382 insertions(+), 50 deletions(-)
 create mode 100644 tools/build/Makefile.rust
 create mode 100644 tools/build/feature/test-zlib-rs.c

-- 
2.56.0.317.g454f8302e1-goog

