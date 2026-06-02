Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DA7371CE2
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 16:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780418414; cv=none; b=JSpPVAl2PWUJ/xbokIkVZlyT9c9C3CaURqxSTGewsOQMHt+aWikeUjz/iQ2OlqP52Hl2kV18xDH86cJ8xKhh3llwK+GGQjQTozy0qsjGMaAdp0+ONjBEVAwg4828Bt42nsVkixhLR7vrB20CegwDDq2qPBXnN1IeVcwaw69mWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780418414; c=relaxed/simple;
	bh=UcC92rOVY8sXC99QJ0UWXjuHtWzbzFRvvhWQA/3IFjk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDNCHMMu+bNL8eq5xdron1C4Eqh56hsNGlxqxEkprrKiTbxfKjEgRdcVXpkvkQYw2AUMVVH1p9L5WxHwPrPgmFAd0sC+KFKv440V1I8tpjg7F5+zN47Dd7BdWU2k0VcjgudWPPiLkyfFNICwt5gr+8ceV1f0/zUjXNtMQUl3hAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQGQuu3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQGQuu3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF12D1F00898;
	Tue,  2 Jun 2026 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780418412;
	bh=hrz8jo3q1RJAhlZX9ihfYsYh8nGiQRGdQjVcwGgPm3U=;
	h=From:To:Cc:Subject:Date;
	b=KQGQuu3tzwuBPp9M7oFZYzGtesg71FS2wWDONi6qKfGmQZiX+J43kCAyv+6qvvo+e
	 bLeCu3jK2P9OTMQ1hyWZ85iy7G8vVfPk6GbarMoFqYT9UTYO50lKejVbjhoErymFXZ
	 S3NaVBYgUEOT0u+2opkkxSWN1vmimgdNG1YMSBaYWYe0HcmoWmypwMXY4Fk+pajG1L
	 Ptc5YmTVeRVhMl2Rp++af0jEflGouzKeDOpZCwAo3ashKYfPqlK3Uzf4v7Hd7LOvhG
	 bbUzHWc4ICtW4U3psZn2T6XInylzh+UXRQcC2yTghKE+BZvbuJoLkvpUePKry38yVj
	 sGBqIINrHlAtw==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Subject: [GIT PULL] pin-init changes for v7.2-rc1
Date: Tue,  2 Jun 2026 17:39:48 +0100
Message-ID: <20260602163949.2215642-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miguel,

There is more developments this cycle than the last one, with a mix of
improvements and cleanups. No breaking changes to users expected.

Tuple structs did not make it this cycle, I hope it'll finally land the next
one. I have also been working on getting pin-init to support self-referential
types, which I plan to send next cycle (although unsure it can land in the next
one).

The refactoring commits have been in linux-next for a while. There a few
patches taken later in the cycle, and they have all been in linux-next since
2026-06-01. Feel free to wait for a few more rounds before pulling if you see
fit.

Best,
Gary

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/pin-init-v7.2

for you to fetch changes up to d2f309227952e73966682f348161094e40eb6440:

  rust: pin_init: internal: use `loop {}` to produce never value (2026-05-29 21:58:36 +0100)

----------------------------------------------------------------
pin-init changes for v7.2

User visible changes:

- `non_snake_case` warnings will no longer be generated for identifiers that
  are syntactically just users of a field name. This would allow all
  `#[allow(non_snake_case)]` in nova-core to be removed, which I will send to
  nova tree next cycle.

- Non-cfg attributes are now properly filtered out in derived structs. This
  improves pin-init compatibility with other derive macros.

- Projection types have their where clause properly inserted now.

Other changes:

- MSRV is bumped to 1.82 and associated cleanups.

- There is an overhaul on how init slots are projected. The new approach is
  easier to justify with safety comments.

- More functions are marked as inline, which should help mitigate super-long
  symbol name issue due to lack of inlining.

- Various small code quality cleanups.

----------------------------------------------------------------
Alistair Francis (1):
      rust: pin-init: examples: mark as `#[inline]` all `From::from()`s for `Error`

Benno Lossin (1):
      rust: pin-init: internal: adjust license identifier of `zeroable.rs`

Gary Guo (17):
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
      rust: pin-init: move `InitClosure` out from `__internal`
      rust: pin-init: remove `E` from `InitClosure`
      rust: pin_init: internal: use `loop {}` to produce never value

Martin Kletzander (1):
      rust: pin-init: internal: pin_data: filter non-`#[cfg]` attr in generated code

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

 rust/pin-init/README.md                       |   2 +-
 rust/pin-init/examples/big_struct_in_place.rs |   3 -
 rust/pin-init/examples/error.rs               |   2 +
 rust/pin-init/examples/linked_list.rs         |   2 -
 rust/pin-init/examples/mutex.rs               |   4 +-
 rust/pin-init/examples/pthread_mutex.rs       |   4 +-
 rust/pin-init/examples/static_init.rs         |   4 +-
 rust/pin-init/internal/src/diagnostics.rs     |  14 ++
 rust/pin-init/internal/src/init.rs            | 169 +++++++---------
 rust/pin-init/internal/src/lib.rs             |   1 -
 rust/pin-init/internal/src/pin_data.rs        | 268 ++++++++++++--------------
 rust/pin-init/internal/src/zeroable.rs        |   2 +-
 rust/pin-init/src/__internal.rs               | 231 +++++++++++++++-------
 rust/pin-init/src/lib.rs                      | 137 +++++++------
 14 files changed, 439 insertions(+), 404 deletions(-)
