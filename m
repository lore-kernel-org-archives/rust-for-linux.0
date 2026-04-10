Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19651342CBD;
	Fri, 10 Apr 2026 20:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775851535; cv=none; b=KJVd+9pPDRMtYFU0qAJnwwkuUxAaROn9fIBbY0UKtVqY7/+wFSBuy0M/GwT8pzvbFlCSp/MQS5pMQBexAgxtH96oNWpHge/M2KB/RTlo/0hqdoRoTuYZFYBJBrK/95eP9qO2JFd2/Km2qKHHFtiK/IYpCW5dbJeS+r4RFH66gwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775851535; c=relaxed/simple;
	bh=5s/ZRhN+mX1a0D0z5Hitdf+ZpxB83K/e5DqglbEwSYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SBjBbJ4j7aM02cm45RokvnG56n0lmGstG16MDxbxqCiTCiC6gvs28NcWR1dpTS8nm6gdr8ww1dFmHdRI8BwQu5owwlsaUwv8y36dooMrMKtFNpnr96cue23q7Q/ev6eQEuKc9NPqpkZxTym1c+OfqqIfoN0vXuCVqLcla6pAYvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmgTxmj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmgTxmj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C517AC19421;
	Fri, 10 Apr 2026 20:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775851534;
	bh=5s/ZRhN+mX1a0D0z5Hitdf+ZpxB83K/e5DqglbEwSYw=;
	h=From:To:Cc:Subject:Date:From;
	b=cmgTxmj25Rkj4N9jmhn++qfOPMSGE1DW5OEdoWcXljRZrPMvAOZTkH23SvRNgJeOR
	 vp7Ll5nYBgzdcMJCbXyxTlmX2VXLe+KNA1ZhRvJSR9sNd2NeiURjoxc9gptOu4zEbA
	 tT7wqwRpwY5JirJZJdomjoaB5n6vErIdyri3Sj2sV/ov2u/07cxFw7/1WQi/t7EIKz
	 FIBKCtsW0a5hVHzel5I2bT1r1HgCICtTonWz+3VyRWge1OQC7TlIHoynlihublYPpo
	 UdIXFWXvbBrBbKumOYAyZgy7sPAzukapRq8Tg1FnmonHBmgK3Hxb3HGd4VW+TsC9Z4
	 yds3UdBuuJRXw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust for v7.1
Date: Fri, 10 Apr 2026 22:04:29 +0200
Message-ID: <20260410200429.138694-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

This is the next round of the Rust support.

The biggest "user facing" change is the bump of the minimum Rust version
to follow Debian Stable as we discussed in the Maintainers Summit and
LPC etc.

This carries the two back merges that we discussed -- I have both at the
top of the PR, in case I did something wrong and so that they were
easy to spot. I also merged first the one with the newest base, so that
the second one was obvious. I explained what happened in the merge
commit and used the "temporary merge first" to get the right diffstat
and merge log.

I also talked to my submaintainers so that they know they should avoid
back merges in general. By the way, Tamir has sent me his first PR for
rust-analyzer this cycle, which is included here.

No conflicts expected at this time, but linux-next should generally have
the right resolutions. "Thanks" to the back merge, one of the
conceptually (not mechanically) tricky ones is already solved [1].

All commits have been in linux-next for 3 rounds or more.

Please pull for v7.1 -- thanks!

Link: https://lore.kernel.org/linux-next/CANiq72kdxB=W3_CV1U44oOK3SssztPo2wLDZt6LP94TEO+Kj4g@mail.gmail.com/ [1]

Cheers,
Miguel

The following changes since commit c369299895a591d96745d6492d4888259b004a9e:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.1

for you to fetch changes up to 8a23051ed8584215b22368e9501f771ef98f0c1d:

  Merge tag 'pin-init-v7.1' of https://github.com/Rust-for-Linux/linux into rust-next (2026-04-08 10:44:46 +0200)

----------------------------------------------------------------
Rust changes for v7.1

