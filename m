Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A510E279DC4
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Jul 2025 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874441; cv=none; b=Cf2zqyv7yLsb9WSHixtK+SSnTaV3JHrYILljmEY23FG0JjrY6D9OzxaMs2K3+0NLojNRwSLRQGJLfPmGKgv6mnm8S4ES9l+LggFv7TVPiPmiIqyDWNr9ZAN6gM9cg5TjBxOXQ4VZ5rxIh+lrbzQTx/kIitT0bDZaOZGu4bz3jvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874441; c=relaxed/simple;
	bh=9f1OIDyiMOGG+sJ0+utZUcOkV1Z2Vx//DRhMPVy8KsQ=;
	h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type; b=B/r76FYaPEGAROHG7az9nGFTU9BNRBS4CN9WlDtv1ow94XXi5uwtjf4ChmxPcHOe8ZFGloIPPX2cePOsIiej/yNyKnlXBCDLnxYqwTeaCv3cMXjHuAhc5tWbIUR8/C/vgKG0v+gbHTV0M7qkUfVa27rJk0DmFPKAa4FwsaPiogM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0eRl2zC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0eRl2zC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA3DC4CEE3;
	Mon,  7 Jul 2025 07:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751874441;
	bh=9f1OIDyiMOGG+sJ0+utZUcOkV1Z2Vx//DRhMPVy8KsQ=;
	h=From:To:Cc:Subject:Date:From;
	b=f0eRl2zCKAvlc+3Y2SPN8fCsB7QMW+522gtpAKS7jsyHBjc6LGrxzj2pZPLJNL4l3
	 S0B47Oa1i9FqaFeAaIOLbW+Vgj6HKb2dgnuR+705jA+lm5SkddnCjGo4h0B6z5fC5D
	 sYYrYNV1K7S0CVTcaa238eIDrZZiyC7xdOVarxStzZ1/o4kVduuZqXwK5amVqwHNr9
	 bbjfEOScdUl+iR4mn8xTCO9iLHS7nFYLRKcuN+E8Gf9RDMllur+RhyHieskowJzE07
	 DL3Nm06LKVsCBRx3xZeAW3flRYHp95qOiHESodVrK+ghfPfzF5INzj1SFSjAu2Ec+Q
	 O4i72AHsu6+PQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	rust-for-linux@vger.kernel.org,
Subject: [GIT PULL] Rust timekeeping for v6.17
Message-ID: <87qzysqw99.fsf@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 07 Jul 2025 09:46:47 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Miguel,

Please pull these changes for Rust timekeeping.

This batch of changes makes `Instant` generic over the clock source.
`HrTimer` also gets the generic treatment, allowing the API to type
check the time stamps passed to the API, to statically check whether a
relative or absolute time is required.

We also have a fix for 32-bit divisions on 64-bit architectures.

The commits have been in linux-next for at least a week.

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  ssh://github.com/Rust-for-Linux/linux.git tags/rust-timekeeping-for-v6.17

for you to fetch changes up to d4b29ddf82a458935f1bd4909b8a7a13df9d3bdc:

  rust: time: Add wrapper for fsleep() function (2025-06-30 13:22:05 +0200)


Best regards,
Andreas Hindborg



----------------------------------------------------------------
rust-timekeeping for v6.17

----------------------------------------------------------------
FUJITA Tomonori (10):
      rust: time: Avoid 64-bit integer division on 32-bit architectures
      rust: time: Replace ClockId enum with ClockSource trait
      rust: time: Make Instant generic over ClockSource
      rust: time: Add ktime_get() to ClockSource trait
      rust: time: Replace HrTimerMode enum with trait-based mode types
      rust: time: Add HrTimerExpires trait
      rust: time: Make HasHrTimer generic over HrTimerMode
      rust: time: Remove Ktime in hrtimer
      rust: time: Seal the HrTimerMode trait
      rust: time: Add wrapper for fsleep() function

 rust/helpers/helpers.c              |   1 +
 rust/helpers/time.c                 |  35 +++++
 rust/kernel/time.rs                 | 233 ++++++++++++++++++----------
 rust/kernel/time/delay.rs           |  49 ++++++
 rust/kernel/time/hrtimer.rs         | 302 ++++++++++++++++++++++++------------
 rust/kernel/time/hrtimer/arc.rs     |   8 +-
 rust/kernel/time/hrtimer/pin.rs     |   8 +-
 rust/kernel/time/hrtimer/pin_mut.rs |   8 +-
 rust/kernel/time/hrtimer/tbox.rs    |   8 +-
 9 files changed, 466 insertions(+), 186 deletions(-)
 create mode 100644 rust/helpers/time.c
 create mode 100644 rust/kernel/time/delay.rs

