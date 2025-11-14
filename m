Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCB930E0D8;
	Fri, 14 Nov 2025 23:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763164430; cv=none; b=VhvxHuS92vHSCvmd4pwt/FRVqEff4oekCgU5DUzn8QzUtkwmz1QnUmf87o8kKs2mHEpKOJ0Hb0y5CWawdRVr4xaoHgm26fieF9pqfpffxdjWhAVahM4e+cXw4JwLrXtM8qEEI8CcQCwI7lZ7zYqVw/3ENqNB5vnovFs9Va/1RdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763164430; c=relaxed/simple;
	bh=MBU6PmBS3EY8BPEBLPNmICALGi38G4Iyg5xkcD/b+8o=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=YvBb+lMH3SfBBKXsAhA3E2UlXyj6jKXMYdvmeFCOrLREadXMmxBs9DpwN0tAOjLGzzmytooJZIQPM8oGv4dYq3DWSvNYS4JwxYoOi/K2vZRT5Mq30xxQI6pt3LyacyuWKLnWuQhTRM0ctcwpn2IfkARx3ZS0xbqiu8cqnP//PmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pMrYE7xQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pMrYE7xQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81C2C4CEF1;
	Fri, 14 Nov 2025 23:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763164427;
	bh=MBU6PmBS3EY8BPEBLPNmICALGi38G4Iyg5xkcD/b+8o=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=pMrYE7xQg3jRcysUgmRXDBg2NlVtVTWvqOzO98h07WEUvmbjuQMGY1JG9WETaa5lu
	 tBYWBcUouPW0A3+88XGO1Akuwjcw4hRD9dmT3XHc46IGEdxAi6Qv97BKA4LDAP/LcP
	 /414iPYiXtoiAaA4XJhMSlcgfYqzS+edxJuYhzS3dQw4G1gT07c4xjQcceSLplrAvX
	 8EbPrYYE7/fsJubNK8/o/dK8WgkwzNPhlFsDrIxtU6dpREMuvlLv4UW4ULadFRmJQQ
	 GNG0oYBHVEoqwQzXdMrF149V5HY/KMcGeQ5rtaAce2VHpTvmvoIVdKNkSPqzfqiavp
	 tL+r4grNmFkzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EE03A78A61;
	Fri, 14 Nov 2025 23:53:17 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.18 (2nd)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251114220555.402620-1-ojeda@kernel.org>
References: <20251114220555.402620-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251114220555.402620-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.18-2
X-PR-Tracked-Commit-Id: fdf302e6bea1822a9144a0cc2e8e17527e746162
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a752782a2843323d2c04ee6ab79531d027072e88
Message-Id: <176316439609.1879382.7825058837758764730.pr-tracker-bot@kernel.org>
Date: Fri, 14 Nov 2025 23:53:16 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 14 Nov 2025 23:05:55 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.18-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a752782a2843323d2c04ee6ab79531d027072e88

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
