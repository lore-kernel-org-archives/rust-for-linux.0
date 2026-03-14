Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD6A37F8C3;
	Sat, 14 Mar 2026 19:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773517990; cv=none; b=DwucOT7jS0r7mdYOY/tqpToj9ql3pbsTfpom64y4WShw8ZNK6zpYDHTYWLW/QXeXMMgiNRYR3YefQ5j4qghKpiyYjpHAUk0in6Q2+fKfJFt16VhN9JQgDCL/K+JRHvGmbW2y/dpjgWpXxRtHSZzUrTrmRnTJGt+Tnuse6gXKQ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773517990; c=relaxed/simple;
	bh=FMV3Z1jgHx8XLL8+qqaKXYICV56RoHv1QYEYd4bocEM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FhLrITmwX589VWkVK+61AKyU0CNWhiG6/hHK5jM1rDahZ/8bdOBOm84E2DNchByB3BhK/2bWQrhHOqsQcVtMqMCbU8u64n4PdUsyRxRVc+9PQVM/LICmj+vJSvX38xGRm+U+6dbRpWuXgTsVGCSTDr2702Kce1e0TtEy0p7JOaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtgVXB5w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtgVXB5w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D15C116C6;
	Sat, 14 Mar 2026 19:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773517990;
	bh=FMV3Z1jgHx8XLL8+qqaKXYICV56RoHv1QYEYd4bocEM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UtgVXB5wmMZT+hB1DO9TK/tScYKFtsnzdBuvaukG3NKHEr9gEJxWgdAug+twTDD2/
	 yDHjWcWEmDtjTCXvjC9nUYXuXRgVkAA7uCRsC6+CxSaOmdnvZTpYCEnl/y5M9Ehmku
	 xbo9mMAaAPVvBhKz9l+lkJDWwQE8kP7BdOC5Pi9Grfy3MOHN57Ei1Ucos25EZnKdS9
	 G5C96D49ZHnQK32Gtisw7VnkgjRY8U/knvoDmSIybmdNn5kcAvyus0rErv5LcZvvO/
	 Nkqqnut/8s9GY+I7eu5gGTZ/i1zboPZVL5t2XadIv/sTaiK0i13XZiN78ULsaI/zsd
	 VU08yWXAqSGfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA22E3808200;
	Sat, 14 Mar 2026 19:53:05 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.0 (2nd)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260314185940.25802-1-ojeda@kernel.org>
References: <20260314185940.25802-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260314185940.25802-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.0-2
X-PR-Tracked-Commit-Id: 592c61f3bfceaa29f8275696bd67c3dfad7ef72e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 267594792a71018788af69e836c52e34bb8054af
Message-Id: <177351798433.1767956.1987225296573697562.pr-tracker-bot@kernel.org>
Date: Sat, 14 Mar 2026 19:53:04 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 14 Mar 2026 19:59:40 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/267594792a71018788af69e836c52e34bb8054af

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
