Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110E030F543;
	Wed, 24 Jun 2026 22:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782339423; cv=none; b=Q1XZf4lR1535Ko09eeUJI5kXoBvFAzpFe/VmiZsYrDxpWkA8OK7yAdL6kSzJVsCzPoJKU2g1tqFoWwKU8BihDMPld+Ozs/OTwJWe1+qvJvjcdyl4KBqh5vfLXKsnL7SXQOfy+sFZeSdqIHGoI1yHxUOzIYmhOequ+RAyizHtWtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782339423; c=relaxed/simple;
	bh=/EiP+iFQW1yzkj9YnpG9bc29pucY3QvuPH9YX3igaTQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=bKsZAZt3FuZB1WDwyzpE4KUTWM9zhbiGQ+ondDV05kQI7U4xlC2lvWfYnapFW4PMwfhsTHJrKBI1W0PVYuQOkZiyolqdrtjdmoZeECyI5EtMznNVGauuR3f8rEdVHS8X1nMN5stnyE8196zxEHugshJd+x5HKZcgOI589aAAp7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrpFG5oc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrpFG5oc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED4F1F000E9;
	Wed, 24 Jun 2026 22:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782339422;
	bh=4k9oPc88OAxOU9yB7nZE2t5/JT47Tx0NJOnZswpAtXU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hrpFG5oc4RgxvCK+5CWZECO6HdXQoOtvRf7iQwXB6wxaSDRQ3HyVdcLQDdLJbTL9x
	 rwinNyCGd7CChqkW+YZBw13exPVR9zkcYZUY/N0HN4/q0foeMR8+YGTy9P1l7dZamX
	 +Xs/Qtp/fhiGe6bGXF1m7ZV39wOSpb9cMDL9Z/FqhhtIMW/IX26OCKa+yoFnpi7pQK
	 4LE+mULLLX5Aj6AeXqeIssxMTikYqftcggWn+ohCD/0h6mL8Vp5LDIaFgswEojx2ad
	 3gDtgw+Ewc0TN3dzwpZ+CCbROzIkOBcF5lthzFkqsNsPdY35TpLuu1WvYDfCVjBDB3
	 6+52YKTX1GXdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A9B3AA6A7A;
	Wed, 24 Jun 2026 22:16:52 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260624144630.585128-1-ojeda@kernel.org>
References: <20260624144630.585128-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260624144630.585128-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.2
X-PR-Tracked-Commit-Id: 191f49f1e38b1c10eb44b0f967c6175c884ef7db
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dcebfd2c1404d1c931e86ec5168cdc006d503909
Message-Id: <178233941092.3002918.3126611492143412876.pr-tracker-bot@kernel.org>
Date: Wed, 24 Jun 2026 22:16:50 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 24 Jun 2026 16:46:30 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dcebfd2c1404d1c931e86ec5168cdc006d503909

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
