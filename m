Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF1A3563E9;
	Sun, 22 Feb 2026 20:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771791536; cv=none; b=esTm77c7x9IyrLArj1o8xIOPuCuOY59puRTHC08EOUrk0FIOUK6WTvFj/wPRnHcALrilw18chMRl9oYnHJhHGwzugCWAikgfh0n7bMN0VfZ6HnXmbRDdwTrfBQ6gFcsYLoz8VlVZqDuIEsrGs9EIRrMm+pjMV0/jBVo7JEQwRgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771791536; c=relaxed/simple;
	bh=RJ5UqpTSOvcjMaCOK3kGanRR9nFAHWj8OF1Rfh5VjUA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=roL2+J9pDeLjcgGezfRLstvH8plptoFEvlsY52x/8TuP340LLwcdG5+Z2WTon9UgrzJ5RBKvoalKXjgOVt+flLCkKZY230hvR1SHsgaXxtnBKPyJKSRt0eUQUoYCpNo6O0oAKg/t9ZhaPbI1JswL4NpqV5CO9C/B/HuZ39+bzoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sk22YTqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sk22YTqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359E4C2BC86;
	Sun, 22 Feb 2026 20:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771791536;
	bh=RJ5UqpTSOvcjMaCOK3kGanRR9nFAHWj8OF1Rfh5VjUA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Sk22YTqITWxaX6IWXkhx2IfUo+NLV+8QaVeFYCtWC3qnHuKsfJSZgIy3/gUggQBci
	 TExrk7d0gZ0+gVo7AAWP78MzztRJ9kz2KnSEZQgBJ7FYsj4dLJvdnwLbwejIlODbpi
	 uOADaFh73sWBaS1MZu3NQ7ldl1/WycrZrpwz5h4x+W4zK8fbPZKvYoREvsiLqMKa0L
	 ohsDbzoz9VQzHl7RVfMJgLDGi51J2HoTbkH8+ydZ23FKQIIDM0AtZIlboxg0B+Nv6l
	 8PwdxlZDp9FkOW2wM5cTGjM0MP91w/DV3EYUWpppMkxCQqjH1TxKoVy19vb5dw+IJP
	 OEpe8Q7s1bMvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 400003808200;
	Sun, 22 Feb 2026 20:19:04 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260221203306.133927-1-ojeda@kernel.org>
References: <20260221203306.133927-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260221203306.133927-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.0
X-PR-Tracked-Commit-Id: 97b281d7edb2ae662365be2809cd728470119720
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1dd419145d090f8fdf149cbb39dea6d968659dd2
Message-Id: <177179154298.1490320.1315513153620094557.pr-tracker-bot@kernel.org>
Date: Sun, 22 Feb 2026 20:19:02 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 21 Feb 2026 21:33:06 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1dd419145d090f8fdf149cbb39dea6d968659dd2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
