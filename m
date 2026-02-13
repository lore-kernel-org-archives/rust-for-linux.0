Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA4F3590CC;
	Fri, 13 Feb 2026 11:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770982129; cv=none; b=Qa00le6Y3ulJWrkeltjNxRYnynA8V4VsHC/yXqhiptsG5oi7jqCuZozTNgNv/7dZBa6KHe5sMjWzFb/ybHtHZYcxqhEoUO7nI/SGcpEBp6SABz9gjHzJqrU4Wo9O2roA2fhjyeC3yVEAlyGJsxoBewc/3ZTUpvLiGX8nrBE/p6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770982129; c=relaxed/simple;
	bh=ZtQdtAKgQN1GNrQZ2HziPbt/r9Awt8dpetebjVLo41s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+LWibV0EuBj2ka0Q7gG7U9rrOK83+blZipyqVr69OuUeKUzHqapkVF4JS/f+3h9PSnOufhz7gJfZ+IX8YoPzWhrXtp8mAuUYSHl5yC0uj1bRUboMt+J/YzFPwTQYi1j+44ZmXMgGDANoISwqTghGECoVIm0RJFAg90G1ZqduS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BOls9PRu; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BOls9PRu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KpBATvyUAudtytvAlcHemdrq+UOedXGW0Hm3b+ZGJoU=; b=BOls9PRuXV6GCVYN1d7wQHi8st
	iYyUBnkCXJ+QW3EOy509S0xSyRwUzgMSB0DGXAXqpIAx3mBMfdM4IkM0vY7H3AlFWqB4VCnPtSIG9
	3FWP68gO22M1EKM0SxQj55uexoM6A8Ys0ZpPRRbzvZaOgbpCCzpdSqHIk6nbm6YTjo7Agy0i0c+gT
	DqTZJSgW/8mlDx6LIyWFoH1px2YKSZgMqetgVECUckttOHFEv9WKkc4JxI6gi1DK7S5GI7piRYQCH
	HKiSWNKVG5NuuN51N/LudYCBmxlx/4HkNVo6vzOnhVVo9838iWwV99WE3iGSkEj+r0qM5zeTKkZ0j
	vj0Fc0Tg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqrLi-0000000CAyu-3eIB;
	Fri, 13 Feb 2026 11:28:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B45663007B5; Fri, 13 Feb 2026 12:28:37 +0100 (CET)
Date: Fri, 13 Feb 2026 12:28:37 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
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
Message-ID: <20260213112837.GT2995752@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>

On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
> When copying data from buffers that are mapped to user space, it is
> impossible to guarantee absence of concurrent memory operations on those
> buffers. Copying data to/from `Page` from/to these buffers would be
> undefined behavior if no special considerations are made.
> 
> Add methods on `Page` to read and write the contents using byte-wise atomic
> operations.
> 
> Also improve clarity by specifying additional requirements on
> `read_raw`/`write_raw` methods regarding concurrent operations on involved
> buffers.


> +    /// - Callers must ensure that this call does not race with a write to the source page that
> +    ///   overlaps with this read.

Yeah, but per the bit above, its user mapped, you *CANNOT* ensure this.

And same comment as for v2, none of this makes sense. Byte loads are not
magically atomic. And they don't actually fix anything.

NAK
