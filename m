Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8F3BB675;
	Sun, 16 Aug 2026 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786908009; cv=none; b=Ex5k0/9n/DVdr/IAb4FPULOfDQot+88EjL3R70SErkn9+fgQGy4g4j4NaAVKXV+hTQX+VriiUMYbxoxCh86vUNuWGc0MA0HFH8W4seYWeIYmlKRLnjaiC/0zY+ZSPmmfaD6aSQ8foBUKgVh9A5ZvKWi+1F/vdd/p09q0UA4KUcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786908009; c=relaxed/simple;
	bh=vB9ox5Hg9RumR7NiZ/y8Jf/aEa0NojkLvI3LVAV0jK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c6geRnpm7yn6BdyjmAvq0yXa/BiC8kUV+wYatl1oAx3UwvcRKjWv5tlSoGqcnba037l0XTyH5Acka9EzknO45UHa6kxbtekL40/znyrsUPrDcnwXVEG44algUL57zGMJMTXZhQnJcbqjI324qwDhoERD46uNr2gtXNkyjTZ2bcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9EExylA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9EExylA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFDC1F00A3D;
	Sun, 16 Aug 2026 19:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786908007;
	bh=r+QL06ZTxdNeaZzeAxPQ5uZrDfCSD4JvFgbe60pmbBc=;
	h=From:To:Cc:Subject:Date;
	b=J9EExylAttWxAZom6EA+U/VHpO2BpOHEO/eoyCLyQDvhkWZr1dz8qvvuxn8YTZVib
	 LrOq0YpYgA0q+n3SMDBE3ClgEXlUOptTp3oX3NYuNSJMpP3M5JWZxhAZo4aMUquwCE
	 529cxLVYGLDH7pIarOxndYR+9A//tp5e8Mlltt+7RshFZ6phGVGNexgPFeRZZYMQu4
	 LUZXrOh9FK4Ffhl1J0p84K54IWjvufsAsM62/q44oi9Ktp7GIQO13evzpgVmMJLYtr
	 +9OColrOq3iHkBMMNPL4Gu2bCLTxbibXuQK/T03i/GuiDqIwXyICnVAlbYyIUntOkq
	 ZndyFLdeciiNg==
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust for v7.3
Date: Sun, 16 Aug 2026 21:19:25 +0200
Message-ID: <20260816191926.230123-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

This is the next round of the Rust support.

This one is back to a normal size again. It has a bunch of fixes that I
was on the fence about submitting as one more fixes PR last cycle. It
also contains the first fixes for eventually using Rust's GCC backend
(`rustc_codegen_gcc`), which I sent on behalf of its lead, Antoni.

All commits have been in linux-next for 2 rounds or more.

There will be the following semantic conflicts with other trees --
linux-next should generally have the right resolutions:

  - driver-core: https://lore.kernel.org/linux-next/20260807074729.108159-1-ojeda@kernel.org/

  - char-misc: https://lore.kernel.org/linux-next/20260813163951.1102583-1-gary@kernel.org/

  - slab/char-misc: https://lore.kernel.org/linux-next/20260805-slab-rust-fix-v1-1-c4d4c1b69de2@kernel.org/

There will also be a couple of straightforward, normal conflicts with:

  - tip: https://lore.kernel.org/linux-next/anoDGk0XqfBjHfUn@sirena.org.uk/

  - char-misc: https://lore.kernel.org/linux-next/CANiq72kXRevcVMWZnJZQ_PTK_iRO4z6iA30xvv6mR1VEdy96ZA@mail.gmail.com/
    (the diff in that thread is from another conflict somehow, but the
    actual conflict is very simple anyway)

I also did a test merge with your status from a couple hours ago, and it
looks good, without conflicts at the moment.

I will need to send a PR with ~4 fixes during the merge window. I will
send the build system rework next cycle.

Please pull for v7.3 -- thanks!

Cheers,
Miguel

