Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4398248B
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 12:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714567960; cv=none; b=fTLRtW2ckKELXlzA75vWAE063lGfzoK63djdwEOnguG6PyyfaHxaZZuThX+9AIbbe/9Apl4xv/fT6cM2jFEsAPFTFdfWyfbzNZA/tPP+7exmOs2CEiln616EhM2MCEDg5+sQZiINzo7UbPKDtnQOQRfDouhcpIrfKSM+CBlwkLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714567960; c=relaxed/simple;
	bh=WRA5FY6bAiHFfKTx+Zj2VkfBafKj1imwM2P8Zf4fzLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Rh32gAFgDnW+BTsGKifD+Wxa84hWxLToClhrP6pTZZlqSuF0Zpqs1sn5Uz0ElsyvS9V3WhFsGvQ+wPuGg4W5vnSwQqtCzIprvQvZJ6QQISvItGLv5AAKIynHxDUeoS/JVBbKk3F74P/+1TdRWvU1/27eREjLgQguG9HDXOduCx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XSGaQ4IL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XSGaQ4IL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714567957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3mTe4U5EFf+0GV5ptzR6kN6gePWX6zZzbB7G0Tj3nQ=;
	b=XSGaQ4ILV5Okw6VfAb1efpcSVZRbYhS6sOxe1GTtBXmkEOznE2/rHUHfN5HiM7m9Roik7s
	HjXuA90XW2VtBnEJXpqo7b+kXRBXVLJEdDf6V6pY/CwRbZ88EK6Ri/8gDa6DP+5PW+Xhik
	2dZqsnP2FO6QWzEOQ2ZUAOzmq13ygfY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-rG4qOML3PZudkG31cxyZuQ-1; Wed, 01 May 2024 08:52:36 -0400
X-MC-Unique: rG4qOML3PZudkG31cxyZuQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-34dce5456c3so446795f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 05:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714567955; x=1715172755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3mTe4U5EFf+0GV5ptzR6kN6gePWX6zZzbB7G0Tj3nQ=;
        b=ojh9kGPrshoOTg1jSILN40yG4X0cdXo5K+msUvSyJ7so1000ssRThljASEEhl6BW0i
         +y4gmb7avHsWzhPubcSQuJMU9pquK08tyPYxip2aVy6rDaC5nu3W0NZOK/XpAe955MMC
         N7Pv9sImjTFWhyM3iD0fxBasyuHnlVDxrhkyKGZ+Ib8ck3psXCaKOHqqFGfjmc205cWg
         9WdwbA9kdhEgNTUM2jXLy0yq0O96f/LxKtMUzS2oyy+KAk6K7ol5J1L9v987r3RXs9xx
         yL/A5Q7v9lFfd9LvYSVrnaWLHNySO8v4ZjxpIgURNLG6joehiJeUk6NY1d0UUQ1klGNV
         9KWA==
X-Forwarded-Encrypted: i=1; AJvYcCV546ALnY8jC3SHiP253MmrM9Rq6Ss52w+AZSD/LsbKO4F2/XOO+BAGEAEoolgDbXMrf71DfJ2tHTHY9tHmmR5aRnKfO0q39k9QllKkQfI=
X-Gm-Message-State: AOJu0YzdrTn6xk97wwMxXw3yjgVz38sv1hSv/+S4Q2cOkL6mhPqFZq8b
	B735inortvJBLLTMzg9Qrm3qB0IRlAWSBXcaF5C33tFLIdEUDuYdPULq3lC3PbJoj1C6TQlOHm2
	39Vk4veyfiuismhAd9y29ViyvTUZXhkSEfy4xJdNWbvCRQdZNx17fB7KghYD1E+Q9
X-Received: by 2002:adf:e3c2:0:b0:34c:6382:290c with SMTP id k2-20020adfe3c2000000b0034c6382290cmr2322697wrm.39.1714567955181;
        Wed, 01 May 2024 05:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9r/jsrVFKgpdAEoFL4Xa6EqzuSKf3wFVIn557FVeS+l5bgaDR5clzfuuD9tPPy9vNUnAwGA==
X-Received: by 2002:adf:e3c2:0:b0:34c:6382:290c with SMTP id k2-20020adfe3c2000000b0034c6382290cmr2322669wrm.39.1714567954802;
        Wed, 01 May 2024 05:52:34 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id bg4-20020a05600c3c8400b0041bf29ab003sm2143651wmb.30.2024.05.01.05.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 05:52:34 -0700 (PDT)
