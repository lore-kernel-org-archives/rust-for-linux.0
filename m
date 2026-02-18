Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E6A1862;
	Wed, 18 Feb 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771409888; cv=none; b=V/ui+CvQ+92X3J9B4zXsjZsJMAJ2SvQbPuDv9eJnp089C8UGq9i/fCdgNjW3d+Dz234glOhnFhY68BAnbaytnQ69SPur8ztbqJ1idYYpWZoQ+YHoz9QHAXQ+EQsgTUYnrSOJlFb+neFNZaPNrQL2QXrz+51hFIMT0QiZvIV0wYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771409888; c=relaxed/simple;
	bh=7TCdmUnzR3v9fP528nu/eE1oUUflOTaxMA81ACF0TmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZTlvCrdEoangbqQHX5vJuYgP18hNO+jeMFOZ6m+zZ9BQj71JnBlv+s4NHJjx3XrP9PZO0o2M3eINRHUvslmo7I3q/dzJZ2ZM6mhm9s54PuVLfWyaaw6grSr8cDUvQ9TK85H33p+vuFOglxGmApr5OhLp6xQGT87deMFozsHybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MixqCoh1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MixqCoh1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JSbgq0EcfUZhNPyWfFrWFmo1kdV6esGJ7PBWXAnMYXA=; b=MixqCoh11jPxOeY34UG98Pbcrx
	vNPOeORRcdv6BMxE2gfHrZ4fA0Skbfe3G4en1ZfXgkfJnblAt2Q/xqhIrsj8Lrb7bxMpQLfX1qF9d
	F6eFPo5ZlufMeRK8+JhiFvD6E76dAGMgbtCteGghY2hsO2HETqdcAkIr5IQ/rlbEqTUqVEUE3ZNRm
	4O0xrOSgeNkt2g53lNGHX8DsaHIeQgl16bA6/nEUVe1WI9krN5RQlxxzpDaCUBCe9E+SARx7Mq8OE
	LFE5UjeK31gaSWhBJn8QyFhMuv5Ms2U4vbrFfTYtgREpgCDoJGXtu562xex8+ZbhwBnzypy43kEQo
	wFg8CabA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsed2-00000005s1W-3f1Z;
	Wed, 18 Feb 2026 10:17:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4FAF93004AB; Wed, 18 Feb 2026 11:09:15 +0100 (CET)
Date: Wed, 18 Feb 2026 11:09:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>,
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
Message-ID: <20260218100915.GB1395266@noisy.programming.kicks-ass.net>
References: <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <aZRWOIPThLfIZ1Ph@google.com>
 <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
 <aZRokyTqsd_RwdkK@google.com>
 <20260217154800.GY2995752@noisy.programming.kicks-ass.net>
 <cbbea9ecb994df975109d97a7756d73e@garyguo.net>
 <20260218083754.GB2995752@noisy.programming.kicks-ass.net>
 <aZWGq8EMxz4omw4L@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZWGq8EMxz4omw4L@google.com>

On Wed, Feb 18, 2026 at 09:31:13AM +0000, Alice Ryhl wrote:

> > Must we really go write things like:
> > 
> > 	struct foo val, *ptr;
> > 
> > 	ptr = kmap_local_page(page);
> > 	memcpy(ptr, val, sizeof(val));
> > 	kunmap_local(ptr);
> > 
> > 	ptr = RELOC_HIDE(&val, 0);
> > 
> > 	if (ptr->field) {
> > 		...
> > 	}
> > 
> > That seems 'unfortunate'. It basically means we must never use local
> > stack for copies or somesuch.
> 
> No I don't think RELOC_HIDE is what you want to be using here.
> 
> The way to stop the compiler from doing this is to ensure that, in
> LLVM's eyes, the memcpy is either a volatile memcpy, an atomic memcpy,
> or an opaque function call. According to Gary's reply to my email on V3,
> it sounds like an explicit call to memcpy like this apparently falls into
> opaque function call, so it should be okay.

Ah, so we should write:

 	struct foo val, *ptr;
 
 	ptr = kmap_local_page(page);
 	__memcpy(ptr, val, sizeof(val));
 	kunmap_local(ptr);
 
 	if (val.field) {
 		...
 	}

That forces things to be a function call since it elides the C memcpy
intrinsic for not having the right name.

But that also elides KASAN and such that want to hijack the various mem
functions for instrumentation purposes.
