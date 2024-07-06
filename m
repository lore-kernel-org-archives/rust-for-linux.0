Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A247D2837F
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jul 2024 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720263951; cv=none; b=VVWd/IGvQce46U6u8zoN2fWJx77fXE0QD1w3Ee60UR0/ZMzhm/n5b2PqXZ0wGYb9KOGRWyHogvpw2FPMeN3YiEgyuyM0CHL5dnWR9I5QBJJuce5p3TpnoK9aJgOvChaoulZX5MgOZpVQsywLmthjNj6ZWiZTw26/ViEvh9t87d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720263951; c=relaxed/simple;
	bh=CIVNIJuyVvHFql7fC1dXJSjgL0sMWVexrM7r5FOLJj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hsZRrk3wXXJrCDONo1iF2/nT1XozCj0+g+xwv2RdNjHJAgOnoRK9TB0vjQnN9qQALQUUFCJru9CVZ3b+9Mx7maF0JSlll3ToF0FqLnCdNzXBfFYwOFdnXslB5pahWqL3GhEleGw/aBkI/CfUoPRcahtq8knohtvDpIGAK+NEFc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NN8UXyND; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NN8UXyND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720263948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3vL262l3kI0LSuVBnB5u+EZwZt8j6laPvN4iOeYawQU=;
	b=NN8UXyNDoiXmAxd/DVyiyKwQdo2bqC3R7jV83mchA9e5u4BXYgdW4TUMQGhXkJQkxz2YmG
	Jmig4daXV61AloS7JOS/DaFaYzaPtN0jDxI/UnFtfnB3Irqg+gesgkimi0Gr/OZwZbxYHw
	AQi0+fjcZoEoNq3mtiM0TazaZGadPfk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-bFZVwn6xPiGN1DvrQcsTCQ-1; Sat, 06 Jul 2024 07:05:47 -0400
X-MC-Unique: bFZVwn6xPiGN1DvrQcsTCQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-425739141c2so17509665e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jul 2024 04:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720263946; x=1720868746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vL262l3kI0LSuVBnB5u+EZwZt8j6laPvN4iOeYawQU=;
        b=icGi+s+xb5T8mu4N5tugOaQah5erhvbXt8/A0adesKuQfarlgRC9xZwWlna0ra0y8q
         kyo075H6HtDsu9m2H1DSA0Y9gcTFLDLRY4Z1k/4kqllpdRHiQlwNkiCr8w3t/SLQysgi
         t3TeElppnBs7GX1GOjDOd+vxGHyuJKkewFskWabcv7EGLksp45V/34Mr6pSXpN1VZ9gQ
         yeZZKClMLBJ+2xziXMtkGHOaIHa0EoAcRfZ7KM8/SAa177T2zJburMdsYjQFI6QlPtzA
         kLfl4YHAbLTUvlmaZD55vQwTqec/W0gjy/7IGql03fih/edz60/F2QLCigdi4SPjH/Ak
         q8lA==
X-Forwarded-Encrypted: i=1; AJvYcCV3KQsHUck3cy4II51WIAgfUhXw1QF+upbJPBwGpFOmrJjreGOONqBfJJuHAGxZJkzBgZrAgd9VeuS7EEU1dSTuDHiMUxPKLaZElXHgKbY=
X-Gm-Message-State: AOJu0YxdsfdWyLtiGSy1gOaZClZVQXj6SwqssUiMDjN8nKD0x+YVaB1m
	6Xpctr+nBj6ufKnE3b4N4ahr220K1B1mGQy0moOBwGLZx09gF/0AmagWcpZrKusQ5JoEo4TLMSr
	t1K/xs+7g2ApriGdODtKmcRvaBm/bg6xN6Ofovl2IiP2NXSGbOjXbNCJqmMyS8ieP
X-Received: by 2002:a05:600c:4393:b0:426:5de3:2ae5 with SMTP id 5b1f17b1804b1-4265de32becmr15193655e9.10.1720263945851;
        Sat, 06 Jul 2024 04:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY4Lj5WUwUNVbGICYbcPxa1Fi6Uvtco2OqG6SgCJJoo5Gk7VbJV8koFqpHs65NnJhQJMzFmA==
