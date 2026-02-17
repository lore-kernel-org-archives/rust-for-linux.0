Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C90328B7A;
	Tue, 17 Feb 2026 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325230; cv=none; b=lM60TCeunXorI9isSf3zfp5mnK0yKCP6T2NxejzLH2ZOnyS9/8mgxEGTh5Nw+1TW7qdwGPBRKzTCEKsvYZE3oLg0N/1P8+t1KmOvTv4sUh7MqLctQ7TDrUq1OT1BKsIF/407xyEyKZkNu8FtdYcD3bYuZS3uI9vt3eey0EBfNWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325230; c=relaxed/simple;
	bh=jPZESxhIMXs/RxY/w6cYQfCTnb8bodLYmLkbO3et7W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmOenjLNKu9JyVx2SiloPDrf5q9oITg2H/ym5Y2wUFvYUHjv+wCxIweIOddsO9OIg7J2TwKYrlNBGb9GBh0vSBkIdulxesnEluyAQyInYOwAyIUuN8x/8o+u6pzhCkFeLpWJySaLC8LCJFMoKoE6EHhii81J3WgrFUX6bFe0Yt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dimWAFdB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dimWAFdB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5625FC19424;
	Tue, 17 Feb 2026 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771325229;
	bh=jPZESxhIMXs/RxY/w6cYQfCTnb8bodLYmLkbO3et7W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dimWAFdBKNvwkZuk4l6uQCDToprbLgD1Ycq78ddUZJl80GGBJoBzVrUjCo6ukvHRk
	 aij42gIV0NWIMSdKs1Qws2vaOLIUEaecJ9IgY9EPXU1FLP/lgbLJQ8fgTd9KGaoKnm
	 wcnKwOssT3xhkmlBen4u7mZOzMuiB+rQ8aWqp6wnsUDLMcnQyMUfiJH2LKP8+tuDTB
	 KjKd+5PqJcC7E+9kDsWCcYXAmdlU9ylwUDr0STTwKC15+OKJOZp9scfvPyZTKnJaOM
	 OH07t0mVlOa8ESEVQuJYboD8cCIZrJbKh78MiYc/8h8hgONVMk0dZsrQyJWaPQ0m1e
	 vz9MT0zILOjaw==
Date: Tue, 17 Feb 2026 10:47:03 +0000
From: Will Deacon <will@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
Message-ID: <aZRHJ22UtG1YeBMj@willie-the-truck>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aY9i8rbvnxdOA9DV@tardis.local>
 <20260217085541.GS1395266@noisy.programming.kicks-ass.net>
 <102c86dd6fb1a907b7138a437dee00dc@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <102c86dd6fb1a907b7138a437dee00dc@garyguo.net>

On Tue, Feb 17, 2026 at 09:42:37AM +0000, Gary Guo wrote:
> On 2026-02-17 08:55, Peter Zijlstra wrote:
> > On Fri, Feb 13, 2026 at 09:44:18AM -0800, Boqun Feng wrote:
> >> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
> >> [...]
> >> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> >> > index 4aebeacb961a2..8ab20126a88cf 100644
> >> > --- a/rust/kernel/sync/atomic.rs
> >> > +++ b/rust/kernel/sync/atomic.rs
> >> > @@ -560,3 +560,35 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
> >> >          unsafe { from_repr(ret) }
> >> >      }
> >> >  }
> >> > +
> >> > +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
> >> > +///
> >> 
> >> Given Greg and Peter's feedback, I think it's better to call out why we
> >> need `atomic_per_byte_memcpy()` and why we use bindings::memcpy() to
> >> implement it. How about a paragraph as follow:
> >> 
> >> /// This is the concurrent-safe version of `core::ptr::copy()` (the
> >> /// counterpart of standard C's `memcpy()`). Because of the atomicity at
> >> /// byte level, when racing with another concurrent atomic access (or
> >> /// a normal read races with an atomic read) or an external access (from
> >> /// DMA or userspace), the behavior of this function is defined:
> >> /// copying memory at the (at least) byte granularity.
> >> ///
> >> /// Implementation note: it's currently implemented by kernel's
> >> /// `memcpy()`, because kernel's `memcpy()` is implemented in a way that
> >> /// byte-wise atomic memory load/store instructions are used.
> >> 
> >> And probably we make it a separate patch for this
> >> atomic_per_byte_memcpy().
> >> 
> >> Thoughts?
> > 
> > Its still not making sense; an no kernel memcpy() does not necessarily
> > use byte wise copy. And please stop talking about 'atomic' here. There
> > are no atomic ops used (and atomic ops will fundamentally not help).
> 
> Byte-wise atomicity means that the guaranteed atomicity is per-byte, not that
> the copying is per byte. The copying size and order can be arbitrary.

Curious, but how would you implement a memcpy that _isn't_ "atomic" by
that definition? Are you worried about accessing bytes multiple times,
or losing dependency ordering, or something else?

This all feels like playing tricks to placate the type system for
something that isn't actually a problem in practice. But I think I'm
probably at least as confused as Peter :)

Will
