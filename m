Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91332C11E8
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862915; cv=none; b=uWYU7R7l3g0n0arkRs2P5zm13s/gC2QVUTKwg7f7GSLKUfTs6r+LYd8Ot5dXTZLu1fZy8sbWyEETiTtzTIN17PqBmtwaaO7lw1miqDPbofiUm87Ch526JywRjXGlYNyOynHhqblQFj+S0heANMKqVlt+2lk+lIWX6XewtTo5PB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862915; c=relaxed/simple;
	bh=fpGza6R9GgIyqcqSDY/KhurjN3W5lXw7HnOC9YEinAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dMLcAe7cjpbyi42hc5Xw5KnPQP82EtXcqxsYs3c5ntjVwP0pfQKnfO+mIa9Sdj7YuOUjeyQmK+vytPZXVl+Mnm7c6PAzPVEGkeKs7TMvtH1IAMnkkSx4hC2/kY6vG8H/MvEIla96uxEWMXZbIPZpwBuZeXc4LqVNUTG2rCVDKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0oQmHYZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0oQmHYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22338C4CEF7;
	Mon, 30 Mar 2026 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774862915;
	bh=fpGza6R9GgIyqcqSDY/KhurjN3W5lXw7HnOC9YEinAM=;
	h=From:To:Cc:Subject:Date:From;
	b=o0oQmHYZGgm5AfIUrjeKBle9OibKsuUoghEBtB0ttUxNjw2AIW4lNRwT+3YgFqYKb
	 NusmOqw4wNOtpkuApMrImCy6HBRFoWizoOqtp2shFav9rfl3gRw/j8HLujzRXjr5Yk
	 YR4hxrJgNg+ocDowSL5bq4ofsLz/cpkSGIYFPBL52VRmZUygsMLrym393VICd0/wzN
	 /eXEFPEVOq603zI8aC6ewtry52RX0hSuu9k44NEnOLXAAiXrX3txit7O022087gsdT
	 YfiWi/CdhGDOSdck6hof6+U2FtD23v84NuAPW8UT18iN4//LgMK4ZI3i5EIYYtVtQ1
	 8sY1wNTa6vXbw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [GIT PULL] Rust timekeeping for v7.1
Date: Mon, 30 Mar 2026 11:28:25 +0200
Message-ID: <87wlytwts6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Miguel,

Pleas pull these changes for rust timekeeping.

This PR expands the example section of `HrTimer`, adds a constructor for
`Delta` and marks `ClockSource` as unsafe to ensure only valid values
are returned by `ClockSource::ktime_get`.

The following changes since commit c369299895a591d96745d6492d4888259b004a9e:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  https://github.com/rust-for-linux/linux.git tags/rust-timekeeping-for-v7.1

for you to fetch changes up to ddb1444d3335129ae87d9796ab1debf41c0ee51b:

  hrtimer: add usage examples to documentation (2026-03-23 08:31:00 +0100)

----------------------------------------------------------------
Rust timekeeping changes for v7.1

 - Expand the example section in the `HrTimer` documentation.

 - Mark the `ClockSource` trait as unsafe to ensure valid values for `ktime_get()`.

 - Add `Delta::from_nanos()`.

----------------------------------------------------------------
Andreas Hindborg (1):
      hrtimer: add usage examples to documentation

FUJITA Tomonori (1):
      rust: time: make ClockSource unsafe trait

Lyude Paul (1):
      rust/time: Add Delta::from_nanos()

 rust/kernel/time.rs         |  32 ++++-
 rust/kernel/time/hrtimer.rs | 336 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 362 insertions(+), 6 deletions(-)

