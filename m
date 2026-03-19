Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104344C81
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922654; cv=none; b=Hn+1qFBN/srMb6ciJqdiRi8gVDT8JWOuSA4Lo8sqSCs+Dd8TcVY9njFOBVdgjthhcdJopRKXLt6cDuWudh4WempepXn9kmpILZ1CagQHCYOg7GfT/wk5SJawvEsX0bJaSqoMw6+Sl9GvdM7up2FKvkSZxtV5skw1ESYn2qvbfbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922654; c=relaxed/simple;
	bh=HJirAvNTcfrBNJIsDDOZb10T+e4FJU8VlfnfNJMjcfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VMeHHdOlv5XlR7q7SpabdvkWv6a66w3on4ah1ktBnFtfPjHR+W9lX2SfpS6ZhHwoYvlanjB72EYW/el6whDIrJEzpqsfN/C+quHmjvZvxkPvjZU2UOZyZM9kq76tXHwQOO1JmIRMHt7X/hS+6CNgOcqK9BLiITcDBgPHS7q23mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i6p5awDD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i6p5awDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAD6C19424;
	Thu, 19 Mar 2026 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773922653;
	bh=HJirAvNTcfrBNJIsDDOZb10T+e4FJU8VlfnfNJMjcfQ=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=i6p5awDDzD8sN7EbxtvmweckXq8QD7Ghh1bdDHs/RDG2q1/3S3kMe+5BC2SKGAmUs
	 FOfRwYTFd3x4gjnOmvomjxvsWpwiJqOUt81kYWk5qKtAoJ3CQK7NTwlIrhDXT45OfR
	 u2WX03IIlg1QaBCztFrS2yK6FlMsnERsYgZUVMp1yvXYCbEWW17ffW4XO68k81Xcis
	 4O5MhKsPQS8AvKMHjaXr3C/2EHTk8RTjP2l4zy6JFwN4EkDn59xmbQPmnQeJHcaNrk
	 1gJBXSo+49qD5ABZftBG460giQ3pazwbsvhqutnr87s5A6HQDQz+5N4aK7l1c4KtEI
	 i/N4rHcMubVLg==
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
Cc: Yury Norov <ynorov@nvidia.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 0/4] add `const_assert!` macro and rework documentation
Date: Thu, 19 Mar 2026 12:16:44 +0000
Message-ID: <20260319121653.2975748-1-gary@kernel.org>
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

This adds the `const_assert!` macro, rework documentation of all
build-time assertion macros to live under `build_assert` module, and
make that the canonical path to refer to these macros.

The Rust documentation rendering side can be tested out with `make
rustdoc` command.

Changes since v2:
- Rebased on top of latest linux-next to pick up `register!` changes
- Drop the unintended removal of `#[inline(always)]` doc on
  `build_assert!` (Sashiko)
- Remove imports covered by prelude (Danilo)
- Fix references in Nova and new `register!` macro
- Link to v2: https://lore.kernel.org/rust-for-linux/20260316150720.1646109-1-gary@kernel.org/

Changes since v1:
- Completely overhaul of the documentation
- Make `kernel::build_assert` the canonical path to refer to related macros
- Link to v1: https://lore.kernel.org/rust-for-linux/20260206171253.2704684-1-gary@kernel.org/

Cc: Yury Norov <ynorov@nvidia.com>

Gary Guo (4):
  rust: move `static_assert` into `build_assert`
  rust: add `const_assert!` macro
  rust: rework `build_assert!` documentation
  rust: make `build_assert` module the home of related macros

 drivers/gpu/nova-core/bitfield.rs    |   4 +-
 drivers/gpu/nova-core/num.rs         |   2 +-
 rust/kernel/build_assert.rs          | 200 ++++++++++++++++++++++-----
 rust/kernel/dma.rs                   |   5 +-
 rust/kernel/io/register.rs           |  19 ++-
 rust/kernel/io/resource.rs           |   2 +-
 rust/kernel/ioctl.rs                 |   2 +-
 rust/kernel/lib.rs                   |   2 -
 rust/kernel/net/phy/reg.rs           |   8 +-
 rust/kernel/num/bounded.rs           |  26 ++--
 rust/kernel/prelude.rs               |  10 +-
 rust/kernel/ptr.rs                   |  12 +-
 rust/kernel/static_assert.rs         |  39 ------
 rust/kernel/sync/atomic/internal.rs  |   9 +-
 rust/kernel/sync/atomic/predefine.rs |   2 +-
 rust/kernel/sync/locked_by.rs        |   2 +-
 rust/kernel/sync/refcount.rs         |   8 +-
 rust/kernel/xarray.rs                |  10 +-
 scripts/Makefile.build               |   5 +-
 19 files changed, 236 insertions(+), 131 deletions(-)
 delete mode 100644 rust/kernel/static_assert.rs


base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
-- 
2.51.2

