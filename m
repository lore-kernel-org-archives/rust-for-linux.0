Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583D71A4884
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722523082; cv=none; b=RKxlpdUpW/HS51AtTYT3hwWQEId2MaPt1B7hhVgDR3lwnC3jS1EVF2KlV6/E1BJiwV3Q7cPOXdShXRt97V7OfTyv2o/anLjY6fUIpeQ5SQKbZ3OMUf0Cvnkdhyj7/iQTTuJBYDCqa5fjkzmHqUed2oWfwSpdDn9zLDCW2Z2uomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722523082; c=relaxed/simple;
	bh=f0ugnK1TIOoTp3DdXXhgdOoXgyAgb/Sqc2fmFnzgHZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cwl579eApZwIBajP97nFJLMxXX/y7mTwJlUvA+UJX0ENSkesqV65t/sweaCCc5fEtAix4ZzdnnSjh0W+4mTP/ynUqBC6qtoaohV36HOnYQgQF6+p6pd0zXuKxqO3bqIBMQ0muWIJmi9JaQcM64CQ9h1YbDtAPLQFp59OlVT8+bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yQTYGI36; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yQTYGI36"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7a264a24ea7so4658956a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722523078; x=1723127878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYrfw+mQ2Y9ZAJL6SkIKQchY5Op0ff4hPWkSjHPxYXQ=;
        b=yQTYGI36Ja1KzemzXkiNHO92or9KEijeG/hU/qrBoVhWzK07XU+xOvdV6pcDpayBU2
         9FQzx3KbYHhyzsvo6E12QWING34o0QjC1A31m57d8qqsMHClBHNoEe496CPDI8/dW/k3
         NHQbUTSdKlQyS+hIqQ+c9H0132Rp7oAU8NM8jTIEQL4so076HIkTKNvgupTVFiX8CwJF
         QzlhqrdOqCZRFDsIcUaTzvkV8eYrlFSStywO666AOMmY+USHTQXxK04DrQUSXcirnqLp
         DijjnKmLNSeXuM9uzKNngp824NlNukljBbb+SgxI2R9QLCL9qN8sAL5yZiTY1ud/ortb
         WpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722523078; x=1723127878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYrfw+mQ2Y9ZAJL6SkIKQchY5Op0ff4hPWkSjHPxYXQ=;
        b=SxYFi3ksekqrfGT500hNVmGG7Io6WFKyw3T/vLP35sHo2/becWBkjeuckt9F+HmCzg
         kdcP53JIvu1i9XdGsZx3febbsE1OGmlwJOlM8giLgSzD/2NISg4aNqy31cmKSCM1+siI
         6aSR0xCWZQHO/NqBroaW+ZafPbD+r/9QWIS9XO5A9X0E89ErbQI0eIjTxhdssfY85D4j
         4zeEb73kIBuR+As/aMlM6apGNtQdNWHblTtyq1WBKLnaNNhBsn2ZkdgS3mqJBvRt0y1x
         RQwqmfaDphofTbMmOdKLuJcGMOmpL23RAupu3RiifUfuk8A2Owg66kCdqGvlvBraffgQ
         nECQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZdAiGvC/L2ypHrG4fjyQ5WRoyeN237HbL3U6V1z/rZGO2cauA/LxA4/kZXi4jTppV/YXyLXq6GbdhOLWNK7obLE8yabUI8X8ZHNc8Drw=
X-Gm-Message-State: AOJu0YzmY6+8frGwVIjuz7Fx3aVm7SLYKUsaH6SAMDa33iB/datPGJfR
	Cft4W9K/8qLvwTDRfQEmBzHWw5ZRfK02WPpOfR7k5hkNm7Blc4o/ilO/V8zAkYJgQaQWR9N4m9T
	0pfi23YOJ3QrpmTs36p6xWcYVS2zScGGOL2PS
X-Google-Smtp-Source: AGHT+IGM5tes2Q681ojbEa3ua0VZNkscR8OWXhPYOXiLRwQM1msyp12e3tEEXA8kn5ispLVIwVd36W3PDg6lAjJIyQs=
X-Received: by 2002:a17:90b:1652:b0:2cb:55f9:b7c5 with SMTP id
 98e67ed59e1d1-2cff9415bbfmr467895a91.12.1722523078128; Thu, 01 Aug 2024
 07:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-vma-v3-1-db6c1c0afda9@google.com> <82e4816c-cada-46f3-bebf-882ae8ded118@proton.me>
