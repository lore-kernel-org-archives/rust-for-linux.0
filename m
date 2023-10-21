Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF41E51D
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Oct 2023 20:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8m8NHtV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE959C433C8;
	Sat, 21 Oct 2023 20:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697918650;
	bh=c2b+HPbEiqMXZSuJ6PQzwDd8rImXip+TYWYZhkgTQLk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=W8m8NHtVZ5Rz+jNrAFZmF7DOLNzHNHGy9L9Cr/sCtiJrh3CcrJ+cKhLrCgVxEIcdb
	 HDfrVowBy+HqxVGziGVxaJzn7VcXSjfhebCBIbSbpkJU0sMCoDx1yR4NVDsOIzR3A2
	 0G4pBRU0O6beqs3PmUfBa/1/V3i7ICqR6kqXwyAgNKKx9CrFq17NRPsz1urqE0SS9y
	 G9E+W+mxsdrtMgIhY+NgJ15XzItirK3bjhRvcolgqTJdQK3O/d8xo8X53eRZBG3bQO
	 VFjyGUVLLsttUaiT+iDruyKy7u7wwlagfhT5GU3M/jy25OWNc882i76MQ6a1s69a8Q
	 n3tyknOZY4g5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B562E4E9B6;
	Sat, 21 Oct 2023 20:04:10 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231021181259.10931-1-ojeda@kernel.org>
References: <20231021181259.10931-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231021181259.10931-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.6
X-PR-Tracked-Commit-Id: cfd96726e61136e68a168813cedc4084f626208b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 03027aa3a5c698b8fe1a0254284198cb1423481e
Message-Id: <169791865063.17709.6346007355733465158.pr-tracker-bot@kernel.org>
Date: Sat, 21 Oct 2023 20:04:10 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 21 Oct 2023 20:12:59 +0200:

> https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/03027aa3a5c698b8fe1a0254284198cb1423481e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
