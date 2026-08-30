Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8993BB9E0;
	Sun, 30 Aug 2026 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110699; cv=none; b=ghYBFhxX2Ih3jx/xwK5fR1t3cPax96ciX5BH92yLHy+T4aShCCVFqf6CJR87lvhsxnFM9sflkwDQ1MJEfnARlzqTGL2QSxbH/lnz2D5fayC67ClcMFUQiSzPU8kEtD3/W5ZUer7btvzBk3RYlCvVsVq3zK+PY5dpjI3KoyAmosY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110699; c=relaxed/simple;
	bh=O2Vnk2qjhYyqfxaGjvBO+PM1H0FImeglHtfdJBgJsFA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=VswYmnOnAz4n+47HneTvvc7sxsbchPnyYexMToBfw86+4ScihV2rhXv1YVTnQWxUEk37qQ1MTujRFcvsnt9p1wom6HI4alm2vS907e1ViqNBNTNTgfcrKhZePPdi0kmwcA9lVSBQTQ0PeXZMdcpzxdpIbb59jnrzKiJcOCKJd3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgWAhvbj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgWAhvbj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF6D1F000E9;
	Sun, 30 Aug 2026 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788110698;
	bh=YKmXdjK1KeHYr+zeu1FUbIDP7pObpMZymZ6cqhTZhDg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AgWAhvbjDx4WQyy6FCoeaoUZ4iimd7nJ8fqKExa2NobNcev8BRTs3KjoJTwiHFrKS
	 lLMIjY+LYiCcfFnCTJQjwTYBrMpb80N/5LyRc0qBtshwdo/PgDDwyNkHZcaps79xOo
	 Md/do/nf2O45diKqv5OaKggRzBz9xWfyjQgrVWKQL8vPBteQ+npGIh3YUJjGRosN/e
	 Z/NEKm9A8kv7Cey2O58B2xsbn8Kj+hjr5sHrLzWnVs97Gnnd4VRL/fOngbChQbS9Oy
	 iIRCU88li66uvW2o3WgL6ETR/er1uEn6c/H1NUtwmFwYoX752CUvzp9vxpt0+zDXkA
	 bLmOMKXzGA0NA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93983380CEE3;
	Sun, 30 Aug 2026 17:24:03 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260830093834.275112-1-ojeda@kernel.org>
References: <20260830093834.275112-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260830093834.275112-1-ojeda@kernel.org>
X-PR-Tracked-Remote: ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.3
X-PR-Tracked-Commit-Id: 1b0bab4a873f1034c27573cfc613394cff7e0a5b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f59c074e76a6a9ea55818373decdf56c6fddca30
Message-Id: <178811064211.3405738.11767800521301953379.pr-tracker-bot@kernel.org>
Date: Sun, 30 Aug 2026 17:24:02 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 30 Aug 2026 11:38:34 +0200:

> ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f59c074e76a6a9ea55818373decdf56c6fddca30

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
