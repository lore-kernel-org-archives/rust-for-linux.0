Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914732C08DC;
	Sun, 10 May 2026 17:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435783; cv=none; b=uFZUQvoK9sOXdcEgRxMroF2w469JhnbrBCHgYSZssdNSCIwhA+vRWoYFrR083nPggz4RDhI+RbWFf0dZq1TJ6u4NwgeCQNg8p0okhTkH7N1hbeOTFgtaO1gc6RkUe8ZLYxtpcPmJKHI4+kzNW0d1rpp6KCkB9vp67xCOUi3C/zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435783; c=relaxed/simple;
	bh=pg00yIG9n2hZoCVQx3lbHWT19RjuJzWWIbAvylSGvKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PECbrh7mcg/iFqSwtLGZu2oOFgqx1oz9+uF3E1wYpgn+2dcW8EKlAbEdb/+Llfu+5Cye+XDlP2IdYbRnTu1DBs2/nLdOuiJLDzJc/xyLEvqgMwNhyLD+VjmU1VDt9oskHHWDZN8WR83tIQ4gznmFNI4UmQxsylLqmy6RM9VxpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=k9JT8mc7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jVNfHMfk; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="k9JT8mc7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jVNfHMfk"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CA8F51400060;
	Sun, 10 May 2026 13:56:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 10 May 2026 13:56:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778435780;
	 x=1778522180; bh=fRlo4WXSoD+N/q6LzND3oe7D8BNMYI5wGMQbJSmipKw=; b=
	k9JT8mc7V5BDixAsg2qZU3LNUGRFkNw6QSdFHhtsxqgdpsNfEFcVcp02P8+SYqPp
	1nz6A3pitM5raztQ7HNTBXuCNFKlxQKPs5SIMTH5S4mGV6nOVtKXhyhj1anV9fIh
	nkjDDumtM8xRUSkE/MH+j90d6DMo+A8C+T19zHh7j6rG/ruTd0dwekzAjnxvT+A9
	3fGjX4FotkThDYfEicBgZ/H5HFLOi6hvayjlFb+tqOU6qE73DKZ0GFqzYj8M3Prp
	W+S1KND5DL2ERX2Iv0FIkBYnX6NDQe1jI8pZWdJ5VSzh7RlJTD0aa5q6FHP80KQG
	VE3BQyQu7JkWJ66pfroc8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778435780; x=
	1778522180; bh=fRlo4WXSoD+N/q6LzND3oe7D8BNMYI5wGMQbJSmipKw=; b=j
	VNfHMfkP+LgBMf6vX8/8WXsaYvqqPywV5P/ZY0rMJyoSejWzL5KltAGbjllYFNpS
	lEUPJvGhL3J31A4qEVjq4DxpZdIgfKF46mAW6AYPKDGF40KPBUxmqKaDC3tM/pSq
	5ujVAl0LWHpoWcJ7Hm3/wMiE9kUBFJNAzDkjOzRbBgCcCf8KjT8NJ9ABTOn0F8yv
	QPLSOBLSq0uKs0BDXlPLXu/OgWa8mh6y/mD6TdbZ3o+BddSwGsORizH+7tVByJO/
	7LhyZ7rC+qHjtK/sHhVdrvb/YCy6Hz5sQZrO/RumZuOPCLjAkKb1ucXikLLUhCCm
	1BmCdCtnQHT8CU3qPgJ1w==
X-ME-Sender: <xms:xMYAaqfnkcuUvRGtnW8KPi0RPH0SulCfgM3AT5oc3mKBRRb6apTQLA>
    <xme:xMYAaqtLoYimlcAeg1ixvJcLgJYV1OVWKrqXO6k6Zkhafk326GKG8c2nt9qjUpc_I
    rJfT7nVOZDPRNqBumH1gAdlTHhZH-ydxic9HFu6n0jEkil98nWEeCI>
X-ME-Received: <xmr:xMYAapjkNrtnEQvMg9CktzOHvKqdtoTwF9-LA7zOQI1OSFl4vyJziIhA9ZY7Cr0e1thJO50tMQN5d8FZSYPUbYTbfPKi-G4ozUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeijeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepve
    efkeeuudettddvffevhfevvdekhffgveehfefhffehfeetgfetffeugfevfefhnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepmhhighhuvghlrd
    hojhgvuggrrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopehksegt
    hhgrohhsmhgrihhlrdhtvggthhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegsohhquhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegs
    jhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlohhssh
    hinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:xMYAaqswiqGtTSOB6BG0igduWqyLhF8PE-SxftfVao1TZ7GW9h1erA>
    <xmx:xMYAas89IpG9USK5yDTVbhptKuCVZ9ZmLTw9C6R6kUPG-Eje3MRnxg>
    <xmx:xMYAaoY-tqngnDi_IlJ99SDcbeqgy402WR2VWkyJxtVOtd7Qjk9ScA>
    <xmx:xMYAaqpQxJ0DIKmi4WtMUc5G1okcTfJCbRuzG_yPfRe0FHxt9tc86A>
    <xmx:xMYAaoLrt3J2kksq54lkW5dy4FLoRuvVuAYMRpdMaYbhD8TIO8Ydu0_s>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 May 2026 13:56:19 -0400 (EDT)
Date: Sun, 10 May 2026 19:56:17 +0200
From: Janne Grunau <j@jannau.net>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
Message-ID: <20260510175617.GA118456@robin.jannau.net>
References: <20260510-evolve-to-crab-v1-1-208df84e67be@chaosmail.tech>
 <CANiq72mHGsatZLLiXAzZnKOmktOutQbC9bs1VexKm8yJ1w_p5A@mail.gmail.com>
 <DIF492AU2WJF.359GZYTFSWM1I@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DIF492AU2WJF.359GZYTFSWM1I@garyguo.net>

On Sun, May 10, 2026 at 04:53:15PM +0100, Gary Guo wrote:
> On Sun May 10, 2026 at 2:45 PM BST, Miguel Ojeda wrote:
> > On Sun, May 10, 2026 at 3:36 PM Sasha Finkelstein <k@chaosmail.tech> wrote:
> >>
> >> The current approach of silently disabling all rust drivers if the
> >> toolchain is missing results in users that try to compile their own
> >> kernels getting a "successful" build and then being confused about where
> >> did their drivers go. In comparison, missing openssl results in a build
> >> failure, not a disappearance of everything that depends on it.
> >
> > Yeah, it is quite confusing (though it was done on purpose).
> >
> > Personally, I think it may be time to finally change it.
> 
> I believe the original reason for doing so is that people can use allyesconfig
> and it'll disable all Rust modules if they don't have a working Rust compiler.
> 
> Do you intend to change it so that allyesconfig needs Rust, or is there a
> different mechanism to make allyesconfig ignore Rust modules?

One could argue that since commit 9fa7153c31a3 ("rust: conclude the Rust
experiment") RUST belongs in the allyesconfig.

If that's valid the patch misses to add "depends" on the architectures
which have support Rust support in the kernel.

Janne
