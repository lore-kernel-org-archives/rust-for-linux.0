Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A9942AA6;
	Sat, 14 Mar 2026 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773514813; cv=none; b=lNlrlQBlv4uCowz0nDqcdiOhcpAbu2fOr/QeZ7pO89LDJRe0+DcpYat6/XTqnllniuYBNHXmPCquHixH7ZThP2AwhUYQIVY7C4c/NC1RISY2jzqsfqyga9dglIOkJh1gLqJYXpgBzDiTZmsQ5UHQu46lPscKj/VlDUuVXpuMITU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773514813; c=relaxed/simple;
	bh=eGn7dXwllFaaIftTvHiayi0vS8My62IAfIvFRN+SHh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZW4B0Ko6GClCzAFxrPx2sFTfzJEUgECQtiVAZSdnD6zyP7hsCrDguaCTFauZNj7IzKEDzb69KDa8ao1XfcTXi342Ft6NcWYTOJCmD1rJ8/QWSp6TyPJFT2kNBkril+kBBAk4v/yOig4a61E1QCY5TiNRvBLlAFz+4Gyshjx99KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvW1hKlA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvW1hKlA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B4BC116C6;
	Sat, 14 Mar 2026 19:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773514812;
	bh=eGn7dXwllFaaIftTvHiayi0vS8My62IAfIvFRN+SHh8=;
	h=From:To:Cc:Subject:Date:From;
	b=BvW1hKlAZczKAZe6KsHJFvdIv5T10nDC2bCnMbGkHs4BUx3xzQzT9UTYNHOpEc8mQ
	 L7OvhUzbHliWu+3FqMEnRM8GJdYvNFvdGPKfYj5I4LW9F6FSVFmZvHQR6Ck2Ezk0h4
	 JCqaB36ZmhdffIEg397PnB1BzWw+CISJi4I4042sXqAK6iy12FSSPzTmo/8K44p+/h
	 QZewORHwUkxsj4TUBZLjUrcK7OWDFawbpe1yY3tRShECPPvlsDjfjhOytp2H8Jk7qh
	 7j6OiprYmFq6LNxxW8Tb4ltdFK5I0kk4c7+ZrFtOkXWWjfNaMrxLzWOVViotqCH2Z6
	 t6kH89JN+PlXQ==
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
Subject: [GIT PULL] Rust fixes for 7.0 (2nd)
Date: Sat, 14 Mar 2026 19:59:40 +0100
Message-ID: <20260314185940.25802-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

The top commit has only been in linux-next for one round, but most have
been for more than a week. They can all wait one more week if needed.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.0-2

for you to fetch changes up to 592c61f3bfceaa29f8275696bd67c3dfad7ef72e:

  rust: kbuild: allow `unused_features` (2026-03-12 15:15:16 +0100)

----------------------------------------------------------------
Rust fixes for v7.0 (2nd)

Toolchain and infrastructure:

 - Remap paths to avoid absolute ones starting with the upcoming Rust
   1.95.0 release. This improves build reproducibility, avoids leaking
   the exact path and avoids having the same path appear in two forms.

   The approach here avoids remapping debug information as well, in
   order to avoid breaking tools that used the paths to access source
   files, which was the previous attempt that needed to be reverted.

 - Allow 'unused_features' lint for the upcoming Rust 1.96.0 release.
   While well-intentioned, we do not benefit much from the new lint.

 - Emit dependency information into '$(depfile)' directly to avoid
   a temporary '.d' file (it was an old approach).

'kernel' crate:

 - 'str' module: fix warning under '!CONFIG_BLOCK' by making
   'NullTerminatedFormatter' public.

 - 'cpufreq' module: suppress false positive Clippy warning.

'pin-init' crate:

 - Remove '#[disable_initialized_field_access]' attribute which was
   unsound. This means removing the support for structs with unaligned
   fields (through the 'repr(packed)' attribute), for now.

   And document the load-bearing fact of field accessors (i.e. that they
   are required for soundness).

 - Replace shadowed return token by 'unsafe'-to-create token in order
   to remain sound in the face of the likely upcoming Type Alias Impl
   Trait (TAIT) and the next trait solver in upstream Rust.

----------------------------------------------------------------
Alexandre Courbot (1):
      rust: str: make NullTerminatedFormatter public

Benno Lossin (3):
      rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
      rust: pin-init: internal: init: document load-bearing fact of field accessors
      rust: pin-init: replace shadowed return token by `unsafe`-to-create token

Gary Guo (2):
      rust: kbuild: emit dep-info into $(depfile) directly
      rust: build: remap path to avoid absolute path

John Hubbard (1):
      rust: cpufreq: suppress clippy::double_parens in Policy doctest

Miguel Ojeda (1):
      rust: kbuild: allow `unused_features`

 Makefile                           |  4 +++
 rust/Makefile                      | 11 +++---
 rust/kernel/cpufreq.rs             |  1 +
 rust/kernel/str.rs                 |  4 +--
 rust/pin-init/internal/src/init.rs | 69 +++++++++++++-------------------------
 rust/pin-init/src/__internal.rs    | 28 +++++++++++++---
 6 files changed, 59 insertions(+), 58 deletions(-)
