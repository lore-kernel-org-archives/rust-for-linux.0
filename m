Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184C144E049;
	Thu,  8 Jan 2026 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880346; cv=none; b=ohZ2XCJJp2WJoYOcHXj0swsMPhOVrxSLT3QxMbzcG1lvGWcCJ8cO5PVs0Cz1P0NDe3Euj/g3B6PWfhg5qdsjWJd1JcV5PQZNnDppXN5X7N0wY8YQ5TtQDp04ZicaVPjsa0EwUsJcjkE97iqtY5XbOFUSWs0D5WVFDrXECr0s67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880346; c=relaxed/simple;
	bh=NKgWPfcWdDDhxyiKeZOwCXEW3GHMdtEWzpAuz7IKCHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXWDSKjUPapCzmZ6WP4enLKIF7dBsOO2GZ6biMX826lqgqNZS2265FCfP1MDaVVBV3ZRXDfJpb1iSfxQ8Plk0AMmhsfGma5UWg6iVXXGXw/MuZ2I7jy6GYlEeEbu0ab2ZVxoSNAFWL7raC1zo//x9GuHv0XeC8l8D+RK+J9GNTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXtGZv3O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXtGZv3O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3575EC116C6;
	Thu,  8 Jan 2026 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767880345;
	bh=NKgWPfcWdDDhxyiKeZOwCXEW3GHMdtEWzpAuz7IKCHQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mXtGZv3OcVRq+fKVlAiuIahZTppoYDgQ7fpcF41px1itAmXdfignF/JSbHNvq8tVc
	 E6VyKQfz0Z13tN75D1YjkeQHsxW5oSkFpnp3fDaSeCA/VPiaweq2gyg14YIqLfLZa2
	 Fys/i08dOgAgfddaEmwLPlJSqqmCzoqvBZHcytMIgUy08Txl6Ydc6xJSzFkixbrcmX
	 xuwTB6MZaMD3iP5jB120AzWq6VSfEmGG0Zppo1v9iLED3J3y2ZcdMZ6R/a163pk26n
	 Ubb5v4lLOV2lGQ9kJp7+4wUWWwTCsNu8CwGG7CJm53MUtFV33dp0J9eg7FCF7qGSpj
	 9QT6J29hH5uJg==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 00/13] `syn` rewrite of pin-init
Date: Thu,  8 Jan 2026 14:50:38 +0100
Message-ID: <20260108135127.3153925-1-lossin@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rewrite the proc-macros of pin-init by using the `syn` crate for Rust
syntax parsing. This series has been a long way coming. At the very
start of pin-init, I initially implemented everything using syn, since
parsing is so much easier with it. Now after several years it is finally
time to remove the dreaded 1600 lines of declarative macros required to
parse and expand the initializer syntax.

The move to syn is not only a blessing for the maintenance work, but
also improves the implementation of new features. This series includes
many such improvements.

* Patch 1, 2 and 3 prepare for the rewrite. The first removes the
  superfluous `try_` variants of the initializer macros from pin-init.
  Note that the kernel defines its own, so no code changes in the kernel
  are required. The second patch allows using `::pin_init` in the
  pin-init crate. The third adds the syn dependency and cleans up some
  old workarounds and new clippy warnings.
* Patch 4, 5, 6, and 8 rewrite the derive macros for Zeroable,
  `#[pinned_drop]` attribute macro, `#[pin_data]` attribute macro, and
  the initializer macros respectively using `syn`.
* Patch 7 ensures soundness in the future by fixing generic bounds in
  generated code by `#[pin_data]`.
* Patch 9 adds the `#[default_error(type)]` attribute to initializer
  macros allowing them to specify a default error that is used when no
  error is manually specified.
* Patch 10 uses `#[default_error(type)]` in the definition of the
  kernel's `try_` variants of the initializer macros (which defaults to
  the kernel's `Error` type).
* Patch 11 allows putting attributes on fields in initializer macros
  (for example `cfg` attributes).
* Patch 12 adds `#[disable_initialized_field_access]` to support packed
  structs.
* Patch 13 adds Gary as a maintainer.

In addition to the new features, using syn results in much cleaner error
messages and more accurate span information. The code is much easier to
read as well and hopefully easier to understand as well.

As always, tests that ensure the correctness of the macro output are
included and updated in the upstream pin-init repository. Take a look at
the pull request on GitHub for the diff in the test output:

    https://github.com/Rust-for-Linux/pin-init/pull/89

I would greatly appreciate Tested-by's from people actively using
pin-init weather in the kernel or outside.

Cheers,
Benno

Benno Lossin (13):
  rust: pin-init: remove `try_` versions of the initializer macros
  rust: pin-init: allow the crate to refer to itself as `pin-init` in
    doc tests
  rust: pin-init: add `syn` dependency and remove `proc-macro[2]` and
    `quote` workarounds
  rust: pin-init: rewrite `derive(Zeroable)` and `derive(MaybeZeroable)`
    using `syn`
  rust: pin-init: rewrite the `#[pinned_drop]` attribute macro using
    `syn`
  rust: pin-init: rewrite `#[pin_data]` using `syn`
  rust: pin-init: add `?Sized` bounds to traits in `#[pin_data]` macro
  rust: pin-init: rewrite the initializer macros using `syn`
  rust: pin-init: add `#[default_error(<type>)]` attribute to
    initializer macros
  rust: init: use `#[default_error(err)]` for the initializer macros
  rust: pin-init: internal: init: add support for attributes on
    initializer fields
  rust: pin-init: internal: init: add escape hatch for referencing
    initialized fields
  MAINTAINERS: add Gary Guo to pin-init

 MAINTAINERS                               |    1 +
 rust/Makefile                             |   16 +-
 rust/kernel/init.rs                       |   40 +-
 rust/pin-init/README.md                   |    2 +-
 rust/pin-init/examples/linked_list.rs     |   19 +-
 rust/pin-init/examples/pthread_mutex.rs   |   10 +-
 rust/pin-init/internal/src/helpers.rs     |  152 --
 rust/pin-init/internal/src/init.rs        |  547 +++++++
 rust/pin-init/internal/src/lib.rs         |   60 +-
 rust/pin-init/internal/src/pin_data.rs    |  649 ++++++--
 rust/pin-init/internal/src/pinned_drop.rs |   89 +-
 rust/pin-init/internal/src/zeroable.rs    |  151 +-
 rust/pin-init/src/lib.rs                  |  173 +--
 rust/pin-init/src/macros.rs               | 1677 ---------------------
 scripts/generate_rust_analyzer.py         |    2 +-
 15 files changed, 1286 insertions(+), 2302 deletions(-)
 delete mode 100644 rust/pin-init/internal/src/helpers.rs
 create mode 100644 rust/pin-init/internal/src/init.rs
 delete mode 100644 rust/pin-init/src/macros.rs


base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
-- 
2.51.2

