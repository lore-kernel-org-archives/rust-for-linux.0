Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9093EAC84;
	Sun, 18 Oct 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341329; cv=none; b=njgE+KZur6FH0fGyjSTYUm6wTgMlY/EBNszgbNW9mtnPODULvdx7gIbLruAOtxcxhmGMXo9oSXI0ZTLWCc7kQ3gaH8qalPERvwSiAYxA9OX4et8qtFUSnWqt5fb6/MGR/t8BctVZm2io9IHDahnpqyZgM/rfwDF+rbzzcUT8MO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341329; c=relaxed/simple;
	bh=0Sx0pqNagpYBaIYbVacmsUcvs8cJOBqnYcbwzz1Ubs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=noO5GeUT4J057iHTX2EM6qPGvUbVy/itgJze89fKxHG2EHnVkQPV9/YhCn+IPYFsbapOa6Ed7NYS/RlW/oXHTeesLp/SxlrEUtXjtq5bIAKrPe26+t953Kzx+WMayqg+OE8kyguJ+5LCYvzMfMQ/HSDyMlX+Jn84y/McaKnkJV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndVk4L4w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndVk4L4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE981F000C4;
	Sun, 18 Oct 2026 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792341313;
	bh=uGjkuGlO0zKCbx7tANq9MTLd1Q2y0d1OLUzZu8jEW3g=;
	h=From:To:Cc:Subject:Date;
	b=ndVk4L4wikOl0MPNr62LE7UEM3z90vcDhoIuI8Dayj4X1CY8EJGthLSiMAH5SD4wQ
	 mwMYURbJn0lGV77ZL/eiQRZGl31n73JQV2DzvQGlDt5nJviSr2OQZTCPXzpAfxEWxa
	 PdFojRCv5JfYwwBHXiaUISzx5jmBrRtE77chSqTZm7HttvbP8PzbLPLWiD0yYfJMSH
	 2qDP2GC+LiPj7rf7KJwUdh5e/dp/pLdqO7rmghjEd8nZGl4Ne/G9ysHpU8igNpC4WL
	 rwWa3PsGOq8NcllUw3ToR9JWh3WfKbBP9kCg+9Vk16VqaqdlsUzEJ7/ISXgG+ldQ63
	 8AUSTkVzhbuEA==
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
Subject: [GIT PULL] Rust for v7.4
Date: Sun, 18 Oct 2026 18:34:58 +0200
Message-ID: <20261018163459.80579-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

This is the next round of the Rust support. This one carries a big diff
due to the `zerocopy` vendored library update, but that is just a mostly
mechanical import in a single commit.

All commits have been in linux-next for 2 rounds or more.

I also did a test merge with your status from a couple hours ago, and it
looks good, without conflicts at the moment.

I am expecting a few easy conflicts with other trees: char-misc, DRM and
Kbuild -- the resolutions in linux-next are fine except that:

  - The Kbuild one should remove `RUSTC_HAS_SPAN_FILE` from its new
    location in `scripts/Kconfig.toolchain`.

  - The DRM one in `rust/kernel/mem.rs` should clean `rustfmt` with:

        use crate::prelude::*;

        // TODO: `Alignment` should be moved here as well, Rust moved it upstream in 1.96.
        pub use crate::ptr::Alignment;

Please pull for v7.4 -- thanks!

Cheers,
Miguel

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.4

for you to fetch changes up to 7c306f00835a237a70024a8f968dbc3bc8db8fcf:

  rust: zerocopy: update to v0.8.62 (2026-10-15 09:14:38 +0200)

----------------------------------------------------------------
Rust changes for v7.4

Toolchain and infrastructure:

 - Update vendored 'zerocopy' crate to v0.8.62 (released 2026-10-08).

   This update advances 8 releases, with 3 of them carrying most of the
   changes. It contains new features as well as fixes. However, almost
   nothing has changed that requires updates on our side (a move of our
   non-ASCII change and the addition of an SPDX license identifier).

 - Generate Rust KUnit test suites for doctests reusing the
   '#[kunit_tests]' and '#[test]' attributes instead of C FFI
   functions, which allows to remove the generated C glue file.

   Relatedly, simplify 'kunit_assert!' by using 'file!()' and 'line!()'
   inside (which doctests override as needed), which allows to remove
   the 'file' helper and 'CONFIG_RUSTC_HAS_SPAN_FILE'.

 - Trim the function names in doctests generated by 'rustdoc' < 1.95.0
   when building with 'O=', which were not reproducible.

 - Fix the 'VM_MAYSHARE' value in the generated bindings and its
   blocklist entry, due to typos.

 - Build 'core' with '--cfg no_io_statics' to ensure 'core' does not
   introduce any use of 'core::sync::atomic' into the kernel image
   since upstream Rust is moving 'std::io::Error' into 'core', which
   uses a global atomic pointer.

   Upstream Rust merged a PR to add a test checking that builds of
   'core' are warning-free with that 'cfg' enabled.

 - Enable the unstable 'proc_macro_span' feature in 'proc-macro2',
   which provides 'Span::join' and thus improves the quality of the
   diagnostics of all our procedural macros, notably 'pin-init'. This
   is only used for producing diagnostics, thus there is no hard
   reliance on the feature.

 - Globally allow 'clippy::comparison_chain', since its suggestions are
   not always ideal and upstream downgraded it to 'pedantic' too.

