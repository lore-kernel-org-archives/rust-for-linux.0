Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F170227AC21;
	Sun,  8 Feb 2026 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770558928; cv=none; b=ui5LkhbVm1kkttjlaChg5qyL/MK1iBmb2mBXruk/8w18/g1fDvEK49DQnYMGqrcc2TE6y9SlzKS/JEyIvI8hfdvxLcbX1X5Z2Wl0xlBFTsPbzPfNGdfjvKXiTwgJeBLmRBXIIj6+b/KFf/8LTsIqxwNHjjF8g8eBZBbvRkqm0WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770558928; c=relaxed/simple;
	bh=AcQVKxoPlra4GUnq3vqILLvkyhDyVhjXdEuUagid4jA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KRGrlX6/u+fScDa29rRN/5hyHI2WaJaAPep5MSaIHk2QQPvEvB67lVY+Zcni4xVNYnn8O3YwP+RhvfrFIvQ+SkpMjPVcAj3SkXXzlFqL+reC++PPq77tz9cKNK7fRLDrkiI4JbAbOOY5NEp9W++DrgEGmvnDk/eEldeCA0Vrkx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QH3ml5CN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QH3ml5CN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C417AC19424;
	Sun,  8 Feb 2026 13:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770558927;
	bh=AcQVKxoPlra4GUnq3vqILLvkyhDyVhjXdEuUagid4jA=;
	h=From:To:Cc:Subject:Date:From;
	b=QH3ml5CNMY/GKM1eRB0uJqHuOk2gbdwuq9ki7WhsP+KIK6eDV0XW9yFrIBJNa8dZU
	 P/uhuqPEnouLkjNB5pXg4wGxOJ+SCmVZ2tQuZdB0aPFz5mAHEqNdOhZ+WHQVwTsvlx
	 wjK6DHtpZ+LguVGOwhfYgubBsXfBp3DfpFzV3H3QQF4Lk+/8JaWPH5yY1eBUXG8TTL
	 cpucLcINjTHl0YVIFN/9TUGxJVA9Jx45rOts2CrlvODASjLufUZtSWVDGl9BSiW9aL
	 5ftoZMCj7/2UWxlPmP8pHrfTsKQyFJ65cIzdGA7RxT8WcAk9AU263FBmb1y/4Kt2QA
	 MSDF2X943dncQ==
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
Subject: [GIT PULL] Rust for v6.20 / v7.0
Date: Sun,  8 Feb 2026 14:54:43 +0100
Message-ID: <20260208135445.64840-1-ojeda@kernel.org>
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

A medium-sized one this time. The major changes are the rewrite of our
procedural macros to use the `syn` parsing library which we introduced
last cycle.

Only a single one-liner conflict expected at this time (please pick the
longer line). The resolutions in linux-next should be fine. I did a test
merge with what you have at the moment.

All commits have been in linux-next for a week or more.

Please pull for v6.20 / v7.0 -- thanks!

Cheers,
Miguel

The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:

  Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.20-7.0

for you to fetch changes up to b8d687c7eeb52d0353ac27c4f71594a2e6aa365f:

  rust: safety: introduce `unsafe_precondition_assert!` macro (2026-02-02 08:10:48 +0100)

----------------------------------------------------------------
Rust changes for v6.20 / v7.0

Toolchain and infrastructure:

 - Add '__rust_helper' annotation to the C helpers.

   This is needed to inline these helpers into Rust code.

 - Remove imports available via the prelude, treewide.

   This was possible thanks to a new lint in Klint that Gary has
   implemented -- more Klint-related changes, including initial upstream
   support, are coming.

 - Deduplicate pin-init flags.

