Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E9F17993;
	Sun, 14 Jun 2026 20:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781468689; cv=none; b=fY24ab8WtWLcigiIUE661oHBScMTxfgZIHoSD1N8itLG9QWiNlWA3zQn6LbcOZl1VW3ilojqxKw/uTAPVprKFzyG2CTZz5KImeeqeDnxUf/re9IutzHSGESaXfX4+tlflUy05ZIfuYm0ak33xegfCf9CX6TbPvojB86zngrQbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781468689; c=relaxed/simple;
	bh=UGIQo7R/I0ZpkPo94UxsaL+u6afY0nVJkBkJBULmKOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gPTX79JMgdI2VtYk7uaXE24PwzJ6SS0nWv9Y+WD3VwSiX8OzFk71NlGa01kbZBKVbXZK6Ehetq9DPAytSYUqTf1xpEVC9VN20TUIRRxo2W0Yye/6Dkw3o/Vlvd1zZxGbNN3yd2JEGBRFJ7N0ikpb4w08mqKE4zS6x0WTn62wldo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DDTsM4tt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DDTsM4tt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0EC1F000E9;
	Sun, 14 Jun 2026 20:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781468686;
	bh=wD3PnCogQxFxo+Ais8p7A8joYS9+P0YMr9Gp4WOu+sw=;
	h=From:To:Cc:Subject:Date;
	b=DDTsM4ttOJxSx04MSnFKJwwXlCQYrhvtRCxHG9c9uLCFzHkQRqAn6qg2rTlXuqQfS
	 sQ+AbJ+C1uyr4ASN5Nqp9zJVGnQxZiKn/VbPAkq2thu6jeuqPeQ0efo/DJZNXgIRBL
	 ay8RvhayHJtj8p0h6HutjQ3oGgyJmKgmwl41Rxi5o7FPG+C8qG0auy62QEY3vOKu25
	 dmIceogouRfld1yETqPnhWYvXQ4yEIG6USbMcTvPHK9V1aeflaD/VBZTLQgVHFgETW
	 mHQzDcDJxMQpW8+fmg8L4jBQAbPQ0qY7+F25rMw2KsVb+Ckwjja+oyxaojY8k0rTbY
	 TagYW0rh6Ddzg==
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
Subject: [GIT PULL] Rust for v7.2
Date: Sun, 14 Jun 2026 22:24:11 +0200
Message-ID: <20260614202412.400461-1-ojeda@kernel.org>
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

This one is big due to the vendoring of the `zerocopy` library, which
allows us to replace a bunch of `unsafe` code dealing with conversions
between byte sequences and other types with safe alternatives. More
details on that below (and in its merge commit).

No conflicts expected at this time, but linux-next should generally have
the right resolutions.

All commits except 5 have been in linux-next for 3 rounds or more -- the
last ones are trivial but have been just on Friday's round.

I plan to send the new build system support for the upcoming cycle,
which solves the "not parallel Rust building in `prepare`" that you
mentioned (among other things).

I may also have a second, tiny PR later in the merge window with a small
patch to simplify cross-tree development for the next cycle.

Finally, I didn't include it in the log below, since it is going through
the tip tree, but another piece of good news is that we will have one
more `MAINTAINERS` entry: `RUST [SYNC]`.

Please pull for v7.2 -- thanks!

Cheers,
Miguel

The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.2

for you to fetch changes up to 48b375e482027ba6566107cec40c1b21b453fa4e:

  MAINTAINERS: add Onur Özkan as Rust reviewer (2026-06-11 23:05:48 +0200)

----------------------------------------------------------------
Rust changes for v7.2

Toolchain and infrastructure:

 - Introduce support for the 'zerocopy' library [1][2]:

       Fast, safe, compile error. Pick two.

       Zerocopy makes zero-cost memory manipulation effortless. We write
       `unsafe` so you don't have to.

   It essentially provides derivable traits (e.g. 'FromBytes') and
   macros (e.g. 'transmute!') for safely converting between byte
   sequences and other types. Having such support allows us to remove
   some 'unsafe' code.

   It is among the most downloaded Rust crates and it is also used by
   the Rust compiler itself.

   It is licensed under "BSD-2-Clause OR Apache-2.0 OR MIT".

   The crates are imported essentially as-is (only +2/-3 lines needed
   to be adapted), plus SPDX identifiers. Upstream has since added the
   SPDX identifiers as well as one of the tweaks at my request, thus
   reducing our future diffs on updates -- I keep the details in one of
   our usual live lists [3].

   In total, it is about ~39k lines added, ~32k without counting
   'benches/' which are just for documentation purposes.

   The series includes a few Kbuild and rust-analyzer improvements and
   an example patch using it in Nova, removing one 'unsafe impl'.

   I checked that the codegen of an isolated example function (similar
   to the Nova patch on top) is essentially identical. It also turns out
   that (for that particular case) the 'zerocopy' version, even with
   'debug-assertions' enabled, has no remaining panics, unlike a few in
   the current code (since the compiler can prove the remaining
   'ub_checks' statically).

   So their "fast, safe" does indeed check out -- at least in that case.

   Link: https://github.com/google/zerocopy [1]
   Link: https://docs.rs/zerocopy [2]
   Link: https://github.com/Rust-for-Linux/linux/issues/1239 [3]

 - Support AutoFDO. This allows Rust code to be profiled and optimized
   based on the profile. Tested with Rust Binder: ~13% slower without
   AutoFDO in the binderAddInts benchmark (using an app-launch benchmark
   for the profile).

 - Support Software Tag-Based KASAN.

   In addition, fix KASAN Kconfig by requiring Clang.

 - Add Kconfig options for each existing Rust KUnit test suite, such as
   'CONFIG_RUST_BITMAP_KUNIT_TEST'. They are placed within a new menu,
   'CONFIG_RUST_KUNIT_TESTS', in the new 'rust/kernel/Kconfig.test'
   file.

 - Support the upcoming Rust 1.98.0 release (expected 2026-08-20): lint
   cleanups and an unstable flag rename.

 - Disable 'rustdoc' documentation inlining for all prelude items, which
   bloats the generated documentation.

 - Ignore (in Git) and clean (in Kbuild) the (rarely) 'rustc'-generated
   '*.long-type-*.txt' files.

