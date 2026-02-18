Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF85F2FE57B;
	Wed, 18 Feb 2026 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403892; cv=none; b=cfXaOS4bzB54gF6twMvIZvdPFZ4WzB1ihaeKYt9cezdZAx0YimcATdkwfduFJGAW6+WC+2hO+4ELsnD7inlUVBR8hEEsonYcTvcDwITiEsG28nkU1Y0RKjo0kjjyy02m5Jo1v/ly45Itd5gO9umh3mRUVBvalxVYqR0HedoVIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403892; c=relaxed/simple;
	bh=QvgDvJbDfK1mXFNZSUHpWwAH5cKAzQIRTHu6hxZrvng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebcJjGTB6QYoODLG3vZEPA2x6Adq2uJ83swKVAQRgI72iFPCmZy1Tkv3jUmsVXqL3/HaNccHoSgs580tOvU4+afHMhcQrZ3V7CNhROS5uw5e4k4agPdel0w/FQEoMjP0lGf3WfImutW+STnfaPOzaA4V/YmQa2G1LyWNVKHhHJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=F14g/Dgp; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="F14g/Dgp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z8CmZLDj2c4oTROwg8zkd+DRY9MWE4RsnIDSCGPUZmA=; b=F14g/DgpWhhHTUrMIRAi0AfGfR
	CDePZyaBLuRkxxTUhgJyI2AXPJzQG1Iart7sHojddMLbunhcV3ftkFoLifgASVVPmQZ5CSYS816Ev
	c64sjvPL1wA9mr1kvDVDtrd0z6ZRm4Nougbih/4Q8RbyMyB2jOaSZ8fUIvAhXUUlrKwQ6wq/XgOG0
	9pu/LpAnZ4Dl2Kh8s+gRl4grIOXtkfHaF7qktSP3jPNwiwUIIrOBCTVJNzCRXj9fONsCcLCSWDMUV
	iWxeWfM7OoCS1/Q0A3wdvSgsCa5GxEBAo9RyWSWxdtA1GuCZUQs/nD+HsElCBtaHSZcyjwD3FfWvc
	fl1g+HzA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsd4G-00000005kvL-1s4w;
	Wed, 18 Feb 2026 08:37:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E2A12300B40; Wed, 18 Feb 2026 09:37:54 +0100 (CET)
Date: Wed, 18 Feb 2026 09:37:54 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260218083754.GB2995752@noisy.programming.kicks-ass.net>
References: <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <aZRWOIPThLfIZ1Ph@google.com>
 <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
 <aZRokyTqsd_RwdkK@google.com>
 <20260217154800.GY2995752@noisy.programming.kicks-ass.net>
 <cbbea9ecb994df975109d97a7756d73e@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbbea9ecb994df975109d97a7756d73e@garyguo.net>

On Tue, Feb 17, 2026 at 11:39:18PM +0000, Gary Guo wrote:

> >> Are we really good? Consider this code:
> >> 
> >> 	bool is_valid(struct foo *val)
> >> 	{
> >> 		// for the sake of example
> >> 		return val->my_field != 0;
> >> 	}
> >> 
> >> 	struct foo val;
> >> 
> >> 	void *ptr = kmap_local_page(p1);
> >> 	memcpy(ptr, val, sizeof(struct foo));
> >> 	kunmap_local(p);
> >> 	barrier();
> >> 	if (is_valid(&val)) {
> >> 	    // use val
> >> 	}
> >> 
> >> optimize it into this first:
> >> 
> >> 	struct foo val;
> >> 	int my_field_copy;
> >> 
> >> 	void *ptr = kmap_local_page(p1);
> >> 	memcpy(ptr, val, sizeof(struct foo));
> >> 	my_field_copy = val->my_field;
> >> 	kunmap_local(p);
> >> 	barrier();
> >> 	if (my_field_copy != 0) {
> >> 	    // use val
> >> 	}
> >> 
> >> then optimize it into:
> >> 
> >> 	struct foo val;
> >> 	int my_field_copy;
> >> 
> >> 	void *ptr = kmap_local_page(p1);
> >> 	memcpy(ptr, val, sizeof(struct foo));
> >> 	my_field_copy = ((struct foo *) ptr)->my_field;
> >> 	kunmap_local(p);
> >> 	barrier();
> >> 	if (my_field_copy != 0) {
> >> 	    // use val
> >> 	}
> > 
> > I don;t think this is allowed. You're lifting the load over the
> > barrier(), that is invalid.
> 
> This is allowed. Compilers perform escape analysis and find out that
> "val" does not escape the function and therefore nothing can change "val".
> 
> A simple example to demonstrate this effect is that
> 
>     int x = 0;
>     x = 1;
>     barrier();
>     do_something(x);
> 
> is happily optimized into
> 
>     barrier();
>     do_something(1);
> 
> by both GCC and Clang. The fact that the local variable here is a struct and
> memcpy is used to assign the value here does not make a fundamental difference.
> 
> barrier() does nothing to local variables if pointers to them do not escape the
> local function.

So how do we stop the compiler from doing this? Because I'm thinking
there's quite a bit of code that would be broken if this were done.

Must we really go write things like:

	struct foo val, *ptr;

	ptr = kmap_local_page(page);
	memcpy(ptr, val, sizeof(val));
	kunmap_local(ptr);

	ptr = RELOC_HIDE(&val, 0);

	if (ptr->field) {
		...
	}

That seems 'unfortunate'. It basically means we must never use local
stack for copies or somesuch.

