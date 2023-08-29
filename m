Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913601643E
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Aug 2023 18:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20811C433C9;
	Tue, 29 Aug 2023 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693332485;
	bh=lbo/eAw3tvZy/TMTDTUOLtW0n7eKg0rYb7Jr1Qal9d0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aoPk8/9kaBkSnOnMXEIb4xJHZkZKuvF1EFajpWbM1X/DxsLpufdzBtKYZJZj6bnvF
	 RdpkBds7fUQzlPKVpofRVvN5FYsjmKXQV0MorwK3nczdadUqThCDWfBXR9gJ4lXM3C
	 7lQhPss4C7Wubn4dvSWbMATxIOQPNZ/eAk9Bqaj/I9rBkZDcppWdTZntm0ydagkSSt
	 bb+XAqq4uaqK2N2mAc8HYrAjUB4Zd1ssqp7VreKGIpjTYc8/5VlleOCaRXacjwxcgV
	 NOpY9tfC52GDn/+keIDUS4DrcSjFPdx7c3w3JCS4DRKxSju8bqdmllwvEjtHYQmfgR
	 eTYGyMA9Ob40A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D52BC3959E;
	Tue, 29 Aug 2023 18:08:05 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for 6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230824214024.608618-1-ojeda@kernel.org>
References: <20230824214024.608618-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230824214024.608618-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://github.com/Rust-for-Linux/linux.git tags/rust-6.6
X-PR-Tracked-Commit-Id: 4af84c6a85c63bec24611e46bb3de2c0a6602a51
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a031fe8d1d32898582e36ccbffa9847d16f67aa2
Message-Id: <169333248504.16601.3296363879442058002.pr-tracker-bot@kernel.org>
Date: Tue, 29 Aug 2023 18:08:05 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 24 Aug 2023 23:40:22 +0200:

> https://github.com/Rust-for-Linux/linux.git tags/rust-6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a031fe8d1d32898582e36ccbffa9847d16f67aa2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
