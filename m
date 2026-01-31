Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F20A35CBD6;
	Sat, 31 Jan 2026 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769887837; cv=none; b=CvGPzoGKa2qkLwduM0zvB6JJV6KWoRaRSQex9TenilJdY/kO8EMHfLEtle2Jc6c/TqLQJCa6t0x0356cUYLByE5ou8NP1UtpfmrqFUxOV2tzixKjGZbKT/pLPRuU2Flo3DUl0d7v/uAqU7g13mnG4rg4Ad/9/3c42KOp0CZqHvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769887837; c=relaxed/simple;
	bh=CqEWdOFYuLKJESic8imDZogOszIvyv9olgNV5ixul/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PI3BWGyTZQ1/XTSviqZrGQxsimwDtc3SVeFKv++hLyaZLuEhQFNihWt75Y2X8KaIih9BBYbRPvAJi9b0ebdZEQnfxmxIVDWvx8kDZdRlNxdXdld6X1sES6xPgXfRG1u8GMs4+a+kOW82fCInZy/9QDVH3QBx2DPeu3fm6FBMlBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKKB+iuR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKKB+iuR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4202EC16AAE;
	Sat, 31 Jan 2026 19:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769887836;
	bh=CqEWdOFYuLKJESic8imDZogOszIvyv9olgNV5ixul/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mKKB+iuRuidAZDPY3DmNKnQ5NfVz4Ne5bsLpP1auedbo7rh0km4tjNA0x4UfEGUZz
	 Gz7R9b3B9mdzeOn4dbVn6zmAWipWlkPA50c3N6SfPNCYPAABw/zSLLD25FCO9K1CiM
	 pxC/fOzW9ih3ZI8ouU+EoMJ68S9lrSeOAiXkj2hHfeXNmsbE63ASXpM2i3Kvr0cazd
	 vj2ZD0uAfLhTZSxOnTsMGsiA4oaEd9j5dXy2nY9/lpdI3aDijEZsqy3I/KF7shzpup
	 nyuktP25ypX3ZzXe8uxTOD8kbyv92F10QlvAKUqEE6SJUygZSWUz9X3eVxN2MPUx5s
	 2/XCrlc6NiUJg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 40145F4006E;
	Sat, 31 Jan 2026 14:30:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 31 Jan 2026 14:30:35 -0500
X-ME-Sender: <xms:W1h-acgrORYgmbliPZM05YCchcC9vv7pyJoxbKY-d8rG6Dc_m7j-uw>
    <xme:W1h-afZoQifj8vUB6LUaJR9NXfMIKn9cZUrTsuT-1yYjgcyU6bninbp7W5LXHc419
    bZnxt65D_msSVOSRMCgqfv3NWUh48GmdHsPYiHOqHUaPvRTInoBJA>
X-ME-Received: <xmr:W1h-aaNUIiVQjU-rSxTHQFIeowyYFYZljcg8RLZ8YTivUNZOsrbO3mlWjoSmkJOVgpWnt3Kz-9jyXo4J0EjRAVZjQAi_acZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedvjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ehkeeijeeggeehkeehtddthfdtgfejueefleeutdefjeegvefhhffgueeiteekfeenucff
    ohhmrghinhepohhpvghnqdhsthgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkh
    gvrhhnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhorhgvnh
    iiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhmpdhrtghpthhtoheplhhirghmrdhh
    ohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdp
    rhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtph
    htthhopehlohhsshhinheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:W1h-aYafUyOdhoXbZyL63-vj3lpjbJ5pVUeR6jZlAlzwxcPA2FSa4Q>
    <xmx:W1h-aSVVoAOl4agt_-gZpveogoRwTDq25foPUwqyUpSRc-YljZyD7A>
    <xmx:W1h-afDxiV_L1yBc0jXMMSsoNu1Cgs3l-CUNACx3KEGBSv6jezfePw>
    <xmx:W1h-aWITPSfbhz-IVxwCtxckSGm34oHA87R-LcHsWa70RF1TahUY-g>
    <xmx:W1h-aVscVcUwMZBww8IycVD-ARxI8ipzKovKou0lT2peYPrOPZcHBGVs>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Jan 2026 14:30:34 -0500 (EST)
