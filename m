Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04AC18C33;
	Sat, 21 Feb 2026 20:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771706011; cv=none; b=P+Fu6ZA8hVR56PNcuauveK2knPuYo5wNx8NyUhIDiA4fa0H2nLXQx8OCpVcZGqjMx7fDhs8+nXbt5+TkOl7yhDYT8/aZ5oi2RjV1bt1eVvFAkJETTQFpw9C8p9AHo7c7sgb/ajQkqO5NbFLbH+e1CCC+88/yCKbRLzStnjkGDqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771706011; c=relaxed/simple;
	bh=wHNXqUd7HIsd/T7qV77MkUXfJ1ptxTaEW7OaMm1Sbhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sEf6JIsLKoYP3smcGoV2jYUdca2tKmRw4GIqsR4wKuDdi8YkjbzS9ytpL54UoppKx50mVmLs7wjqIcEL2tgHzKoC4hAQOdDqkRumOKM8Eyu6jkLj8w9z6XPrs0Qb4bJO0QHs37eIrMzKfpoA+tYXW6PjVdu8xMmvOjv1f2JlnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONWL90pp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONWL90pp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93381C4CEF7;
	Sat, 21 Feb 2026 20:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771706011;
	bh=wHNXqUd7HIsd/T7qV77MkUXfJ1ptxTaEW7OaMm1Sbhc=;
	h=From:To:Cc:Subject:Date:From;
	b=ONWL90ppbsB9b3Om1NNnxZModADGviwOJOYtvHSBU9VYLRksONuW6loltW03yCetq
	 /T+su3xrij9gIFcPaaBYYaARgeZdmdjMkoms+5wKpe+I/EsE6Q42vW7TDStbsRLL04
	 44tK/iY5sA4Y/gTy1CEYU69nb21aUBXPSZ1oqZZ9M5VaBy3ZfGzBWoxwX0MTZ5sn0K
	 AJTGxurvF4HS9tY1YiLjOXmsoZAvT6QiVHP2pDVW0OHo1nX+mUPcx61XOlbf98F9Hj
	 N83mrLQBQu1a/JwSwhxKg5A1ncjCys8kMd9PCAVm0Yg3pQcu30QQuWAktTQXQt8cdd
	 PwDX039tE4czw==
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
Subject: [GIT PULL] Rust fixes for 7.0
Date: Sat, 21 Feb 2026 21:33:06 +0100
Message-ID: <20260221203306.133927-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

The top commit has only been in linux-next for one round, but they are
all low risk. They are also not urgent, so they may wait for -rc2.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b:

  Linux 6.19 (2026-02-08 13:03:27 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.0

for you to fetch changes up to 97b281d7edb2ae662365be2809cd728470119720:

  rust: list: Add unsafe blocks for container_of and safety comments (2026-02-20 01:59:51 +0100)

----------------------------------------------------------------
Rust fixes for v7.0-rc1

Toolchain and infrastructure:

 - Pass '-Zunstable-options' flag required by the future Rust 1.95.0.

 - Fix 'objtool' warning for Rust 1.84.0.

'kernel' crate:

 - 'irq' module: add missing bound detected by the future Rust 1.95.0.

 - 'list' module: add missing 'unsafe' blocks and placeholder safety
   comments to macros (an issue for future callers within the crate).

'pin-init' crate:

 - Clean Clippy warning that changed behavior in the future Rust 1.95.0.

----------------------------------------------------------------
Benno Lossin (2):
      rust: irq: add `'static` bounds to irq callbacks
      rust: pin-init: replace clippy `expect` with `allow`

Miguel Ojeda (2):
      rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
      objtool/rust: add one more `noreturn` Rust function

Philipp Stanner (1):
      rust: list: Add unsafe blocks for container_of and safety comments

 rust/Makefile                          |  3 +++
 rust/kernel/irq/request.rs             | 12 +++++++++---
 rust/kernel/list/impl_list_item_mod.rs | 25 ++++++++++++++++---------
 rust/pin-init/src/lib.rs               |  4 ++--
 tools/objtool/check.c                  |  3 ++-
 5 files changed, 32 insertions(+), 15 deletions(-)