In-Reply-To: <82e4816c-cada-46f3-bebf-882ae8ded118@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 16:37:44 +0200
Message-ID: <CAH5fLgi__fgLnifj3ON9iNyugnUzm82VWWduO3Ds6Hz54H1ZWQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: mm: add abstractions for mm_struct and vm_area_struct
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matthew Wilcox <willy@infradead.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 4:02=E2=80=AFPM Benno Lossin <benno.lossin@proton.me=
> wrote:
>
> On 01.08.24 14:58, Alice Ryhl wrote:
> > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> > new file mode 100644
> > index 000000000000..ed2db893fb79
> > --- /dev/null
> > +++ b/rust/kernel/mm.rs
> > @@ -0,0 +1,337 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Google LLC.
> > +
> > +//! Memory management.
> > +//!
> > +//! C header: [`include/linux/mm.h`](../../../../include/linux/mm.h)
> > +
> > +use crate::{
> > +    bindings,
> > +    types::{ARef, AlwaysRefCounted, Opaque},
> > +};
> > +
> > +use core::{
> > +    ops::Deref,
> > +    ptr::{self, NonNull},
> > +};
> > +
> > +pub mod virt;
> > +
> > +/// A wrapper for the kernel's `struct mm_struct`.
> > +///
> > +/// Since `mm_users` may be zero, the associated address space may not=
 exist anymore. You must use
>
> Can it also be the case that the space never existed to begin with? Then
> I would write "the associated address space may not exist."
>
> Also I think it makes more sense to use "You can use [`mmget_not_zero`]
> to be able to access the address space." instead of the second sentence.

I'm not sure if it can be the case that the space never existed, but
I'll reword.

> > +/// [`mmget_not_zero`] before accessing the address space.
> > +///
> > +/// The `ARef<Mm>` smart pointer holds an `mmgrab` refcount. Its destr=
uctor may sleep.
> > +///
> > +/// # Invariants
> > +///
> > +/// Values of this type are always refcounted.
>
> Would be good to record the refcount used in the invariant.

Ok.

