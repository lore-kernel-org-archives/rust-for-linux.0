Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C1C137C37
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jul 2024 18:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720291674; cv=none; b=kJ50QwH791sKQ0teaOjd5NrMc48nfTuoaUNHnorlp0vvTOFLubR5X3ovGJThLHv6ztvhdIDuzQ+9aqUPao+d1IOIWUXSccT9vIojmLMsQ8bbJToXSsrvqg9LSJzC5xFrP5z7A6nYYbiZlE8a/rsO2eH759Spttqb1nq2oV/bp/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720291674; c=relaxed/simple;
	bh=310qDVxoDuXM+xuRPsT/0NCUSSu/m1tUnhywNw5PLlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DuDzWydOr1eTpxFXF426JjQwPqmaHvQPE0Xfg6UX7ql2iRug3ppSvYc/kQ2JXLqYP643h3AE1CpJfEen7aFP5p/33ljWv9Zalrx31czt/DB9W1wqJ9yq+WCVTdvfOrWfIKBIV9FEHREK35CB612L453F7uwyU4ba4LscQYMa06Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ijJUMnH4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ijJUMnH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720291671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GrIoXRic02krCiIv/67dE4M1mX1QtSvtZndf1Uz8/HY=;
	b=ijJUMnH4lgqzj6Mno8CcEoXE9aS4EbawpADQ370760uTttX1qwDZfXDyW6GYeK9HXZuEss
	4bkdS62Iwd6IpV1HpQpFVyPNrBoHLUMzapJaWVUbHRiVA0s93g6VZmvBe7qTTMkoSZaq3C
	BkeCWaT6C0np6WXWxBCgYpLd2PP2eJc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-5ao5LYlGOreEUf0vtR2b2w-1; Sat, 06 Jul 2024 14:47:48 -0400
X-MC-Unique: 5ao5LYlGOreEUf0vtR2b2w-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4258675a6easo20313045e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jul 2024 11:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720291667; x=1720896467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrIoXRic02krCiIv/67dE4M1mX1QtSvtZndf1Uz8/HY=;
        b=BwVPA3a7Gkr/5ri6t9PW6JmM6/otaLqTQ9HUxFjHirxiEDlWeWenQ5L/0xyF7ta6tj
         9S+mgQBPTb1SFhu6zMM1RQDSk7VFTKuJx/aFmxcSdQJyRpjngemEvaMoeM46/bdoLdkn
         N1q2CXcK1FEmo0hk/BhX/qq6wxv+vDdyvqseWcN/t3ozAgCfq3Hs4wpdHQgQuZejeQKj
         P2cJkOfkhIYpuVYRKMZQ8t2rP5H7LBqiXV5k7KYL49fIvoD0frWE3HCvmHfMhv8RJD3f
         PPIr/SKZu/0eVjiUtlh4H+jsJsm0C+Q2KzFU7vAFlV2X5ldJ9eXrQHnCU3NuWAEsH3+d
         7ddw==
X-Forwarded-Encrypted: i=1; AJvYcCVC9qFwz9nr3r0kXKsxXgRud0C55Xi+7kJqQQaMFrXGz1HJ6flELnWYcFL5qO6NvwvSCqPxSfJBIFy7IwIufD1jzbqZ7vi/tr4os5eobRY=
X-Gm-Message-State: AOJu0YyNW1LR5z+ihjruGJv89rzbdqfHFXGL5uVEUl6yTXfG+RVmTCUj
	FeWImhNOmxBvjLGk5TVZcX2D2sdZQygVvhkUnP8lmF6H8yxGG5lLTO7RNWNYwlgX4fjIQEn2HYO
	k3k61GzOVmUGECRtwbdnUm5Isw15dPZnXELDwjfxqMbOuohq1wxBWRj0WyN2ulaRk
