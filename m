Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2631C2FF
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771348245; cv=none; b=TWd6lPqhDwvL4WDcqrq/lG1zGUH5YUM5YBRHrY1UpQ9nFrb3gjSG3imWz+JdMpGJaGcC7eyhzkrOGvh3f0Oewle0Rqslv8ix7tq/7XmRrB5XAyJvsL9MMltzzI1DYXhihh1LfXWTc/UgjVgZih8spqGalPJtVpgeW1UBl4K8/p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771348245; c=relaxed/simple;
	bh=hn8f2VPe13u0Qw57SnqTcYuvXQRECKkPuiiq0cXvlY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwhEaqEAh2Dxta+IqsBlpE0rARSyF+c6ENySyKLycmJbe11Jg676RtVf7B/tDcB6amLoufj2YuKQ3JB/3nKYFeoPx5ok81r9fHU0OOJqRSIfIVfc3yJ9VJXo/vTbYDRBZkR5HYVHslBiaM8UqHBP22kSOiiaiCSDcf5KjrwS7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIsJ85L/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIsJ85L/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECF6C4CEF7;
	Tue, 17 Feb 2026 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771348245;
	bh=hn8f2VPe13u0Qw57SnqTcYuvXQRECKkPuiiq0cXvlY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIsJ85L/5KL75nrc2etlzYUb1bmmIvPowNmehrkM2ZdwrysO5LHhH2+tsaK8KWOFr
	 8wI2EilYnvyiLz1KDZPfgm3xuzkw9PUT99cu82WVUr02FlXCAuj058BTfghbk3s27U
	 zcFW6LTjDNfQRWIvOX/KQdaaF7bGaP7pGVhcbkj2Yw+7hnz9gSqgL142Nw9bFDhhaB
	 OcaToutV11e4dDFvhAoBpaMA96YiXPyX8wULm7nTkygj/yVbggRgvTgPtAVHP3rVTu
	 2qFRlO0vc9xN7skNaJXe05xDT7MORcFnDeb/Wrc7hCUOvubrFkeePPVb/xFpX522PA
	 DpHCwE/HHuDXA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id CAA78F40068;
	Tue, 17 Feb 2026 12:10:43 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 17 Feb 2026 12:10:43 -0500
X-ME-Sender: <xms:E6GUaQwE0UxHITFNrJWToppchBvFFbDP7muRCrba3E6H8Y8kS14PAA>
    <xme:E6GUaQNA9urkljEsxNaLKqBYjd6b1gXvKmVYgY7pnLqHK4BG5KjWCWDpKWghSUiFN
    z0MMGp9iUdum_0387sHoKzF_SNfy4KfsncfqZcJcpz50FehU-Ai9w>
X-ME-Received: <xmr:E6GUaYePAaiMKzJaY37ySeNqNnKskRYhFYGNSJQM7Xcf6XAe9bPcIhMwS10gjkTvdJxAT4eViTqj48AMLW84Gk0Tgg5eIVFJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvddtfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ekgffhhfeuheelhfekteeuffejveetjeefffettedtteegfefftdduteduudfgleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfihi
    lhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnh
    gvthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphht
    thhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlih
    gtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhorhgvnhiiohdrshht
    ohgrkhgvshesohhrrggtlhgvrdgtohhmpdhrtghpthhtoheplhhirghmrdhhohiflhgvth
    htsehorhgrtghlvgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:E6GUaU4_t3SW360-BXEJVynNndz6LjeLkttnD9l_K-Fjk2Rw9HP6vg>
    <xmx:E6GUaQK7jWHqI-ap2s60d3zcP7jIm92Na4HI4MGTZM-yHs_KXjgoDg>
    <xmx:E6GUaY4HXZ7qfCLaQTKaBXZcjwMwynAdQVg8sZJcqh4UhfdQUCnAeA>
    <xmx:E6GUafbq7GcDT4jklfpnUj6eCE-eIxk_QpVvJgi0CHC6_sl6eH0jtg>
    <xmx:E6GUafyl22vRbhyP1u4n47wktRj4eEtqZlHAddjF5OQlE5qYWGBc4qKR>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Feb 2026 12:10:42 -0500 (EST)
