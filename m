Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3EF27FB35
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 03:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769572542; cv=none; b=HQOOI/oBGzar4cNxGVlxhsOA88t+W2nCCElALpPnMEWOFBOyEhXI6r5l/jWX0i0q4D+qEpUPNLnCzgbSV8Fqf6owq2b5T5zX8KN6k6/BCVB7LGUhCmECmtT7BAPHPA7GbjV93WGZqxNoiZW7mqrOvleSsLWGgj8L+od0xt8LJNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769572542; c=relaxed/simple;
	bh=QGa+NW44o93FfWMMGO+NP4MG5lDFtHQgI3BOE9aclKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uyg4Bye/6nCPF3vyVM0o9AdYOstXu30kJn6bQve64G5lyZhJzLxAWHT1D903rlhah/bbJ6i/ui19gU3472PxtSjECqmDPhZVk4AA96TFx1nUaALfEBs/2An3p0w9v4p9VWZiG0gxautAAQWW5vjVrXk9hJNRMADVJ6rlmS70yyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPbIglWt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPbIglWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62119C4AF09;
	Wed, 28 Jan 2026 03:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769572542;
	bh=QGa+NW44o93FfWMMGO+NP4MG5lDFtHQgI3BOE9aclKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPbIglWtN+H0qJhcWofshqP0DyMPMdIKmXkkOuynh9vXql1GPpJ3seLziUcZFKdtz
	 FQqUnUHmdTJTpSgjcri5vaLy9YpExUD5QyhgCXjqnjKYPW2aRJYmAnfTENmiSIvmYV
	 a5ZfelZ6lEnanVGfoyfqU/loV42xpmXpzwSUi0+C/c3p8hb0H16/EWOZ63sajnnzkC
	 6WEr3uPardyNChOWlprkfdzJJF21TJI4ieHNgkrDmwJaUs6kQdoIRDUyblYNOQEoP+
	 AeflCsd0wUoSieIFnFL7O/vTp/wwhLYgIYenLV0UjfbXpLlCa6gF2CJgysmgPm9Lg9
	 mnuQcy8T+ELYg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 81BE9F40068;
	Tue, 27 Jan 2026 22:55:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 27 Jan 2026 22:55:40 -0500
X-ME-Sender: <xms:vIh5aSqaxGqQGZhoTmq76gofKkfvfMHDCULiBDO_sh-giHkLdYwTNg>
    <xme:vIh5afKddYJOJ4f6tSG_fCGvCemzD6jIWhKiubK9YXDrtKpxhK2nWAQ15HIYTVqPE
    Fkg9CcEyUGkJFOJ5rjvzlcqLlz7k9f4iDIQgBzU2KEqcQ2aZiOWQQ>
X-ME-Received: <xmr:vIh5aeDHDyWikyUFTnqiHI8g3VzLa81IHmeAV9JL7HdnWrmOhMAAwsA6EoHY-I9HqU3Tj728yNi-XP1Q_-9zUgVmmV4srFAC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epgfdvtdefieetieefueetudehffevieffkeejvdetleffledvveetgfeufeethfeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunh
    domhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedtleekgeejuddqudej
    jeekheehhedvqdgsohhquhhnpeepkhgvrhhnvghlrdhorhhgsehfihigmhgvrdhnrghmvg
    dpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeht
    ohhmohesrghlihgrshhinhhgrdhnvghtpdhrtghpthhtohepmhhighhuvghlrdhojhgvug
    grrdhsrghnughonhhishesghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhf
    vghnghesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorh
    hgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtg
    homh
X-ME-Proxy: <xmx:vIh5aR6mMUk5wqCCMGbrzjHYOvnNQ4ZZgkIuU_fU9dww4inmX51kAg>
    <xmx:vIh5aaHsCb0TlxoaKXeyOlOgy2e1uMcyth_0QkrvGPS8ltkSnuOquQ>
    <xmx:vIh5acTkdmbui5Qmu-sxTIPRZphymzkTa1L0KYac2Qk1L-4LVSfdOQ>
    <xmx:vIh5aUeFhC2VUKfSTVaZXOdZCfMysaMRBoSad4ryyIRMBIXiHYbXpA>
    <xmx:vIh5aShTII4aRfmQwt53cF1TIe-d-sXKCsEjDNghLLzuqNo8dSkPpczz>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 22:55:39 -0500 (EST)
Date: Tue, 27 Jan 2026 19:55:39 -0800
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: miguel.ojeda.sandonis@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
	peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
	tmgross@umich.edu, rust-for-linux@vger.kernel.org,
	fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
Message-ID: <aXmIu37eVGVWrPqV@tardis.local>
References: <20260127125300.3656544-1-tomo@aliasing.net>
 <20260127125300.3656544-2-tomo@aliasing.net>
 <CANiq72kEWSkjDcKKaXs60SxCC1UCXLdgyvBqv8H0FmLaAa8f=A@mail.gmail.com>
 <20260128.124734.1765350543682525990.fujita@bee>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128.124734.1765350543682525990.fujita@bee>

On Wed, Jan 28, 2026 at 12:47:34PM +0900, FUJITA Tomonori wrote:
> On Tue, 27 Jan 2026 15:32:29 +0100
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> 
> > On Tue, Jan 27, 2026 at 1:53 PM FUJITA Tomonori <tomo@aliasing.net> wrote:
> >>
> >> +    /// Returns a mutable reference to the underlying flag as a `bool`.
> > 
> >     [`bool`]
> 
> Oops, I'll fix.
> 
> >> +    /// This is safe because the mutable reference of the atomic flag guarantees exclusive access.
> >> +    pub fn get_mut(&mut self) -> &mut bool {
> > 
> > Should we give an example here, perhaps promoting (part of) the test below?
> 
> Boqun, you prefer to have the examples of get_mut() for AtomicFlag and
> Atomic<T>?
> 

Sure, that makes sense to me, thank you!

Regards,
Boqun
