Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD492AD0C;
	Sat, 31 Jan 2026 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769844174; cv=none; b=ijO+h0Gm9QmABS2rA0MePm/2fGGl9hkizmGrDfT4Kgf3iF9mu3I2RvoZXUzsH+MzeBrUHO/iDgNrPMQeslu7WoZLOxWzG3J2cxTEk94xL97RxKi3dQLn3YEm+aP3HZ0tJ4+HOIMfABHhZl+Y0mUZ7msFFSednO9TatYGlwUL4B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769844174; c=relaxed/simple;
	bh=AIqB+Yz0BpkTQP5c/1PNpp0zKhJOID5ar/6PViA+Sl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtGdRqEy1fnqihr+FlAZmJDI6vPpk2GtjGq147ojNTA7C51l0nSrYwDaUz6tJ064LQqGZFFInl/3V2iWuLJ8ATyM+yFxFpv+RHRwzZdvLtWcQ3CWSFbpiN5co5t4x2/+lym/ekZkvEFQm/SIXqoDhGwcyxcU8ERIOyL8KWOxTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQLiAlJx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQLiAlJx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F012C16AAE;
	Sat, 31 Jan 2026 07:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769844173;
	bh=AIqB+Yz0BpkTQP5c/1PNpp0zKhJOID5ar/6PViA+Sl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQLiAlJx2/9lBd7BnG4auSBDs3LorTyoRsnoFRDvxsPLPgUYEi+DrKBFG8km/98UL
	 dXJp8oP/tDa/4cFQFXeu0LRAmkhPyX2v4/t3RG/HnfTt7sLfY4zghv+mwZgoBk9ifH
	 WOT5O5HaWsKNwnmw2LA8i0wyPXr0DuwgjZp0zOuFW9LLAZmltOPx/pzMksE7EBJfpU
	 tamQr7RBOQ4jaYmhDzbfKsHwmmZ0lRoQJ5TMu7cTRii4Dvr33ecBDqfpPFkN+jAF5d
	 3kMfPuF//6OplmwYffoZ3DyIpSwRvOi4Gtz/i+NKunQzHcq/OjzFv5yxux56eVCcL2
	 qlAIB4NYS4d9w==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2D759F4006E;
	Sat, 31 Jan 2026 02:22:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 31 Jan 2026 02:22:52 -0500
X-ME-Sender: <xms:zK19aYxHaWzOEhFYtMWKDAHE8m10XJs1XyteYJ5eGBqnVseKg0Fg9Q>
    <xme:zK19aWpTYKMN3vrWYvlzXHFWsKGmd5IlqGsFbZyLGXSEixgoXQ3zwBCxST4-PAc4z
    XcdVOKCQnMNeb5kFNXzJpFYhQoJ7hd8zKqY86XfDlzT2x65paBq_2o>
X-ME-Received: <xmr:zK19aQdgc5kwN6_WvOEi7RVdCQDRy2Aommo1A7y2ZAESl20OU3w72DFhO7d-EcKqQeIE3WFc-_OPZqbiR0VsHp64pGqHRYUe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujedufeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ehgfekuefgvdeffefggefgteeuieegieduffeghffhuefhleegiefhffduleetffenucff
    ohhmrghinheprhhushhtqdhlrghnghdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdduieejtdelkeegjeduqddujeejkeehheehvddqsghoqhhunheppe
    hkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduhedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphht
    thhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehlohhrvg
    hniihordhsthhorghkvghssehorhgrtghlvgdrtghomhdprhgtphhtthhopehlihgrmhdr
    hhhofihlvghtthesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhm
    pdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtg
    hpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zK19aRpRQbLWHDyQgntOj6bDEUTSSfESA_7h9_wyHdoRU5i5dQWkmg>
    <xmx:zK19aSnpz3iyfIAkC3WelIP7etHLXc4bllXNYJ0UJsR76qEBzoUZlA>
    <xmx:zK19aaSPd-81iMyCN2nldTmbWfz1FrqeGPURtMxriVdGuzgIV-7BDw>
    <xmx:zK19aQbxCGXHfPP-BcA-xlC9ltqSliupI5CGGXRgv8X6tFpB1zQMiQ>
    <xmx:zK19aS_Tc8lYWGz8H38xV7ZfI0tABuAuapAIF4XYCBQYRUqJdflq8UJV>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Jan 2026 02:22:51 -0500 (EST)
