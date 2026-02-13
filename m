Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FFB8F49;
	Fri, 13 Feb 2026 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000957; cv=none; b=Xg81v6e8tIbWRi+Ctl40tIcqdmyPldGvOfe7zmBgUGPgh1v0nXmlPX8gacqmdW3Qpnt0OqKqiX21w9sv6XiFZJfwfKihlak4EKTWFTO5G+i1QOzn9Ug8tvttZ/Pu9UYp1j3ShOh41xZo6DdVWaVogkb7gSH7agvYnok78Ez1YrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000957; c=relaxed/simple;
	bh=D2uPJCqU8beDKZ5LlRiC3yWLBv/9WvcYMPwKbnCeMmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DK9yPODhhs7GfzmN/UeKb3KrGQlZl5xEHZx7p5ti6KcYfwSN/Y3E2HaG9EbiEd9gsJX2uRpZ+wZBFZ81bLnwJrINMzPMPXTD/eVp1qN7PabPX4mZ1aoyWQFULUjDpkVeVG30XSivwth4RHOxaRgerB1xKtQuzufZwWsnx5nVUE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOG+1kXs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOG+1kXs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BF6C19424;
	Fri, 13 Feb 2026 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771000956;
	bh=D2uPJCqU8beDKZ5LlRiC3yWLBv/9WvcYMPwKbnCeMmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOG+1kXsjHq0JaqZqfkakBAKG+9KRzBvZfnVMSx7r7MNI7q+85Ai5rfVHaurK0Qgf
	 FpFokRlTuRWh9///2q441SKD+qVPhbagovAwUyfczIVDSLmGfs0j0Ck6q3PkU7CbMS
	 BsZjK/hjbW6BLk3uRVX3eA16ZcAkLjlJtL1EmR0nwD6UmEFlPAUYWxziYjbysCZLi5
	 +Q8g23sZnzWfAOb5pxzhJIEV+9B+SOToeBdbkjt/fleps0XnoH8QgwLYjh68pWn+o6
	 fh4uTvOS7Wd+xpyDj5UV3Bor8feiWG2vuiBrzbYINaU7huvBiDJe16JY3UH8oChvPL
	 9P5Y4WIno1E2g==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 33986F4006E;
	Fri, 13 Feb 2026 11:42:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Fri, 13 Feb 2026 11:42:35 -0500
X-ME-Sender: <xms:e1SPaTpjauIxaBYDHfuMWKw_wNdYxjnXMl8Y-EasyKmKcjtebZjKmg>
    <xme:e1SPaZkaLwspUe4u2Vsvrnkv4MWPyhVRtl5H4N1DeAUZyAAbG1KxgjII4rVRinJ4a
    MkjBSy1y-KA72B8UD4fvYls3AzWpolk2i20rdMEiybisJX7dDZv8g>
X-ME-Received: <xmr:e1SPaWVl4QqsibD_vAkuuO-YwcNETuQOnkqOP0EozLyVX1j1KGAD0hS4Lt6Cm6eVkpyafAd5nXFIY5r6owJaCSmNkjip3FtE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdekjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorh
    hgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorhgrtghlvg
    drtghomhdprhgtphhtthhopehlihgrmhdrhhhofihlvghtthesohhrrggtlhgvrdgtohhm
    pdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghoqh
    hunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihg
    uhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrd
    gtohhm
X-ME-Proxy: <xmx:e1SPadTC0lTvER7xSsrApy1MHnZClXItrE2auteeAz94dtxSwZDjmA>
    <xmx:e1SPaRAf9_jyW8HeWkrDcgEXHldLG22NAIzzllSwRpGcb2ciiaa6dg>
    <xmx:e1SPaYQ1CSd-CcfvztZWUGpVhmhQTaCfNh8TIPkKhjkeLP4iUc7Itw>
    <xmx:e1SPabSAT_0md2MUA7R8T7k3kX8VXYGTvQowPBoWm7yE69JTYiVfPg>
    <xmx:e1SPaeIbhmg0Xuyvp5918E25dFmNwq11PxAaITj_K7d3uoT1GV-b9qxn>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Feb 2026 11:42:34 -0500 (EST)
Date: Fri, 13 Feb 2026 08:42:33 -0800
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <aY9UedlaCmagVmzh@tardis.local>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <20260213112837.GT2995752@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213112837.GT2995752@noisy.programming.kicks-ass.net>

On Fri, Feb 13, 2026 at 12:28:37PM +0100, Peter Zijlstra wrote:
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
> 
> 
> > +    /// - Callers must ensure that this call does not race with a write to the source page that
> > +    ///   overlaps with this read.
> 
> Yeah, but per the bit above, its user mapped, you *CANNOT* ensure this.
> 

First, this safety requirement is actually incorrect, because of the
user mapped case you mentioned. I believe Andreas put it to prevent
others from racing with memcpy(), e.g.

	(I'm flipping the read/write here between normal access and
	memcpy, but it's the same)

	CPU 0				CPU 1
	=====				=====
	let ptr: *mut i32 = ..; // a pointer to a 32 bit integer
					let x = 42;

					memcpy(ptr, &raw x);
	let v = *ptr; // <- the result of this is UB because of data
		      // race.

it's data race in C as well:

	CPU 0				CPU 1
	=====				=====
	int *ptr = ..;			int x = 42;
				
	int r0 = *ptr;			memcpy(ptr, &x);

But this is already covered by the previous safety requirement on "no
data races". Hence this safety requirement is redundant and incorrect to
me as well.

> And same comment as for v2, none of this makes sense. Byte loads are not
> magically atomic. And they don't actually fix anything.
> 

The problem that byte-wise atomic memcpy "solves" is the normal C
standard memcpy() and Rust's `core::ptr::copy()` cannot race with other
memory accesses. We didn't have our problem in our C memcpy(), because
it's implemented in a way that at byte level, they are atomic, i.e. you
cannot observe a teared byte.

(Note, the atomic part is indeed not necessary if you only need to
memcpy() a user mapped memory, but in Andreas use case, I believe the
same code is shared between "copying from user mapped memory" scenario
and "copying from in-kernel memory" scenario, for latter we need both
sides to be byte-wise atomic to avoid data races)

Of course, it's not magical on its own:

* when racing with in-kernel accesses, the other accesses need to be
  atomic or it's a read on the location the bytewise_atomic is reading
  from.

* when racing with external accesses (for example, userspace), the 
  kernel code needs to deal with whatever the userspace can do.

Regards,
Boqun

> NAK
