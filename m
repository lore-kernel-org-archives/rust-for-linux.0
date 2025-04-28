Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDED253B43
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Apr 2025 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835719; cv=none; b=f0om39MaotqnK5OXAV1h/L/xv1mDBUxZZ22vbcpKEciVJLE1O7lCWVgbf5nphDUS0Y3LW5pFgeW63vA/ggsexDqHlQCnY4VBmOeQCPxQMw3l+C4B6k8KJBfWokrVgnUMiJomMdlSahnjmuggpWq+/Isz6+YUGfl359aSUDUokZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835719; c=relaxed/simple;
	bh=u2FSLsCB3A4fJWVoj+5kQ0jgKhEFe32eSp6XHofRZzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeCskjcdsNip5p8sYI7/+iinSgMgjWzJKEuHWXHIF6IjxTqsF6dPSHCHWdE5kX1Tyl/nksI1UC7VyUIW0SbKxvv5TnuvBh9G4bea6x6SN6IwL8V9oMdRFUE/LJgDPZojqrPM2fRsWtTJxx3EXEVsbTc7bDwMF2nfQytfhyMBz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XvLkgeIU; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XvLkgeIU"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f9832f798aso3706252b6e.2
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Apr 2025 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745835716; x=1746440516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jbI9ciy9Vn6xR4JtLky4McErFUG8R91ldVXVx/kisk=;
        b=XvLkgeIUAh7qqw/A3JQWBx4vZK62ScIZNC0tz/HwmpbN6mMv5zjCksD3YZW/bM5FXR
         ITxFxjAHP14Z8xi8WwRf0AfhCVOc9bhaPSqlX9XkQ6RtJMFyBBFfgYxuDmDC/2rwrg9U
         zZmEyovY9YGK+hs0t6PnR5L2jUdlGNJMLxGWCa5HfLDxRHNFfSIaQ0TWKAcqwtUZw+XW
         UBMBLSGYdWTUa/j3rXJ3WcB8Ia+ELKRtUPfs/SG+4gugLAQ1qPjLWQYnZJwSjeFJBRIn
         ufz1ZJl5+CIILfZdtsocLW7BzdnTiJmQ8DbcCU/NUUqOa7MNQcxdhTe+I3dQsfyiUs3z
         OXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835716; x=1746440516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jbI9ciy9Vn6xR4JtLky4McErFUG8R91ldVXVx/kisk=;
        b=mbFgdaNcJFErGe8pGdFaJoE6HTjwO3Ngy6EUbgr9IAY+3oBtHJuAYJMXxnWtQ176r4
         CW/uYO/NpH1R9GcJtP1pknxilEAyenpWk620wsoXpGCUYCcjSXU3NCMVAWs4b0kxWu38
         kvy/ccx70eIW9f3qqwpy17g+yIe+FkdQ8+Sd/t3s95UlScO9PQEyui1kC+c/UK3wG4gl
         a/5MuIoQJdamQ0dTtfxWddAPijAeHY+fCXsYljXBgPwsSfMSHkt7YHiIRFJF9LrOp33+
         pDbprDXRiuSsmVHpeMBlpv0Zg3FSKlOgFsNd0Xuw9KAyZOo93MFhAV3TOjMLOxdjEWxd
         /v3g==
X-Forwarded-Encrypted: i=1; AJvYcCVuMrUshjU4yc8TbGqseWhob4BMLSU0cNp87vKskvdFwoBDzRUsm6c3k0WtQUp706CcERWARt489hLjmKcPPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSoaeLeBZ3wkb/NpFG56/3Qw6To8VD7ec+3El4NIoNjcF4FRf
	1NbVB0HcCGLxDej1tiQDFP5pxxxn1M2hFuc5jmjMu5QDbsPrE3dCaMHMBOthfxPD7ooRJJhdJiz
	75GikvCN2sycngw1VHmj5JKo4rnQTZbgomM5y
X-Gm-Gg: ASbGncv8bhkUQsSYcjCOZk/+yJC1K/rFcIt8w7re3hqrHivHamN5p7+Jso+bUcOecc+
	JLTvbLRFVMZKu3njQVoPTRwVLaWna4KLccWr9u5QeiDnRdcZGpYeNPOXV3z24uLm6bQTvuKFdrz
	pboJ5dbp248yfmdjjP7DPFw3vlF7WOXt1Yd6SRRDSie7z4lrT6d7Fo
