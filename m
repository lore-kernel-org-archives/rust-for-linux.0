Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170A261FFE
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 03:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769571489; cv=none; b=kmgl/BwMeA7f+Xx0GO7dtXKqOu028u3syt86U5ey6zoDSwEPdD5g7gy2r/qxr4ik0hW4t9zV/NAAA2fe+qCN3RZIexNUbxzycvKlc4JRds5Q+NN+36OvRP2m0KZQ+GCfe+OYnpHOUP2ZORHCHynpErjaOyYxesabsgWvfTflfxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769571489; c=relaxed/simple;
	bh=E3OdwzOrHCK7HMHc7wyOvS04GD+c95sVPZ0XJ0TJmV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtCpwFJQJX4OVm69/6nERKsbYCUK6SNPwEh9z7NO09H3aZ2KA3nMNzMgeR31hikC8+SRfmMRV2v9WFzW8hFV9fbeeWHRMqkmW9IygE+R566sPkVR7sBeTS9ts2Yjhg2rwCRzBKsBg4kdyJc72mRjUeXnKn/VmflbRjgUZNmUznc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xm+zwwOB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xm+zwwOB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E70C4CEF1;
	Wed, 28 Jan 2026 03:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769571488;
	bh=E3OdwzOrHCK7HMHc7wyOvS04GD+c95sVPZ0XJ0TJmV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xm+zwwOB51Iau2eHjHcuc1g75CEy5KsSP+yRdGn63jDaDFeDoXWXCBuiwchHvBVou
	 Z8q27t44iGhPU3/zbydLKuS2LCtlCJOVT0hal+WSL72tEFcRBqs3h0bhgoBcI8go/9
	 zDD0J1TthO5EQhPKUGn3PpEMUSN3TvYn8mUjjMIE4zaK/fQnB22GPlSVwAjBjSTULV
	 xnK+BXSmdyxBeA8qF6J5nog1IRfwsV+W941QcQ8gF21W2U8V+vH3gSJFtbY1Tfq956
	 ggNyGpHgmy8PFZ7mRBXf5mkBj01h+jEXdP9ulz0sZ+YzZxWZSKoPu1nKJba8CIovdb
	 K+0skCs+FxEGQ==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 066C5F40074;
	Tue, 27 Jan 2026 22:38:07 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Tue, 27 Jan 2026 22:38:07 -0500
X-ME-Sender: <xms:noR5aT-0tsozhUFdpNsY1itTRFIOmRpY0T9v38pKGLsD8o0iWSUMFg>
    <xme:noR5acHYr4J0GYKtl8uKIv9pliNYOQujjKXmu9_ZpGXuAhu-Fxdf6WdObVYp1_HP8
    vdcYbDLjmcxT_bq6empOqnKYjh6SvmFjlnKuLY-d-zlSplnWzZj6A>
X-ME-Received: <xmr:noR5aVdBRBSkx04pq0vqblTlZ2ZeFfZAxWuHBC4yBvm3VzKopvNu11kAJXiNUXTh6KjCpWhv1vTjQbJff5Gvy6g1EGKrzkCU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthho
    mhhosegrlhhirghsihhnghdrnhgvthdprhgtphhtthhopehgrghrhiesghgrrhihghhuoh
    drnhgvthdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthho
    pegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:noR5adkQLSmf6-JM854-8EUW4Nuz5Jb5XMU0xfwTWxvw8hPkn_T1Hg>
    <xmx:noR5aUrCJWgWOB3v3NkrVuMa5UAsZWKtpEWLbcrLNJb6cMFYhV97sg>
    <xmx:noR5aaFZQajBed5TPp5_aC6N5Yxs6w2i8X-ldqTChWjcv761PJy1hQ>
    <xmx:noR5aaTU8Cz0R4v_vwwNAlGef4VCTf2HteM2HyhY88YsJkKsM-UDIg>
    <xmx:n4R5aQNVcPQV2EXBmFyjvzv3kr_V-yAElGueBVOcbyczu5qK839PcUKI>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 22:38:06 -0500 (EST)
Date: Tue, 27 Jan 2026 19:38:05 -0800
From: Boqun Feng <boqun@kernel.org>
To: FUJITA Tomonori <tomo@aliasing.net>
Cc: gary@garyguo.net, ojeda@kernel.org, peterz@infradead.org,
	will@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, lossin@kernel.org,
	mark.rutland@arm.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/2] rust: sync: atomic: Add AtomicFlag::get_mut
Message-ID: <aXmEnWcra0Ccqav7@tardis.local>
References: <aXjg4jv-3aQcy4O0@tardis.local>
 <DFZI47QW7VTE.1PF5P6LUTASVS@garyguo.net>
 <aXjpMhRytX-W3AX9@tardis.local>
 <20260128.123212.248535348759706770.fujita@bee>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128.123212.248535348759706770.fujita@bee>

On Wed, Jan 28, 2026 at 12:32:12PM +0900, FUJITA Tomonori wrote:
[...]
> >> 
> >> I think what Fujita has is more "proper". Your approach still have the issue of
> >> requiring a specific ordering of the fields. If this is messed up, then the
> >> entire thing is broken. I.e. the safety proof of `get_mut` depends on the fields
> >> being ordered correctly in `FlagInner`.
> >> 
> >> If you want to go down this route then I would just scrap `enum Flag` all
> >> together and always define it as struct, with an internal `bool` + 3 bytes of
> >> zero padding. This way we don't even need unsafe for `get_mut`.
> >> 
> > 
> > Hmm.. so like:
> > 
> >     const PAD_SIZE: usize = <3 or 0 depending on ARCHs>
> > 
> >     /// # Invariants
> >     /// `pad` has to be all zero.
> >     struct Flag {
> >         bool_field: bool,
> > 	pad: [i8; PAD_SIZE],
> >     }
> > 
> >     impl Flag {
> >         pub const fn set() -> Flag {
> > 	    Self { true, pad: [0; PAD_SIZE] }
> > 	}
> > 
> >         pub const fn clear() -> Flag {
> > 	    Self { false, pad: [0; PAD_SIZE] }
> > 	}
> >     }
> > 
> > ?
> > 
> > Yes, I think it's better ;-)
> > 
> > Also, now given that `AtomicFlag` behaves exactly like a `Atomic<bool>`,
> > should we do:
> > 
> >     /// `AtomicFlag` documentation here.
> >     #[cfg(<Arch supports byte-wise atomic>)]
> >     type AtomicFlag = Atomic<bool>;
> >     #[cfg(<Arch doesn't supprot byte-wise atomic>)]
> >     struct AtomicFlag(Atomic<BooleanFlag>);
> > 
> >     // `Flag` doesn't even need to be public.
> >     #[cfg(<Arch doesn't supprot byte-wise atomic>)]
> >     struct BooleanFlag { ... }
> > 
> > (I renamed `Flag` -> `BooleanFlag`)
> > 
> > Thoughts? I don't think there is any extra benefit of exposing
> > `Atomic<BooleanFlag>`.
> 
> Agreed.
> 
> You prefer the cleaner git history? Then I'll send the next version
> for rust-sync-fixes, to implement BooleanFlag (or Flag) and AtomicFlag
> from scratch.
> 

Yes, that'll be great, thank you!

Regards,
Boqun
