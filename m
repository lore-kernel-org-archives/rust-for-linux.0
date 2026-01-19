Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2BA2BCF5D
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821804; cv=none; b=Bxt5z6s9sS2robOezEzenquFWjDcd3IBtBIHFX0rIX3Xai58+FyrdOIjpp4BMvDneMKIDvc1Jeaalz9zNNT6a+xzH/bf2Qgyo/l4XHtNGcrFeJpDB62Vb9wv89nzFgQJMRGP2GlY+Eyrq0KeOwFRbXzaXHLX4t2nN6iQ+NH1o4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821804; c=relaxed/simple;
	bh=mgmSkFKXzMVvgVyqrQvlMPA/hIq2ZckJOXw778SvJfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oixj7rlRu6GZBetJ+YEIRjEQN7/jVPRwKJDjtdDtLBukHv/EEKYq4MqqRPI/yxXkzHExWtJ4A9x4uaoPbhh+049GM7KiBgTX0BINikbJgFukhrtCyijq8Lx9Ekewd0f99+nLE6kn8d1mEr+Fb5OZhod0nEKV6aVzGsCbRa/BQgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXgqEc8S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXgqEc8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF59DC116C6;
	Mon, 19 Jan 2026 11:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768821804;
	bh=mgmSkFKXzMVvgVyqrQvlMPA/hIq2ZckJOXw778SvJfc=;
	h=From:To:Cc:Subject:Date:From;
	b=hXgqEc8SsfnTC0QJQ1R05J/8j/vvbV0BBC3Cp+lxmIK/PViNcVntbHkJPmNYghx56
	 PwUYMt2k1YQ974lsSY04mtfqVO5dJM34c4PfJcYh39/LDdf7lgdyP0SVk3ruzxRAYx
	 6x5oQIudmLxZZ4Y6yt2RWJ7ZuavlAPRLAukgI3p+fnYMEzApLpl4QfGxpQ3S7OETQp
	 Wxqcts+5leCG/Oee3wvmmPp86sjfeCeCKZbqipLPbqd4WTObR256z9ftexe6J8W8CU
	 J/iDWwzO7zy/q1MNW9dsAFowFshuTE4POQLKcLIQWzLCrbg0d/ZWg2aOrluHsvibCq
	 QeQuDtSNOQVgQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: [GIT PULL] Rust XArray abstractions for v6.20/v7.0
Date: Mon, 19 Jan 2026 12:23:10 +0100
Message-ID: <87bjipq21t.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Miguel,

Please pull this change for the Rust XArray abstractions for v6.20/v7.0.
This is just a single patch enabling the `__rust_helper` macro for the
XArray helpers, so that we can get helpers inlined.

The following changes since commit 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb:

  Linux 6.19-rc4 (2026-01-04 14:41:55 -0800)

are available in the Git repository at:

  https://github.com/rust-for-linux/linux.git tags/rust-xarray-for-v6.20-v7.0

for you to fetch changes up to c455f19bbe6104debd980bb15515faf716bd81b8:

  rust: xarray: add __rust_helper to helpers (2026-01-15 10:01:23 +0100)

----------------------------------------------------------------
Rust XArray abstraction changes for v6.20/v7.0

 - Add `__rust_helper` to xarray abstraction C helpers.

----------------------------------------------------------------
Alice Ryhl (1):
      rust: xarray: add __rust_helper to helpers

 rust/helpers/xarray.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)


Best regards,
Andreas Hindborg

