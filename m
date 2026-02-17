Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8EB331A73;
	Tue, 17 Feb 2026 11:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327684; cv=none; b=WtFKryj5RW0qAyxGI863hSs9X6OJN5b9eRqKNs1VAw4TN9L6+j7bjRs4JXogyVhyS2y9GMa78wqYwb5T4YJnlg5bS3ChpHnVsT/LhTZLhScNn5Cu/4XvUqgZREONDnOY+DaoMQeI6nCTVxd76oXs7GeK6Q3sV8mdNg5TSorW4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327684; c=relaxed/simple;
	bh=yAXb263TwNY8RmZE7xMSP6WxqPahf2AuPrcHAyqAIGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBqIY56rYeq0ZaKRLo+LPt0g7hDOATJQWEsHvN5GD1HTMTo+cz5WAiLYQxrGMFyyZcQlOZvB2/uTuy/ABYzkXpcy7cQ36YZW6y8v7Qpbh3mvlLgbQM9UKciGyX8s2Tsy/oOABqsp7DNk7yTsiWeYS6/1dFNxsZoEhnyH/5SE8s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eWgr0jx9; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eWgr0jx9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=stb0z7knForfhqJYkYuHTJ6w3kMgucRX9hnQ4DntjkI=; b=eWgr0jx95zdtgddw/APUJ2QAvn
	3M7U1Z4NmdgpLCD8admb1ymds/+cFBkUjg0lH1PRJq3NvfT5Gflve7TyOktCfkZ1JYap3Q9sKMFWY
	R78ugf2T929QxlR7hLomjGQk7i1MZH3fR5PQB94Ur93i0hsvPRSH7H+CQiVjinLHfuLaljW6Ld6+j
	H52D05iQzGtQsEfK3cG0fWD+H25qyma62GuWpV36ryh5N1nvyoQY5HLZvjRwM0TieBbNm+RZG6WvW
	ZEqy5xDZRWJHov7eO1Y0IsCmNaM78YALUmNtSW9JtB5qA41dJ/QEe4+R7kkdCI6RP16x/0V0ZYi1W
	e+LbKFEA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJF8-00000004Li2-0mRV;
	Tue, 17 Feb 2026 11:27:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 00EF3300CDE; Tue, 17 Feb 2026 12:09:11 +0100 (CET)
Date: Tue, 17 Feb 2026 12:09:11 +0100
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
Message-ID: <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
References: <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh>
 <aY9PBfx3RRV7rXZ5@tardis.local>
 <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZRHJ7pSzOHruPA2@google.com>

On Tue, Feb 17, 2026 at 10:47:03AM +0000, Alice Ryhl wrote:

> > Stop using atomic for this. Is not atomic.
> > 
> > Key here is volatile, that indicates value can change outside of scope
> > and thus re-load is not valid. And I know C language people hates
> > volatile, but there it is.
> 
> Well, don't complain to me about this. I sent a patch to add READ_ONCE()/
> WRITE_ONCE() impls for Rust and was told to just use atomics instead,
> see: https://lwn.net/Articles/1053142/

*groan*

> > > 	// OK!
> > > 	unsigned long *a, b;
> > > 	b = READ_ONCE(a);
> > > 	if is_valid(b) {
> > > 	    // do stuff
> > > 	}
> > > 
> > > Now consider the following code:
> > > 
> > > 	// Is this ok?
> > > 	unsigned long *a, b;
> > > 	memcpy(a, &b, sizeof(unsigned long));
> > > 	if is_valid(b) {
> > > 	    // do stuff
> > > 	}
> > 
> > Why the hell would you want to write that? But sure. I think similar but
> > less weird example would be with structures, where value copies end up
> > being similar to memcpy.
> 
> I mean sure, let's say that it was a structure or whatever instead of a
> long. The point is that the general pattern of memcpy, then checking the
> bytes you copied, then use the bytes you copied, is potentially
> susceptible to this exacty optimization.

> > And in that case, you can still use volatile and compiler must not do
> > silly.
> 
> What you mean by "volatile" here is the same as what this patch means
> when it says "per-byte atomic". If you agree that a "volatile memcpy"
> would be a good idea to use in this scenario, then it sounds like you
> agree with the patch except for its naming / terminology.

  struct foo {
    int a, b;
  };

  struct foo *ptr, val;

  val = *(volatile struct foo *)ptr;

why would we need a an explicit new memcpy for this?

> > So I'm still not exactly sure why this is a problem all of a sudden?
> 
> I mean, this is for `struct page` specifically. If you have the struct
> page for a page that might also be mapped into a userspace vma, then the
> way to perform a "copy_from_user" operation is to:
> 
> 1. kmap_local_page()
> 2. memcpy()
> 3. kunmap_local()
> 
> Correct me if I'm wrong, but my understanding is that on 64-bit systems,
> kmap/kunmap are usually complete no-ops since you have enough address
> space to simply map all pages into the kernel's address space. Not even
> a barrier - just a `static inline` with an empty body.

That is all correct -- however that cannot be all you do.

Any shared memory will involved memory barriers of a sort. You cannot
just memcpy() and think you're done.

So yeah, on x86_64 those 1,2,3 are insufficient to inhibit the re-load,
but nobody should ever just do 1,2,3 and think job-done. There must
always be more.

If it is a ring-buffer like thing, you get:

         *   if (LOAD ->data_tail) {            LOAD ->data_head
         *                      (A)             smp_rmb()       (C)
         *      STORE $data                     LOAD $data
         *      smp_wmb()       (B)             smp_mb()        (D)
         *      STORE ->data_head               STORE ->data_tail
         *   }

if it is a seqlock like thing you get that.

If it is DMA, you need dma fences.

And the moment you use any of that, the re-load goes out the window.