'kernel' crate:

 - Add new 'bitfield' module with the 'bitfield!' macro (extracted from
   the existing 'register!' one), which declares integer types that are
   split into distinct bit fields of arbitrary length.

   Each field is a 'Bounded' of the appropriate bit width (ensuring
   values are properly validated and avoiding implicit data loss) and
   gets several generated getters and setters (infallible, 'const' and
   fallible) as well as associated constants ('_MASK', '_SHIFT' and
   '_RANGE'). It also supports fields that can be converted from/to
   custom types, either fallibly ('?=>') or infallibly ('=>').

   For instance:

       bitfield! {
           struct Rgb(u16) {
               15:11 blue;
               10:5 green;
               4:0 red;
           }
       }

       // Compile-time checks.
       let color = Rgb::zeroed().with_const_green::<0x1f>();

       assert_eq!(color.green(), 0x1f);
       assert_eq!(color.into_raw(), 0x1f << Rgb::GREEN_SHIFT);

   Add as well documentation and a test suite for it, as usual; and
   update the 'register!' macro to use it.

   It will be maintained by Alexandre Courbot (with Yury Norov as
   reviewer) under a new 'MAINTAINERS' entry: 'RUST [BITFIELD]'.

 - 'ptr' module: rework index projection syntax into keyworded syntax
   and introduce panicking variant.

   The keyword syntax ('build:', 'try:', 'panic:') is more explicit and
   paves the way of perhaps adding more flavors in the future, e.g. an
   'unsafe' index projection.

   For instance, projections now look like this:

       fn f(p: *const [u8; 32]) -> Result {
           // Ok, within bounds, checked at build time.
           project!(p, [build: 1]);

           // Build error.
           project!(p, [build: 128]);

           // `OutOfBound` runtime error (convertible to `ERANGE`).
           project!(p, [try: 128]);

           // Runtime panic.
           project!(p, [panic: 128]);

           Ok(())
       }

   Update as well the users, which now look like e.g.

       // Pointer to the first entry of the GSP message queue.
       let data = project!(self.0.as_ptr(), .gspq.msgq.data[build: 0]);

 - 'build_assert' module: make the module the home of its macros instead
   of rendering them twice.

 - 'sync' module: add 'UniqueArc::as_ptr()' associated function.

 - 'alloc' module:

    + Fix the 'Vec::reserve()' doctest to properly account for the
      existing vector length in the capacity assertion.

    + Fix an incorrect operator in the 'Vec::extend_with()' 'SAFETY'
      comment; add a doc test demonstrating basic usage and the
      zero-length case.

 - Clean imports across several modules to follow the "kernel vertical"
   import style in order to minimize conflicts.

'pin-init' crate:

 - User visible changes:

    + Do not generate 'non_snake_case' warnings for identifiers that are
      syntactically just users of a field name. This would allow all
      '#[allow(non_snake_case)]' in nova-core to be removed, which Gary
      will send to the nova tree next cycle.

    + Filter non-cfg attributes out properly in derived structs. This
      improves pin-init compatibility with other derive macros.

    + Insert projection types' where clause properly.

 - Other changes:

    + Bump MSRV to 1.82, plus associated cleanups.

    + Overhaul how init slots are projected. The new approach is easier
      to justify with safety comments.

    + Mark more functions as inline, which should help mitigate the
      super-long symbol name issue due to lack of inlining.

rust-analyzer:

 - Support '--envs' for passing env vars for crates like 'zerocopy'.

'MAINTAINERS':

 - Add the following reviewers to the 'RUST' entry:

    + Daniel Almeida
    + Tamir Duberstein
    + Alexandre Courbot
    + Onur Özkan

   They have been involved in the Rust for Linux project for about
   7 collective years and bring expertise across several domains, which
   will be very useful to have around in the future.

   Thanks everyone for stepping up!

And some other fixes, cleanups and improvements.

----------------------------------------------------------------
Alexandre Courbot (3):
      rust: extract `bitfield!` macro from `register!`
      rust: io: use the `bitfield!` macro in `register!`
      rust: inline some init methods

Alice Ryhl (3):
      kbuild: rust: add AutoFDO support
      rust: kasan: KASAN+RUST requires clang
      rust: kasan: add support for Software Tag-Based KASAN

Alistair Francis (1):
      rust: pin-init: examples: mark as `#[inline]` all `From::from()`s for `Error`

Andreas Hindborg (3):
      rust: sync: add `UniqueArc::as_ptr`
      rust: page: use the "kernel vertical" imports style
      rust: aref: use the "kernel vertical" imports style

Ashutosh Desai (1):
      rust: sync: add #[must_use] to GlobalGuard and GlobalLock::try_lock

Benno Lossin (1):
      rust: pin-init: internal: adjust license identifier of `zeroable.rs`

Daniel del Castillo (1):
      rust: error: replace match + panic in const context with const expect

Danilo Krummrich (2):
      rust: alloc: cleanup imports and use "kernel vertical" style
      rust: alloc: cleanup doctest imports to "kernel vertical" style

