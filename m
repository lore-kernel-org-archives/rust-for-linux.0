Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9E514EC5D
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Jul 2024 23:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720480344; cv=none; b=WAc8qWw7K8CDrNNWsR6GImguAy3qA0TtPLntlbQSyEUi5OMn3Jj15qnq/2P9Pxbc6B8mxX+mRWJUN5HJ8pFspiugBOZZR5VIWWbCMb6Mnz2vpc6Fs/uiy06frUds9zsagbVKQv5Pi4//te/M0lmqGWzNndhi9mNorWYQSEiD+RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720480344; c=relaxed/simple;
	bh=a9saDvpAqAo8VG3BbozwG64x1XOD5x7T8Pq2iFhcfdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=c6gcnIsPMPCF3kjCqtXvFtvzCKyVXyzENyYOxsVdmvCkRRQvAPTup/RCNXdie9XYJb2p//Rd4aMdqbQWdxvq8G8Ddyw/oyUerHi915OwR8b8fY2E9TiRBFmzGQEPIdVXMohDOewGvm3Tq4CnZgXQAgCGeQ1H8OAk84PZ73PPuL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQed/wyT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQed/wyT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720480341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lArhzZwRpKVjFvo4XvIJzI/FxROqDQ9X+RaIfJC+qdo=;
	b=RQed/wyT1qq3yLa0ooIj0Kw67QvNTF1su5cu7uLG37dEZGnD7b1Wwl7ghTBYAiHhhk1c+9
	90ofufqABCU/d3bkPgL91nWMEoI5AqYrtXyOXNtcRZv5CoEK6bjW8gqQ1HFyNmlouRjVLJ
	oLQaDPJJNcBIu5dU1v+csF97ju2M87s=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-lxQF818_Px20SlKC2EX4zw-1; Mon, 08 Jul 2024 19:12:20 -0400
X-MC-Unique: lxQF818_Px20SlKC2EX4zw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52ea63885d3so3497611e87.0
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Jul 2024 16:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720480339; x=1721085139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lArhzZwRpKVjFvo4XvIJzI/FxROqDQ9X+RaIfJC+qdo=;
        b=sEM/XS4Jy9E8CUflmWx6lB3mw8omruLTou5eY+T5BqpARYb12fK4aVlCMCvv119Pod
         Wt0xa60UtdIK9iDs2SZBDlsMXuqZp9ucl6jhA++Ugp0+lNIwEa5R8kec+fJDR76xvTf3
         m07vyLZSGsGRhJt/+vpCGMwFA1EG7tO8yFqceyDmVw4RNToEYfH9v5Gj4cmPOxCOze3B
         gOqhSW2JqUAHm4aXZXdtxoXlnn6/6oA/EK16DXatRxC8aHgM78NIUybqhguF9iaDC91O
         0MDrTkw7J2HsIN92DEZqvk+hdssbOW9UCcT+nj6450Rwc60x/KwNL0Q9Tk5n5juQQcjQ
         /0rw==
X-Forwarded-Encrypted: i=1; AJvYcCXXiSfFRioOagBfXtDFirw5JjGPJRJBElc1XDr8MaHgvWqle0oId4+t4klD/9aAnpt/fx0dzOjlySfCqAkLI+ISFMI5g13weUGpJ9dnvg8=
X-Gm-Message-State: AOJu0Ywp0I9hEpqMdn5ssH7on61zu6GJn6ciCnDGYWOYnMIZ/owWoxwf
	DRXReZ73QujGC37fOm3iCz2oZuPMCcQ8Utjk5t3/gu+HHmry33QbdOBP6uWVR57tvaMHvnYZ3eX
	FjsEXxYfLVLSbwDlUAP9Kx5Tz+eEb/0PHYrsRDvJAquFI0yetXbR8kw9JfYcNeuZT
X-Received: by 2002:a05:6512:3993:b0:52c:dd59:6784 with SMTP id 2adb3069b0e04-52eb99a275bmr487029e87.40.1720480338880;
        Mon, 08 Jul 2024 16:12:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsEb4+AS0oZHz0oqvW1jPtB0nJNZSJvIOv4EEUgsrb+zkwWDFxoWlGLoA2ZjOmnkVIHsTrgw==
X-Received: by 2002:a05:6512:3993:b0:52c:dd59:6784 with SMTP id 2adb3069b0e04-52eb99a275bmr487009e87.40.1720480338376;
        Mon, 08 Jul 2024 16:12:18 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266b03feecsm48026705e9.10.2024.07.08.16.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 16:12:17 -0700 (PDT)
