Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1947E1DFF0
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 12:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714567836; cv=none; b=ruM/0mj5m7ghYiLjsIGIKTVCX91oXfQ5fEQ4IvJnY7Vls11MYMfmJO7omYpEATViqMS+lYAI2jGV+L1XUaAYMABFLh/Sa2JExIPaThwc5XDQrGD5ZI53fohY2fvZ9cvrhITbsYjywdtqOchXtSA0k1KVzhSL1JdjkThdwboqgFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714567836; c=relaxed/simple;
	bh=lYbwM+yWZmAlxa/1sNLPh7isFqNdb50sRR12HMAlOtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ai6zYlTUKslCvR9TqZ4Q9fi3eKaed/NMzLGRLsaxImKiBXTstdlrk4lX64XH2J6hBRJN4VvjtbM7ghUiZCkA/9tcMpd7VCV6fU/U8BAwyK9dItGFw9OAWqjYpZ41puU8od8LFQPngGZ49vbQLXieUzKTW4h3E2frRzPWi2AnIoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KW6iCrmc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KW6iCrmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714567834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWkH7tZwxR3SwuBdPbaTOzTomu4rKK6ADShbPxUBERo=;
	b=KW6iCrmc4SLfWy4iJfdaE6CqI5j9GXW4KZnaEptP25ur6JDPRlpRljjw8JR9IcjSySHD5g
	6c5TTZYkXa6/SQZLwly0wD8baIOfMZO9xBaha7Sb//8Yp4VFecPBhkntofBHPJxmnnDoGY
	eJqmI7toXv4gnbecBQoNWvlCTYrMf00=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-HxSTKoOHM12CYagapmlgEw-1; Wed, 01 May 2024 08:50:32 -0400
X-MC-Unique: HxSTKoOHM12CYagapmlgEw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-41c01902e60so17431615e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 05:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714567831; x=1715172631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWkH7tZwxR3SwuBdPbaTOzTomu4rKK6ADShbPxUBERo=;
        b=ar1E6e8JRiY5D4Oxc2wHyQkZRESlxs5xTKhbFkNvN6n4qOOYFgjMOoGbFYDHm1xWv6
         B39R1e5Cyu6i7IxXm6oyzi07Dc+vPTrtj55f2yXgu6y7j1Y03y7ZnmPPJCuLAgTlFrzt
         2ZA4f9lQI/5ltjOu5ocWK5CEFslaN477cQM09xUKE65A0wOtPCsdEs56XwYCCtJ9H5U8
         wJPJfKzPj2ZhkIwhjwcOITo4vs3hNfYkYszpziYRS890+kLGdckFJs39MsxNPlxuyQQJ
         b4JNCmWzDm8AqhpyXrI58/wL2EJN30y/bG6CAt9uFEhCao2wbMgAQV6zQIw4qIv2tM9h
         XApA==
X-Forwarded-Encrypted: i=1; AJvYcCWEI3Eorw+AfN5JjZoRqzmedL6YifaIKIzpVAkuv0LeYHzjwd6jWXAaQoPM3ICzrv+FvQQIqT3AT7bgpuseOBo+ZK+VVEvwsmpCmnS1q1M=
X-Gm-Message-State: AOJu0YzhSJc3f1MXD6NlyqhP44eI6x1lBb9XrTtdy0YWDL6t0AoUlRtB
	K/VXEPlGQOQlzRZ+cn72z5X9JghY9wwvmvMwn/EVRlnuBDUuwBQm80xUxaRUIiDko6NylMiXbGR
	F8MUgqEByV7RtNU+CDVtNBN+i+wBGtcWKPHpeyVbvOc7p+CiQQoSqpmO9OsJk2PAC
X-Received: by 2002:a05:600c:3548:b0:41c:14a4:7b34 with SMTP id i8-20020a05600c354800b0041c14a47b34mr1798672wmq.27.1714567830910;
        Wed, 01 May 2024 05:50:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBHyOQstYO+vb/HiFpBOwNV2JE0FvBF2I40IcFmBqzovMqz88cihpFYv6e3fCHG4ltN6yO7w==
X-Received: by 2002:a05:600c:3548:b0:41c:14a4:7b34 with SMTP id i8-20020a05600c354800b0041c14a47b34mr1798646wmq.27.1714567830496;
        Wed, 01 May 2024 05:50:30 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id n44-20020a05600c502c00b004146e58cc35sm2136278wmr.46.2024.05.01.05.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:50:30 -0700 (PDT)
Date: Wed, 1 May 2024 14:50:27 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com,
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 3/8] rust: alloc: implement AllocatorWithFlags trait
Message-ID: <ZjI6k4YUsdUA_LaF@pollux>
References: <20240429201202.3490-1-dakr@redhat.com>
 <20240429201202.3490-4-dakr@redhat.com>
 <b098c9ee-a9b5-4bef-8703-ef56e6b1dcb7@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <b098c9ee-a9b5-4bef-8703-ef56e6b1dcb7@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 01, 2024 at 08:32:01AM +0000, Benno Lossin wrote:
> On 29.04.24 22:11, Danilo Krummrich wrote:
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/kernel/alloc.rs | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> > index 9bc1b48b5641..ec45ba8f77ce 100644
> > --- a/rust/kernel/alloc.rs
> > +++ b/rust/kernel/alloc.rs
> > @@ -8,6 +8,14 @@
> >  pub mod box_ext;
> >  pub mod vec_ext;
> > 
> > +use core::{
> > +    alloc::{Allocator, AllocError, Layout},
> > +    ptr,
> > +    ptr::NonNull,
> > +};
> > +
> > +use flags::*;
> > +
> >  /// Flags to be used when allocating memory.
> >  ///
> >  /// They can be combined with the operators `|`, `&`, and `!`.
> > @@ -68,3 +76,16 @@ pub mod flags {
> >      /// small allocations.
> >      pub const GFP_NOWAIT: Flags = Flags(bindings::GFP_NOWAIT);
> >  }
> > +
> > +pub unsafe trait AllocatorWithFlags: Allocator {
> > +    unsafe fn alloc_flags(&self, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>;
> > +    unsafe fn realloc_flags(&self, ptr: *mut u8, old_size: usize, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>;
> 
> Please use `rustfmt`, there exists a make target that does it for you.

Sure, gonna fix.

Out of curiosity, given that we have this make target, the expectation obviously
seems to be that all Rust code in the kernel must be formatted with this. I
think that's indeed desirable. Two questions regarding this:

How do we scale (as in ensure) this once Rust code becomes more common in
subsystems?

Is it possible for rustfmt to change rules unexpectedly? If so, how would we
deal with that?

> 
> Also why are these functions `unsafe`? You haven't specified a `Safety`
> section, which means nobody knows what the requirements are.

I think I did this because they did inherit the safety requirements from
krealloc() (as you also point out in another patch).

I think they shouldn't be unsafe, just as the corresponding Allocator ones
aren't.

Gonna change that.

> 
> > +
> > +    fn default_allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
> > +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KERNEL) }
> > +    }
> 
> Why do we want to have these functions? I think that it would make sense
> to forbid all other ways of allocating memory. So only allow allocation
> where the flags are explicitly passed.

I agree that we should forbid allocating memory with implicit default page
flags.

I added them, since I think we'll always need some implementation of the
Allocator trait. And this just was the obvious generic implementation.

If we agree to forbid allocating without page flags, we can just always return
an error?

> 
> -- 
> Cheers,
> Benno
> 
> > +
> > +    fn default_allocate_zeroed(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
> > +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KERNEL | __GFP_ZERO) }
> > +    }
> > +}
> > --
> > 2.44.0
> > 
> 

