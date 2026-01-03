Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [178.154.239.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FDB26F291;
	Sat,  3 Jan 2026 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767425779; cv=none; b=bp++rawVTmnNrMwhXNVKcwzEO0Z2HW++c/j9uU2hx+yur44SOV7zAxH3v9yWIk+EjBuwFXM1vy+NnDcqK/7iYso50kKMm6EALkkuyf1qOvxp/9vGA9Du2958JED0LNglXBAIWtxnSIKc457R5HkRGtWed/7JXKB6Y2KMmbtyZC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767425779; c=relaxed/simple;
	bh=VyeyRR5MkUrMn2qwYF/GgohGVJJQKC0fZlq1uNRdZ8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pVO/AUe/qzEdWBcZ21dOsFG3MsZNolgpckX8Z0YcpewjhmWCbXl3A8apv19J6SH9nFeYyScT9dW7FzlifRyvLG/qYVjeL3JhKvSpgPp3peuz577ehtO9k01iwzaa1YxmFdX5jAwFPzXlNNm0idSrhBq9DCY74WZWXQT7mGSr+/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=SO5z122F; arc=none smtp.client-ip=178.154.239.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="SO5z122F"
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 3BAE7C018C;
	Sat, 03 Jan 2026 10:36:13 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id vZgUW4MHrmI0-9ZrMdzfW;
	Sat, 03 Jan 2026 10:36:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767425772;
	bh=gkM6HdmxZHvw0CgdP6M+fy8V8K8qa62TwmxG+Ej1WI0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=SO5z122FOEVYK29smtqGyWPWEKWYMbvdUf3XReuC+ZVtvS+u/ioIvshnxeFVuwHu6
	 uNhge4/gRWVHmw2xsXiZ+Skl4hNftTBuZkk2Vb+CABlf8zudYVjgbjHSA8TRQgtdDl
	 NIb6bHU4F+0KaF1dSetoh/RzRdYMTtF+ss6Z+Z8E=
Authentication-Results: mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH v10 0/7] rust: add ww_mutex support
Date: Sat,  3 Jan 2026 10:35:47 +0300
Message-ID: <20260103073554.34855-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v10:
  - Added missing reviewed-by tags.
  - Fixed git conflict resolution leftovers [1].

[1]: https://lore.kernel.org/all/202601030632.SukxzGNs-lkp@intel.com/

Changes in v9:
  - Added `__rust_helper` prefixes to `ww_mutex.c`.
  - Reworked on Class to remove pinned initialization functions
    and added documentation suggesting its use as a global variable
    as this is its only usage on the C side.
  - Added myself as a maintainer of WW Mutex.
  - Various minor updates (commit description updates, minor code
    rearrangements, etc.).

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

Onur Özkan (7):
  rust: add C wrappers for ww_mutex inline functions
  ww_mutex: add ww_class field unconditionally
  rust: error: add EDEADLK
  rust: implement Class for ww_class support
  rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
  rust: ww_mutex: implement LockSet
  MAINTAINERS: add Onur Özkan as WW MUTEX maintainer

 MAINTAINERS                                   |   2 +
 include/linux/ww_mutex.h                      |   8 +-
 rust/helpers/helpers.c                        |   1 +
 rust/helpers/ww_mutex.c                       |  45 ++
 rust/kernel/error.rs                          |   1 +
 rust/kernel/sync/lock.rs                      |   1 +
 rust/kernel/sync/lock/ww_mutex.rs             | 444 ++++++++++++++++++
 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 172 +++++++
 rust/kernel/sync/lock/ww_mutex/class.rs       | 139 ++++++
 rust/kernel/sync/lock/ww_mutex/lock_set.rs    | 370 +++++++++++++++
 10 files changed, 1177 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/ww_mutex.c
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs

-- 
2.51.2

