Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4AF4908A9;
	Sat, 25 Jul 2026 16:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784998440; cv=none; b=Ogx8eSlmCOLgfvmyJUbyAJ64gJ+i0lY9SM2KPx3QxP12toanB1Wh7f4Yu2uMpgtXGxAFI604qIOzO+fqMchlXsZxJjtyTsc7C/KHDJRi0xWqYvhsutSC/IFFYDTzABGvrYFmRKha+Y93K3pzDLSAY0jiNUlFWmc6ZXaA2U/u//g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784998440; c=relaxed/simple;
	bh=rBsMR70hceQfsKfQTp+lZd8nsTWC6aUj6e5tjLRfISs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVhMMBRO6DOQPpFvFL/BUrifSWRX0tt+N1wu2sRkzStO/9Vc7ZjyvSed7CQZmjcnqVOiHaPkBehVjkx1YoKSXYd5AsDKLXnSeLHCYLiflgHmFRdCOAd+J8J6uXP/WwlyR91ojepw6NPc1BxTbQkgNPaz145Bv+tE4X70jQCm9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmaVBdlB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmaVBdlB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED371F000E9;
	Sat, 25 Jul 2026 16:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784998439;
	bh=CGiD98qQCQZ7uNP/Ka9jvI6qO1LaECcQqkPSKoNbdcc=;
	h=From:To:Cc:Subject:Date;
	b=QmaVBdlBTsOhQ0JzCMOuWT7sAnWtHN5QrjVWyaFFfopjgouxJNVyQvA5/NbVy4Y4S
	 d215TAUDo0GxvWGSqRyLMuBiVGrTXigiV+vKXtXkQBqprRb+On8rRdxIit4CjTGhRJ
	 cekCRz9f4mp/Tf/NelnXsNoPkmYv/JOqF18HLajbml1mR+Q4n1BsaTf7TENoH5S0h6
	 sHtmnXwT/NyoybrmW7rT/j8Pxy31U7FfJEKPZDn6fW7q9pKNnZLUPugpOxxm+0BOFk
	 ToDKRyKBatw+utpLKoP2Qyu0TeZP7bEsxrKjl/AH30+bLAA3eei06qU0q2/+x0vguZ
	 ZLDEfKMq3/HnQ==
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
Subject: [GIT PULL] Rust fixes for 7.2 (2nd)
Date: Sat, 25 Jul 2026 18:53:01 +0200
Message-ID: <20260725165301.156594-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have been in linux-next for at least four rounds (most for more
than a week).

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.2-2

for you to fetch changes up to 880c43b185ca52239e75bc546cc4f4d9154d0fed:

  rust: time: fix as_micros_ceil() to round correctly for negative Delta (2026-07-18 19:07:35 +0200)

----------------------------------------------------------------
Rust fixes for v7.2 (2nd)

Toolchain and infrastructure:

 - 'zerocopy' crates: update to v0.8.54 to fix a modpost error under
   'CONFIG_CC_OPTIMIZE_FOR_SIZE=y'.

   There are actually two updates in the PR: the one to v0.8.52 is
   fairly large and was originally not intended for a fixes PR, but the
   actual fix landed in the v0.8.54 one. Thus I included both here.

   The v0.8.52 update includes two things upstream added for us:
   '--cfg no_fp_fmt_parse' to avoid a local workaround, and the new
   'most_traits' feature.

   The good news is that, after these updates, the delta with upstream
   is now trivial: only an identifier prefix change and the SPDX
   parentheses.

 - Fix an objtool warning by adding one more 'noreturn' function for
   Rust 1.99.0 (expected 2026-10-01).

 - Clean up new 'semicolon_in_expressions_from_macros' lint errors for
   Rust 1.99.0 (expected 2026-10-01). The lint can be allowed, but it
   will be a hard error at some point in the future anyway, so clean it
   up now.

 - Locally allow new 'suspicious_runtime_symbol_definitions' lint for
   Rust 1.98.0 (expected 2026-08-20).

 - Globally allow 'clippy::unwrap_or_default' lint since it relies on
   optimizations -- under 'CONFIG_CC_OPTIMIZE_FOR_SIZE=y' it does not
   work well.

'kernel' crate:

 - 'time' module: fix 'Delta::as_micros_ceil()' to round negative values
   correctly.

----------------------------------------------------------------
Alexandre Courbot (1):
      rust: allow `clippy::unwrap_or_default` globally

Alice Ryhl (1):
      rust: device: avoid trailing ; in printing macros

FUJITA Tomonori (1):
      rust: time: fix as_micros_ceil() to round correctly for negative Delta

Miguel Ojeda (4):
      rust: allow `suspicious_runtime_symbol_definitions` lint for Rust >= 1.98
      rust: zerocopy: update to v0.8.52
      rust: zerocopy: update to v0.8.54
      objtool/rust: add one more `noreturn` Rust function for Rust 1.99.0

 Makefile                                      |  5 +++
 init/Kconfig                                  |  3 ++
 rust/Makefile                                 | 16 +++++++--
 rust/bindings/lib.rs                          |  4 +++
 rust/kernel/device.rs                         | 20 +++++------
 rust/kernel/time.rs                           | 11 ++++--
 rust/uapi/lib.rs                              |  4 +++
 rust/zerocopy-derive/README.md                | 14 ++++----
 rust/zerocopy-derive/derive/from_bytes.rs     |  2 +-
 rust/zerocopy-derive/derive/into_bytes.rs     |  2 +-
 rust/zerocopy-derive/derive/known_layout.rs   |  3 +-
 rust/zerocopy-derive/derive/mod.rs            | 20 ++++++-----
 rust/zerocopy-derive/derive/try_from_bytes.rs |  6 ++--
 rust/zerocopy-derive/derive/unaligned.rs      |  2 +-
 rust/zerocopy-derive/lib.rs                   | 36 ++++++++++++++++++-
 rust/zerocopy-derive/repr.rs                  |  2 +-
 rust/zerocopy-derive/util.rs                  | 34 +++++++++++++-----
 rust/zerocopy/README.md                       | 15 ++++----
 rust/zerocopy/rustdoc/style.css               |  1 -
 rust/zerocopy/src/byte_slice.rs               |  2 +-
 rust/zerocopy/src/byteorder.rs                | 50 ++++++++++++++++++++++-----
 rust/zerocopy/src/deprecated.rs               |  2 +-
 rust/zerocopy/src/error.rs                    |  2 +-
 rust/zerocopy/src/impls.rs                    |  4 +--
 rust/zerocopy/src/layout.rs                   |  4 ++-
 rust/zerocopy/src/lib.rs                      | 12 ++++---
 rust/zerocopy/src/macros.rs                   |  2 +-
 rust/zerocopy/src/pointer/inner.rs            |  2 +-
 rust/zerocopy/src/pointer/invariant.rs        |  2 +-
 rust/zerocopy/src/pointer/mod.rs              |  2 +-
 rust/zerocopy/src/pointer/ptr.rs              |  2 +-
 rust/zerocopy/src/pointer/transmute.rs        |  2 +-
 rust/zerocopy/src/ref.rs                      |  2 +-
 rust/zerocopy/src/split_at.rs                 |  2 +-
 rust/zerocopy/src/util/macro_util.rs          |  2 +-
 rust/zerocopy/src/util/macros.rs              |  2 +-
 rust/zerocopy/src/util/mod.rs                 |  8 ++++-
 rust/zerocopy/src/wrappers.rs                 |  2 +-
 tools/objtool/check.c                         |  1 +
 39 files changed, 217 insertions(+), 90 deletions(-)
