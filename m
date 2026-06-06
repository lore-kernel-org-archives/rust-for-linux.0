Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DADC392812;
	Sat,  6 Jun 2026 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780745795; cv=none; b=HxJ9GstNot01uVhWri+DYxEnglniiRFuaiRqFerHaVW5SQMuoPrrILnyaLm0pR1UhqJzT/nval3LyUrBwqW1HZF8IeXgzUTIboSZAFfaBfeOlxsvnsLPDhzsLdbg3kUwWIOUPZifEfBJe6RY8aKER1Zl3qL+t+GQcPkN1NnMky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780745795; c=relaxed/simple;
	bh=NG7hAvmS12sIfywaLsmTLwZ2kORwyW9zOHx3WcE3hVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S5FN1RSPBVTCJlnADzx7uddUrzrk5+CDJkwJKL6F2g4BxaupVtYelsa9k+douI15P4NwiXzDFRXqjpV7utIZWdpbnRnt4ThKjlwHKlDy6/FDFee9/ncrnTsTaTeXG3MRvCAbtivwxLgXEngtb217ZCJq/OV+KqH/idLAtPyJCeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9o5wmzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9o5wmzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845771F00893;
	Sat,  6 Jun 2026 11:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780745794;
	bh=V7E5P36Lrj9No5yUdUn3tUWJDWnKv68a7ZmB0+kKRio=;
	h=From:To:Cc:Subject:Date;
	b=n9o5wmzSEy00LK7p58ZLYkAwZZaPxokgap7BiztAqwjvU/Sosgo1/3e6kZ/i+jbPR
	 lHjeJffOVamGeeaWsxuE7/vlvb+jv9FnUeklxXgSRliJtNfCuYV9iMiVdgB3yW60zR
	 nygIhsmnAjwtZ9Db/rNzzA2d3DI6LWcix3zKHUmgMoV3yupEevFJad0yImMZQ7hr23
	 XMGW4S6w9uVFzXmoqOt+242HtlH9IfITa4KlphAONmkqojWJ3FsqC/7bwtl1PeWZp+
	 vbSRBege71WicAmud0oXr5l3zi2/PbjyjnaECrjTVTKyfaZFBdigEhqnCCN9TplGRA
	 FL1Hn1sIOYcfQ==
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
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 7.1 (2nd)
Date: Sat,  6 Jun 2026 13:36:18 +0200
Message-ID: <20260606113618.12487-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have all been in linux-next for a week or longer.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.1-2

for you to fetch changes up to 905b06d32a52afe32fcf5f30cf298c9ea6359f11:

  rust: x86: support Rust >= 1.98.0 target spec (2026-05-30 15:38:16 +0200)

----------------------------------------------------------------
Rust fixes for v7.1 (2nd)

Toolchain and infrastructure:

 - Fix 'rustc-option' (the Makefile one) when cross-compiling that leads
   to build or boot failures in certain configs.

 - Work around a Rust compiler bug (already fixed for Rust 1.98.0) thats
   lead to boot failures in certain configs due to missing 'uwtable'
   LLVM module flags.

 - Support a Rust compiler change (starting with Rust 1.98.0) in the
   unstable target specification JSON files.

 - Forbid Rust + arm + KASAN configs, which do not build.

'kernel' crate:

 - Fix NOMMU build by adding a missing helper.

----------------------------------------------------------------
Alice Ryhl (2):
      rust: kasan/kbuild: fix rustc-option when cross-compiling
      rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES

Miguel Ojeda (1):
      rust: x86: support Rust >= 1.98.0 target spec

Nathan Chancellor (1):
      ARM: Do not select HAVE_RUST when KASAN is enabled

Shivam Kalra (1):
      rust: helpers: add is_vmalloc_addr wrapper for NOMMU builds

 Makefile                        | 3 ++-
 arch/arm/Kconfig                | 2 +-
 arch/arm64/Makefile             | 3 +++
 arch/x86/Makefile               | 4 ++++
 arch/x86/Makefile.um            | 8 ++++++++
 rust/helpers/vmalloc.c          | 6 ++++++
 scripts/Makefile.compiler       | 2 +-
 scripts/generate_rust_target.rs | 8 ++++++--
 8 files changed, 31 insertions(+), 5 deletions(-)
