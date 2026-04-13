Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437D623C8C7;
	Mon, 13 Apr 2026 17:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099652; cv=none; b=UYRWuvi+foR1Pro2VRo47sM8x4IsP88P6/yy/FwZRC10Vj/8HcvdZ7d7njNfq/vLHAfYbRpYRfatu/wXBD9Id7QW76OLdDHdAx5iaT2fAtWbXDEgiurcshuigAPywvj7feD3fwU5KzB8O+sn035HYZ0YFaK+hWvttpDSWZbrQCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099652; c=relaxed/simple;
	bh=RIBNMzf11BS1i6SffY0/7y+1r05pu0rd+9BfdOHrUVk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=eRNQPDr5zUBnwNSqsInZErDVwjbsNfvfDIBIODNJ4m/aNNiJyIkdmkuICwzrTfB/vyw8joEv4ch2RC1LF3rLd/HylEKKcJfYPdDGIjBmhuSpghd7uDnwya5sGSWPD9YrWqe+FjDeHkZoKqfRzRmyuawL6LoAMYJdwJj0KRRWCMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJgB5e7w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJgB5e7w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E32FC2BCAF;
	Mon, 13 Apr 2026 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776099652;
	bh=RIBNMzf11BS1i6SffY0/7y+1r05pu0rd+9BfdOHrUVk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BJgB5e7wjfJdF4pIeVX1QLpeOMuh+mrMlLfLDaXQX/tdxddlxAxRFWmaVwYZuJPr1
	 cmb3oLaM8Yu37HJUPnM14++Ojn5aeF26WaZaEOs8oIA4heUZcIawvt8wiSzazjmifs
	 c2EUFyiqg1dT7nSqX545ThA1odVbP3HkRLa7X2C58Y87VP5VIhztOatGCmRM44poks
	 w025bjmNn4gzIhk8+6h8vHUGP30g+delWzy/qdv+xK9KvBPOLq/lr2jDRzRwu9SweA
	 SQH1YANZFUBlj9uwMUlEEkMDv/Tf8q7u59s8mvIvv9IqzSLqeXXCMq0rQfsKqRdGYh
	 8/9x2MjvAaR4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC9083809A8A;
	Mon, 13 Apr 2026 17:00:24 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260410200429.138694-1-ojeda@kernel.org>
References: <20260410200429.138694-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260410200429.138694-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.1
X-PR-Tracked-Commit-Id: 8a23051ed8584215b22368e9501f771ef98f0c1d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 26ff969926a08eee069767ddbbbc301adbcd9676
Message-Id: <177609962407.442142.13297695520530929820.pr-tracker-bot@kernel.org>
Date: Mon, 13 Apr 2026 17:00:24 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 10 Apr 2026 22:04:29 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/26ff969926a08eee069767ddbbbc301adbcd9676

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
