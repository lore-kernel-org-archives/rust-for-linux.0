Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F9628DB56;
	Sat, 31 Jan 2026 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874087; cv=none; b=al7TAkYovJsd0WHaxhFKcIbc1bp04FLJWHbaAszDEhyq8/oQpAW7NfXpyAJJmAk0Oa5kcuxYmS6KZJdloi6khThh9Ui307HjsJWa1gSaiMG2qkYNTnZRLn9/8ws275f4EGJ5ZRMuImc1c4pUEZTvtJDInr+gb7hXoGzRUOaw1lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874087; c=relaxed/simple;
	bh=E24QEYViPCpaKegRzpSaDkSwF54Jcvxz5zec+siwymM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZkSo8Kwgs28Nd0+BJpiXgOJ+FyZHhTZvK5wlznuLI92x6ciUe8iyOgtnaU+Yj37oGkgkU0ok/z8pnRksLyOcwOS45urGxoUWiWSVM3+1PsoXQ1o6C+ytWNeATwp2mL31nEuO2lFaTBZO/Pqk5LSIuSXhKQXJ2ZiRgY7BGjHAt5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=c4AsG2ti; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="c4AsG2ti"
From: Shivam Kalra <shivamklr@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1769874079; bh=E24QEYViPCpaKegRzpSaDkSwF54Jcvxz5zec+siwymM=;
	h=From:To:Cc:Subject:Date:From;
	b=c4AsG2tiwPGAlt4Spbufvntw+g2ASDBZgtx6+UZCmdTxxr6H86q4fH3puPSrLQtce
	 XSLZhvNSITmw+5UnZ5z6fawwopXgR0Vla+79pl6CT3n3x9TUf3MgZv/X5gLGRymd/O
	 VqdMzHq5I9Zt9LEm2UatuY6ELl/3gkrDMskUo7eACTtzi9KB+k8meedjpL1jsgmt6A
	 hh3c4yO211jc5G1iGIzSk+/rTcbp2hTIbtDYsgA3rOwygHXHRgEWfrhxtWobo0EZko
	 USFD0jKfIQ+xTEvcrE9HmeAseblVIVQkBG4nCZqmngM7HX4BBhxNVJmDlytQjBNP86
	 ComGRaeQ1faVQ==
To: dakr@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org
Cc: aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Kalra <shivamklr@cock.li>
Subject: [PATCH v2 0/3] rust: alloc: add Vec shrinking methods
Date: Sat, 31 Jan 2026 21:10:12 +0530
Message-ID: <20260131154016.270385-1-shivamklr@cock.li>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a resend of v1 [1] to fix threading issues - patches 2-3 were
sent without In-Reply-To headers due to an email quota issue.

This series adds shrink_to() and shrink_to_fit() methods to Vec<T, A>
(and by extension KVVec, KVec, VVec) to allow explicit capacity
reduction for memory reclamation.

Problem:
When elements are removed from a KVVec, the allocated capacity is not
reduced. The underlying C allocators (krealloc/kvrealloc) don't shrink
memory in-place. This can cause significant memory waste in scenarios
with variable workloads.

Solution:
- Patch 1: Adds shrink_to(min_capacity, flags) and shrink_to_fit(flags)
  methods that reallocate to a smaller buffer when beneficial.
- Patch 2: Adds KUnit tests for the new methods.
- Patch 3: Uses shrink_to() in the Rust binder driver to reclaim memory
  when processes are deregistered. Shrinking is triggered only when the
  vector capacity exceeds 128 elements and less than half is used.

This series depends on:
  https://lore.kernel.org/lkml/20260130182842.217821-1-shivamklr@cock.li/

Testing:
- KUnit tests pass (rust_kvec test suite).
- Kernel boots successfully in QEMU with CONFIG_ANDROID_BINDER_IPC_RUST=y.

Changes since v1:
- Resend with correct threading (no code changes).
- Removed base-commit.
- Added explicit lore link to dependency in cover letter.

[1] https://lore.kernel.org/lkml/20260130205424.261700-1-shivamklr@cock.li/

Shivam Kalra (3):
  rust: alloc: Add shrink_to and shrink_to_fit methods to Vec
  rust: alloc: add KUnit tests for Vec shrinking
  binder: context: shrink all_procs vector to reclaim memory

 drivers/android/binder/context.rs |  10 ++
 rust/kernel/alloc/kvec.rs         | 176 ++++++++++++++++++++++++++++++
 2 files changed, 186 insertions(+)

-- 
2.43.0

