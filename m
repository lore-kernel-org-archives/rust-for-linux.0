Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F9B199934
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758282389; cv=none; b=us8QiauN0S+h9WqK4NTBoKm1TksMV0g8ho+iOfFqnqTtrf7vzHtUT2nyDyDchIWkBH+AXP3IWTgCg14y6yH2VKjja8eJi7CsbP461Qll1evz+omXldF2yQUXmd2lgrF3L0BUevjF014V662Wu0zcA/V2n542fylkG8qE4EHRbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758282389; c=relaxed/simple;
	bh=Nrz5ubywHPXyLCm8cR06/yvkGR3UgcWf4u0DtQaK3XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EXZWK8pgc8eFhr5UjSjFA3slfz/cW6+0p2ytawbnzlzkkEy0vsBzQmXh3pfprA1dVoqoTV7Y8qM1XEt+lZfztc3gEA72+bcMyqoy5KVihvnU0yL9fAsfLM07M96j5L1zaSBlykuBi8iMLLOPV5F8/0FL3ctp03Kvp/UiQJAbYHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNsv4GiO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNsv4GiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2624AC4CEF0;
	Fri, 19 Sep 2025 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758282389;
	bh=Nrz5ubywHPXyLCm8cR06/yvkGR3UgcWf4u0DtQaK3XY=;
	h=From:To:Cc:Subject:Date:From;
	b=eNsv4GiOXO9DdakRIcIEamvqmoij60IxqCSBQg7iQYNOYbjddzvzn0f3ERd6pL6v7
	 3VEdL78L9itNkpTopgcv+eU9hzCXsjkbFMihzWtdINUABpnGo3p8KWfCKVZv43zUeR
	 /GSijZst9XCLY49Z6c12+f28+R8S+xYf1lPdJcljNbh3HWC5GShROC6uw8cvmoX+3X
	 sTvRuWUS+V0JW/Uj7alCMGOwIkqgntu7J9PluvHYwHIb/gA8H0yjI8sExJavXfpHFo
	 mO4Rc3xB7l0D519oDCKxhguIfz0h9GSJJ5sKXt3/DpDj+/UYiMUe/a38EyalHHxual
	 s9+6QHrCSKvZw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 rust-for-linux@vger.kernel.org
Subject: [GIT PULL] Rust timekeeping for v6.18
Date: Fri, 19 Sep 2025 13:46:12 +0200
Message-ID: <87o6r6wtq3.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Miguel,

Please pull these changes for the rust timekeeping subsystem.

This PR consists of three main parts:

 - Additional functionality for `HrTimer` that allows use of operations
   that can only be executed in timer callback context, or with
   exclusive access to a timer that is not armed.

 - Arithmetic operations for `Instant` and `Delta`.

 - A few other minor updates.

While these changes will benefit everyone in the long run, they have a
near future user in rvkms. The changes has been in linux-next for at
least a week.

The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  ssh://github.com/Rust-for-Linux/linux.git tags/rust-timekeeping-v6.18

for you to fetch changes up to 4521438fb076f8a6a52f45b0e508f6ef10ac0c49:

  rust: time: Implement basic arithmetic operations for Delta (2025-09-04 16:56:48 +0200)

Best regards,
Andreas

----------------------------------------------------------------
Rust timekeeping changes for v6.18

 - Add methods on `HrTimer` that can only be called with exclusive access to an
   unarmed timer, or form timer callback context.

 - Add arithmetic operations to `Instant` and `Delta`.

 - Add a few convenience and access methods to `HrTimer` and `Instant`.

----------------------------------------------------------------
Lyude Paul (9):
      rust: hrtimer: Document the return value for HrTimerHandle::cancel()
      rust: hrtimer: Add HrTimerInstant
      rust: hrtimer: Add HrTimer::raw_forward() and forward()
      rust: hrtimer: Add HrTimerCallbackContext and ::forward()
      rust: hrtimer: Add forward_now() to HrTimer and HrTimerCallbackContext
      rust: time: Add Instant::from_ktime()
      rust: hrtimer: Add HrTimer::expires()
      rust: time: Implement Add<Delta>/Sub<Delta> for Instant
      rust: time: Implement basic arithmetic operations for Delta

 rust/kernel/time.rs                 | 163 +++++++++++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer.rs         | 152 ++++++++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer/arc.rs     |   9 +-
 rust/kernel/time/hrtimer/pin.rs     |   9 +-
 rust/kernel/time/hrtimer/pin_mut.rs |  12 ++-
 rust/kernel/time/hrtimer/tbox.rs    |   9 +-
 6 files changed, 344 insertions(+), 10 deletions(-)

