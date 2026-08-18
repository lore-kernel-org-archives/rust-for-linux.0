Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E36485CCD;
	Tue, 18 Aug 2026 19:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080554; cv=none; b=CJGclGY3mjZpAiuBxeqtbIfY1Pbps5lfS6kPFCr4WgF2/WDLLzNVANRs9yTvktdNmgbCN8Q8C2HBFRg7ompmvzLMgAymwJALDjdOZi4jrP/guM8D3wcBjdl+CRrstY3ODXZG1iU91lD95kFH+khvvh/jPg2Gk6UzMXcYfGVR41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080554; c=relaxed/simple;
	bh=/uBLwZ/5xJgVy/QqH++vez4O1vtNcZgrI5JcvmduZ/0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=odib0d+2+D6w5NA3RmcYEMaVee38RxlLtkTMpuDEcXO4HeOoflOJaglQYrOEMApa+XNcMo011IG66dmnJ3RNaz4gAoBENALl4YjHv1oD94oa546FZ0kc2w+DQ0dXNtDePxGZFhNsFhdFcirHwBvQ1wCRcmifQAzW7NjpaRW7EjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHvwnV0A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHvwnV0A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925A31F0155E;
	Tue, 18 Aug 2026 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787080539;
	bh=ZbGj5D1m+mMizFLoRCUqyx5GnfMRCvq35q+AvLr/H18=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=BHvwnV0Ajlv52F3kGT0/wfKAw7lCK0NGUg+qdM7gVJIfgQhg7Q/dYmy5mz5Gb6TRj
	 EOWDqsyft/eM74LtkUrNdFdolqNf/9wtjkusk76hgaqEexXXz+iy+Anhl2F6nCtNKP
	 moIGFvVGtUvKxpukiu9KVdZsk3e2lvb9XJ63qZojJH7dIKngbzgqoxiZ+vFckOd1V/
	 jejTTwMXS/lBB1YVsOIbsrHYxqeQ3SjnqcrZzn56hlAWGIhoilx2GHNBdL4NkeeywW
	 e7EWjDr03SG6WIY9+1nDuZGVn18eVGm6wvQv4bReToNjWm8njG2bykJ0OrDnR3v4v6
	 Bd1bU18yg8Etw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568993927051;
	Tue, 18 Aug 2026 19:14:52 +0000 (UTC)
Subject: Re: [GIT PULL] Rust for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260816191926.230123-1-ojeda@kernel.org>
References: <20260816191926.230123-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260816191926.230123-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.3
X-PR-Tracked-Commit-Id: 47f27155f17498fccb1f222f79089642337498a9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d24f5cdbeff8b6a063fca92d0a1f94122a799b59
Message-Id: <178708049100.2235733.5067774564761139342.pr-tracker-bot@kernel.org>
Date: Tue, 18 Aug 2026 19:14:51 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 16 Aug 2026 21:19:25 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d24f5cdbeff8b6a063fca92d0a1f94122a799b59

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
