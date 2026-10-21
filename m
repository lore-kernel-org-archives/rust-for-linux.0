Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616658;
	b=xkgLMeM3woB55zlZoDDTQfo3r/2SlhZg/MNPMunWzNhid6T5xajQ2kNNyz4VaqsNYMzv
	 RcQ5exTkK//2DiEcf4Lkim2C998KBgc0Fz+ZyACnqvOgwK2bWOrP/uPXXyvghSCx6pR0y
	 iCqpycOvkpzDXYHVF11mn2LfojexQwSGoIapHHogCaxuRm6jCKf4750RAA8VbDtY+2kYy
	 NY05+aAcuISmCkc1IVzTNCt+P9Vs5CNCKnR9tkX3iCMlW/+X2QPB5AqYgsLgO3+1xiACS
	 sKZc96G31NFjHb+N1sDq+4VTjxUsgaqAobAbADkD1y6hag86UBWzFbE8uDXaV7hrBlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616658;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=1UyfJbiPj3+9rXYJtDosMuKpy2n55A5sPDSo8IlAI0w=;
	b=4DiXTtMadmq4epoGM32XbuPnba6FMFSZJdJbjALnTuns8MgEE81Ux70YQNErHgr4GA78
	 NJZMmmRcWeO6HL0y/hnNtwFrl3FTSpUM0WBXbL3geJZueyxqWMs0+g23lD5CCfdMMfEKs
	 fy9kdcs7SsH3cAj3eFnNYHuEBToKQO1HQ3TctUBENqFdgiu4IqHLn7kMiiB3Y5rnAJrqh
	 Eecet2kE/MEdAKXEM+kq5kBi4gCO+5CI1Sun1/86QghIfYDoY+xP6DThO8SfOwKEqFCHn
	 NDr8E7OI+gnRdqZnrpz/HFZADEKUpH8NjvmH2+f9E30C7BIVC+mRna7KZ5JX2PVvMWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3XLY+yk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1FB606A33A;
	Wed, 21 Oct 2026 21:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3XLY+yk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4280E1F000C2;
	Wed, 21 Oct 2026 21:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792616658;
	bh=1UyfJbiPj3+9rXYJtDosMuKpy2n55A5sPDSo8IlAI0w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=F3XLY+yksS3AQG29GePb9lUi+aCb90LBdi5IeYasGnJedeAYGW/Ab+saAiGWwn6Ds
	 gobapYdVhMBSa31Nz+te47oPNN7W1i3iFn8x2MjXdVjxVFk2SSZ7RVGd+EaBWT/UN9
	 TC6P3lvgTSU8OJwYixjFv9bqQdDDz2MAfYWRsYGmNVc7DX9gxDzL9nm8RHxZ8b9rTz
	 ECjEHWtz5fAv8vwzP0Q5RJMmA11x5esxh7ArAIPXkOnmXCdhbCGOh+UaZGt/xsxivv
	 S8wvcs+8BJNmPunfl4t7VZqSf+ccRM3AjgG7eXY7hv+JoAFIZCo+nnDiF3xB6rgIc2
	 mUuwP2cOnUu+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A5A1380A962;
	Wed, 21 Oct 2026 21:04:18 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261018163459.80579-1-ojeda@kernel.org>
References: <20261018163459.80579-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261018163459.80579-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.4
X-PR-Tracked-Commit-Id: 7c306f00835a237a70024a8f968dbc3bc8db8fcf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12d5fc96ebbb3b948861805b32a4c3a96105ccd9
Message-Id: <179261665669.1307528.578369170434472354.pr-tracker-bot@kernel.org>
Date: Wed, 21 Oct 2026 21:04:16 +0000
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

The pull request you sent on Sun, 18 Oct 2026 18:34:58 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12d5fc96ebbb3b948861805b32a4c3a96105ccd9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