> > +///
> > +/// [`mmget_not_zero`]: Mm::mmget_not_zero
> > +pub struct Mm {
> > +    mm: Opaque<bindings::mm_struct>,
> > +}
> > +
> > +// SAFETY: It is safe to call `mmdrop` on another thread than where `m=
mgrab` was called.
> > +unsafe impl Send for Mm {}
> > +// SAFETY: All methods on `Mm` can be called in parallel from several =
threads.
> > +unsafe impl Sync for Mm {}
> > +
> > +// SAFETY: By the type invariants, this type is always refcounted.
> > +unsafe impl AlwaysRefCounted for Mm {
> > +    fn inc_ref(&self) {
> > +        // SAFETY: The pointer is valid since self is a reference.
> > +        unsafe { bindings::mmgrab(self.as_raw()) };
> > +    }
> > +
> > +    unsafe fn dec_ref(obj: NonNull<Self>) {
> > +        // SAFETY: The caller is giving up their refcount.
> > +        unsafe { bindings::mmdrop(obj.cast().as_ptr()) };
> > +    }
> > +}
> > +
> > +/// A wrapper for the kernel's `struct mm_struct`.
> > +///
> > +/// This type is used only when `mm_users` is known to be non-zero at =
compile-time. It can be used
>
> I find the "This type is used only when" a bit weird, what about "Like
> an [`Mm`], but with non-zero `mm_users`."?

Will reword.

> > +/// to access the associated address space.
> > +///
> > +/// The `ARef<MmWithUser>` smart pointer holds an `mmget` refcount. It=
s destructor may sleep.
> > +///
> > +/// # Invariants
> > +///
> > +/// Values of this type are always refcounted. The value of `mm_users`=
 is non-zero.
> > +#[repr(transparent)]
> > +pub struct MmWithUser {
> > +    mm: Mm,
> > +}
> > +
> > +// SAFETY: It is safe to call `mmput` on another thread than where `mm=
get` was called.
> > +unsafe impl Send for MmWithUser {}
> > +// SAFETY: All methods on `MmWithUser` can be called in parallel from =
several threads.
> > +unsafe impl Sync for MmWithUser {}
> > +
> > +// SAFETY: By the type invariants, this type is always refcounted.
> > +unsafe impl AlwaysRefCounted for MmWithUser {
> > +    fn inc_ref(&self) {
> > +        // SAFETY: The pointer is valid since self is a reference.
> > +        unsafe { bindings::mmget(self.as_raw()) };
> > +    }
> > +
> > +    unsafe fn dec_ref(obj: NonNull<Self>) {
> > +        // SAFETY: The caller is giving up their refcount.
> > +        unsafe { bindings::mmput(obj.cast().as_ptr()) };
> > +    }
> > +}
> > +
> > +// Make all `Mm` methods available on `MmWithUser`.
> > +impl Deref for MmWithUser {
> > +    type Target =3D Mm;
> > +
> > +    #[inline]
> > +    fn deref(&self) -> &Mm {
> > +        &self.mm
> > +    }
> > +}
> > +
> > +/// A wrapper for the kernel's `struct mm_struct`.
> > +///
> > +/// This type is identical to `MmWithUser` except that it uses `mmput_=
async` when dropping a
> > +/// refcount. This means that the destructor of `ARef<MmWithUserAsync>=
` is safe to call in atomic
> > +/// context.
>
> Missing Invariants.

Hmm. Structs will inherit invariants from their fields, no?

> > +#[repr(transparent)]
> > +pub struct MmWithUserAsync {
> > +    mm: MmWithUser,
> > +}
> > +
> > +// SAFETY: It is safe to call `mmput_async` on another thread than whe=
re `mmget` was called.
> > +unsafe impl Send for MmWithUserAsync {}
> > +// SAFETY: All methods on `MmWithUserAsync` can be called in parallel =
from several threads.
> > +unsafe impl Sync for MmWithUserAsync {}
> > +
> > +// SAFETY: By the type invariants, this type is always refcounted.
> > +unsafe impl AlwaysRefCounted for MmWithUserAsync {
> > +    fn inc_ref(&self) {
> > +        // SAFETY: The pointer is valid since self is a reference.
> > +        unsafe { bindings::mmget(self.as_raw()) };
> > +    }
> > +
> > +    unsafe fn dec_ref(obj: NonNull<Self>) {
> > +        // SAFETY: The caller is giving up their refcount.
> > +        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
> > +    }
> > +}
> > +
> > +// Make all `MmWithUser` methods available on `MmWithUserAsync`.
> > +impl Deref for MmWithUserAsync {
> > +    type Target =3D MmWithUser;
> > +
> > +    #[inline]
> > +    fn deref(&self) -> &MmWithUser {
> > +        &self.mm
> > +    }
> > +}
> > +
> > +// These methods are safe to call even if `mm_users` is zero.
> > +impl Mm {
> > +    /// Call `mmgrab` on `current.mm`.
> > +    #[inline]
> > +    pub fn mmgrab_current() -> Option<ARef<Mm>> {
> > +        // SAFETY: It's safe to get the `mm` field from current.
> > +        let mm =3D unsafe {
> > +            let current =3D bindings::get_current();
> > +            (*current).mm
> > +        };
> > +
> > +        let mm =3D NonNull::new(mm)?;
> > +
> > +        // SAFETY: We just checked that `mm` is not null.
> > +        unsafe { bindings::mmgrab(mm.as_ptr()) };
> > +
> > +        // SAFETY: We just created an `mmgrab` refcount. Layouts are c=
ompatible due to
> > +        // repr(transparent).
> > +        Some(unsafe { ARef::from_raw(mm.cast()) })
> > +    }
> > +
> > +    /// Returns a raw pointer to the inner `mm_struct`.
> > +    #[inline]
> > +    pub fn as_raw(&self) -> *mut bindings::mm_struct {
> > +        self.mm.get()
> > +    }
> > +
> > +    /// Obtain a reference from a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that `ptr` points at an `mm_struct`, an=
d that it is not deallocated
> > +    /// during the lifetime 'a.
> > +    #[inline]
> > +    pub unsafe fn from_raw_mm<'a>(ptr: *const bindings::mm_struct) -> =
&'a Mm {
>
> Why not just `from_raw`?

See response to Danilo.

Alice
