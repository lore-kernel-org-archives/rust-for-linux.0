Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD49C20DF4;
	Sun, 12 Jan 2025 22:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736721369; cv=none; b=ghj8PeuulojYCvPiK2kj1qOvigDR/iHG538y26fBCn/DC4hGKJYidxKJ7LFzQBo2LnX6NWp4YNOEwrFS3NUO2CoFExxvTshbUyE0C+tPcn7eq3Fc1H/QIbR/XwS8Ew1BshE+gvcOX4TPVTxtH2HKcNk0h+qrt5quE7FiRUG6Ifg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736721369; c=relaxed/simple;
	bh=laEGYIClynH0Q4U3edKVMZS81+LXONHcgTC/ebqKQQk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kpndGU9g7te4YWGUW+Z4ssxE6JGgrSf5FqPGikz3ahYV1WkIGNvxOvqxQ7mcKisRGnmsMeqp5/Z0jpG24eZ0YKuMBy2enc11m8/Pt8PH/IXNBm41EyLutsAJKyh6512HiXadrgu6mnTv52EmMsDjUJkysBUfKSh/BbAcLupVOkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=remejV80; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="remejV80"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFA1C4CEDF;
	Sun, 12 Jan 2025 22:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736721369;
	bh=laEGYIClynH0Q4U3edKVMZS81+LXONHcgTC/ebqKQQk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=remejV80oaf1jL2KV9OFysrn5zd6zLL6EhMpScbQ9kRFajq4v59QTJH9XJzPrTcrj
	 7ZYTR+wgmVL2/idoyw4vBCJNrdm1jYzYzsXlQ9P1KgxyfqB+iQw/S2axaybUNUl8n/
	 0fjptHj6X4/gQvtCK3Yzoj5lD/8TfhWX20TDdsk98xktA8IY28wA+DyWuzSDWixNQu
	 NNZrhdzHzUWWSkFBGsvp4vHK1pk17apGwXb64BijL8zYgf+gb3wGoudk9eEa4piKVF
	 wcf+d0TK4IvHqvIEPCIkseUc3+UpyRH0f0G+anKj6LqGTxnOHIV0SZAGORlS0Vmpj1
	 B67BuEYg5lIxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F94380AA5C;
	Sun, 12 Jan 2025 22:36:33 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc/IIO driver changes for 6.13-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z4PMdA-E4_Ifi8sK@kroah.com>
References: <Z4PMdA-E4_Ifi8sK@kroah.com>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z4PMdA-E4_Ifi8sK@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.13-rc7
X-PR-Tracked-Commit-Id: c7a5378a0f707686de3ddb489f1653c523bb7dcc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0cbe10470b4473ab5e290f1d39033fdb6d6c69c9
Message-Id: <173672139177.2663698.4166162816261755433.pr-tracker-bot@kernel.org>
Date: Sun, 12 Jan 2025 22:36:31 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, rust-for-linux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 12 Jan 2025 15:06:44 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.13-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0cbe10470b4473ab5e290f1d39033fdb6d6c69c9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
