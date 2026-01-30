Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FA71F2B88;
	Fri, 30 Jan 2026 22:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769811525; cv=none; b=TZNCFyXFMVKbVIRU+TLuF0S1gikY80xiUP/nZwDgDckdtUpgfk4RzzO6j1fvEx6dwNVCaLaU14uIiCY5xm9rH8TdD+TuPO9RNIIk9V7ZAB+SVHCzDJD0RyaXy+Ei71nWNlZOpwT0dhPU36XYjWhB2kOpvBE19z0Y1LK8G9lLXME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769811525; c=relaxed/simple;
	bh=4FrORBn5Rfckrq473q3XJvHvX4pf+ihpPQdVMPWhh5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NQ0mGt1GGwcy+zOKCY+F8An8xBuf5zvy3XU7vYwepPpvpKkYscTzHlMSf+f5JsyiQmX8za5Bb0K2pM5Z7+6c9tHEOhAZ2QBkTEuDmfvNhaVzGJF0IsyFgxA8jdG/K8sqWpbg4p9lIAnrBSS3jgaceh5+NbxJGcjj4ycvq18YQMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EK6V8i4O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EK6V8i4O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8659C4CEF7;
	Fri, 30 Jan 2026 22:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769811525;
	bh=4FrORBn5Rfckrq473q3XJvHvX4pf+ihpPQdVMPWhh5A=;
	h=From:To:Cc:Subject:Date:From;
	b=EK6V8i4OMYgyQrEyCOlEUWRFYjUAKFQdZzobZ3BYU1+sNBVjc7lQYuDnZNw/A7eDB
	 PfulubYkVXKUsmmyszKhsWT/tNwrSMmgPutBRUuq3vQOul3UUPbpPY0rY1pfeV+k+N
	 G8Y5VG4+i4An9OwHGonQhEGs2j70oEscvKrIrrX8RAU7WF+nYPRSSlRam10MnOw1yh
	 wnS8f2/QeIRAf4+JYzkShLbBtHdRYkBFnzm8JgK8fsxiPPpz1nW5LJyRSL1h6se/Zl
	 8myArl75nky7ingafmkMtT+vF/J4zC5a6mVCawEL2a6NAk4BfQ0BcFUesEKZo2YiUk
	 0XrsG0IGeR07A==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 6.19
Date: Fri, 30 Jan 2026 23:17:40 +0100
Message-ID: <20260130221755.159543-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have been in linux-next this week or more.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb:

  Linux 6.19-rc4 (2026-01-04 14:41:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.19

for you to fetch changes up to 5016cae970d7d59d62aa4f6f11455a9e9630dd1c:

  rust: num: bounded: clean __new documentation and comments (2026-01-26 02:53:16 +0100)

----------------------------------------------------------------
Rust fixes for v6.19

Toolchain and infrastructure:

  - Trigger rebuilds of the newly added 'proc-macro2' crate (and its
    dependencies) when the Rust compiler version changes.

  - Fix error in '.rsi' targets (macro expanding single targets) under
    'O=' pointing to an external (not subdir) folder.

  - Fix off-by-one line number in 'rustdoc' KUnit tests.

  - Add '-fdiagnostics-show-context' to GCC flags skipped by 'bindgen'.

  - Clean objtool warning by adding one more 'noreturn' function.

  - Clean 'libpin_init_internal.{so,dylib}' in 'mrproper'.

'kernel' crate:

  - Fix build error when using expressions in formatting arguments.

  - Mark 'num::Bounded::__new()' as unsafe and clean documentation
    accordingly.

  - Always inline functions using 'build_assert' with arguments.

  - Fix 'rusttest' build error providing the right 'isize_atomic_repr'
    type for the host.

'macros' crate:

  - Fix 'rusttest' build error by ignoring example.

rust-analyzer:

  - Remove assertion that was not true for distributions like NixOS.

  - Add missing dependency edges and fix editions for 'quote' and
    sysroot crates to provide correct IDE support.

DRM Tyr:

  - Fix build error by adding missing dependency on 'CONFIG_COMMON_CLK'.

Plus clean a few typos in docs and comments.

----------------------------------------------------------------
Alexandre Courbot (3):
      rust: bits: always inline functions using build_assert with arguments
      rust: sync: refcount: always inline functions using build_assert with arguments
      rust: num: bounded: add missing comment for always inlined function

Atharv Dubey (1):
      rust: rbtree: fix minor typo in comment

Chen Miao (1):
      kbuild: rust: clean libpin_init_internal in mrproper

Dirk Behme (1):
      rust: fmt: Fix grammar in Adapter description

FUJITA Tomonori (2):
      objtool/rust: add one more `noreturn` Rust function
      rust: macros: ignore example with module parameters

Gary Guo (1):
      rust: fix off-by-one line number in rustdoc tests

Hang Shu (1):
      rust: rbtree: fix documentation typo in CursorMut peek_next method

Hsiu Che Yu (1):
      rust: num: bounded: mark __new as unsafe

Jesung Yang (2):
      scripts: generate_rust_analyzer: syn: treat `std` as a dependency
      scripts: generate_rust_analyzer: quote: treat `core` and `std` as dependencies

Miguel Ojeda (4):
      rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
      rust: proc-macro2: rebuild if the version text changes
      rust: sync: atomic: Provide stub for `rusttest` 32-bit hosts
      drm/tyr: depend on `COMMON_CLK` to fix build error

Nakamura Shuta (1):
      rust: num: fix typos in Bounded documentation

Onur Özkan (1):
      scripts: generate_rust_analyzer: remove sysroot assertion

SeungJong Ha (1):
      scripts: generate_rust_analyzer: fix resolution of #[pin_data] macros

Shivam Kalra (1):
      rust: num: bounded: clean __new documentation and comments

Siddhesh Poyarekar (1):
      rust: kbuild: Add -fdiagnostics-show-context to bindgen_skip_c_flags

Tamir Duberstein (6):
      rust: fmt: fix formatting expressions
      scripts: generate_rust_analyzer: Add compiler_builtins -> core dep
      scripts: generate_rust_analyzer: Add pin_init -> compiler_builtins dep
      scripts: generate_rust_analyzer: Add pin_init_internal deps
      scripts: generate_rust_analyzer: compile quote with correct edition
      scripts: generate_rust_analyzer: compile sysroot with correct edition

 Makefile                             |  3 ++-
 drivers/gpu/drm/tyr/Kconfig          |  1 +
 rust/Makefile                        |  1 +
 rust/kernel/bits.rs                  |  6 +++--
 rust/kernel/fmt.rs                   |  2 +-
 rust/kernel/num/bounded.rs           | 49 +++++++++++++++++++-----------------
 rust/kernel/rbtree.rs                |  4 +--
 rust/kernel/sync/atomic/predefine.rs | 11 ++++++++
 rust/kernel/sync/refcount.rs         |  3 ++-
 rust/macros/fmt.rs                   |  2 +-
 rust/macros/lib.rs                   |  2 +-
 rust/proc-macro2/lib.rs              |  4 +++
 scripts/Makefile.build               |  2 +-
 scripts/generate_rust_analyzer.py    | 45 ++++++++++++++++++++++++---------
 scripts/rustdoc_test_gen.rs          |  2 +-
 tools/objtool/check.c                |  3 ++-
 16 files changed, 93 insertions(+), 47 deletions(-)
