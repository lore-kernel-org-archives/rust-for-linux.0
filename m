Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510286;
	b=Bneu81LRpM4CBFk0Pr/imEYTjEzlN+mp8pVT/J3PjgOH/0VUjrRAhmYY6Oyf9LQgdwK3
	 tJkjSqVkysP2F8ix89//3rGow3APS+y006ERsZNomo1UbatmVvehr7d8ZfqnV9DlCZJpa
	 nFmEDxZ7nOhEiZEjWith2VHq/apyMrs2C7gJVv1oxqAmJ3k8IZtYvjcczJEtkBZKZOs5G
	 ksBvVj9h1S/kGDyPwYuJGyZUuj9oqhNoluMTaJhomHAPi9JyhIcU32BZELY8AxHHOZ+4/
	 Rtsu8qnigMh/QgxhT69eAINhOSzzKHcO5EpyFFN7blVG7OILR4xqXnzVVgVPrLQiqUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510286;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VgGcNNRu5ieTR0Ko1HQUd57pN40sF3ITd5hrvhdgaCQ=;
	b=ikJmQ2FjlCHxslRNpvfYCnN4LS17eKpacG+au5iL1QtWkfgyvoYznnPF4UC2NpI9mYw/
	 SoAPz+kPde0Yu0JzlQHG0bJW4YEMhFJFzk9OUBw7Y18vaPn+Rk8CoiBXsKYYfTYg+841F
	 bpHGEnaKBXiII/qWbEmS86Yx4dpe2qoDgjfMAFDSvh7bQ8/cETRBEExtRvsA14UekO1bG
	 bV6FcfKWrXlgP50dqqQmejR9SoiSjrlyrk+JJX5ftkrI2f8Bwzw5JLF4rUYJZdzro6XYL
	 Rsa16JemMKqfEB78bxt1WKn5bxaoV9YmtLNspwCiYxF6pLDpc6Ul/l7WE955szaLZYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=KmJ7XHIK;
	arc=none smtp.remote-ip=185.70.43.171
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A746606A325;
	Tue, 20 Oct 2026 15:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A746606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=KmJ7XHIK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792510281; x=1792769481;
	bh=VgGcNNRu5ieTR0Ko1HQUd57pN40sF3ITd5hrvhdgaCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KmJ7XHIKqQHxNfM4XxFWez3nUojMdbSgQJfpa4XgPk9zDCpGS9itT+wl0Rlcda8XT
	 /KChiw9OeHSocpboRzK54Zlwr12JebAVBYYDVZMg96vzmWiGUJwjFEo4U4mofFwXIq
	 Yj20AXPnEuzndwQULs1zBE7yiKWzq58N29spN98LKteGbrFcSIkimpoh90zzJ35zcu
	 M/hxJ2+RkVzfzg6aoU5vF7cSGM7nvVr47s7jdtkfl9Rp4czwu0tlF/cPkhsL6e22Ak
	 XcoLLhyLKOoyAiFMBOdofobU5wJJaZO2gwvapQaHyWkwHISKx5gsaZ198jy+M9osvQ
	 yyZgLBwT+vhsw==
X-Pm-Submission-Id: 4j8GbQ6Qhfz2ScPL
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
Subject: [PATCH v13 0/7] rust: add ww_mutex support
Date: Tue, 20 Oct 2026 18:29:36 +0300
Message-ID: <20261020153112.299745-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds Rust abstractions for ww_mutex, including Class, Mutex,
AcquireCtx and MutexGuard. AcquireCtxBackoff and ww_transaction handle
deadlock recovery with ordinary guards. DynLockSet tracks dynamically
discovered locks and provides separate acquisition and work callbacks.

Changes in v13:
  - Require static classes and remove the class lifetime parameters from
    Mutex and AcquireCtx.
  - Make AcquireCtx's locking methods safe. Panic on context drop if any
    acquired locks remain and check for acquired-lock count overflow
    before entering C.
  - Tighten AcquireCtx::from_raw()'s safety contract to cover forgotten
    guards.
  - Return Option from try_lock().
  - Split LockSet into AcquireCtxBackoff and DynLockSet in separate
    patches. Add ww_transaction() for allocation-free retries with
    ordinary guards.
  - Start each DynLockSet transaction with a new ticket, keep it unchanged
    across retries and clear pending backoff state on return.

Dropped Alice's Reviewed-by from the Mutex/AcquireCtx patch because the
locking API and safety contracts changed.

Previous version: https://lore.kernel.org/all/cover.1791799751.git.work@onurozkan.dev

Onur Özkan (7):
  rust: add C wrappers for ww_mutex inline functions
  ww_mutex: add ww_class field unconditionally
  rust: implement Class for ww_class support
  rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
  rust: ww_mutex: add AcquireCtxBackoff
  rust: ww_mutex: implement DynLockSet
  MAINTAINERS: add Onur Özkan as WW MUTEX maintainer

 MAINTAINERS                                   |   2 +
 include/linux/ww_mutex.h                      |   8 +-
 rust/helpers/helpers.c                        |   1 +
 rust/helpers/ww_mutex.c                       |  33 ++
 rust/kernel/sync/lock.rs                      |   1 +
 rust/kernel/sync/lock/ww_mutex.rs             | 449 ++++++++++++++++++
 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 179 +++++++
 .../sync/lock/ww_mutex/acquire_ctx_backoff.rs | 413 ++++++++++++++++
 rust/kernel/sync/lock/ww_mutex/class.rs       | 130 +++++
 .../kernel/sync/lock/ww_mutex/dyn_lock_set.rs | 351 ++++++++++++++
 10 files changed, 1561 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/ww_mutex.c
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx_backoff.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/dyn_lock_set.rs


base-commit: 47324d3a5b3abd781295044d01d92d09f184e872
-- 
2.51.2

