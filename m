Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5203C1FDA78
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762560; cv=none; b=FigbwsKWy1FPdcmdXYB8bB/w2KryI4ouZASV2vJPMIqRXlxT15DIVEkp9bfmfURDR7OiAZj9Rv0JDboTlv4y6ddxys9IB69cv79ItWbGKQFBhYdpm0GZ6W0I4CmwR5iQ5jW+efA4gJTifK18M+HuTbcd2YSosqWvlTvmMGLcRBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762560; c=relaxed/simple;
	bh=TQSlXvhxvgp4lldhF2LN9kyKR3zMMzQlAYhZ/rX9H2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CArSxadZSt0NksH9jEuOVkN9vIg01sk/P1wxl8Ymz78nYuHTXG1G+3ohnhVW1fG1TteJ8g887a00yS8DlpkjW7Je3nBcdx8v84hhnwuD2Zs9OXUvloZnbMyTJ+XLp0TKchAgidrPjp+BtlwYB4FAddtOuQLrGeteL17qTwzoCpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SFC6CJH/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SFC6CJH/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so3526419f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 02:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736762557; x=1737367357; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruMIfgt8XeymWn0Xb8GRY3LQRisyMq2NBZDcNhsouqk=;
        b=SFC6CJH/GKDR0Yc/g6F3wVDY5yai88H86U1BbzGg9GOX8Y1FYSA0GLMbgSUSfV1WvU
         wn7QI8XkxqoVGN2OMNraE5aHhwiFQ9BynFbx2SCVwpuPG2/vPodNM4JgKvt8TXeyQXiq
         iZxaukyWodKMajivZ/jP1tRrbRsAUX7hz/unzX2YwYK/v9He13/k+XROIrpYy6/waCyT
         i2IIlA27i8fpDNXIZo3xM+CwCVRho8c3D0qpj8LqUr5ZWmRQWEgfR0dhl56INLzVqPDQ
         g4aJk49DqFQcJhuDv+qJzV46e5mdaryW9g9y79mQuacsinWBJOmpXfVNlTKyJmU6SgHL
         a4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762557; x=1737367357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruMIfgt8XeymWn0Xb8GRY3LQRisyMq2NBZDcNhsouqk=;
        b=Zh6nZ47SZeLzd8QV7z1J0+QUB0tdMpe67wNqpy/9jWfQXQRksDtIlM29f4YB6h1Ik+
         yad2dkpaedC0xOGFLqJW+C3EMjDSz8UW5zBzGIwCeZ8gu/56sopg0MrlbhyRUx2DNqed
         beW8kdKevKu0XvRMUcfsK2ogWINo3AQGatrroVrVzBYV/+Nnm6VuOLSY6whlyaVgzEm+
         PVitFRy+NyNDVVbBulAklOIR1QPiU1HjFo1twRhvZ+aNWVFn8DfWN4iBcbKjMEqOomvF
         Fq1SYMSq7DaDZQRkkx4PgR2vPz3KNa1CpIjHWqNPkrBFiWSA2l5MfHHQEw29pX07Jxhu
         aQvA==
X-Forwarded-Encrypted: i=1; AJvYcCUNmFSJb5eRAaceapH42i1trMWD50UbWgG78/CovLXQqw4yOR+8u8Ol1JUjWBZ2LDsExhLmX+0me+T39MlBfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9fhEnxHJEdzB22AfVz/2J5Mj9RUagLD9DjAIYz7HNx0YrckT
	9BDaDuPV9MaT++riX6VnQZcuutlMrdEg43+ZCPntttxGHyQLWeHhWnv5KKLlIFERzNlYI6SSqnj
	7d5qofeSCeMJgLroem5sZOortxQyjpite7tOR
X-Gm-Gg: ASbGncs2elMeaE3eAokjBakfngWJ0qif4ZICPg+3qqqEh/QjtGTeEKiBXYSYbsOani/
	L+9sTurtKtXb0isKvAhFb+9EIp6azyOwYsiRrIKMZeShB1EJo2u/UoYXgQTuk8QyDd10W
X-Google-Smtp-Source: AGHT+IGXYroCUwfW3rZ8JLd7wkjW88qfzhWvUhyaT8A7PZu/lBodxoUUkNKOlZdINTG+N767o/YqLm0vh6sHher8abs=
X-Received: by 2002:a5d:5f44:0:b0:386:3e3c:efd with SMTP id
 ffacd0b85a97d-38a8730fa79mr20090451f8f.44.1736762556541; Mon, 13 Jan 2025
 02:02:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <k0kNBzmNg_c8GHIFyjlyJfEpyRNoAIZZVM1n3zK2kVT1pScUOUpkePSltcN-CfRI2UpS0OIvEG7FBvkHhXYrAQ==@protonmail.internalid>
 <20241211-vma-v11-3-466640428fc3@google.com> <87o71bbys7.fsf@kernel.org>
