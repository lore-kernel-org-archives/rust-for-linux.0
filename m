Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BA52DE718
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768237816; cv=none; b=fJybf5a3BTMRPSMfX9y8pH6ogdMVvufonXWLKcht4YGpqkBBtc5DFesWXfv7NRWlURPW88pGtqFAfW9zEfN62NGBCJlVLM0Vup/tfdYkEw7Ze3WIKjpGCZV6MICV+61dY148NjMpURVDxY9XossncF9nOKpKNnhfL64Zr6NdvAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768237816; c=relaxed/simple;
	bh=9jfODIflsyphgju+pZreLOohPvlC35Yb0w7fSEp51aA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uzHa7pICRNU+z/fyxe47f7O8SNTeaPhPNCsS8aAVygWqaVBAwXP7cJtEA8cglA5UyGCDvB2xm6KAJ4Jg0Du1MsQ3ni2G2589f4KmDaEm59FDUdWk49pNIh3AQhrjPqKUXiwlVa/bGwh3A9lfQuy5i/LKn4XziKRqHPLZGR0yqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjCUXJK0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjCUXJK0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23986C116D0;
	Mon, 12 Jan 2026 17:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768237816;
	bh=9jfODIflsyphgju+pZreLOohPvlC35Yb0w7fSEp51aA=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=DjCUXJK0pVE06XXMr4AaroaZRcsnOKNwmVHFO7BR7woaH8+t3jixOmpv/xsotC2kd
	 msiXKyhA8+ZWVTI1SVFBHa0aigdhAM++CVBjyk6VYQNdUCMjO/fFNd1hcxfrIeRikQ
	 0Ci3RV2BFQ3U2lUcL+w3Ch5EQaxDEd3A/56pJhxaPellwwUdcz1xl8iB5CNMuhr5sf
	 SudcBugN3sVeqIKb/LR83B2rJeYudDqbHKegC7AU108x1KElBQI8FU9RL6CAoy6bIC
	 v6NVuhJ7Ay5r8v0g746VGgpFpLsw1+KxYGMwDhVpyJQdAGEnXk5WElxcaj11RSnybw
	 6Jz1egfOHM5+w==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH v3 00/12] refactor Rust proc macros with `syn`
Date: Mon, 12 Jan 2026 17:07:11 +0000
Message-ID: <20260112170919.1888584-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

This series convert Rust proc macros that we have with `syn`, and replace the
custom `quote!` macro that we have with the vendored `quote!` macro. The
`pin-init` macros are not converted `syn` yet; Benno has a work in progress in
converting them. They're however converted to use `quote` and `proc-macro2`
crate so our custom `quote!` macro can be removed.

Overall this improves the robustness of the macros as we have precise parsing of
the AST rather than relying on heuristics to extract needed information from
there. This is also a quality-of-life improvement to those using language
servers (e.g. Rust analyzer) as the span information of the proc macros are now
preserved which allows the "jump-to-definition" feature to work, even when used
on completely custom macros such as `module!`.

Miguel gave a very good explaination on why `syn` is a good idea in the patch
series that introduced it [1], which I shall not repeat here.

Link: https://lore.kernel.org/rust-for-linux/20251124151837.2184382-1-ojeda@kernel.org/ [1]

Changes since v2:
- Changes are limited to `#[vtable]` and `module!` macros.
- `#[vtable]` macro is reworked per Tamir's suggestion. This makes it easy
  to support `#[cfg]` properly, and hence a new patch is added to do that.
- Avoided variable renames related to `param_name`/`param_type` between
  patches in `module!` macro
- `CString` is now interpolated directly without adding extra
  `Literal::c_string`.
- Fixed an typo that affects only `CONFIG_HAVE_ARCH_PREL32_RELOCATIONS`
  builds.
- Link to v2: https://lore.kernel.org/rust-for-linux/20260107161729.3855851-1-gary@kernel.org/

Changes since v1:
- Fixed clippy warnings when moving from `proc-macro` to `proc-macro2`
  (extra trait impl in `proc-macro2` causes some `.to_string()` to be
  unnecessary).
- A Makefile change to pin-init-internal that is mistakenly included in
  patch 5/11 is moved to the correct patch 1/11.
- `module!` parsing has been completely reworked to support `imports_ns`
  and `params`. As there're two structs that need to parse ordered fields
  (`ModuleInfo` and `Parameter`), a `parse_ordered_field` macro is added
  and it is used to implement the parsing instead of `ModInfoField` and
  custom keywords.
- Link to v1: https://lore.kernel.org/rust-for-linux/20251211185805.2835633-1-gary@kernel.org/

Benno Lossin (1):
  rust: pin-init: internal: remove proc-macro[2] and quote workarounds

Gary Guo (11):
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

 rust/Makefile                             |  16 +-
 rust/kernel/kunit.rs                      |  26 +-
 rust/macros/concat_idents.rs              |  39 +-
 rust/macros/export.rs                     |  26 +-
 rust/macros/fmt.rs                        |   4 +-
 rust/macros/helpers.rs                    | 130 +---
 rust/macros/kunit.rs                      | 275 +++----
 rust/macros/lib.rs                        |  41 +-
 rust/macros/module.rs                     | 907 ++++++++++++----------
 rust/macros/paste.rs                      |   2 +-
 rust/macros/quote.rs                      | 182 -----
 rust/macros/vtable.rs                     | 165 ++--
 rust/pin-init/internal/src/helpers.rs     |   7 +-
 rust/pin-init/internal/src/lib.rs         |  16 -
 rust/pin-init/internal/src/pin_data.rs    |  18 +-
 rust/pin-init/internal/src/pinned_drop.rs |  10 +-
 rust/pin-init/internal/src/zeroable.rs    |   6 +-
 scripts/generate_rust_analyzer.py         |   2 +-
 18 files changed, 842 insertions(+), 1030 deletions(-)
 delete mode 100644 rust/macros/quote.rs


base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
-- 
2.51.2

