Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE7B2D879E
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754903676; cv=none; b=K36OLNbcKjm4oz85yT8olVfgDnKyug77GJNLrvYwp/07DwuJ4nHFdk7QrOknrNILCw9lnFTvJ+Mw5OrKEoX1xBQp1wIQjSWdMu7VcTOT7sFlaJ9Uor4VgRgn1udCUZF2IeBAhRs9IxJdw1Rkxciov5lZyv5hmb+JiNNkO3hVC+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754903676; c=relaxed/simple;
	bh=X5jZYgs02U9tdc2BvKY8cF2vXXdnW0+JBCS2cWTaXf8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c1Z65qorgKrru5ALcoHzRlspfek6irgWWNVKRVPguLHAOjH0lHUbtnRUov5qLbzuU/r3zNz+0ArhqrWXfBjys7Z7yGt89S8Cu4xfUotS/ovPtg+7zSz44qIkyKVbNL63KWSEJi7Jc+ZWWRVLoN+Dkp86AVcfdcAfB3ATdEp/7FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z2v5+GUp; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z2v5+GUp"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b8d8935418so2694797f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754903672; x=1755508472; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOqV629ggSkYTLdjZEVuW47RILLtgd6afyBmWFboqzU=;
        b=z2v5+GUp971g9bfNPvKcOSQwa8fYEeJa2Bqq5ebYcnze4vzIzIeyKRLudI/Ddo64JT
         6D147FyKhkJrMgMKoAaf7PnkqjNNIwqZFS5QgoMwJxWDA7FWkoibWBupEp8wMHLNkqaU
         /jFcLAsgT1uFR/OzXG3QFWh3rtMFeWw2LJnjGXq7pXi1qa7zQk0Xw53D7X8WYAlZtr0m
         gLlIIQj9JhduCC2Y1rsao2LhIGVX/kr0cBlHIh1K8c7nwDTPZPvC+79DOj6SW3+XFD91
         mv6fgwXgNlliS/4aVbvTUscbAdA6m3ZAw2SCGYF+ZcxZBBNvyUE4+pzi4qlil7EzjZrj
         mBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903672; x=1755508472;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOqV629ggSkYTLdjZEVuW47RILLtgd6afyBmWFboqzU=;
        b=oq24fX4/8lPwT25zHxWxpUpgSMBprdmxpfg4QS1zRhMkdMZutNr9gu+hNhJ+rpWy9k
         1X7CGiECqoVBf57b4u7YvxBLZQsXo+mU7Av01i6lvNs1ATVfUOsrOGFJHO6vackL1iyz
         UArJO3gZPqDFgfahC+B7HSG1/lu/jW1DN9auPvTt5uJy/kOxovCccUJ5otZdecf2Wmas
         Mw7xteoO0Xx1MYUZCUS++YeOhNA9dV4FVVpu9EETsufuUGk9zbPKxcal160m/GkNC+hR
         1z281B5PBQiZqjad4ttpR7qpQjbOGRG1tjbbKaydp703jruRx+EW9XUaNx/qf9kvagKO
         iAFw==
X-Forwarded-Encrypted: i=1; AJvYcCWL5bfA6gCSZbwPGRieD8Hs+aVle+ce5cqd+bPfQkWcChmSVmo0+Z4iz1xIoXDf5NVtVzlXSRsYbdA1CitOaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9a01L8B/NDYKWxQ5FODHWFpdImGgua5QE+KGwCg8Z/Tf+m+jx
	qXm7C/2Zgk7iRciPDFVxtte9zMRV3emkAHrpkmD1JpTUuN6OuoztfYptbxpqMMOkSlfakXq4kV5
	wnBaezocmzgqucWkYbA==
