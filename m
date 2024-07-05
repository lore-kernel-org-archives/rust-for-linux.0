Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F583D6A
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jul 2024 01:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720142633; cv=none; b=NKLb8N4F2KyQHBKW4dPddfufXhV+iwHtHJOWxtthbmfBkGC2Om8GcpKViK6LW+z3Y78lz+q7OPKhSZp4u3mSEN/PF/MwbIB7ldN2ZkrspPGh2HE6egwVgLT0Pd6Ur2M664dCGR6rYrsCWbQU/EKxZc7Ozarwk/2d8Zm30gBxyQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720142633; c=relaxed/simple;
	bh=tTBdpp4bW3GBKjFt741ATC8IBRDSGsbM4opt7uJi3F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=suygrxPStZtZfYs0oKfEwgjuG9R1WOG0mOZTbG2PGzm1odZeYXl8KLmSrMrg9TWpfm/x+84xHw9y69m6RdwKYzkJMAeDsANScqZfKq4WYaPc1bp3jvI2AyyHwy82VT9beZ/IzEjum+70nEvzGU/+g49gUFKBcqZTe5O2ajkPA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MjHxcii2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MjHxcii2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720142630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YT8fAbVi1MScPKti59bXaWPJx5fQLZZNNIf8Td1RH2U=;
	b=MjHxcii2PXh/XusshAcT0smzrLJh/zDBM+Fk8VpOoVrzyvKIwx0O1gh+XZ7SCC/C5ypuk2
	k7BzAzgIjU+4MOpfTbKVARksNVOIT1+SRFJQM4jUMFMzhuYoTpe5RIa7FTs+AIExJcgCVg
	cMNEzlNA6YsHBENzJBye7oflKNQdlA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-uUdp4rwyOMOJqwvJ6GxUyw-1; Thu, 04 Jul 2024 21:23:49 -0400
X-MC-Unique: uUdp4rwyOMOJqwvJ6GxUyw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4256667ebf9so8464055e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jul 2024 18:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720142628; x=1720747428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YT8fAbVi1MScPKti59bXaWPJx5fQLZZNNIf8Td1RH2U=;
        b=UB/C2YmEgG6l9h1KwdQP1BLcs+3TjZ//9+AR4CokAT7RADCn4cerE1kKj2+SzQRgVp
         89o6NCmZaejAGvE1N2ljgSxQSsT47WSah8B9pLcI3wTZABIikZXLI2AvDTIhtuUY2Xj8
         UWzVgSHzRdS6Fns48NbUEGFVPo/1pOCrFfxEzBwy4n6V1eUZHv7hTd6ic1BzkO5JFahR
         7J1sCdQ/8dwytl0rUGyX/YYkgD+KqgqQDwlq40xW0dF4KcIUY6KJIFJZHeZV4gN5frj/
         HJQz5LJByNVLEJ0lKCLH9XhhHF2lrxXl4AlHBzUqpcSvlfDRl/TINLATwMZXxaC4joH4
         nHGg==
X-Forwarded-Encrypted: i=1; AJvYcCUyHIbV4Ehudnl3mFS8Xta7+H9hJdsml7OG9MWDGOQSRokmRjGYyEtiFu4+l81zi0Sg73X/9N8AZ1yNxOm/Qrg4+H0Ce1VSj9JYXrW8Wlk=
X-Gm-Message-State: AOJu0YzgSOOQCF7u0tCfJDDOmvT0t7eWgC7Com3Yq8sWWO4zFowpI99J
	zVrQHXTpHGkXBLnkn9i9JtegnIeJjMHoGDI/motcVMpwVJl6LSEQ30TkTVIn7O0PUXQI3ZaYy77
	cD89aym1xTffq6bZgAAXJKE6uS3UGI9eDNaggUQvuaObk1XkRF4v+Ju2ElBtTEvJy
X-Received: by 2002:a05:600c:458a:b0:424:ad2a:1055 with SMTP id 5b1f17b1804b1-4264a3d1ee4mr25223655e9.15.1720142628375;
        Thu, 04 Jul 2024 18:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvEGUd1G5PF0yyMc1z6rNgJUjEnDAVHkirMLz+KHQYCa3hyD6+vEKHkLBuvLlrgDGYHB2QcQ==
X-Received: by 2002:a05:600c:458a:b0:424:ad2a:1055 with SMTP id 5b1f17b1804b1-4264a3d1ee4mr25223545e9.15.1720142627992;
        Thu, 04 Jul 2024 18:23:47 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:dd02:3ae7:6a59:ed26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a251ef5sm41635315e9.36.2024.07.04.18.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 18:23:47 -0700 (PDT)