Gary Guo (25):
      rust: pin-init: bump minimum Rust version to 1.82
      rust: pin-init: internal: remove redundant `#[pin]` filtering
      rust: pin-init: fix badge URL in README
      rust: pin-init: cleanup workaround for old Rust compiler
      rust: pin-init: internal: turn `PhantomPinned` error into warnings
      rust: pin-init: internal: remove `collect_tuple` polyfill after MSRV bump
      rust: pin-init: examples: fix `useless_borrows_in_formatting` clippy warning
      rust: pin-init: internal: pin_data: use closure for `handle_field`
      rust: pin-init: internal: add `PhantomInvariant` and `PhantomInvariantLifetime`
      rust: pin-init: internal: init: handle code blocks early
      rust: pin-init: internal: use marker on drop guard type for pinned fields
      rust: pin-init: internal: make `make_closure` inherent methods
      rust: pin-init: internal: project slots instead of references
      rust: pin-init: internal: project using full slot
      rust: doc: disable doc inlining for all prelude items
      rust: pin-init: move `InitClosure` out from `__internal`
      rust: pin-init: remove `E` from `InitClosure`
      rust: pin_init: internal: use `loop {}` to produce never value
      rust: ptr: rename `ProjectIndex::index` to `build_index`
      rust: ptr: use `match` instead of `unwrap_or_else` for `build_index`
      rust: ptr: add panicking index projection variant
      rust: dma: update to keyworded index projection syntax
      gpu: nova-core: convert to keyworded projection syntax
      rust: ptr: remove implicit index projection syntax
      rust: make `build_assert` module the home of related macros

Hsiu Che Yu (3):
      rust: alloc: fix assert in `Vec::reserve` doc test
      rust: alloc: add doc test for `Vec::extend_with`
      rust: alloc: fix `Vec::extend_with` SAFETY comment

Joel Fernandes (1):
      rust: bitfield: Add KUnit tests for bitfield

Joel Kamminga (1):
      kbuild: rust: clean `*.long-type-*.txt` files

Ke Sun (1):
      rust: fmt: use vertical import style

Manos Pitsidianakis (1):
      .gitignore: ignore rustc long type txt files

Martin Kletzander (1):
      rust: pin-init: internal: pin_data: filter non-`#[cfg]` attr in generated code

Miguel Ojeda (31):
      Merge tag 'alloc-7.2-rc1' of https://github.com/Rust-for-Linux/linux into rust-next
      rust: cpufreq: clean new `clippy::map_or_identity` lint for Rust 1.98.0
      kbuild: rust: rename flag to `-Zdebuginfo-for-profiling` for Rust >= 1.98
      Merge tag 'pin-init-v7.2' of https://github.com/Rust-for-Linux/linux into rust-next
      scripts: generate_rust_analyzer: support passing env vars
      rust: kbuild: show the right `quiet_cmd_rustc_procmacrolibrary`
      rust: kbuild: remove unused variable
      rust: kbuild: define `procmacro-name` function
      rust: kbuild: define `procmacro-extension` variable
      rust: kbuild: support per-target environment variables
      rust: kbuild: support `skip_clippy` for `rustc_procmacro`
      rust: zerocopy: import crate
      rust: zerocopy: add SPDX License Identifiers
      rust: zerocopy: remove float `Display` support
      rust: zerocopy: add `README.md`
      rust: zerocopy: enable support in kbuild
      rust: zerocopy-derive: import crate
      rust: zerocopy-derive: add SPDX License Identifiers
      rust: zerocopy-derive: avoid generating non-ASCII identifiers
      rust: zerocopy-derive: add `README.md`
      rust: zerocopy-derive: enable support in kbuild
      rust: prelude: add `zerocopy{,_derive}::FromBytes`
      gpu: nova-core: firmware: parse `FalconUCodeDescV2` via `zerocopy`
      Merge patch series "`zerocopy` support"
      rust: str: use the "kernel vertical" imports style
      rust: str: clean unused import for Rust >= 1.98
      kbuild: rust: clean `zerocopy-derive` in `mrproper`
      MAINTAINERS: add Daniel Almeida as Rust reviewer
      MAINTAINERS: add Tamir Duberstein as Rust reviewer
      MAINTAINERS: add Alexandre Courbot as Rust reviewer
      MAINTAINERS: add Onur Özkan as Rust reviewer

Mirko Adzic (2):
      rust: pin-init: internal: suppress `non_snake_case` lint in `#[pin_data]`
      rust: pin-init: internal: suppress `non_snake_case` lint in `[pin_]init!`

Mohamad Alsadhan (4):
      rust: pin-init: cleanup `Zeroable` and `ZeroableOptions`
      rust: pin-init: extend `impl_zeroable_option` macro to handle generics
      rust: pin-init: internal: add missing where clause to projection types
      rust: pin-init: internal: pin_data: add struct to record field info

Xiaobo Liu (1):
      rust: pin-init: docs: fix typos in MaybeZeroable documentation

