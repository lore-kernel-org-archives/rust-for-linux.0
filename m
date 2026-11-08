Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167177;
	b=TeUUFl/N3CvHLrcy7kumVZjoNOv0jv2zNSFQfqKper48eUAARRyCZzzcQnGWRm0bqger
	 5KBJTNR5LSCy/5NdQKznML5+wK8ZALam7AGFgp8M5XMyFNs6AIRUAYh55AZ9Fqy4GFAQv
	 2/WbOJ9t1LQO9/JxS/f4BqSW9xXQZGAfkePqi9Plw+NeW8FizslutJkr2ikDuutmoBbv1
	 mQVAuBYk7hK3h3rskMDVeIjmv8UuTa4ZMG82UmBGFXh6DXj2EJSH+el+GnDeQ1UbSYSct
	 gb0XupDcV7pI0Y2G7Yv9wLhkAxirxgjvTCpzM1F2A8pzVFxMoS49twpFMNSl/cBpTOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167177;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=AuCAgYiC3n+Jv2yY5rZTQ7zkNasnfQt/+d3WZ1SSg/Y=;
	b=OwAy0V4nOVNb7vc1XwpKwMoYrogcm1wQ5EaBzCT0q0A8db2L1Vn+9ZqbBrGyl3LjGVHP
	 MNv5CvcHQuyeuLznrSvoIZZbTBh4l65+KWvCLlS1SeycDaqBlVcRKPka49Nz3GXz68oEc
	 Em1aIZ+Q7Higjddb6Z1hO68u57rfJutE6QPI8v+LXvVrV5InG4g1+e4shn0RIJKQBQC+u
	 DcVs4Q38cQztg4y1x1cebPHJSr5SYlqWAGl+lJHTVEQdRmDOzaDdXgMbZafcwi+B5vlv1
	 3BthR0DhcRGbDhGGIRMQP3djkuGwPKzxi2+98bM3VteN0SXjeyaeO7I1mRLqTYcJqqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUseGnKx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40B606A326;
	Sun,  8 Nov 2026 19:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUseGnKx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50A21F008A2;
	Sun,  8 Nov 2026 19:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794167176;
	bh=AuCAgYiC3n+Jv2yY5rZTQ7zkNasnfQt/+d3WZ1SSg/Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fUseGnKxhrkpuDroAberiVKbkqOItiuOptl6p9Y2LTe7SZJwP5tz/Z4fOd6HkJlvX
	 kWZeSE3bhqFCHKWhESk4tjbleD20+5oGPgKiFB31CHeJKaZF+rvu4joET91yj4maix
	 QIJdxnKDlNO0XsFFlUg0QCzxSmbio20i2sVmWMQHHOVwRGfFkYpww3sYjZVXEeh6Z5
	 zIkNVXt3cfJ9s2XdRidNr0T74UFdQnfWMwV05P70MSqDWERFRdq22IEtRpzDNXX+6O
	 Oj8ZWBBAs3MDDGi+ujNcPb4TTFdpzxdYgfEUGSDp7krPEUBqI59e8TWYYulMKNCekL
	 LrWGoyhfM8q6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B2B8380821F;
	Sun,  8 Nov 2026 19:46:16 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.4 (2nd)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261108041659.97199-1-ojeda@kernel.org>
References: <20261108041659.97199-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20261108041659.97199-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4-2
X-PR-Tracked-Commit-Id: 57d916a3eb765ee0577d269bb2ac1bdf3a7a7f40
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bef911b8064db38d32ccfed7f05ac639978180d6
Message-Id: <179416717527.1685596.3377852099809721701.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 19:46:15 +0000
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

The pull request you sent on Sun,  8 Nov 2026 05:16:59 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bef911b8064db38d32ccfed7f05ac639978180d6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
