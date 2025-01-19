Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3B11DF975;
	Sun, 19 Jan 2025 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737326663; cv=none; b=Arj0ezi3ftBntf/kbt93ZOU4gQlNwrW4IKwtqH6v15zpPCOMXdFrW+oSJKarnwd0VOKjGIOs1w1y/sJMi5rfsYaGc+afqmh/c5QEZFjkmPfxvr9WPE/Fw0GyIe0+xVh4VDisTRVNXJCkwQOMLZgCP7yqwpV7fNn3T7g6CqGqX8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737326663; c=relaxed/simple;
	bh=4AtgsLLLeos4Owt8Nas6UrxZj+956TsBNVpC8cRn1ts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lncYGuP2mn0KwlOZP/zh9aYFiIKv9eT9wcuJ2ioHChCeJDyZL1lMfMwbtkvvYNfP9HKL7Xw8/LFMnQZV2k61m2Yz0x0VYt6kE1y/u7rGE4+ezKtoFLife+BBu85frYLb4VElDwpzHU2wWbcgCnINFQrBUbRv+le8nrdyIlQhPuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkX5mdIK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkX5mdIK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6863C4CED6;
	Sun, 19 Jan 2025 22:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737326662;
	bh=4AtgsLLLeos4Owt8Nas6UrxZj+956TsBNVpC8cRn1ts=;
	h=From:To:Cc:Subject:Date:From;
	b=QkX5mdIKv33hSNHCQH60L//RF6f+yueKvTHHDMuHgPa4KPUW0oSt5LmkIgTesHTAO
	 WEVcD5M84kiYcssS1SBTQPMCRjHBmziVXrJW97XZc3kSqA9gl3v0+WmS91ntcu+YgY
	 e7FdkWqXMvdc9pHABBiw9VjYDZnrs94FOOxRUv6E3QI6mRlmsF5YZYnmTCOVy8jWT4
	 8uBaivXgmKSu8mvyHBHZ8IIJPNl9PNKMEQWySlru46euPpCi0fWEKUkXExttkG8Hs1
	 hyM4ORSw5OQvtQWTmby2w8RIFad2cT7vh7sXaKGfLlHTmJOMrhYFKrl2T5MvU97jyZ
	 PuvjVSIq+2A6g==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust for 6.14
Date: Sun, 19 Jan 2025 23:43:52 +0100
Message-ID: <20250119224352.365202-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

This is the next round of the Rust support.

I pushed the branch and tag to git.kernel.org this time around as you
asked, but it is also still in GitHub too (like in previous occasions).
I may create a "group" repository in the future.

All commits have been in linux-next for a few rounds.

You may get major Rust changes via a driver-core PR and a Kbuild PR, as
well as smaller ones in a locking PR via tip, a lsm PR and a netdev-next
PR. You already got the blocks PR which contains a small Rust change as
well.

Conflicts expected with both the driver-core and security one. The
conflicts aren't too bad -- the resolutions in -next are fine.

Please pull for v6.14 -- thanks!

Cheers,
Miguel

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.14

for you to fetch changes up to ceff0757f5dafb5be5205988171809c877b1d3e3:

  kbuild: rust: add PROCMACROLDFLAGS (2025-01-15 09:53:54 +0100)

----------------------------------------------------------------
Rust changes for v6.14

