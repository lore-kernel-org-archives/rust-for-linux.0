Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FBE149C7B
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772569032; cv=none; b=NP7s0zlZ1g9SB4pLXq+7v1txWnLyZUIFbNSS/KwdRb6fOoCq8ahAfWKRhzN9jsZ4BqEonsZFo99nKOi6qi1jGlth064lOh8ok0HQIJS7Vt3MuJ221XuCtcxwfcQY2LQF1CCrh3mV1zfvVBlDjbCYdm9jpmFsZFwNH+UZDzw2Osc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772569032; c=relaxed/simple;
	bh=ptzx0y1NKx0KGkxNdXTads5IyhRsJEEU8j4KEySsvRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X79hPBZkYYoo7kdKx1pWuo3XPvek3d72JFl3MSobICmz49a3EDQ6Hkj+UiTrf4bWuvWHImyjAzsED1IaijLmiD/nkJ4CdsbCVw9GHrK9Vo041Z+9yQyMVh36LpP9MCajZCL7Gn0JBfgMOKljyNaxpSabX7Ct5T4hUUGqtGZBpoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V98o5MIH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V98o5MIH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519A5C19425;
	Tue,  3 Mar 2026 20:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772569031;
	bh=ptzx0y1NKx0KGkxNdXTads5IyhRsJEEU8j4KEySsvRY=;
	h=From:To:Cc:Subject:Date:From;
	b=V98o5MIHUne1yqMWVYPmgjJXsFplROVdq8bQLkyOuXW+06EsI1RSi+nJGlwNrxkZ6
	 jrlfJiDAOIONBFWt/z3mtCASqjZ9sCrCT9LCmy9chzRqvHGf+9YZgx0ve/93q1SQfN
	 nX8SsCZw8VoK5IV8l9EWGGwTdR0urod7inYbAfPAJUKCXRCD6pp7BXMpJZqZdtUQ7v
	 hd1FrN27jOOm9rsfXYz3VC/HtZhB4TCV1zrUND84iJ7rgVjkaS31VfCtqwUuUPaKbK
	 ZKEcuXSzv5G+6ahEcRP7Q3Me5x9fZiJg5ULo/CD94547XNEVGdpbJTmBhDqFxtf1xg
	 z8m6oDqkhWs2Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5F016F40068;
	Tue,  3 Mar 2026 15:17:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 03 Mar 2026 15:17:10 -0500
X-ME-Sender: <xms:xkGnab2GZ2mJTNYWLVw-3bv-YseklwJ7w4QfVvFc8dXKX8gITwEuLg>
    <xme:xkGnaRr871b0CLq3iKllrdKCUMXNjSfFm0y9RDGZR9CeIAue58envGe7aqlWWP7X8
    65hGb1EKMGT3liCkVWMFyvMHlcrhb_EbWSKEf9hIMFAjB38hjJbD08>
X-ME-Received: <xmr:xkGnabi9UK8eDMTFAzSptEhFxECfTCS1GrpoWkbiOOZok1GWwZtYSyH74g1sX-NmPqggpwNI7Lyhh0PY88PIhM0NqzVOCbOJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffhe
    ffjedvuddtffeguedtudehieejhffgkeevteefvefhfeehiefgteduueefkeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrhhnvg
    hlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudeipdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhk
    rdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepsghoqhhunheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghh
    esphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:xkGnadl2J1mZOlQFrqMhf4Fq6KySJ7gR86ONALkYqYKmUxlRSNkPEg>
    <xmx:xkGnaUoY8jz78y-OdvQZmm2z15iwxPeUG_AYqRpabaCgbcY0uywX3g>
    <xmx:xkGnaZIRpeQdhbMJStbpV5XmfWfSg5ALslWrevfMf1I_j_JcpWQctQ>
    <xmx:xkGnaQDDpey34zyencRVD-XEVebvr7hLcF-wZjD2bHAARIT0UAxL5w>
    <xmx:xkGnab5SLEW1s2YUCdhx4vR1wVHbSv6HgNO1MN2npFPQRbe9mIfSvLQK>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 15:17:09 -0500 (EST)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] [PATCH 00/13] Rust atomic changes for v7.1
