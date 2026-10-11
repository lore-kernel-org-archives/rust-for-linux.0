Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E392209F43;
	Sun, 11 Oct 2026 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744029; cv=none; b=CPir08Cv9CuSJxnFH57TG8/ccorwtQIzHlG4rN8joVNcyqEsq53FcHXT1DTlenaH71eG2DrwQrg9ppMsBGbMxsqEHNLc4dBmEheU94zJi4lDDO10cpct/cqNNeGvPmtnBnS23OZbnPWBQPscVLRZwEPnr7HS36J0OyViNMSwBMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744029; c=relaxed/simple;
	bh=irRTRNx7xg+scgKjTO6SCx1vAjam7Xf4sNBqo6BF4ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GK3BTOFr+3dL5aCnMIiqazsCJ+pXuswwrUM0ZfTh+IBfUSvEFQIID4d5Fg0MTK+yAiRUqTE318yDdpcTYqedko+lS2RMwdlSApUHyX7znnIJ8jcmXhjfjNNSHmdjixSlJOmUiB6tiAvlr51CaIr5BfKfPxYQ7yJbSAGw/JxgOBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=dKC79yn5; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="dKC79yn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791744023; x=1792003223;
	bh=tqpl6U1t8l2IlcP9c0L2fBXEpch9lwshr6TF/Y1TPTk=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dKC79yn58XlDcH0Aw7K4WR7qlbj8owTNmZ1xwiSgeGfvIlE2WVkiM79W5c2/qDg/0
	 pHbamvmI3k+m19sDkBjg22IljGCog13GgAohmkinAdTJAPL9l9ytER5jFU7hh2ZK03
	 j8UUFkIXGVDTMsZ2jcUIzkPJYE7eDLBuWZQQ9h93Vc17bfqyj1+yGPOZlewkKWXRkU
	 oygJk0ZsPYQyrF1cdHzRQW3CQq8Oxvn8vJ5tr+y6bzmffirFw/G9c6CaCVuHHGSBwB
	 Mt/6zsDsrioyd9ytL5nbYErNx8bWUbzSk+ZpZoU47mVSM9ZoW4vy0tXB8/u/hZkJvz
	 d5/SKxfKdinaw==
X-Pm-Submission-Id: 4j2qCk0h8Fz2ScPd
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 0/6] rust: add ww_mutex support
Date: Sun, 11 Oct 2026 21:39:18 +0300
Message-ID: <cover.1791743500.git.work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds Rust abstractions for ww_mutex, including Class, Mutex,
AcquireCtx and MutexGuard. LockSet handles deadlock recovery for callers
that need to acquire multiple locks.

Changes in v11:
  - Rebased and dropped the EDEADLK patch, which is already covered by
    the base tree.
  - Removed the slow-path locking APIs and helpers and AcquireCtx::reinit().
  - Relaxed the Mutex Sync bound and fixed the MutexGuard::from_raw()
    safety contract.
  - Made AcquireCtx locking methods unsafe to account for leaked
    guards, and made AcquireCtx::done() safe.
  - Fixed the LockSet double unlock on allocation failure. Deadlock
    recovery now waits for and holds the contended lock before retrying.
  - Made use statements vertical.

Previous version:
https://lore.kernel.org/all/20260103073554.34855-1-work@onurozkan.dev/

Onur Özkan (6):
  rust: add C wrappers for ww_mutex inline functions
  ww_mutex: add ww_class field unconditionally
  rust: implement Class for ww_class support
  rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
  rust: ww_mutex: implement LockSet
  MAINTAINERS: add Onur Özkan as WW MUTEX maintainer

 MAINTAINERS                                   |   2 +
 include/linux/ww_mutex.h                      |   8 +-
 rust/helpers/helpers.c                        |   1 +
 rust/helpers/ww_mutex.c                       |  33 ++
 rust/kernel/sync/lock.rs                      |   1 +
 rust/kernel/sync/lock/ww_mutex.rs             | 443 +++++++++++++++++
 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 148 ++++++
 rust/kernel/sync/lock/ww_mutex/class.rs       | 144 ++++++
 rust/kernel/sync/lock/ww_mutex/lock_set.rs    | 448 ++++++++++++++++++
 9 files changed, 1222 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/ww_mutex.c
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs


base-commit: 47324d3a5b3abd781295044d01d92d09f184e872
-- 
2.51.2

