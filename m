Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A1D35295C;
	Fri, 30 Jan 2026 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769806529; cv=none; b=kREcq6oq1LQaemGa0ejcJlaMo9FCISajoO5/btem6JPeGKgH/FmY1oCaLfONCUpcWhfivPV+zdzT2ZxmfnZM1zwlY3O3q4iTk6Q/M0deZsVDdnhPEPfM+fcEm4eDXp9ieL9+lYbaEJri82CEUjoaQEhBy35NfMY/QQ1GB7b7rXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769806529; c=relaxed/simple;
	bh=JEKX+uZ6xUWa1+bFyq0o6FNy1oppgDxhJo6Ie3i/JFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e+XmTVkrHrenxItO+iO2xR2QqiBKtG7yVaLF89tVfTE8auUCGPO0ftP4BMCtxvLaeohlC5j6lPte3xILUu+gee2pOdqyR9Tx2WIr/LXhPfWmmsZnA0q/wjwcy37dH4BPRu05UCx8Px7LVoe7cqU7OPhXOipu/rtzwbM29P9kvZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=zT/gQ64c; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="zT/gQ64c"
From: Shivam Kalra <shivamklr@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1769806521; bh=JEKX+uZ6xUWa1+bFyq0o6FNy1oppgDxhJo6Ie3i/JFc=;
	h=From:To:Cc:Subject:Date:From;
	b=zT/gQ64cwbhp8dyn0vQJR9t4gwfTUj+eFAi855uDYPHvujI769dE0omQ3mn9Nd5N/
	 p4rjei1aPu4w1LSC7qFaoiek5W7oH1ZvTcS7URbSUDoi+FJjrcETw80ciG/l+13exD
	 5jJxodu4cCEN1dXKyK8EEWb3R185ISffPBxyHGy2MBXTbj+IGyGhDkTe67PBJ0oiyN
	 TCBlhxQqq6bKiriPWO24TTWxN2QRQrGDbnXbmE1GiaEpVtU1TIt47pNorChj2k3SfK
	 04cf8o4TAZB23LqhYjkX6OiZaWAj7pbjorglVOvfe1P5mvl3cr44VioJbpdlppZxlV
	 aHkTna2ofjGlg==
To: dakr@kernel.org,
	cmllamas@google.com,
	gregkh@linuxfoundation.org
Cc: aliceryhl@google.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Kalra <shivamklr@cock.li>
Subject: [PATCH v1 0/3] rust: alloc: add Vec shrinking methods
Date: Sat, 31 Jan 2026 02:24:20 +0530
Message-ID: <20260130205424.261700-1-shivamklr@cock.li>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds shrink_to() and shrink_to_fit() methods to Vec<T, A>
(and by extension KVVec, KVec, VVec) to allow explicit capacity
reduction for memory reclamation.

Problem:
When elements are removed from a KVVec, the allocated capacity is not
reduced. The underlying C allocators (krealloc/kvrealloc) don't shrink
memory in-place. This can cause significant memory waste in scenarios
with variable workloads - e.g., a driver managing processes that spikes
to thousands and drops back down.

Solution:
- Patch 1: Adds shrink_to(min_capacity, flags) and shrink_to_fit(flags)
  methods that reallocate to a smaller buffer when beneficial.
- Patch 2: Adds KUnit tests for the new methods.
- Patch 3: Uses shrink_to() in the Rust binder driver to reclaim memory
  when processes are deregistered. Shrinking is triggered only when the
  vector capacity exceeds 128 elements and less than half is used, to
  avoid repeated reallocations for small process lists.

Testing:
- KUnit tests pass (rust_kvec test suite).
- Kernel boots successfully in QEMU with CONFIG_ANDROID_BINDER_IPC_RUST=y.
- The binder driver loads and logs "rust_binder: Loaded Rust Binder."

This series depends on commit a2477dc74d871 ("rust_binder: fix needless
borrow in context.rs") which is currently pending on char-misc-next.

Shivam Kalra (3):
  rust: alloc: Add shrink_to and shrink_to_fit methods to Vec
  rust: alloc: add KUnit tests for Vec shrinking
  binder: context: shrink all_procs vector to reclaim memory

 drivers/android/binder/context.rs |  10 ++
 rust/kernel/alloc/kvec.rs         | 176 ++++++++++++++++++++++++++++++
 2 files changed, 186 insertions(+)


base-commit: a2477dc74d871ed4e5c20d9160586dc475182674
-- 
2.43.0

