Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6165264A6D
	for <rust-for-linux@vger.kernel.org>; Tue,  6 May 2025 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525338; cv=none; b=brqUlmVp73b30xS20olOyIumhH3oabud+vVQmJXzSY0QGZ2m4vMM3MvW05ROjJlqcRRbB1CM/Fv3FQgSj9tllkTNeEm2ZqlbaHcu7gujuh7dtJ+DTcCSTjpHhOc9n6979PuEqOKlVYEex/ECeLFrcOUfeL18PRo7ak6mh4f3f7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525338; c=relaxed/simple;
	bh=czA6xtOu+YcHwiDFrFf4mH8B0JFLOQ3hd3G4ICdsFWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RdRgEAMl0UC1PZqRFdYMG4/KpXdyHh4V+q8IQj9rP5dNmk8xtZ+5u/DZzP+uyznvkvx4+qcUDksTIZPpJKSU2SW7G30RSw1cVe5MFbe0a8G8tcd+0on+3ZYGurk18KlI1W+jNkVqRx8SjtG4yEOMyQqGopt1vOoXNX8fLNBs9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozjpWirz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozjpWirz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE764C4CEED;
	Tue,  6 May 2025 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746525337;
	bh=czA6xtOu+YcHwiDFrFf4mH8B0JFLOQ3hd3G4ICdsFWs=;
	h=From:To:Cc:Subject:Date:From;
	b=ozjpWirzX8Tsr4cdVenOL1rfgO/rSZR/jGmTulv6gf5bXv1ZQIZnl5lH9rYLPQ4Vx
	 8g4eQpbuwTYuUqiTO/S4FZj2pk1ffNZWqBaJD3Oe6zqsZU386H/9BJowhA9dkFt6G3
	 iJrlH3734Ph+z1X3VwT5Nq+5e+rngbAODuIdvh09H8UQIIx60lRDRYWK71O7/Spxwd
	 lqLkI6/toloq0EDWHUUzdjdgB0ZuOy8WbZD6KjOIYXyA/cQ9Xa+94Dqgotb2FwxXKg
	 36KUswMFdrIQpnOM0aplBE0jLAjkDHLMUAJS4gtfrWAi+QvJi/QYOlc3XLw6BeG5jj
	 b1XCrlibmIyFw==
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
Subject: [GIT PULL] Rust timekeeping for v6.16 From: Andreas Hindborg
 <a.hindborg@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 06 May 2025 11:52:11 +0200
Message-ID: <87v7qeqd6c.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Miguel,

Please pull these changes for Rust timekeeping.

This PR morphs the rust hrtimer subsystem into the rust timekeeping subsystem
covering delay, sleep timekeeping, and timers.

We also add the `Delta` and `Instant` types to replace `Ktime`. We add `Ktime`
locally for `htrimer` while we rework `hrtimer` to use the new types.

In this iteration, `Instant` does not prevent subtracting instants based on
different clock sources. We plan to add this via generics in the next cycle.

The commits were in linux-next since next-20250501.

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://github.com/rust-for-linux/linux.git tags/rust-timekeeping-for-v6.16-v2

for you to fetch changes up to 679185904972421c570a1c337a8266835045012d:

  MAINTAINERS: rust: Add a new section for all of the time stuff (2025-04-29 15:35:25 +0200)

Best regards,
Andreas

----------------------------------------------------------------
Rust timekeeping changes for v6.16

 - Morph the rust hrtimer subsystem into the rust timekeeping subsystem,
   covering delay, sleep, timekeeping, timers. This new subsystem has all the
   relevant timekeeping C maintainers listed in the entry.

 - Replace `Ktime` with `Delta` and `Instant` types to represent a duration of
   time and a point in time.

 - Temporarily add `Ktime` to `hrtimer` module to allow `hrtimer` to delay
   converting to `Instant` and `Delta`.

----------------------------------------------------------------
FUJITA Tomonori (5):
      rust: hrtimer: Add Ktime temporarily
      rust: time: Add PartialEq/Eq/PartialOrd/Ord trait to Ktime
      rust: time: Introduce Delta type
      rust: time: Introduce Instant type
      MAINTAINERS: rust: Add a new section for all of the time stuff

 MAINTAINERS                         |  11 ++-
 rust/kernel/time.rs                 | 167 +++++++++++++++++++++++++++---------
 rust/kernel/time/hrtimer.rs         |  18 +++-
 rust/kernel/time/hrtimer/arc.rs     |   2 +-
 rust/kernel/time/hrtimer/pin.rs     |   2 +-
 rust/kernel/time/hrtimer/pin_mut.rs |   4 +-
 rust/kernel/time/hrtimer/tbox.rs    |   2 +-
 7 files changed, 157 insertions(+), 49 deletions(-)