The following changes since commit 075b74841bd0065a3bda3440873c747938e69b68:

  Linux 7.2-rc6 (2026-08-02 16:24:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.3

for you to fetch changes up to 47f27155f17498fccb1f222f79089642337498a9:

  rust: add functions and traits for lossless integer conversions (2026-08-13 13:41:28 +0200)

----------------------------------------------------------------
Rust changes for v7.3

Toolchain and infrastructure:

 - Warn when using 'bindgen' < 0.72.1 with 'libclang' >= 22, since that
   combination may fail to build. It includes a probe for the bug in
   case 'bindgen' happens to be patched, and tests.

   In parallel, Nathan updated the instructions for the kernel.org
   LLVM+Rust toolchains so that the latest version of 'bindgen' is
   installed, which should avoid some of these situations.

 - Support testing 'rust_is_available.sh' with 'bash' as '/bin/sh'.

 - Fix an objtool warning by adding one more 'noreturn' function for
   Rust 1.99.0 (expected 2026-10-01).

 - Fix build error in the 'rusttest' target due to ambiguity when the
   'rustc-dev' component is installed, which was uncovered by the work
   to support Rust's GCC backend ('rustc_codegen_gcc').

 - Fix future Clang warnings in the upcoming powerpc support due to
   macro redefinitions in the UAPI helper header by including the
   arch-aware 'ioctl.h' header.

'kernel' crate:

 - Rework module ownership support:

     - Move the module-related types into a new 'module' module and make
       the 'THIS_MODULE' pointer a constant of 'ModuleMetadata' so that
       modules can provide the pointer in const contexts, and add a
       'this_module' 'const fn' to retrieve it.

       This was enabled by upstream Rust's work on the 'const_mut_refs'
       and 'const_refs_to_static' features which were stabilized back
       in Rust 1.83.0.

     - Teach '#[vtable]' to associate implementations with their owning
       module, defaulting to the local one, including fallbacks for
       doctests, uses within the 'kernel' crate (like upcoming KUnit
       '#[test]'s for DRM) and 'rusttest'.

     - Set 'fops.owner' from the module pointer for DRM and miscdevice.

     - Migrate Rust Binder and configfs away from the old 'THIS_MODULE'
       'static' and finally remove it from the 'module!' macro.

 - 'num' module:

     - Add the new 'casts' module for lossless integer conversions.

       Rust's 'core' library's 'From' implementations do not cover
       conversions that are not portable or future-proof. However, the
       kernel supports a narrower set of architectures, which makes it
       helpful to provide more infallible conversions, instead of having
       developers use 'as' casts, which carry the risk of silently
       losing data.

       This goes along with previous work we did to avoid casts in Rust
       kernel code since they are more powerful than needed.

       Thus, provide safe 'const' conversion functions (e.g.
       'usize_as_u64' and 'u64_into_u8'), as well as the 'FromSafeCast'
       and 'IntoSafeCast' extension traits that provide conversions that
       are known to be lossless in the kernel, and an 'arch' submodule
       defining conversions that are known to be lossless on particular
       architectures (e.g. 64-bit platforms). For instance:

           // Conversion in const context.
           const USIZED_CONST: usize = u8_as_usize(255u8);

           // Non-const conversions.
           let a = u64::from_safe_cast(4096usize);
           let b: u64 = 4096usize.into_safe_cast();

     - Add 'Bounded::shr_exact' method in the vein of 'try_shrink' which
       shifts a bounded right only if it loses no set bits.

     - Fix unsoundness issue in the 'Bounded::shr' method by rejecting,
       at compile-time, shifts of at least the type's bit width.

 - 'fmt' module:

     - Route '{:p}' raw pointer formatting through the kernel's hashed
       '%p' format to prevent address leaks, including support for width
       and padding. Include tests for both 'no_hash_pointers' case and
       the default (hashed) one.

     - Fix the '{:p}' forwarding implementation, which could print the
       address of a temporary stack variable.

 - 'time' module:

     - Make 'Delta' generic over its time unit, with a default unit of
       nanoseconds ('Nsec'), preserving the existing behavior. Then, add
       a 'Jiffy' time unit.

     - Add the 'Delta::as_millis_ceil()' method.

     - Fix 'as_micros_ceil()' rounding near 'i64::MAX', which could
       yield a result one microsecond too small.

 - 'sync' module:

     - Implement 'ForeignOwnable' for 'ARef<T>', allowing C code to own
       an 'ARef<T>'.

     - Add a safe abstraction for 'rcu_barrier()'.

 - 'error' module: add all of the remaining error codes, except the
   deprecated compatibility aliases.

 - 'bug' module:

     - Fix build error on UML in 'warn_on!' for callers from within
       the 'kernel' crate.

     - Fix future 'dead_code' warning on arm and loongarch64 and under
       'CONFIG_BUG=n' in 'warn_on!', which would trigger with the
       upcoming SRCU abstractions.

     - Fix future build error in 'rusttest' on cross-compilation cases,
       which would trigger when 'warn_on!' has callers inside the
       'kernel' crate.

 - 'bitfield' module: fix build error for the upcoming support for
   Rust's GCC backend ('rustc_codegen_gcc') by always inlining a couple
   conversions used in tests.

'pin-init' crate:

 - User-visible changes:

     - Merge the '__pinned_init' and '__init' methods and make 'Init'
       a marker trait.

     - Introduce public APIs 'raw_init' and 'raw_try_init' to prevent
       users from needing to invoke the internal
       '__pinned_init'/'__init' methods.

     - Emit errors for duplicate '#[pin]' attributes.

     - Link 'Zeroable::zeroed' and 'pin_init::zeroed' in documentation.

 - Other changes:

     - Fix unwind safety issues.

     - Clean up lint 'allow' and 'expect's.

     - Overhaul '#[cfg]' handling to pave the way for tuple structs and
       self-referential structs.

     - Mark many functions as '#[inline]' for better codegen with '-C
       opt-level=s' ('CC_OPTIMIZE_FOR_SIZE').

'MAINTAINERS':

 - Update 'MODULE SUPPORT' to cover the new 'module' module.

And some other fixes, cleanups and improvements.

----------------------------------------------------------------
Alexandre Courbot (1):
      rust: add functions and traits for lossless integer conversions

Alvin Sun (11):
      rust: doctest: use vertical import style
      rust: module: move module types into `module.rs`
      rust: module: add `THIS_MODULE` const to `ModuleMetadata` trait
      rust: doctest: add LocalModule fallback for #[vtable] ThisModule
      rust: macros: auto-insert OwnerModule in #[vtable]
      rust: drm: set fops.owner from driver module pointer
      rust: miscdevice: set fops.owner from driver module pointer
      rust: configfs: use `LocalModule` for `THIS_MODULE`
      rust_binder: use `LocalModule` for `THIS_MODULE`
      rust: macros: remove `THIS_MODULE` static from `module!`
      rust: module: update MAINTAINERS to cover module.rs

Antoni Boucher (2):
      rust: kbuild: disambiguate `zerocopy` for `rusttest`
      rust: bitfield: always inline test conversions

Danilo Krummrich (2):
      rust: types: implement ForeignOwnable for ARef<T>
      rust: kernel: add `LocalModule` fallback for `#[vtable]` `impl`s

Eliot Courtney (3):
      rust: num: use const_assert! in Bounded
      rust: num: reject Bounded::shr overshifts at build time
      rust: num: add Bounded::shr_exact

FUJITA Tomonori (7):
      rust: bug: prevent dead_code warning from warn_on!'s flags constant
      rust: bug: skip arch-specific asm in `testlib` builds
      rust: bug: fix warn_on macro build error on UML
      rust: time: fix as_micros_ceil() rounding near i64::MAX
      rust: time: make Delta generic over its time unit
      rust: time: add jiffies time unit for Delta
      rust: time: add Delta::as_millis_ceil()

Gary Guo (11):
      rust: pin-init: examples: fix incorrect drop
      rust: pin-init: remove redundant clippy expects in doc tests
      rust: pin-init: internal: remove `allow` and `expect`s that don't fire
      rust: pin-init: internal: generate brace in macro for init code blocks
      rust: pin-init: internal: rework how `#[pin_data]` handles cfg
      rust: pin-init: examples: use `Wrapper::pin_init` instead of manual reimplementation
      rust: pin-init: merge `__pinned_init` and `__init`
      rust: pin-init: add `raw_init` and `raw_try_init` and recommend over `__init`
      rust: treewide: replace `__pinned_init` with `raw_[try_]init`
      rust: pin-init: remove `__pinned_init` method for `cfg(kernel)`
      rust: pin-init: add `#[inline]` to small functions

Harish C S (1):
      rust: sync: improve `Arc` documentation links

Ke Sun (2):
      rust: fmt: fix {:p} printing stack addresses
      rust: fmt: route {:p} through HashedPtr to prevent address leaks

Kosumi Chan (1):
      rust: impl_flags: use bit helper in example

Luiz Georg (1):
      rust: pin-init: internal: error on duplicate `#[pin]` attribute

Miguel Ojeda (5):
      objtool/rust: add one more `noreturn` Rust function for Rust 1.99.0
      rust: rust_is_available: support testing with `bash` as `/bin/sh`
      rust: rust_is_available: warn for `bindgen` < 0.72.1 && libclang >= 22
      Merge tag 'pin-init-v7.3' of https://github.com/Rust-for-Linux/linux into rust-next
      docs: rust: quick-start: remove Ubuntu 25.10

Mirko Adzic (2):
      rust: pin-init: make `[pin_]init_array_from_fn` unwind safe
      rust: pin-init: make `[pin_]chain` unwind safe

Mukesh Kumar Chaurasiya (IBM) (1):
      rust: uapi: replace direct asm-generic/ioctl.h include with linux/ioctl.h

Nicolás Antinori (2):
      rust: pin-init: docs: link `Zeroable::zeroed` and `pin_init::zeroed` in documentation
      rust: pin-init: mark `pin_init::zeroed` and `Zeroable::zeroed` as `#[inline]`

Philipp Stanner (1):
      rust: sync: Add abstraction for rcu_barrier()

Timur Tabi (1):
      rust: error: add remaining error codes

Younes Akhouayri (1):
      rust: print: fix broken `_printk` Rustdoc link

 Documentation/rust/quick-start.rst              |   2 +-
 MAINTAINERS                                     |   2 +-
 drivers/android/binder/rust_binder_main.rs      |   3 +-
 drivers/block/rnull/configfs.rs                 |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs               |   4 +-
 rust/Makefile                                   |   2 +-
 rust/kernel/alloc/kbox.rs                       |   8 +-
 rust/kernel/auxiliary.rs                        |   2 +-
 rust/kernel/bitfield.rs                         |   2 +
 rust/kernel/bug.rs                              |  34 ++-
 rust/kernel/configfs.rs                         |   9 +-
 rust/kernel/dma.rs                              |  10 +-
 rust/kernel/drm/device.rs                       |   5 +-
 rust/kernel/drm/gem/mod.rs                      |   4 +-
 rust/kernel/drm/gpuvm/va.rs                     |   2 +-
 rust/kernel/drm/gpuvm/vm_bo.rs                  |   2 +-
 rust/kernel/error.rs                            | 102 ++++++++
 rust/kernel/fmt.rs                              | 195 +++++++++++++-
 rust/kernel/i2c.rs                              |   2 +-
 rust/kernel/impl_flags.rs                       |  11 +-
 rust/kernel/init.rs                             |   6 +-
 rust/kernel/lib.rs                              |  81 ++----
 rust/kernel/miscdevice.rs                       |   4 +-
 rust/kernel/module.rs                           |  80 ++++++
 rust/kernel/net/phy.rs                          |   6 +-
 rust/kernel/num.rs                              |   2 +
 rust/kernel/num/bounded.rs                      |  36 ++-
 rust/kernel/num/casts.rs                        | 298 +++++++++++++++++++++
 rust/kernel/pci.rs                              |   2 +-
 rust/kernel/platform.rs                         |   2 +-
 rust/kernel/print.rs                            |   2 +-
 rust/kernel/pwm.rs                              |   2 +-
 rust/kernel/sync/arc.rs                         |  20 +-
 rust/kernel/sync/aref.rs                        |  50 ++++
 rust/kernel/sync/rcu.rs                         |  20 ++
 rust/kernel/time.rs                             | 141 +++++++---
 rust/kernel/types.rs                            |   8 +-
 rust/kernel/usb.rs                              |   2 +-
 rust/macros/lib.rs                              |  18 ++
 rust/macros/module.rs                           |  36 +--
 rust/macros/vtable.rs                           |  41 ++-
 rust/pin-init/examples/mutex.rs                 |  11 +-
 rust/pin-init/examples/static_init.rs           |  10 +-
 rust/pin-init/internal/src/init.rs              |   8 +-
 rust/pin-init/internal/src/pin_data.rs          |  94 +++++--
 rust/pin-init/src/__internal.rs                 |  13 +-
 rust/pin-init/src/alloc.rs                      |  10 +-
 rust/pin-init/src/lib.rs                        | 333 ++++++++++++++----------
 rust/uapi/uapi_helper.h                         |   2 +-
 scripts/rust_is_available.sh                    |  14 +
 scripts/rust_is_available_bindgen_libclang_22.h |   5 +
 scripts/rust_is_available_test.py               |  46 +++-
 scripts/rustdoc_test_gen.rs                     |  29 ++-
 tools/objtool/check.c                           |   1 +
 54 files changed, 1460 insertions(+), 376 deletions(-)
 create mode 100644 rust/kernel/module.rs
 create mode 100644 rust/kernel/num/casts.rs
 create mode 100644 scripts/rust_is_available_bindgen_libclang_22.h