'kernel' crate:

 - Add support for calling a function exactly once with the new
   'do_once_lite!' macro (and 'OnceLite' type).

   Based on this, add 'pr_*_once!' macros to print only once.

 - Add 'impl_flags!' macro for defining common bitflags operations:

       impl_flags!(
           /// Represents multiple permissions.
           #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
           pub struct Permissions(u32);

           /// Represents a single permission.
           #[derive(Debug, Clone, Copy, PartialEq, Eq)]
           pub enum Permission {
               /// Read permission.
               Read = 1 << 0,

               /// Write permission.
               Write = 1 << 1,

               /// Execute permission.
               Execute = 1 << 2,
           }
       );

       let mut f: Permissions = Permission::Read | Permission::Write;
       assert!(f.contains(Permission::Read));
       assert!(!f.contains(Permission::Execute));

       f |= Permission::Execute;
       assert!(f.contains(Permission::Execute));

       let f2: Permissions = Permission::Write | Permission::Execute;
       assert!((f ^ f2).contains(Permission::Read));
       assert!(!(f ^ f2).contains(Permission::Write));

 - 'bug' module: support 'CONFIG_DEBUG_BUGVERBOSE_DETAILED' in the
   'warn_on!' macro in order to show the evaluated condition alongside
   the file path:

        ------------[ cut here ]------------
        WARNING: [val == 1] linux/samples/rust/rust_minimal.rs:27 at ...
        Modules linked in: rust_minimal(+)

 - Add safety module with 'unsafe_precondition_assert!' macro, currently
   a wrapper for 'debug_assert!', intended to mark the validation of
   safety preconditions where possible:

       /// # Safety
       ///
       /// The caller must ensure that `index` is less than `N`.
       unsafe fn set_unchecked(&mut self, index: usize, value: T) {
           unsafe_precondition_assert!(
               index < N,
               "set_unchecked() requires index ({index}) < N ({N})"
           );

           ...
       }

 - Add instructions to 'build_assert!' documentation requesting to
   always inline functions when used with function arguments.

 - 'ptr' module: replace 'build_assert!' with a 'const' one.

 - 'rbtree' module: reduce unsafe blocks on pointer derefs.

 - 'transmute' module: implement 'FromBytes' and 'AsBytes' for
   inhabited ZSTs, and use it in Nova.

 - More treewide replacements of 'c_str!' with C string literals.

'macros' crate:

 - Rewrite most procedural macros ('module!', 'concat_idents!',
   '#[export]', '#[vtable]', '#[kunit_tests]') to use the 'syn' parsing
   library which we introduced last cycle, with better diagnostics.

   This also allows to support '#[cfg]' properly in the '#[vtable]'
   macro, to support arbitrary types in 'module!' macro (not just an
   identifier) and to remove several custom parsing helpers we had.

 - Use 'quote!' from the recently vendored 'quote' library and remove
   our custom one.

   The vendored one also allows us to avoid quoting '"' and '{}' inside
   the template anymore and editors can now highlight it. In addition,
   it improves robustness as it eliminates the need for string quoting
   and escaping.

 - Use 'pin_init::zeroed()' to simplify KUnit code.

'pin-init' crate:

 - Rewrite all procedural macros ('[pin_]init!', '#[pin_data]',
   '#[pinned_drop]', 'derive([Maybe]Zeroable)') to use the 'syn' parsing
   library which we introduced last cycle, with better diagnostics.

 - Implement 'InPlaceWrite' for '&'static mut MaybeUninit<T>'. This
   enables users to use external allocation mechanisms such as
   'static_cell'.

 - Support tuple structs in 'derive([Maybe]Zeroable)'.

 - Support attributes on fields in '[pin_]init!' (such as
   '#[cfg(...)]').

 - Add a '#[default_error(<type>)]' attribute to '[pin_]init!' to
   override the default error (when no '? Error' is specified).

 - Support packed structs in '[pin_]init!' with
   '#[disable_initialized_field_access]'.

 - Remove 'try_[pin_]init!' in favor of merging their feature
   with '[pin_]init!'. Update the kernel's own 'try_[pin_]init!'
   macros to use the 'default_error' attribute.

 - Correct 'T: Sized' bounds to 'T: ?Sized' in the generated
   'PinnedDrop' check by '#[pin_data]'.

Documentation:

 - Conclude the Rust experiment.

MAINTAINERS:

 - Add "RUST [RUST-ANALYZER]" entry for the rust-analyzer support. Tamir
   and Jesung will take care of it. They have both been active around it
   for a while. The new tree will flow through the Rust one.

 - Add Gary as maintainer for "RUST [PIN-INIT]".

 - Update Boqun and Tamir emails to their kernel.org accounts.

And a few other cleanups and improvements.

----------------------------------------------------------------
Alexandre Courbot (4):
      rust: build_assert: add instructions for use with function arguments
      rust: ptr: replace unneeded use of `build_assert`
      rust: transmute: implement FromBytes and AsBytes for inhabited ZSTs
      gpu: nova-core: gsp: use () as message type for GspInitDone message