Date: Wed, 1 May 2024 14:52:32 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com,
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com,
	jhubbard@nvidia.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH WIP 5/8] rust: alloc: implement AllocatorWithFlags for
 KernelAllocator
Message-ID: <ZjI7EF25qgCXcvu9@pollux>
References: <20240429201202.3490-1-dakr@redhat.com>
 <20240429201202.3490-6-dakr@redhat.com>
 <d08e2061-3f6b-403a-8bcf-6527ec2443cf@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <d08e2061-3f6b-403a-8bcf-6527ec2443cf@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 01, 2024 at 08:44:46AM +0000, Benno Lossin wrote:
> On 29.04.24 22:11, Danilo Krummrich wrote:
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/kernel/alloc.rs           |  2 +-
> >  rust/kernel/alloc/allocator.rs | 38 ++++++++++++++++++++++++++++++++--
> >  2 files changed, 37 insertions(+), 3 deletions(-)
> > 
> > diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> > index ec45ba8f77ce..12c6c4e423f5 100644
> > --- a/rust/kernel/alloc.rs
> > +++ b/rust/kernel/alloc.rs
> > @@ -4,7 +4,7 @@
> > 
> >  #[cfg(not(test))]
> >  #[cfg(not(testlib))]
> > -mod allocator;
> > +pub mod allocator;
> >  pub mod box_ext;
> >  pub mod vec_ext;
> > 
> > diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> > index 236100649ae1..173347ff018a 100644
> > --- a/rust/kernel/alloc/allocator.rs
> > +++ b/rust/kernel/alloc/allocator.rs
> > @@ -3,12 +3,14 @@
> >  //! Allocator support.
> > 
> >  use super::{flags::*, Flags};
> > -use core::alloc::{GlobalAlloc, Layout};
> > +use core::alloc::{GlobalAlloc, Layout, Allocator, AllocError};
> >  use core::ptr;
> > +use core::ptr::NonNull;
> > 
> >  use crate::bindings;
> > +use crate::alloc::AllocatorWithFlags;
> > 
> > -struct KernelAllocator;
> > +pub struct KernelAllocator;
> > 
> >  pub(crate) fn aligned_size(new_layout: Layout) -> usize {
> >      // Customized layouts from `Layout::from_size_align()` can have size < align, so pad first.
> > @@ -89,6 +91,38 @@ unsafe fn alloc_zeroed(&self, layout: Layout) -> *mut u8 {
> >      }
> >  }
> > 
> > +unsafe impl Allocator for KernelAllocator {
> > +    fn allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
> > +        self.default_allocate(layout)
> > +    }
> > +
> > +    fn allocate_zeroed(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
> > +        self.default_allocate_zeroed(layout)
> > +    }
> > +
> > +    unsafe fn deallocate(&self, ptr: NonNull<u8>, layout: Layout) {
> > +        unsafe { self.dealloc(ptr.as_ptr(), layout) }
> > +    }
> > +}
> > +
> > +unsafe impl AllocatorWithFlags for KernelAllocator {
> > +    unsafe fn alloc_flags(&self, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>
> > +    {
> > +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, flags) }
> > +    }
> > +
> > +    unsafe fn realloc_flags(&self, ptr: *mut u8, _old_size: usize, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>
> > +    {
> > +        let size = aligned_size(layout);
> > +
> > +        unsafe {
> > +            let raw_ptr = krealloc(ptr, size, flags);
> 
> I looked at the safety requirements of `krealloc`, it needs that
> `size` is non-zero. But who guarantees that? I could call
> `KernelAllocator::allocate()` with a zero-sized layout, since it is a
> safe function.

Indeed, as mentioned in the other thread, realloc_flags() shouldn't be unsafe
IMHO and instead should fulfill the safety requirement of krealloc().

Gonna fix that.

> 
> -- 
> Cheers,
> Benno
> 
> > +            let ptr = NonNull::new(raw_ptr).ok_or(AllocError)?;
> > +            Ok(NonNull::slice_from_raw_parts(ptr, size))
> > +        }
> > +    }
> > +}
> > +
> >  #[global_allocator]
> >  static ALLOCATOR: KernelAllocator = KernelAllocator;
> > 
> > --
> > 2.44.0
> > 
> 

