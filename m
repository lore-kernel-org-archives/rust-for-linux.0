Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372097;
	b=rpwgU2CXJZQljLKTBywV2vY+OKCKtnRDkZqEtgxk01r+Y9iLppjFmjEZ1u3uuEUuRkDU
	 p831K98l3QEMPoLqQFtKzb3JLRyR5cubt9mOlYVBvsvfI1xKp37AS+rOwxu87WcDiZC8V
	 c8sXmiDb+Nv9RzHnJCduWOILE8pMIfIFpTgqnGH5V3sUwGYZ3DEPvVkfsuzpqMRO8OBYQ
	 adjLDUXW3rt97AoOtb6/u1nXu/TcJWrPqYqobTi0d7Towh476NW8q8qkziub0LCZXygMt
	 Nj/Pu0jkhQ0sSiDLz2bKJYHkXBveWnEmu/e//e9+Un9ppbJudKTGysp05jIpct225VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372097;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=gg06w1VctFxvDMmAZ2KTgifsGBbxsCipDGnxRlyeUB4=;
	b=lMV1Se+SpO1TEdlDaOfFl4mgJJffgYHJEK4zh2Tw+zKnTLdPMy5NtUTuoVjEsX448LSB
	 DZNoabSgxS6+fCaw3QLhsJIdDw052D+rWFzqRQJjODVUMiMO15TwPZ8UpR+wbcdEgqmUn
	 ZDW5r4g+EbsqKfgLYPKXsxbaHAoQEY5RcNoQDhUg0gdUYwD7G/OFSi2w36BMqdSxyfVQZ
	 9/IihSD9DUwarkxMvyiO0ONg58cHHlh1Llb2SxSypRs/PKh7MeZAa+Df2tyy2OeU22f2F
	 sZ9BxaKdwfxaQK3RtK20aFUWq62P4gYBrHITvqZGRXSkGlL9YwjP7F1oMWFrDuNjm2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIvlX65N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C06F606A320;
	Sun, 22 Nov 2026 18:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIvlX65N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460571F000C6;
	Sun, 22 Nov 2026 18:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795372096;
	bh=gg06w1VctFxvDMmAZ2KTgifsGBbxsCipDGnxRlyeUB4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fIvlX65N+w6vVWh+SmZiieRN6AFWOzbl1qESNXmAJ/3pFvlMoeFIcCX5lPqztOdFv
	 lCr+ryGy5PZMFNZrfwAexCeCCTy1UGB6619p26MA2y0mQmrufMpbh4HV5mobiTG/cQ
	 RytRoIBWvwx4UU/Z1lOTcgDjzSAtkeUk/yct77XHIL78KxVUf/c2ixLFam4Jogjzli
	 KdIyHs9uu76K9Zp2RjRTfUe0VBw1bPTzbcLi6saXhqzK8OTqOykP177jHC50E3qPnZ
	 DI237wqy8U3+mJFlD9p32E2ZUEDzjz/YLwBrlSS/jISpQSywGGEmnulTyrK1480Wgm
	 pph2HzG5e30Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A61F392ED1D;
	Sun, 22 Nov 2026 18:28:16 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.4 (4th)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261122122525.71959-1-ojeda@kernel.org>
References: <20261122122525.71959-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261122122525.71959-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4-4
X-PR-Tracked-Commit-Id: 73bdf8773de4af2c2b7f49370191ae6d5aeddea5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2dc60bd9975fc8666a13d58410499e06e6799ba9
Message-Id: <179537209493.1494759.5492189801673472203.pr-tracker-bot@kernel.org>
Date: Sun, 22 Nov 2026 18:28:14 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sun, 22 Nov 2026 13:25:25 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2dc60bd9975fc8666a13d58410499e06e6799ba9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
