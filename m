Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06D32FA2D;
	Tue, 10 Feb 2026 19:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770753581; cv=none; b=CC0+6uKAcJzCvqdAwmGsx4WS3fZRY7gUZVs+izBoU0sSg3XXmx8qBs0aVw5r0z8xvQk0lDgRdDqKUz2nn4cwFJGM3hkE6m5BL9jVAS2E3o7EcADngsSR68w4sVvChElSR5liGF2Gt6kbf7PrOnFV5X4Fnknlof0Szu6O5GujplM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770753581; c=relaxed/simple;
	bh=gx8g2ySPm5o4XDYO9sPHAyvb0p3Yyns394cKjwSRyrs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=AgXFfo+IV2dIoXkWzRFfhTvog03iBoBg4xtidEZt8Dte+e/wd5IcKUupMK43UuyHPBNgrA9eYxtPiuGQn5pQSxGRBxJATmifC2qbnsjBtJLu80ssyLP3cAYLhO7FZ9fGp8QOJDWwJI8hwa+Lm2oxVSyMDgiGIAwl7oa50K4x7XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEeahKPn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEeahKPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5B4C19421;
	Tue, 10 Feb 2026 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770753581;
	bh=gx8g2ySPm5o4XDYO9sPHAyvb0p3Yyns394cKjwSRyrs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iEeahKPnowd5zhw0iil98ZjJhVkgX1YbouREf3XURz8cCYhSMGOccNpSDZ9XCMSb1
	 FvMbE3KZj6AGIXzUn+WOik5a6n/gmePcoOa0BgBPxmZn+a8aVfCj1E8dHdZa8pEOLw
	 GyOqzKDtdfarmQovlAq0eq65CyXkmkCJD4qlLtt6JyS7ujmd+KqOa5od7OITYNHnwu
	 05SrazLZd6601Kn2mMMFjmJT7HS2PkClLhFJOZ/5I8kdXsyw2ez7mIKPkg5mwpx598
	 TJHMUYVA5nT+X4T8I/od8TrMQxKSJ2PclnvccZjKUiRY7UzBDsLNXJA5IVgS5wVNxE
	 NuRaAmRrcrCqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C250F39D6575;
	Tue, 10 Feb 2026 19:59:37 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for v6.20 / v7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260208135445.64840-1-ojeda@kernel.org>
References: <20260208135445.64840-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260208135445.64840-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.20-7.0
X-PR-Tracked-Commit-Id: b8d687c7eeb52d0353ac27c4f71594a2e6aa365f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a9aabb3b839aba094ed80861054993785c61462c
Message-Id: <177075357637.3655785.8505082509648591609.pr-tracker-bot@kernel.org>
Date: Tue, 10 Feb 2026 19:59:36 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  8 Feb 2026 14:54:43 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.20-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a9aabb3b839aba094ed80861054993785c61462c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
