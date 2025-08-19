Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3105F334707
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604129; cv=none; b=lf7vSlE1hQiW/E/kyzYHYA/AR5Ogj7EeIU/TSvL4RtNyaFpheDWKaQxPpW2XNHxUPnccQPkJ93wJDJKvHGDG4p+3Dzwm7bJ2ILb1npAdnzZvI8Xq20GFWlUeLDWMmVuUGpWnk55ZGN+DyRPtB1gtlfn345iG2HiuCXjPhlyDgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604129; c=relaxed/simple;
	bh=zuMsmj0homhy84JFEbF0ilrCnkcrjECzT0Zu5MB2jls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X02DywCW3Drrje0bRGWLVa1HCMUNDZ4x96oYgPwNM81O83eq9EMG+oNqrNzlw6omO5l1cGLCzxx6jNot1JeXpKeLYgRfegEZQeAnNi9j830U+IkyRyukoZu32UP3ookzan9JmDLsBYxyqFImMddVF8TfGCKwVnF4cOVGfribU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jHDBjMSW; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jHDBjMSW"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1b0045a0so27083005e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 04:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755604125; x=1756208925; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xm4xJRYmVeBSPHc8/tB2tSVcBiRqjj3w8kENrdSBu8Y=;
        b=jHDBjMSWr7nzfVJlO64TfL0BMBrnFQBaxQnhQul1zMu8bBnjvZosRsHWIHvJeJlJPn
         XEjxliOX1eqie6753OlwhLriaFJQV1tjmOddGRLlea1guh0TQdokmddqpu0NEyHeyX0O
         h2CXG3TjVfcH1RqHN1bsYL6aBAKfdazMQFLJ3iPqsPbeMd0y6VxH1R3J/DtTXfMMr7bx
         PV3l30tAPshn4AVmf17XZDS8Zh6uAtXAU3jScVgC0GZpMHLKOCEb7fjcdOD0ClJ9lML9
         A2GRrJ5c5uI3SzSwPBvpYfK60KuJ9K30rec76tbyy5L553W609MayV66YPXm7oktdJAz
         /caA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604125; x=1756208925;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xm4xJRYmVeBSPHc8/tB2tSVcBiRqjj3w8kENrdSBu8Y=;
        b=P4T8H7MliJyJzy14L0mxnejsM7VmrB0sPHc4MvbLH8YagXGUYtbsWqjhGuHRgybrvG
         tYhzFSQEQ8o56zzyoapJDXtwfQIxGDTn0xbQ/QI5qTabS3h0gRkUq0Wz6AeiyM/y2Duq
         ME3HQU9S0JfYBU+1wFNFTKCS4ARKd/vuVIdzDp4/f5bZrHNRSBUfQ5dJpI8NYVm5f/2l
         aH4dJbdjtGowofIUfgJ4zU6wNoEXDtS60qUK6cVz1l5eBAxx9vKYFlFsafZEC2vcb1zM
         kqeuqNPWrkKzgWAvEcMLrKXcwUxF6pg3h1ocYhcoMUCZDyQqp8XaobzDVb0FWO5Hw7u7
         VrQg==
X-Forwarded-Encrypted: i=1; AJvYcCV0Utl1H5jvkmhe1ym/HMWAqvQUMtb8RxL5xYOjR01Rpm+qdbcvEvOAtG61Biea04p+9WtEPWa6iG0WccwxMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5kroqjduDrYYjsDbu5OzE3g6GWhhDw6e2gQzIB5o8uJTq6dr
	iAgS/pMt4C3RaQOufSMzQuQDJUG0JfuaOQXpjwZzzEJKYxwZLvnu1lbSb5THa2bsjSLLusOXJMo
	b8EKuPcJ0hMveSqwSgA==
X-Google-Smtp-Source: AGHT+IHnrHSocaWSpjt1yxbhJ1GhajeO+0CiIJnVE093eVsKYAGItQKwEix5fVfhaUcYBLTtnuXKKyhQz6Ga3Ow=
X-Received: from wmbeq12.prod.google.com ([2002:a05:600c:848c:b0:459:db29:1efa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4308:b0:3b9:12d5:168f with SMTP id ffacd0b85a97d-3c0ebbd2b48mr1481989f8f.30.1755604125197;
 Tue, 19 Aug 2025 04:48:45 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:48:44 +0000
In-Reply-To: <20250814093427.19629-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250814093427.19629-1-dakr@kernel.org> <20250814093427.19629-4-dakr@kernel.org>
Message-ID: <aKRknP8HT-BrPok4@google.com>
Subject: Re: [PATCH v4 3/7] rust: alloc: implement VmallocPageIter
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Aug 14, 2025 at 11:33:42AM +0200, Danilo Krummrich wrote:
> Introduce the VmallocPageIter type; an instance of VmallocPageIter may
> be exposed by owners of vmalloc allocations to provide borrowed access
> to the backing pages of the vmalloc allocation.
> 
> For instance, this is useful to access and borrow the backing pages of
> allocation primitives, such as Box and Vec, backing a scatterlist.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Some nits below, but:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/alloc/allocator.rs | 98 ++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index 2315f5063011..5cff3069bff4 100644
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
> @@ -236,3 +237,100 @@ unsafe fn realloc(
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
> +    _p: PhantomData<page::BorrowedPage<'a>>,
> +}
> +
> +impl<'a> Iterator for VmallocPageIter<'a> {
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
> +
> +    fn size_hint(&self) -> (usize, Option<usize>) {
> +        let remaining = self.page_count().saturating_sub(self.index);
> +
> +        (remaining, Some(remaining))
> +    }
> +}
> +
> +impl<'a> VmallocPageIter<'a> {
> +    /// Creates a new [`VmallocPageIter`] instance.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `buf` must be a pointer to the beginning of a [`Vmalloc`] allocation.

It has to be the beginning of the vmalloc allocation?

> +    /// - `buf` points to must at least be valid for the lifetime of `'a`.

This grammar doesn't quite compute for me.

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

How about #[inline] on all these?

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
