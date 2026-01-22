Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59A23A7F57;
	Thu, 22 Jan 2026 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769076634; cv=none; b=nBcsJW8OYj6OhgdY2mqK0qiELTWLZRaHdiim9OBfWUAxz+ckK7N76fVVQF1qT76u7B4Ct3vqAn8BLGmI0saDhlMnm6utKMMY2LWoAYiKJck+yYnbR+8Y+NU13TIE+JKEFHTc+BUoVIEBNJKAFSPb0iwE1tKj9ydOchG99VPwErE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769076634; c=relaxed/simple;
	bh=lT2a/wkzlUt0trRWXele7oGGBck4IQXQ7B2hQtkiG/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HaoK8hWsrbtSKW4t4I0W0fcxiwXmW/GWNaME8FhLgxZnQ/HHp/0Q4kM1QzF5oj2b5XLVTJ5gHe8yadss9u1k8jTqeWS2+CyLBqTXPYOgjIqq/eeRQ7Er7uxwRg9JtyIQwwE6zB9+lYSq2FrHOFnBIzJBznnLczCC5VyXg+taLg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBCYSDZo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBCYSDZo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D72C116C6;
	Thu, 22 Jan 2026 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769076634;
	bh=lT2a/wkzlUt0trRWXele7oGGBck4IQXQ7B2hQtkiG/M=;
	h=From:To:Cc:Subject:Date:From;
	b=IBCYSDZoP/BovEVzfWUuso5EJSjQlQ+j+N4I5C6eht3iIyh8N5ddGnUzGukX7VUwT
	 91CU/yF1u1gEdmwxF0cFe652m1SA2I3oCUPx7PIWFlGpgM2t9dSupTUDCWdEMjz7os
	 7Kb1Q+MVs47VLt4Vl4rSSQAeJwk2pbUBsSm+8Srn9fiPXmfitHbViCnzLvrNwCPaKE
	 ygGfw5Bd065MQ9WO8+b9JXCr3rrCAlH01CMCp8+yTLcSjtG0Df6LD7qTWjmRbbF9M6
	 7kpQBymLp5DhLEY1PyEystuIuWCQlNZ2SJF1HF6QyduonDOplwj23m4qB531s9vVGI
	 bbgvZTHGySr5w==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Alban Kurti <kurti@invicto.ai>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [GIT PULL] Rust pin-init for v7.0
Date: Thu, 22 Jan 2026 11:10:27 +0100
Message-ID: <20260122101027.1427972-1-lossin@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miguel,

Lot's of changes in this one, mainly the `syn` rewrite, but also some
smaller changes such as removing the `try_` versions of the macros in
pin-init (the kernel still declares its own).

All commits have been in linux-next since Monday.

The first commit in my tree is also in the `syn` patch series from Gary
[1], to avoid problems it should be merged after this tag. There also is
a "phantom conflict" with 74e15ac34b098 ("scripts:
generate_rust_analyzer: Add pin_init_internal deps") in rust-fixes,
which you already saw in linux-next [2]. Otherwise no conflicts
expected.

Please pull for v7.0 -- thanks!

Cheers,
Benno

[1]: https://lore.kernel.org/all/20260112170919.1888584-1-gary@kernel.org
[2]: https://lore.kernel.org/all/aW5GPwfJPrQjm-wC@sirena.org.uk

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/pin-init-v7.0

for you to fetch changes up to aeb5ecad5316f6af160993915163367290825b6b:

  rust: pin-init: Implement `InPlaceWrite<T>` for `&'static mut MaybeUninit<T>` (2026-01-17 10:53:28 +0100)

----------------------------------------------------------------
pin-init changes for v7.0

Added:

- '&'static mut MaybeUninit<T>' now implements 'InPlaceWrite'. This
  enables users to use external allocation mechanisms such as
  'static_cell'.

- Gary Guo as a Maintainer.

Changed:

- Rewrote all proc-macros ('[pin_]init!', '#[pin_data]',
  '#[pinned_drop]', 'derive([Maybe]Zeroable)'),  using 'syn' with better
  diagnostics.

- 'derive([Maybe]Zeroable)' now support tuple structs.

- '[pin_]init!' now supports attributes on fields (such as
  '#[cfg(...)]').

- Add a '#[default_error(<type>)]' attribute to '[pin_]init!' to
  override the default error (when no '? Error' is specified).

- Support packed struct in '[pin_]init!' with
  '#[disable_initialized_field_access]'.

Removed:

- 'try_[pin_]init!' have been removed in favor of merging their feature
  with '[pin_]init!'. The kernel's own 'try_[pin_]init!' macros have
  been updated to use the 'default_error' attribute.

Fixed:

- Corrected 'T: Sized' bounds to 'T: ?Sized' in the generated
  'PinnedDrop' check by '#[pin_data]'.

----------------------------------------------------------------
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

Oleksandr Babak (1):
      rust: pin-init: Implement `InPlaceWrite<T>` for `&'static mut MaybeUninit<T>`

 MAINTAINERS                               |    1 +
 rust/Makefile                             |   16 +-
 rust/kernel/init.rs                       |   40 +-
 rust/pin-init/README.md                   |    2 +-
 rust/pin-init/examples/linked_list.rs     |   19 +-
 rust/pin-init/examples/pthread_mutex.rs   |   10 +-
 rust/pin-init/internal/src/diagnostics.rs |   30 +
 rust/pin-init/internal/src/helpers.rs     |  152 ---
 rust/pin-init/internal/src/init.rs        |  548 ++++++++++
 rust/pin-init/internal/src/lib.rs         |   48 +-
 rust/pin-init/internal/src/pin_data.rs    |  615 +++++++++--
 rust/pin-init/internal/src/pinned_drop.rs |   88 +-
 rust/pin-init/internal/src/zeroable.rs    |  157 ++-
 rust/pin-init/src/lib.rs                  |  200 +---
 rust/pin-init/src/macros.rs               | 1677 -----------------------------
 scripts/generate_rust_analyzer.py         |    2 +-
 16 files changed, 1305 insertions(+), 2300 deletions(-)
 create mode 100644 rust/pin-init/internal/src/diagnostics.rs
 delete mode 100644 rust/pin-init/internal/src/helpers.rs
 create mode 100644 rust/pin-init/internal/src/init.rs
 delete mode 100644 rust/pin-init/src/macros.rs
