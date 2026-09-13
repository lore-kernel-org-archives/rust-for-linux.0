Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AFC348C77;
	Sun, 13 Sep 2026 17:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321125; cv=none; b=cJOGYYVqf1hJ5sGhAANysc4iLkFkeiRx2ulssNTcup48FO8eyw+jDgKhfzQq89kVhJEWJH7J2pe0sdw5qPQHVfKktlHCG5lUUCDD9WVxzqGeG1zRk0fkR1e7kxMf/ckM7D2rbOFX8H/hJbZawHzceKw1Q9vQafRXpBWUNF3KgbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321125; c=relaxed/simple;
	bh=PKjijOjyp8B+A/AHDZ4kCkSZRdeD1AEmIH6hPHQ3/vs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=fpsxZM2s8jvxqOQCOfWqYii2TTOLYKbLVtHrOkpb5L0RAx0E4brFIGzEVJxrn/+2S0s5O0C/lyiIAafNKviMIvORLQ8ve8cdrWrGLFfnoWQh9isFKxiCQGg7MqDNitQujnNnMs5okUqXtgWmwfrteOKqxQxTXthPH1As5V1Snt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwY8VRCh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwY8VRCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71D61F000FF;
	Sun, 13 Sep 2026 17:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321124;
	bh=iG2bkv+azAGPvUZkh0JpkzrvrHr9eZUbGOFK0xHLhYA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ZwY8VRChlFos1svebyO3M1dryn2YoCszvMNNNrStLKIrjWW+t+EMFNzW6KcyyDjt+
	 DZd7yjl2gpghFvdqByWxXAyx1byfT0aJj4Gf/xDY8epN94wLvSQMaxKnaHJIPcAFU/
	 vX/XVvvpS5gHFB0PYMnXsDFOp2q/BnV/aUzGRXEeLEQmWR2lA1ZifRDqobK+5BwGHd
	 cOc7jWvYik7TNsWx+qxMZNt/hMDv6yZAE740s9u2X6GNaCzhVUVbhgolJBrLPc2zQy
	 j1ChdO6PbFzcsSDFivOEpif5B4iJVmC9DShChKnD904zuEdQaCP8uHUzhDH4x72xJb
	 XTedMhIt7j+Hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AFB380A957;
	Sun, 13 Sep 2026 17:37:40 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.3 (2nd)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260913145808.28006-1-ojeda@kernel.org>
References: <20260913145808.28006-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260913145808.28006-1-ojeda@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.3-2
X-PR-Tracked-Commit-Id: f4c3e38111fd84c2c7ae5785755f4a4d476e1cba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 180534c09b2dd877c3ec83c900253765923c2e42
Message-Id: <178932105942.3902938.2440792355458879964.pr-tracker-bot@kernel.org>
Date: Sun, 13 Sep 2026 17:37:39 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 13 Sep 2026 16:58:08 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/180534c09b2dd877c3ec83c900253765923c2e42

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
