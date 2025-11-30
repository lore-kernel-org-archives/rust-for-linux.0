Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C4524A069;
	Sun, 30 Nov 2025 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764545786; cv=none; b=l0XGtNHvmYOTtTb9o0kl9zkvdspIXGxGEojm8FgCfHXV/i7MGc2MrYF1rAGOXkmHyuqZ4qDxjYQ8c61nJZpQUWh8NX9jTiu8zCsa2n/r+9X8VrNdTudAri+7rZzy8dXXYBhrn4Y7WLd6gHCzYAKeaz3D+ub8a1ef1HKaiJELy4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764545786; c=relaxed/simple;
	bh=3wQwQXDfHzjQFusM0lhhyapI2/CfhoR8VBP0dngzFQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G2I1LaSBxeAzAuCiSFpN2EGuAaRM4XXA5khlwQk2GlIPNOCDFnYoUD8Fb96c58cy+DCRQ66oaWGdz+WouCIPuP4Y4BI5K/zz4wv8HrPCao5ZD2Rs9i0R46JT8rL/umxkBx0Io3CQX4H4BHtZNCLa6qmsdW6XBSVrsqhEmiU4xx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ysdy3YoT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ysdy3YoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14A0C4CEF8;
	Sun, 30 Nov 2025 23:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764545786;
	bh=3wQwQXDfHzjQFusM0lhhyapI2/CfhoR8VBP0dngzFQw=;
	h=From:To:Cc:Subject:Date:From;
	b=Ysdy3YoTFjc6VYf13m4z4J2/uzhlvwXSRS1ZyhQIEUklr9L7ynhML0NqojF/texAB
	 XAmvG/PMbNzarkspELm45QRfQipLVXYqgI+N0Y+9kwTXNsI801KMflKY5LgP2bGYW1
	 oce4la+r2YW4v0aXko/0adDQjxUDlSzcVHUPD4NnKF9fM6RgP/+wY/cC2CMJK+dYO/
	 hhT0IMQ8RbMRFj0rzvzHBhpsYvZUgXa+H8Vv1l+fL2eW3jMgqAq2NP3x3zIdf2nit4
	 NhWrjvRYfqx4/2wad+JqgDJk0fO5HjLIh3p82sj0DBmdsC8W7Vzuo7t6jzXjLJSVjp
	 ou7JIJtScWCyQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
Subject: [GIT PULL] Rust for 6.19
Date: Mon,  1 Dec 2025 00:35:53 +0100
Message-ID: <20251130233553.1621716-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

This is the next round of the Rust support.

The biggest one so far in terms of lines, but conceptually not so much.
The reason is that this is the PR that adds `syn` support -- I used a
merge commit for that patch series to keep the cover letter context.

No conflicts expected at this time. Nevertheless, I did a test merge.
When you merge other trees, you will have some. The resolutions in
linux-next should be fine.

All commits have been in linux-next for at least four rounds; most for
more than a week. The only C side change is the Rust-related kallsyms
one, which I had for an extra week in -next (in another branch).

Please pull for v6.19 -- thanks!

Cheers,
Miguel