Date: Sat, 31 Jan 2026 11:30:33 -0800
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
Message-ID: <aX5YWdBxPmPrTLDA@tardis.local>
References: <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <-5tKAwUVrj6fo337a8NWsHQBepB07jKIVI-VafwW1zp0vsGTCkBTuI5nCBniftYJePZy8kb7bhWptJ2Gc_B-kQ==@protonmail.internalid>
 <aX0lcVngRcRwqgd5@tardis.local>
 <87pl6prkc6.fsf@t14s.mail-host-address-is-not-set>
 <DceHeOJQ2ZdVoA8jlWqMpTO6bHsSLi-JNu4iXSpnMetXsYWKkLkv7vGSdHqqNIVV4XnkW5SfReAA9dDoUENEIw==@protonmail.internalid>
 <aX4xNxsF5Qs0CTPW@tardis.local>
 <87jywxr42q.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jywxr42q.fsf@t14s.mail-host-address-is-not-set>

On Sat, Jan 31, 2026 at 08:10:21PM +0100, Andreas Hindborg wrote:
> "Boqun Feng" <boqun@kernel.org> writes:
> 
> > On Sat, Jan 31, 2026 at 02:19:05PM +0100, Andreas Hindborg wrote:
> > [..]
> >> >
> >> > However, byte-wise atomic memcpy will be more defined without paying any
> >> > extra penalty.
> >>
> >> Could you explain the additional penalty of `core::ptr::read_volatile`
> >> vs `kernel::sync::atomic::Atomic::load` with  relaxed ordering?
> >>
> >
> > I don't understand your question, so allow me to explain what I meant:
> > for the sake of discussion, let's assume we have both
> >
> > 	fn volatile_copy_memory(src: *mut u8, dst: *mut u8, count: usize)
> >
> > and
> >
> > 	fn volatile_byte_wise_atomic_copy_memory(<same signature>, ordering: Ordering)
> >
> > implemented. What I meant was to the best of my knowledge, when ordering
> > = Relaxed, these two would generate the exact same code because all the
> > architectures that I'm aware of have byte wise atomicity in the
> > load/store instructions. And compared to volatile_copy_memory(),
> > volatile_byte_wise_atomic_copy_memory() can bear the race with another
> > volatile_byte_wise_atomic_copy_memory() or any other atomic access
> > (meaning that's not a UB). So I'd prefer using that if we have it.
> 
> Ok, thanks for clarifying. I assumed you were referring to the other
> functions I mentioned, because they exist in `kernel` or `core`.
> `volatile_copy_memory` is unstable in `core`, and as far as I know
> `volatile_byte_wise_atomic_copy_memory` does not exist.

I was using volatile_byte_wise_atomic_copy_memory() to represent the
concept that we have a volatile byte-wise atomic memcpy. I was trying to
discuss the performance difference (which is 0) between a "volatile
memory copy" and "a volatile byte-wise atomic memory copy" based on
these concepts to answer your question about the "penalty" part of my
previous reply.

> 
> When you wrote `read_volatile`, I assumed you meant
> `core::ptr::read_volatile`, and the atomics we have are
> `kernel::sync::atomic::*`.

It was the curse of knowledge, when I referred to "byte-wise atomic
memcpy", I meant the concept of this [1], i.e. a memcpy that provides
atomicity of each byte.

[1]: https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2022/p1478r7.html

> 
> So now I am a bit confused as to what method you think is usable here.
> Is it something we need to implement?
> 

First, since the length of the copy is not fixed, we will need something
like `volatile_copy_memcpy()` to handle that. So I need to take back my
previous suggestion about using `read_volatile()`, not because it would
cause UB, but because it doesn't handle variable lengths.

But if there could be a concurrent writer to the page we are copying
from, we need a `volatile_byte_wise_atomic_copy_memory()` that we need
either implement on our own or ask Rust to provide one.

Does this help?

Regards,
Boqun

> Best regards,
> Andreas Hindborg
> 
> 
> 
