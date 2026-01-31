Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68BF31A572;
	Sat, 31 Jan 2026 01:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821265; cv=none; b=a2UjxQk2nnEMST2L9nJCvhRGLN2LCNe7i8XqhoyyzMdd+9ptLUNJ0slkstJWhOQI//UwWiFUj++4ACoQny2ItvWUXasWqG/340sD8BsrVVCFt309mGcakNT9TTnObpDlg4soPSGcvTojE0HHGs/dvAfxICZLKXNoNDEw7qoDSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821265; c=relaxed/simple;
	bh=yY1R5WQGs23CTHATJ4O3RKUcrsejfnb+4H22gV+Hk5c=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=nzWSqC2IHiIpmkY0OZO7BbiEca5RoDXlBG332HtkvMGQH0TgRd8i5DCVKwClXKE9JqhP7o4dN0jw4dw7Fxh6TOCUKMz8wyUhVVGMi15f1ua3mF4ecka1I4O/V+yANKVACdg1N3/B5UVaIWErA/b5mdOirSKGIXtUTRd0TCafSvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeywMfJ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeywMfJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D88C4CEF7;
	Sat, 31 Jan 2026 01:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769821265;
	bh=yY1R5WQGs23CTHATJ4O3RKUcrsejfnb+4H22gV+Hk5c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MeywMfJ0FofG3wZxEPh3HIx4GtSBoZBj+vzerJRFChrUj+yHVLgshngGxLMRtztLG
	 DOe1I48osixCOmAfSuWKpuTIC+bS92mMUA3Z/31YCnJNh2tX1UkkvEhi4L/GC4waLV
	 Ipy1xFaIso0lm6dVzr0dtMaMhkFoYbdZmhmuWChTovLOhGS5rxUdf6GtX9fTSmj/PQ
	 C4xdCLMXu3Hjvf5Lfa6fYoxFBNhhjo/9dvtN3U01+MsIOfXZxIscJcBlX8jKnnS2b7
	 Chn/vp36bFKIbgWRuJ+T45EQJZEiuOOTkxd8QJvZE7cclJuxlSpKkxNhOhSWSU3hIm
	 rbkM+Fscce2xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 05DB9380CFFB;
	Sat, 31 Jan 2026 01:00:59 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260130221755.159543-1-ojeda@kernel.org>
References: <20260130221755.159543-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260130221755.159543-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.19
X-PR-Tracked-Commit-Id: 5016cae970d7d59d62aa4f6f11455a9e9630dd1c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 367b81ef010ad3d0986af32f594c3a2e5807b40a
Message-Id: <176982125769.3947395.2166859998401084678.pr-tracker-bot@kernel.org>
Date: Sat, 31 Jan 2026 01:00:57 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 30 Jan 2026 23:17:40 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/367b81ef010ad3d0986af32f594c3a2e5807b40a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
