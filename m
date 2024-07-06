Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304134AED7
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jul 2024 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264097; cv=none; b=nA9y1Ssid7waORZJGBZmrgP1s8tq0/20d3OXLHFD3llYvr8VLDI4tuR8i+bdT7G85ns82eGrTUS2dXbsjOvyLYpyvMFlljaEa1xrDR7Z55aqk4KxtHVZR8tf/iJbEmR6wZ85E/mwi1FRkzmkR7+cAajfAcfaUHsSDsv3aH0GjPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264097; c=relaxed/simple;
	bh=SrG9g7BknkrdXVorXaur/awx5yYYafR3TcSF543F5iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=r+m1MlAJpBEeHzx9i1bwZCyJYLOH1+eoDlaSLGjsC5fNEqO9Re0KyL/JhgIC1S+W97GPPZ3lvN1odkftTtn2D07EW4h7B7yh1PR24mabBQO70E8A+bNnjRwSJirdVS0MyGp3neupiKWNAoA5ajKffNi/RZdfrqgWprSM8eQXVlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nd819LVl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nd819LVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720264094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4tj4gPqAmEVzBt8Cy2lzJJUU88H2pQYJt+UVHDPSmp0=;
	b=Nd819LVl/utr2j9Bun0aCGIKz+7kgCqZmp818ZNkI2wheYDAgA3/PAiZhuGpOZD9DQD+3X
	+lhe1pqM1GxBpkwUg/WnVv8/ejvHyvojEPhuY1uyg8uWnw4Ojf8soGBbGvwV2HYaUPOPHf
	3WMQhGtUpzvyOeWvq+UlQy4+kFhz4KY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-IiyyqIPAN-u1RoTT0HMsOA-1; Sat, 06 Jul 2024 07:08:12 -0400
X-MC-Unique: IiyyqIPAN-u1RoTT0HMsOA-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ee890f0cecso25930461fa.0
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jul 2024 04:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720264091; x=1720868891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tj4gPqAmEVzBt8Cy2lzJJUU88H2pQYJt+UVHDPSmp0=;
        b=cdStUO989GawnJbD9GsLVNyl2hSWHZ2fiY3ZC6ZgorwCnL+lA9LX0E0CX/+yaUkTSd
         c2Efw6uTHQZffZkJg/WzHIe5SpADnlE2yJoKOLPemgQn99GmRFrlQRoCW3YEdgGrJG6e
         WwlXpHlz6sKdNjQwjQfe8LbvgMnbQBCNXf4YeWmdaV9gWhzQSM5uPyEzteWHQmyc89RH
         TJrLDpVG1198SCeYanCqq6s0BMSyvy//mn1oJe+YSMvTZxqHM7vOJ5goasyOkT6leEmO
         jmfC4UFQkzm0l9ka94mZeZ9IU+1VJxd/9TQwJizPoMecF9ppwgcvISPO1AE8WrqdsJ7q
         lAqg==
X-Forwarded-Encrypted: i=1; AJvYcCWDfu7hs8AmZF+Wqmm/DTRl20prET86+3XElnXIJLOfZVdtAKQfwIG0cw14csdjKlyiQTpPLTlAXUIj6zIROLIUeisYXC5F8/A17VQLV4s=
X-Gm-Message-State: AOJu0Yxwdi4ayIalcIse9EbuC9PSDFqiwJS2J17iwocbPJr8eUzJ3Vhn
	RRj5PE3YOMsvMASTnpMNN8GFNJKdGBruGAy4JC5OxR1HrVd7ErgGjxvC/1azMD8scwDAcvj6LKY
	r70fkkwZvKoIGfsacV+VtgWQoM/q/WQsKi0E7M9EkWNvu5UMthVMw6U81CHK6jsbQ
X-Received: by 2002:a2e:818d:0:b0:2ee:8777:f86b with SMTP id 38308e7fff4ca-2ee8edd3edbmr45955281fa.35.1720264090765;
        Sat, 06 Jul 2024 04:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtEVQOFm8KYT+tSNz7hGRlT3yj7FgFzu2ilwKkS6JrI11Pu5JBo0UveaT0LtQU70hWpJRILQ==
X-Received: by 2002:a2e:818d:0:b0:2ee:8777:f86b with SMTP id 38308e7fff4ca-2ee8edd3edbmr45955141fa.35.1720264090372;
        Sat, 06 Jul 2024 04:08:10 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:701e:8fb8:a84f:6308])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6123sm91919555e9.12.2024.07.06.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 04:08:09 -0700 (PDT)
Date: Sat, 6 Jul 2024 13:08:08 +0200
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
Subject: Re: [PATCH 04/20] rust: alloc: implement `Allocator` for `Kmalloc`
Message-ID: <ZoklmPl0P+D5Fa+N@pollux.localdomain>
References: <20240704170738.3621-1-dakr@redhat.com>
 <20240704170738.3621-5-dakr@redhat.com>
 <033c72ba-fb31-4eff-b98c-5c5d35057280@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <033c72ba-fb31-4eff-b98c-5c5d35057280@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 06, 2024 at 10:37:00AM +0000, Benno Lossin wrote:
> On 04.07.24 19:06, Danilo Krummrich wrote:
> > @@ -48,20 +57,54 @@ pub(crate) unsafe fn krealloc_aligned(ptr: *mut u8, new_layout: Layout, flags: F
> >      }
> >  }
> > 
> > +unsafe impl Allocator for Kmalloc {
> > +    unsafe fn realloc(
> > +        &self,
> > +        old_ptr: *mut u8,
> > +        _old_size: usize,
> > +        layout: Layout,
> > +        flags: Flags,
> > +    ) -> Result<NonNull<[u8]>, AllocError> {
> > +        let size = aligned_size(layout);
> > +
> > +        // SAFETY: `src` is guaranteed to point to valid memory with a size of at least
> > +        // `old_size`, which was previously allocated with this `Allocator` or NULL.
> > +        let raw_ptr = unsafe {
> > +            // If `size == 0` and `old_ptr != NULL` `krealloc()` frees the memory behind the
> > +            // pointer.
> > +            bindings::krealloc(old_ptr.cast(), size, flags.0).cast()
> > +        };
> > +
> > +        let ptr = if size == 0 {
> > +            NonNull::dangling()
> > +        } else {
> > +            NonNull::new(raw_ptr).ok_or(AllocError)?
> > +        };
> > +
> > +        Ok(NonNull::slice_from_raw_parts(ptr, size))
> > +    }
> > +}
> > +
> >  unsafe impl GlobalAlloc for Kmalloc {
> 
> Since you remove `alloc` entirely at the end of this series, do we even
> need this?
> If not, it would be best to just leave the implementation as-is until a
> patch removes it entirely.

I may have done this to not break the rusttest target, but I think with what I
ended up with, this shouldn't be required anymore and can be removed in a single
patch at the end of the series.

> 
> ---
> Cheers,
> Benno
> 
> >      unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
> > -        // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero size by the function safety
> > -        // requirement.
> > -        unsafe { krealloc_aligned(ptr::null_mut(), layout, GFP_KERNEL) }
> > +        let this: &dyn Allocator = self;
> > +
> > +        match this.alloc(layout, GFP_KERNEL) {
> > +            Ok(ptr) => ptr.as_ptr().cast(),
> > +            Err(_) => ptr::null_mut(),
> > +        }
> >      }
> 

