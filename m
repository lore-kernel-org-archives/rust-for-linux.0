Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484552E9EDD;
	Wed,  3 Dec 2025 23:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764806001; cv=none; b=dUYAUbcvFinPxXc4RkKo2PacqjFvvcUepdIm735bfLAcbeewmrXJHZZMbmVNX8OhREtiG67P6r9WKdBjuaUnHOEdAyfyFKIFC1E0UT/fnwHG+Uz2Zu8hl9Uzr3kbPwVeO3uOUJl8CQbuIPKraJBVuleobitbnITdJmCX5GVhILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764806001; c=relaxed/simple;
	bh=92qEzZReLlxelG2frdP3ZplqXOLhww7TIHnMjOTH+eg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IxWgMiddXE4cWc+dKsRhyBfcVVW4ETlEKk7WspP4Bi/LrR4pd1vU9NCXU8VEFyVT1j2iFJMvWTWPElWZw7ZLwqBsj//CYfhuRvR9lE3TfkvmfhzHD2OTEYJEy7KgzdCJjwsFSauHCJ6wG1CuXj2dwC91xSq+go2WeZzdBdc4veI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPjkjHNh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPjkjHNh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AE4C4CEFB;
	Wed,  3 Dec 2025 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764806000;
	bh=92qEzZReLlxelG2frdP3ZplqXOLhww7TIHnMjOTH+eg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VPjkjHNh0yknHATQivf45XRO51lIa7cfzIsf4tWDVoBRFXYh2BN1FuNCY2q8jz/VF
	 b4tQAm42uvaSALxywlfICWBtXde1ZWI3P9jvRiyBXmf9Dy/UzmbUt/24r2FXJqUxpK
	 Z3XfVSwmzc7/dHO0xIJhcvXnnGs2XigkwPPIWrew4gImet/EzTUFs5w0VS8OpHxHhS
	 UGQ44JWB4h7YPl7y6FTAX0a2UP9srotseEB+hWYkVeXo/t39YduNyN996xHtF1yWjB
	 glzY2txWfE1otWLb3cIv9SYy35gVkCzgYecSS7qiatItSbr6MHLX0hBfHPZ36zwFAS
	 RWMNgs0/L54jQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B87723AA9A82;
	Wed,  3 Dec 2025 23:50:20 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251130233553.1621716-1-ojeda@kernel.org>
References: <20251130233553.1621716-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251130233553.1621716-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.19
X-PR-Tracked-Commit-Id: 54e3eae855629702c566bd2e130d9f40e7f35bde
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 784faa8eca8270671e0ed6d9d21f04bbb80fc5f7
Message-Id: <176480581915.130841.18156368852050947508.pr-tracker-bot@kernel.org>
Date: Wed, 03 Dec 2025 23:50:19 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Mon,  1 Dec 2025 00:35:53 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/784faa8eca8270671e0ed6d9d21f04bbb80fc5f7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
