Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F289F383C66;
	Sat,  2 May 2026 16:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777739327; cv=none; b=tP20msFfElo1BfNkwUBMS+T+FwX4hNTSmlCnoYH8/N7KcAidylGX4I7f3EMXPRWWHHIZG8Cc578qnJkmorh94wmBYgQz3T3HeqXqlwRwqYKQ4umbv6RISv9tGne68F6orqRjyHET+PBFWD5OvWZQ5Nmujn/We9GNk75EsSNiJ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777739327; c=relaxed/simple;
	bh=jxB9thpv5FdOyIYS3e6ZyDHHXKpg/Hxvs1NgYM5uVgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ErfgSJ8G35GwggCwnN04AGwn0qrxanPe938iXkGkpoltz8bA84R60azThO1EcgRXh2kzYnYcJkieig5et7kthxGKisYokfUzQ0smNLjrdYxDR59OJ28Bs6ScyoBXgXJTV8pdpTJ82QFKVhzTvsp/2ZmdtMD9qdCAnKTne+Pn2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=udXe19jh; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="udXe19jh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1777739321; x=1777998521;
	bh=m1HbgPFh+e5baZNwl2NXLwUn3/AWRq+HCEu1r0mYhb8=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=udXe19jhmYxrzTP2n8ebUo+0FbkGtywgWBLjFijvR31lhidRxd2kg0vW7j2oH3AwH
	 njpicf5CwDJZpJMmQ/cE9thV4z3jizvXeutCqKJDCxN2RcQjzN+MLobpum7IxNp9zI
	 9bJAMavw16mtNGHS226isNI9pMDy7JLEpR+bu1f5KcGae23iFUG5uZ80prOXbtjb8x
	 lb7GFiOYeEQaqh8oGPWdH6g5Uxedb1S9lom7NNgoIB+AblZuJkvFAj+YiVWbILL1fK
	 z4zgxHMTtMztmiRt2CK4zrG/pjcgXKWj+lq84uHsrxOQgFL+tYQzzvFguF/9r3nW73
	 B1WbFpkitOt6w==
X-Pm-Submission-Id: 4g7Cyb35D5z1DFFq
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rcu@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	fujita.tomonori@gmail.com,
	tamird@kernel.org,
	jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v2 0/3] rust: add SRCU abstraction
Date: Sat,  2 May 2026 19:27:36 +0300
Message-ID: <20260502162833.34334-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The immediate motivation is the Tyr reset infrastructure [1] which needs
to serialize reset sensitive hardware access against reset and teardown
paths. That reset series started to require many independent dependencies
so this SRCU support is split out as a standalone Rust API to keep the
reset series focused on the reset logic and easier to review, rebase and
land.

[1]: https://lore.kernel.org/all/20260416171728.205141-1-work@onurozkan.dev

Changes since v1:

- Made the owned SRCU read-side guard API unsafe and added a safe closure
  based helper for callers that do not need to keep the guard. This is to
  avoid UB on the C side cleanup_srcu_struct where the SRCU struct is freed
  while there are still active guards, which can happen if the caller leaks
  the guard e.g., with mem::forget().
- Improved doc comments.

v1: https://lore.kernel.org/all/20260428103437.156236-1-work@onurozkan.dev

Onur Özkan (3):
  rust: helpers: add SRCU helpers
  rust: sync: add SRCU abstraction
  MAINTAINERS: add Rust SRCU files to SRCU entry

 MAINTAINERS              |   3 +
 rust/helpers/helpers.c   |   1 +
 rust/helpers/srcu.c      |  24 +++++++
 rust/kernel/sync.rs      |   2 +
 rust/kernel/sync/srcu.rs | 152 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 182 insertions(+)
 create mode 100644 rust/helpers/srcu.c
 create mode 100644 rust/kernel/sync/srcu.rs

-- 
2.51.2