Date: Tue, 9 Jul 2024 01:12:15 +0200
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
Message-ID: <ZoxyT3sI7NLhvWOp@pollux>
References: <20240704170738.3621-1-dakr@redhat.com>
 <20240704170738.3621-2-dakr@redhat.com>
 <37d87244-fbef-414c-a726-60839b305040@proton.me>
 <ZoklB7aLyc90kWPT@pollux.localdomain>
 <2c322b00-20f8-4102-9f3b-edab0c0907b9@proton.me>
 <ZolerSMkVl0C4yfF@pollux.localdomain>
 <50cec075-04f4-4267-8d19-1b498a9f51bf@proton.me>
 <ZomRT_PQHVMVQ_RY@cassiopeiae>
 <5197ac37-ab92-4d99-a2e1-82d1cd9dc7e7@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <5197ac37-ab92-4d99-a2e1-82d1cd9dc7e7@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 08, 2024 at 08:12:34AM +0000, Benno Lossin wrote:
> On 06.07.24 20:47, Danilo Krummrich wrote:
> > On Sat, Jul 06, 2024 at 05:08:26PM +0000, Benno Lossin wrote:
> >> On 06.07.24 17:11, Danilo Krummrich wrote:
> >>> On Sat, Jul 06, 2024 at 01:17:19PM +0000, Benno Lossin wrote:
> >>>> On 06.07.24 13:05, Danilo Krummrich wrote:
> >>>>>>> +        layout: Layout,
> >>>>>>> +        flags: Flags,
> >>>>>>> +    ) -> Result<NonNull<[u8]>, AllocError>;
> >>>>>>> +
> >>>>>>> +    /// Free an existing memory allocation.
> >>>>>>> +    ///
> >>>>>>> +    /// # Safety
> >>>>>>> +    ///
> >>>>>>> +    /// `ptr` must point to an existing and valid memory allocation created by this `Allocator`
> >>>>>>> +    /// instance.
> >>>>>>> +    unsafe fn free(&self, ptr: *mut u8) {
> >>>>>>
> >>>>>> `ptr` should be `NonNull<u8>`.
> >>>>>
> >>>>> Creating a `NonNull` from a raw pointer is an extra operation for any user of
> >>>>> `free` and given that all `free` functions in the kernel accept a NULL pointer,
> >>>>> I think there is not much value in making this `NonNull`.
> >>>>
> >>>> I don't think that this argument holds for Rust though. For example,
> >>>> `KBox` contains a `Unique` that contains a `NonNull`, so freeing could
> >>>> just be done with `free(self.0.0)`.
> >>>
> >>> Agreed, we can indeed make it a `&NonNull<u8>`. However, I find this a bit
> >>
> >> I think you mean `NonNull<u8>`, right?
> > 
> > Yes, but I still don't see how that improves things, e.g. in `Drop` of
> > `KVec`:
> > 
> > `A::free(self.ptr.to_non_null().cast())`
> > 
> > vs.
> > 
> > `A::free(self.as_mut_ptr().cast())`
> > 
> > I'm not against this change, but I don't see how this makes things better.
> 
> Ah you still need to convert the `Unique<T>` to a pointer...
> But we could have a trait that allows that conversion. Additionally, we
> could get rid of the cast if we made the function generic.

I'm still not convinced of the `NonNull`, since technically it's not required,
but using a generic could indeed get us rid of all the `cast` calls - same for
`realloc` I guess.

> 
> >>> inconsistent with the signature of `realloc`.
> >>>
> >>> Should we go with separate `shrink` / `grow`, `free` could be implemented as
> >>> shrinking to zero and allowing a NULL pointer makes not much sense.
> >>>
> >>> But as mentioned, I'm not yet seeing the benefit of having `realloc` split into
> >>> `grow` and `shrink`.
> >>
> >> I would not split it into grow/shrink. I am not sure what exactly would
> >> be best here, but here is what I am trying to achieve:
> >> - people should strongly prefer alloc/free over realloc,
> > 
> > I agree; the functions for that are there: `Allocator::alloc` and
> > `Allocator::free`.
> > 
> > `KBox` uses both of them, `KVec` instead, for obvious reasons, uses
> > `Allocator::realloc` directly to grow from zero and `Allocator::free`.
> > 
> >> - calling realloc with zero size should not signify freeing the memory,
> >>   but rather resizing the allocation to 0. E.g. because a buffer now
> >>   decides to hold zero elements (in this case, the size should be a
> >>   variable that just happens to be zero).
> > 
> > If a buffer is forced to a new size of zero, isn't that effectively a free?
> 
> I would argue that they are different, since you get a pointer back that
> points to an allocation of zero size. A vector of size zero still keeps
> around a (dangling) pointer.
> You also can free a zero sized allocation (it's a no-op), but you must
> not free an allocation twice.

I don't think this is contradictive. For instance, if you call krealloc() with
a size of zero, it will free the existing allocation and return ZERO_SIZE_PTR,
which, effectively, can be seen as zero sized allocation. You can also pass
ZERO_SIZE_PTR to free(), but, of course, it doens't do anything, hence, as you
said, it's a no-op.

> 
> > At least that's exactly what the kernel does, if we ask krealloc() to resize to
> > zero it will free the memory and return ZERO_SIZE_PTR.
> 
> Not every allocator behaves like krealloc, in your patch, both vmalloc
> and kvmalloc are implemented with `if`s to check for the various special
> cases.

Well, for `Vmalloc` there simply is no vrealloc() on the C side...

For `KVmalloc` there is indeed a kvrealloc(), but it behaves different than
krealloc(), which seems inconsistant. Also note that kvrealloc() has a hand full
of users only.

My plan was to stick with the logic that krealloc() uses (because I think that's
what it should be) and, once we land this series, align kvrealloc() and get a
vrealloc() on the C side in place. We could do this in the scope of this series
as well, but I think this series is huge enough and separating this out makes
things much easier.

So, my goal would be that `Vmalloc` and `KVmalloc` look exactly like `Kmalloc`
looks right now in the end.

> 
> > So, what exactly would you want `realloc` to do when a size of zero is passed
> > in?
> 
> I don't want to change the behavior, I want to prevent people from using
> it unnecessarily.

I'm not overly worried about this. In fact, the C side proves that krealloc()
isn't really prone to be used where kmalloc() or free() can be used instead. And
sometimes it makes sense, `KVec` is a good example for that.

Besides that, who do we expect to use this API? In Rust most use cases should be
covered by `KBox` and `KVec` anyways. I don't expect much direct users of this
API.

> 
> >> - calling realloc with a null pointer should not be necessary, since
> >>   `alloc` exists.
> > 
> > But `alloc` calls `realloc` with a NULL pointer to allocate new memory.
> > 
> > Let's take `Kmalloc` as example, surely I could implement `alloc` by calling
> > into kmalloc() instead. But then we'd have to implement `alloc` for all
> > allocators, instead of having a generic `alloc`.
> 
> My intuition is telling me that I don't like that you can pass null to
> realloc. I can't put my finger on exactly why that is, maybe because
> there isn't actually any argument here or maybe there is. I'd like to
> hear other people's opinion.
> 
> > And I wonder what's the point given that `realloc` with a NULL pointer already
> > does this naturally? Besides that, it comes in handy when we want to allocate
> > memory for data structures that grow from zero, such as `KVec`.
> 
> You can just `alloc` with size zero and then call `realloc` with the
> pointer that you got. I don't see how this would be a problem.

In contrast to that, I don't see why calling two functions where just one would
be sufficient makes anything better.

> 
> >> This is to improve readability of code, or do you find
> >>
> >>     realloc(ptr, 0, Layout::new::<()>(), Flags(0))
> >>
> >> more readable than
> >>
> >>     free(ptr)
> > 
> > No, but that's not what users of allocators would do. They'd just call `free`,
> > as I do in `KBox` and `KVec`.
> 
> I agree that we have to free the memory when supplying a zero size, but
> I don't like adding additional features to `realloc`.

So, if you agree that we have to free the memory when supplying a zero size, why
would it be an additional feature then?

Besides that, as mentioned above, krealloc() already does that and kvrealloc()
should be fixed to be consistent with that.

> 
> Conceptually, I see an allocator like this:
> 
>     pub trait Allocator {
>         type Flags;

Agreed.

>         type Allocation;

What do we need this for?

I already thought about having some kind of `Allocation` type, also with a
drop() trait freeing the memory etc. But, I came to the conclusion that this is
likely to be overkill. We have `KBox` and `KVec` to take care of managing their
memory.

>         type Error;

I'm not worried about adding this, but maybe it makes sense to wait until we
actually implement somthing that needs this.

>     
>         fn alloc(layout: Layout, flags: Self::Flags) -> Result<Self::Allocation, Self::Error>;
>     
>         fn realloc(
>             alloc: Self::Allocation,
>             old: Layout,

We only really care about the size here. `Alignment` would be wasted. Are we
keen taking this downside for a bit more consistency?

>             new: Layout,
>             flags: Self::Flags,
>         ) -> Result<Self::Allocation, (Self::Allocation, Self::Error)>;
>     
>         fn free(alloc: Self::Allocation);
>     }
> 
> I.e. to reallocate something, you first have to have something
> allocated.

See the discussion above for this point.

> 
> For some reason if we use `Option<NonNull<u8>>` instead of `*mut u8`, I
> have a better feeling, but that might be worse for ergonomics...

As argument for `realloc`?

I get your point here. And for any other API I'd probably agree instantly.

Generally, `Allocator` is a bit special to me. It's not supposed to be used by a
lot of users, other than types like `KBox` or `KVec`, that are supposed to
manage the memory and the interface is pretty unsafe by definition. To me
keeping a rather "raw" access to krealloc() and friends seems to be desirable
here.

> 
> ---
> Cheers,
> Benno
> 

