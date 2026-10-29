Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793306753;
	b=0ooOMy/S4Z3SlLcZYoajGGCeyCDwjGqOTSRuQqrBH0UfNTmOJFAettPKXDSbMUDLl/cQ
	 KfDFBgMDMRwx+9+k6zK+G4LXfBGsfmHoSSEo/pm4FxkQrpM+o8RbSzIhNf9G8lYrwVb4q
	 d/c59Sk4/MQWzUZo3YDofRVkkN36t+L1g9jmYHWBYobX+LHlptholj2SpbFzgkgUr9NZq
	 6WeqPjKN8bL9pQIC4c60bZOyT63Gu7t5jtBA+7C9+WnCg5/wIOQ8TtaQpYBV4ga9xSaWt
	 GvsXOHOsr0GvCKLvtDrf/ynYWOBjCXAIgLyjFJ+yt1+D9vGjBy0U/GS+547V2qjfX4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793306753;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=QKQNsEollpyNwBzBoAQphHlX3teAI5VImT9uIGC+KFQ=;
	b=z/CsjGSgC8naUyvWsneC2E3hm1VcBCbIsunGN43h2zcMhI/vrPtOCvfilNTd8/v1CkHc
	 0iRO5/epK8cQc8gePjKA/oUeKIMmZrIk0NJJfaIF2FDpuzIAqy8hnKcNGgbAYun9GwfOC
	 NXekW4Cr17d6DcTOU55p8YSbyQ9dQcdunyHm9NGY9IGsaWNCsi3EFoeGbm88Frmuzx2ZI
	 ugKr5WUZvubIiaD5UQTeZZSnSgQ8z/o/TqtkBiOXubVsBxHwYwEuFVx2sd838+bEPMr4b
	 6oov0ULGYU2Ln2g5Mkkv8+L1OJXahwwc6dZEwR4Op0hW0ercqrNospRSHzLXhG2q6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eau6p76X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C790606A322;
	Thu, 29 Oct 2026 20:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eau6p76X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2141F01824;
	Thu, 29 Oct 2026 20:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793306752;
	bh=QKQNsEollpyNwBzBoAQphHlX3teAI5VImT9uIGC+KFQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Eau6p76XxgG8TSQLIRKcIwiJyPGN9KzurbABCukQ54WpVG6Up8SB17U+UppdNziUP
	 0TLFNE4KZs3IV+XYuOErkIqP+NHSH7n/0FUBoPZ9WBCKkqHiwn/DlxSC0TDrbCwcHr
	 fWVqbm+H/rYWTg6lQo0a+sWRW4f9M+9xzUnzFNGKhOdjNrkmshEyuo4dOwkpF1oN+M
	 tvyKTttZYQCRGa/Yx7noQeq4RJ8wG4Rw7UY4M5dhi332XkRYKFLVYnUh/x47GLE/r/
	 0z9WXIWdcO626+8U6rQ2CF+fVcNzNzUenKy5+0ElWdeZPC03/ygQER3H45CpTAh5pW
	 olHzgcZnFlOWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D4A0380823C;
	Thu, 29 Oct 2026 20:45:52 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261029180116.49074-1-ojeda@kernel.org>
References: <20261029180116.49074-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261029180116.49074-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4
X-PR-Tracked-Commit-Id: 7d109178cd644268326cd31702ed46c7ac8bb300
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fb7bd3a2aad70a76232a7168a505386d0a1396af
Message-Id: <179330675112.683852.3819619373663092542.pr-tracker-bot@kernel.org>
Date: Thu, 29 Oct 2026 20:45:51 +0000
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

The pull request you sent on Thu, 29 Oct 2026 19:01:16 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fb7bd3a2aad70a76232a7168a505386d0a1396af

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
