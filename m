Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392E533A6F6;
	Mon, 23 Feb 2026 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771869868; cv=none; b=qvcWgzs3MFL7oZ3fo37Za9RoPyJ2ZMwmqatwWYafrz9+2BWufX5qUJTte7wtu+I1xYBeC0wtBAypVr2rEXDOueZ8ZTN1EBIVE81Q5ZJbDaF2Eah3+c6qAhn8exGjbsmfZqUJ4DbKGwd885AUumv6iDYwToIc1x4+BubXsaKxcAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771869868; c=relaxed/simple;
	bh=tWUAZx52/LoLZzumDU5tv6s69dbvDSwXBdrOeiU6hZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S36wwv9FyH7NvY3OJSs++lpdEmH3TlliK3/QcH5QB0bnJ59mbiBjs/ki/QDPC8onZI79eASiXaYXlb0eiMIX8f4tqSA+nYlVt+H0Qm2V566H+evHSXEBVcJb5fxnDlZvThhhncwPAU9skyPb851CEtEpkrcgjja4CSbMNVla7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdJmpl6M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdJmpl6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2F4C4AF09;
	Mon, 23 Feb 2026 18:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771869867;
	bh=tWUAZx52/LoLZzumDU5tv6s69dbvDSwXBdrOeiU6hZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdJmpl6MBk1SJq4Mcle3/dWjk0Lh8sKtnx4134B7mycGA96uiLuXsncEaDQvB8C6J
	 jN0Lkh/I9JqEvwJWe7a/yXE+CGXlvs64x6oNi+L7dC6rVzJsCuSJWW9VVJU7VNwrIG
	 ljN7CcOzUkpMvKu34TrB++GkQd378pCsX5S7IsxSBzbX+tlcmRM/rBUudh8+wgoRHv
	 F4gI9xtpsKMRBwqr7OsGra6EjAN1yi6NBg8iK4V7aPkgr/u+FXhquu8EexUXsbAg38
	 D1uKCVbTGn+Bx+f1Hx0ubIc66GnH0J8LPZ7QckIQFI6qtk1h9/wEdwAC51acE/7ZGo
	 FuxIbh+4DjmPQ==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 76C95F4006A;
	Mon, 23 Feb 2026 13:04:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 23 Feb 2026 13:04:26 -0500
X-ME-Sender: <xms:qpacabjacVJqOyGNiuj99MmoTmfKv8oW4wHATll89nqJBuSP-jGTAg>
    <xme:qpacaSaF0B2ND9Io0hn_7SKnyDPIS2hDOZ6KVWROt-C8ljoNBx9shG3-UQP4dp6dv
    tLYeEEeMqiLsBMAfbmEe5ppi3TXgl4hkNhy03y5-ZUEAGtvNWWZ9Q>
X-ME-Received: <xmr:qpacaRN1N2laj6AotUqocHNRLslETQeVFKlMinTMfATrber9UdC4IEpiyBLBgLTsdmN_T3vKrsiEhaFIkt4tGBraF2YgyjjE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeejledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ehgeduhedvvdejvdeiueffkeehtdevkedtvdejhfetteffffejvdeivdffiefgleenucff
    ohhmrghinhepmhhsghhiugdrlhhinhhkpdhkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhht
    phgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeejkeehheehvd
    dqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdrhhhinhgusg
    horhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpth
    htohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhhk
    rdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguh
    hordhnvghtpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplh
    hoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:qpacaTYPtyKfiMWELQqbyyZG1vMwfycGMXoWCd49K1r06IP3Fbcmog>
    <xmx:qpacaRUDj62EEJOpdCwhxfOfKRrZwDgzMmVvDIznClMzlqgqAZgcsA>
    <xmx:qpacaSChr6NeAZpkGV2_IX12znBSLrDMd-ewAXDbPLSplFu6FmP7cw>
    <xmx:qpacadLK7SadkQibtxwv7pauxGrSTPHcATp_Q2VwS4NK4DCchatENw>
    <xmx:qpacaQvXoaN_HHXbh03Vyxnux8IQmqkVtWmMZwMR1g89WKQ_PzYc55lX>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 13:04:26 -0500 (EST)
Date: Mon, 23 Feb 2026 10:04:25 -0800
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/3] rust: atomic: add `fetch_sub` and update docs
Message-ID: <aZyWqajbCfnGmH3o@tardis.local>
References: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-atomic-sub-v3-0-e63cbed1d2aa@kernel.org>

On Fri, Feb 20, 2026 at 09:06:19AM +0100, Andreas Hindborg wrote:
> Add `fetch_sub` and improve documentation and safety comments of of
> `fetch_add`.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---

I queued the whole series (with some format improvement per tip:
Documentation/process/maintainer-tip.rst). I also added a Suggested-by
from Miguel on patch #3 (let me know if you or Miguel disagree with
that) and appreciate Miguel's suggestion and your effort to apply it.

Thank you all!

Regards,
Boqun

> Changes in v3:
> - Remove a spurious line feed.
> - Add a patch to update a safety comment for `fetch_add`.
> - Update safety comment in `fetch_sub` implementation.
> - Link to v2: https://msgid.link/20260219-atomic-sub-v2-0-8bd99cadf26d@kernel.org
> 
> Changes in v2:
> - Update example to be more clear.
> - Add a patch that updates documentation for `fetch_add`.
> - Link to v1: https://lore.kernel.org/r/20260128-atomic-sub-v1-1-f8c6abcbb067@kernel.org
> 
> ---
> Andreas Hindborg (3):
>       rust: atomic: add fetch_sub
>       rust: atomic: update documentation for `fetch_add`
>       rust: atomic: update a safety comment in impl of `fetch_add`
> 
>  rust/kernel/sync/atomic.rs          | 53 ++++++++++++++++++++++++++++++++-----
>  rust/kernel/sync/atomic/internal.rs |  7 ++++-
>  2 files changed, 53 insertions(+), 7 deletions(-)
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260128-atomic-sub-2ff15962df12
> 
> Best regards,
> -- 
> Andreas Hindborg <a.hindborg@kernel.org>
> 
> 
