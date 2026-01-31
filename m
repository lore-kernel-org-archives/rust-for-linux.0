Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5BF2253EE
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769877818; cv=none; b=BARmpTsJ2WrQDJYsn2d538YK1CdnwY/VtMDs9oE7+QYz9alnMP5XJ+s05kbVhsJXpkdUI8ixO8GU6VHGDA6Wkr+A4El98Iq0ZFCFw0oKk6Hd5tlharydWZfJamCCcqpmRi+nv/MLz0INLxkX4kvXQy21OTVuCJFQIOvuCk7f228=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769877818; c=relaxed/simple;
	bh=3KsRMh2lSbZ0pMfa0RXuQSsgQEmLwpq0wiIfPG6cAFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHjsZC545fzW+krRkM/UO/BBQqF5Mkbv4p3JAZZrj1IPbTTQ5+9WJOPFcTvPv0C41q4U6Hh6VfkleQrH5ejAHZSxQ1KSt0IUrMk+n/jLC79sk27bi8EflP8yJ5g/q20b9cr6wgruUqJHIZB03wxs2kFZb2WysSVpRHV/bAZDxdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYq4A/ip; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYq4A/ip"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B035DC4AF09;
	Sat, 31 Jan 2026 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769877818;
	bh=3KsRMh2lSbZ0pMfa0RXuQSsgQEmLwpq0wiIfPG6cAFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYq4A/ipaHf3dHpGjF0pF8iKcg5Kb6tWnuXulr75Yw55DTt54QEG3BYJRELJzgRtQ
	 Q2Iq8DK0oxTQiSktzhFIjJQ4gvu8k9iukFR61/Pna9On67EmC/omIPKsV7ZefvEhG3
	 UiQdc9twdYo7qqF4PyAfA5hHYp4ixPo2rS5twS6aUkKJB59Zi5j8mb8eO5f7LqilQv
	 n9mchh9on7iaP53F7zLvlfA6qllEJZ4tPI9yAHnQH+OufoY0CoIw7LJomL06Y25fgj
	 hJxnAPsvImekF4ULkLPQJJfH0tMUomBFj/Vv3Qj5g9AANMa3PvXMydXRWLCX3Qgqgi
	 L9u8F7+TM1hZA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id AAD7DF4007C;
	Sat, 31 Jan 2026 11:43:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 31 Jan 2026 11:43:36 -0500
X-ME-Sender: <xms:ODF-aS7fLp9NqI9O5kEN0lfRG7QIsLOhkxLUnsrrMnQ_GFZFj0Ntbw>
    <xme:ODF-aWRvFQ0S4Ea3xsokT4IlwaTtax6R7pzqH-61-_JdnBGysy8yb15Wm_O8T5O9h
    urpQYZfQWocDgbMOmqIEtABBk9stYUQy-2f6Wx4ASseAR_mkBt42q0>
X-ME-Received: <xmr:ODF-aXnlKunrZGPDNbW4hjgTNTb8gys5uWdLWnyF1nkK7niCzK-98H3KefKC0bmqDb-nSCitfB23nvuBVqJLc9a0Kkmw5hmq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedvgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdr
    hhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtgho
    mhdprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorhgrtghlvgdrtghomh
    dprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhmpdhrtghp
    thhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhdrfh
    gvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ODF-aaSOYWbSj1OGZNm8fCIwn_BzmjJQy6VZN1JiqEKA7yjdpQ1OjQ>
    <xmx:ODF-aesYDIkwIhBDCvQGTzXwB6WHvc1LjqkCtq03GaCG3ZZPnMXbLg>
    <xmx:ODF-aT4x2C7uyY6Q6KW-H83nL9pi049yDYzzyzBULueZRmWP1nuC2g>
    <xmx:ODF-aZgbVrivNY_fJzfSmtB1XX8K2Bw5Ij6dQIzdlNX4VSifTTe3vg>
    <xmx:ODF-aVkfJnCYYZ5erED0jlnT85y7jEy9KTaZe5Vh_9aG89YWQq75d-kc>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Jan 2026 11:43:36 -0500 (EST)
Date: Sat, 31 Jan 2026 08:43:35 -0800
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
Message-ID: <aX4xNxsF5Qs0CTPW@tardis.local>
References: <874io3rwl3.fsf@t14s.mail-host-address-is-not-set>
 <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid>
 <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
 <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <-5tKAwUVrj6fo337a8NWsHQBepB07jKIVI-VafwW1zp0vsGTCkBTuI5nCBniftYJePZy8kb7bhWptJ2Gc_B-kQ==@protonmail.internalid>
 <aX0lcVngRcRwqgd5@tardis.local>
 <87pl6prkc6.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pl6prkc6.fsf@t14s.mail-host-address-is-not-set>

On Sat, Jan 31, 2026 at 02:19:05PM +0100, Andreas Hindborg wrote:
[..]
> >
> > However, byte-wise atomic memcpy will be more defined without paying any
> > extra penalty.
> 
> Could you explain the additional penalty of `core::ptr::read_volatile`
> vs `kernel::sync::atomic::Atomic::load` with  relaxed ordering?
> 

I don't understand your question, so allow me to explain what I meant:
for the sake of discussion, let's assume we have both

	fn volatile_copy_memory(src: *mut u8, dst: *mut u8, count: usize)

and

	fn volatile_byte_wise_atomic_copy_memory(<same signature>, ordering: Ordering)

implemented. What I meant was to the best of my knowledge, when ordering
= Relaxed, these two would generate the exact same code because all the
architectures that I'm aware of have byte wise atomicity in the
load/store instructions. And compared to volatile_copy_memory(),
volatile_byte_wise_atomic_copy_memory() can bear the race with another
volatile_byte_wise_atomic_copy_memory() or any other atomic access
(meaning that's not a UB). So I'd prefer using that if we have it.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