Date: Fri, 30 Jan 2026 23:22:50 -0800
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
Message-ID: <aX2tyn9nBUEKM-SN@tardis.local>
References: <a8nHDdzac5l20akcxjjf9w7huObjn4eIHjUI-A17aKEwWl1N-4vvLBiVdqTQbBHwypMIA6gNkzm8YFXmMl44ew==@protonmail.internalid>
 <DG1ZJ1350EMS.1S1360PA496QG@garyguo.net>
 <874io3rwl3.fsf@t14s.mail-host-address-is-not-set>
 <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid>
 <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
 <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <aX0lcVngRcRwqgd5@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aX0lcVngRcRwqgd5@tardis.local>

On Fri, Jan 30, 2026 at 01:41:05PM -0800, Boqun Feng wrote:
> On Fri, Jan 30, 2026 at 05:20:11PM +0100, Andreas Hindborg wrote:
> [...]
> > >> In the last discussions we had on this, the conclusion was to use
> > >> `volatile_copy_memory` whenever that is available, or write a volatile
> > >> copy function in assembly.
> > >>
> > >> Using memcpy_{from,to}io is the latter solution. These functions are
> > >> simply volatile memcpy implemented in assembly.
> > >>
> > >> There is nothing special about MMIO. These functions are name as they
> > >> are because they are useful for MMIO.
> > >
> > > No. MMIO are really special. A few architectures require them to be accessed
> > > completely differently compared to normal memory. We also have things like
> > > INDIRECT_IOMEM. memory_{from,to}io are special as they use MMIO accessor such as
> > > readb to perform access on the __iomem pointer. They should not be mixed with
> > > normal memory. They must be treated as if they're from a completely separate
> > > address space.
> > >
> > > Normal memory vs DMA vs MMIO are all distinct, and this is demonstrated by the
> > > different types of barriers needed to order things correctly for each type of
> > > memory region.
> > >
> > > Userspace-mapped memory (that is also mapped in the kernel space, not __user) is
> > > the least special one out of these. They could practically share all atomic infra
> > > available for the kernel, hence the suggestion of using byte-wise atomic memcpy.
> > 
> > I see. I did not consider this.
> > 
> > At any rate, I still don't understand why I need an atomic copy function, or why I
> > need a byte-wise copy function. A volatile copy function should be fine, no?
> > 
> 
> but memcpy_{from,to}io() are not just volatile copy functions, they have
> additional side effects for MMIO ;-)
> 

For example, powerpc's memcpy_fromio() has eioio() in it, which we don't
need for normal (user -> kernel) memory copy.

> > And what is the exact problem in using memcpy_{from,to}io. Looking at

I think the main problem of using memcpy_{from,to}io here is not that
they are not volatile memcpy (they might be), but it's because we
wouldn't use them for the same thing in C, because they are designed for
memory copying between MMIO and kernel memory (RAM).

For MMIO, as Gary mentioned, because they are different than the normal
memory, special instructions or extra barriers are needed.

For DMA memory, it can be almost treated as external normal memory,
however, different archictures/systems/platforms may have different
requirement regarding cache coherent between CPU and devices, specially
mapping or special instructions may be needed.

For __user memory, because kernel is only given a userspace address, and
userspace can lie or unmap the address while kernel accessing it,
copy_{from,to}_user() is needed to handle page faults.

Your use case (copying between userspace-mapped memory and kernel
memory) is, as Gary said, the least special here. So using
memcpy_{from,to}io() would be overkill and probably misleading. I
suggest we use `{read,write}_volatile()` (unless I'm missing something
subtle of course), however `{read,write}_volatile()` only works on Sized
types, so we may have to use `bindings::memcpy()` or
core::intrinsics::volatile_copy_memory() [1] (or suggest Rust to
stablize something) if we want to avoid implementing something by
ourselves.

[1]: https://doc.rust-lang.org/std/intrinsics/fn.volatile_copy_memory.html

Regards,
Boqun

> > it, I would end up writing something similar if I wrote a copy function
> > myself.
> > 
> > If it is the wrong function to use, can you point at a fitting funciton?
> > 
> 
> I *think* for your use cases, a `user_page.read_volatile()` should
> suffice if the only potential concurrent writer is in the userspace
> (outside the Rust AM). The reason/rule I'm using is: a volatile
> operation may race with an access that compiler can know about (i.e.
> from Rust and C code), but it will not race with an external access.
> 
> However, byte-wise atomic memcpy will be more defined without paying any
> extra penalty.
> 
> Regards,
> Boqun
> 
> > 
> > Best regards,
> > Andreas Hindborg
> > 
> > 
