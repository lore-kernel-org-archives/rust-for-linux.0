Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD303290B9;
	Sat, 25 Jul 2026 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785000324; cv=none; b=WibQDhf7KoH122j9dMWhfWOVCt7rQBrctJJfX2yIeAfoz3jyWFtzRoq5GoWYr9yfbOae9QK+mXreUvFVnt4E3I9Ei4fWFAivOoeCVFk2tw33bwZLXvgkWrAHrYJpekLXb4XlAYXMxRMjknaZUrJVvXq5wz2bViWm1V9j16u+iro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785000324; c=relaxed/simple;
	bh=FwSESP3LoqjJ/O13H4HeJpIsku1hXHOyIXuia1GApno=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mr4TUCJkt2x7wP6TmHkpAeTdrVJKQQSSVZgA/EX6clGkVeora7IRcYBLcjHlqHmcI2e3GAv8bTtPmQePu2nqFHPOHiJ6/ERQ9eQbYz7ndnaaqmTgaOOxeGf6Ll7je7msrDOU1rsn/qiVhpz0I3M2r/Gnj7BsCSxUfaJEJnKShjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MDa7h8JB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MDa7h8JB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD8F1F000E9;
	Sat, 25 Jul 2026 17:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785000323;
	bh=Ob0CpbSZljWlKwV9MlcaaTxmL8UGJepXO1C+v/31uy0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MDa7h8JBJFBWFQh1LqrVePE6YR6LSYpuOWRTLpZht073MFuCe5hhI5jyT7GXTgQoh
	 WjKs+fIRTLNXAm0MpYI8mn8dEDWU5XdwxhkrSafs+A31Gp2wjEYi/oCuoCPVLrlmlg
	 2bgndJQcI1bAX2P8v5gy6VJRdhMZiAOucNJP47kUg+I5X3NhhY/lTTHeRpV7eC2Tnc
	 75bAmkUFLiVILgFeSH2ho/exAua9reM8l7IKHIj8ZGO1v1Z9YOxQxElm7w6aHgDAgL
	 t7yUWxMRVFn7OIi370XYCrRHk0QeLKIIZf1XN1DiVpH/8vCoKPWV+evKj8rAaQHJu7
	 In+UppmKPM3Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BE238119C5;
	Sat, 25 Jul 2026 17:24:51 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.2 (2nd)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260725165301.156594-1-ojeda@kernel.org>
References: <20260725165301.156594-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260725165301.156594-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.2-2
X-PR-Tracked-Commit-Id: 880c43b185ca52239e75bc546cc4f4d9154d0fed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3dab139d4795f688e4f243e40c7474df00d329d9
Message-Id: <178500028990.3569165.9692798754342191312.pr-tracker-bot@kernel.org>
Date: Sat, 25 Jul 2026 17:24:49 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 25 Jul 2026 18:53:01 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3dab139d4795f688e4f243e40c7474df00d329d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
