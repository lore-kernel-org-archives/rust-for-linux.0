Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB11261B9B;
	Tue, 17 Feb 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343294; cv=none; b=u4orT/jkfCuRJLIwTR+hFLL0U6/caq8EqApeaXmma0FadIc5isEXBgDYUf+LuxuiYQoCxVY1zd4mTRz2dC3c4IWsRXnrDMS0eA52sHdqDrp9TPpx0XMFJUES5BkQMZkvkZEqod7nPf9akZ1r3I/89op+P2cuA7679VkgVjtpIEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343294; c=relaxed/simple;
	bh=w+A5nhXWWpyNwozugzEP/rAxiuh2cv287ne/053EJso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7X4EkiAa0P+s75vUPKZMG3nujK6sy/fIIaBN5tlHc10uSHmYvJIIwQN5fsYwSDR2AJxVedYGJuTyDx85NatevnzOItPjwR5RfW1lN3Vd3zn5swuORm2QXNNvOhLTMsA9gIcjdZsC2dye8AWxgeG1fIdlaoThLsC1PpiQ9iHfkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WLDa+1rH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WLDa+1rH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dHYH87P+PfmJ9W0AOfrm++kpPQ5b8kEilmzfcpLvcPo=; b=WLDa+1rHjaSpGUe58q+VPZtPRa
	c2V1E3q0mG1Yp/Rv5t/0FB+N7ZlmnR+gk/eYxrzLGW4HMoB4OzRjuti9QshUH+JY6/B+BZ0x4R9Ct
	srdHexh7JnidKmu42uckLVWj/QIIwe/BayGb/Vro5ikoe3VWXgtB02C1mpQ/7DOdzXIeJ/zPzJl95
	DQKBo5bE8ace0kZDQH0mSFH+LGMBnVo1sV5+IF5L75x506ifJSOdwVTEsp/pIV/s4iLF9wmjwyEBh
	0i3Bt3mP3teVIiEL73SoWH5wwc2gFx9hmDz1uekfrOsP1oJmfZxDpXSjCwzOxOL6EQuf4zzM5UvuY
	RcgdhaQw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNIv-00000004cPF-327V;
	Tue, 17 Feb 2026 15:48:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6413130315A; Tue, 17 Feb 2026 16:48:00 +0100 (CET)
Date: Tue, 17 Feb 2026 16:48:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
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
Message-ID: <20260217154800.GY2995752@noisy.programming.kicks-ass.net>
References: <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <aZRWOIPThLfIZ1Ph@google.com>
 <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
 <aZRokyTqsd_RwdkK@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZRokyTqsd_RwdkK@google.com>

On Tue, Feb 17, 2026 at 01:09:39PM +0000, Alice Ryhl wrote:
> On Tue, Feb 17, 2026 at 01:09:20PM +0100, Peter Zijlstra wrote:
> > On Tue, Feb 17, 2026 at 11:51:20AM +0000, Alice Ryhl wrote:
> > 
> > > In my experience with dealing with `struct page` that is mapped into a
> > > vma, you need memcpy because the struct might be split across two
> > > different pages in the vma. The pages are adjacent in userspace's
> > > address space, but not necessarily adjacent from the kernel's POV.
> > > 
> > > So you might end up with something that looks like this:
> > > 
> > > struct foo val;
> > > void *ptr1 = kmap_local_page(p1);
> > > void *ptr2 = kmap_local_page(p2);
> > > memcpy(ptr1 + offset, val, PAGE_SIZE - offset);
> > > memcpy(ptr2, val + offset, sizeof(struct foo) - (PAGE_SIZE - offset));
> > > kunmap_local(ptr2);
> > > kunmap_local(ptr1);
> > 
> >   barrier();
> > 
> > > if (is_valid(&val)) {
> > >     // use val
> > > }
> > > 
> > > This exact thing happens in Binder. It has to be a memcpy.
> > 
> > Sure, but then stick that one barrier() in and you're good.
> 
> Are we really good? Consider this code:
> 
> 	bool is_valid(struct foo *val)
> 	{
> 		// for the sake of example
> 		return val->my_field != 0;
> 	}
> 
> 	struct foo val;
> 
> 	void *ptr = kmap_local_page(p1);
> 	memcpy(ptr, val, sizeof(struct foo));
> 	kunmap_local(p);
> 	barrier();
> 	if (is_valid(&val)) {
> 	    // use val
> 	}
> 
> optimize it into this first:
> 
> 	struct foo val;
> 	int my_field_copy;
> 
> 	void *ptr = kmap_local_page(p1);
> 	memcpy(ptr, val, sizeof(struct foo));
> 	my_field_copy = val->my_field;
> 	kunmap_local(p);
> 	barrier();
> 	if (my_field_copy != 0) {
> 	    // use val
> 	}
> 
> then optimize it into:
> 
> 	struct foo val;
> 	int my_field_copy;
> 
> 	void *ptr = kmap_local_page(p1);
> 	memcpy(ptr, val, sizeof(struct foo));
> 	my_field_copy = ((struct foo *) ptr)->my_field;
> 	kunmap_local(p);
> 	barrier();
> 	if (my_field_copy != 0) {
> 	    // use val
> 	}

I don;t think this is allowed. You're lifting the load over the
barrier(), that is invalid.

So the initial version is:

	ptr = kmap_local_page()
	memcpy(ptr, val, sizeof(val))
	kunmap_local(ptr);

	barrier()

	if (val.field)
	  // do stuff

So the 'val.field' load is after the barrier(); and it must stay there,
because the barrier() just told the compiler that all of memory changed
-- this is what barrier() does.