In-Reply-To: <87o71bbys7.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jan 2025 11:02:24 +0100
X-Gm-Features: AbW1kvaU2mBVYi4r7g9TptFFdAf5JOsLMXkmiZb6_JeC32FLrxX_VQ5DF8tNs1s
Message-ID: <CAH5fLgjHhzRZnatgornai84iOVi2S07tosoKUVTGqWQ9-ggENQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/8] mm: rust: add vm_insert_page
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > The vm_insert_page method is only usable on vmas with the VM_MIXEDMAP
> > flag, so we introduce a new type to keep track of such vmas.
> >
> > The approach used in this patch assumes that we will not need to encode
> > many flag combinations in the type. I don't think we need to encode mor=
e
> > than VM_MIXEDMAP and VM_PFNMAP as things are now. However, if that
> > becomes necessary, using generic parameters in a single type would scal=
e
> > better as the number of flags increases.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/mm/virt.rs | 71 ++++++++++++++++++++++++++++++++++++++++++=
+++++++-
> >  1 file changed, 70 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/mm/virt.rs b/rust/kernel/mm/virt.rs
> > index 68c763169cf0..3a23854e14f4 100644
> > --- a/rust/kernel/mm/virt.rs
> > +++ b/rust/kernel/mm/virt.rs
> > @@ -4,7 +4,15 @@
> >
> >  //! Virtual memory.
> >
> > -use crate::{bindings, mm::MmWithUser, types::Opaque};
> > +use crate::{
> > +    bindings,
> > +    error::{to_result, Result},
> > +    mm::MmWithUser,
> > +    page::Page,
> > +    types::Opaque,
> > +};
> > +
> > +use core::ops::Deref;
> >
> >  /// A wrapper for the kernel's `struct vm_area_struct` with read acces=
s.
> >  ///
> > @@ -100,6 +108,67 @@ pub fn zap_page_range_single(&self, address: usize=
, size: usize) {
> >              )
> >          };
> >      }
> > +
> > +    /// Check whether the `VM_MIXEDMAP` flag is set.
>
> Perhaps "Check whether the `VM_MIXEDMAP` flag is set. If so, return
> `Some`, otherwise `None` ?

How about

If the `VM_MIXEDMAP` flag is set, returns a `VmAreaMixedMap` to this
VMA, otherwise returns `None`.

This follows the example of slice::as_ascii

> > +    ///
> > +    /// This can be used to access methods that require `VM_MIXEDMAP` =
to be set.
> > +    #[inline]
> > +    pub fn as_mixedmap_vma(&self) -> Option<&VmAreaMixedMap> {
> > +        if self.flags() & flags::MIXEDMAP !=3D 0 {
> > +            // SAFETY: We just checked that `VM_MIXEDMAP` is set. All =
other requirements are
> > +            // satisfied by the type invariants of `VmAreaRef`.
> > +            Some(unsafe { VmAreaMixedMap::from_raw(self.as_ptr()) })
> > +        } else {
> > +            None
> > +        }
> > +    }
> > +}
> > +
> > +/// A wrapper for the kernel's `struct vm_area_struct` with read acces=
s and `VM_MIXEDMAP` set.
> > +///
> > +/// It represents an area of virtual memory.
>
> Could we have a link to `VmAreaRef` and explain that this is a
> `VmAreaRef` with an additional requirement?

Ok.

> > +///
> > +/// # Invariants
> > +///
> > +/// The caller must hold the mmap read lock or the vma read lock. The =
`VM_MIXEDMAP` flag must be
> > +/// set.
> > +#[repr(transparent)]
> > +pub struct VmAreaMixedMap {
> > +    vma: VmAreaRef,
> > +}
> > +
> > +// Make all `VmAreaRef` methods available on `VmAreaMixedMap`.
> > +impl Deref for VmAreaMixedMap {
> > +    type Target =3D VmAreaRef;
> > +
> > +    #[inline]
> > +    fn deref(&self) -> &VmAreaRef {
> > +        &self.vma
> > +    }
> > +}
> > +
> > +impl VmAreaMixedMap {
> > +    /// Access a virtual memory area given a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `vma` is valid for the duration of 'a=
, and that the mmap read lock
> > +    /// (or stronger) is held for at least the duration of 'a. The `VM=
_MIXEDMAP` flag must be set.
> > +    #[inline]
> > +    pub unsafe fn from_raw<'a>(vma: *const bindings::vm_area_struct) -=
> &'a Self {
> > +        // SAFETY: The caller ensures that the invariants are satisfie=
d for the duration of 'a.
> > +        unsafe { &*vma.cast() }
> > +    }
> > +
> > +    /// Maps a single page at the given address within the virtual mem=
ory area.
> > +    ///
> > +    /// This operation does not take ownership of the page.
> > +    #[inline]
> > +    pub fn vm_insert_page(&self, address: usize, page: &Page) -> Resul=
t {
> > +        // SAFETY: The caller has read access and has verified that `V=
M_MIXEDMAP` is set. The page
> > +        // is order 0. The address is checked on the C side so it can =
take any value.
>
> Maybe something like this: "By the type invariant of `Self` caller has re=
ad
> access and has verified that `VM_MIXEDMAP` is set. By invariant on
> `Page` the page has order 0."

Ok.

Alice
