Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF813203B6;
	Tue, 17 Feb 2026 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322493; cv=none; b=MoDjb/LWXMHpK8THE/FKtbpAq2wxeJUQzANwMsE8AgwlGzSDAX/nMEEQLDhPDJ2pZYgWzVGmypJD8P63Bq4yRkjrBoVFQgiXQFEW95lygaht4G5T7r9Ym1wVYyg3SslxXPuGqU+spg+GM8A6M8idmpnACjOh8113FLUYlKFFNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322493; c=relaxed/simple;
	bh=e0Rzxuhl3vbAQ5krsYjqAtKFILohkENabr+dzOfRXsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLEmWRV4IlzPgx+gB3ADwCpQPnoulQt49s3GSEvSy2tH+xBO+mNq2jS3Q+SAgvuXk3q9aYtUVwfXIB6cgrsWmQKObcMgqtSkyiT0AznOyleq+8hpfAv5CTocBeFmxwgz4WPypQE5P6G12EF6KQ44Zp36G7dUA8Xa+UC+0BJBh80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PSOuY7Cb; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PSOuY7Cb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aDO90/Nbb5ATEcXTmAm7N3mdJ4ah9wS2hMPSN/20Z9g=; b=PSOuY7CbUA5Uc9VIJZ9/xiAj78
	Z+3TeMtKfmeGKuwl29E89Lh4ClI3JkJBvEHzSFo87fc/O07kA30ufwucn+HpK1wUswiOlRRl+Ieyk
	QT95GJIiazRc7iL61eEiS87CiOVQjL0prJYaRoU4R+WZVf863eSw1HALJsgKSiM5kCLNchmNscpnC
	RhdKBtXVWZWjCb6KkDCIxefTetrU7L3pjuKOANynqK9HGZnxjgsoiQSMHUDIHtdRlbofKuuAFIFv8
	z8tSUC1PZOzWkCGwHQQrdMlg6OtygGHN988xQaW+5n06m01nFzDZxUCVnmMPErpxUOJs2yskXpyFt
	lmf+VXPw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHtR-00000004FxK-2Xwz;
	Tue, 17 Feb 2026 10:01:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1A271300CDE; Tue, 17 Feb 2026 11:01:21 +0100 (CET)
Date: Tue, 17 Feb 2026 11:01:21 +0100
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
Message-ID: <20260217100121.GW1395266@noisy.programming.kicks-ass.net>
References: <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh>
 <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh>
 <aY9HD7nH5A-DtgmR@tardis.local>
 <20260217091723.GU1395266@noisy.programming.kicks-ass.net>
 <20260217092343.GN1395416@noisy.programming.kicks-ass.net>
 <aZQ26gDRdeTpmLRI@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZQ26gDRdeTpmLRI@google.com>

On Tue, Feb 17, 2026 at 09:37:46AM +0000, Alice Ryhl wrote:
> On Tue, Feb 17, 2026 at 10:23:43AM +0100, Peter Zijlstra wrote:
> > On Tue, Feb 17, 2026 at 10:17:23AM +0100, Peter Zijlstra wrote:
> > > On Fri, Feb 13, 2026 at 07:45:19AM -0800, Boqun Feng wrote:
> > > 
> > > > > > Suppose the memory was 'AAAA' and while you're reading it, it is written
> > > > > > to be 'BBBB'. The resulting copy can be any combination of
> > > > > > '[AB][AB][AB][AB]'. Not one of them is better than the other.
> > > > > > 
> > > > 
> > > > The idea is if using Rust's own `core::ptr::copy()` or
> > > > `core::ptr::copy_nonoverlapping()`, you may get `CCCC`, because they are
> > > > not semantically guaranteed atomic per byte (i.e. tearing can happen at
> > > > bit level, because they are not designed for using in case of data
> > > > races, and there is no defined asm implementation of them, compilers can
> > > > do anything).
> > > 
> > > How the heck would they do out-of-thin-air? Any memcpy() implementation
> > > that can cause that is insane and broken.
> > > 
> > > Compilers are broken crap if they do this.
> > 
> > If rust core code can cause this, I stand by my earlier position that we
> > should not want that anywhere near the kernel. There is a reason our C
> > code is free standing.
> > 
> > So fix Rust to not be broken or take it out.
> 
> It can cause this to exactly the same extent as C can, and that's why
> you all came up with READ_ONCE() and similar.

So READ_ONCE() was mostly about inhibiting the compiler from re-loading
the value. We later added the no-tearing thing.

> Rust's copy_nonoverlapping() might not call memcpy() if it's a small
> fixed amount of bytes. E.g. a copy_nonoverlapping() of 8 bytes might
> just emit a movq instruction or any other way the compiler can come up
> with to copy 8 bytes. Like C compilers, that includes emitting more than
> one read, for the same reasons as why C might emit multiple reads for a
> single read when READ_ONCE() is not used.
> 
> After all, this logic all comes from LLVM which clang and rustc share.

Right, compiler is allowed to write code instead of emit memcpy() call.
But that code had better not be silly.

And since the C thing isn't silly, why would the Rust thing be silly?
