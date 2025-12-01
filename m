Received: from forward201d.mail.yandex.net (forward201d.mail.yandex.net [178.154.239.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519D42E8B81;
	Mon,  1 Dec 2025 10:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764585336; cv=none; b=Blu7AARDiY25w92Q5yDH5/z0OZLg7TQB+9yzb1ZYCI2XXo67AHaGrsZjZndmEUWrk5dL19Eq8hgDQx3bd2RUp3zMyMbv5Wrlvw6ILieZNQbTWrKhYpVMsP4w+FSfgZ/5XPqIbJ1Spr19IsPHxy1H+aEsmmbJ/dxDseMjDiWZjw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764585336; c=relaxed/simple;
	bh=QDe3uA7srMmuakmye5eSUUkl4635WX1TqZ0UjE6vaqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NnJgFrJOdlv/4bvZyzXMDVULw1vXz95mJjWIFq0XNBNItMwigfdDnjZk8onLpEhDNma5lBBoAawkewcowvmtZWtAZy1Q7GpUhyAhuHPwF6W95gwJ3Mkbq5yJxSvZtS7RNPaLmgqdza6cMcfgTLG2sRyswahDysMLUuLlty50BuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=YiA2qk/u; arc=none smtp.client-ip=178.154.239.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="YiA2qk/u"
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d102])
	by forward201d.mail.yandex.net (Yandex) with ESMTPS id 119CC827EF;
	Mon, 01 Dec 2025 13:29:15 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8a9a:0:640:e327:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id 1EAF3C0226;
	Mon, 01 Dec 2025 13:29:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id wSfJU4kLMiE0-BSsZeE1X;
	Mon, 01 Dec 2025 13:29:05 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764584946;
	bh=Zf0ieINGDDfdgXQMZJUlzk5BZyTbwxthZsFLKKt2wjM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=YiA2qk/uy+7EJj5R4dnVLBt9YmHF5qizmkMlxNsx6ZLzT6f1WCeMDGAxS02S+ZXjc
	 ZNa9zBkGgW6SmKGjGOSRSfc4iKWffWcykXz/6fXKm67Rl4VtpbomDN8lQZPlkfZ+iG
	 66yFo0xiTgRgVn1wmOd+uNNwj+3hjpJCioINTG5Y=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: lossin@kernel.org,
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
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v8 0/6] rust: add ww_mutex support
Date: Mon,  1 Dec 2025 13:28:49 +0300
Message-ID: <20251201102855.4413-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I would like to request becoming a maintainer of this work.
If this is acceptable, please let me know so that I can add
myself to the MAINTAINERS file in the next revision.

See the changes of this version below.

Changes in v8:
  - Various minor updates (e.g., doc updates, removing unnecessary
    lifetime annotations, etc.).
  - Changed C implementation to always provide ww_class field in
    ww_mutex and ww_acquire_ctx types so we can access it from Rust
    easily.
  - Locking functions are now safe to call.
  - Added class validation logic to ww_mutex::lock_common.

Changes in v7:
  - Split Class and AcquireCtx into separate modules.
  - Removed "Ww" prefixes from type names.
  - Renamed exec.rs -> lock_set.rs and ExecContext -> LockSet.
  - Removed transmute logic from LockSet (formerly ExecContext).
  - Improved various doc-comments.
  - Marked certain AcquireCtx functions as unsafe.
  - Added from_raw constructors for Mutex, MutexGuard, AcquireCtx
    and Class.
  - LockSet::cleanup_on_deadlock no longer triggers reallocations when
    reinitializing AcquireCtx.
  - Incorporated various minor improvements suggested on the v6 series.

Changes in v6:
  - Added `unpinned_new` constructor for `WwClass` and updated
    global macros.
  - Changed all tests (and docs) to use Arc/KBox instead of
    `stack_pin_init` for `WwMutex` and `WwAcquireCtx`.
  - Added `LockKind` and `lock_common` helper to unify locking logic.
  - Added context-based and context-free locking functions for `WwMutex`.
  - Added `ww_mutex/exec` module, a high-level API with auto `EDEADLK`
    handling mechanism.

Changes in v5:
  - Addressed documentation review notes.
  - Removed `unwrap()`s in examples and KUnit tests.

Onur Özkan (6):
  rust: add C wrappers for ww_mutex inline functions
  ww_mutex: add `ww_class` field unconditionally
  rust: error: add EDEADLK
  rust: implement Class for ww_class support
  rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
  rust: ww_mutex: implement LockSet

 MAINTAINERS                                   |   1 +
 include/linux/ww_mutex.h                      |   8 +-
 rust/helpers/helpers.c                        |   1 +
 rust/helpers/ww_mutex.c                       |  39 ++
 rust/kernel/error.rs                          |   1 +
 rust/kernel/sync/lock.rs                      |   1 +
 rust/kernel/sync/lock/ww_mutex.rs             | 449 ++++++++++++++++++
 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 172 +++++++
 rust/kernel/sync/lock/ww_mutex/class.rs       | 156 ++++++
 rust/kernel/sync/lock/ww_mutex/lock_set.rs    | 383 +++++++++++++++
 10 files changed, 1205 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/ww_mutex.c
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs

-- 
2.51.2