Yury Norov (3):
      rust: tests: drop 'use crate' in bitmap and atomic KUnit tests
      rust: tests: add Kconfig for KUnit test
      Documentation: rust: testing: add Kconfig guidance

 .gitignore                                         |    3 +
 Documentation/rust/testing.rst                     |    5 +
 MAINTAINERS                                        |   11 +
 Makefile                                           |    6 +-
 drivers/gpu/nova-core/bitfield.rs                  |    4 +-
 drivers/gpu/nova-core/firmware.rs                  |    5 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |    6 +-
 drivers/gpu/nova-core/num.rs                       |    2 +-
 drivers/gpu/nova-core/vbios.rs                     |    6 +-
 init/Kconfig                                       |    5 +-
 rust/Makefile                                      |   96 +-
 rust/kernel/Kconfig.test                           |   86 +
 rust/kernel/alloc.rs                               |    8 +-
 rust/kernel/alloc/allocator.rs                     |   35 +-
 rust/kernel/alloc/allocator/iter.rs                |    8 +-
 rust/kernel/alloc/kbox.rs                          |   78 +-
 rust/kernel/alloc/kvec.rs                          |   82 +-
 rust/kernel/alloc/kvec/errors.rs                   |    6 +-
 rust/kernel/alloc/layout.rs                        |   10 +-
 rust/kernel/bitfield.rs                            |  862 +++
 rust/kernel/bitmap.rs                              |    5 +-
 rust/kernel/build_assert.rs                        |   19 +-
 rust/kernel/cpufreq.rs                             |    2 +-
 rust/kernel/dma.rs                                 |   15 +-
 rust/kernel/error.rs                               |    6 +-
 rust/kernel/fmt.rs                                 |   19 +-
 rust/kernel/init.rs                                |    2 +
 rust/kernel/io/register.rs                         |  265 +-
 rust/kernel/io/resource.rs                         |    2 +-
 rust/kernel/ioctl.rs                               |    2 +-
 rust/kernel/kunit.rs                               |    1 +
 rust/kernel/lib.rs                                 |    1 +
 rust/kernel/net/phy/reg.rs                         |    8 +-
 rust/kernel/num/bounded.rs                         |    2 +-
 rust/kernel/page.rs                                |   18 +-
 rust/kernel/prelude.rs                             |   19 +-
 rust/kernel/ptr/projection.rs                      |   99 +-
 rust/kernel/str.rs                                 |   24 +-
 rust/kernel/sync/arc.rs                            |   12 +
 rust/kernel/sync/aref.rs                           |    7 +-
 rust/kernel/sync/atomic/internal.rs                |    9 +-
 rust/kernel/sync/atomic/predefine.rs               |    9 +-
 rust/kernel/sync/lock/global.rs                    |    2 +
 rust/kernel/sync/locked_by.rs                      |    2 +-
 rust/kernel/sync/refcount.rs                       |    8 +-
 rust/kernel/xarray.rs                              |   10 +-
 rust/pin-init/README.md                            |    2 +-
 rust/pin-init/examples/big_struct_in_place.rs      |    3 -
 rust/pin-init/examples/error.rs                    |    2 +
 rust/pin-init/examples/linked_list.rs              |    2 -
 rust/pin-init/examples/mutex.rs                    |    4 +-
 rust/pin-init/examples/pthread_mutex.rs            |    4 +-
 rust/pin-init/examples/static_init.rs              |    4 +-
 rust/pin-init/internal/src/diagnostics.rs          |   14 +
 rust/pin-init/internal/src/init.rs                 |  169 +-
 rust/pin-init/internal/src/lib.rs                  |    1 -
 rust/pin-init/internal/src/pin_data.rs             |  268 +-
 rust/pin-init/internal/src/zeroable.rs             |    2 +-
 rust/pin-init/src/__internal.rs                    |  231 +-
 rust/pin-init/src/lib.rs                           |  137 +-
 rust/zerocopy-derive/README.md                     |   14 +
 rust/zerocopy-derive/derive/from_bytes.rs          |  192 +
 rust/zerocopy-derive/derive/into_bytes.rs          |  164 +
 rust/zerocopy-derive/derive/known_layout.rs        |  350 +
 rust/zerocopy-derive/derive/mod.rs                 |  132 +
 rust/zerocopy-derive/derive/try_from_bytes.rs      |  765 ++
 rust/zerocopy-derive/derive/unaligned.rs           |   80 +
 rust/zerocopy-derive/lib.rs                        |  146 +
 rust/zerocopy-derive/repr.rs                       |  851 +++
 rust/zerocopy-derive/util.rs                       |  845 +++
 rust/zerocopy/README.md                            |   14 +
 rust/zerocopy/benches/as_bytes_dynamic_size.rs     |    9 +
 rust/zerocopy/benches/as_bytes_dynamic_size.x86-64 |    5 +
 .../benches/as_bytes_dynamic_size.x86-64.mca       |   47 +
 rust/zerocopy/benches/as_bytes_static_size.rs      |    9 +
 rust/zerocopy/benches/as_bytes_static_size.x86-64  |    4 +
 .../benches/as_bytes_static_size.x86-64.mca        |   45 +
 rust/zerocopy/benches/extend_vec_zeroed.rs         |    9 +
 rust/zerocopy/benches/extend_vec_zeroed.x86-64     |   60 +
 rust/zerocopy/benches/extend_vec_zeroed.x86-64.mca |  147 +
 .../benches/formats/coco_dynamic_padding.rs        |   24 +
 rust/zerocopy/benches/formats/coco_dynamic_size.rs |   27 +
 rust/zerocopy/benches/formats/coco_static_size.rs  |   27 +
 rust/zerocopy/benches/insert_vec_zeroed.rs         |   13 +
 rust/zerocopy/benches/insert_vec_zeroed.x86-64     |   79 +
 rust/zerocopy/benches/insert_vec_zeroed.x86-64.mca |  183 +
 rust/zerocopy/benches/new_box_zeroed.rs            |    9 +
 rust/zerocopy/benches/new_box_zeroed.x86-64        |    7 +
 rust/zerocopy/benches/new_box_zeroed.x86-64.mca    |   51 +
 .../new_box_zeroed_with_elems_dynamic_padding.rs   |   11 +
 ...ew_box_zeroed_with_elems_dynamic_padding.x86-64 |   24 +
 ...ox_zeroed_with_elems_dynamic_padding.x86-64.mca |   81 +
 .../new_box_zeroed_with_elems_dynamic_size.rs      |    9 +
 .../new_box_zeroed_with_elems_dynamic_size.x86-64  |   22 +
 ...w_box_zeroed_with_elems_dynamic_size.x86-64.mca |   77 +
 rust/zerocopy/benches/new_vec_zeroed.rs            |    9 +
 rust/zerocopy/benches/new_vec_zeroed.x86-64        |   40 +
 rust/zerocopy/benches/new_vec_zeroed.x86-64.mca    |  113 +
 rust/zerocopy/benches/new_zeroed.rs                |    9 +
 rust/zerocopy/benches/new_zeroed.x86-64            |    3 +
 rust/zerocopy/benches/new_zeroed.x86-64.mca        |   43 +
 rust/zerocopy/benches/read_from_bytes.rs           |    7 +
 rust/zerocopy/benches/read_from_bytes.x86-64       |   15 +
 rust/zerocopy/benches/read_from_bytes.x86-64.mca   |   65 +
 rust/zerocopy/benches/read_from_prefix.rs          |   10 +
 rust/zerocopy/benches/read_from_prefix.x86-64      |   14 +
 rust/zerocopy/benches/read_from_prefix.x86-64.mca  |   63 +
 rust/zerocopy/benches/read_from_suffix.rs          |   10 +
 rust/zerocopy/benches/read_from_suffix.x86-64      |   15 +
 rust/zerocopy/benches/read_from_suffix.x86-64.mca  |   65 +
 .../benches/ref_from_bytes_dynamic_padding.rs      |    7 +
 .../benches/ref_from_bytes_dynamic_padding.x86-64  |   22 +
 .../ref_from_bytes_dynamic_padding.x86-64.mca      |   77 +
 .../benches/ref_from_bytes_dynamic_size.rs         |    7 +
 .../benches/ref_from_bytes_dynamic_size.x86-64     |   20 +
 .../benches/ref_from_bytes_dynamic_size.x86-64.mca |   75 +
 .../zerocopy/benches/ref_from_bytes_static_size.rs |    7 +
 .../benches/ref_from_bytes_static_size.x86-64      |    8 +
 .../benches/ref_from_bytes_static_size.x86-64.mca  |   53 +
 .../ref_from_bytes_with_elems_dynamic_padding.rs   |   10 +
 ...ef_from_bytes_with_elems_dynamic_padding.x86-64 |   19 +
 ...rom_bytes_with_elems_dynamic_padding.x86-64.mca |   71 +
 .../ref_from_bytes_with_elems_dynamic_size.rs      |   10 +
 .../ref_from_bytes_with_elems_dynamic_size.x86-64  |   16 +
 ...f_from_bytes_with_elems_dynamic_size.x86-64.mca |   65 +
 .../benches/ref_from_prefix_dynamic_padding.rs     |   10 +
 .../benches/ref_from_prefix_dynamic_padding.x86-64 |   22 +
 .../ref_from_prefix_dynamic_padding.x86-64.mca     |   77 +
 .../benches/ref_from_prefix_dynamic_size.rs        |   10 +
 .../benches/ref_from_prefix_dynamic_size.x86-64    |   17 +
 .../ref_from_prefix_dynamic_size.x86-64.mca        |   67 +
 .../benches/ref_from_prefix_static_size.rs         |   10 +
 .../benches/ref_from_prefix_static_size.x86-64     |    8 +
 .../benches/ref_from_prefix_static_size.x86-64.mca |   53 +
 .../ref_from_prefix_with_elems_dynamic_padding.rs  |   13 +
 ...f_from_prefix_with_elems_dynamic_padding.x86-64 |   26 +
 ...om_prefix_with_elems_dynamic_padding.x86-64.mca |   85 +
 .../ref_from_prefix_with_elems_dynamic_size.rs     |   13 +
 .../ref_from_prefix_with_elems_dynamic_size.x86-64 |   22 +
 ..._from_prefix_with_elems_dynamic_size.x86-64.mca |   77 +
 .../benches/ref_from_suffix_dynamic_padding.rs     |   10 +
 .../benches/ref_from_suffix_dynamic_padding.x86-64 |   23 +
 .../ref_from_suffix_dynamic_padding.x86-64.mca     |   79 +
 .../benches/ref_from_suffix_dynamic_size.rs        |   10 +
 .../benches/ref_from_suffix_dynamic_size.x86-64    |   13 +
 .../ref_from_suffix_dynamic_size.x86-64.mca        |   63 +
 .../benches/ref_from_suffix_static_size.rs         |   10 +
 .../benches/ref_from_suffix_static_size.x86-64     |   13 +
 .../benches/ref_from_suffix_static_size.x86-64.mca |   61 +
 .../ref_from_suffix_with_elems_dynamic_padding.rs  |   13 +
 ...f_from_suffix_with_elems_dynamic_padding.x86-64 |   27 +
 ...om_suffix_with_elems_dynamic_padding.x86-64.mca |   85 +
 .../ref_from_suffix_with_elems_dynamic_size.rs     |   13 +
 .../ref_from_suffix_with_elems_dynamic_size.x86-64 |   23 +
 ..._from_suffix_with_elems_dynamic_size.x86-64.mca |   77 +
 rust/zerocopy/benches/split_at_dynamic_padding.rs  |   12 +
 .../benches/split_at_dynamic_padding.x86-64        |   12 +
 .../benches/split_at_dynamic_padding.x86-64.mca    |   59 +
 rust/zerocopy/benches/split_at_dynamic_size.rs     |   12 +
 rust/zerocopy/benches/split_at_dynamic_size.x86-64 |   12 +
 .../benches/split_at_dynamic_size.x86-64.mca       |   59 +
 .../benches/split_at_unchecked_dynamic_padding.rs  |   12 +
 .../split_at_unchecked_dynamic_padding.x86-64      |    6 +
 .../split_at_unchecked_dynamic_padding.x86-64.mca  |   49 +
 .../benches/split_at_unchecked_dynamic_size.rs     |   12 +
 .../benches/split_at_unchecked_dynamic_size.x86-64 |    6 +
 .../split_at_unchecked_dynamic_size.x86-64.mca     |   49 +
 .../benches/split_via_immutable_dynamic_padding.rs |   11 +
 .../split_via_immutable_dynamic_padding.x86-64     |   14 +
 .../split_via_immutable_dynamic_padding.x86-64.mca |   65 +
 .../benches/split_via_immutable_dynamic_size.rs    |   11 +
 .../split_via_immutable_dynamic_size.x86-64        |   13 +
 .../split_via_immutable_dynamic_size.x86-64.mca    |   63 +
 .../split_via_runtime_check_dynamic_padding.rs     |   11 +
 .../split_via_runtime_check_dynamic_padding.x86-64 |   22 +
 ...it_via_runtime_check_dynamic_padding.x86-64.mca |   79 +
 .../split_via_runtime_check_dynamic_size.rs        |   11 +
 .../split_via_runtime_check_dynamic_size.x86-64    |   13 +
 ...split_via_runtime_check_dynamic_size.x86-64.mca |   63 +
 .../benches/split_via_unchecked_dynamic_padding.rs |   11 +
 .../split_via_unchecked_dynamic_padding.x86-64     |   14 +
 .../split_via_unchecked_dynamic_padding.x86-64.mca |   65 +
 .../benches/split_via_unchecked_dynamic_size.rs    |   11 +
 .../split_via_unchecked_dynamic_size.x86-64        |   13 +
 .../split_via_unchecked_dynamic_size.x86-64.mca    |   63 +
 rust/zerocopy/benches/transmute.rs                 |   16 +
 rust/zerocopy/benches/transmute.x86-64             |    3 +
 rust/zerocopy/benches/transmute.x86-64.mca         |   43 +
 .../zerocopy/benches/transmute_ref_dynamic_size.rs |   16 +
 .../benches/transmute_ref_dynamic_size.x86-64      |    4 +
 .../benches/transmute_ref_dynamic_size.x86-64.mca  |   45 +
 rust/zerocopy/benches/transmute_ref_static_size.rs |   15 +
 .../benches/transmute_ref_static_size.x86-64       |    3 +
 .../benches/transmute_ref_static_size.x86-64.mca   |   43 +
 rust/zerocopy/benches/try_read_from_bytes.rs       |    7 +
 rust/zerocopy/benches/try_read_from_bytes.x86-64   |   23 +
 .../benches/try_read_from_bytes.x86-64.mca         |   79 +
 rust/zerocopy/benches/try_read_from_prefix.rs      |   10 +
 rust/zerocopy/benches/try_read_from_prefix.x86-64  |   16 +
 .../benches/try_read_from_prefix.x86-64.mca        |   67 +
 rust/zerocopy/benches/try_read_from_suffix.rs      |   10 +
 rust/zerocopy/benches/try_read_from_suffix.x86-64  |   18 +
 .../benches/try_read_from_suffix.x86-64.mca        |   71 +
 .../benches/try_ref_from_bytes_dynamic_padding.rs  |    7 +
 .../try_ref_from_bytes_dynamic_padding.x86-64      |   24 +
 .../try_ref_from_bytes_dynamic_padding.x86-64.mca  |   81 +
 .../benches/try_ref_from_bytes_dynamic_size.rs     |    7 +
 .../benches/try_ref_from_bytes_dynamic_size.x86-64 |   22 +
 .../try_ref_from_bytes_dynamic_size.x86-64.mca     |   79 +
 .../benches/try_ref_from_bytes_static_size.rs      |    7 +
 .../benches/try_ref_from_bytes_static_size.x86-64  |   13 +
 .../try_ref_from_bytes_static_size.x86-64.mca      |   59 +
 ...ry_ref_from_bytes_with_elems_dynamic_padding.rs |   10 +
 ...ef_from_bytes_with_elems_dynamic_padding.x86-64 |   21 +
 ...rom_bytes_with_elems_dynamic_padding.x86-64.mca |   75 +
 .../try_ref_from_bytes_with_elems_dynamic_size.rs  |   10 +
 ...y_ref_from_bytes_with_elems_dynamic_size.x86-64 |   18 +
 ...f_from_bytes_with_elems_dynamic_size.x86-64.mca |   69 +
 .../benches/try_ref_from_prefix_dynamic_padding.rs |   10 +
 .../try_ref_from_prefix_dynamic_padding.x86-64     |   29 +
 .../try_ref_from_prefix_dynamic_padding.x86-64.mca |   91 +
 .../benches/try_ref_from_prefix_dynamic_size.rs    |   10 +
 .../try_ref_from_prefix_dynamic_size.x86-64        |   22 +
 .../try_ref_from_prefix_dynamic_size.x86-64.mca    |   77 +
 .../benches/try_ref_from_prefix_static_size.rs     |   10 +
 .../benches/try_ref_from_prefix_static_size.x86-64 |   15 +
 .../try_ref_from_prefix_static_size.x86-64.mca     |   63 +
 ...y_ref_from_prefix_with_elems_dynamic_padding.rs |   13 +
 ...f_from_prefix_with_elems_dynamic_padding.x86-64 |   30 +
 ...om_prefix_with_elems_dynamic_padding.x86-64.mca |   91 +
 .../try_ref_from_prefix_with_elems_dynamic_size.rs |   13 +
 ..._ref_from_prefix_with_elems_dynamic_size.x86-64 |   26 +
 ..._from_prefix_with_elems_dynamic_size.x86-64.mca |   83 +
 .../benches/try_ref_from_suffix_dynamic_padding.rs |   10 +
 .../try_ref_from_suffix_dynamic_padding.x86-64     |   26 +
 .../try_ref_from_suffix_dynamic_padding.x86-64.mca |   85 +
 .../benches/try_ref_from_suffix_dynamic_size.rs    |   10 +
 .../try_ref_from_suffix_dynamic_size.x86-64        |   18 +
 .../try_ref_from_suffix_dynamic_size.x86-64.mca    |   71 +
 .../benches/try_ref_from_suffix_static_size.rs     |   10 +
 .../benches/try_ref_from_suffix_static_size.x86-64 |   16 +
 .../try_ref_from_suffix_static_size.x86-64.mca     |   67 +
 ...y_ref_from_suffix_with_elems_dynamic_padding.rs |   13 +
 ...f_from_suffix_with_elems_dynamic_padding.x86-64 |   32 +
 ...om_suffix_with_elems_dynamic_padding.x86-64.mca |   95 +
 .../try_ref_from_suffix_with_elems_dynamic_size.rs |   13 +
 ..._ref_from_suffix_with_elems_dynamic_size.x86-64 |   28 +
 ..._from_suffix_with_elems_dynamic_size.x86-64.mca |   87 +
 rust/zerocopy/benches/try_transmute.rs             |   16 +
 rust/zerocopy/benches/try_transmute.x86-64         |    9 +
 rust/zerocopy/benches/try_transmute.x86-64.mca     |   55 +
 .../benches/try_transmute_ref_dynamic_size.rs      |   18 +
 .../benches/try_transmute_ref_dynamic_size.x86-64  |    6 +
 .../try_transmute_ref_dynamic_size.x86-64.mca      |   49 +
 .../benches/try_transmute_ref_static_size.rs       |   17 +
 .../benches/try_transmute_ref_static_size.x86-64   |    5 +
 .../try_transmute_ref_static_size.x86-64.mca       |   47 +
 rust/zerocopy/benches/write_to_dynamic_size.rs     |    9 +
 rust/zerocopy/benches/write_to_dynamic_size.x86-64 |   21 +
 .../benches/write_to_dynamic_size.x86-64.mca       |   77 +
 .../benches/write_to_prefix_dynamic_size.rs        |   12 +
 .../benches/write_to_prefix_dynamic_size.x86-64    |   21 +
 .../write_to_prefix_dynamic_size.x86-64.mca        |   77 +
 .../benches/write_to_prefix_static_size.rs         |   12 +
 .../benches/write_to_prefix_static_size.x86-64     |   11 +
 .../benches/write_to_prefix_static_size.x86-64.mca |   57 +
 rust/zerocopy/benches/write_to_static_size.rs      |    9 +
 rust/zerocopy/benches/write_to_static_size.x86-64  |   11 +
 .../benches/write_to_static_size.x86-64.mca        |   57 +
 .../benches/write_to_suffix_dynamic_size.rs        |   12 +
 .../benches/write_to_suffix_dynamic_size.x86-64    |   22 +
 .../write_to_suffix_dynamic_size.x86-64.mca        |   79 +
 .../benches/write_to_suffix_static_size.rs         |   12 +
 .../benches/write_to_suffix_static_size.x86-64     |   11 +
 .../benches/write_to_suffix_static_size.x86-64.mca |   57 +
 rust/zerocopy/benches/zero_dynamic_padding.rs      |    9 +
 rust/zerocopy/benches/zero_dynamic_padding.x86-64  |    7 +
 .../benches/zero_dynamic_padding.x86-64.mca        |   51 +
 rust/zerocopy/benches/zero_dynamic_size.rs         |    9 +
 rust/zerocopy/benches/zero_dynamic_size.x86-64     |    5 +
 rust/zerocopy/benches/zero_dynamic_size.x86-64.mca |   47 +
 rust/zerocopy/benches/zero_static_size.rs          |    9 +
 rust/zerocopy/benches/zero_static_size.x86-64      |    4 +
 rust/zerocopy/benches/zero_static_size.x86-64.mca  |   45 +
 rust/zerocopy/rustdoc/style.css                    |   57 +
 rust/zerocopy/src/byte_slice.rs                    |  434 ++
 rust/zerocopy/src/byteorder.rs                     | 1564 ++++
 rust/zerocopy/src/deprecated.rs                    |  281 +
 rust/zerocopy/src/error.rs                         | 1350 ++++
 rust/zerocopy/src/impls.rs                         | 2389 ++++++
 rust/zerocopy/src/layout.rs                        | 2225 ++++++
 rust/zerocopy/src/lib.rs                           | 7612 ++++++++++++++++++++
 rust/zerocopy/src/macros.rs                        | 1825 +++++
 rust/zerocopy/src/pointer/inner.rs                 |  754 ++
 rust/zerocopy/src/pointer/invariant.rs             |  298 +
 rust/zerocopy/src/pointer/mod.rs                   |  410 ++
 rust/zerocopy/src/pointer/ptr.rs                   | 1586 ++++
 rust/zerocopy/src/pointer/transmute.rs             |  522 ++
 rust/zerocopy/src/ref.rs                           | 1358 ++++
 rust/zerocopy/src/split_at.rs                      | 1090 +++
 rust/zerocopy/src/util/macro_util.rs               | 1310 ++++
 rust/zerocopy/src/util/macros.rs                   | 1067 +++
 rust/zerocopy/src/util/mod.rs                      |  938 +++
 rust/zerocopy/src/wrappers.rs                      | 1034 +++
 samples/rust/rust_dma.rs                           |   12 +-
 scripts/Makefile.autofdo                           |    6 +-
 scripts/Makefile.build                             |    1 +
 scripts/Makefile.kasan                             |    2 -
 scripts/Makefile.lib                               |    3 +
 scripts/generate_rust_analyzer.py                  |   38 +-
 310 files changed, 40553 insertions(+), 841 deletions(-)
 create mode 100644 rust/kernel/Kconfig.test
 create mode 100644 rust/kernel/bitfield.rs
 create mode 100644 rust/zerocopy-derive/README.md
 create mode 100644 rust/zerocopy-derive/derive/from_bytes.rs
 create mode 100644 rust/zerocopy-derive/derive/into_bytes.rs
 create mode 100644 rust/zerocopy-derive/derive/known_layout.rs
 create mode 100644 rust/zerocopy-derive/derive/mod.rs
 create mode 100644 rust/zerocopy-derive/derive/try_from_bytes.rs
 create mode 100644 rust/zerocopy-derive/derive/unaligned.rs
 create mode 100644 rust/zerocopy-derive/lib.rs
 create mode 100644 rust/zerocopy-derive/repr.rs
 create mode 100644 rust/zerocopy-derive/util.rs
 create mode 100644 rust/zerocopy/README.md
 create mode 100644 rust/zerocopy/benches/as_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/as_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/as_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/as_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/as_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/as_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/extend_vec_zeroed.rs
 create mode 100644 rust/zerocopy/benches/extend_vec_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/extend_vec_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/formats/coco_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/formats/coco_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/formats/coco_static_size.rs
 create mode 100644 rust/zerocopy/benches/insert_vec_zeroed.rs
 create mode 100644 rust/zerocopy/benches/insert_vec_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/insert_vec_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_box_zeroed.rs
 create mode 100644 rust/zerocopy/benches/new_box_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/new_box_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_vec_zeroed.rs
 create mode 100644 rust/zerocopy/benches/new_vec_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/new_vec_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_zeroed.rs
 create mode 100644 rust/zerocopy/benches/new_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/new_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/read_from_bytes.rs
 create mode 100644 rust/zerocopy/benches/read_from_bytes.x86-64
 create mode 100644 rust/zerocopy/benches/read_from_bytes.x86-64.mca
 create mode 100644 rust/zerocopy/benches/read_from_prefix.rs
 create mode 100644 rust/zerocopy/benches/read_from_prefix.x86-64
 create mode 100644 rust/zerocopy/benches/read_from_prefix.x86-64.mca
 create mode 100644 rust/zerocopy/benches/read_from_suffix.rs
 create mode 100644 rust/zerocopy/benches/read_from_suffix.x86-64
 create mode 100644 rust/zerocopy/benches/read_from_suffix.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/transmute.rs
 create mode 100644 rust/zerocopy/benches/transmute.x86-64
 create mode 100644 rust/zerocopy/benches/transmute.x86-64.mca
 create mode 100644 rust/zerocopy/benches/transmute_ref_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/transmute_ref_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/transmute_ref_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/transmute_ref_static_size.rs
 create mode 100644 rust/zerocopy/benches/transmute_ref_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/transmute_ref_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_read_from_bytes.rs
 create mode 100644 rust/zerocopy/benches/try_read_from_bytes.x86-64
 create mode 100644 rust/zerocopy/benches/try_read_from_bytes.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_read_from_prefix.rs
 create mode 100644 rust/zerocopy/benches/try_read_from_prefix.x86-64
 create mode 100644 rust/zerocopy/benches/try_read_from_prefix.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_read_from_suffix.rs
 create mode 100644 rust/zerocopy/benches/try_read_from_suffix.x86-64
 create mode 100644 rust/zerocopy/benches/try_read_from_suffix.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_static_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_static_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_transmute.rs
 create mode 100644 rust/zerocopy/benches/try_transmute.x86-64
 create mode 100644 rust/zerocopy/benches/try_transmute.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_static_size.rs
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_prefix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_prefix_static_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_prefix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_prefix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_static_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_suffix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_suffix_static_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_suffix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_suffix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/zero_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/zero_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/zero_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/zero_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/zero_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/zero_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/zero_static_size.rs
 create mode 100644 rust/zerocopy/benches/zero_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/zero_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/rustdoc/style.css
 create mode 100644 rust/zerocopy/src/byte_slice.rs
 create mode 100644 rust/zerocopy/src/byteorder.rs
 create mode 100644 rust/zerocopy/src/deprecated.rs
 create mode 100644 rust/zerocopy/src/error.rs
 create mode 100644 rust/zerocopy/src/impls.rs
 create mode 100644 rust/zerocopy/src/layout.rs
 create mode 100644 rust/zerocopy/src/lib.rs
 create mode 100644 rust/zerocopy/src/macros.rs
 create mode 100644 rust/zerocopy/src/pointer/inner.rs
 create mode 100644 rust/zerocopy/src/pointer/invariant.rs
 create mode 100644 rust/zerocopy/src/pointer/mod.rs
 create mode 100644 rust/zerocopy/src/pointer/ptr.rs
 create mode 100644 rust/zerocopy/src/pointer/transmute.rs
 create mode 100644 rust/zerocopy/src/ref.rs
 create mode 100644 rust/zerocopy/src/split_at.rs
 create mode 100644 rust/zerocopy/src/util/macro_util.rs
 create mode 100644 rust/zerocopy/src/util/macros.rs
 create mode 100644 rust/zerocopy/src/util/mod.rs
 create mode 100644 rust/zerocopy/src/wrappers.rs
