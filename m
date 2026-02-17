Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B298133064F
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771349546; cv=none; b=BLjhIdBCLnMvz1tWPnuZ2aaVlxfH6Xu2vgU5LY/rLT+anNmDvc1ZoKpM0jjXcfAxDYPggUIPhO+C4HpZEGa3paENVHkvbJb6HS5wodk8RU96W/EGHTmEUKpOmctxe20YXGmeSbf38VBXZolF1eQci0qTZP1a/B2cfKHLRejncH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771349546; c=relaxed/simple;
	bh=7ufRdIJ+xM8yNQqtxvRZquQZfSq7MslrO2i2CMxqlQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rw1DUuWBAYydiCIRx4xQXrQq7ac7kidCIS/Zl1afCQf6hFkiCy0OdsHbu1MMO3ut6SR0oywmCJeGqex7LcpmSsK1dXrC1Ha7HqnL0jyJjHMpTyJUa2WVG+/NyYedEkYCAIhU17bbwNvSZkMqVnrN6TAW3kM/NZdWS4urOpWPAS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKsgWeNG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKsgWeNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D6AC4CEF7;
	Tue, 17 Feb 2026 17:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771349546;
	bh=7ufRdIJ+xM8yNQqtxvRZquQZfSq7MslrO2i2CMxqlQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKsgWeNGApcX5qS4qzqG5IsIHWTq0HmxRlKSob2x0tm6sqKXGi9d+unZPM8ZDe1gH
	 18ZPjpHfzgBxBeayCiI0Kpqx0MfDkSlXqmwKlXP17Nb+PkjX4XZ3Q4EpaCW32EWZQS
	 21LMN5fb+P8cKRw7AzFsQl+pJuSZeHdT5B0SpgrgD9SRMGl9/iOck2s4K6NrLKbzxB
	 4ZDvyS5TY0j53h/LEc/bguRaChUBTQZQBMOLCOVMgw2wDLQorQHVVXHSsmQxxpqjLz
	 +Lb6R21yXC5o2+o4Vhjjx8XGdwkZI7hoaTowp0QMz8lAkSH8U81YfnJ7ygkqWUIIs6
	 gVqav9Gc65r6w==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 102B1F40068;
	Tue, 17 Feb 2026 12:32:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 17 Feb 2026 12:32:25 -0500
X-ME-Sender: <xms:KaaUaftM7y0kQk5RLmXKqUpZ9ugJVadwA2UwwFHP0efGBEm5i5XGRg>
    <xme:KaaUacYHtngNJkjwDnCK6rjM1nGokudKlqoYcD-w2Pq2_fL5elqfAVHCpwhqhFu9B
    MOU9WeyJmclB9pNP1su3SAt_eMbhTk_NvCaTowz1S6XRmARn3_arg>
X-ME-Received: <xmr:KaaUaY7P5pH3JIgbKXpHdh8Ja2fnrACEp0MsOdhdOxlF5Pyiaht0otEsfH9BF2Ni4LBEZd5TV8lyn-aCxsBd9Z47Phc5BPVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvddtfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghl
    ihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorh
    hgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhrvghniihordhsthhorghkvghs
    sehorhgrtghlvgdrtghomhdprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesohhrrg
    gtlhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohht
    ohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:KaaUaUnMTRuzjUnA6JP_I7-7Ywen6IEGrC7hACEPZc8qV4TATaD_pQ>
    <xmx:KaaUaeFDtTNbsqxIfcyDIJR2UsYq99v0qgdoqtNelO5JSf6L6GtnsQ>
    <xmx:KaaUaYGovi0OVa7M1OrOeK7gmr1h25eT5XAUFnDerdIMm_bIfOOR3Q>
    <xmx:KaaUaW3EHEUL6BSRc8LGgL7nvqK94NJRnXg-bgFGcLX8gxH__o4tOQ>
    <xmx:KaaUaacnUELcKbO7DHlOk0k9LxAAP4wHyz18D-2w6evyiKudh9BTth4h>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Feb 2026 12:32:24 -0500 (EST)
Date: Tue, 17 Feb 2026 09:32:23 -0800
From: Boqun Feng <boqun@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <aZSmJ-1xSnqE9aqI@tardis.local>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aZRY9HthKwVJrAf1@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZRY9HthKwVJrAf1@google.com>

On Tue, Feb 17, 2026 at 12:03:00PM +0000, Alice Ryhl wrote:
> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
> > When copying data from buffers that are mapped to user space, it is
> > impossible to guarantee absence of concurrent memory operations on those
> > buffers. Copying data to/from `Page` from/to these buffers would be
> > undefined behavior if no special considerations are made.
> > 
> > Add methods on `Page` to read and write the contents using byte-wise atomic
> > operations.
> > 
> > Also improve clarity by specifying additional requirements on
> > `read_raw`/`write_raw` methods regarding concurrent operations on involved
> > buffers.
> > 
> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> 
> > +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
> > +///
> > +/// This copy operation is volatile.
> > +///
> > +/// # Safety
> > +///
> > +/// Callers must ensure that:
> > +///
> > +/// - `src` is valid for reads for `len` bytes for the duration of the call.
> > +/// - `dst` is valid for writes for `len` bytes for the duration of the call.
> > +/// - For the duration of the call, other accesses to the areas described by `src`, `dst` and `len`,
> > +///   must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
> > +///   function. Note that if all other accesses are atomic, then this safety requirement is
> > +///   trivially fulfilled.
> > +///
> > +/// [`LKMM`]: srctree/tools/memory-model
> > +pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8, len: usize) {
> > +    // SAFETY: By the safety requirements of this function, the following operation will not:
> > +    //  - Trap.
> > +    //  - Invalidate any reference invariants.
> > +    //  - Race with any operation by the Rust AM, as `bindings::memcpy` is a byte-wise atomic
> > +    //    operation and all operations by the Rust AM to the involved memory areas use byte-wise
> > +    //    atomic semantics.
> > +    unsafe {
> > +        bindings::memcpy(
> > +            dst.cast::<kernel::ffi::c_void>(),
> > +            src.cast::<kernel::ffi::c_void>(),
> > +            len,
> 
> Are we sure that LLVM will not say "memcpy is a special function name, I
> know what it means" and optimize this like a non-atomic memcpy?
> 
> I think we should consider using the
> 
> 	std::intrinsics::volatile_copy_nonoverlapping_memory
> 

But two racing volatile_copy_nonoverlapping_memory()s are still data
race hence UB, no?

Regards,
Boqun

> intrinsic until Rust stabilizes a built-in atomic per-byte memcpy. Yes I
> know the intrinsic is unstable, but we should at least ask the Rust
> folks about it. They are plausibly ok with this particular usage.
> 
> Alice