Date: Tue, 17 Feb 2026 09:10:42 -0800
From: Boqun Feng <boqun@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <aZShEW2b9-71r18I@tardis.local>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aY9i8rbvnxdOA9DV@tardis.local>
 <20260217085541.GS1395266@noisy.programming.kicks-ass.net>
 <102c86dd6fb1a907b7138a437dee00dc@garyguo.net>
 <aZRHJ22UtG1YeBMj@willie-the-truck>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZRHJ22UtG1YeBMj@willie-the-truck>

On Tue, Feb 17, 2026 at 10:47:03AM +0000, Will Deacon wrote:
> On Tue, Feb 17, 2026 at 09:42:37AM +0000, Gary Guo wrote:
> > On 2026-02-17 08:55, Peter Zijlstra wrote:
> > > On Fri, Feb 13, 2026 at 09:44:18AM -0800, Boqun Feng wrote:
> > >> On Fri, Feb 13, 2026 at 07:42:53AM +0100, Andreas Hindborg wrote:
> > >> [...]
> > >> > diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> > >> > index 4aebeacb961a2..8ab20126a88cf 100644
> > >> > --- a/rust/kernel/sync/atomic.rs
> > >> > +++ b/rust/kernel/sync/atomic.rs
> > >> > @@ -560,3 +560,35 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
> > >> >          unsafe { from_repr(ret) }
> > >> >      }
> > >> >  }
> > >> > +
> > >> > +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
> > >> > +///
> > >> 
> > >> Given Greg and Peter's feedback, I think it's better to call out why we
> > >> need `atomic_per_byte_memcpy()` and why we use bindings::memcpy() to
> > >> implement it. How about a paragraph as follow:
> > >> 
> > >> /// This is the concurrent-safe version of `core::ptr::copy()` (the
> > >> /// counterpart of standard C's `memcpy()`). Because of the atomicity at
> > >> /// byte level, when racing with another concurrent atomic access (or
> > >> /// a normal read races with an atomic read) or an external access (from
> > >> /// DMA or userspace), the behavior of this function is defined:
> > >> /// copying memory at the (at least) byte granularity.
> > >> ///
> > >> /// Implementation note: it's currently implemented by kernel's
> > >> /// `memcpy()`, because kernel's `memcpy()` is implemented in a way that
> > >> /// byte-wise atomic memory load/store instructions are used.
> > >> 
> > >> And probably we make it a separate patch for this
> > >> atomic_per_byte_memcpy().
> > >> 
> > >> Thoughts?
> > > 
> > > Its still not making sense; an no kernel memcpy() does not necessarily
> > > use byte wise copy. And please stop talking about 'atomic' here. There
> > > are no atomic ops used (and atomic ops will fundamentally not help).
> > 
> > Byte-wise atomicity means that the guaranteed atomicity is per-byte, not that
> > the copying is per byte. The copying size and order can be arbitrary.
> 
> Curious, but how would you implement a memcpy that _isn't_ "atomic" by
> that definition? Are you worried about accessing bytes multiple times,
> or losing dependency ordering, or something else?
> 

We are worried about two racing memcpy()s end up being data race and
that's undefined behavior. And "atomic" is the key word in C (and Rust)
to "lift" normal accesses to non-data-race, for example:

	thread 1		thread 2
	--------		--------
    	*a = 1;			r1 = *a;

is data race, and 

	thread 1		thread 2
	--------		--------
    	atomic_store(a,1);	r1 = atomic_load(a);

is not.

In memcpy() case, since we don't need the whole copy to be a single
atomic operation, so as long as the atomicity is guaranteed at byte
level (larger is fine because 2byte atomic is still byte atomic), it
should be sufficient as a concurrent-safe memcpy().

So either we want to live in a world where

"concurrent normal accesses with at least one being write are data race
therefore UBs, use the corresponding atomic API in this case and handle
the data carefully with concurrent accesses in mind".

or we want to live in a world where

"concurrent normal accesses with at least one being write are data race
therefore UBs, but there are 17 and more API which are technically UBs,
but they are not considered as UBs in kernel, use them"

To me, having a atomic_bytewise_memcpy() at least clear things out about
what is actually needed (at the very minimal) to have a concurrent-safe
memcpy(). Moving forward, since the concept has been already somehow
proposed to C/C++, it's likely to be standardized (we can push it from
the kernel end as well) so we don't need to implement a concurrent-safe
memcpy() for all architectures on our own.

Hope this makes some sense ;-)

Regards,
Boqun

> This all feels like playing tricks to placate the type system for
> something that isn't actually a problem in practice. But I think I'm
> probably at least as confused as Peter :)
> 

> Will
