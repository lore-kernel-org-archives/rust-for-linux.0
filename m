Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343F221FD4
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Jul 2025 23:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753315199; cv=none; b=Rwt25NSXEVs6HN3ppMFeVBE+fMwSOqN7rkUvzms4tLA6i7gDPLGySqGJ410kEQ5l7uOv9aIq/hYzAte62+ftkfIkvuFzEnc90Q81gve3aK1L/nkxJnlg8vBSht4mZS4CY/2IiCjM7T8cTO+HWfIcTWFN8PzcaYBbaZlNnA84oCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753315199; c=relaxed/simple;
	bh=UM8c77SlwLcQtJkFc/yXW/vvOkjnWnE/B8a7F1zHWS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HzPIAOIEW0vTHeyE3vLM0FTS3TJo7yT19eXSBuX60YDZWV7cnVi8xbiBNsGG2WfWsylB9on/+Xb/6J6DBPFeKkwa8xiqgQGwOmmjYtqBIx4rlsX/GbB8hnYgyQdqmi+DzHGCelG28ljeyaMezPeYcWbJm0l9bOuspP+EyKpLZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2Xi+dqr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2Xi+dqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACBCC4CEE7;
	Wed, 23 Jul 2025 23:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753315198;
	bh=UM8c77SlwLcQtJkFc/yXW/vvOkjnWnE/B8a7F1zHWS4=;
	h=From:To:Cc:Subject:Date:From;
	b=k2Xi+dqrpOXb+ZtA6fDze14tJ4d+EW8cmOD38GnXJGEMiIqtjOCqAltTFA2RO+sjs
	 8GVLRI6UkEL8AH1jA5TEy/F6sRAbj6tGim7RZLzjyJdXKoNvGmYh2noQ2elcuqaLsw
	 wgsBnmbGsypqGJFaC6XkxZcLdXw4vfEV4fpVTdpC7+0R/pHZhJ/n56cOembnNbfOEt
	 XOuzTPt8yKJaods6/h0Yxsl9JV4aqWqYHe4dGTBK2lfMTsHMh2VSWwrcBRDJPrCYRr
	 vRjgIlJvd35su7TR23yIcofcEZcZsyWO2qXR04khQ7YwPzmwqC1FixJM+Ki7TE+W5J
	 dZsc4uygRuDYg==
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
Subject: [PATCH v5 0/5] implement `kernel::sync::Refcount` and convert users
Date: Thu, 24 Jul 2025 00:32:53 +0100
Message-ID: <20250723233312.3304339-1-gary@kernel.org>
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

Changes in v5:
- Forbid using `Refcount::new()` with already-saturated initial value.
  (`Refcount::set` can still set value to the saturated range, as
  users may want to set it to a runtime value that the compiler cannot
  easily determine to be non-negative).
- Moved a documentation comment from one commit to another following
  Benno's suggestion
- Link to v4: https://lore.kernel.org/rust-for-linux/20250622125802.3224264-1-gary@kernel.org/

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

Gary Guo (5):
  rust: implement `kernel::sync::Refcount`
  rust: make `Arc::into_unique_or_drop` associated function
  rust: convert `Arc` to use `Refcount`
  rust: block: convert `block::mq` to use `Refcount`
  MAINTAINERS: update atomic infrastructure entry to include Rust

 MAINTAINERS                        |   2 +
 rust/helpers/refcount.c            |  10 +++
 rust/kernel/block/mq/operations.rs |   7 +-
 rust/kernel/block/mq/request.rs    |  63 +++++-----------
 rust/kernel/sync.rs                |   2 +
 rust/kernel/sync/arc.rs            |  55 +++++---------
 rust/kernel/sync/refcount.rs       | 112 +++++++++++++++++++++++++++++
 7 files changed, 165 insertions(+), 86 deletions(-)
 create mode 100644 rust/kernel/sync/refcount.rs


base-commit: cc84ef3b88f407e8bd5a5f7b6906d1e69851c856
-- 
2.49.0