Alice Ryhl (10):
      rust: xarray: add __rust_helper to helpers
      rust: bug: add __rust_helper to helpers
      rust: err: add __rust_helper to helpers
      rust: maple_tree: add __rust_helper to helpers
      rust: mm: add __rust_helper to helpers
      rust: of: add __rust_helper to helpers
      rust: rbtree: add __rust_helper to helpers
      rust: slab: add __rust_helper to helpers
      rust: uaccess: add __rust_helper to helpers
      rust: workqueue: add __rust_helper to helpers

Benno Lossin (15):
      rust: pin-init: remove `try_` versions of the initializer macros
      rust: pin-init: allow the crate to refer to itself as `pin-init` in doc tests
      rust: pin-init: add `syn` dependency and remove `proc-macro[2]` and `quote` workarounds
      rust: pin-init: internal: add utility API for syn error handling
      rust: pin-init: rewrite `derive(Zeroable)` and `derive(MaybeZeroable)` using `syn`
      rust: pin-init: rewrite the `#[pinned_drop]` attribute macro using `syn`
      rust: pin-init: rewrite `#[pin_data]` using `syn`
      rust: pin-init: add `?Sized` bounds to traits in `#[pin_data]` macro
      rust: pin-init: rewrite the initializer macros using `syn`
      rust: pin-init: add `#[default_error(<type>)]` attribute to initializer macros
      rust: init: use `#[default_error(err)]` for the initializer macros
      rust: pin-init: internal: init: add support for attributes on initializer fields
      rust: pin-init: internal: init: add escape hatch for referencing initialized fields
      rust: pin-init: internal: init: simplify Zeroable safety check
      MAINTAINERS: add Gary Guo to pin-init

Boqun Feng (1):
      MAINTAINERS: Update my email address to @kernel.org

FUJITA Tomonori (3):
      rust: print: Add support for calling a function exactly once
      rust: bug: Support DEBUG_BUGVERBOSE_DETAILED option
      rust: print: Add pr_*_once macros

Filipe Xavier (1):
      rust: add `impl_flags!` macro for defining common bitflag operations

Gary Guo (13):
      samples: rust: remove imports available via prelude
      rust: macros: use `quote!` from vendored crate
      rust: macros: convert `#[vtable]` macro to use `syn`
      rust: macros: use `syn` to parse `module!` macro
      rust: macros: use `quote!` for `module!` macro
      rust: macros: convert `#[export]` to use `syn`
      rust: macros: convert `concat_idents!` to use `syn`
      rust: macros: convert `#[kunit_tests]` macro to use `syn`
      rust: macros: allow arbitrary types to be used in `module!` macro
      rust: macros: rearrange `#[doc(hidden)]` in `module!` macro
      rust: kunit: use `pin_init::zeroed` instead of custom null value
      rust: macros: support `#[cfg]` properly in `#[vtable]` macro.
      gpu: nova-core: remove imports available via prelude

Miguel Ojeda (6):
      rust: conclude the Rust experiment
      MAINTAINERS: add "RUST [RUST-ANALYZER]" entry
      Merge tag 'rust-xarray-for-v6.20-v7.0' of https://github.com/Rust-for-Linux/linux into rust-next
      Merge tag 'pin-init-v7.0' of https://github.com/Rust-for-Linux/linux into rust-next
      Merge patch series "refactor Rust proc macros with `syn`"
      Merge patch series "Add support for print exactly once"

Oleksandr Babak (1):
      rust: pin-init: Implement `InPlaceWrite<T>` for `&'static mut MaybeUninit<T>`

Onur Özkan (1):
      rust: rbtree: reduce unsafe blocks on pointer derefs

Peter Novak (1):
      rust: use consistent backtick formatting for NULL in docs

Ritvik Gupta (1):
      rust: safety: introduce `unsafe_precondition_assert!` macro

