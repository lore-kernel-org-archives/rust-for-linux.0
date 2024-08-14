Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D295F1BA89A;
	Wed, 14 Aug 2024 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723654757; cv=none; b=OQ66OXZtPJ1eCStRM6l2JU/Pa8ACdC9sYGrRnSW6WgFiZftOqPkzdY7fgMWC/OsO0IRjd8+DcpT3ZI283KcTCuMKK4iN5zh3YNnnot+wEAyifuRtTs513Y+kJkyv0i8hlWaYejv1D44HEpdLL+p/81BJymQSq96rSRv6hUnYI2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723654757; c=relaxed/simple;
	bh=HMTmDAOSpmRRolPtV/6I4D5FtnhihYkeC2k4jN/oSFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXwiQFVC/40DOIfZqkLk+jYqjHaj+K4O4k7Efr5N+GC48LQ58jKrRFLr699z3yMB6fJrHDRE0ZGnybhpIMW3FiOuh/HjuhbaEw+jzIP7oasV+PzmLZYRTw6849WLDfWkcDUeE+9+5LNV7R/wUxv+usz5eBhdsXGcECFNcu0/TEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=slcQPiUX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="slcQPiUX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E917BC116B1;
	Wed, 14 Aug 2024 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723654757;
	bh=HMTmDAOSpmRRolPtV/6I4D5FtnhihYkeC2k4jN/oSFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slcQPiUXa5GufO0GPlWSRRWDijaId2m4Y707MeVF3Ukc2jJEvX5xmcEqPBtPm05gN
	 rNxVyRHWoLIJYcIB85s4JMYMWOGExNouoS2Z/U1pT34MmwUbpK5LEa2FjvmNtPP2lb
	 7Nr/rh4FCjsnpSsslGftr7RW3brfFE5R9flNfIqThMtiL6px0UzblM//1osmiQnwMs
	 8iWK9h+EbEgBJbmZ0MC8O8m/+Em3it+6F/ELzvlsqPcPK4Gc4eabFal8zXWUeyiqQw
	 l+F3jg7EGuUICenia3lWleCJ46osXX5EIY3CbcxLFsRaKWp7DWfJCZ94m0pdnkaI3V
	 eW3VRXEm0icMA==
Date: Wed, 14 Aug 2024 18:59:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	a.hindborg@samsung.com, aliceryhl@google.com,
	akpm@linux-foundation.org, daniel.almeida@collabora.com,
	faith.ekstrand@collabora.com, boris.brezillon@collabora.com,
	lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com,
	cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 04/26] rust: alloc: implement `Allocator` for `Kmalloc`
Message-ID: <ZrziXqB5zExntYfW@cassiopeiae>
References: <20240812182355.11641-1-dakr@kernel.org>
 <20240812182355.11641-5-dakr@kernel.org>
 <b6b3d965-c1d4-4c18-8db4-2e7c19f10a15@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6b3d965-c1d4-4c18-8db4-2e7c19f10a15@proton.me>

On Wed, Aug 14, 2024 at 04:21:38PM +0000, Benno Lossin wrote:
> On 12.08.24 20:22, Danilo Krummrich wrote:
> > +    /// # Safety
> > +    ///
> > +    /// This method has the same safety requirements as `Allocator::realloc`.
> 
> Please make this a link.

Sure.

> 
> > +    unsafe fn call(
> > +        &self,
> > +        ptr: Option<NonNull<u8>>,
> > +        layout: Layout,
> > +        flags: Flags,
> > +    ) -> Result<NonNull<[u8]>, AllocError> {
> > +        let size = aligned_size(layout);
> > +        let ptr = match ptr {
> > +            Some(ptr) => ptr.as_ptr(),
> > +            None => ptr::null(),
> > +        };
> > +
> > +        // SAFETY: `ptr` is either NULL or valid by the safety requirements of this function.
> > +        let raw_ptr = unsafe {
> > +            // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
> > +            self.0(ptr.cast(), size, flags.0).cast()
> > +        };
> > +
> > +        let ptr = if size == 0 {
> 
> Why do you do this check *after* calling `self.0`?

Because I need `raw_ptr` in the else case below.

> 
> ---
> Cheers,
> Benno
> 
> > +            NonNull::dangling()
> > +        } else {
> > +            NonNull::new(raw_ptr).ok_or(AllocError)?
> > +        };
> > +
> > +        Ok(NonNull::slice_from_raw_parts(ptr, size))
> > +    }
> > +}
> 
