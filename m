Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B6E1465AE;
	Wed, 22 Jan 2025 02:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737511556; cv=none; b=FPaMxYN7/sIVGkzUKc0WnteZGTGxbH928rC+NAAKJLHjdSV3Y8SpBBZoKW5X3r96qnkJMdJwqtBaHDE3t+cFH9XuAPRh1MGrbpstEqxreOFsxyN5Cji3ZZKWOZSUv2Fw4JHZoT/HY5NDpRvAYtkdtULNc2rv0CLd5OGuKz7TrAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737511556; c=relaxed/simple;
	bh=BW2VZphUgr9uT6ImMSM05WYaXL/Ya6fnXyzEGNVdO0U=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=q7oAb5Zhi18DZnOGMgCPMoKEfY7cXkzbbyLsHBCwrWxcs+wxEBnD/qE4vY+ch7GiwKLWrH5foy43poSdwxR65OjbmaD2K/vyZLBpFouK2/si2Ae64u2B6RJiNVJIjC9L0tdIp9n+gAopAieIBQZ3wRIsqyRBIEINqsF8WAyn0Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nK6vQ3+X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nK6vQ3+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F38C4CEDF;
	Wed, 22 Jan 2025 02:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737511556;
	bh=BW2VZphUgr9uT6ImMSM05WYaXL/Ya6fnXyzEGNVdO0U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nK6vQ3+XMaV7XSMnYVe8B+UkIrFUMUtKCq8dUn19urp/wjlKG239ErYRoxwoiuj9/
	 MEgZBu8OL/pQ5YQFQ5H+ybNcVTEPJsXMs5cgyYXDIvtsPCB6abYf7rs2Ri8CStQF/H
	 jStOY991/Jr6+DSFEgvPdMUjuIuPusXdNrAL8NM/nYszkvLgI0RwDgf26jx6TbHM7R
	 nR7fhlOutTVZRbewjQ9WNjmlZYiFiEl9RnYF5AUFw1fhYNPiNTlhs4tBrsumBnl0X1
	 MPQNhWF8CE8s/CTGH1FLGKdnoiXAuXIdW0GKH7Z4IUBCbF8oTLcIWDp3W3Zq0SBOz/
	 h93z9EJXliHsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ED3D2380AA6B;
	Wed, 22 Jan 2025 02:06:21 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250119224352.365202-1-ojeda@kernel.org>
References: <20250119224352.365202-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250119224352.365202-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.14
X-PR-Tracked-Commit-Id: ceff0757f5dafb5be5205988171809c877b1d3e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e3610441d1fb47b1f00e4c38bdf333176e824729
Message-Id: <173751158063.200830.3661058484136109992.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 02:06:20 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 19 Jan 2025 23:43:52 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e3610441d1fb47b1f00e4c38bdf333176e824729

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
