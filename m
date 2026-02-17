Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E9C2C187;
	Tue, 17 Feb 2026 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771318557; cv=none; b=YL1u/1FFWY57BrtUoCeCPExcHRSt83+tMfZCs6oFpjzaxZZAHlrsg6zxZXOvP3qOzYmtHt81CdhhIdReGrFR5KCy9DFdrYPFi9dvFF9rUWm8p22ffhV3ar+3/apgzWNBWzXGbtZm/DiMan/EssHMPW1MDQoxYdbj9nUbpE2ZhV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771318557; c=relaxed/simple;
	bh=vYUCJ1Xupqk4b0eSr40F9E+7yzYjuT+czzs68jfKMMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMm/WpQTrO+QGy5crs+UNlnJJqFcEd7/nGFq4GOnIKNhK9cKcUfCM7UJp15tpUE1vso9kEHVjuG6VqkKnw4f0ESLbriQopCaGlNAnJbRV451g268IRoLZhC8l6+9Jjv1pkeAqfAuEy1yLINiUPxo3sqYFmr1FRL6Vazs7FZNv1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HKohuVAw; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HKohuVAw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s2+3Zb5XQH5ae/EQUG7mNscXyFKybqQMMxQyoHn58Ik=; b=HKohuVAwwQEKJz7VTHhgEQD02z
	yDbz69X6P+iqHiN0CJ66dtLQ3ddF3XjqDOBd900Humu8XQN5rlR1hcyTeDl+ybdaIUEcG9LPrulZG
	Nds6OtqTXqXV1rTdF2cxQiQXKeFHaUg2Bjtlz7X7c5jphT5F9sHkJAG4lWLEZXY1LyEl/NQKMt1Aw
	uqS1hwO/l/1v7Op1TAKyumf1SuQEXPT6CCNEl2f7PlZC9hl/vW6B1bQDUW+dqIfO/nAotr2DZjtR4
	5eShrDtkjku9LtugQCs7gp3u5fQIodW4geQKK/ZNa3OvfBmRFUIaiRdTlLOua9N5ysHZCJB9iYADE
	2nkGqA/g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsGru-0000000FcUe-3wth;
	Tue, 17 Feb 2026 08:55:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BC83C300CDE; Tue, 17 Feb 2026 09:55:41 +0100 (CET)
Date: Tue, 17 Feb 2026 09:55:41 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
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
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <20260217085541.GS1395266@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aY9i8rbvnxdOA9DV@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY9i8rbvnxdOA9DV@tardis.local>

On Fri, Feb 13, 2026 at 09:44:18AM -0800, Boqun Feng wrote:
> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
> [...]
> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > index 4aebeacb961a2..8ab20126a88cf 100644
> > --- a/rust/kernel/sync/atomic.rs
> > +++ b/rust/kernel/sync/atomic.rs
> > @@ -560,3 +560,35 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
> >          unsafe { from_repr(ret) }
> >      }
> >  }
> > +
> > +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
> > +///
> 
> Given Greg and Peter's feedback, I think it's better to call out why we
> need `atomic_per_byte_memcpy()` and why we use bindings::memcpy() to
> implement it. How about a paragraph as follow:
> 
> /// This is the concurrent-safe version of `core::ptr::copy()` (the
> /// counterpart of standard C's `memcpy()`). Because of the atomicity at
> /// byte level, when racing with another concurrent atomic access (or
> /// a normal read races with an atomic read) or an external access (from
> /// DMA or userspace), the behavior of this function is defined:
> /// copying memory at the (at least) byte granularity.
> ///
> /// Implementation note: it's currently implemented by kernel's
> /// `memcpy()`, because kernel's `memcpy()` is implemented in a way that
> /// byte-wise atomic memory load/store instructions are used.
> 
> And probably we make it a separate patch for this
> atomic_per_byte_memcpy().
> 
> Thoughts?

Its still not making sense; an no kernel memcpy() does not necessarily
use byte wise copy. And please stop talking about 'atomic' here. There
are no atomic ops used (and atomic ops will fundamentally not help).

Seriously, none of this makes *ANY* sense.

Yes we have racing copies. And yes that is 'tricky'. But there is no
magic fix. Nor does it matter.

You copy 'n' bytes (in any way you like, preferably the fastest, that's
all that really matters), and then you get to go validate that the
content makes sense, like always when you get something from userspace.
Must not trust userspace.

So even if there was no concurrency, and your copy is 'perfect' you
*STILL* must not trust it. So the presence of concurrency matters not.
It is just another way userspace can serve you bad values, nothing more,
nothing less.


