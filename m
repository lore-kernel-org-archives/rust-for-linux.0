Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7A532E696;
	Wed, 24 Jun 2026 22:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782339425; cv=none; b=SKSE6Uqcgm83lybl7JqgTcTkzpsg2iDH9LPuQLGvSccipCh69UC/hHo6vxFaHI7l4566GmPnGOaNK/X+1TCdCMcWqSE5o1ekt3xB+h8tjTzbcsH5GWMgVaXDg2ATm8UUvhJsoVpcMXFiPZpDjROT36R8DbiYIdIhLkz71dlh72E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782339425; c=relaxed/simple;
	bh=vLyChRVM9LNAl2JFyFnxO1UKgT4UxyU4scg0Fz16VPc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=BJGcGL53iBamUUp/qzkIovYu3vWqkQBJ+FNhzHjIx8xgY74GUz2sMHamgiohjBklSeO2ivEZs7UrJpOQOQr428IRbnP6U066irssgv9PqHT9ovIO7MwXSM7StA02C4XHbF7KdWBrHc8WWoBOTyFZek14OS0hZSQyfCppp2x4Bb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVPRhHJY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVPRhHJY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7781F000E9;
	Wed, 24 Jun 2026 22:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782339424;
	bh=Wfz0GLdWjbtzZcUMZmDQVvnPI4c0deaBuaNhZJ8+hjQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BVPRhHJYV+QeEyovVl6L9/sGsW7WKfadwknOaZLM25/9f1sqGnqdmS7A8lmgo40kQ
	 NTawEBWIVYwSY3A9/G1EConFqOVkl2sYfvGt+d08NDPLSaTOrFUoc91iU5oh93diji
	 l8dLwdQF0OczY6pBziyo8yvSoMpLUGm/HCKqFywhug+PfdTzjPAeOfuK5fYfFZ2XNl
	 qPhyoPZjv9p1EcvWj5+KSM/rWXlVw65rU+AxOZn8EjPcjeT5AgkpETgFJOKYWM+nhZ
	 JoEkUmvKUK3yMQQwSzTsJpu6dcPzsHVNSRCoYbfUoCTcjKEfZCp8EJauIKR2M0U5wi
	 JEY4TIFc2bHjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5694D3AA6A7A;
	Wed, 24 Jun 2026 22:16:54 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for v7.2 (addendum)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260624144713.585327-1-ojeda@kernel.org>
References: <20260624144713.585327-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260624144713.585327-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.2-2
X-PR-Tracked-Commit-Id: 43a393185e33e573a374c1d4f7ddf6481484ef8d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ab9de95c9cf952332ab79453b4b5d1bfca8e514f
Message-Id: <178233941299.3002918.811995882398578537.pr-tracker-bot@kernel.org>
Date: Wed, 24 Jun 2026 22:16:52 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 24 Jun 2026 16:47:13 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ab9de95c9cf952332ab79453b4b5d1bfca8e514f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
