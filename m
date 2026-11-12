Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508372;
	b=jT4o7rcJ/JIGyUMU01z4JTPkdyKSekjJNgUmrUfHKusjR4nDL2utxrFQjZf6f8gbtBwV
	 uUupBt052iBzkunULZEnuEBMvnAA51yGZDyZZNr13mTibmZSOR9+YcLlQUfC2jr3ZF1vq
	 G8RdZNcMUpPtFLV9PpDu3qCwRWQrIOHQbJusvaUc5Edi8Rbk0hCruEvpBJ9lmcrhAFMJo
	 LiydoYhIaqp1lZT0bHEY3I9vYn0rcG05w4c7l0uKvKZ6EGAj7GrI4DADPDBCMv+qyhSal
	 UnJmZWK7y+3P5e+rjMrE1xMVM1gZTx9lu5oPnVQhneW+McrShF11OCseGCkkbI6S0lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508372;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=dHCqv9lWJnnTb5aaSPUkItVC8R0GUcXe39S7KRqHEQs=;
	b=T/HAi1dJdbktUsFK7n38qzV6UxcD0E0NDdpHSeASHDDXitldqdWWkRfegjbDw0tdFhq6
	 5oGQeYlbG4E1OhCT9+g3fby/LbX/eZt1CaK0h8FJX19/tOSCkM32+04NgPibCo+9WKCYk
	 SDdYjAamCJmegAa9a/2Wjo2awD8wPcX4jaWDleXzE4tkN0/ntvR9wm/vMN3557F6dSHs6
	 Jy0Yp0+sXvq7aCvTfmC1qolun4+QeaF86U+HJqkiH7q7MB6rnzbQXPICXnNrawnmB3qLs
	 OClZePvj66gCYr/RXQXrFD/2tBDb3YMGO8okd4NobUsIXZIF5Wk5upHV7RqgCIH5P0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIWAoela;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D60606A32E;
	Thu, 12 Nov 2026 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VIWAoela
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A1A1F000C4;
	Thu, 12 Nov 2026 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794508371;
	bh=dHCqv9lWJnnTb5aaSPUkItVC8R0GUcXe39S7KRqHEQs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=VIWAoelaYlP/uHuHygb2rjZGhoTw/mLiR+OpxoUfTajAB+czTJWN7B6P9ygYnsKie
	 naEEak98BvBL7Yn+zIXCstMIhWQNpbMpt5Z6kJo9aMlhDpJrrg1oZFynPusGbbL2eX
	 OCtt7LpTpr0ivd5cLna1qs6izFp1Qfu+LMJxq7RM5SjovTOBFRocfLjknvym04op0f
	 nKgbRuWvp+GwaDPgo66Ei+lJdN8RsXnAorYhcesWbjFHqOoehcPhigQhRIQE6bbUfx
	 80eeNMxu196+RAPffkYnUKh/ccxdcXB/tlHXPPglbA4eS5umkJ3GdhAWhZaLpIryfz
	 63oU9acDIcd5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B452C380AAFF;
	Thu, 12 Nov 2026 18:32:51 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.4 (3rd)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261112055836.340104-1-ojeda@kernel.org>
References: <20261112055836.340104-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261112055836.340104-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4-3
X-PR-Tracked-Commit-Id: 1178120c3bed1733aea1c465200a6b42f8a7105d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: df43528e1bb685584394373bc60f71fbc542efd8
Message-Id: <179450837038.582195.3462804235634795755.pr-tracker-bot@kernel.org>
Date: Thu, 12 Nov 2026 18:32:50 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Thu, 12 Nov 2026 06:58:36 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/df43528e1bb685584394373bc60f71fbc542efd8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