X-Received: by 2002:a05:600c:2d13:b0:426:5b22:4d61 with SMTP id 5b1f17b1804b1-4265b224e9emr26277725e9.22.1720291667168;
        Sat, 06 Jul 2024 11:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFza7VcrlH7Z2Z5eLtghMIHVno3Eug0t1jfg8adrE4CqGT6JpgeXevovYlkAR8VWF/NFtkT2w==
X-Received: by 2002:a05:600c:2d13:b0:426:5b22:4d61 with SMTP id 5b1f17b1804b1-4265b224e9emr26277585e9.22.1720291666679;
        Sat, 06 Jul 2024 11:47:46 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a18c2810sm6209953f8f.18.2024.07.06.11.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 11:47:46 -0700 (PDT)
Date: Sat, 6 Jul 2024 20:47:43 +0200
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
Message-ID: <ZomRT_PQHVMVQ_RY@cassiopeiae>
References: <20240704170738.3621-1-dakr@redhat.com>
 <20240704170738.3621-2-dakr@redhat.com>
 <37d87244-fbef-414c-a726-60839b305040@proton.me>
 <ZoklB7aLyc90kWPT@pollux.localdomain>
 <2c322b00-20f8-4102-9f3b-edab0c0907b9@proton.me>
 <ZolerSMkVl0C4yfF@pollux.localdomain>
 <50cec075-04f4-4267-8d19-1b498a9f51bf@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <50cec075-04f4-4267-8d19-1b498a9f51bf@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 06, 2024 at 05:08:26PM +0000, Benno Lossin wrote:
> On 06.07.24 17:11, Danilo Krummrich wrote:
> > On Sat, Jul 06, 2024 at 01:17:19PM +0000, Benno Lossin wrote:
> >> On 06.07.24 13:05, Danilo Krummrich wrote:
> >>> On Sat, Jul 06, 2024 at 10:33:49AM +0000, Benno Lossin wrote:
> >>>> Similarly, it might also be a good idea to let the implementer specify a
> >>>> custom error type.
> >>>
> >>> Same here, why?
> >>
> >> In this case the argument is weaker, but it could allow us to implement
> >> an allocator with `Error = Infallible`, to statically guarantee
> >> allocation (e.g. when using GFP_ATOMIC). But at the moment there is no
> >> user.
> > 
> > GFP_ATOMIC can fail, I guess you mean __GFP_NOFAIL.
> > 
> > Not really sure how this would work other than with separate `alloc_nofail` and
> > `realloc_nofail` functions?
> 
> You could have an Allocator that always enables __GFP_NOFAIL, so the
> error type could be Infallible. But this doesn't seem that useful at the
> moment, so keep the AllocError as is.
> 
> >>>>> +        // SAFETY: Passing a NULL pointer to `realloc` is valid by it's safety requirements and asks
> >>>>> +        // for a new memory allocation.
> >>>>> +        unsafe { self.realloc(ptr::null_mut(), 0, layout, flags) }
> >>>>> +    }
> >>>>> +
> >>>>> +    /// Re-allocate an existing memory allocation to satisfy the requested `layout`. If the
> >>>>> +    /// requested size is zero, `realloc` behaves equivalent to `free`.
> >>>>
> >>>> This is not guaranteed by the implementation.
> >>>
> >>> Not sure what exactly you mean? Is it about "satisfy" again?
> >>
> >> If the requested size is zero, the implementation could also leak the
> >> memory, nothing prevents me from implementing such an Allocator.
> > 
> > Well, hopefully the documentation stating that `realloc` must be implemented
> > this exact way prevents you from doing otherwise. :-)
> > 
> > Please let me know if I need to document this in a different way if it's not
> > sufficient as it is.
> 
> It should be part of the safety requirements of the Allocator trait.

Makes sense, gonna add it.

