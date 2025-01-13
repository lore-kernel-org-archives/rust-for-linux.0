Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E3235C06
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762028; cv=none; b=KxjY3DQlKbqcAUp+cazJxq2mpfBEA77z6wLzHYB2bZp231jFpiuunysEDp0hYTEpLFU+TrehwK03BTj0EtkcaZW95pVKSINEtIxD4sxZsziOcPnyXftk+uS40C0n4ixLaC/CYp/zKDrfFdn8r/ggfgtJrtvVMvI7VKfbtDnCdQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762028; c=relaxed/simple;
	bh=MuMyQNe9G4oBl8mxSFxlYFrMsTZfAteByXjGONogci8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pv9SpyBK6Yj7TKQfjDDhOiNYwITW3TEXnrbq6lHUFv/6SR8FkzMuo7n+sn/T5yfmbknWZ74UWEtcOcY+K4Dd9x++FD/xlV58kQghSiOEzVtKQ2TjXO0sbn3oMATcWaCO6cxVVCdtT0VSdPgzG07zr8SpnNKRrC4aTRR2TgKbG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZTc1+KOO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZTc1+KOO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38634c35129so2816653f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 01:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736762025; x=1737366825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUBuuW0iN8+68G1t2fhNy1Pe5LKA8AnUkEmaZ59Pybs=;
        b=ZTc1+KOOOpm4zWeXq6RvnhZCQVAuC3WUQvzHw0uuyz0r27TiwiRxbpQyTkF/EpUXb5
         iNuZwIE4wFdCJmxf+9DvmGeJhAvAkezjzYo9ZUI4PmWlNWQ3mkDi+wqSTlRDqewfLtxO
         DOA8/vQaqieN3wYJKXrUwmnOhVn2FUIzY0J2pTbwbdRV41H5nkINhwbGSR7Wx3fl1keh
         d6cr78oAJFMis5vgYY3vGCo5TrKJnWuLMfh046w18ouEFHs4Nu25n919mBfbAgUG+1aE
         nL1RrtfG/faDcqSHR6xnRRttPKrG1lbqf1iv3pkiLhW5e7SX67uTkzUc8wo22z2ta0jK
         Jkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736762025; x=1737366825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUBuuW0iN8+68G1t2fhNy1Pe5LKA8AnUkEmaZ59Pybs=;
        b=MLFuw5YXs39xV7yzXJiiun9NC/NYNJFgRydWc2MbzTYsZW1jw938FHmqbEghhnMyxJ
         KYBm5SdfCD9kJ9jXXsiIPX0e1b0uGjjq7YSJS/UO+ujnycky1I6xAY0e2/U2v2oFJxbQ
         TPgfi9rSABiNuvAh/URJiW8Ae02NU43Yr6ji2ujqC/0/HNZOC3ONC6nC6Ar75puIaie6
         9di3uw0kmVvdqHjnVfCCWTTSqdfyzJG+oCYa7miKQWt8Fmj5QcfatmO/kzaFuaEoCYoK
         rwQh47hG7qjUflkOx/Xs29zHY8/80P9o31D2NA7YKDG9CiiZWmEwdAzRJiXjIQu79VmE
         KDXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtQDSsyvtSsR2evrDyyemrigTEpsjY5dNYGzChrLQOJxQYZVd9n5RDw4WXWDlZ6q87JQIQe3sS5nxkj1I5EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqP+oI7uh6PFPJrrD3z3Cz2fyVGJ5JzXcTl9qfaj6mR5sWWgtL
	3tVvKaseDwANGnke8fjTvaCZcdBwIJ+7yInEsXtQo+CMzBUhFVc43UVlkYywn/H6zyxLyxKwTSj
	qQgUwRlpG8OcVzQSEfpPFRKK4C9FZ86uSh7Sf
X-Gm-Gg: ASbGnctV0TpA3lr5hzt66RsXuEAsc3m4XifgzqfkT1q4QdAjNvVLQ2haWwpv3AmZPJO
	h8V5gT7PDhoztwNijIZknMXFIBm4+e1+uFvcQde0cW5gn8qp0dLGsihEGiB0sHJI+HjrO
X-Google-Smtp-Source: AGHT+IEQqMabAkD1+qyAoHLAVyPwUyYMSvNjSOuAZSZQySc785S9sxkR7vreXAsH6CGRA3/89aZiuj6FuSw0G3T1gEY=
X-Received: by 2002:a05:6000:1445:b0:385:df6d:6fc7 with SMTP id
 ffacd0b85a97d-38a8730ce5amr19322756f8f.25.1736762024963; Mon, 13 Jan 2025
 01:53:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <ZzO0HNA5jlZZgU1ib_SP36HWHny8QNidES3cXM_ogVTtqArMPzPfDlQCFslPrZAVESJzfzFOVfOkoZHKiG-ivQ==@protonmail.internalid>
 <20241211-vma-v11-1-466640428fc3@google.com> <878qsfdftg.fsf@kernel.org>
