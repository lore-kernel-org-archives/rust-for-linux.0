Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F214E218ACC
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 16:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770999561; cv=none; b=slDRLJtl1U2BOVMLLHzORO3gjlUJhpFkMGwIJYqoM6eIj3vgPYtY6+M9tMiW0D6dRhd8p+ucBjtzb+SH9gK4Y/TFTVJz6cQSYeZpUj7wTtydrw6yU8//BRG4Pyh66n9C9oRr9m2iXbUb1MlEsa9uPd+QIchad2W3PhFc28e403k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770999561; c=relaxed/simple;
	bh=6wn8Lo1FQZGQiBYxgE6s5N3YCrutqKmZ719Y7h4CCRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqsKTtPzS1AUoFp3ASt/OrofMQyXwGLVi07jSaq3Q8oDR9Czgch0TO2l8agTOUBZbSRYZE/no/B+E36CGsVG33LKrS5VZzvuB+pI/IeKJvrIeyxZIfW5UFPdS0PsBjQc088gO/Tq1CJh25goMuHFZxq7VpGgN8GJEoKMdjft6hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfjFOyqp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GfjFOyqp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20983C116C6;
	Fri, 13 Feb 2026 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770999560;
	bh=6wn8Lo1FQZGQiBYxgE6s5N3YCrutqKmZ719Y7h4CCRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GfjFOyqp/Vwv1QzfzshF2QizgRGwVI1ffbytrt5g0MPfm9/1CCts3iJuvJ4pK/O6Y
	 LWYyCcZIf00lWyM+ko1o7Fd35ItJHuIl/QW6BbtwIufXyGnsz11+P4U8rEjpObKjoO
	 VN4RORDBX0ALSP+9Ci6Inlo2H68SGxz7QJ2uSziFJioGccPjMzOF/rHV6uu94m92i/
	 dAiLaJV1gOW5GPynoSBwAISXgtA+39FUgWEHOaoeIWVrMJkfAYqft1Fz7RcnzVPJtG
	 gBu6QJW0FHx+myJ4rTCb+/X5e3KAbyyCLSkxru2DyTaskeOlRNz8ISQTeYLxR01YBe
	 wPGMnrW7F6Naw==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4309FF40068;
	Fri, 13 Feb 2026 11:19:19 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 13 Feb 2026 11:19:19 -0500
X-ME-Sender: <xms:B0-PafpkflOTSANspNhJFJG4HD84fhmOJq0JNnXzF_s6WIVopL2uKA>
    <xme:B0-PabAxHGDMbgdg9AwZ8KPILfWd1Wgz-BPqxaOmgrg7StcBS5E_h4xGNiz7O85qy
    nCizerwwCIUxd8ZU1GfwdPw4llG7ut7P6GfKwaWqkp4w61Qj7ndTg>
X-ME-Received: <xmr:B0-PaVcHnEoHlzufV6v8uWKUZkK75iZCC2CyQodwzEHq0xK9rdpGeyGEH3HSRr2z3xRuRozPPTtRSYxa3um9it0XsD1J27zv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdekjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ehkeeijeeggeehkeehtddthfdtgfejueefleeutdefjeegvefhhffgueeiteekfeenucff
    ohhmrghinhepohhpvghnqdhsthgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkh
    gvrhhnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudelpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunh
    gurghtihhonhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhho
    rhgvnhiiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhmpdhrtghpthhtoheplhhirg
    hmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtg
    homhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:B0-PabIAMi0ukVs3yBqFnaQ1T4Zvumjsj-uzzkJcSLf69Ud4YxM73g>
    <xmx:B0-PaVtBqECs8RQByCBbhP8hi3n5ZmdsXbXzqmyvsjLvEGdC31C6Vg>
    <xmx:B0-PaVbzIvEfQd6Gh0kcIeWB1DK_NtHYaiPbpf6ukEboRmbun-qqSA>
    <xmx:B0-Pad0xuKtbxBb5rjr44ozCuYS3mPB15R2zFp1rSB5LFfwPlGjKsA>
    <xmx:B0-PaTUBrFxvR51MLnVWA3E0RiUXLi1QcM0eQnePIkqROa5i-sv_eqk4>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Feb 2026 11:19:18 -0500 (EST)
