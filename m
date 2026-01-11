Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325A823EAA0
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768132706; cv=none; b=NrhO7771X68mvtHJtLgydsf/tRqWDaqRtYfumTz/zDtr6WYGkjWWOvdrlAklzlkWUVM1KamgGnMx0lMFwdgbNFjkAC7jGkf1pQqTPJWgPHYpybuvjGm2U3rVJImKzGuo8Q6T0tiv2IOO8nqpJB+cTtA9EIWEMoeDb/VzjbMmWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768132706; c=relaxed/simple;
	bh=qjizffnrTsWUgwOP2jB6ZL6X2+nAEONm5l3e7e/+U+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PSExLFZob+NytHu5cu5bNjbweIYpCqwQpra10rpTMTjB7+bU7CRkiVlgSSlvSw/PVzMrOrm25VIDZHiOFKVxI7TSJaAxjgskLTobwdfNcsN6G/Lm8wmax6J/aHt3j0XgI3WvOlEGb4oDmvYWyvT2IH+XsxguH71gEseV86htUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dD6TGemo; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dD6TGemo"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b2627269d5so627985485a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 03:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768132704; x=1768737504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m/tVoFoAsyGl7tOQXje6ixSZpOKnObNz8yY+wbg7wrM=;
        b=dD6TGemoNGu+oFdbRQf7JOdRC8wdAFi4+nKYx3qoVJKpTfIjMJotMMe8DnVbCMMD9I
         pXLNQFOM3xkC4l5SlzPTfwFmU9RA3gI6DPSp8f6qhLPRtk+ROj5OFJdxMWiaD5KgZOT3
         78jwE0xHzknBfTDidsojMHtX7k4CjLk+xdmeM7tsPCZ4LdOklt8uGV6TXHn+ELa2mtKs
         ExqUsVNb/f1j8yUOsZa2JAD4TI3y4dPoJzNDZstCIAEItB7Or/O7+IwP9LqESCZXjcT2
         6S68wVbjAeM1sF7bBKZwNyoH/atM/t+naahmfWc2dqcXucYE9wfeO+rPAsh4kJRi4+DM
         ofOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768132704; x=1768737504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:feedback-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m/tVoFoAsyGl7tOQXje6ixSZpOKnObNz8yY+wbg7wrM=;
        b=c0fJApzJ9+GcSVtyyqx24xE6cas6So5S7czjrPdkebTT1xhj7QkIrKKbqpNrkYVxvg
         bpODoaZfQ8yKgbhQWWEfR+zIwpNufapmnP0JstPzWuiEQImGXKKMacpSqmoTzq6jq8Qa
         llfnDMvEaKX0jar9VpIXx6vgMzCTbNoBh5kYoQ/Dk9hWDHlpT8gw1+ui+6Ed3y3FxWh8
         836JMxx4jVUhaXq+FOtTp2HzZQyuGIopVAx/hf5JJJuHaUmEituoLh9RFwRbP9PqfQSl
         +aRh0h/h3kgRGI/Fzw5mbtCW8LaVMoKNi6ZxUiPjjPThuSWtdY6kkkNaw3tUckOmwUN+
         hBJQ==
X-Gm-Message-State: AOJu0YxipKG2bmzWqz0i9PphAO89bcdUF3YDegv035y5UAv7//Z4vvG8
	XKW68P27yYNdy7ZCHicQz0rgOKKwFqttlyND+dXgogPestwXnLvI29hw
X-Gm-Gg: AY/fxX57z23mRtX9HTnOmwyzW/VoJxiBKFPrHMztPaxLX/boEWavZH5K31KdkfsQIEs
	QX80yErluilRaLOG5fSrJ+gMwGI7X1M9c7UgGizlkc8VAG57vvMLakhOkxYYyoNc13gAt/o20e1
	n9WSjeFZL6/o23f+6ZEpK8ThPP8G2EQaR5eSxVTuWrjpamqZRb54E8GbwlA9HO6GTX4sdBk4j+s
	9pK4u+rjRn2AsSD+tqYrdvFFtz4qOxpHP+Ge6bhmYHiobY+DwaYiSxHXh5fLOd4dxxvktwy7fKk
	IA3/Su/M19jOHzVn8MV+tbJF4x8rG3tRyDg95BzaMitllfotg+EXVsIJMXGBD8G4XQh/A9UMPjN
	mHS3b9FOn1HPqwXulX29jhC0mLU84yFFhqe4XsbQTzY2+HpAO1LXxeiTmyD/923oXZ56JQXFNEl
	tKVKyK06xNYW5FfDey348ayfBoKHYzqJ0VfqA9XKOOxLvIOVFjkl04o4XPpbdimPKQXMJDjGo9Q
	FjXJn/+3JS0yCY=
