Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C8A74E11
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 22:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714514655; cv=none; b=CHBgFLv/Sg4lZnr6aJXc16gGeSh3y5DrfSTZwWi41pQPL1RQgNkNAfAy9br14qFO34uisdWjxndYk9NbDKcrP4mUyjnUkQNzJy5+mC+FenyKpu6dVCSWKxv4C7BVj3loaD+PC/IvxeJJeJ11vLOvEkUr+jau2Ss118LxFccP1PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714514655; c=relaxed/simple;
	bh=ayAW8beeMBQVjVjD9RyQuwQi9jBm7cORowDFJ26JJik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=N2xAzsRkrAJ9SZxoLgL1waKedUJRAnZ8awJFHsdEY/SepTDOiVau/hcZb2AdU/CoDHeqRw265Rd9DnidcfJXd9xWGSlEZRM0ox4PmABVqdJAtm3aloJsuyQlckVeO70EUXduVlnXo1KhpEEod5p22YiuKN+vQHP7xnJjvWGvnx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=egyhTzGj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="egyhTzGj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714514652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iV6OsoH3q1Cbp4siFF+DNAtfgnTbhHtDYzsaQhAYpB4=;
	b=egyhTzGjvEAwS8gOrpN2e+5KOHPfdBmnMjPUJl2OrBDN1EhECss817i2azRG2wuFRs4Mk3
	gsjVEM0bwAjGD3qXXH7ZfixXYMpCJ0vxC+rCCIHGFaUvKanaW3t/z5E3JM2gS06x/gXAXV
	lbW75mhgYG4TV3b/cBIPoB6/lLIxmFw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-m7YEgYHxMyGpR47k4UHTBg-1; Tue, 30 Apr 2024 18:04:10 -0400
X-MC-Unique: m7YEgYHxMyGpR47k4UHTBg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-349cafdc8f0so3706540f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 15:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714514649; x=1715119449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iV6OsoH3q1Cbp4siFF+DNAtfgnTbhHtDYzsaQhAYpB4=;
        b=lGRtyHr4YwDrxScYiaz+nLDhMuEKEV71YQR9ZxQGa0Hne7jKKrk/ko245Tfi/DGlV0
         8ws6B/w33YmJMny0Y9zXW9BOk/Zbse3pdh2TIaEjisW63o/AjPwI3Xmgvr5vqsx8O3Yu
         d2jaFdTiJDA1pZ1IzMrejXmrhPlsdaRxUWmBPB3NSV6378vqzBM6hV+JOfRfdkhkvCRN
         f8mVot+9Dl9REFKRzale7susQNEnpEAqRNOpL5CQrf/9TCX8xotIthXke3tFwWW8VogT
         iE4WW99e4oSSYAsQy8BWRuZCfcrDiiq4mKgpTHaNH5qKmyc7NlitBSUxbxgGh61de8yc
         erlw==
X-Forwarded-Encrypted: i=1; AJvYcCU29kFUjoVZbjTFZWOC4LZ7RpopqdFjaL61dkW1C4/sb0a6OvSMw2K6HxME/a5IwISLzKiEv1cVzpq05IxAg/sP1+MfOW1SJf62XK84KqQ=
X-Gm-Message-State: AOJu0YwgXl76fha7lKXZue+hXal4tFEjEPKBxCScXUqJWWPZoOlxudae
	emzj0KCih+UVzptrBQUel3ZxaWLvAmXynrgyia96SXWGv6d4GVv85tJ+m0oLN4xLEFA+CbnhIHM
	JoApuVKHC8AWFlkgSctaHYJvoaeoQnalA8gC6GUnVvsG6iia0wotvQEcgFusGwL7C
X-Received: by 2002:a5d:46d0:0:b0:34d:1b4c:d014 with SMTP id g16-20020a5d46d0000000b0034d1b4cd014mr709782wrs.57.1714514649677;
        Tue, 30 Apr 2024 15:04:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvjZ0nUeMtYYy4Wv9Mzlh8GtuqdS7Jy/iaenX+vlqfDX5i4NMrrxY6HiS3rew5SgLqxDTyQg==
X-Received: by 2002:a5d:46d0:0:b0:34d:1b4c:d014 with SMTP id g16-20020a5d46d0000000b0034d1b4cd014mr709770wrs.57.1714514649337;
        Tue, 30 Apr 2024 15:04:09 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d6950000000b003477d26736dsm32880326wrw.94.2024.04.30.15.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 15:04:08 -0700 (PDT)
Date: Wed, 1 May 2024 00:04:06 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: fix dangling pointer in
 VecExt<T>::reserve()
Message-ID: <ZjFq1uVXi4k1jjQc@pollux>
References: <20240430121322.2660-1-dakr@redhat.com>
 <CANeycqqRasM-k1WY8znPbF3_bRDGQHghnyMi=oy=Mjs9UQH0fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CANeycqqRasM-k1WY8znPbF3_bRDGQHghnyMi=oy=Mjs9UQH0fw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2024 at 04:25:44PM -0300, Wedson Almeida Filho wrote:
> On Tue, 30 Apr 2024 at 09:13, Danilo Krummrich <dakr@redhat.com> wrote:
> >
> > Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> > initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> > passing a dangling pointer (instead of NULL) to krealloc() whenever a
> > new Vec<T> is created through VecExt<T> extension functions.
> 
> Nice catch, thanks!
> 
> A small nit on the wording above: this applies to any Vec<T>, not just
> those created via VecExt<T>. For example, if we create with

True, I think I wanted to say "whenever a new Vec<T>'s backing storage is
allocated through VecExt<T> extension functions".

> Vec::new(), then use VecExt::push or VecExt::reserve, we'll run into
> this. (IOW, which function is used to create the Vec is not a factor,
> using VecExt to extend it from 0 to >0 is.)
> 
> >
> > This only works as long as align_of::<T>(), used by Unique::dangling() to
> > derive the dangling pointer, resolves to a value between 0x0 and
> > ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
> > pointer however.
> >
> > This isn't a case we should rely on, since there may be types whose
> > alignment may exceed the range still covered by krealloc(), plus other
> > kernel allocators are not as tolerant either.
> 
> Perhaps it would make sense to add a sample with such a type?
> 
> It would serve as a test as well when kunit and doctests are enabled.

Yeah, that sounds reasonable. Let me see whether I can get to that.

> 
> >          let (ptr, len, cap) = destructure(self);
> >
> > +        // We need to make sure that ptr is either NULL or comes from a previous call to
> > +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
> > +        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>'s capacity
> > +        // to be zero if no memory has been allocated yet.
> > +        let ptr = match cap {
> > +            0 => ptr::null_mut(),
> > +            _ => ptr,
> > +        };
> > +
> 
> nit: why did you choose to use a match here?

I felt like it reads nicely.

> I don't think C
> programmers would use a switch to determine if a value is zero or
> non-zero.

Well, I think for writing Rust code it doesn't matter too much what C
programmers would do? ;-)

What is idiomatic in this case?

> 
> I would have written:
> 
> let ptr = if cap != 0 { ptr } else { ptr::null_mut() };
> 
> >          // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
> >          // `krealloc_aligned`. We also verified that the type is not a ZST.
> >          let new_ptr = unsafe { super::allocator::krealloc_aligned(ptr.cast(), layout, flags) };
> 
> In the case when reallocation fails, we need to rebuild with the
> original pointer (the dangling one if cap is zero). This patch is
> rebuilding it with null when cap is zero, which is incorrect.
> 

Indeed, good catch. Gonna fix that up in a v3.

