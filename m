Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB28360745
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380431; cv=none; b=Y+lJ4wp5A2NCsJ+2TXyrmkBm3bmtmzaoEYfOnvd50Q9DPnk31H8pN5d+MZz8ZCSfggx9vcvrE04foXKO9887HqRS0339kwsClEOYXHigkekVedjyG7VN/h1y7E4JQZlI/hkxX3hfFvmZLYzo3S78dEKNrH7UV4t98GTqvPhuIUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380431; c=relaxed/simple;
	bh=Q4I+1X4GfC7Nb38+0v2tA3fKl7R9tH+MBZ+n0uPoC44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gzJIp5Lwg8iA49P8qoi/R4R3+lQkSEO+5hrJBaB9iMmZcJPFVJlx3vrNqrBM/+oPi7dxfxJKXWud2yGJb8NV7MiSu4q/PwuffxV0Bc3HAage89wKe4fCWf+WtlDRYPbGdEHuZu6AmZFtv7xYTTEOBViMtbfII2IGtjNHOk70rdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaugEIta; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaugEIta"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89DE1F0089B;
	Wed,  7 Oct 2026 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791380423;
	bh=6Np/X8xxfatZOzW0khsUA9zzx7rqi2OmEGX65AEaulY=;
	h=From:To:Cc:Subject:Date;
	b=TaugEItaI8FblDuV582U6h2yfG+BaYuljVSK/v1ACSXx9mgpbOpHjPsaZR11CcAcN
	 AESDrfPI5hTKbHjflhk5PxteS1remV4CLfw5vC6A2PyBF7w8I+xNfSWyPIbHk6eXpz
	 d2vY1k92MB3G6+U6B6nJSM2nqbWy4fhK1YXWTPg4fRP46Qe76IuNfd8Bg/vgtIJpaQ
	 SLtTj7fg5zhLyaT8lQ3c8kvqs6EgtJOJhCfmeVSa3OPfcHdeGiOEOkmmr6jstCpfyo
	 gMVVvCW0zFvkx6OR7sDF8M63niaONjVRGQlBOvBoxSvaRjNpiRDlqOaD3PDB7AUywU
	 tNYpSGkfCwyjw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori
	<fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
	<jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [GIT PULL] Rust timekeeping for v7.4-rc1
Date: Wed, 07 Oct 2026 15:34:44 +0200
Message-ID: <87ece1eirv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Miguel,

Please pull these changes for rust timekeeping for v7.4-rc1.

The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://github.com/rust-for-linux/linux.git tags/rust-timekeeping-for-v7.4-rc1

for you to fetch changes up to 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38:

  rust: hrtimer: document handle based design rationale (2026-09-29 09:22:30 +0200)

----------------------------------------------------------------
Rust timekeeping changes for v7.4-rc1

This time we have a few assorted changes:

 - Warnings when passing out-of-range inputs to `fsleep` and `udelay`.
 - Rename `ClockSource` to `ClockId` to better align with naming conventions in C kernel.
 - Make `CONFIG_HZ` value available as `bindings::HZ`.
 - Add a conversion method to convert `Delta` to `jiffies` for use in timeout arguments.
 - Add implementation detail documentation for `HrTimer`.

----------------------------------------------------------------
Andreas Hindborg (1):
      rust: hrtimer: document handle based design rationale

FUJITA Tomonori (3):
      rust: time: rename ClockSource trait to ClockId
      rust: bindings: set HZ to CONFIG_HZ
      rust: time: add Delta::to_jiffies_timeout() for timeout conversion

Sang-Heon Jeon (1):
      rust: time: warn and assert out-of-range input in fsleep() and udelay()

 rust/bindings/lib.rs        |   5 ++
 rust/helpers/helpers.c      |   1 +
 rust/helpers/math.c         |   8 +++
 rust/kernel/Kconfig.test    |  10 ++++
 rust/kernel/time.rs         | 139 ++++++++++++++++++++++++++++++++++++++------
 rust/kernel/time/delay.rs   |  17 ++++--
 rust/kernel/time/hrtimer.rs |  95 +++++++++++++++++-------------
 7 files changed, 211 insertions(+), 64 deletions(-)
 create mode 100644 rust/helpers/math.c

