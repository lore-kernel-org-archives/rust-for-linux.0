Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C678BA34
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Jun 2025 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750597118; cv=none; b=lc8oplAZSnpRMMUz9x0nZ7Oqzgx9hFBie0rLSgA4bKeJz4QRfTSlWiGmK/rndKk/RrkBlPxzdOEGu7Kt2KSut4EakMBD1GHOTIJbqW4WlPNLSfyFXnxMY4oDEuKhNkGL0p6SpXoTxnYPixFEomfU7WE1E6xxke7B/DbucTEAGYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750597118; c=relaxed/simple;
	bh=rrI702DxUyWB1khZPbjYnIEZ1wBTPXhaIZBlS4lQaL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmhqViZKtV2B56juGRc0XdlpBFhMPri7IuSHORHU5lBzstoIasGpo874IoDjC25hZDI4ZbAWdVfpXAYvEhjuamaOzfw20ZCbMxtbzc9xmxVOEdjEGhTIONDk+GyIx08uhrTcEGd0eiSveAP85eeShCqkTRbLwBDCaypxCfRunGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eG/jSe10; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eG/jSe10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C049C4CEE3;
	Sun, 22 Jun 2025 12:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750597117;
	bh=rrI702DxUyWB1khZPbjYnIEZ1wBTPXhaIZBlS4lQaL4=;
	h=From:To:Cc:Subject:Date:From;
	b=eG/jSe10kB00lS006ioyd4hVaZeh/geeya/sCtkLJAKF9KyCg1ugmq5qyQAI8gNbP
	 xf6aDn0oDPTgl1T3pMMKRrdr+auq/Uv0+HuQOnBF0X9HnMAbxUuU7azsndaT3vLSm7
	 gIrn/4Eo16kF5oZNnWcx11Yd2DNOoD7hwBCxw8OtV3y2p5UyTJB1+5HnM/dXOu34m9
	 f85ZQgnFAhMAi4tKj/JR6R9+eizUXqxWCkPJqrWCH0oAcMMEvAxRSFWZ6u2ir2ibJX
	 jWRC7ZNrQZMfUto/uIWwm363Vt7nrOe7zUhWYadziMcLVAhRNdgEDbk+UOrVh2uRVr
	 N1uitS9FUfIzg==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 0/5] implement `kernel::sync::Refcount` and convert users
Date: Sun, 22 Jun 2025 13:57:26 +0100
Message-ID: <20250622125802.3224264-1-gary@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Currently there're two refcount usage in rust/, `Arc` and `block::mq`.
`Arc` uses `refcount_t` with FFI calls directly, and `block::mq` use
Rust atomics and custom refcounting.

This series consolidate them to have a single `Refcount` which wraps
`refcount_t` and have it used by both.

With the removal of Rust `AtomicU64` this would also make the code work
for 32-bit systems. See [1] as a previous attempt to fix this issue.

Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Link: https://lore.kernel.org/rust-for-linux/20240905061214.3954271-1-davidgow@google.com/ [1]

Changes in v4:
- Move justification on why `&Refcount` is okay when used for reference
  coutning into the `Refcount::dec_and_test` documentation comment.
- Split `Arc::into_unique_or_drop` signature change into another patch.
- Wording/comment changes
- Link to v3: https://lore.kernel.org/rust-for-linux/20250219201602.1898383-1-gary@garyguo.net/

Changes in v3:
- Drop `dec_not_one` and revert to `dec_and_test`/`set` as the former
  lacks acquire semantics.
- Move a `use` statement from patch 1 to correct place (patch 3).
- Update maintainer entry to include refcount.rs and add myself as a
  reviewer, as suggested by Boqun.
- Link to v2: https://lore.kernel.org/rust-for-linux/20241221183024.3929500-1-gary@garyguo.net

Changes in v2:
- `Refcount::read` method is dropped
- `Refcount::dec_not_one` method is added and `Arc::into_unique_or_drop`
  is converted to use it.
- Link to v1: https://lore.kernel.org/rust-for-linux/20241004155247.2210469-1-gary@garyguo.net

Gary Guo (4):
  rust: implement `kernel::sync::Refcount`
  rust: convert `Arc` to use `Refcount`
  rust: block: convert `block::mq` to use `Refcount`
  MAINTAINERS: update atomic infrastructure entry to include Rust
Gary Guo (5):
  rust: implement `kernel::sync::Refcount`
  rust: make `Arc::into_unique_or_drop` associated function
  rust: convert `Arc` to use `Refcount`
  rust: block: convert `block::mq` to use `Refcount`
  MAINTAINERS: update atomic infrastructure entry to include Rust

 MAINTAINERS                        |   2 +
 rust/helpers/refcount.c            |  10 +++
 rust/kernel/block/mq/operations.rs |   7 +-
 rust/kernel/block/mq/request.rs    |  63 +++++------------
 rust/kernel/sync.rs                |   2 +
 rust/kernel/sync/arc.rs            |  55 +++++----------
 rust/kernel/sync/refcount.rs       | 108 +++++++++++++++++++++++++++++
 7 files changed, 161 insertions(+), 86 deletions(-)
 create mode 100644 rust/kernel/sync/refcount.rs


base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.49.0

