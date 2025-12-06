Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7818D227B8E;
	Sat,  6 Dec 2025 05:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764999923; cv=none; b=bIMy9n4jGxbhxGZ0tp/UV4NXm77OybH0HgBD6tHwbuDFpefImbQJoN7HC/H2TEFUZR70ZgtHcbwDYpndP9kMYcy22PPgN5B8NhnW1lGAoIMVnQaHCLRwiLnUVnpHZoCV3a9Pw+oA/8u+5MZmC6UlqrlPunKdIPPObDavktYgfGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764999923; c=relaxed/simple;
	bh=yRZh/1tkGpT4hWFp3oaKQzjl2wzgnVwbMJGIBgnkVFE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Uq4UWQwxDbZkTQb7lZwN65/Q4G46Y7upmvZCdnRZbfBppCyVubBcSJnJj1bVINvp28yi5Auo4rtpqS3cUsd9K4Sa5nmDPfDPK/TJC8otdrCYLmFzfN0FOg/Q+RjYSHvI5cdI6nzq+wBGYGjnF3BQi04yRivCZVHMLvvHq0zpKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hq5eoGHo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hq5eoGHo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00964C4CEF5;
	Sat,  6 Dec 2025 05:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764999923;
	bh=yRZh/1tkGpT4hWFp3oaKQzjl2wzgnVwbMJGIBgnkVFE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Hq5eoGHoDrofQsK+NxBaGjxcRgHCEGAf3mmL1+/GsjSmMBG5e0a7XEsAUaGppvqnk
	 J3KGhm8hbROO41XJ5YpIFHesTWxRNr+h1fQ4hyr3PyPtt0iI2jk6RX5DoZPO+1u2p0
	 hqWvlDELQixR6yPBTqCrjnzObEDHroVdgreUGm/1qX7veKXITfGvcb3oeVtoQgS3kD
	 3FbE3DHuTJ1vkagcof0VfHVNzkTgjm5GlkLCWzzym52//hl78arArI6lim+QtWZcmR
	 Irj8S0V4UyAxOWXnjSa10Y1ZsNgHACIq3ZhUxq9ztIBIDKSXPbTqqP88xYIlTvzBza
	 G+aPeqqflE69w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 78B3B3808200;
	Sat,  6 Dec 2025 05:42:21 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core changes for 6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <DEQ6U11MLIQW.370OVLWEKUIKV@kernel.org>
References: <DEQ6U11MLIQW.370OVLWEKUIKV@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <DEQ6U11MLIQW.370OVLWEKUIKV@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.19-rc1
X-PR-Tracked-Commit-Id: 473b9f331718267815649cd93801da832200db71
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 416f99c3b16f582a3fc6d64a1f77f39d94b76de5
Message-Id: <176499973999.1995407.13187679258556932219.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 05:42:19 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 05 Dec 2025 22:50:06 +1300:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/416f99c3b16f582a3fc6d64a1f77f39d94b76de5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
