Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D80311C33;
	Mon, 12 Jan 2026 19:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768246905; cv=none; b=hkiugdhhV90z+LlWzc7HyFmK0Tm8jPa1dZWRMlbxKo6Wu2cMgRj19GtXlQtUvDfCioOzFR6aExRHDNynUhTG/TqFkEs7gkGZo1C+fyRtKIL/zRKOAboKs5rZy3eolTct0iDFsSOsejRtqESKnmPViigissaziWuFa08WN4bAVoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768246905; c=relaxed/simple;
	bh=xBXZ4io4gn5L0gntQWxJxxnzFrll6Mhx+IdVGopsTlY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=dm4SmpNMcxMKTGAT4TzV7VvxsnGtdHap6QOgzMjDDL7tm9BJYL9tK6aGwjQFa4aVsd0CIUyiJoeU5vZI0xAgnlyntr4Yq28boRl0idJlc/tktLP/etAsueNfcDome7h6FPL5A+IejY8hBwazeQ+r1hu0hNbE84HRtsyhi0EzpQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtgrltNg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtgrltNg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188F4C116D0;
	Mon, 12 Jan 2026 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768246905;
	bh=xBXZ4io4gn5L0gntQWxJxxnzFrll6Mhx+IdVGopsTlY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rtgrltNghR7mHkNjxDcDUPgqNp1Xs7iGp+zyUKaAjQKaEDFQ7HNml6l1BmlMgtvss
	 OaASt/jsWAFaVIW2K28OZ5164maVgHUNh40yFm0YR+mcrMc1i1ocyGeA7GXtEd1siv
	 ern11BhWJd0UI/rTnMSP1rvUubKBrdmevQGc14+nVsh9jSU+9FjsZwDECQg9xmJfzd
	 oUzotg8qHE899xuRt0Bi3B7+J3+zRmTEqXKLeVCFMX8WbzrC71ihUDrxxw7ONyna3w
	 XxUjKS8W6Cbz4HE5LFWx66WZW+RkE5pdUjVQhg2tk4+XjZemT0RvC0wLHDVxO7lGUC
	 RFz3vhn4iNpsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BEF5380CFC3;
	Mon, 12 Jan 2026 19:38:20 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 6.19-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <DFL77VCNNY40.3GCIR8ZYI14RU@kernel.org>
References: <DFL77VCNNY40.3GCIR8ZYI14RU@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <DFL77VCNNY40.3GCIR8ZYI14RU@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.19-rc5
X-PR-Tracked-Commit-Id: 8510ef5e3cfbd7d59a16845f85cd0194a8689761
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0fa27899e0147fe180b603bda30930e8c145dd47
Message-Id: <176824669890.1091852.4883981194645327359.pr-tracker-bot@kernel.org>
Date: Mon, 12 Jan 2026 19:38:18 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 10 Jan 2026 21:40:50 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.19-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0fa27899e0147fe180b603bda30930e8c145dd47

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