X-Google-Smtp-Source: AGHT+IHnP5D5jIrSu1MowxtGPxgs7iIxk2f407LGcpSQUVD1STRav2dMx9Q78owPYBl3WsGn6h8Fj/5DF5LS50Y=
X-Received: from wmben7.prod.google.com ([2002:a05:600c:8287:b0:458:c02c:3ccd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:24ca:b0:3b7:806e:7773 with SMTP id ffacd0b85a97d-3b900b50262mr11828930f8f.15.1754903671816;
 Mon, 11 Aug 2025 02:14:31 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:14:30 +0000
In-Reply-To: <20250808181155.223504-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250808181155.223504-1-dakr@kernel.org> <20250808181155.223504-4-dakr@kernel.org>
Message-ID: <aJm0duBjfWyZT3YJ@google.com>
Subject: Re: [PATCH v3 3/7] rust: alloc: implement VmallocPageIter
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 08, 2025 at 08:10:17PM +0200, Danilo Krummrich wrote:
> Introduce the VmallocPageIter type; an instance of VmallocPageIter may
> be exposed by owners of vmalloc allocations to provide borrowed access
> to the backing pages of the vmalloc allocation.
> 
> For instance, this is useful to access and borrow the backing pages of
> allocation primitives, such as Box and Vec, backing a scatterlist.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc/allocator.rs | 92 ++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index 2315f5063011..3ed2d5ff1e37 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -10,6 +10,7 @@
>  
>  use super::Flags;
>  use core::alloc::Layout;
> +use core::marker::PhantomData;
>  use core::ptr;
>  use core::ptr::NonNull;
>  
> @@ -236,3 +237,94 @@ unsafe fn realloc(
>          unsafe { ReallocFunc::KVREALLOC.call(ptr, layout, old_layout, flags) }
>      }
>  }
> +
> +/// An [`Iterator`] of [`page::BorrowedPage`] items owned by a [`Vmalloc`] allocation.
> +///
> +/// # Guarantees
> +///
> +/// The pages iterated by the [`Iterator`] appear in the order as they are mapped in the CPU's
> +/// virtual address space ascendingly.
> +///
> +/// # Invariants
> +///
> +/// - `buf` is a valid pointer to the beginning of a [`Vmalloc`] allocation.
> +/// - `size` is the size of the [`Vmalloc`] allocation `buf` points to.
> +pub struct VmallocPageIter<'a> {
> +    /// The base address of the [`Vmalloc`] buffer.
> +    buf: NonNull<u8>,
> +    /// The size of the buffer pointed to by `buf` in bytes.
> +    size: usize,
> +    /// The current page index of the [`Iterator`].
> +    index: usize,

My understanding is that an implementation using two pointers that
repeatedly increments the starting pointer until it reaches the end
pointer is more efficient.

Alice

> +    _p: PhantomData<&'a u8>,

Semantically, I think it would make sense to write

	PhantomData<page::BorrowedPage<'a>>

here.

> +}
> +
> +impl<'a> Iterator for VmallocPageIter<'a> {

We can implement size_hint() too.

> +    type Item = page::BorrowedPage<'a>;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let offset = self.index.checked_mul(page::PAGE_SIZE)?;
> +
> +        // Even though `self.size()` may be smaller than `Self::page_count() * page::PAGE_SIZE`, it
> +        // is always a number between `(Self::page_count() - 1) * page::PAGE_SIZE` and
> +        // `Self::page_count() * page::PAGE_SIZE`, hence the check below is sufficient.
> +        if offset < self.size() {
> +            self.index += 1;
> +        } else {
> +            return None;
> +        }
> +
> +        // TODO: Use `NonNull::add()` instead, once the minimum supported compiler version is
> +        // bumped to 1.80 or later.
> +        //
> +        // SAFETY: `offset` is in the interval `[0, (self.page_count() - 1) * page::PAGE_SIZE]`,
> +        // hence the resulting pointer is guaranteed to be within the same allocation.
> +        let ptr = unsafe { self.buf.as_ptr().add(offset) };
> +
> +        // SAFETY: `ptr` is guaranteed to be non-null given that it is derived from `self.buf`.
> +        let ptr = unsafe { NonNull::new_unchecked(ptr) };
> +
> +        // SAFETY:
> +        // - `ptr` is a valid pointer to a `Vmalloc` allocation.
> +        // - `ptr` is valid for the duration of `'a`.
> +        Some(unsafe { Vmalloc::to_page(ptr) })
> +    }
> +}
> +
> +impl<'a> VmallocPageIter<'a> {
> +    /// Creates a new [`VmallocPageIter`] instance.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `buf` must be a pointer to the beginning of a [`Vmalloc`] allocation.
> +    /// - `buf` points to must at least be valid for the lifetime of `'a`.
> +    /// - `size` must be the size of the [`Vmalloc`] allocation `buf` points to.
> +    pub unsafe fn new(buf: NonNull<u8>, size: usize) -> Self {
> +        // INVARIANT: `buf` is a valid pointer to the beginning of a `Vmalloc` allocation by the
> +        // safety requirements of this function.
> +        Self {
> +            buf,
> +            size,
> +            index: 0,
> +            _p: PhantomData,
> +        }
> +    }
> +
> +    /// Returns the base address of the backing [`Vmalloc`] allocation.
> +    pub fn base_address(&self) -> NonNull<u8> {
> +        self.buf
> +    }
> +
> +    /// Returns the size of the backing [`Vmalloc`] allocation in bytes.
> +    ///
> +    /// Note that this is the size the [`Vmalloc`] allocation has been allocated with. Hence, this
> +    /// number may be smaller than `[`Self::page_count`] * [`page::PAGE_SIZE`]`.
> +    pub fn size(&self) -> usize {
> +        self.size
> +    }
> +
> +    /// Returns the number of pages owned by the backing [`Vmalloc`] allocation.
> +    pub fn page_count(&self) -> usize {
> +        self.size().div_ceil(page::PAGE_SIZE)
> +    }
> +}
> -- 
> 2.50.1
> 
