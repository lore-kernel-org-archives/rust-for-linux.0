Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4D3BBF0;
	Tue, 28 Jan 2025 01:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738026428; cv=none; b=SBbj57F5RDlQyaE+11H5JQ6lCXBx2aknUYiGFn18lyAyzaTGYW4E6YnWItVTbC28v/2YRr3kyxceOsvx+XuJHxJR5GGrgM8jAPIEUXEQuc9+2XNJKfhH7Q0DPKeB5Jx8JaZLeZA9+C+pQZF3xOqXcbchk2DHJQzJdCkhMD+pMvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738026428; c=relaxed/simple;
	bh=a/yzGm5NvUsWcoklZL8bK/C1wA81TFuQzi3PpX56m/c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=G5iFkEhkvVMR2GsdJD5aW5NJlSgSEOjtxfIJ7DFkQyhnW/QhoT6X1CohIes+Q10GW9Ken1dvBW2pbFR9qEs9C3WJAZObMY0Rsg0b/GvApl7sH5EKb2TCwrwnH8nrDnrYSnt+f2PKjbJ6yGBEx9e8yog3vI/Mrby9vkTZHT1+luQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1FsyAxe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1FsyAxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9189EC4CED2;
	Tue, 28 Jan 2025 01:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738026428;
	bh=a/yzGm5NvUsWcoklZL8bK/C1wA81TFuQzi3PpX56m/c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p1FsyAxeIUm0pBkPWg0KuPa8v/grCD+2OXtm34K7W/YRzn57Esl+DIYIsVTubBbLt
	 QJr9Vf6lytipXSZSCRxvKdBXvaweTrZG1jKOCkFaXtKaCRW1yHFR7Y654kiKZ/px3/
	 fDmmeIk/aCZlprLHoWcTo9zk8G6wdyRLTsMFsoOZERwVEVjolT+vTSgXAltNf+TEuL
	 px8WaMn8Y+g10HvhJuSHsrDqAcXV5K7l9LfLDWj4fjmEBrThVBFoTLblyZU8Mzbn2q
	 bu53gIGLR2mOyB7QQn+bafNhPBRsC4olMLgZQxrjRBLd9qYrRKN241qPl8RCj+aBiP
	 kr9RNHD9cn8GA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70AD9380AA63;
	Tue, 28 Jan 2025 01:07:35 +0000 (UTC)
Subject: Re: [GIT PULL] Char/Misc/IIO driver updates for 6.134rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5fJmQlVQmnnqAC4@kroah.com>
References: <Z5fJmQlVQmnnqAC4@kroah.com>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5fJmQlVQmnnqAC4@kroah.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.14-rc1
X-PR-Tracked-Commit-Id: 970b9757cb44c315b5c3da6b1b35a1ffb07cca5a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 13845bdc869f136f92ad3d40ea09b867bb4ce467
Message-Id: <173802645397.3281647.9563940970158072235.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jan 2025 01:07:33 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, rust-for-linux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 27 Jan 2025 18:59:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/13845bdc869f136f92ad3d40ea09b867bb4ce467

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
