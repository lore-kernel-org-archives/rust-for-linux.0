Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C2D360741
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770391695; cv=none; b=IiOp2019dAcvmdDvdTFrkeXSyf7q4UB43ffHf+y88BoMUD8+Bgm50dQ6AA5f3aiLBUoy0e3aCfih0Ta6c0C+5+/qVgbLraljfUr6UXuO6I+c9JqxD3gN3bgQes05P/aS5B/9iIlySFmjomNFQdp9BMDzqE/nGyFX8xXgr8PgGyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770391695; c=relaxed/simple;
	bh=5y1J7IXW/31BRrX1yvw3LOd51yBtFg/ShOLvS3Zwtuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JacL+c/lEwVLCPtIzNTba6bZkD0EShMK1L71NM0hgDCCWXG9dOn2HOlKDdotQGKOsFNIJqABd5NoZT3pZpr1OX6lO5OVre4GAq3N6CJ4JxRYZOsze96wFCB0agsh2znh/ujCH8xCEhl4uWP47myddspz1KsIf+zLC/QQApLYIbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVbwG4QG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVbwG4QG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D53C19422;
	Fri,  6 Feb 2026 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770391694;
	bh=5y1J7IXW/31BRrX1yvw3LOd51yBtFg/ShOLvS3Zwtuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tVbwG4QGJ1HfHMe7/3SGfvqqLyEcJ9UVKiwBsgeCdUAf/JOBRKqsrJwUSQHD3BOpU
	 0wB8L3q51qHGF8JEP/k7xg0nw8rZ9YqLxMjO89D8pE77y8xd50Ll1rSg9t7Wr13OrU
	 h7I9W6mvp2Lt4vTxAzRMfNy4IU33YHQ8LhAFGLh03S/BRRenVUBRk+9b9mgnwopF4s
	 KkX4NPCPpoTPZsQ2ar0TVb2awhnqXarzWBeKnSgGGg/r4O0iQ/A3oArLuM+odF1Lqq
	 Jz2yz0yuEoA0rJ21SDiM2RXA3CWm4aGKoNgTPhIN4Mz4uDuwjCADGfRQrRs7tulRPH
	 Y0y3pI+Kh4m0Q==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8C0CDF40068;
	Fri,  6 Feb 2026 10:28:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 06 Feb 2026 10:28:13 -0500
X-ME-Sender: <xms:jQiGaSONHp3Bt5a9RbE-P1eo7WfI2AkMlQSXsCJID0lCaTAbpc41Aw>
    <xme:jQiGaSQ75WzkohSKIUzz2P5_Czg3HgVG4FUstJdi3i0m9Gp8C5znF6boc9vt_726X
    Rv2KMZQpicP8KnhGFw9gFcON3D3obud_gS1rBsmHDmkG1FLt1OdQw>
X-ME-Received: <xmr:jQiGad6KG6m7Tjm-erPWvTNMUKAY9y8ip2pWHJFph_nBmwX6YjgK5M8g7WBwP6pva7dirbFvaEYBamHb1pM3C_XCWeRRqFer>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeekheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    efhefgffelkefhheeifeeggefhgeeuieevueegfeeugfeuffeludeuhefhleeggeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedvvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhho
    vghlrghgnhgvlhhfsehnvhhiughirgdrtghomhdprhgtphhtthhopehpvghtvghriiesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtgho
    mhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtph
    htthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopegurghn
    ihgvlhdrrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehojh
    gvuggrsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:jQiGaVY84fJ4JeYkaCALfTlFP3n-hWiBDhW65EFvQM2ITptpE7u6lg>
    <xmx:jQiGaRaSiT8sry59Ns80ROz1pr7mLnNMJFZS19kPCppOnyPnvJlyLA>
    <xmx:jQiGaY2-h4KAIitaJph_VJQm8St4YADWGG6h5jshF4klZwle47p3ww>
    <xmx:jQiGaZYTuU2viwPBPb6WusGnAEQmrjO5kyAN9rLUW-8TGm7cWOZ69Q>
    <xmx:jQiGadlx5pfEuL4sKEJ8NG8b7PVyS6RvPMjK3_u2vtBBkL8dcdnsK_oZ>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 10:28:11 -0500 (EST)
Date: Fri, 6 Feb 2026 07:28:10 -0800
From: Boqun Feng <boqun@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 02/16] preempt: Track NMI nesting to separate per-CPU
 counter
Message-ID: <aYYIikXcrXFOZDra@tardis.local>
References: <aYVXQVwOZapVbnP5@tardis.local>
 <6792E792-2043-4BF5-952B-90847703F23F@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6792E792-2043-4BF5-952B-90847703F23F@nvidia.com>

On Fri, Feb 06, 2026 at 03:13:40AM -0500, Joel Fernandes wrote:
[..]
> >>> 
> >>> PREEMPT_LONG is an architecture-specific way to improve the performance
> >>> IMO. Just to be clear, do you object it at all, or do you object
> >>> combining it with your original patch? If it's the latter, I could make
> >>> another patch as a follow to enable PREEMPT_LONG.
> >> 
> >> When I looked at the alternative patch, I did consider that it was
> >> overcomplicated and it should be justified. Otherwise, I don't object to it. It
> > 
> > I don't think that's overcomplicated. Note that people have different
> > goals, for us (you, Lyude and me), we want to have a safer
> > interrupt-disabling lock API, hence this patchset.
> 
> I was also coming from the goal of long term kernel code maintainability. If
> we decide to have additional preempt count flags in the future, does special
> casing 32 bit add even more complexity? (not rhetorical, really asking)
> 

First, given what preempt count is, I don't think that'll happen
frequently. Also I think the reality is that we care about 64bit
performance more than 32bit, in that sense, if this "conditional 32 bit
preempt count case" becomes an issue, the reasonable action to me is
just making all preempt count 64bit (using an irq disabling critical
section for 32bit or plus a special locking), and this would make things
simpler. That's the long term view from me. (Now think about this, the
NMI tracking we proposed in this patch is actually a special case of
that ;-))

> > I think Peter on the
> > other hand while agreeing with us on the necessity, but wants to avoid
> > potential performance lost (maybe in general also likes the idea of
> > preempt_count being 64bit on 64bit machines ;-)) That patch looks
> > "overcomplicated" because it contains both goals (it actually contains
> > patch #1 and #2 along with the improvement). If you look them
> > separately, it would be not that complicated (Peter's diff against patch
> > 1 + 2 will be relatively small).
> 
> On further looking, I think my hesitation is mostly around the extra
> config option and special casing of 32 bit as mentioned above. But
> answering your other question, if it is decided to go with Peter's
> patch, you can use my codevelop tag.
> 

Thank you! But I realized more things are needed, so we probably should
add PREEMPT_LONG as a follow-up (for example, should_resched() should
take a long instead of int, and the print format issues that Peter
mentioned).

Regards,
Boqun

> -- 
> Joel Fernandes
> 
