Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BABB1B4257
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 18:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623640; cv=none; b=Jf53Je/vWRLREKSM7MgN2rH4J33iE8n6hg4F5cR84Ufbf/v2jl6F8+RpWlKjWKkbGxnvXHlw3Z3/qjUPTij/WzqxRhK40sdv2bbstYuUAS1H1+M+XzwAv1DqywuNnNDWIoiexHxMGv9M956M9g6yRnYASLnmg7wqiSh5iICRyF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623640; c=relaxed/simple;
	bh=yiN2ElC3vQoN+XCtlvDvxhaVJvUQwdYnlkmLEoQI7Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMMsmQ/zPbfORZLPcx4q/qqs/KEOuwSD58PLCTKCdemJzEtBfZ2q+WJdAIM3NcZSJSKrZe7y10NX9699xtacktmGUp+b9b+Y3wNdW8GS9oVNZU0rCqeyecsw3TCouP7CO7SBgO2toMYaXW2INQmO3/WzSXNhmL6zPpUUPA+A9Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPsb2Ch/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPsb2Ch/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6958EC4AF09;
	Wed, 28 Jan 2026 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769623640;
	bh=yiN2ElC3vQoN+XCtlvDvxhaVJvUQwdYnlkmLEoQI7Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPsb2Ch/a46vtw7AJ2CUvD+1mj+KCW5oBTLj6idn/zVs3+zkxazZBfZcHiHdf9QZv
	 DtCik5mfgHcvQweUsXZ1SZ42ck6JSWCK72tTdB/I0F+HJX2wcAtogZT5rZJEvPTF0q
	 BicdZ6gG4+fi22DM8PYymr/h/Q+YuLMSM1W2QRRdYoQYA6hzHGctTvCsQc3ZBhBUPK
	 3kE/HW0uc5bbR58iirCNWQEJfC35yoHZ4Xci+1/0ddhLQ4D/6x7bz6TufLGyk0hXVQ
	 EfJTr4AeKe/nvxciRFhg4vaepDSaRDTLK/464y9Xh+1tl6hIjeMuzUSZo5St/QyZ3U
	 W2xyypWA5h0Gw==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7B53CF40068;
	Wed, 28 Jan 2026 13:07:18 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 28 Jan 2026 13:07:18 -0500
X-ME-Sender: <xms:VlB6aXv_jS7rojKcAm9AoolV_e44ygjg6u_VGtZiw4tB3Y7-MKARPg>
    <xme:VlB6aZG5RfbPB9Ps82GOvN9TUCGNAPBYfzqUKOtjypwlHMBx9c1HlNMRDvesxoaOD
    ZXP5-qvehbs1ND3lP9GVpMmsLLWTLXtU_JZOKSIvhO_-IJB4yMOI-8>
X-ME-Received: <xmr:VlB6aV4YpqY91FTZBjDHcREIbe7eJQpEU86Qt45Ln0mRFPwDhyYObsBDyEil75cp_zulGuqtwn6rq8yw04YSKmdhV9uQj0zE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieegtddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepghgr
    rhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepthhomhhosegrlhhirghsihhngh
    drnhgvthdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgt
    phhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghrii
    esihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhho
    rhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:VlB6aaze70NzJvFLwDUGC8kaZuYJCs8AOwwHHWW9HQaQgS2_6ANuAw>
    <xmx:VlB6ab22c5HXgKCtYhSw9dP3R9YAsGrsbIBrFiBY9s9wEdCGxXUZyA>
    <xmx:VlB6aV4kAFVt7HNBTaKppLjb9LyiPRE6eD_VokQm7fk838FPlGETHg>
    <xmx:VlB6aRYu6jtRGiRCawxtSkPo_nY8bVpj6IOv3TUwz7oHX0Q3w2HT1A>
    <xmx:VlB6aTR_Ye65Yu05FYtnfvMGfz_mLBFlpJq6A6cwjquwHfHj-gdJ_Lky>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 13:07:17 -0500 (EST)
Date: Wed, 28 Jan 2026 10:07:17 -0800
From: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <tomo@aliasing.net>, boqun.feng@gmail.com,
	ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, lossin@kernel.org,
	mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 1/2] rust: sync: atomic: Add perfromance-optimal Flag
 type for atomic booleans
Message-ID: <aXpQVW3c8vDfbkLP@tardis.local>
References: <20260128115200.3820113-1-tomo@aliasing.net>
 <20260128115200.3820113-2-tomo@aliasing.net>
 <DG09KR1O5JL3.3VYRDKRR8UXX8@garyguo.net>
 <aXpFEhJxbF6cRhAZ@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXpFEhJxbF6cRhAZ@tardis.local>

On Wed, Jan 28, 2026 at 09:19:14AM -0800, Boqun Feng wrote:
[...]
> > > +    #[inline(always)]
> > > +    pub fn get_mut(&mut self) -> &mut bool {
> > > +        &mut self.0.get_mut().bool_field
> > > +    }
> > > +
> > > +    /// Loads the value from the atomic flag.
> > > +    #[inline(always)]
> > > +    pub fn load<Ordering: ordering::AcquireOrRelaxed>(&self, o: Ordering) -> bool {
> > > +        self.0.load(o).bool_field
> 
> For load(), xchg() and cmpxchg(), I think we should not use
> `.bool_field`, because we know that `padding` is always zero, but
> compilers don't. Using `.bool_field` will make the compiler generate i32
> to i8 or a bit mask instruction to get the boolean. We need to implement
> `From<Flag>` for `bool` and use `.into()` here.
> 

Scratch this for a moment, I need to do some more investigation.

Regards,
Boqun

> Regards,
> Boqun
> 
> 
[..]
