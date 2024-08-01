Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E316DEC1
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500904; cv=none; b=NGXVcb8hLi8Vpffr22z+h8QkvHIHBNbayx6ZIhQO1pp3qGiV3VUgdfwABLSD+6pL8NN7Ajuu0JD8XfdpFCmLTBYFea/maGBz6VR3ThhEaoFWpqbK+ckr666m92eVIXVx8SwO2YzSGB+Rso6qa7klTzRRLWmgj0gr/GYdiar+UQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500904; c=relaxed/simple;
	bh=RtsW5WWTyWJIL27AcTCugxjnVd2s4/R7JlgMY9UajKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cG9a0PB6I2h9hv8A3k5VFudvidiq3VNFefo+dRV7tJDCag0o85BnnJPFT913it3mFpTj81FvN+5729mbXWBqoaN/zJ5/AiozCXmhsaHb8tTN9vZathgxbDCaGgS3qE0GjfEYeABDe2M8bzafDFv8ZlvgqZxfe+Q4FSdkKX/c3Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YQZI8ihF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YQZI8ihF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-426526d30aaso43969465e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722500901; x=1723105701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojSR7rF9TxK4zY2qobnr+4uxfHaQxVITngCaPWYPV8k=;
        b=YQZI8ihFNSfDuku64Ou9K51iGuJGc9zv4KQiuzEFSTLV7wzZb2/o8ualoN0uZUhAOz
         p4FNvGZusldlAW48l1BNIDnzwDD+G4BYgi/SU3cNuwVFjbpTa8FVD3+KxE7AJihirdC/
         l76t5G5JpFtItK+uhTdxZA3AykAUU40MaTpy3Xj++g8Yy7PN4Pkc56aaV//kEQzkRsXo
         +XOe3S5r+ICu40ueq/mxkN9acquy2oYHYYZbnTKQe4O1g9gVA/JIAaISjw5znvHVaK+/
         +dNBoGOM2qEWr9tm6P3u2P84cLoGtjYOi9WFSMLzDAtOMBef6eJipmL2d9iApNyutuMX
         6vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500901; x=1723105701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojSR7rF9TxK4zY2qobnr+4uxfHaQxVITngCaPWYPV8k=;
        b=X/9+USj23y6xj6Q4oypaB2vfrcNZT41F3cY/jXFTHriQ4DeSyaoh2pcSIAp/Z2v6za
         QEbsQWtNZEHTwH7zIp1GsRmFbIls6uLZtm2nfhgiUhnBQvunV1Te+vtIqtlF+LEUrX+k
         LJ2fOiE3y8CJ+cJonjTlt6+92MtfIiWPJcuWhoNdO9utgrxpZUNdvzSIdtgKutjvxnrE
         uY5Nf6i90zgSGSD49gJl0J6rI5Dx28ovv7eCCs7EDEQln75Y2XLbeWjV7h2yaxxleHPi
         U5X7kkbH3qYw0MWvZNmWOLN5vN980+YiOGH4Y3nBPrIr4S1JpndlMTa328nJudoTic52
         DTpg==
X-Forwarded-Encrypted: i=1; AJvYcCVZBwR4gnRVn7whfnp7LoJDNHy8K8ikQskh6Ie5/kN0EJtl285SiQ4TMp8ksV951S4KDQ+CUlQu3JMDDnpIR9UjlkOphuJanAd6ugEQX2g=
X-Gm-Message-State: AOJu0Yw40yDVjGUS1524N9HVnnuBWujOkALhdE4w/HffrGOGJDXCgZCS
	gKbZweP/GpAr1kpOhxjQPHeCh8+6RE1aIHEfgR2UFL9dUx6nSTKhqj9bjMYAyREnKzfM3UQ0cpJ
	PlYNrTB0koupfMIojndvkktfr871zVemKEh35
