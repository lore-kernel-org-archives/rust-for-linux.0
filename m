Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F302DEA90
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702460; cv=none; b=hReB5nVvkylUWWwTQRrxZXZxpHbZOg9UZUcX66ZgHkh3DwnLjrhxaOSqM3phXHiCbPUKiQgpXuI6wR3GKWyY7uhkbzVkGnG+P2IaRjjkWvuWUhNd549jA9WDulXJqo8kH3Y0wkCM50T5jvPFxR1uA42x5Ohv0qolnpj4GBqoMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702460; c=relaxed/simple;
	bh=Rk6EDagjk8ZPcsNpFAOe6EZgoQWsRR7wwCTSWLcFgqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhNhNeywEoZ/Lzv36FW8EM/IK2fgGZ6wuhiJiPcYQN+Yq2xJ553AX4OeYlsnrCj9QjA1F/0Feu5SEJ4inJjvRYb1ELWSopk1FknypK+yUQ3iTh2PbpXzy0TbI51SSUY0C8GFrDdtFQkHRPo6jEVcm2k7+X2Q21VHrNh1rYQrixw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Api+KqkJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Api+KqkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5490C4CEF7;
	Thu, 29 Jan 2026 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769702460;
	bh=Rk6EDagjk8ZPcsNpFAOe6EZgoQWsRR7wwCTSWLcFgqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Api+KqkJNftsswk58cjR3zSF5qf9HwZRoLlCw1/+GchTTLUMV9JirNGGDrbZMKU1Y
	 69E+IK/IvHtetOofwyHuF8tdn3wYzV1gF253EBei9Cg0cBwJfePeC+yIQhcxCP0QXE
	 jg2jXv5PkmtRbShf7hrc5/Vgaa3kEQBb/0Cg/doNR8IRtvkYG1yI5yxTETBXOpdZPY
	 JZf+XgmM55mmlfCRoV2UiTtAeSgG7F4xquvPqB29j+Al+CW5QZi1nXwhkxMo0u8hSl
	 q+PjaS00nhK6TGJBmmHx8Swcc3vGMu24j59WGNBJTY6ZkO6Yop7Jq9zB7K8uiGqSuC
	 nVDmDDjq3Xgiw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id EBDAFF40071;
	Thu, 29 Jan 2026 11:00:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 29 Jan 2026 11:00:58 -0500
X-ME-Sender: <xms:OoR7abst7WYDi7lXaSG9nJB2eaFRwwrYcXnfaKHSHbcV_vtWowOFfw>
    <xme:OoR7aY36Vn3NOie-JAAQl5bpHOv8UCpkpdJsHhNbGEOYC9LHy77q74D3pdN17vbz2
    zLM-D_WzhlSdhPfF_yYWXiugYrmk1sAs08tNgnvzr0WN8jbos1utw>
X-ME-Received: <xmr:OoR7aTPt2gWk4H4CGlWGJdhOQmMMVVvGnTxkgJE3yEqUp7rds-t83ig1QX0s5QIyoxih_tYefeLOBFuIL5Mlppn6Ox2uFYp5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeiheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elueehtefhtddtgfejvdejueehhfekteevueeuueekgeetieeggeehvdffhefhhfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehtohhmohesrghlihgrshhinhhgrdhnvghtpd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgv
    rhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsg
    hjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepuggrkhhr
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:OoR7aYXli5vkBBuUtGzHf4WJ8tSdf7wyaygEfOmQjUsji6JLqduHdA>
    <xmx:OoR7aYbXKIQt8qsozYngkKF1x3rsZeK5rEC0U_9FsIjUvvHOxyZK9Q>
    <xmx:OoR7aS1M9fWpnd7HxZFbQuk0H8CVao5f6ORGmqYcta70fvWSNPUGJA>
    <xmx:OoR7aUDiiO9ztIOiqi6W5wWMG_51VsJW9GQaSoM_9nj6g0nqUiVapA>
    <xmx:OoR7aW9IOD8qd8tSeAMChgNmYOacnfJtIj26411ZoYWtI6sKVIdZOeuR>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jan 2026 11:00:58 -0500 (EST)
Date: Thu, 29 Jan 2026 08:00:57 -0800
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 0/2] rust: sync: Add AtomicFlag type
Message-ID: <aXuEOZDzwyKIZ2Pv@tardis.local>
References: <20260129122622.3896144-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129122622.3896144-1-tomo@aliasing.net>

On Thu, Jan 29, 2026 at 09:26:20PM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> This series adds AtomicFlag and switches the list atomic tracker to
> use it.
> 
> Unlike the previous design, we avoid exposing Atomic<Flag> and always
> use AtomicFlag.
> 
> v2:
> - Drop Atomic<u8> alias; Define Flag on all architectures
> - Place padding first on big endian archs
> v1: https://lore.kernel.org/rust-for-linux/20260128115200.3820113-1-tomo@aliasing.net/
> 

Queued in rust-sync for more tests and reviews, thank you!

Regards,
Boqun

> 
> FUJITA Tomonori (2):
>   rust: sync: atomic: Add perfromance-optimal Flag type for atomic
>     booleans
>   rust: list: Use AtomicFlag in AtomicTracker
> 
>  rust/kernel/list/arc.rs              |   8 +-
>  rust/kernel/sync/atomic.rs           | 125 +++++++++++++++++++++++++++
>  rust/kernel/sync/atomic/predefine.rs |  17 ++++
>  3 files changed, 146 insertions(+), 4 deletions(-)
> 
> 
> base-commit: 6583920e15fc567109e1c64ca58c917f52f40736
> -- 
> 2.43.0
> 
