Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8D63BF682;
	Mon, 15 Jun 2026 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509929; cv=none; b=t2BmXiImxNRaaCPIF32Jmd3AeL0ZjPhI4skz9oxvU3HFkcBtpJWXPAJ/lAuaksdiOtgfiaJ4OmjvI8PDBIYNschpYOYmxgOS9q4OXNxrlt7i2Fa1s3Hs13OLXNmKySxcJE91fDpRc9j6DS8Ne4kbWiJSg+e6iEWxZGg8bQLLVq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509929; c=relaxed/simple;
	bh=hav5WZW5aX/iscNhWKtg31i2t8m7XhotpUX+95dsRbU=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kr2FJxnLW9XysVd03nBzkXzs4oQGtE5+sw+pOJy6oCt62o5POGiQgoXov+q9pqzhVkxCHo2Z2YR1mAnDb7smVtydX3mPdI0fY81GapRnkwkJRAPrc0aYG8CHDiVI7bcLwMyvihPQnlFiy//8TCirSlz8c3PDPBcHm9gTpaVmqYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ArNXkXGO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ArNXkXGO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814FF1F000E9;
	Mon, 15 Jun 2026 07:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781509928;
	bh=6FdTmr9yOc0wdNhnuoopQwSD455lqt3aBh8ZlgNOehg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ArNXkXGOng6GMWQhoQzgKSRUx3T208MzODJ7mpov4Sb70OhWbGjSfr6lgsDk9826+
	 tpzAN8h113ESVhe3ZOil4Z/G3bgpl77Mw7J5TePLygu7TzW/m6WcMHWl6eGcByyT28
	 jZAn34qbMLBPJ0B1c+IRjQodUmfz7gQ/7cuNPcM4V8dLGW1vc7LZMigxHbl31eTDzt
	 idpIwVmoC1KLrpLvy0UXRC1aGJ6Me40pKYcItOLibIsvq6BZjJWTln4LbpdQ4HzKof
	 h4fSVe3m5U+Dzi1r8n3/MEIaJ5lfwHkjnMBAFxzYpmqW/adXyjbJPYPj4BJ583GtUe
	 vCsD65ih5+qMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198B13A56756;
	Mon, 15 Jun 2026 07:52:05 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for v7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260614202412.400461-1-ojeda@kernel.org>
References: <20260614202412.400461-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260614202412.400461-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.2
X-PR-Tracked-Commit-Id: 48b375e482027ba6566107cec40c1b21b453fa4e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b079329b8691768962aa514b8f8c9077ca352459
Message-Id: <178150992376.2920647.5161019221868056992.pr-tracker-bot@kernel.org>
Date: Mon, 15 Jun 2026 07:52:03 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 14 Jun 2026 22:24:11 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b079329b8691768962aa514b8f8c9077ca352459

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