X-Received: by 2002:a05:600c:4393:b0:426:5de3:2ae5 with SMTP id 5b1f17b1804b1-4265de32becmr15193465e9.10.1720263945409;
        Sat, 06 Jul 2024 04:05:45 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:701e:8fb8:a84f:6308])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679b1e5f31sm6393013f8f.33.2024.07.06.04.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 04:05:44 -0700 (PDT)
Date: Sat, 6 Jul 2024 13:05:43 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	a.hindborg@samsung.com, aliceryhl@google.com,
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com, lina@asahilina.net,
	mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com,
	cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 01/20] rust: alloc: add `Allocator` trait
Message-ID: <ZoklB7aLyc90kWPT@pollux.localdomain>
References: <20240704170738.3621-1-dakr@redhat.com>
 <20240704170738.3621-2-dakr@redhat.com>
 <37d87244-fbef-414c-a726-60839b305040@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <37d87244-fbef-414c-a726-60839b305040@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 06, 2024 at 10:33:49AM +0000, Benno Lossin wrote:
> On 04.07.24 19:06, Danilo Krummrich wrote:
> > Add a kernel specific `Allocator` trait, that in contrast to the one in
> > Rust's core library doesn't require unstable features and supports GFP
> > flags.
> > 
> > Subsequent patches add the following trait implementors: `Kmalloc`,
> > `Vmalloc` and `KVmalloc`.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/kernel/alloc.rs | 73 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> > 
> > diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> > index 531b5e471cb1..462e00982510 100644
> > --- a/rust/kernel/alloc.rs
> > +++ b/rust/kernel/alloc.rs
> > @@ -11,6 +11,7 @@
> >  /// Indicates an allocation error.
> >  #[derive(Copy, Clone, PartialEq, Eq, Debug)]
> >  pub struct AllocError;
> > +use core::{alloc::Layout, ptr, ptr::NonNull};
> > 
> >  /// Flags to be used when allocating memory.
> >  ///
> > @@ -71,3 +72,75 @@ pub mod flags {
> >      /// small allocations.
> >      pub const GFP_NOWAIT: Flags = Flags(bindings::GFP_NOWAIT);
> >  }
> > +
> > +/// The kernel's [`Allocator`] trait.
> > +///
> > +/// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffer described
> > +/// via [`Layout`].
> > +///
> > +/// [`Allocator`] is designed to be implemented on ZSTs; its safety requirements to not allow for
> > +/// keeping a state throughout an instance.
> 
> Why do the functions take `&self` if it is forbidden to have state? I
> would remove the receiver in that case.

Yes, that that makes sense.

> 
> > +///
> > +/// # Safety
> > +///
> > +/// Memory returned from an allocator must point to a valid memory buffer and remain valid until
> > +/// its explicitly freed.
> > +///
> > +/// Copying, cloning, or moving the allocator must not invalidate memory blocks returned from this
> > +/// allocator. A copied, cloned or even new allocator of the same type must behave like the same
> > +/// allocator, and any pointer to a memory buffer which is currently allocated may be passed to any
> > +/// other method of the allocator.
> 
> If you provide no receiver methods, then I think we can remove this
> requirement.

Indeed.

