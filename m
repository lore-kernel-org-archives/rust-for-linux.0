Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43227285050;
	Tue, 17 Feb 2026 12:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771330174; cv=none; b=AXahHcv+yo1bQQKkCYzPwRgBj3cIVlX72INw3KyKUNfTggtch8myRJ5gob0H8mHR9J7cT/kS72AstCizIYl/B3GXp565UUqVTwWbWrYMeJIilMVHc0uAjovA5M/K0pBmaET7ob0c/VfgzVjcJ+yGN6q0iVJFP7b3f2ESA32ukCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771330174; c=relaxed/simple;
	bh=8OseRONQIWOGXmisCN5ATEqo5D0Q251iaNY7UTaI7ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMHvAccmyFqCoKs19Lp1hMsPJJutKS/3e6TMtlVpwjzsfVWQYiiXh8onL3iyHuuxr3vPnKOPqgp6ayiVP0jLMakqVX3nM5OULycnsnPu0r798RQ4fGBXrse6zy8I+kRH5BhIHNPHcA602ztgrWlwT52uW3IqTlXEfA0Y5VLB+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MPK6KMf3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MPK6KMf3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jvEel49cPhINkQJB/RYDPEN8+H/iihzi1tok5yGSLhs=; b=MPK6KMf36rUidU04wIkIULJNkg
	wqfIh9NiF7oktdP1GXOI/kSLqJYeeTM8tAdPyi71S6scD5YbFxDGnqgRgsG8FCrKCC8poe38JdCv2
	wMGitaH2wkK4d27o7e6W1eQExGw86oRXWFavKBmnDwM95FGy/nHOw+C2hTJlmjSLUdammh7BoPVFm
	6PK87giPV/6yXnfLE9uLoKD8QLJCPy7wpHp0Ff8qpBG9I9/+5VQP3rnTD5a2+jKsqSTnXR4YWLONE
	tjLSEQ9xEohl721UoPz6qpFS5wh5lmnUr81+KfMv3thlMGdIloPTd3g6n/QyuDU0cbLA3aucMRTA7
	rLSvBBSw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsJtJ-00000004OTv-2d0U;
	Tue, 17 Feb 2026 12:09:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 77B5A300CDE; Tue, 17 Feb 2026 13:09:20 +0100 (CET)
Date: Tue, 17 Feb 2026 13:09:20 +0100
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
Message-ID: <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
References: <2026021326-stark-coastline-c5bc@gregkh>
 <aY9PBfx3RRV7rXZ5@tardis.local>
 <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <aZRWOIPThLfIZ1Ph@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZRWOIPThLfIZ1Ph@google.com>

On Tue, Feb 17, 2026 at 11:51:20AM +0000, Alice Ryhl wrote:

> In my experience with dealing with `struct page` that is mapped into a
> vma, you need memcpy because the struct might be split across two
> different pages in the vma. The pages are adjacent in userspace's
> address space, but not necessarily adjacent from the kernel's POV.
> 
> So you might end up with something that looks like this:
> 
> struct foo val;
> void *ptr1 = kmap_local_page(p1);
> void *ptr2 = kmap_local_page(p2);
> memcpy(ptr1 + offset, val, PAGE_SIZE - offset);
> memcpy(ptr2, val + offset, sizeof(struct foo) - (PAGE_SIZE - offset));
> kunmap_local(ptr2);
> kunmap_local(ptr1);

  barrier();

> if (is_valid(&val)) {
>     // use val
> }
> 
> This exact thing happens in Binder. It has to be a memcpy.

Sure, but then stick that one barrier() in and you're good.


> I don't know how Andreas is using this, but the usage pattern I'm
> familiar with for `struct page` from my work on Binder is this one:
> 
> 1. memcpy into the page
> 2. return from ioctl
> 3. userspace reads from vma
> 
> or
> 
> 1. userspace writes to vma
> 2. call ioctl
> 3. kernel reads from page
> 
> which needs no barriers whatsoever. There is nothing to prevent this
> kind of optimization in this kind of code, so an evil userspace could
> trigger TOCTOU bugs in the kernel that are not present in the source
> code if the code was optimized like I described.

Then stick in barrier().