X-Google-Smtp-Source: AGHT+IHx14tCeKNCUgIU53xPQBZH30EDK0r0/sqCDEiO0OLa+kt5JNOWMmJUXgk59ZGGwktqIcARyg==
X-Received: by 2002:a05:622a:4d:b0:4ed:bbca:fdff with SMTP id d75a77b69052e-4ffb47d78e0mr178470641cf.9.1768132704044;
        Sun, 11 Jan 2026 03:58:24 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e6ce5asm106604971cf.33.2026.01.11.03.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 03:58:23 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id B8724F40068;
	Sun, 11 Jan 2026 06:58:22 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 11 Jan 2026 06:58:22 -0500
X-ME-Sender: <xms:XpBjaULwXL0pH7xQ0i98Vyzn9cznwkCWTN1W9TyGGlG7eMAfkU7dVA>
    <xme:XpBjaZXfxQlJUd2AyCuYBXmCRjtBlYUhRbGt8OLBbb7gnL1L1TeAGR3aiHNLATAOh
    mRhcofFpnVHfHcPjiSQY_2_45T6pFvmluC8fuXmQT5o2K8D_WSp>
X-ME-Received: <xmr:XpBjaYGY5mLKIytz0qM3cbGEHF90nFD2I1FX3kmca1Qo2CnV9BV-3wXj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudegheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeeggeeukeeghfevudektdevjeehhfekffevueefudeivdelteeltdekheejgfeiveen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedu
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrkh
    drrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhuthhr
    ohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:XpBjaQ4UPVwrpZC37c1zjkIPJ7nyQYpetCP8LuV_nCfhoCizmvfd2Q>
    <xmx:XpBjaWexaallle4T2H5nEriBbQQd7YK-kgOkAISaWTFyuKmqNieT2Q>
    <xmx:XpBjacmSNzWw-VjFB8rPxpL5lwIFuZRqkTRzZybRezZSNBmL5yJriQ>
    <xmx:XpBjab-mkXhOrU4uUziEdnYlN3LbhvvUp9A9wbrfyjw_jpCvaB4_rw>
    <xmx:XpBjaSGuHBN86AJmuS0t4PKGQNpFIBeXZIe4F0yqp5Ft_e6R8F3LrT3S>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jan 2026 06:58:22 -0500 (EST)
From: Boqun Feng <boqun.feng@gmail.com>
To: "Peter Zijlstra" <peterz@infradead.org>,
	"Ingo Molnar" <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Will Deacon" <will@kernel.org>,
	"Mark Rutland" <mark.rutland@arm.com>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Andreas Hindborg" <a.hindborg@kernel.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [GIT PULL][PATCH 00/36] Rust synchronization changes for v7.0
Date: Sun, 11 Jan 2026 19:57:32 +0800
Message-ID: <20260111115808.5702-1-boqun.feng@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Peter,

Please pull the following changes of Rust synchronization for 7.0 into
tip/locking/core, you can find the details of the changes in the git tag
message below.

Thanks!

Regards,
Boqun

----------------------------------------------------------------