> 
> > +pub unsafe trait Allocator {
> > +    /// Allocate memory based on `layout` and `flags`.
> > +    ///
> > +    /// On success, returns a buffer represented as `NonNull<[u8]>` that satisfies the size an
> 
> typo "an" -> "and"
> 
> > +    /// alignment requirements of layout, but may exceed the requested size.
> 
> Also if it may exceed the size, then I wouldn't call that "satisfies the
> size [...] requirements".

Do you have a better proposal? To me "satisfies or exceeds" sounds reasonable.

> 
> > +    ///
> > +    /// This function is equivalent to `realloc` when called with a NULL pointer and an `old_size`
> > +    /// of `0`.
> 
> This is only true for the default implementation and could be
> overridden, since it is not a requirement of implementing this trait to
> keep it this way. I would remove this sentence.

I could add a bit more generic description and say that for the default impl
"This function is eq..."?

> 
> > +    fn alloc(&self, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError> {
> 
> Instead of using the `Flags` type from the alloc module, we should have
> an associated `Flags` type in this trait.

What does this give us?

> 
> Similarly, it might also be a good idea to let the implementer specify a
> custom error type.

Same here, why?

> 
> > +        // SAFETY: Passing a NULL pointer to `realloc` is valid by it's safety requirements and asks
> > +        // for a new memory allocation.
> > +        unsafe { self.realloc(ptr::null_mut(), 0, layout, flags) }
> > +    }
> > +
> > +    /// Re-allocate an existing memory allocation to satisfy the requested `layout`. If the
> > +    /// requested size is zero, `realloc` behaves equivalent to `free`.
> 
> This is not guaranteed by the implementation.

Not sure what exactly you mean? Is it about "satisfy" again?

> 
> > +    ///
> > +    /// If the requested size is larger than `old_size`, a successful call to `realloc` guarantees
> > +    /// that the new or grown buffer has at least `Layout::size` bytes, but may also be larger.
> > +    ///
> > +    /// If the requested size is smaller than `old_size`, `realloc` may or may not shrink the
> > +    /// buffer; this is implementation specific to the allocator.
> > +    ///
> > +    /// On allocation failure, the existing buffer, if any, remains valid.
> > +    ///
> > +    /// The buffer is represented as `NonNull<[u8]>`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// `ptr` must point to an existing and valid memory allocation created by this allocator
> > +    /// instance of a size of at least `old_size`.
> > +    ///
> > +    /// Additionally, `ptr` is allowed to be a NULL pointer; in this case a new memory allocation is
> > +    /// created.
> > +    unsafe fn realloc(
> > +        &self,
> > +        ptr: *mut u8,
> > +        old_size: usize,
> 
> Why not request the old layout like the std Allocator's grow/shrink
> functions do?

Because we only care about the size that needs to be preserved when growing the
buffer. The `alignment` field of `Layout` would be wasted.

> 
> > +        layout: Layout,
> > +        flags: Flags,
> > +    ) -> Result<NonNull<[u8]>, AllocError>;
> > +
> > +    /// Free an existing memory allocation.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// `ptr` must point to an existing and valid memory allocation created by this `Allocator`
> > +    /// instance.
> > +    unsafe fn free(&self, ptr: *mut u8) {
> 
> `ptr` should be `NonNull<u8>`.

Creating a `NonNull` from a raw pointer is an extra operation for any user of
`free` and given that all `free` functions in the kernel accept a NULL pointer,
I think there is not much value in making this `NonNull`.

> 
> > +        // SAFETY: `ptr` is guaranteed to be previously allocated with this `Allocator` or NULL.
> > +        // Calling `realloc` with a buffer size of zero, frees the buffer `ptr` points to.
> > +        let _ = unsafe { self.realloc(ptr, 0, Layout::new::<()>(), Flags(0)) };
> 
> Why does the implementer have to guarantee this?

Who else can guarantee this?

> 
> > +    }
> > +}
> > --
> > 2.45.2
> > 
> 
> More general questions:
> - are there functions in the kernel to efficiently allocate zeroed
>   memory? In that case, the Allocator trait should also have methods
>   that do that (with a iterating default impl).

We do this with GFP flags. In particular, you can pass GFP_ZERO to `alloc` and
`realloc` to get zeroed memory. Hence, I think having dedicated functions that
just do "flags | GFP_ZERO" would not add much value.

> - I am not sure putting everything into the single realloc function is a
>   good idea, I like the grow/shrink methods of the std allocator. Is
>   there a reason aside from concentrating the impl to go for only a
>   single realloc function?

Yes, `krealloc()` already provides exactly the described behaviour. See the
implementation of `Kmalloc`.

> 
> ---
> Cheers,
> Benno
> 

