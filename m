Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6231F8901
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 18:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742063768; cv=none; b=QooNuX2ntgmene9SDNEIxOgtpS7IuGsIwFA/ZyczHeUBmL7Du51leYGgGkIwgKjOuxENmIUQfD6veTynG0AtzOHFMW+hfIyg5PvUqteihbIaBeVuJSxUn/LTgtPJ+kMrmx2QrBMeKea/BUHpl4hDykxAZw3bT2hkh8ZHtMRZNeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742063768; c=relaxed/simple;
	bh=TrBS4LSvYDPZza37W5YUBAZdjK1LxePff7WtFwfN0eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPQUHRygUEpR9pZjGxyx9r3pF0aRp9x/Kv7VxGB+gor9RSRn5zvdBRn3oVQVIOXrkTCXaCFPVkPSw6IBWg+4eqmskwYn0qJ+KrkUtfyAqfHduiNHwV6uEfk5buTjGGVVqU2+Fa7GRDGW/fJcjC2v1S34UzhyGYdXV65Ouhikh7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HD6Eli9a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HD6Eli9a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA11CC4CEE5;
	Sat, 15 Mar 2025 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742063768;
	bh=TrBS4LSvYDPZza37W5YUBAZdjK1LxePff7WtFwfN0eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HD6Eli9aOVHwiN7p2VjCkciejXrq/E5PU06uhifBZe1voLvkKif8umHHDuFzR7bVz
	 /GOdb6js6ELEqwtWSe8TrIy8Ld+O48RODNTPdqLRbIqD7KSiFi7SoYZI97AMFCV4Im
	 d57T91eb0orFrxv1DmNYFqJ/zQpC64j4LCuMeqbA50rJQI44EucfG0KBgDiEXtVoFW
	 7o/FbA+DsLmJwP53x58WKFj772xATPnVgZ9MWSrwZCXjDhEXUD703xtfMKnI+EZl2L
	 TdW1Fuo4aJ95bceBgXAFPzKl8oLFuYejH5FfQHxKTdOnyHH6UMAw8s8lDK2NtXKbT6
	 bLhjXuQKjHhyw==
Date: Sat, 15 Mar 2025 19:36:03 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9XIk3WpzruUfh6O@pollux>
References: <20250315154436.65065-1-dakr@kernel.org>
 <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8H0YRU90WU9.2FX2QF3W9FKV9@proton.me>

On Sat, Mar 15, 2025 at 05:44:29PM +0000, Benno Lossin wrote:
> On Sat Mar 15, 2025 at 4:43 PM CET, Danilo Krummrich wrote:
> > Extend the safety requirements of set_len() to consider the case when
> > the new length is smaller than the old length.
> >
> > Fixes: 2aac4cd7dae3 ("rust: alloc: implement kernel `Vec` type")
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  rust/kernel/alloc/kvec.rs | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index ae9d072741ce..8540d9e2b717 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -189,7 +189,9 @@ pub fn len(&self) -> usize {
> >      ///
> >      /// - `new_len` must be less than or equal to [`Self::capacity`].
> >      /// - If `new_len` is greater than `self.len`, all elements within the interval
> > -    ///   [`self.len`,`new_len`) must be initialized.
> > +    ///   [`self.len`,`new_len`) must be initialized,
> > +    /// - if `new_len` is smaller than `self.len`, all elements within the interval
> > +    ///   [`new_len`, `self.len`) must either be dropped or copied and taken ownership of.
> 
> What is meant by "copied"? I agree with Tamir, this can probably just be
> "taken ownership of".

If not dropped in place, the only way to take ownership of the object is to copy
the corresponding memory, i.e. the caller can not take ownership of the object
at its current memory location, since this memory is owned by the vector.

AFAIU, when we speak of ownership, we mean ownership over a value or object, but
not ownership over the underlying memory.

Hence, I think it's important to mention that it needs to be either dropped in
place or copied in order to take ownership.

Even if we agree that "drop in place" is considered as "take ownership", we need
to differentiate between the special case of taking ownership where its dropped
in place and the requirement to copy the value and then take ownership.

> 
> With that change:
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> 
> ---
> Cheers,
> Benno
> 
> >      #[inline]
> >      pub unsafe fn set_len(&mut self, new_len: usize) {
> >          debug_assert!(new_len <= self.capacity());
> >
> > base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
> 
> 
