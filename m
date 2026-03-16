Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1C139E6FD
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673692; cv=none; b=KuT/5VuVyPF9gaiCkMBEQgIvNGhX6kcMzbwvqjP664TMZQa0JKO9dUttDPewwOLahukBk+QVrPiseetXHP2L5AFVOfsuIbjOIVWlmQmI0VVPrskXUGgyTcClNCeuhIB6lRhk6HXOkvZmyJctjSlw8UnE5Lv9bN4lEDYI4ZG348Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673692; c=relaxed/simple;
	bh=lPcE6oHlWyqz4FJjtp+E3RwZPEXCQok4zUdfHl7o25I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bx/JCXCNAxeRL4PweaArOOb1JmWWlQ22AjvBzWCmIvh0texTJWabs6wyA4N0ILkzl6HBj8MZG3A3U11zgWVAr0iVNyPUi1KaL5ko1ptyhN3UbGBjcLgZ/t6FAspjS2RLOAWhhgEHW0HY82u4Ij4EdtAs92Ez5cnvb4sAp+gvqhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ksoofkis; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ksoofkis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852CBC19425;
	Mon, 16 Mar 2026 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773673692;
	bh=lPcE6oHlWyqz4FJjtp+E3RwZPEXCQok4zUdfHl7o25I=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=ksoofkisMpI9FsGFWmavCU/Hrnw36cTDV0kJxMzyiZITelUmJ6H+qdcWLVMaNLlH3
	 Nivqy2k2EcPVkWQrWqABCnh4yyBD4P4sjwI9UCbKzvmDz0BV0aHsJOX8FR5TV9WPIq
	 yQF9UFjdbT7bwMwwNcpMOxCpn34vA+MyJ/FbRdf6HtmwNaKUsDsITwoVIjlQ/IKydR
	 dglCaZ+ZQJ+XwM338MFktYRG3qsa7tmtgcYhBvbzMubdZODscNn8aspPedj3o0o5nq
	 5MokveXyTnbnltts1nlU27zhiDKOBgwDjthJT2abnik2NR/Ho4Pyylz0u8wru0zHDs
	 Xk/QO9bML9THw==
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
Cc: Yury Norov <yury.norov@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/4] add `const_assert!` macro and rework documentation
Date: Mon, 16 Mar 2026 15:07:11 +0000
Message-ID: <20260316150720.1646109-1-gary@kernel.org>
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

There's no functional changes from v1, but the documentation side is
completely overhauled. If you want to test it out, do `make rustdoc` and
browse the rendered documentation.

Link to v1: https://lore.kernel.org/rust-for-linux/20260206171253.2704684-1-gary@kernel.org/

Cc: Yury Norov <yury.norov@gmail.com>

Gary Guo (4):
  rust: move `static_assert` into `build_assert`
  rust: add `const_assert!` macro
  rust: rework `build_assert!` documentation
  rust: make `build_assert` module the home of related macros

 rust/kernel/build_assert.rs          | 194 ++++++++++++++++++++++-----
 rust/kernel/dma.rs                   |   6 +-
 rust/kernel/io/resource.rs           |   2 +-
 rust/kernel/ioctl.rs                 |   2 +-
 rust/kernel/lib.rs                   |   2 -
 rust/kernel/net/phy/reg.rs           |   8 +-
 rust/kernel/num/bounded.rs           |  26 ++--
 rust/kernel/prelude.rs               |  10 +-
 rust/kernel/ptr.rs                   |  12 +-
 rust/kernel/static_assert.rs         |  39 ------
 rust/kernel/sync/atomic/predefine.rs |   3 +-
 rust/kernel/sync/locked_by.rs        |   2 +-
 rust/kernel/sync/refcount.rs         |   8 +-
 rust/kernel/xarray.rs                |   6 +-
 scripts/Makefile.build               |   5 +-
 15 files changed, 207 insertions(+), 118 deletions(-)
 delete mode 100644 rust/kernel/static_assert.rs


base-commit: 5c9e55fecf9365890c64f14761a80f9413a3b1d1
-- 
2.51.2