Date: Fri, 13 Feb 2026 08:19:17 -0800
From: Boqun Feng <boqun@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
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
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <aY9PBfx3RRV7rXZ5@tardis.local>
References: <40xUh92AU5E9oFxQrdej-AXVg76jmaWGKXZMLoOHXe35Lw9x_eNEoLup9bB60LyGZ_0USPmoxr-9hE3ujA67cQ==@protonmail.internalid>
 <2026021343-germicide-baritone-efe8@gregkh>
 <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026021326-stark-coastline-c5bc@gregkh>

On Fri, Feb 13, 2026 at 04:58:54PM +0100, Greg KH wrote:
> On Fri, Feb 13, 2026 at 07:45:19AM -0800, Boqun Feng wrote:
> > On Fri, Feb 13, 2026 at 04:34:04PM +0100, Greg KH wrote:
> > > On Fri, Feb 13, 2026 at 03:26:08PM +0100, Peter Zijlstra wrote:
> > > > On Fri, Feb 13, 2026 at 03:13:01PM +0100, Andreas Hindborg wrote:
> > > > 
> > > > > C uses memcpy as seen in `bio_copy_data_iter` [1] and in the null_blk
> > > > > driver [2].
> > > > 
> > > > Right. And that is *fine*.
> > > > 
> > 
> > Yes, that's fine because memcpy() in C is volatile and per-byte atomic.
> > 
> > > > > Rust has `core::ptr::copy` and `core::ptr::copy_nonoverlapping`. I was
> > > > > informed these are not safe to use if source or destination may incur
> > > > > data races, and that we need an operation that is volatile or byte-wise
> > > > > atomic [3].
> > > > 
> > > > Safe how? It should just copy N bytes. Whatever it thinks those bytes
> > > > are.
> > > > 
> > > > Nothing can guard against concurrent modification. If there is, you get
> > > > to keep the pieces. Pretending anything else is delusional.
> > > > 
> > > > Suppose the memory was 'AAAA' and while you're reading it, it is written
> > > > to be 'BBBB'. The resulting copy can be any combination of
> > > > '[AB][AB][AB][AB]'. Not one of them is better than the other.
> > > > 
> > 
> > The idea is if using Rust's own `core::ptr::copy()` or
> > `core::ptr::copy_nonoverlapping()`, you may get `CCCC`, because they are
> > not semantically guaranteed atomic per byte (i.e. tearing can happen at
> > bit level, because they are not designed for using in case of data
> > races, and there is no defined asm implementation of them, compilers can
> > do anything).
> 
> Then why not just call the proper, in-kernel, arch specific, patched and
> tested to the end-of-the-earth, memcpy()?
> 

I believe you hadn't read my reply that we indeed call memcpy() here. So
I'm not going to reply this in case you mean something else.

> > > > No byte wise volatile barrier using nonsense is going to make this any
> > > > better.
> > 
> > It's byte-wise atomic [1], which should be guaranteed using asm to
> > implement, hence at least at byte level, they are atomic (and volatile
> > in our case).
> > 
> > [1]: https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p1478r5.html
> 
> Again, just use memcpy() please.
> 
> > > > 
> > > 
> > > I'm with Peter, just call memcpy() like the C code does, and you will be
> > > "fine" (with a note that "fine" better include checking the data really
> > 
> > We are. See v3, we actually use `memcpy()` for the copy (as I already
> > pointed out, Andreas made a mistake in this version), it's just
> > because it's per-byte atomic. What this "byte-wise atomic" does is
> > clearing things out.
> 
> clear what out?  It shouldn't need anything special for a memcpy.
> 

Well, in standard C, technically memcpy() has the same problem as Rust's
`core::ptr::copy()` and `core::ptr::copy_nonoverlapping()`, i.e. they
are vulnerable to data races. Our in-kernel memcpy() on the other hand
doesn't have this problem. Why? Because it's volatile byte-wise atomic
per the implementation.

So here, the clearing out is needed to say: this is not Rust's `copy()`
and this is not C's `memcpy()`, this is the kernel version, and it's
fine not because magic or kernel people believe it, but because its
implementation. The concept of byte-wise atomic at least describes this
correctly.

Regards,
Boqun

> thanks,
> 
> greg k-h