In-Reply-To: <878qsfdftg.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jan 2025 10:53:33 +0100
X-Gm-Features: AbW1kvYo1SEI0t_S31-KQLibOnyOcXxKtrqq6xo8-o7-XZyUD1sjn3nZMe3yW3M
Message-ID: <CAH5fLginc=uNPVp1-T-oBrgtE1oi_cBMd65sPkDgqSDjH_CNfA@mail.gmail.com>
Subject: Re: [PATCH v11 1/8] mm: rust: add abstraction for struct mm_struct
To: Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?us-ascii?Q?=3D=3Fus-ascii=3FQ=3F=3D3D?= =?us-ascii?Q?=3D3Futf-8=3D3FQ=3D3FBj=3D3DC3=3F=3D_=3D=3Fus-ascii=3FQ=3F?= =?us-ascii?Q?=3D3DB6rn=3D3F=3D3D=3F=3D?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 3:50=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > These abstractions allow you to reference a `struct mm_struct` using
> > both mmgrab and mmget refcounts. This is done using two Rust types:
> >
> > * Mm - represents an mm_struct where you don't know anything about the
> >   value of mm_users.
> > * MmWithUser - represents an mm_struct where you know at compile time
> >   that mm_users is non-zero.
> >
> > This allows us to encode in the type system whether a method requires
> > that mm_users is non-zero or not. For instance, you can always call
> > `mmget_not_zero` but you can only call `mmap_read_lock` when mm_users i=
s
> > non-zero.
> >
> > It's possible to access current->mm without a refcount increment, but
> > that is added in a later patch of this series.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/helpers/helpers.c |   1 +
> >  rust/helpers/mm.c      |  39 +++++++++
> >  rust/kernel/lib.rs     |   1 +
> >  rust/kernel/mm.rs      | 219 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 260 insertions(+)
> >
> > diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> > new file mode 100644
> > index 000000000000..84cba581edaa
> > --- /dev/null
> > +++ b/rust/kernel/mm.rs
> > @@ -0,0 +1,219 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Google LLC.
> > +
> > +//! Memory management.
>
> Could you add a little more context here?

How about this?

//! Memory management.
//!
//! This module deals with managing the address space of userspace
processes. Each process has an
//! instance of [`Mm`], which keeps track of multiple VMAs (virtual
memory areas). Each VMA
//! corresponds to a region of memory that the userspace process can
access, and the VMA lets you
//! control what happens when userspace reads or writes to that region
of memory.
//!
//! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)

> > +//!
> > +//! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
> > +
> > +use crate::{
> > +    bindings,
> > +    types::{ARef, AlwaysRefCounted, NotThreadSafe, Opaque},
> > +};
> > +use core::{ops::Deref, ptr::NonNull};
> > +
> > +/// A wrapper for the kernel's `struct mm_struct`.
>
> Could you elaborate the data structure use case? When do I need it, what
> does it do?

How about this?

/// A wrapper for the kernel's `struct mm_struct`.
///
/// This represents the address space of a userspace process, so each
process has one `Mm`
/// instance. It may hold many VMAs internally.
///
/// There is a counter called `mm_users` that counts the users of the
address space; this includes
/// the userspace process itself, but can also include kernel threads
accessing the address space.
/// Once `mm_users` reaches zero, this indicates that the address
space can be destroyed. To access
/// the address space, you must prevent `mm_users` from reaching zero
while you are accessing it.
/// The [`MmWithUser`] type represents an address space where this is
guaranteed, and you can
/// create one using [`mmget_not_zero`].
///
/// The `ARef<Mm>` smart pointer holds an `mmgrab` refcount. Its
destructor may sleep.

> > +///
> > +/// Since `mm_users` may be zero, the associated address space may not=
 exist anymore. You can use
> > +/// [`mmget_not_zero`] to be able to access the address space.
> > +///
> > +/// The `ARef<Mm>` smart pointer holds an `mmgrab` refcount. Its destr=
uctor may sleep.
> > +///
> > +/// # Invariants
> > +///
> > +/// Values of this type are always refcounted using `mmgrab`.
> > +///
> > +/// [`mmget_not_zero`]: Mm::mmget_not_zero
> > +#[repr(transparent)]
> > +pub struct Mm {
>
> Could we come up with a better name? `MemoryMap` or `MemoryMapping`?. You
> use `MMapReadGuard` later.

Those names seem really confusing to me. The mmap syscall creates a
new VMA, but MemoryMap sounds like it's the thing that mmap creates.

Lorenzo, what do you think? I'm inclined to just call it Mm since
that's what C calls it.

Alice