X-Google-Smtp-Source: AGHT+IGj3Exgsxm3rRebRdaVBypLCiV4iNylnkVfLJBMXpFpf9Ow4ZNo5JdtIkIzXwPsd7cgweVmv3Mif+G+uFxC0Ic=
X-Received: by 2002:a05:6808:6a98:b0:3f9:43dd:a031 with SMTP id
 5614622812f47-401f28cb3e7mr6423598b6e.27.1745835710305; Mon, 28 Apr 2025
 03:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <20250423134344.3888205-5-bqe@google.com>
 <aAkZZd8QRXKejVV0@yury>
In-Reply-To: <aAkZZd8QRXKejVV0@yury>
From: Burak Emir <bqe@google.com>
Date: Mon, 28 Apr 2025 12:21:38 +0200
X-Gm-Features: ATxdqUHJWxUZkueRhnE83ItOCbm4yQKlF2iZnrGfX5q-ft-JahPeuSfU-OHeLAI
Message-ID: <CACQBu=VBvxyNvwSV8_gMuqNv49Ht+7aiUZwHD9Xh-TGoMTQQsw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] rust: add bitmap API.
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 6:46=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Wed, Apr 23, 2025 at 01:43:35PM +0000, Burak Emir wrote:
> >
> > Provides an abstraction for C bitmap API and bitops operations.
> > We follow the C Bitmap API closely in naming and semantics, with
> > a few differences that take advantage of Rust language facilities
> > and idioms:
> >
> >   * not all operations are exposed yet, to avoid dead code. This commit
> >     includes enough to implement an Android Binder data structure that
> >     was introduced in commit 15d9da3f818c ("binder: use bitmap for
> >     faster descriptor lookup"), namely drivers/android/dbitmap.h. This
> >     is part of upstreaming the Android Binder driver.
> >
> >   * API uses Option types where appropriate
> >
> >   * bound checks are used to treat out-of-bounds access as bug
> >     (hardening). The C operations treat out-of-bounds parameters
> >     as a default case e.g. "not found" which is safe (avoids UB) but
> >     may hide bugs.
>
> Few paragraphs later you say:
>
> > It enables Rust
> > code to be a lot more similar and predictable with respect to C code
>
> If you want to make Rust similar to C (which is good), you need to
> make all that Panic'ing stuff configurable, right?

Yes, I agree with this reasoning in combination with BUG_ON.

> This is what I suggested originally, and this is the right way to go,
> to me.
>
> There was a long discussion few years ago regarding BUG_ON()s in the
> kernel, and the bottomline for it is simple: the kernel has many nice
> isolating and self-debugging features that help to resolve (hopefully)
> non-fatal errors like out-of-bond access, so we should let it try.

In my own words: using BUG_ON to prevent undefined behavior is almost
always going to be more useful than panic.

> Just halting the kernel helps little, particularly it prevents from
> collecting syslogs and other debugging info. You can check git history
> and see how many BUG()s were demoted to WARN()s, or simply dropped.
>
> So, this is again my suggestion: it's OK to have a hardening feature,
> but the panic should be configurable for the reasons:
>  - robustness;
>  - compatibility;
>  - debugability.
>
> To me, this should end up with something like:
>
>   fn bitmap_assert(bool, msg)
>   {
>   #if CONFIG_RUST_HARDENING_PANIC && CONFIG_RUST_BITMAP_HARDENING
>         assert(bool, msg)
>   #elif CONFIG_RUST_BITMAP_HARDENING
>         if (!bool)
>                 pr_err(msg)
>   #else
>         // do nothing; for the best performance.
>   #endif
>   }
>
> This doesn't look difficult anyhow right? But if you find it
> impractical, you can just replace the panic with printing an error.

There are several things at play:
- for the C methods that tolerate out-of-bounds access, the
bounds-check is redundant for safety
- but it is not redundant in terms of API: tolerating out-of-bounds
access is the spec, someone may rely on it
- if we would like a Rust API that is stricter (hardening), it is an
API change (or: a Rust and C API difference).

I will go with your suggestion and do a local (bitmap-specific)
configurable assert (=3Dpanic).
This could then later be changed to use a BUG macro.

> After all, this # Panic simply breaks your own coding rules:
>
>   Please note that panicking should be very rare and used only with a goo=
d
>   reason. In almost all cases, a fallible approach should be used, typica=
lly
>   returning a ``Result``.
>

Bitmap operations are so basic and the API that fallibility does not
make sense to me here.
The Rust API is also constrained by what the C API provides: if C
handles out-of-bounds arguments gracefully, then Rust should, too.
And panicking has the problems you described, so I have come around to
think that Rust needs a BUG_ON macro.

> >   * better naming convention to distinguish non-atomic from atomic
> >     operations: {set,clear}_bit vs {set,clear}_bit_atomic.
> >     The Rust type system ensures that all non-atomic operations
> >     require a &mut reference which amounts to exclusive access.
> >     Using the atomic variants only makes sense when multiple threads
> >     have a shared reference &bitmap which amounts to the interior
> >     mutability pattern.
> >
> >   * optimized to represent the bitmap inline if it would take the space
> >     of a pointer. This saves allocations which is relevant in the
> >     Binder use case.
> >
> > The underlying C bitmap is *not* exposed. This would lose all static
> > guarantees.
> >
> > An alternative route of vendoring an existing Rust bitmap package was
> > considered but suboptimal overall. Reusing the C implementation is
> > preferable for a basic data structure like bitmaps. It enables Rust
> > code to be a lot more similar and predictable with respect to C code
> > that uses the same data structures and enables the use of code that
> > has been tried-and-tested in the kernel.
> >
> > We use the `usize` type for sizes and indices into the bitmap,
> > because Rust generally always uses that type for indices and lengths
> > and it will be more convenient if the API accepts that type. This means
> > that we need to perform some casts to/from u32 and usize, since the C
> > headers use unsigned int instead of size_t/unsigned long for these
> > numbers in some places.
> >
> > Adds new MAINTAINERS section BITMAP API [RUST].
> >
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Burak Emir <bqe@google.com>
> > ---
> >  MAINTAINERS           |   7 +
> >  rust/kernel/bitmap.rs | 396 ++++++++++++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs    |   1 +
> >  3 files changed, 404 insertions(+)
> >  create mode 100644 rust/kernel/bitmap.rs
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1f162f64eded..7d107dc91390 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4135,6 +4135,13 @@ S:     Maintained
> >  F:   rust/helpers/bitmap.c
> >  F:   rust/helpers/cpumask.c
> >
> > +BITMAP API [RUST]
> > +M:   Alice Ryhl <aliceryhl@google.com>
> > +M:   Burak Emir <bqe@google.com>
> > +R:   Yury Norov <yury.norov@gmail.com>
> > +S:   Maintained
> > +F:   rust/kernel/bitmap.rs
> > +
> >  BITOPS API
> >  M:   Yury Norov <yury.norov@gmail.com>
> >  R:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
> > new file mode 100644
> > index 000000000000..79ddbef2b028
> > --- /dev/null
> > +++ b/rust/kernel/bitmap.rs
> > @@ -0,0 +1,396 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2025 Google LLC.
> > +
> > +//! Rust API for bitmap.
> > +//!
> > +//! C headers: [`include/linux/bitmap.h`](srctree/include/linux/bitmap=
.h).
> > +
> > +use crate::alloc::{AllocError, Flags};
> > +use crate::bindings;
> > +use core::ptr::NonNull;
> > +
> > +/// Holds either a pointer to array of `unsigned long` or a small bitm=
ap.
> > +#[repr(C)]
> > +union BitmapRepr {
> > +    bitmap: usize,
> > +    ptr: NonNull<usize>,
> > +}
> > +
> > +    pub fn last_bit(&self) -> Option<usize> {
>
> [...]
>
> > +        // SAFETY: access is within bounds.
> > +        let index =3D unsafe { bindings::_find_last_bit(self.as_ptr(),=
 self.nbits) };
> > +        if index =3D=3D self.nbits {
>
> Here and everywhere, can you please:
>
>         if index >=3D self.nbits {
>
> I know that bitmap documentation says that index would be exactly
> nbits, but really it was a bad decision. If one day I'll find a safe
> way to relax this to >=3D, your code will stay untouched.

Done, going to be in v8.

Thanks,
Burak

>
> Thanks,
> Yury
