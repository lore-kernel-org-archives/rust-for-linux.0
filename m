Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5301826E6F7;
	Sat, 25 Oct 2025 18:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761415975; cv=none; b=quFAQ0/bjwZzO/Jo/LJm4LMFxhAXSCu7Fdk2CN4DG5vUsWoXUcrqLvVoIPstIUPpMFMqdvRxUv27n7uXNeQhLQuxMMTqjTPjSjs52sviaPeRy9s+fK1iawvszuqHadfM9GfRSGgBlwLYXZ6uX4fl6RQcWPeknYOC4Q6qkmsEQOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761415975; c=relaxed/simple;
	bh=jrgpTmB1advmZP3qBSuWEgSCZNIg7NoZx596M4JJZE8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tb//nC4wpmKG78TiQcU2gdGCJu4HZ312300pammTKNrx2LKJh6KRs1D+qjoabSxEgVlSUjoBgtTPTHm5Usy4NNdirawKmUiCrcQbSUiuR5xoThR7IL3+zLUS3iDRjRkA7RgVZkJn2FqWvalZtmH4WsGXCWE6YXupMLO7j7Xju4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwhgvCdd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwhgvCdd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFF6C4CEF5;
	Sat, 25 Oct 2025 18:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761415975;
	bh=jrgpTmB1advmZP3qBSuWEgSCZNIg7NoZx596M4JJZE8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bwhgvCdd51t5YyKlhwN6WIMPfePNaTzJBi2QlywOVtIFcQ20cVuc82Al+Kbp+4Yk/
	 n7Gs7cqm1k/HGRR6d7WwQJwn3jjLFqCaPsVrN0vIA3rU4aYvvSEts+KtNoXesAyq9v
	 +NSHOLvRPbR2wWpL5jTpZVTwbd9uQ3k3naHeTc5aNbM9TuWBynrj4ORpn/a8rHjaOi
	 ujs3eVtP6ho+qLbRz9M/LD+GrTDwIIrmOA4pVq/WjxvfTefsMfki13RcJUk4JvHKNa
	 hwDg//XJPMqGhPIKbnxTIG7ohMMlK6kIBFuCZNxH5MTqbXei8ROM4cUwl40IZPa2A7
	 DL7ToEOIRsREQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3C2380AA63;
	Sat, 25 Oct 2025 18:12:35 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 6.18-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <DDRDUX7T9JLZ.NO8N2TZOIWFO@kernel.org>
References: <DDRDUX7T9JLZ.NO8N2TZOIWFO@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <DDRDUX7T9JLZ.NO8N2TZOIWFO@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.18-rc3
X-PR-Tracked-Commit-Id: 2eead19334516c8e9927c11b448fbe512b1f18a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 72761a7e31225971d0b29d9195e0ffa986b77867
Message-Id: <176141595415.93029.9538572402517443447.pr-tracker-bot@kernel.org>
Date: Sat, 25 Oct 2025 18:12:34 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 25 Oct 2025 13:57:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.18-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/72761a7e31225971d0b29d9195e0ffa986b77867

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
