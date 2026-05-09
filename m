Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98103822A1;
	Sat,  9 May 2026 18:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778352017; cv=none; b=XXZaXGvnkcoQ4l6NlNKti1JBI4gbS2lnMiwSgde1SZX0ENLV7wIBUrAHFjX08Qvf69LXlwbo6TbTRQC7sWuFU6YaKpj4klF56H3wnWhMk90kWBtO7qoEE1q72H7QJ5CwAciJITR/XfecrjxtUx+4B67VaAAevWzMMKEEzTy0M44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778352017; c=relaxed/simple;
	bh=eMj0wPfNCMUX5OiMPC7szzQh1qN6fb0Sl8xsvtwY5Fg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cM5sWjI2//PeA9CUnQDFsTID0KAlaktQhAM5sRsrtqlmmq5HxWt4UmBeWKzJ1EBRNnSobs1oYYY26yOafmreikUx88YVZ104Nd15VOZlybYfieuu4pZYGziGV0k0kvtL5GGRPh6dt5DjotCyoQahmR7UexsSZwdcRY5aQCX3/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7bTDDyG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7bTDDyG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A57C2BCB2;
	Sat,  9 May 2026 18:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778352017;
	bh=eMj0wPfNCMUX5OiMPC7szzQh1qN6fb0Sl8xsvtwY5Fg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Z7bTDDyGfGi2oRXamzaE8Ng2r+IHuH6oMltwH0caTt8++9KcOpeTJv7BtRYUIlB9R
	 lsYNBaMxSBHxmGHRgp01y3CAuoYmzEix5VSDNyE7uJbbjmt4WVHDKuU8QLn4hYBojL
	 I2CKf1aG6ceizN2AwxSytCXurvpOLg1pheItZlh0rz4gvTaGHblLs1Lr0Nc/+vWJco
	 +oU5Y1s06yE66EYaxpHIWCaJhwYSDdBecAGdFMaztRG0wq7nVKswj1zkwo/Ee6ZLai
	 kGktauGKSKg5QERDVO85zM/9JMXjGWi9VgP+VKfQaI8OmMBqYqiQdDvF2aRiPSqyQV
	 CRmnvYhz6zXZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D0D83811A5F;
	Sat,  9 May 2026 18:39:26 +0000 (UTC)
Subject: Re: [GIT PULL] Rust fixes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260509170412.45089-1-ojeda@kernel.org>
References: <20260509170412.45089-1-ojeda@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260509170412.45089-1-ojeda@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.1
X-PR-Tracked-Commit-Id: 2adc8664018c1cc595c7c0c98474a33c7fe32a85
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e92b2872d0b198a77c0a438c5cdb1c5510762c1b
Message-Id: <177835196511.1150828.13214944204536344533.pr-tracker-bot@kernel.org>
Date: Sat, 09 May 2026 18:39:25 +0000
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

The pull request you sent on Sat,  9 May 2026 19:04:12 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e92b2872d0b198a77c0a438c5cdb1c5510762c1b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