'kernel' crate:

 - New 'mem' module: add the 'Align<N>' zero-sized type so that
   alignment can be specified via const generics ('repr(align(...))'
   only works with integer literals), e.g.:

       const N: usize = 128;

       struct S {
           _align: Align<N>,
       }

       assert_eq!(align_of::<S>(), N);

 - New 'ratelimit' module: add the 'Ratelimit' abstraction for 'struct
   ratelimit_state' and, based on it, the 'pr_*_ratelimited!' printing
   macros, which can be used for printing that may be triggered by
   userspace.

   In addition, convert Rust Binder to use them.

 - 'sync' module: to construct a global 'struct ratelimit_state', add a
   'const' constructor for 'raw_spinlock_t'.

   In addition, move the lockdep types into a new 'sync::lockdep'
   submodule, since there were starting to be too many of them.

 - 'num' module: add the 'cv!' macro to create constant values ("cv")
   from an integer constant expression, with validity checked at
   compile time, inferring the target type from the context. It works
   for any type that implements the new 'FromConst' trait, e.g.:

       let a: Alignment = cv!(4096);
       let b: Bounded<u32, 4> = cv!(15);

       // Any integer constant expression works, not only literals.
       let m: NonZero<usize> = cv!(usize::MAX);

       // Checked narrowing, including in `const` items.
       const SMALL: u8 = cv!(200u32);

       // The target type can be given explicitly.
       let e = cv!(200u32 => u8);

       // With an explicit primitive target, the expression can use
       // generic parameters.
       const fn as_u64<const KEY: u16>() -> u64 {
           cv!(KEY => u64)
       }

   This avoids the verbose turbofish syntax which disincentivized using
   these types at interface boundaries (e.g. 'Alignment::new::<8>()').

 - 'alloc' module:

     - Allow different error types in 'KBox::pin_slice()', enabling use
       of infallible initializers.

     - Add 'NumaNode::id()' accessor to retrieve the underlying NUMA
       node identifier.

 - 'time' module:

     - Add 'Delta::to_jiffies_timeout()' for use in timeout arguments.

     - Add 'Delta::as_jiffies_unsigned()'.

     - Make 'Delta::ZERO' generic over the time unit.

     - Warn and assert when passing out-of-range inputs to 'fsleep' and
       'udelay'.

     - Rename 'ClockSource' to 'ClockId' to better align with naming
       conventions in C kernel.

     - Make 'CONFIG_HZ' value available as 'bindings::HZ'.

     - Add implementation detail documentation for 'HrTimer'.

 - 'bitmap' module:

     - Add contiguous area operations ('next_zero_area{,_off}', 'set'
       and 'clear'), with extra checks compared to the underlying C
       code, plus additional ones under 'CONFIG_RUST_BITMAP_HARDENED'.
       It includes tests demonstrating the edge cases.

     - Restrict bitmap length to at most 'i32::MAX', matching
       'BitmapVec::MAX_LEN' and simplifying a few things. This also
       fixes 'u32' casts truncating in 'copy_and_extend', which could
       otherwise lead to OOB writes.

 - 'bug' module:

     - Fix 'warn_on!' on UML which called 'warn_slowpath_fmt()' with
       the wrong arguments; and fix its '// SAFETY:' comment too.

     - Add a KUnit test for 'warn_on!'.

 - 'id_pool' module: add contiguous ID reservation via the new
   'reserve_ids' and 'release_ids' methods, built on top of the new
   bitmap area operations.

 - 'sizes' module: add the sub-1K size constants ('SZ_1' to 'SZ_512')
   and implement 'SizeConstants' for 'Alignment', so that one can write
   e.g. 'Alignment::SZ_8'.

'macros' crate:

 - Add '#[optional]' attribute for optional methods in '#[vtable]' to
   replace the 'build_error!(VTABLE_DEFAULT_ERROR)' boilerplate, e.g.:

       #[vtable]
       pub trait Operations: Sized {
           #[optional]
           fn f(&self) -> Result;
       }

   In addition, apply it to miscdevice and hide generated 'HAS_'
   constants for required methods.

 - Allow non-ASCII characters in the 'authors' field of the 'module!'
   macro, which was unintentionally restricted when multiple authors
   support was introduced.

