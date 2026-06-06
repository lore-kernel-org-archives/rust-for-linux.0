Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22DF2882C5;
	Sat,  6 Jun 2026 23:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780787355; cv=none; b=YQxQQUDKUGJmrFSaq4DQg5SDIm8GASBjUXQScK/cmGWmCyF+LmBYytIFaldF+qAOykL1p1DcTziZvKG8gMVW9Sq3PRMxgyWAjiXmCfQ80LNQhS5OitevYaihKW+0RNDyXqR/wvNoFChZFj2IqZHACSzCW290bYFVanQXIYOUXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780787355; c=relaxed/simple;
	bh=1RwLExY5gBKueFBMUiWYDYp14G54t24abMH9G2uRFEs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Pf4keGJi7EO+Ho14/1kgqeOzl+A+kmIWiP0ZQhzKPr9sKDckSHegTNjiQSaV7pmhOIwXNcumlvT/2wC3rBnExclJNjOjP2ZJTdUA7D6kTo1OVXCip/dPqJhnpn5S8Wo0uyQs4y/GuZudsWgH4Zb8kNX5tvJgfZvt1GFYAwKTiSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaCoWrzb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaCoWrzb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A44C31F00893;
	Sat,  6 Jun 2026 23:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780787354;
	bh=6sd+k+ZBf+DeXn5qX60Aph3Jc60ECQ2ZUy2CTkgVJ9U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iaCoWrzbSjtWkT1b5Ie9URbfBMMxWqcvMW5BJXuBkY5gYpdaF6POlbsM+/rcjMH/4
	 M3DFIZUc/PoatxbfmZgz6DLMALK6sC6y9JW5UQenB80yWVpqS2MxzKW/d7w2R+UEIc
	 g0Iziw4NHzFxEPiLfGNpwA1eAx+fMQqaYL+ORcBkymzmj776orx7rzPc34piub38zB
	 2mXekAIv/QZOnnJzkgW3KvvkkhgtOHI14AAW9ZQl6rVtIcRGDW+eCF5k25Si29HNF/
	 n6DB9cT9Iyu3rJXvFtXDhfJ4VCn1WeqxPAvlJofk5SkA+aJq6QE8CFIhLHDmnmEEy4
	 p23/ZK4yo3EQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9399C3930C37;
	Sat,  6 Jun 2026 23:09:15 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.1 (2nd)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260606113618.12487-1-ojeda@kernel.org>
References: <20260606113618.12487-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260606113618.12487-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.1-2
X-PR-Tracked-Commit-Id: 905b06d32a52afe32fcf5f30cf298c9ea6359f11
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d054796f8bb7d0aa9068d83feda76fe3b215f991
Message-Id: <178078735427.53577.13444954312667957228.pr-tracker-bot@kernel.org>
Date: Sat, 06 Jun 2026 23:09:14 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sat,  6 Jun 2026 13:36:18 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d054796f8bb7d0aa9068d83feda76fe3b215f991

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
