Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B0425B0B6;
	Sun, 30 Aug 2026 09:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082741; cv=none; b=BjLYQQgi04foyQXvfSR+HJMtqgghdj9/JbdDva+FDmCSiVpabFH1LFZgQLK8f30Px3IvUZOdfWz9QTPTE7tItIuviC0CJsT1dXv1CCuM3y+aXsIb/k512KTK2nXBigi7PBUo+POHz8AkDRzOVtrrgrgSwRLV4P7GUf6Z50EJrIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082741; c=relaxed/simple;
	bh=DYEGJThvxD3EI8tPBUw/f6YQmYdrmiC3fayS5oSThp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k+fQKHJB1PgOEz4N7uMSvxgUcg8c9umP8V1zLmE6uNoAmnUdP/R/pEW536jw56BSZH4iFbL08XeZyEfu8puw0Ur0FnJih5vtcf97QrnKEEI3kE3KIuGifTIzxjeG7+ETMhHycA09iPPEIYCMXyrB9hrMMKwC4vGSU3L3/ecTG1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMIndOHI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMIndOHI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479041F000E9;
	Sun, 30 Aug 2026 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788082739;
	bh=c5wbSvMfE0pJzRIujez5O2qKEvAya60BbFimcnSfaYo=;
	h=From:To:Cc:Subject:Date;
	b=mMIndOHIQIh2ztgyw/k2toN7mzUq+Z0gU6czKpMHBMUki8MUTvBU4JahoNXT4Mikv
	 pP+t1aIohR5ZimAHO0TnaNO13vh8zXQCZ+zH3noQ0au/e8Q0gm83ZEnQjHjlmvHAhu
	 Az/S9BlvGFv2JJbOAFbGPB2i10GwF4bP03Q9zMOr5pjSUDiUoT+dXUwZtB6wHCwq5p
	 QKpVFvsAHuHixR7Rz8ymosbNk0pKN/L90kPdRpG9SvrFg2o9BzXVacRtyT1NjQ4Pi2
	 PaowHRdNMYn5rS+TzjI+rXDtoTwe/VDoMdjhdjGo1RRoR9VrkBzKa0eqhd0UpxH0JW
	 usnPUuB4Z5tJA==
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
Subject: [GIT PULL] Rust fixes for 7.3
Date: Sun, 30 Aug 2026 11:38:34 +0200
Message-ID: <20260830093834.275112-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have been in linux-next for at least 3 rounds (most for a week).

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit d24f5cdbeff8b6a063fca92d0a1f94122a799b59:

  Merge tag 'rust-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux (2026-08-18 11:25:09 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.3

for you to fetch changes up to 1b0bab4a873f1034c27573cfc613394cff7e0a5b:

  rust: kbuild: disambiguate `zerocopy_derive` for `rusttest` (2026-08-25 22:19:27 +0200)

----------------------------------------------------------------
Rust fixes for v7.3

Toolchain and infrastructure:

 - Fix KCFI failures, such as in Rust doctests, by disabling function
   merging when CFI is enabled. Gary reported the LLVM bug to upstream
   and it is now fixed in their mainline.

 - Fix 'objtool' fallthrough warnings under the experimental
   'CONFIG_RUST_INLINE_HELPERS' by passing (for the combined Rust and
   helpers code) the LLVM options needed to preserve the unreachable
   traps that 'rustc' normally emits.

   In addition, fix 'objtool' errors when LTO is enabled on top, by
   also filtering out the LTO flags (for the combined Rust and helpers
   code) so that the traps are kept in place.

 - Fix 'objtool' warnings by adding one more 'noreturn' function.

 - Fix 'make rusttest' target when the 'rustc-dev' component is
   installed and Rust >= 1.82.0, <= 1.87.0 is used.

'kernel' crate:

 - 'num' module: fix soundness issue in the 'Bounded' conversion from
   'bool' by restricting the conversions to unsigned 'Bounded'.

 - 'jump_label' module: fix future 'make rusttest' target failures when
   'ARCH=' is set to an arch different than the host's.

 - 'list' module: fix incorrect 'pop_back()' comment.

----------------------------------------------------------------
FUJITA Tomonori (1):
      rust: jump_label: skip arch-specific asm in `testlib` builds

Gary Guo (1):
      rust: cfi: disable function merging if CFI is enabled

Miguel Ojeda (4):
      objtool/rust: add one more `noreturn` Rust function
      kbuild: rust: preserve unreachable traps with inline helpers
      kbuild: rust: keep Rust objects out of Clang LTO with inline helpers
      rust: kbuild: disambiguate `zerocopy_derive` for `rusttest`

Nikolai Grlica (1):
      rust: kernel: list: fix incorrect pop_back example comment

Younes Akhouayri (1):
      rust: num: restrict bool conversion to unsigned Bounded

 Makefile                   | 13 ++++++++++++-
 rust/Makefile              |  6 ++++--
 rust/kernel/jump_label.rs  | 12 ++++++++++++
 rust/kernel/list.rs        |  2 +-
 rust/kernel/num/bounded.rs | 30 +++++++++++++++++++++---------
 scripts/Makefile.build     |  3 ++-
 tools/objtool/check.c      |  1 +
 7 files changed, 53 insertions(+), 14 deletions(-)