Date: Fri, 5 Jul 2024 03:23:45 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com,
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com,
	boris.brezillon@collabora.com, lina@asahilina.net,
	mcanal@igalia.com, zhiw@nvidia.com, acurrid@nvidia.com,
	cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 15/20] rust: alloc: implement `collect` for `IntoIter`
Message-ID: <ZodLIaIC1gvZT79r@pollux.localdomain>
References: <20240704170738.3621-1-dakr@redhat.com>
 <20240704170738.3621-16-dakr@redhat.com>
 <Zocv0RFghfk56NHE@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Zocv0RFghfk56NHE@boqun-archlinux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 04, 2024 at 04:27:13PM -0700, Boqun Feng wrote:
> On Thu, Jul 04, 2024 at 07:06:43PM +0200, Danilo Krummrich wrote:
> [...]
> > @@ -658,6 +658,87 @@ impl<T, A> IntoIter<T, A>
> >      fn as_raw_mut_slice(&mut self) -> *mut [T] {
> >          ptr::slice_from_raw_parts_mut(self.ptr, self.len)
> >      }
> > +
> > +    fn allocator(&self) -> &A {
> > +        &self.alloc
> > +    }
> > +
> > +    fn into_raw_parts(self) -> (*mut T, NonNull<T>, usize, usize, A) {
> > +        let me = ManuallyDrop::new(self);
> > +        let ptr = me.ptr;
> > +        let buf = me.buf;
> > +        let len = me.len;
> > +        let cap = me.cap;
> > +        let alloc = unsafe { ptr::read(me.allocator()) };
> > +        (ptr, buf, len, cap, alloc)
> > +    }
> > +
> [...]
> > +    pub fn collect(self) -> Result<KVec<T, A>, AllocError> {
> > +        let (mut ptr, buf, len, mut cap, alloc) = self.into_raw_parts();
> 
> We have leaked the `IntoIter` here,
> 
> > +        let has_advanced = ptr != buf.as_ptr();
> > +
> > +        if has_advanced {
> > +            // SAFETY: Copy the contents we have advanced to at the beginning of the buffer.
> > +            // `ptr` is guaranteed to be between `buf` and `buf.add(cap)` and `ptr.add(len)` is
> > +            // guaranteed to be smaller than `buf.add(cap)`.
> > +            unsafe { ptr::copy(ptr, buf.as_ptr(), len) };
> > +            ptr = buf.as_ptr();
> > +        }
> > +
> > +        // Do not allow for too much spare capacity.
> > +        if len < cap / 2 {
> > +            let layout = core::alloc::Layout::array::<T>(len).map_err(|_| AllocError)?;
> > +            // SAFETY: `ptr` points to the start of the backing buffer, `cap` is the capacity of
> > +            // the original `KVec` and `len` is guaranteed to be smaller than `cap`. Depending on
> > +            // `alloc` this operation may shrink the buffer or leaves it as it is.
> > +            ptr = unsafe {
> > +                alloc.realloc(ptr.cast(), KVec::<T>::buffer_size(cap)?, layout, GFP_KERNEL)
> > +            }?
> 
> and if `realloc` fails, we end up leaking memory, right? A simple fix

Good catch!

I think `realloc` should never fail for a shrink request though, but this isn't
a guarantee I want `Allocator` to actually provide. Besides that, this is just
best effort here, if it fails, it fails and we should just continue.

> would be continuing if `realloc` fails. Maybe you could even make this
> function returns `KVec<T,A>` instead of a `Result`.

Yes, I will queue this up for v2.

> 
> Regards,
> Boqun
> 
> > +            .as_ptr()
> > +            .cast();
> > +            cap = len;
> > +        }
> > +
> > +        // SAFETY: If the iterator has been advanced, the advanced elements have been copied to
> > +        // the beginning of the buffer and `len` has been adjusted accordingly. `ptr` is guaranteed
> > +        // to point to the start of the backing buffer. `cap` is either the original capacity or,
> > +        // after shrinking the buffer, equal to `len`. `alloc` is guaranteed to be unchanged since
> > +        // `into_iter` has been called on the original `KVec`.
> > +        Ok(unsafe { KVec::from_raw_parts_alloc(ptr, len, cap, alloc) })
> > +    }
> >  }
> >  
> >  impl<T, A> Iterator for IntoIter<T, A>
> > -- 
> > 2.45.2
> > 
> 