Toolchain and infrastructure:

 - Bump the minimum Rust version to 1.85.0 (and 'bindgen' to 0.71.1).

   As proposed in LPC 2025 and the Maintainers Summit [1], we are going
   to follow Debian Stable's Rust versions as our minimum versions.

   Debian Trixie was released on 2025-08-09 with a Rust 1.85.0 and
   'bindgen' 0.71.1 toolchain, which is a fair amount of time for e.g.
   kernel developers to upgrade.

   Other major distributions support a Rust version that is high enough
   as well, including:

     + Arch Linux.
     + Fedora Linux.
     + Gentoo Linux.
     + Nix.
     + openSUSE Slowroll and openSUSE Tumbleweed.
     + Ubuntu 25.10 and 26.04 LTS. In addition, 24.04 LTS using
       their versioned packages.

   The merged patch series comes with the associated cleanups and
   simplifications treewide that can be performed thanks to both bumps,
   as well as documentation updates.

   In addition, start using 'bindgen''s '--with-attribute-custom-enum'
   feature to set the 'cfi_encoding' attribute for the 'lru_status' enum
   used in Binder.

   Link: https://lwn.net/Articles/1050174/ [1]

 - Add experimental Kconfig option ('CONFIG_RUST_INLINE_HELPERS') that
   inlines C helpers into Rust.

   Essentially, it performs a step similar to LTO, but just for the
   helpers, i.e. very local and fast.

   It relies on 'llvm-link' and its '--internalize' flag, and requires
   a compatible LLVM between Clang and 'rustc' (i.e. same major version,
   'CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE'). It is only enabled for two
   architectures for now.

   The result is a measurable speedup in different workloads that
   different users have tested. For instance, for the null block driver,
   it amounts to a 2%.

 - Support global per-version flags.

   While we already have per-version flags in many places, we didn't
   have a place to set global ones that depend on the compiler version,
   i.e. in 'rust_common_flags', which sometimes is needed to e.g. tweak
   the lints set per version.

   Use that to allow the 'clippy::precedence' lint for Rust < 1.86.0,
   since it had a change in behavior.

 - Support overriding the crate name and apply it to Rust Binder, which
   wanted the module to be called 'rust_binder'.

 - Add the remaining '__rust_helper' annotations (started in the
   previous cycle).

'kernel' crate:

 - Introduce the 'const_assert!' macro: a more powerful version of
   'static_assert!' that can refer to generics inside functions or
   implementation bodies, e.g.:

       fn f<const N: usize>() {
           const_assert!(N > 1);
       }

       fn g<T>() {
           const_assert!(size_of::<T>() > 0, "T cannot be ZST");
       }

   In addition, reorganize our set of build-time assertion macros
   ('{build,const,static_assert}!') to live in the 'build_assert'
   module.

   Finally, improve the docs as well to clarify how these are different
   from one another and how to pick the right one to use, and their
   equivalence (if any) to the existing C ones for extra clarity.

 - 'sizes' module: add 'SizeConstants' trait.

   This gives us typed 'SZ_*' constants (avoiding casts) for use in
   device address spaces where the address width depends on the hardware
   (e.g. 32-bit MMIO windows, 64-bit GPU framebuffers, etc.), e.g.:

       let gpu_heap = 14 * u64::SZ_1M;
       let mmio_window = u32::SZ_16M;

 - 'clk' module: implement 'Send' and 'Sync' for 'Clk' and thus simplify
   the users in Tyr and PWM.

 - 'ptr' module: add 'const_align_up'.

 - 'str' module: improve the documentation of the 'c_str!' macro to
   explain that one should only use it for non-literal cases (for the
   other case we instead use C string literals, e.g. 'c"abc"').

 - Disallow the use of 'CStr::{as_ptr,from_ptr}' and clean one such use
   in the 'task' module.

 - 'sync' module: finish the move of 'ARef' and 'AlwaysRefCounted'
   outside of the 'types' module, i.e. update the last remaining
   instances and finally remove the re-exports.

 - 'error' module: clarify that 'from_err_ptr' can return 'Ok(NULL)',
   including runtime-tested examples.

   The intention is to hopefully prevent UB that assumes the result of
   the function is not 'NULL' if successful. This originated from a case
   of UB I noticed in 'regulator' that created a 'NonNull' on it.