> 
> >>>>> +    ///
> >>>>> +    /// If the requested size is larger than `old_size`, a successful call to `realloc` guarantees
> >>>>> +    /// that the new or grown buffer has at least `Layout::size` bytes, but may also be larger.
> >>>>> +    ///
> >>>>> +    /// If the requested size is smaller than `old_size`, `realloc` may or may not shrink the
> >>>>> +    /// buffer; this is implementation specific to the allocator.
> >>>>> +    ///
> >>>>> +    /// On allocation failure, the existing buffer, if any, remains valid.
> >>>>> +    ///
> >>>>> +    /// The buffer is represented as `NonNull<[u8]>`.
> >>>>> +    ///
> >>>>> +    /// # Safety
> >>>>> +    ///
> >>>>> +    /// `ptr` must point to an existing and valid memory allocation created by this allocator
> >>>>> +    /// instance of a size of at least `old_size`.
> >>>>> +    ///
> >>>>> +    /// Additionally, `ptr` is allowed to be a NULL pointer; in this case a new memory allocation is
> >>>>> +    /// created.
> >>>>> +    unsafe fn realloc(
> >>>>> +        &self,
> >>>>> +        ptr: *mut u8,
> >>>>> +        old_size: usize,
> >>>>
> >>>> Why not request the old layout like the std Allocator's grow/shrink
> >>>> functions do?
> >>>
> >>> Because we only care about the size that needs to be preserved when growing the
> >>> buffer. The `alignment` field of `Layout` would be wasted.
> >>
> >> In the std Allocator they specified an old layout. This is probably
> >> because of the following: if `Layout` is ever extended to hold another
> >> property that would need to be updated, the signatures are already
> >> correct.
> >> In our case we could change it tree-wide, so I guess we could fix that
> >> issue when it comes up.
> > 
> > Yes, I think so too.
> > 
> >>
> >>>>> +        layout: Layout,
> >>>>> +        flags: Flags,
> >>>>> +    ) -> Result<NonNull<[u8]>, AllocError>;
> >>>>> +
> >>>>> +    /// Free an existing memory allocation.
> >>>>> +    ///
> >>>>> +    /// # Safety
> >>>>> +    ///
> >>>>> +    /// `ptr` must point to an existing and valid memory allocation created by this `Allocator`
> >>>>> +    /// instance.
> >>>>> +    unsafe fn free(&self, ptr: *mut u8) {
> >>>>
> >>>> `ptr` should be `NonNull<u8>`.
> >>>
> >>> Creating a `NonNull` from a raw pointer is an extra operation for any user of
> >>> `free` and given that all `free` functions in the kernel accept a NULL pointer,
> >>> I think there is not much value in making this `NonNull`.
> >>
> >> I don't think that this argument holds for Rust though. For example,
> >> `KBox` contains a `Unique` that contains a `NonNull`, so freeing could
> >> just be done with `free(self.0.0)`.
> > 
> > Agreed, we can indeed make it a `&NonNull<u8>`. However, I find this a bit
> 
> I think you mean `NonNull<u8>`, right?

Yes, but I still don't see how that improves things, e.g. in `Drop` of
`KVec`:

`A::free(self.ptr.to_non_null().cast())`

vs.

`A::free(self.as_mut_ptr().cast())`

I'm not against this change, but I don't see how this makes things better.

> 
> > inconsistent with the signature of `realloc`.
> > 
> > Should we go with separate `shrink` / `grow`, `free` could be implemented as
> > shrinking to zero and allowing a NULL pointer makes not much sense.
> > 
> > But as mentioned, I'm not yet seeing the benefit of having `realloc` split into
> > `grow` and `shrink`.
> 
> I would not split it into grow/shrink. I am not sure what exactly would
> be best here, but here is what I am trying to achieve:
> - people should strongly prefer alloc/free over realloc,

I agree; the functions for that are there: `Allocator::alloc` and
`Allocator::free`.

`KBox` uses both of them, `KVec` instead, for obvious reasons, uses
`Allocator::realloc` directly to grow from zero and `Allocator::free`.

> - calling realloc with zero size should not signify freeing the memory,
>   but rather resizing the allocation to 0. E.g. because a buffer now
>   decides to hold zero elements (in this case, the size should be a
>   variable that just happens to be zero).

If a buffer is forced to a new size of zero, isn't that effectively a free?

At least that's exactly what the kernel does, if we ask krealloc() to resize to
zero it will free the memory and return ZERO_SIZE_PTR.

So, what exactly would you want `realloc` to do when a size of zero is passed
in?

> - calling realloc with a null pointer should not be necessary, since
>   `alloc` exists.

But `alloc` calls `realloc` with a NULL pointer to allocate new memory.

Let's take `Kmalloc` as example, surely I could implement `alloc` by calling
into kmalloc() instead. But then we'd have to implement `alloc` for all
allocators, instead of having a generic `alloc`.

And I wonder what's the point given that `realloc` with a NULL pointer already
does this naturally? Besides that, it comes in handy when we want to allocate
memory for data structures that grow from zero, such as `KVec`.

> 
> This is to improve readability of code, or do you find
> 
>     realloc(ptr, 0, Layout::new::<()>(), Flags(0))
> 
> more readable than
>     
>     free(ptr)

No, but that's not what users of allocators would do. They'd just call `free`,
as I do in `KBox` and `KVec`.

> 
> >>>>> +        // SAFETY: `ptr` is guaranteed to be previously allocated with this `Allocator` or NULL.
> >>>>> +        // Calling `realloc` with a buffer size of zero, frees the buffer `ptr` points to.
> >>>>> +        let _ = unsafe { self.realloc(ptr, 0, Layout::new::<()>(), Flags(0)) };
> >>>>
> >>>> Why does the implementer have to guarantee this?
> >>>
> >>> Who else can guarantee this?
> >>
> >> Only the implementer yes. But they are not forced to do this i.e.
> >> nothing in the safety requirements of `Allocator` prevents me from doing
> >> a no-op on reallocating to a zero size.
> > 
> > Ah, I see now, this is the same as your comment on the documentation of
> > `realloc`. So, this indeed just about missing a safety comment.
> > 
> >>
> >>>>> +    }
> >>>>> +}
> >>>>> --
> >>>>> 2.45.2
> >>>>>
> >>>>
> >>>> More general questions:
> >>>> - are there functions in the kernel to efficiently allocate zeroed
> >>>>   memory? In that case, the Allocator trait should also have methods
> >>>>   that do that (with a iterating default impl).
> >>>
> >>> We do this with GFP flags. In particular, you can pass GFP_ZERO to `alloc` and
> >>> `realloc` to get zeroed memory. Hence, I think having dedicated functions that
> >>> just do "flags | GFP_ZERO" would not add much value.
> >>
> >> Ah right, no in that case, we don't need it.
> >>
> >>>> - I am not sure putting everything into the single realloc function is a
> >>>>   good idea, I like the grow/shrink methods of the std allocator. Is
> >>>>   there a reason aside from concentrating the impl to go for only a
> >>>>   single realloc function?
> >>>
> >>> Yes, `krealloc()` already provides exactly the described behaviour. See the
> >>> implementation of `Kmalloc`.
> >>
> >> But `kvmalloc` does not and neither does `vmalloc`. I would prefer
> >> multiple smaller functions over one big one in this case.
> > 
> > What I forsee is that:
> > 
> >   - `alloc` becomes a `grow` from zero.
> >   - `free` becomes a `shrink` to zero.
> >   - `grow` and `shrink` become a `realloc` alias,
> >      because they're almost the same
> > 
> > Wouldn't this just put us were we already are, effectively?
> 
> We could have a NonNull parameter for realloc and discourage calling
> realloc for freeing.

But what does this get us, other than that we have to implement `alloc` and
`free` explicitly for every allocator?

Also, as mentioned above, `realloc` taking a NULL pointer for a new allocation
is useful for growing structures that start from zero, such as `KVec`.

> 
> ---
> Cheers,
> Benno
> 