X-Google-Smtp-Source: AGHT+IFlHvNyLOkNGilTJsUR27sYt/UML/5/UGX3BBsKWn8Zf6ZLf3lpfWpigR7D708NAF2f+Zvc+KIKjlUVPpSpWME=
X-Received: by 2002:a05:6000:c0a:b0:367:9279:c401 with SMTP id
 ffacd0b85a97d-36baadef49fmr1115684f8f.34.1722500901119; Thu, 01 Aug 2024
 01:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-5-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-5-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 10:28:09 +0200
Message-ID: <CAH5fLggM5X7M9fTJE7C2afSHehK8b72XGKAgsEcn3Xm632s_Gg@mail.gmail.com>
Subject: Re: [PATCH v3 04/25] rust: alloc: implement `Allocator` for `Kmalloc`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
> +/// Returns a proper size to alloc a new object aligned to `new_layout`'=
s alignment.
>  fn aligned_size(new_layout: Layout) -> usize {

This comment could potentially be moved to the previous patch that
defined the function.

> +struct ReallocFunc(
> +    // INVARIANT: One of the following `krealloc`, `vrealloc`, `kvreallo=
c`.
> +    unsafe extern "C" fn(*const core::ffi::c_void, usize, u32) -> *mut c=
ore::ffi::c_void,
> +);

In this case, the comment would usually be formatted with markdown.

/// # Invariants
///
/// Must contain one of the following: `krealloc`, `vrealloc`, `kvrealloc`.

The // INVARIANT: syntax is used when constructing an instance to
argue why the documentented invariants are satisfied.

> +impl ReallocFunc {
> +    fn krealloc() -> Self {
> +        Self(bindings::krealloc)
> +    }

Technically this should have an // INVARIANT: explaining why the
invariants are satisfied by this new value.

> +
> +    // SAFETY: `call` has the exact same safety requirements as `Allocat=
or::realloc`.
> +    unsafe fn call(

Similarly to the above, the // SAFETY: syntax is used when arguing why
the preconditions are satisfied, but when explaining what the
preconditions are, we usually use this syntax instead:

/// # Safety
///
/// This method has the same safety requirements as `Allocator::realloc`.

> +        &self,
> +        ptr: Option<NonNull<u8>>,
> +        layout: Layout,
> +        flags: Flags,
> +    ) -> Result<NonNull<[u8]>, AllocError> {
> +        let size =3D aligned_size(layout);
> +        let ptr =3D match ptr {
> +            Some(ptr) =3D> ptr.as_ptr(),
> +            None =3D> ptr::null(),
> +        };
> +
> +        // SAFETY: `ptr` is valid by the safety requirements of this fun=
ction.
> +        let raw_ptr =3D unsafe {
> +            // If `size =3D=3D 0` and `ptr !=3D NULL` the memory behind =
the pointer is freed.
> +            self.0(ptr.cast(), size, flags.0).cast()
> +        };
> +
> +        let ptr =3D if size =3D=3D 0 {
> +            NonNull::dangling()
> +        } else {
> +            NonNull::new(raw_ptr).ok_or(AllocError)?
> +        };
> +
> +        Ok(NonNull::slice_from_raw_parts(ptr, size))
> +    }
> +}
> +
> +unsafe impl Allocator for Kmalloc {
> +    unsafe fn realloc(
> +        ptr: Option<NonNull<u8>>,
> +        layout: Layout,
> +        flags: Flags,
> +    ) -> Result<NonNull<[u8]>, AllocError> {
> +        let realloc =3D ReallocFunc::krealloc();
> +
> +        // SAFETY: If not `None`, `ptr` is guaranteed to point to valid =
memory, which was previously
> +        // allocated with this `Allocator`.
> +        unsafe { realloc.call(ptr, layout, flags) }
> +    }
> +}
> +
>  unsafe impl GlobalAlloc for Kmalloc {
>      unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
>          // SAFETY: `ptr::null_mut()` is null and `layout` has a non-zero=
 size by the function safety
> --
> 2.45.2
>