Timekeeping:

 - Expand the example section in the 'HrTimer' documentation.

 - Mark the 'ClockSource' trait as unsafe to ensure valid values for
   'ktime_get()'.

 - Add 'Delta::from_nanos()'.

'pin-init' crate:

 - Replace the 'Zeroable' impls for 'Option<NonZero*>' with impls of
   'ZeroableOption' for 'NonZero*'.

 - Improve feature gate handling for unstable features.

 - Declutter the documentation of implementations of 'Zeroable' for
   tuples.

 - Replace uses of 'addr_of[_mut]!' with '&raw [mut]'.

rust-analyzer:

 - Add type annotations to 'generate_rust_analyzer.py'.

 - Add support for scripts written in Rust ('generate_rust_target.rs',
   'rustdoc_test_builder.rs', 'rustdoc_test_gen.rs').

 - Refactor 'generate_rust_analyzer.py' to explicitly identify host and
   target crates, improve readability, and reduce duplication.

And some other fixes, cleanups and improvements.

----------------------------------------------------------------
Alice Ryhl (8):
      rust: clk: add __rust_helper to helpers
      rust: jump_label: add __rust_helper to helpers
      rust: clk: implement Send and Sync
      tyr: remove impl Send/Sync for TyrData
      pwm: th1520: remove impl Send/Sync for Th1520PwmDriverData
      rust: support overriding crate_name
      rust_binder: override crate name to rust_binder
      rust: declare cfi_encoding for lru_status

Alistair Francis (1):
      rust: kernel: mark as `#[inline]` all `From::from()`s for `Error`

Andreas Hindborg (1):
      hrtimer: add usage examples to documentation

Antonio Hickey (1):
      rust: pin-init: replace `addr_of_mut!` with `&raw mut`

Benno Lossin (1):
      rust: pin-init: properly document let binding workaround

Eliot Courtney (1):
      scripts: generate_rust_analyzer.py: rename cfg to generated_cfg

FUJITA Tomonori (1):
      rust: time: make ClockSource unsafe trait

Gary Guo (11):
      rust: task: use `as_char_ptr` instead of `as_ptr().cast()`
      rust: disallow use of `CStr::as_ptr` and `CStr::from_ptr`
      rust: pin-init: build: simplify use of nightly features
      rust: pin-init: doc: de-clutter documentation with fake-variadics
      rust: list: hide macros from top-level kernel doc
      rust: move `static_assert` into `build_assert`
      rust: add `const_assert!` macro
      rust: rework `build_assert!` documentation
      kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
      rust: helpers: #define __rust_helper
      kbuild: rust: provide an option to inline C helpers into Rust

Hamdan-Khan (1):
      rust: pin-init: implement ZeroableOption for NonZero* integer types

John Hubbard (2):
      rust: ptr: add const_align_up()
      rust: sizes: add SizeConstants trait for device address space constants

Lyude Paul (1):
      rust/time: Add Delta::from_nanos()

