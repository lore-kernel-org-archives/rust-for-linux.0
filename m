Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CB7A4C
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Aug 2023 06:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA088C433C8;
	Sun, 20 Aug 2023 06:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692513380;
	bh=RwzPy9PelORoh8zlAOuicZl7CuiCFR+uvRez5lKFIfU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Lktv5vBreqZxF3jsovLmf8AHK0vjJ1JxUQSXtWYfGxhMPokbujpguQLmG1wXGRsxy
	 EaSC6FuuQRVNhUKfK9YpBr7MUXw5K0h+aJ3bMJUsMrmPitfek7EOPnmvFj+IxzeWc1
	 T7jlccBaAtJfjsFCkSA25EGzvyrGWzKyMugfnYLe9uUV7QRv3zEEEVUbTnWMsTMTC/
	 E+aYQn5atxsWP99KgqZcn/sfKGqT/NIBmmtWu1qV56f3Wnk6krNvwGo6ty9xS0LgQZ
	 M9a208yRloCiV1mULOnSECvMASRGubSdWGAcyHActlcr7KabXPvJhwLCiHXl6L6DWP
	 PLsCNWbSPI2xA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 96475C395C5;
	Sun, 20 Aug 2023 06:36:20 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.5-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230819193541.290947-1-ojeda@kernel.org>
References: <20230819193541.290947-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230819193541.290947-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.5-rc7
X-PR-Tracked-Commit-Id: 3fa7187eceee11998f756481e45ce8c4f9d9dc48
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec27a636d7e1aa05e64ef0b1bd848f27f8105a39
Message-Id: <169251338060.7930.6468675097371336525.pr-tracker-bot@kernel.org>
Date: Sun, 20 Aug 2023 06:36:20 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 19 Aug 2023 21:35:41 +0200:

> https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.5-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec27a636d7e1aa05e64ef0b1bd848f27f8105a39

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