Toolchain and infrastructure:

 - Finish the move to custom FFI integer types started in the previous
   cycle and finally map 'long' to 'isize' and 'char' to 'u8'. Do a few
   cleanups on top thanks to that.

 - Start to use 'derive(CoercePointee)' on Rust >= 1.84.0.

   This is a major milestone on the path to build the kernel using only
   stable Rust features. In particular, previously we were using the
   unstable features 'coerce_unsized', 'dispatch_from_dyn' and 'unsize',
   and now we will use the new 'derive_coerce_pointee' one, which is on
   track to stabilization. This new feature is a macro that essentially
   expands into code that internally uses the unstable features that we
   were using before, without having to expose those.

   With it, stable Rust users, including the kernel, will be able to
   build custom smart pointers that work with trait objects, e.g.:

       fn f(p: &Arc<dyn Display>) {
           pr_info!("{p}\n");
       }

       let a: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;
       let b: Arc<dyn Display> = Arc::new("hello there", GFP_KERNEL)?;

       f(&a); // Prints "42".
       f(&b); // Prints "hello there".

   Together with the 'arbitrary_self_types' feature that we started
   using in the previous cycle, using our custom smart pointers like
   'Arc' will eventually only rely in stable Rust.

 - Introduce 'PROCMACROLDFLAGS' environment variable to allow to link
   Rust proc macros using different flags than those used for linking
   Rust host programs (e.g. when 'rustc' uses a different C library
   than the host programs' one), which Android needs.

 - Help kernel builds under macOS with Rust enabled by accomodating
   other naming conventions for dynamic libraries (i.e. '.so' vs.
   '.dylib') which are used for Rust procedural macros. The actual
   support for macOS (i.e. the rest of the pieces needed) is provided
   out-of-tree by others, following the policy used for other parts of
   the kernel by Kbuild.

 - Run Clippy for 'rusttest' code too and clean the bits it spotted.

 - Provide Clippy with the minimum supported Rust version to improve
   the suggestions it gives.

 - Document 'bindgen' 0.71.0 regression.

'kernel' crate:

 - 'build_error!': move users of the hidden function to the documented
   macro, prevent such uses in the future by moving the function
   elsewhere and add the macro to the prelude.

 - 'types' module: add improved version of 'ForeignOwnable::borrow_mut'
   (which was removed in the past since it was problematic); change
   'ForeignOwnable' pointer type to '*mut'.

 - 'alloc' module: implement 'Display' for 'Box' and align the 'Debug'
   implementation to it; add example (doctest) for 'ArrayLayout::new()'.

 - 'sync' module: document 'PhantomData' in 'Arc'; use
   'NonNull::new_unchecked' in 'ForeignOwnable for Arc' impl.

 - 'uaccess' module: accept 'Vec's with different allocators in
   'UserSliceReader::read_all'.

 - 'workqueue' module: enable run-testing a couple more doctests.

 - 'error' module: simplify 'from_errno()'.

 - 'block' module: fix formatting in code documentation (a lint to catch
   these is being implemented).

 - Avoid 'unwrap()'s in doctests, which also improves the examples by
   showing how kernel code is supposed to be written.

 - Avoid 'as' casts with 'cast{,_mut}' calls which are a bit safer.

And a few other cleanups.

----------------------------------------------------------------
Alice Ryhl (1):
      rust: kernel: add improved version of `ForeignOwnable::borrow_mut`

Daniel Sedlak (5):
      rust: error: modify `from_errno` to use `try_from_errno`
      rust: init: replace unwraps with question mark operators
      rust: rbtree: remove unwrap in asserts
      rust: page: remove unnecessary helper function from doctest
      rust: str: replace unwraps with question mark operators

Dirk Behme (1):
      rust: workqueue: Enable execution of doctests

Filipe Xavier (1):
      rust: uaccess: generalize userSliceReader to support any Vec

Gary Guo (2):
      rust: map `long` to `isize` and `char` to `u8`
      rust: cleanup unnecessary casts

Guangbo Cui (2):
      rust: alloc: implement Display for Box
      rust: alloc: align Debug implementation for Box with Display

HONG Yifan (1):
      kbuild: rust: add PROCMACROLDFLAGS

Jimmy Ostler (3):
      rust: error: import `kernel`'s `LayoutError` instead of `core`'s
      rust: init: update `stack_try_pin_init` examples
      rust: alloc: add doctest for `ArrayLayout::new()`

Miguel Ojeda (7):
      rust: finish using custom FFI integer types
      rust: document `bindgen` 0.71.0 regression
      rust: give Clippy the minimum supported Rust version
      rust: kbuild: run Clippy for `rusttest` code
      rust: use the `build_error!` macro, not the hidden function
      rust: kernel: move `build_error` hidden function to prevent mistakes
      rust: add `build_error!` to the prelude

Tamir Duberstein (7):
      rust: sync: document `PhantomData` in `Arc`
      rust: use host dylib naming convention to support macOS
      rust: arc: use `NonNull::new_unchecked`
      rust: types: avoid `as` casts
      rust: arc: split unsafe block, add missing comment
      rust: kernel: change `ForeignOwnable` pointer to mut
      rust: kernel: reorder `ForeignOwnable` items

Xiangfei Ding (1):
      rust: use derive(CoercePointee) on rustc >= 1.84.0

Yutaro Ohno (1):
      rust: block: fix formatting in GenDisk doc

 .clippy.toml                       |  2 +
 .gitignore                         |  1 +
 Documentation/kbuild/kbuild.rst    | 11 +++++
 Makefile                           |  5 +-
 drivers/gpu/drm/drm_panic_qr.rs    |  2 +-
 init/Kconfig                       |  9 +++-
 rust/Makefile                      | 32 +++++++------
 rust/ffi.rs                        | 37 ++++++++++++++-
 rust/kernel/alloc.rs               |  2 +-
 rust/kernel/alloc/kbox.rs          | 53 +++++++++++++++++-----
 rust/kernel/alloc/layout.rs        | 19 ++++++++
 rust/kernel/block/mq/gen_disk.rs   |  6 +--
 rust/kernel/block/mq/operations.rs |  3 +-
 rust/kernel/build_assert.rs        | 12 +++--
 rust/kernel/device.rs              |  4 +-
 rust/kernel/error.rs               | 23 ++++------
 rust/kernel/firmware.rs            |  2 +-
 rust/kernel/init.rs                | 30 +++++++++---
 rust/kernel/lib.rs                 | 13 +++---
 rust/kernel/list/arc.rs            |  9 ++--
 rust/kernel/miscdevice.rs          | 18 +++-----
 rust/kernel/net/phy.rs             | 18 ++++----
 rust/kernel/page.rs                |  6 +--
 rust/kernel/prelude.rs             |  2 +-
 rust/kernel/print.rs               |  4 +-
 rust/kernel/rbtree.rs              | 46 +++++++++----------
 rust/kernel/security.rs            |  2 +-
 rust/kernel/seq_file.rs            |  2 +-
 rust/kernel/str.rs                 | 38 ++++++++++------
 rust/kernel/sync/arc.rs            | 65 +++++++++++++++++++-------
 rust/kernel/types.rs               | 93 ++++++++++++++++++++++++++++----------
 rust/kernel/uaccess.rs             | 33 ++++----------
 rust/kernel/workqueue.rs           |  3 ++
 rust/macros/lib.rs                 |  8 ++--
 samples/rust/rust_print_main.rs    | 20 +++++++-
 scripts/generate_rust_analyzer.py  | 15 ++++--
 scripts/rust_is_available.sh       |  6 ++-
 37 files changed, 437 insertions(+), 217 deletions(-)