Miguel Ojeda (41):
      MAINTAINERS: add `.rustfmt.toml` to "RUST" entry
      Merge tag 'rust-analyzer-v7.1' of https://github.com/Rust-for-Linux/linux into rust-next
      kbuild: rust: allow `clippy::uninlined_format_args`
      rust: macros: simplify `format!` arguments
      rust: prelude: use the "kernel vertical" imports style
      rust: kbuild: remove `--remap-path-prefix` workarounds
      rust: kbuild: remove "`try` keyword" workaround for `bindgen` < 0.59.2
      rust: kbuild: remove unneeded old `allow`s for generated layout tests
      gpu: nova-core: bindings: remove unneeded `cfg_attr`
      rust: bump Rust minimum supported version to 1.85.0 (Debian Trixie)
      rust: bump Clippy's MSRV and clean `incompatible_msrv` allows
      rust: allow globally `clippy::incompatible_msrv`
      rust: simplify `RUSTC_VERSION` Kconfig conditions
      rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and simplify code
      rust: remove `RUSTC_HAS_COERCE_POINTEE` and simplify code
      rust: kbuild: remove skipping of `-Wrustdoc::unescaped_backticks`
      rust: kbuild: remove `feature(...)`s that are now stable
      rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
      rust: alloc: simplify with `NonNull::add()` now that it is stable
      rust: macros: simplify code using `feature(extract_if)`
      rust: block: update `const_refs_to_static` MSRV TODO comment
      rust: bump `bindgen` minimum supported version to 0.71.1 (Debian Trixie)
      rust: rust_is_available: remove warning for `bindgen` 0.66.[01]
      rust: rust_is_available: remove warning for `bindgen` < 0.69.5 && libclang >= 19.1
      rust: kbuild: update `bindgen --rust-target` version and replace comment
      rust: kbuild: remove "dummy parameter" workaround for `bindgen` < 0.71.1
      docs: rust: quick-start: openSUSE provides `rust-src` package nowadays
      docs: rust: quick-start: update Ubuntu versioned packages
      docs: rust: quick-start: update minimum Ubuntu version
      docs: rust: quick-start: add Ubuntu 26.04 LTS and remove subsection title
      docs: rust: quick-start: remove Gentoo "testing" note
      docs: rust: quick-start: remove Nix "unstable channel" note
      docs: rust: quick-start: remove GDB/Binutils mention
      docs: rust: general-information: simplify Kconfig example
      docs: rust: general-information: use real example
      rust: kbuild: support global per-version flags
      rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0
      Merge patch series "rust: bump minimum Rust and `bindgen` versions"
      rust: kernel: update `file_with_nul` comment
      Merge tag 'rust-timekeeping-for-v7.1' of https://github.com/Rust-for-Linux/linux into rust-next
      Merge tag 'pin-init-v7.1' of https://github.com/Rust-for-Linux/linux into rust-next

Mirko Adzic (1):
      rust: error: clarify that `from_err_ptr` can return `Ok(NULL)`

Nakamura Shuta (1):
      rust: str: improve safety comment for CString::try_from_fmt

Shankari Anand (3):
      rust: i2c: Update ARef and AlwaysRefCounted imports to use sync::aref
      rust: usb: Update AlwaysRefCounted imports to use sync::aref
      rust: types: remove temporary re-exports of ARef and AlwaysRefCounted