Date: Tue,  3 Mar 2026 12:16:48 -0800
Message-ID: <20260303201701.12204-1-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Peter,

Please pull these changes of Rust atomic in v7.1 into tip/locking/core.
Major changes are the atomic pointer support and a boolean-like
AtomicFlag type (using a byte if arch support efficient xchg/cmpxchg
over bytes otherwise 4 bytes). Thanks!

Regards,
Boqun


The following changes since commit 3dcef70e41ab13483803c536ddea8d5f1803ee25:

  ww-mutex: Fix the ww_acquire_ctx function annotations (2026-02-27 16:40:20 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-atomic.20260303a

for you to fetch changes up to 68d1c8ac7f0b1f0de92a803b9b71090fd1b86d17:

  rust: atomic: Update a safety comment in impl of `fetch_add()` (2026-03-03 11:55:57 -0800)

----------------------------------------------------------------
Rust atomic changes for v7.1

* Add Atomic<ptr> support.
* Add an AtomicFlag type for boolean-like usage with
  architecture-specific performance optimization.
* Add unsafe atomic operations over raw pointers.
* Add `fetch_sub()` for atomic types.
* Documentation and example improvements.
-----BEGIN PGP SIGNATURE-----

iQFFBAABCAAvFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmmnPU0RHGJvcXVuQGtl
cm5lbC5vcmcACgkQSXnow7UH+rgKrgf/UNZb0CmIG7d2jN1GsTHwYa8disAGlWFk
KOSTMNn83WICVhIIqUqrRcvSzR0FLwpp1jOH0lMYzZlfxQBOIoVc82xXD2SLLjAa
2VS/vknOitxAsChFceKs7w+hcQD168xSbDqo/dSxI/KO+OMQUxLqTW0zKTVYZhij
JIfv57Nv1331J+gnwici6/q3cBqP14Hv968cZ5Dw8tqWJMpMuqJPQLsgKg5um6Y0
hzpgXLkkB8Vg02qku/YdkcBFCvxWz5CifOpmLWNum+B82emELHmKhpOUdticuWof
iUkqygu4Un+QAcKb+8LG3L30UW3GBw4kEHpb357jc/EqZHvhX5aEYg==
=CYTx
-----END PGP SIGNATURE-----

----------------------------------------------------------------
Andreas Hindborg (3):
      rust: sync: atomic: Add fetch_sub()
      rust: sync: atomic: Update documentation for `fetch_add()`
      rust: atomic: Update a safety comment in impl of `fetch_add()`

Boqun Feng (7):
      rust: sync: atomic: Remove bound `T: Sync` for `Atomic::from_ptr()`
      rust: helpers: Generify the definitions of rust_helper_*_{read,set}*
      rust: helpers: Generify the definitions of rust_helper_*_xchg*
      rust: helpers: Generify the definitions of rust_helper_*_cmpxchg*
      rust: sync: atomic: Clarify the need of CONFIG_ARCH_SUPPORTS_ATOMIC_RMW
      rust: sync: atomic: Add Atomic<*{mut,const} T> support
      rust: sync: atomic: Add atomic operation helpers over raw pointers

FUJITA Tomonori (3):
      rust: sync: atomic: Add example for Atomic::get_mut()
      rust: sync: atomic: Add performance-optimal Flag type for atomic booleans
      rust: list: Use AtomicFlag in AtomicTracker

 rust/helpers/atomic_ext.c            | 158 ++++++------------
 rust/kernel/list/arc.rs              |   8 +-
 rust/kernel/sync/atomic.rs           | 310 +++++++++++++++++++++++++++++++++--
 rust/kernel/sync/atomic/internal.rs  |  44 +++--
 rust/kernel/sync/atomic/predefine.rs | 109 ++++++++++++
 5 files changed, 496 insertions(+), 133 deletions(-)