Tamir Duberstein (6):
      rust: i2c: replace `kernel::c_str!` with C-Strings
      samples: rust: i2c: replace `kernel::c_str!` with C-Strings
      rust: kunit: replace `kernel::c_str!` with C-Strings
      MAINTAINERS: mailmap: update Tamir Duberstein's email address
      rust: clk: replace `kernel::c_str!` with C-Strings
      rust: kbuild: deduplicate pin-init flags

 .mailmap                                       |    2 +
 Documentation/process/programming-language.rst |    2 +-
 Documentation/rust/index.rst                   |   18 -
 MAINTAINERS                                    |   27 +-
 drivers/gpu/nova-core/firmware/fwsec.rs        |    1 -
 drivers/gpu/nova-core/firmware/gsp.rs          |   12 +-
 drivers/gpu/nova-core/firmware/riscv.rs        |    2 -
 drivers/gpu/nova-core/gsp/commands.rs          |    6 +-
 drivers/gpu/nova-core/gsp/sequencer.rs         |    8 +-
 drivers/gpu/nova-core/sbuffer.rs               |    5 +-
 rust/Makefile                                  |   41 +-
 rust/helpers/bug.c                             |    4 +-
 rust/helpers/build_bug.c                       |    2 +-
 rust/helpers/err.c                             |    6 +-
 rust/helpers/maple_tree.c                      |    3 +-
 rust/helpers/mm.c                              |   20 +-
 rust/helpers/of.c                              |    2 +-
 rust/helpers/page.c                            |    9 +-
 rust/helpers/rbtree.c                          |    9 +-
 rust/helpers/slab.c                            |    4 +-
 rust/helpers/uaccess.c                         |   10 +-
 rust/helpers/vmalloc.c                         |    2 +-
 rust/helpers/workqueue.c                       |    8 +-
 rust/helpers/xarray.c                          |   10 +-
 rust/kernel/bug.rs                             |   20 +-
 rust/kernel/build_assert.rs                    |    7 +-
 rust/kernel/clk.rs                             |    8 +-
 rust/kernel/debugfs/entry.rs                   |    2 +-
 rust/kernel/i2c.rs                             |    8 +-
 rust/kernel/impl_flags.rs                      |  272 ++++
 rust/kernel/init.rs                            |   40 +-
 rust/kernel/kunit.rs                           |   39 +-
 rust/kernel/lib.rs                             |    3 +
 rust/kernel/print.rs                           |  153 +++
 rust/kernel/ptr.rs                             |   12 +-
 rust/kernel/rbtree.rs                          |   27 +-
 rust/kernel/safety.rs                          |   53 +
 rust/kernel/transmute.rs                       |    8 +
 rust/macros/concat_idents.rs                   |   39 +-
 rust/macros/export.rs                          |   26 +-
 rust/macros/fmt.rs                             |    4 +-
 rust/macros/helpers.rs                         |  131 +-
 rust/macros/kunit.rs                           |  279 ++--
 rust/macros/lib.rs                             |   43 +-
 rust/macros/module.rs                          |  907 +++++++------
 rust/macros/paste.rs                           |    2 +-
 rust/macros/quote.rs                           |  182 ---
 rust/macros/vtable.rs                          |  165 +--
 rust/pin-init/README.md                        |    2 +-
 rust/pin-init/examples/linked_list.rs          |   19 +-
 rust/pin-init/examples/pthread_mutex.rs        |   10 +-
 rust/pin-init/internal/src/diagnostics.rs      |   30 +
 rust/pin-init/internal/src/helpers.rs          |  152 ---
 rust/pin-init/internal/src/init.rs             |  548 ++++++++
 rust/pin-init/internal/src/lib.rs              |   48 +-
 rust/pin-init/internal/src/pin_data.rs         |  615 +++++++--
 rust/pin-init/internal/src/pinned_drop.rs      |   88 +-
 rust/pin-init/internal/src/zeroable.rs         |  157 +--
 rust/pin-init/src/lib.rs                       |  200 +--
 rust/pin-init/src/macros.rs                    | 1677 ------------------------
 samples/rust/rust_driver_auxiliary.rs          |    1 -
 samples/rust/rust_driver_i2c.rs                |    7 +-
 samples/rust/rust_i2c_client.rs                |    7 +-
 samples/rust/rust_misc_device.rs               |    2 -
 samples/rust/rust_print_main.rs                |    2 +-
 scripts/generate_rust_analyzer.py              |    2 +-
 scripts/rustdoc_test_gen.rs                    |    4 +-
 67 files changed, 2772 insertions(+), 3442 deletions(-)
 create mode 100644 rust/kernel/impl_flags.rs
 create mode 100644 rust/kernel/safety.rs
 delete mode 100644 rust/macros/quote.rs
 create mode 100644 rust/pin-init/internal/src/diagnostics.rs
 delete mode 100644 rust/pin-init/internal/src/helpers.rs
 create mode 100644 rust/pin-init/internal/src/init.rs
 delete mode 100644 rust/pin-init/src/macros.rs