Tamir Duberstein (8):
      scripts: generate_rust_analyzer.py: extract `{build,register}_crate`
      scripts: generate_rust_analyzer.py: drop `"is_proc_macro": false`
      scripts: generate_rust_analyzer.py: add type hints
      scripts: generate_rust_analyzer.py: identify crates explicitly
      scripts: generate_rust_analyzer.py: define scripts
      scripts: generate_rust_analyzer.py: avoid FD leak
      scripts: generate_rust_analyzer.py: reduce cfg plumbing
      rust: str: update `c_str!` documentation

 .clippy.toml                                       |  12 +-
 .gitignore                                         |   4 +
 Documentation/process/changes.rst                  |   4 +-
 Documentation/rust/general-information.rst         |   4 +-
 Documentation/rust/quick-start.rst                 |  52 ++--
 MAINTAINERS                                        |   1 +
 Makefile                                           |  21 +-
 arch/Kconfig                                       |   3 +-
 arch/arm64/Kconfig                                 |   8 -
 arch/riscv/Kconfig                                 |   3 -
 drivers/android/binder/Makefile                    |   3 +-
 drivers/android/binder/page_range.rs               |   6 +-
 drivers/android/binder/page_range_helper.c         |  24 --
 drivers/android/binder/page_range_helper.h         |  15 -
 drivers/android/binder/rust_binder_main.rs         |   2 +
 drivers/gpu/drm/tyr/driver.rs                      |  12 -
 drivers/gpu/nova-core/gsp/cmdq.rs                  |   6 +-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs           |   3 -
 drivers/pwm/pwm_th1520.rs                          |  15 -
 init/Kconfig                                       |  30 +-
 lib/Kconfig.debug                                  |  17 ++
 rust/Makefile                                      |  69 +++--
 rust/bindgen_parameters                            |   8 +-
 rust/bindings/bindings_helper.h                    |   1 -
 rust/bindings/lib.rs                               |   5 +-
 rust/exports.c                                     |   5 +-
 rust/helpers/clk.c                                 |  24 +-
 rust/helpers/helpers.c                             |  29 ++
 rust/helpers/jump_label.c                          |   2 +-
 rust/kernel/alloc/allocator/iter.rs                |   8 +-
 rust/kernel/alloc/kbox.rs                          |  29 +-
 rust/kernel/alloc/kvec/errors.rs                   |   3 +
 rust/kernel/block/mq/gen_disk.rs                   |   4 +-
 rust/kernel/build_assert.rs                        | 183 +++++++++--
 rust/kernel/clk.rs                                 |   7 +
 rust/kernel/error.rs                               |  37 +++
 rust/kernel/i2c.rs                                 |  13 +-
 rust/kernel/lib.rs                                 |  38 +--
 rust/kernel/list.rs                                |  22 +-
 rust/kernel/list/arc.rs                            |  23 +-
 rust/kernel/list/arc_field.rs                      |   1 +
 rust/kernel/list/impl_list_item_mod.rs             |   3 +
 rust/kernel/num/bounded.rs                         |  24 +-
 rust/kernel/prelude.rs                             | 110 +++++--
 rust/kernel/ptr.rs                                 |  42 ++-
 rust/kernel/sizes.rs                               | 172 ++++++++---
 rust/kernel/slice.rs                               |  49 ---
 rust/kernel/static_assert.rs                       |  39 ---
 rust/kernel/str.rs                                 |  27 +-
 rust/kernel/sync/arc.rs                            |  21 +-
 rust/kernel/task.rs                                |   7 +-
 rust/kernel/time.rs                                |  32 +-
 rust/kernel/time/hrtimer.rs                        | 336 +++++++++++++++++++++
 rust/kernel/transmute.rs                           |  35 +--
 rust/kernel/types.rs                               |   2 -
 rust/kernel/usb.rs                                 |   6 +-
 rust/kernel/xarray.rs                              |   1 +
 rust/macros/helpers.rs                             |   1 -
 rust/macros/kunit.rs                               |   9 +-
 rust/macros/lib.rs                                 |   3 +
 rust/macros/module.rs                              |   9 +-
 rust/pin-init/README.md                            |   3 +-
 rust/pin-init/examples/big_struct_in_place.rs      |   3 +
 rust/pin-init/examples/linked_list.rs              |   3 +-
 rust/pin-init/examples/mutex.rs                    |   3 +-
 rust/pin-init/examples/pthread_mutex.rs            |   3 +-
 rust/pin-init/examples/static_init.rs              |   3 +-
 rust/pin-init/internal/src/init.rs                 |  14 +-
 rust/pin-init/internal/src/lib.rs                  |   2 +-
 rust/pin-init/src/lib.rs                           |  73 +++--
 rust/uapi/lib.rs                                   |   5 +-
 scripts/Makefile.build                             |  15 +-
 scripts/generate_rust_analyzer.py                  | 298 +++++++++++++-----
 scripts/min-tool-version.sh                        |   4 +-
 scripts/rust_is_available.sh                       |  36 +--
 scripts/rust_is_available_bindgen_0_66.h           |   2 -
 .../rust_is_available_bindgen_libclang_concat.h    |   3 -
 scripts/rust_is_available_test.py                  |  58 +---
 78 files changed, 1391 insertions(+), 821 deletions(-)
 delete mode 100644 drivers/android/binder/page_range_helper.c
 delete mode 100644 drivers/android/binder/page_range_helper.h
 delete mode 100644 rust/kernel/slice.rs
 delete mode 100644 rust/kernel/static_assert.rs
 delete mode 100644 scripts/rust_is_available_bindgen_0_66.h
 delete mode 100644 scripts/rust_is_available_bindgen_libclang_concat.h
