Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1E9330658
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702413; cv=none; b=Q3RtYF9CBzxxeYB5VY71lkNTYiJRg55fb+Z0/vVoo6AwyBl6Smgo9a5fV9Mp9U8LOakGuh8Z5RNbablpAitoM4eqYjPMdK2w49hBKPTo+BZancM2qAHQtt733zzzuFb+JbZlNfAqsrw1JWhogbYK2l175vL+CzTThSoZ6Ew9vRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702413; c=relaxed/simple;
	bh=QYiLb7EUu84mH4v+LposUXg6K9CLrqwbIRHpgN6atrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GExLmGTQlixApvGbNSKy3Gfod8PTtkstvKbNVWmFt55l4ejhV+J7Slby/fzQDe78SkgdFpp0Xuowk9pdfw3OOvJGgCB1R3azKbukQzgaBBJBtZbAlrI/IqY5KrSQ5ZYEg2LF3/iC5CCHMjFd74vTpOTeYWXgGT4bEyuR1kvEE48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5pPIKJj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5pPIKJj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B03EC116D0;
	Thu, 29 Jan 2026 16:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769702413;
	bh=QYiLb7EUu84mH4v+LposUXg6K9CLrqwbIRHpgN6atrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5pPIKJjgvgvZC/ESd6tBb32KfkG4p/SkSwzFwZ8XPtNbt9VuOKZbjV/xu3APLc5o
	 S4OCWfQHCHlLaDdm0n9auzd3Btdf7Ik/qQRkUfT5EHbtHvCPbWK8AUhrQnLuyy2y3p
	 TOjSHG2TBxx7HvdS9P51l+bEOsOuGfoQfiwH6KAayOBxLqheKCqkZ/nNiE1ApZWQvi
	 gugu1LQJt/Tf86e6duWbSuRhXjcN/Gl2E/eC1abqLY7hVW+7RjYuQO6ZPS2V98paWi
	 7c4WgitJOa2PSnCl7KXsjyT5UJ/xkoughlhZyxvZ3WGbUjyopa3RhWlUD617zXhG9X
	 ww9cyPPmMfKKg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id EF3E4F40069;
	Thu, 29 Jan 2026 11:00:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 29 Jan 2026 11:00:11 -0500
X-ME-Sender: <xms:C4R7aYdcsQStHi26zM6Hd_23K59hg3RBQQjF_8MZoT5n1p_MWsFmlQ>
    <xme:C4R7aaoixOqMyfUA7ks0RQicwT1HNBOo-rwAXspCWuHUloMjiu-Ft8s3pkUha9-vQ
    ixIl8Y7UZRDLI6nO46IyhOZ5oySpeBUVFcPAOvUbTlp4WAePM16TQ>
X-ME-Received: <xmr:C4R7aZTuQu5VznkYuUlftnNfAIexB157vM5t20Pp5Z0qB9LeiYZUSUY5fpa7zdf46Uq1TK549NBN8wGZn_fbApb0YXB3ocZx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeiheelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthho
    mhhosegrlhhirghsihhnghdrnhgvthdprhgtphhtthhopegsohhquhhnrdhfvghnghesgh
    hmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifih
    hllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomh
    dprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgt
    phhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:C4R7aaVc2jOJon82-7K8-M_HvGCdmAGqrAcufTxTQPuKWKUddsrZRg>
    <xmx:C4R7aee6_NtBBhJ1qAJn6sD0_Mw1jV3S0-DZT9gAmKSgFH6F3UsAFA>
    <xmx:C4R7adx9Lg0CmW4lca80Q65DF1GVv4tvyQluhXxnHgmouZuw0GgdWQ>
    <xmx:C4R7aZHGAEUkV5hyBaeqehrzBYqZuism5AhYJM3qVcNzmw3l6Ov5ZQ>
    <xmx:C4R7ac0P7b4AQB-CNdQbQnZ32o5mqWK1sk0OD677Z-T-e6uu9W2KXhLP>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jan 2026 11:00:11 -0500 (EST)
Date: Thu, 29 Jan 2026 08:00:10 -0800
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: boqun.feng@gmail.com, ojeda@kernel.org, peterz@infradead.org,
	will@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: sync: atomic: Add example for Atomic::get_mut
Message-ID: <aXuECiIPkbY4GObS@tardis.local>
References: <20260128123313.3850604-1-tomo@aliasing.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128123313.3850604-1-tomo@aliasing.net>

On Wed, Jan 28, 2026 at 09:33:13PM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Add an example for Atomic::get_mut(). No functional change.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Queued! Thank you all!

Regards,
Boqun