The following changes since commit a45026cef17d1080c985adf28234d6c8475ad66f:

  locking/local_lock: Include more missing headers (2026-01-08 11:21:57 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ tags/rust-sync-7.0

for you to fetch changes up to ccf9e070116a81d29aae30db501d562c8efd1ed8:

  rust: sync: Inline various lock related methods (2026-01-10 10:53:46 +0800)

----------------------------------------------------------------
Rust synchronization changes for v7.0:

- Add support for Atomic<i8/i16/bool> and replace most Rust native AtomicBool
  usages with Atomic<bool>, and further switching will require Atomic<Flag>
- Clean up LockClassKey and improve its docs
- Add missing Send and Sync trait impl for SetOnce
- Make ARef Unpin as it is supposed to be
- Add __rust_helper to a few Rust helpers as a preparation for helper LTO
- Inline various lock related functions to avoid additional function calls.
-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmljjIkACgkQSXnow7UH
+rizPQgAi5rdVoIpjN9BaQtWVHcAwBhbD7WhboxDhsSdEl3yaw0E7OLML5IyupLP
BUsrI5BAhwUaIpE/4PT9RePLCOeFqCKfz9eyQpb6uEwLVKcx8WESrItrlStqK8dG
lAZEV07SwAWq/ARsgI02LZnyDQxxBrX8Q4FKZgglpaBxieVXmQjekcSF2W6s3lka
qWXB7MU38D3DZjKr6Lpp8BjdI7qTNInEZDGtRPncIId+4Jj7V5IpEX/NThyrDLp1
M0UzXOMzexIfeSm3oz95II6R+GeDpruI6pN8QDtljaTL0Al5/z5yO8Zj9KIPGAl4
9JRUJ0pNVrAUljjJ4ap8hIMPlOWqjw==
=JOZ1
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Alice Ryhl (16):
      rust: sync: Refactor static_lock_class!() macro
      rust: sync: Clean up LockClassKey and its docs
      rust: sync: Implement Unpin for ARef
      rust: barrier: Add __rust_helper to helpers
      rust: blk: Add __rust_helper to helpers
      rust: completion: Add __rust_helper to helpers
      rust: cpu: Add __rust_helper to helpers
      rust: processor: Add __rust_helper to helpers
      rust: rcu: Add __rust_helper to helpers
      rust: refcount: Add __rust_helper to helpers
      rust: sync: Add __rust_helper to helpers
      rust: task: Add __rust_helper to helpers
      rust: time: Add __rust_helper to helpers
      rust: wait: Add __rust_helper to helpers
      rust: helpers: Move #define __rust_helper out of atomic.c
      rust: sync: Inline various lock related methods

Boqun Feng (1):
      arch: um/x86: Select ARCH_SUPPORTS_ATOMIC_RMW for UML_X86

FUJITA Tomonori (19):
      rust: sync: set_once: Implement Send and Sync
      rust: helpers: Add i8/i16 atomic_read_acquire/atomic_set_release helpers
      rust: helpers: Add i8/i16 relaxed atomic helpers
      rust: helpers: Add i8/i16 atomic xchg helpers
      rust: helpers: Add i8/i16 atomic xchg_acquire helpers
      rust: helpers: Add i8/i16 atomic xchg_release helpers
      rust: helpers: Add i8/i16 atomic xchg_relaxed helpers
      rust: helpers: Add i8/i16 atomic try_cmpxchg helpers
      rust: helpers: Add i8/i16 atomic try_cmpxchg_acquire helpers
      rust: helpers: Add i8/i16 atomic try_cmpxchg_release helpers
      rust: helpers: Add i8/i16 atomic try_cmpxchg_relaxed helpers
      rust: sync: atomic: Prepare AtomicOps macros for i8/i16 support
      rust: sync: atomic: Add i8/i16 load and store support
      rust: sync: atomic: Add store_release/load_acquire tests
      rust: sync: atomic: Add i8/i16 xchg and cmpxchg support
      rust: sync: atomic: Add atomic bool support via i8 representation
      rust: sync: atomic: Add atomic bool tests
      rust: list: Switch to kernel::sync atomic primitives
      rust_binder: Switch to kernel::sync atomic primitives

 arch/x86/um/Kconfig                        |   1 +
 drivers/android/binder/rust_binder_main.rs |  20 ++---
 drivers/android/binder/stats.rs            |   8 +-
 drivers/android/binder/thread.rs           |  24 +++--
 drivers/android/binder/transaction.rs      |  16 ++--
 rust/helpers/atomic.c                      |   7 +-
 rust/helpers/atomic_ext.c                  | 139 +++++++++++++++++++++++++++++
 rust/helpers/barrier.c                     |   6 +-
 rust/helpers/blk.c                         |   4 +-
 rust/helpers/completion.c                  |   2 +-
 rust/helpers/cpu.c                         |   2 +-
 rust/helpers/helpers.c                     |   3 +
 rust/helpers/mutex.c                       |  13 +--
 rust/helpers/processor.c                   |   2 +-
 rust/helpers/rcu.c                         |   4 +-
 rust/helpers/refcount.c                    |  10 +--
 rust/helpers/signal.c                      |   2 +-
 rust/helpers/spinlock.c                    |  13 +--
 rust/helpers/sync.c                        |   4 +-
 rust/helpers/task.c                        |  24 ++---
 rust/helpers/time.c                        |  14 +--
 rust/helpers/wait.c                        |   2 +-
 rust/kernel/list/arc.rs                    |  14 ++-
 rust/kernel/sync.rs                        |  74 +++++++++++----
 rust/kernel/sync/aref.rs                   |   3 +
 rust/kernel/sync/atomic/internal.rs        | 114 ++++++++++++++++++-----
 rust/kernel/sync/atomic/predefine.rs       |  55 +++++++++++-
 rust/kernel/sync/lock.rs                   |   7 ++
 rust/kernel/sync/lock/global.rs            |   2 +
 rust/kernel/sync/lock/mutex.rs             |   5 ++
 rust/kernel/sync/lock/spinlock.rs          |   5 ++
 rust/kernel/sync/set_once.rs               |   8 ++
 scripts/atomic/gen-rust-atomic-helpers.sh  |   5 --
 33 files changed, 462 insertions(+), 150 deletions(-)
 create mode 100644 rust/helpers/atomic_ext.c
