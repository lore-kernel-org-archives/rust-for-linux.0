Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278432D8396;
	Tue, 17 Feb 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323971; cv=none; b=hujGYLgINlVw2LFf/doxkpqo2wnlJAHZE/q8k5RMhFSGbyDHFzuTjPz1/DTGqTRJhKg7fEH065oMcCAB5j7epIEEXD/LZcRaCc4a6duh5zz1rYqYXJv5nZH94+ESuBsvz+heJNpXOBXa4hQ2yKKYf0xIzmTKIqUddNICFBnLvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323971; c=relaxed/simple;
	bh=UKP3oKZ3s21QTV6lJuPupdj9NoA2o8sKla6LeDIvRxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWn66OOxbvTXCQoYGFBPmLso1+u8lgXmRKfNLkg6a30NN0qVfrnmnxZd+wTe3jEseasSRnFoLis8IpqYmF3u3VT4+ZiozDYfZT1DYWBObBinr9F73WZhurAZ9cjww0mQtksi49CNmv73ujl7yHaoHC6QTKZHhsOtX3ECtufN5Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZKp4GUL5; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZKp4GUL5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LdgR9J3y9XFwf9Pjemt6beHFk6KHynnpaTjue2G2oAw=; b=ZKp4GUL5rcy3Oyp09BLsWUvOs1
	10q59nf7z2zf6Ryfu5yA/i0FllAQG+ZetzF3uB8W+0DPSP7KiQNYI33Vy8CKlunIhQdoEZ9wzInVh
	4L46SkgM/bszGh/9OyZbSGAO3FBp7t1spKFdFJ8jktQ1nJEO52Bedkfvvz36kwzGADWRgwVd6UJzM
	INL8g3wanBuX6sMgOgTlVJAbl9Q3Zp5a9XSB9VzTaJkpiLa15iLnBZ80podew9cDZG34qMDIhPF6u
	4BydGRNNQ+WLqPy9ki5sR91c6NYq+eZWvTUDxng9Rq+hJrP8ElieIcDPrKjzXGtiiBYcGze62fqYw
	li/6BRdA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIHH-0000000FirW-0ljG;
	Tue, 17 Feb 2026 10:25:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BF8CE300CDE; Tue, 17 Feb 2026 11:25:57 +0100 (CET)
Date: Tue, 17 Feb 2026 11:25:57 +0100
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
Message-ID: <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
References: <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh>
 <aY9PBfx3RRV7rXZ5@tardis.local>
 <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZQ8lJJ-U_8j03Z4@google.com>

On Tue, Feb 17, 2026 at 10:01:56AM +0000, Alice Ryhl wrote:
> On Tue, Feb 17, 2026 at 10:45:15AM +0100, Peter Zijlstra wrote:
> > On Tue, Feb 17, 2026 at 09:33:40AM +0000, Alice Ryhl wrote:
> > > On Tue, Feb 17, 2026 at 10:13:48AM +0100, Peter Zijlstra wrote:
> > > > On Fri, Feb 13, 2026 at 08:19:17AM -0800, Boqun Feng wrote:
> > > > > Well, in standard C, technically memcpy() has the same problem as Rust's
> > > > > `core::ptr::copy()` and `core::ptr::copy_nonoverlapping()`, i.e. they
> > > > > are vulnerable to data races. Our in-kernel memcpy() on the other hand
> > > > > doesn't have this problem. Why? Because it's volatile byte-wise atomic
> > > > > per the implementation.
> > > > 
> > > > Look at arch/x86/lib/memcpy_64.S, plenty of movq variants there. Not
> > > > byte-wise.
> > > 
> > > movq is a valid implementation of 8 byte-wise copies.
> > > 
> > > > Also, not a single atomic operation in sight.
> > > 
> > > Relaxed atomics are just mov ops.
> > 
> > They are not atomics at all.
> 
> Atomic loads and stores are just mov ops, right? Sure, RMW operations do
> more complex stuff, but I'm pretty sure that relaxed atomic loads/stores
> generally are compiled as mov ops.

Yeah, because they're not in fact atomic. I have, on various occasions,
told people to not use atomic_t if all they end up doing is atomic_set()
and atomic_read(). They're just loads and stores, nothing atomic about
them.

They are just there to complete the interactions with the actual RmW
operations.

> > Somewhere along the line 'atomic' seems to have lost any and all meaning
> > :-(
> > 
> > It must be this C committee and their weasel speak for fear of reality
> > that has infected everyone or somesuch.
> > 
> > Anyway, all you really want is a normal memcpy and somehow Rust cannot
> > provide? WTF?!
> 
> Forget about Rust for a moment.
> 
> Consider this code:
> 
> 	// Is this ok?
> 	unsigned long *a, b;
> 	b = *a;
> 	if is_valid(b) {
> 	    // do stuff
> 	}

Syntax error on is_valid(), need opening ( after if.

> I can easily imagine that LLVM might optimize this into:
> 
> 	// Uh oh!
> 	unsigned long *a, b;
> 	b = *a;
> 	if is_valid(*a) {  // <- this was "optimized"
> 	    // do stuff
> 	}

Well, compiler would not do anything, since it wouldn't compile :-) But
sure, that is valid transform.

> the argument being that you used an ordinary load of `a`, so it can be
> assumed that there are no concurrent writes, so both reads are
> guaranteed to return the same value.
> 
> So if `a` might be concurrently modified, then we are unhappy.
> 
> Of course, if *a is replaced with an atomic load such as READ_ONCE(a) an
> optimization would no longer occur.

Stop using atomic for this. Is not atomic.

Key here is volatile, that indicates value can change outside of scope
and thus re-load is not valid. And I know C language people hates
volatile, but there it is.

> 	// OK!
> 	unsigned long *a, b;
> 	b = READ_ONCE(a);
> 	if is_valid(b) {
> 	    // do stuff
> 	}
> 
> Now consider the following code:
> 
> 	// Is this ok?
> 	unsigned long *a, b;
> 	memcpy(a, &b, sizeof(unsigned long));
> 	if is_valid(b) {
> 	    // do stuff
> 	}

Why the hell would you want to write that? But sure. I think similar but
less weird example would be with structures, where value copies end up
being similar to memcpy.

And in that case, you can still use volatile and compiler must not do
silly.

> If LLVM understands the memcpy in the same way as how it understands
> 
> 	b = *a; // same as memcpy, right?
> 
> then by above discussion, the memcpy is not enough either. And Rust
> documents that it may treat copy_nonoverlapping() in exactly that way,
> which is why we want a memcpy where reading the values more than once is
> not a permitted optimization. In most discussions of that topic, that's
> called a per-byte atomic memcpy.
> 
> Does this optimization happen in the real world? I have no clue. I'd
> rather not find out.

OK, but none of this has anything to do with atomic or byte-wise.

The whole byte-wise thing turns out to be about not allowing
out-of-thin-air. Nothing should ever allow that.

Anyway, normal userspace copies don't suffer this because accessing
userspace has enough magical crap around it to inhibit this optimization
in any case.

If its a shared mapping/DMA, you'd typically end up with barriers
anyway, and those have a memory clobber on them which tell the compiler
reloads aren't good.

So I'm still not exactly sure why this is a problem all of a sudden?