The following changes since commit 211ddde0823f1442e4ad052a2f30f050145ccada:

  Linux 6.18-rc2 (2025-10-19 15:19:16 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.19

for you to fetch changes up to 54e3eae855629702c566bd2e130d9f40e7f35bde:

  Merge patch series "`syn` support" (2025-11-24 17:48:16 +0100)

----------------------------------------------------------------
Rust changes for v6.19

Toolchain and infrastructure:

 - Add support for 'syn'.

     Syn is a parsing library for parsing a stream of Rust tokens into a
     syntax tree of Rust source code.

     Currently this library is geared toward use in Rust procedural
     macros, but contains some APIs that may be useful more generally.

   'syn' allows us to greatly simplify writing complex macros such as
   'pin-init' (Benno has already prepared the 'syn'-based version). We
   will use it in the 'macros' crate too.

   'syn' is the most downloaded Rust crate (according to crates.io), and
   it is also used by the Rust compiler itself. While the amount of code
   is substantial, there should not be many updates needed for these
   crates, and even if there are, they should not be too big, e.g. +7k
   -3k lines across the 3 crates in the last year.

   'syn' requires two smaller dependencies: 'quote' and 'proc-macro2'.
   I only modified their code to remove a third dependency
   ('unicode-ident') and to add the SPDX identifiers. The code can be
   easily verified to exactly match upstream with the provided scripts.

   They are all licensed under "Apache-2.0 OR MIT", like the other
   vendored 'alloc' crate we had for a while.

   Please see the merge commit with the cover letter for more context.

 - Allow 'unreachable_pub' and 'clippy::disallowed_names' for doctests.

   Examples (i.e. doctests) may want to do things like show public items
   and use names such as 'foo'.

   Nevertheless, we still try to keep examples as close to real code as
   possible (this is part of why running Clippy on doctests is important
   for us, e.g. for safety comments, which userspace Rust does not
   support yet but we are stricter).

'kernel' crate:

 - Replace our custom 'CStr' type with 'core::ffi::CStr'.

   Using the standard library type reduces our custom code footprint,
   and we retain needed custom functionality through an extension trait
   and a new 'fmt!' macro which replaces the previous 'core' import.

   This started in 6.17 and continued in 6.18, and we finally land the
   replacement now. This required quite some stamina from Tamir, who
   split the changes in steps to prepare for the flag day change here.

 - Replace 'kernel::c_str!' with C string literals.

   C string literals were added in Rust 1.77, which produce '&CStr's
   (the 'core' one), so now we can write:

       c"hi"

   instead of:

       c_str!("hi")

 - Add 'num' module for numerical features.

   It includes the 'Integer' trait, implemented for all primitive
   integer types.

   It also includes the 'Bounded' integer wrapping type: an integer
   value that requires only the 'N' less significant bits of the wrapped
   type to be encoded:

       // An unsigned 8-bit integer, of which only the 4 LSBs are used.
       let v = Bounded::<u8, 4>::new::<15>();
       assert_eq!(v.get(), 15);

   'Bounded' is useful to e.g. enforce guarantees when working with
   bitfields that have an arbitrary number of bits.

   Values can be constructed from simple non-constant expressions or,
   for more complex ones, validated at runtime.

   'Bounded' also comes with comparison and arithmetic operations (with
   both their backing type and other 'Bounded's with a compatible
   backing type), casts to change the backing type, extending/shrinking
   and infallible/fallible conversions from/to primitives as applicable.

 - 'rbtree' module: add immutable cursor ('Cursor').

   It enables to use just an immutable tree reference where appropriate.
   The existing fully-featured mutable cursor is renamed to 'CursorMut'.

kallsyms:

 - Fix wrong "big" kernel symbol type read from procfs.

'pin-init' crate:

 - A couple minor fixes (Benno asked me to pick these patches up for
   him this cycle).

Documentation:

 - Quick Start guide: add Debian 13 (Trixie).

   Debian Stable is now able to build Linux, since Debian 13 (released
   2025-08-09) packages Rust 1.85.0, which is recent enough.

   We are planning to propose that the minimum supported Rust version in
   Linux follows Debian Stable releases, with Debian 13 being the first
   one we upgrade to, i.e. Rust 1.85.

MAINTAINERS:

 - Add entry for the new 'num' module.

 - Remove Alex as Rust maintainer: he hasn't had the time to contribute
   for a few years now, so it is a no-op change in practice.

And a few other cleanups and improvements.

----------------------------------------------------------------
Alex Gaynor (1):
      MAINTAINERS: Remove Alex Gaynor as Rust maintainer

Alexandre Courbot (5):
      rust: add num module and Integer trait
      rust: num: add Bounded integer wrapping type
      MAINTAINERS: add entry for the Rust `num` module
      rust: num: bounded: Always inline fits_within and from_expr
      rust: num: bounded: rename `try_into_bitint` to `try_into_bounded`

Benno Lossin (1):
      rust: pin-init: fix broken rust doc link

Brian Harring (1):
      rust: pin-init: fix typo in docs

Miguel Ojeda (25):
      samples: rust: debugfs: use `core::ffi::CStr` method names
      docs: rust: quick-start: add Debian 13 (Trixie)
      rust: allow `unreachable_pub` for doctests
      rust: allow `clippy::disallowed_names` for doctests
      rust: kbuild: introduce `core-flags` and `core-skip_flags`
      rust: kbuild: simplify `--cfg` handling
      rust: kbuild: add proc macro library support
      rust: kbuild: support skipping flags in `rustc_test_library`
      rust: kbuild: support using libraries in `rustc_procmacro`
      rust: proc-macro2: import crate
      rust: proc-macro2: add SPDX License Identifiers
      rust: proc-macro2: remove `unicode_ident` dependency
      rust: proc-macro2: add `README.md`
      rust: proc-macro2: enable support in kbuild
      rust: quote: import crate
      rust: quote: add SPDX License Identifiers
      rust: quote: add `README.md`
      rust: quote: enable support in kbuild
      rust: syn: import crate
      rust: syn: add SPDX License Identifiers
      rust: syn: remove `unicode-ident` dependency
      rust: syn: add `README.md`
      rust: syn: enable support in kbuild
      rust: macros: support `proc-macro2`, `quote` and `syn`
      Merge patch series "`syn` support"

Tamir Duberstein (19):
      samples: rust: platform: remove trailing commas
      rust_binder: remove trailing comma
      rust_binder: use `kernel::fmt`
      rust_binder: use `core::ffi::CStr` method names
      rnull: use `kernel::fmt`
      rust: alloc: use `kernel::fmt`
      rust: debugfs: use `kernel::fmt`
      rust: pci: use `kernel::fmt`
      rust: remove spurious `use core::fmt::Debug`
      rust: opp: use `CStr::as_char_ptr`
      rust: configfs: use `CStr::as_char_ptr`
      rust: regulator: use `CStr::as_char_ptr`
      rust: clk: use `CStr::as_char_ptr`
      rust: support formatting of foreign types
      rust: replace `CStr` with `core::ffi::CStr`
      rust: firmware: replace `kernel::c_str!` with C-Strings
      rust: str: replace `kernel::c_str!` with C-Strings
      rust: macros: replace `kernel::c_str!` with C-Strings
      rust: sync: replace `kernel::c_str!` with C-Strings

Vitaly Wool (1):
      rust: rbtree: add immutable cursor

Zheng Yejian (1):
      kallsyms: Fix wrong "big" kernel symbol type read from procfs

 .gitignore                                         |    1 +
 Documentation/rust/quick-start.rst                 |    4 +-
 MAINTAINERS                                        |    9 +-
 Makefile                                           |    7 +
 drivers/android/binder/error.rs                    |    5 +-
 drivers/android/binder/freeze.rs                   |    4 +-
 drivers/android/binder/process.rs                  |    4 +-
 drivers/android/binder/range_alloc/tree.rs         |    2 +-
 drivers/android/binder/stats.rs                    |    6 +-
 drivers/block/rnull/configfs.rs                    |    9 +-
 kernel/kallsyms.c                                  |    5 +-
 rust/Makefile                                      |  147 +-
 rust/ffi.rs                                        |    2 +
 rust/kernel/alloc/kvec/errors.rs                   |   14 +-
 rust/kernel/clk.rs                                 |    4 +-
 rust/kernel/configfs.rs                            |    2 +-
 rust/kernel/debugfs.rs                             |    2 +-
 rust/kernel/debugfs/callback_adapters.rs           |    7 +-
 rust/kernel/debugfs/entry.rs                       |    2 +-
 rust/kernel/debugfs/file_ops.rs                    |    6 +-
 rust/kernel/debugfs/traits.rs                      |   10 +-
 rust/kernel/device.rs                              |    1 +
 rust/kernel/drm/ioctl.rs                           |    4 +-
 rust/kernel/error.rs                               |    2 +
 rust/kernel/firmware.rs                            |   15 +-
 rust/kernel/fmt.rs                                 |   87 +-
 rust/kernel/init.rs                                |    3 +-
 rust/kernel/lib.rs                                 |    1 +
 rust/kernel/num.rs                                 |   79 +
 rust/kernel/num/bounded.rs                         | 1058 +++++
 rust/kernel/opp.rs                                 |    6 +-
 rust/kernel/pci/id.rs                              |    3 +-
 rust/kernel/prelude.rs                             |    7 +-
 rust/kernel/ptr.rs                                 |    1 -
 rust/kernel/rbtree.rs                              |  244 +-
 rust/kernel/regulator.rs                           |   13 +-
 rust/kernel/seq_file.rs                            |    2 +-
 rust/kernel/str.rs                                 |  454 +--
 rust/kernel/sync.rs                                |    3 +-
 rust/kernel/sync/condvar.rs                        |    2 +-
 rust/kernel/sync/lock.rs                           |    2 +-
 rust/kernel/sync/lock/global.rs                    |    2 +-
 rust/kernel/types.rs                               |    1 -
 rust/macros/fmt.rs                                 |   94 +
 rust/macros/lib.rs                                 |   19 +
 rust/macros/module.rs                              |    2 +-
 rust/macros/quote.rs                               |    7 +
 rust/pin-init/README.md                            |    2 +-
 rust/pin-init/src/macros.rs                        |    2 +
 rust/proc-macro2/README.md                         |   13 +
 rust/proc-macro2/detection.rs                      |   77 +
 rust/proc-macro2/extra.rs                          |  153 +
 rust/proc-macro2/fallback.rs                       | 1258 ++++++
 rust/proc-macro2/lib.rs                            | 1351 +++++++
 rust/proc-macro2/location.rs                       |   31 +
 rust/proc-macro2/marker.rs                         |   19 +
 rust/proc-macro2/parse.rs                          |  997 +++++
 rust/proc-macro2/probe.rs                          |   12 +
 rust/proc-macro2/probe/proc_macro_span.rs          |   53 +
 rust/proc-macro2/probe/proc_macro_span_file.rs     |   16 +
 rust/proc-macro2/probe/proc_macro_span_location.rs |   23 +
 rust/proc-macro2/rcvec.rs                          |  148 +
 rust/proc-macro2/wrapper.rs                        |  986 +++++
 rust/quote/README.md                               |   12 +
 rust/quote/ext.rs                                  |  112 +
 rust/quote/format.rs                               |  170 +
 rust/quote/ident_fragment.rs                       |   90 +
 rust/quote/lib.rs                                  | 1456 +++++++
 rust/quote/runtime.rs                              |  494 +++
 rust/quote/spanned.rs                              |   52 +
 rust/quote/to_tokens.rs                            |  273 ++
 rust/syn/README.md                                 |   13 +
 rust/syn/attr.rs                                   |  838 ++++
 rust/syn/bigint.rs                                 |   68 +
 rust/syn/buffer.rs                                 |  436 ++
 rust/syn/classify.rs                               |  313 ++
 rust/syn/custom_keyword.rs                         |  262 ++
 rust/syn/custom_punctuation.rs                     |  306 ++
 rust/syn/data.rs                                   |  426 ++
 rust/syn/derive.rs                                 |  261 ++
 rust/syn/discouraged.rs                            |  227 ++
 rust/syn/drops.rs                                  |   60 +
 rust/syn/error.rs                                  |  469 +++
 rust/syn/export.rs                                 |   75 +
 rust/syn/expr.rs                                   | 4175 ++++++++++++++++++++
 rust/syn/ext.rs                                    |  138 +
 rust/syn/file.rs                                   |  127 +
 rust/syn/fixup.rs                                  |  775 ++++
 rust/syn/gen/clone.rs                              | 2269 +++++++++++
 rust/syn/gen/debug.rs                              | 3240 +++++++++++++++
 rust/syn/gen/eq.rs                                 | 2308 +++++++++++
 rust/syn/gen/fold.rs                               | 3904 ++++++++++++++++++
 rust/syn/gen/hash.rs                               | 2878 ++++++++++++++
 rust/syn/gen/visit.rs                              | 3943 ++++++++++++++++++
 rust/syn/gen/visit_mut.rs                          | 3761 ++++++++++++++++++
 rust/syn/generics.rs                               | 1479 +++++++
 rust/syn/group.rs                                  |  293 ++
 rust/syn/ident.rs                                  |  110 +
 rust/syn/item.rs                                   | 3492 ++++++++++++++++
 rust/syn/lib.rs                                    | 1013 +++++
 rust/syn/lifetime.rs                               |  158 +
 rust/syn/lit.rs                                    | 1862 +++++++++
 rust/syn/lookahead.rs                              |  334 ++
 rust/syn/mac.rs                                    |  227 ++
 rust/syn/macros.rs                                 |  184 +
 rust/syn/meta.rs                                   |  429 ++
 rust/syn/op.rs                                     |  221 ++
 rust/syn/parse.rs                                  | 1421 +++++++
 rust/syn/parse_macro_input.rs                      |  130 +
 rust/syn/parse_quote.rs                            |  242 ++
 rust/syn/pat.rs                                    |  957 +++++
 rust/syn/path.rs                                   |  968 +++++
 rust/syn/precedence.rs                             |  212 +
 rust/syn/print.rs                                  |   18 +
 rust/syn/punctuated.rs                             | 1157 ++++++
 rust/syn/restriction.rs                            |  180 +
 rust/syn/scan_expr.rs                              |  267 ++
 rust/syn/sealed.rs                                 |    6 +
 rust/syn/span.rs                                   |   65 +
 rust/syn/spanned.rs                                |  120 +
 rust/syn/stmt.rs                                   |  486 +++
 rust/syn/thread.rs                                 |   62 +
 rust/syn/token.rs                                  | 1098 +++++
 rust/syn/tt.rs                                     |  109 +
 rust/syn/ty.rs                                     | 1273 ++++++
 rust/syn/verbatim.rs                               |   35 +
 rust/syn/whitespace.rs                             |   67 +
 samples/rust/rust_debugfs_scoped.rs                |    2 +-
 samples/rust/rust_driver_platform.rs               |    4 +-
 scripts/generate_rust_analyzer.py                  |   25 +-
 scripts/rustdoc_test_gen.rs                        |    1 +
 131 files changed, 59666 insertions(+), 477 deletions(-)
 create mode 100644 rust/kernel/num.rs
 create mode 100644 rust/kernel/num/bounded.rs
 create mode 100644 rust/macros/fmt.rs
 create mode 100644 rust/proc-macro2/README.md
 create mode 100644 rust/proc-macro2/detection.rs
 create mode 100644 rust/proc-macro2/extra.rs
 create mode 100644 rust/proc-macro2/fallback.rs
 create mode 100644 rust/proc-macro2/lib.rs
 create mode 100644 rust/proc-macro2/location.rs
 create mode 100644 rust/proc-macro2/marker.rs
 create mode 100644 rust/proc-macro2/parse.rs
 create mode 100644 rust/proc-macro2/probe.rs
 create mode 100644 rust/proc-macro2/probe/proc_macro_span.rs
 create mode 100644 rust/proc-macro2/probe/proc_macro_span_file.rs
 create mode 100644 rust/proc-macro2/probe/proc_macro_span_location.rs
 create mode 100644 rust/proc-macro2/rcvec.rs
 create mode 100644 rust/proc-macro2/wrapper.rs
 create mode 100644 rust/quote/README.md
 create mode 100644 rust/quote/ext.rs
 create mode 100644 rust/quote/format.rs
 create mode 100644 rust/quote/ident_fragment.rs
 create mode 100644 rust/quote/lib.rs
 create mode 100644 rust/quote/runtime.rs
 create mode 100644 rust/quote/spanned.rs
 create mode 100644 rust/quote/to_tokens.rs
 create mode 100644 rust/syn/README.md
 create mode 100644 rust/syn/attr.rs
 create mode 100644 rust/syn/bigint.rs
 create mode 100644 rust/syn/buffer.rs
 create mode 100644 rust/syn/classify.rs
 create mode 100644 rust/syn/custom_keyword.rs
 create mode 100644 rust/syn/custom_punctuation.rs
 create mode 100644 rust/syn/data.rs
 create mode 100644 rust/syn/derive.rs
 create mode 100644 rust/syn/discouraged.rs
 create mode 100644 rust/syn/drops.rs
 create mode 100644 rust/syn/error.rs
 create mode 100644 rust/syn/export.rs
 create mode 100644 rust/syn/expr.rs
 create mode 100644 rust/syn/ext.rs
 create mode 100644 rust/syn/file.rs
 create mode 100644 rust/syn/fixup.rs
 create mode 100644 rust/syn/gen/clone.rs
 create mode 100644 rust/syn/gen/debug.rs
 create mode 100644 rust/syn/gen/eq.rs
 create mode 100644 rust/syn/gen/fold.rs
 create mode 100644 rust/syn/gen/hash.rs
 create mode 100644 rust/syn/gen/visit.rs
 create mode 100644 rust/syn/gen/visit_mut.rs
 create mode 100644 rust/syn/generics.rs
 create mode 100644 rust/syn/group.rs
 create mode 100644 rust/syn/ident.rs
 create mode 100644 rust/syn/item.rs
 create mode 100644 rust/syn/lib.rs
 create mode 100644 rust/syn/lifetime.rs
 create mode 100644 rust/syn/lit.rs
 create mode 100644 rust/syn/lookahead.rs
 create mode 100644 rust/syn/mac.rs
 create mode 100644 rust/syn/macros.rs
 create mode 100644 rust/syn/meta.rs
 create mode 100644 rust/syn/op.rs
 create mode 100644 rust/syn/parse.rs
 create mode 100644 rust/syn/parse_macro_input.rs
 create mode 100644 rust/syn/parse_quote.rs
 create mode 100644 rust/syn/pat.rs
 create mode 100644 rust/syn/path.rs
 create mode 100644 rust/syn/precedence.rs
 create mode 100644 rust/syn/print.rs
 create mode 100644 rust/syn/punctuated.rs
 create mode 100644 rust/syn/restriction.rs
 create mode 100644 rust/syn/scan_expr.rs
 create mode 100644 rust/syn/sealed.rs
 create mode 100644 rust/syn/span.rs
 create mode 100644 rust/syn/spanned.rs
 create mode 100644 rust/syn/stmt.rs
 create mode 100644 rust/syn/thread.rs
 create mode 100644 rust/syn/token.rs
 create mode 100644 rust/syn/tt.rs
 create mode 100644 rust/syn/ty.rs
 create mode 100644 rust/syn/verbatim.rs
 create mode 100644 rust/syn/whitespace.rs
