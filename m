Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3EE179
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Aug 2023 02:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87D41C433C8;
	Sun,  6 Aug 2023 02:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691289059;
	bh=LUacv/AIR/r7PWwqLxQ/G9X+26xnAlyzU6IO43tbdgU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WEYBAVHy/Vxel3cCzvFOk6XtbyeUmRMTPrjqamUoPA3ldI4b9gd4sZ9zrU2MWwuTZ
	 /3X1cBg5ly35hY61NdjaNdEIXzIWLAAAqtEtBzg14DVdospzKm73ElE3Cqa6fbFpyO
	 59jjAkT0L2LtDsicjcv+r4ZFH+fh5oHJ4ZMe2ZBue8E8XiO/zcdTI/BTceItBoBXQP
	 OklIoHysyeI7NzztNr0oFl+JlVKK23sFRT5kldtRnHZUkPc5SMyueV9MR4pieaii0p
	 oHeqB4uY3i0gbolLLWnt0mfKu970BEEHcRNeNrT/fvoSAVB0v+f+rqlGIlGOVVxqco
	 ZZbBFlVXGBHIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71773C41620;
	Sun,  6 Aug 2023 02:30:59 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 6.5-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20230805235750.54075-1-ojeda@kernel.org>
References: <20230805235750.54075-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20230805235750.54075-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.5-rc5
X-PR-Tracked-Commit-Id: b05544884300e98512964103b33f8f87650ce887
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f0ab9f34e59e0c01a1c31142e0b336245367fd86
Message-Id: <169128905945.10789.13818780079527137888.pr-tracker-bot@kernel.org>
Date: Sun, 06 Aug 2023 02:30:59 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sun,  6 Aug 2023 01:57:50 +0200:

> https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.5-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f0ab9f34e59e0c01a1c31142e0b336245367fd86

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