'pin-init' crate:

  [ Extra context from Gary's pull request:
     "This is a cycle packed with feature updates. Two of the most
      anticipated features, tuple struct support and safe self
      reference creation, has been included in this pull request.

      Safe self reference is a big one and is pushed a bit late in the
      cycle. The initial plan was to include a minimum subset for this
      cycle because I was worried about potential soundness issues;
      however during Plumbers it was agreed that the features should be
      upstreamed at once. This is because the initial users (Nova,
      JobQueue) would all need the advanced features, so it is better
      to ensure that the feature get put into use for real, and it can
      iterate with users, rather than being fully designed on paper.
      The existing safety checks are already very comprehensive, and
      Benno and I are confident that if new ones are discovered, it
      wouldn't affect the overall design.

      That said, the the usage of the advanced features (invariance,
      existential lifetime) shall be limited to the pre-agreed users
      only, so even in case where the feature needs to be reworked, the
      blast radius is limited.

      Another theme in this cycle is to improve the developer
      experience when things are used wrongly. A lot of work has been
      done to use proper spans from user-provided tokens so error
      message point to things that cause them. Many common misuse
      scenarios also gain additional custom diagnostics." ]

 - User visible changes:

     - Support tuple structs.

     - Allow safe creation of self references.

     - Vastly improve diagnostics for common misuse scenarios.

 - Other changes:

     - Use 'mixed_site' hygiene consistently.

'MAINTAINERS':

 - Add 'RUST [BUG]' entry for the Rust 'bug' module (i.e. 'warn_on!'),
   which will be maintained by FUJITA Tomonori -- thank you!

 - Add Alice Ryhl as co-maintainer for 'Rust [ALLOC]'.

And some other fixes, cleanups and improvements.

----------------------------------------------------------------
Alice Ryhl (5):
      rust: kbuild: add `no_io_statics` to `core-cfgs`
      rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
      rust: sync: add const constructor for raw_spinlock_t
      rust: add pr_*_ratelimited! macros for printing
      rust_binder: use pr_*_ratelimited! for printing

Andreas Hindborg (3):
      rust: hrtimer: document handle based design rationale
      rust: alloc: allow different error types in `KBox::pin_slice`
      rust: alloc: add `NumaNode::id()` accessor

Danilo Krummrich (1):
      MAINTAINERS: add Alice Ryhl as co-maintainer for Rust [ALLOC]

Eliot Courtney (7):
      rust: num: add cv! macro to create values from constant expressions
      rust: bitmap: use function-level cfg on kunit test
      rust: bitmap: restrict bitmap length to at most i32::MAX
      rust: sizes: add sub-1K size constants
      rust: sizes: implement SizeConstants for Alignment
      rust: bitmap: add contiguous area operations
      rust: id_pool: add contiguous ID reservation

FUJITA Tomonori (9):
      rust: time: rename ClockSource trait to ClockId
      rust: bindings: set HZ to CONFIG_HZ
      rust: time: add Delta::to_jiffies_timeout() for timeout conversion
      rust: bug: pass TAINT_WARN to warn_slowpath_fmt() on UML
      rust: bug: add a KUnit test for warn_on!
      MAINTAINERS: add entry for the Rust `bug` module
      rust: time: make Delta::ZERO generic over the time unit
      rust: time: add Delta::as_jiffies_unsigned()
      rust: bug: update the SAFETY comment for warn_slowpath_fmt() on UML

Gary Guo (56):
      rust: pin-init: internal: extract utility code to new module
      rust: pin-init: internal: init: emit `slot` using mixed site hygiene
      rust: pin-init: internal: init: use `slot` identifier directly with mixed site
      rust: pin-init: internal: init: provide span for slot projection
      rust: pin-init: internal: use span of `Index` for generated identifiers
      rust: pin-init: internal: pin_data: use HRTB to work around `trivial_bounds` for `Unpin`
      rust: pin-init: internal: make `__init_data` and `__pin_data` safe
      rust: pin-init: internal: remove associated type of `HasInitData`
      rust: pin-init: internal: use `HasInitData` to provide inference help only
      rust: pin-init: internal: add custom diagnostic when `#[pin_data]` is not implemented
      rust: pin-init: add diagnostic attribute for `PinInit` and `Init`
      rust: pin-init: internal: handle item and expr diagnostics differently
      rust: pin-init: internal: make `DiagCtxt` available inside parser
      rust: pin-init: internal: improve diagnostics robustness against panicking
      rust: pin-init: internal: init: allow reborrow of `Pin<&mut T>` bindings
      rust: pin-init: internal: init: improve diagnostics from field checks
      rust: pin-init: internal: init: use span of `<-` or `:` for the init/write call.
      rust: doctest: trim function name for reproducibility
      rust: proc-macro2: enable `proc_macro_span` feature
      rust: bitfield: remove unnecessary `#[allow]`
      rust: mem: add `Align` type
      rust: macros: vtable: hide generated `HAS_` constants for required methods
      rust: macros: vtable: add `#[optional]` attribute
      rust: miscdevice: use `#[optional]` attribute of `#[vtable]` macro
      rust: kunit: use `file!()` inside `kunit_assert!`
      rust: kunit: use `line!()` inside `kunit_assert!`
      rust: doctest: generate Rust kunit test suites
      rust: pin-init: internal: init: forget guards in reverse order
      rust: pin-init: internal: init: set span location of guards
      rust: pin-init: internal: add utility to handle generics merging
      rust: pin-init: internal: add utility for extract a single attribute
      rust: pin-init: internal: pin_data: move projection struct into `const _: ()` block
      rust: pin-init: internal: pin_data: extract `#[cfg]` processing to its own function
      rust: pin-init: internal: pin_data: rename `'__pin` lifetime to `'__this`
      rust: pin-init: internal: pin_data: parse into `StructInfo` before generating
      kbuild: rust: allow `clippy::comparison_chain` globally
      rust: pin-init: internal: pin_data: infer self-referential struct
      rust: pin-init: internal: pin_data: rewrite fields that borrow others
      rust: pin-init: internal: pin_data: pin borrowed fields with wrapper
      rust: pin-init: internal: pin_data: teach drop check about generics that cannot dangle
      rust: pin-init: internal: pin_data: self-referential drop order checks
      rust: pin-init: internal: pin_data: check covariance of self-referential fields
      rust: pin-init: internal: pin_data: implement initialization of borrowed structs
      rust: pin-init: internal: pin_data: project self-referential fields
      rust: pin-init: internal: pin_data: add `with_project` method
      rust: pin-init: internal: pin_data: enable self-referential support
      rust: pin-init: internal: pin_data: allow lifetime to be shortened per field drop order
      rust: pin-init: internal: pin_data: parse explicit `#[borrowed]` annotation
      rust: pin-init: internal: pin_data: support mutable borrows
      rust: pin-init: internal: pin_data: parse explicit `#[uses]` annotation
      rust: pin-init: internal: pin_data: make field lifetime invariance imply type invariance
      rust: pin-init: internal: pin_data: complete invariant borrow support
      rust: pin-init: internal: pin_data: perform AST lifetime replacement if possible
      rust: pin-init: internal: pin_data: support shared projection
      rust: pin-init: internal: pin_data: support existential lifetimes
      rust: pin-init: internal: suppress `explicit_outlives_requirements`

Lorenzo Stoakes (1):
      rust: bindings: fix VM_MAYSHARE value

Miguel Ojeda (6):
      rust: bindings: fix `VM_MAYSHARE` blocklist entry
      Merge tag 'alloc-7.4-rc1' of https://github.com/Rust-for-Linux/linux into rust-next
      Merge tag 'rust-timekeeping-for-v7.4-rc1' of https://github.com/Rust-for-Linux/linux into rust-next
      Merge tag 'pin-init-v7.4' of https://github.com/Rust-for-Linux/linux into rust-next
      rust: zerocopy: fix link to upstream `README.md`
      rust: zerocopy: update to v0.8.62

Mohamad Alsadhan (3):
      rust: pin-init: internal: pin_data: support tuple struct projections
      rust: pin-init: internal: init: support tuple structs in `[pin_]init!`
      rust: pin-init: internal: init: support tuple struct constructor syntax

Nicolas Schier (1):
      rust: kbuild: Replace and dissolve procmacro-extension variable

Sang-Heon Jeon (1):
      rust: time: warn and assert out-of-range input in fsleep() and udelay()

Thiébaud Weksteen (1):
      rust: macros: allow non-ASCII characters in `authors`

 Documentation/rust/general-information.rst         |    4 +-
 MAINTAINERS                                        |   11 +
 Makefile                                           |    2 +
 drivers/android/binder/allocation.rs               |    4 +-
 drivers/android/binder/context.rs                  |    6 +-
 drivers/android/binder/debug.rs                    |    4 +-
 drivers/android/binder/freeze.rs                   |    2 +-
 drivers/android/binder/node.rs                     |    4 +-
 drivers/android/binder/page_range.rs               |   12 +-
 drivers/android/binder/process.rs                  |   22 +-
 drivers/android/binder/range_alloc/tree.rs         |   26 +-
 drivers/android/binder/thread.rs                   |   48 +-
 drivers/android/binder/transaction.rs              |    6 +-
 include/linux/spinlock_types_raw.h                 |    4 +
 init/Kconfig                                       |    3 -
 rust/.gitignore                                    |    1 -
 rust/Makefile                                      |   14 +-
 rust/bindgen_parameters                            |    2 +-
 rust/bindings/bindings_helper.h                    |    2 +-
 rust/bindings/lib.rs                               |   30 +
 rust/helpers/helpers.c                             |    2 +
 rust/helpers/math.c                                |    8 +
 rust/helpers/ratelimit.c                           |   14 +
 rust/kernel/Kconfig.test                           |   21 +
 rust/kernel/alloc.rs                               |    6 +
 rust/kernel/alloc/kbox.rs                          |    7 +-
 rust/kernel/bitfield.rs                            |    1 -
 rust/kernel/bitmap.rs                              |  336 +-
 rust/kernel/bug.rs                                 |   39 +-
 rust/kernel/id_pool.rs                             |   32 +
 rust/kernel/kunit.rs                               |   12 +-
 rust/kernel/lib.rs                                 |    2 +
 rust/kernel/mem.rs                                 |   70 +
 rust/kernel/miscdevice.rs                          |   35 +-
 rust/kernel/num.rs                                 |  149 +
 rust/kernel/num/bounded.rs                         |   16 +
 rust/kernel/prelude.rs                             |    9 +
 rust/kernel/ptr.rs                                 |   12 +-
 rust/kernel/ratelimit.rs                           |  201 ++
 rust/kernel/sizes.rs                               |   47 +-
 rust/kernel/str.rs                                 |    2 +-
 rust/kernel/sync.rs                                |  138 +-
 rust/kernel/sync/lock/spinlock.rs                  |   28 +
 rust/kernel/sync/lockdep.rs                        |  161 +
 rust/kernel/time.rs                                |  173 +-
 rust/kernel/time/delay.rs                          |   17 +-
 rust/kernel/time/hrtimer.rs                        |   95 +-
 rust/macros/helpers.rs                             |   16 -
 rust/macros/kunit.rs                               |    5 +-
 rust/macros/lib.rs                                 |   48 +-
 rust/macros/module.rs                              |    2 +-
 rust/macros/vtable.rs                              |   43 +-
 rust/pin-init/examples/selfref.rs                  |   60 +
 rust/pin-init/internal/src/diagnostics.rs          |  153 +-
 rust/pin-init/internal/src/init.rs                 |  683 +++-
 rust/pin-init/internal/src/lib.rs                  |   41 +-
 rust/pin-init/internal/src/pin_data.rs             | 2013 +++++++++--
 rust/pin-init/internal/src/util.rs                 |  500 +++
 rust/pin-init/src/__internal.rs                    |  417 ++-
 rust/pin-init/src/lib.rs                           |   83 +-
 rust/proc-macro2/README.md                         |    3 +-
 rust/proc-macro2/probe/proc_macro_span.rs          |    9 -
 rust/zerocopy-derive/README.md                     |   12 +-
 rust/zerocopy-derive/derive/from_bytes.rs          |   12 +
 rust/zerocopy-derive/derive/into_bytes.rs          |  147 +-
 rust/zerocopy-derive/derive/known_layout.rs        |    4 +-
 rust/zerocopy-derive/derive/mod.rs                 |   33 +-
 rust/zerocopy-derive/derive/project.rs             |  569 +++
 rust/zerocopy-derive/derive/try_from_bytes.rs      |  869 ++---
 rust/zerocopy-derive/invariant.rs                  |  116 +
 rust/zerocopy-derive/lib.rs                        |  118 +-
 rust/zerocopy-derive/repr.rs                       |   46 +-
 rust/zerocopy-derive/util.rs                       |  414 ++-
 rust/zerocopy/README.md                            |   12 +-
 rust/zerocopy/benches/as_bytes_dynamic_size.x86-64 |    3 +-
 .../benches/as_bytes_dynamic_size.x86-64.mca       |   20 +-
 rust/zerocopy/benches/extend_vec_zeroed.x86-64     |    4 +-
 rust/zerocopy/benches/extend_vec_zeroed.x86-64.mca |    8 +-
 rust/zerocopy/benches/insert_vec_zeroed.x86-64     |    4 +-
 rust/zerocopy/benches/insert_vec_zeroed.x86-64.mca |    8 +-
 rust/zerocopy/benches/new_vec_zeroed.x86-64        |    3 +-
 rust/zerocopy/benches/new_vec_zeroed.x86-64.mca    |   46 +-
 .../benches/ref_from_bytes_dynamic_padding.x86-64  |   31 +-
 .../ref_from_bytes_dynamic_padding.x86-64.mca      |   70 +-
 .../benches/ref_from_bytes_dynamic_size.x86-64     |   21 +-
 .../benches/ref_from_bytes_dynamic_size.x86-64.mca |   58 +-
 .../benches/ref_from_bytes_static_size.x86-64      |    7 +-
 .../benches/ref_from_bytes_static_size.x86-64.mca  |   26 +-
 .../benches/ref_from_prefix_dynamic_padding.x86-64 |   24 +-
 .../ref_from_prefix_dynamic_padding.x86-64.mca     |   62 +-
 .../benches/ref_from_prefix_dynamic_size.x86-64    |   21 +-
 .../ref_from_prefix_dynamic_size.x86-64.mca        |   52 +-
 .../benches/ref_from_suffix_dynamic_padding.x86-64 |   29 +-
 .../ref_from_suffix_dynamic_padding.x86-64.mca     |   68 +-
 ...f_from_suffix_with_elems_dynamic_padding.x86-64 |   36 +-
 ...om_suffix_with_elems_dynamic_padding.x86-64.mca |   84 +-
 .../ref_from_suffix_with_elems_dynamic_size.x86-64 |   31 +-
 ..._from_suffix_with_elems_dynamic_size.x86-64.mca |   70 +-
 .../benches/ref_type_bytes_dynamic_padding.rs      |   19 +
 .../benches/ref_type_bytes_dynamic_padding.x86-64  |    4 +
 .../ref_type_bytes_dynamic_padding.x86-64.mca      |   45 +
 .../benches/ref_type_bytes_dynamic_size.rs         |   17 +
 .../benches/ref_type_bytes_dynamic_size.x86-64     |    4 +
 .../benches/ref_type_bytes_dynamic_size.x86-64.mca |   45 +
 .../benches/ref_type_bytes_mut_dynamic_padding.rs  |   19 +
 .../ref_type_bytes_mut_dynamic_padding.x86-64      |    4 +
 .../ref_type_bytes_mut_dynamic_padding.x86-64.mca  |   45 +
 .../benches/ref_type_bytes_mut_dynamic_size.rs     |   19 +
 .../benches/ref_type_bytes_mut_dynamic_size.x86-64 |    4 +
 .../ref_type_bytes_mut_dynamic_size.x86-64.mca     |   45 +
 .../benches/ref_type_bytes_mut_static_size.rs      |   19 +
 .../benches/ref_type_bytes_mut_static_size.x86-64  |    4 +
 .../ref_type_bytes_mut_static_size.x86-64.mca      |   45 +
 .../zerocopy/benches/ref_type_bytes_static_size.rs |   17 +
 .../benches/ref_type_bytes_static_size.x86-64      |    4 +
 .../benches/ref_type_bytes_static_size.x86-64.mca  |   45 +
 .../benches/ref_type_deref_dynamic_padding.rs      |   19 +
 .../benches/ref_type_deref_dynamic_padding.x86-64  |   29 +
 .../ref_type_deref_dynamic_padding.x86-64.mca      |   91 +
 .../benches/ref_type_deref_dynamic_size.rs         |   19 +
 .../benches/ref_type_deref_dynamic_size.x86-64     |   27 +
 .../benches/ref_type_deref_dynamic_size.x86-64.mca |   87 +
 .../benches/ref_type_deref_mut_dynamic_size.rs     |   19 +
 .../benches/ref_type_deref_mut_dynamic_size.x86-64 |   27 +
 .../ref_type_deref_mut_dynamic_size.x86-64.mca     |   87 +
 .../benches/ref_type_deref_mut_static_size.rs      |   19 +
 .../benches/ref_type_deref_mut_static_size.x86-64  |    3 +
 .../ref_type_deref_mut_static_size.x86-64.mca      |   43 +
 .../zerocopy/benches/ref_type_deref_static_size.rs |   19 +
 .../benches/ref_type_deref_static_size.x86-64      |    3 +
 .../benches/ref_type_deref_static_size.x86-64.mca  |   43 +
 .../benches/ref_type_from_bytes_dynamic_padding.rs |   19 +
 .../ref_type_from_bytes_dynamic_padding.x86-64     |   25 +
 .../ref_type_from_bytes_dynamic_padding.x86-64.mca |   85 +
 .../benches/ref_type_from_bytes_dynamic_size.rs    |   17 +
 .../ref_type_from_bytes_dynamic_size.x86-64        |   21 +
 .../ref_type_from_bytes_dynamic_size.x86-64.mca    |   77 +
 .../benches/ref_type_from_bytes_static_size.rs     |   17 +
 .../benches/ref_type_from_bytes_static_size.x86-64 |   15 +
 .../ref_type_from_bytes_static_size.x86-64.mca     |   65 +
 ...f_type_from_bytes_with_elems_dynamic_padding.rs |   20 +
 ...pe_from_bytes_with_elems_dynamic_padding.x86-64 |   26 +
 ...rom_bytes_with_elems_dynamic_padding.x86-64.mca |   85 +
 .../ref_type_from_bytes_with_elems_dynamic_size.rs |   20 +
 ..._type_from_bytes_with_elems_dynamic_size.x86-64 |   28 +
 ...e_from_bytes_with_elems_dynamic_size.x86-64.mca |   89 +
 .../ref_type_from_prefix_dynamic_padding.rs        |   22 +
 .../ref_type_from_prefix_dynamic_padding.x86-64    |   26 +
 ...ref_type_from_prefix_dynamic_padding.x86-64.mca |   87 +
 .../benches/ref_type_from_prefix_dynamic_size.rs   |   22 +
 .../ref_type_from_prefix_dynamic_size.x86-64       |   19 +
 .../ref_type_from_prefix_dynamic_size.x86-64.mca   |   73 +
 .../benches/ref_type_from_prefix_static_size.rs    |   20 +
 .../ref_type_from_prefix_static_size.x86-64        |   15 +
 .../ref_type_from_prefix_static_size.x86-64.mca    |   65 +
 ..._type_from_prefix_with_elems_dynamic_padding.rs |   23 +
 ...e_from_prefix_with_elems_dynamic_padding.x86-64 |   26 +
 ...om_prefix_with_elems_dynamic_padding.x86-64.mca |   85 +
 ...ref_type_from_prefix_with_elems_dynamic_size.rs |   23 +
 ...type_from_prefix_with_elems_dynamic_size.x86-64 |   27 +
 ..._from_prefix_with_elems_dynamic_size.x86-64.mca |   87 +
 .../ref_type_from_suffix_dynamic_padding.rs        |   22 +
 .../ref_type_from_suffix_dynamic_padding.x86-64    |   31 +
 ...ref_type_from_suffix_dynamic_padding.x86-64.mca |   97 +
 .../benches/ref_type_from_suffix_dynamic_size.rs   |   22 +
 .../ref_type_from_suffix_dynamic_size.x86-64       |   23 +
 .../ref_type_from_suffix_dynamic_size.x86-64.mca   |   81 +
 .../benches/ref_type_from_suffix_static_size.rs    |   20 +
 .../ref_type_from_suffix_static_size.x86-64        |   18 +
 .../ref_type_from_suffix_static_size.x86-64.mca    |   71 +
 ..._type_from_suffix_with_elems_dynamic_padding.rs |   23 +
 ...e_from_suffix_with_elems_dynamic_padding.x86-64 |   27 +
 ...om_suffix_with_elems_dynamic_padding.x86-64.mca |   87 +
 ...ref_type_from_suffix_with_elems_dynamic_size.rs |   23 +
 ...type_from_suffix_with_elems_dynamic_size.x86-64 |   27 +
 ..._from_suffix_with_elems_dynamic_size.x86-64.mca |   87 +
 .../benches/ref_type_into_mut_dynamic_size.rs      |   19 +
 .../benches/ref_type_into_mut_dynamic_size.x86-64  |   27 +
 .../ref_type_into_mut_dynamic_size.x86-64.mca      |   87 +
 .../benches/ref_type_into_mut_static_size.rs       |   19 +
 .../benches/ref_type_into_mut_static_size.x86-64   |    3 +
 .../ref_type_into_mut_static_size.x86-64.mca       |   43 +
 .../benches/ref_type_into_ref_dynamic_padding.rs   |   19 +
 .../ref_type_into_ref_dynamic_padding.x86-64       |   29 +
 .../ref_type_into_ref_dynamic_padding.x86-64.mca   |   91 +
 .../benches/ref_type_into_ref_dynamic_size.rs      |   19 +
 .../benches/ref_type_into_ref_dynamic_size.x86-64  |   27 +
 .../ref_type_into_ref_dynamic_size.x86-64.mca      |   87 +
 .../benches/ref_type_into_ref_static_size.rs       |   19 +
 .../benches/ref_type_into_ref_static_size.x86-64   |    3 +
 .../ref_type_into_ref_static_size.x86-64.mca       |   43 +
 rust/zerocopy/benches/ref_type_read_static_size.rs |   17 +
 .../benches/ref_type_read_static_size.x86-64       |    7 +
 .../benches/ref_type_read_static_size.x86-64.mca   |   51 +
 .../zerocopy/benches/ref_type_write_static_size.rs |   20 +
 .../benches/ref_type_write_static_size.x86-64      |    6 +
 .../benches/ref_type_write_static_size.x86-64.mca  |   49 +
 .../split_via_runtime_check_dynamic_padding.x86-64 |    5 +-
 ...it_via_runtime_check_dynamic_padding.x86-64.mca |   30 +-
 rust/zerocopy/benches/try_read_from_bytes.x86-64   |   28 +-
 .../benches/try_read_from_bytes.x86-64.mca         |   66 +-
 rust/zerocopy/benches/try_read_from_prefix.x86-64  |   19 +-
 .../benches/try_read_from_prefix.x86-64.mca        |   52 +-
 rust/zerocopy/benches/try_read_from_suffix.x86-64  |   21 +-
 .../benches/try_read_from_suffix.x86-64.mca        |   56 +-
 .../try_ref_from_bytes_dynamic_padding.x86-64      |   34 +-
 .../try_ref_from_bytes_dynamic_padding.x86-64.mca  |   76 +-
 .../benches/try_ref_from_bytes_dynamic_size.x86-64 |   31 +-
 .../try_ref_from_bytes_dynamic_size.x86-64.mca     |   70 +-
 .../try_ref_from_prefix_dynamic_padding.x86-64     |   21 +-
 .../try_ref_from_prefix_dynamic_padding.x86-64.mca |   54 +-
 .../try_ref_from_prefix_dynamic_size.x86-64        |   16 +-
 .../try_ref_from_prefix_dynamic_size.x86-64.mca    |   56 +-
 .../try_ref_from_suffix_dynamic_padding.x86-64     |   29 +-
 .../try_ref_from_suffix_dynamic_padding.x86-64.mca |   74 +-
 ...f_from_suffix_with_elems_dynamic_padding.x86-64 |   31 +-
 ...om_suffix_with_elems_dynamic_padding.x86-64.mca |   80 +-
 ..._ref_from_suffix_with_elems_dynamic_size.x86-64 |   28 +-
 ..._from_suffix_with_elems_dynamic_size.x86-64.mca |   72 +-
 rust/zerocopy/benches/write_to_dynamic_size.x86-64 |    3 +-
 .../benches/write_to_dynamic_size.x86-64.mca       |   34 +-
 .../benches/write_to_prefix_dynamic_size.x86-64    |    3 +-
 .../write_to_prefix_dynamic_size.x86-64.mca        |   36 +-
 .../benches/write_to_suffix_dynamic_size.x86-64    |    3 +-
 .../write_to_suffix_dynamic_size.x86-64.mca        |   38 +-
 rust/zerocopy/benches/zero_dynamic_size.x86-64     |    3 +-
 rust/zerocopy/benches/zero_dynamic_size.x86-64.mca |   20 +-
 rust/zerocopy/src/byte_slice.rs                    |    6 +-
 rust/zerocopy/src/byteorder.rs                     |   41 +-
 rust/zerocopy/src/error.rs                         |   14 +-
 rust/zerocopy/src/impls.rs                         |  117 +-
 rust/zerocopy/src/layout.rs                        | 3729 ++++++++++++++++++--
 rust/zerocopy/src/lib.rs                           | 1081 +++++-
 rust/zerocopy/src/macros.rs                        |   53 +-
 rust/zerocopy/src/pointer/inner.rs                 |   35 +-
 rust/zerocopy/src/pointer/invariant.rs             |   61 +-
 rust/zerocopy/src/pointer/mod.rs                   |   50 +-
 rust/zerocopy/src/pointer/ptr.rs                   |  177 +-
 rust/zerocopy/src/pointer/transmute.rs             |  100 +-
 rust/zerocopy/src/ref.rs                           |  762 +++-
 rust/zerocopy/src/split_at.rs                      |  718 +++-
 rust/zerocopy/src/util/macro_util.rs               |  112 +-
 rust/zerocopy/src/util/macros.rs                   |  127 +-
 rust/zerocopy/src/util/mod.rs                      |   40 +-
 rust/zerocopy/src/wrappers.rs                      |  262 +-
 scripts/remove-stale-files                         |    2 +
 scripts/rustdoc_test_builder.rs                    |    7 +
 scripts/rustdoc_test_gen.rs                        |   73 +-
 248 files changed, 17297 insertions(+), 3925 deletions(-)
 create mode 100644 rust/helpers/math.c
 create mode 100644 rust/helpers/ratelimit.c
 create mode 100644 rust/kernel/mem.rs
 create mode 100644 rust/kernel/ratelimit.rs
 create mode 100644 rust/kernel/sync/lockdep.rs
 create mode 100644 rust/pin-init/examples/selfref.rs
 create mode 100644 rust/pin-init/internal/src/util.rs
 create mode 100644 rust/zerocopy-derive/derive/project.rs
 create mode 100644 rust/zerocopy-derive/invariant.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_mut_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_mut_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_deref_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_deref_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_deref_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_bytes_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_prefix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_from_suffix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_mut_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_into_ref_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_read_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_read_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_read_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_type_write_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_type_write_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_type_write_static_size.x86-64.mca
