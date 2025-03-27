Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771211D52B
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085872; cv=none; b=ZZMsSi6OdhTYb240QpftRsWVItXsJWFnKjSOZn/bqtNQ4RFLPjmOBVfNOkqfE1lYy3Z8dI9XqPKPA0ZRXdlEcH4fyaKbQ3GulAsZoUWs1wmorQ6SK7TMlpWrDJt8BbQvA+Ca3kwEm/1Klbwe3ItSFvvg57ttl6MeSWyCs1Dr084=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085872; c=relaxed/simple;
	bh=o4K7se25dBada4CLqIkcdC/wRapPxOFiyJmxCAuEWSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jC6etNsYFBCKZ9Es9Mz8X6FST+uDkY6uz0c+6x9aTcJ/cuPuDg5UK6bStr629F/fjbunDnSdL/tWGKBg5FaWOq0JrjBjJvg8SfpvfeKhEpclI88U5AHHVFjjydH9FBQmmu6n8zcnsmkIFbh8M1PbymxlhIEmDNVulwAa2o3CeIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vZyirK6i; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vZyirK6i"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3fec2899574so653114b6e.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 07:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743085868; x=1743690668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dk9Fx3JUX3u2dKck+McM23bRiBwQjZ7+IcAa0ZLLCpk=;
        b=vZyirK6iUdAQ0Ps/NhfC5HpzI5eYJI+2cqHLVqlbXLTIzqR7kAwD4H1vzyp8xYZ4KY
         7FNrlJ88i2Fr55/4vjvPzseNEk7ep+MOhE4fvRRF90PrlOGAChe4rTXRSEeBQ170BGJv
         7yUPIXt31rFCNJr3QZce2BbySmUBFx2hL2KQjW3cVqMK9oX7bth04/VwVNN9yBPpnAqf
         hGcHbila9vcBjRPGcn+PexFPhj58nXxkpyJ8PQKCitgHxc3a6gkBG51Oxie1THqYAvEt
         qpo2gvrsRDhbAEFgEn/Leer9iPQFUzcf25OkAu4mW8BHuzeruCRJl0h6cRGY0qS0fO/D
         fAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743085868; x=1743690668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dk9Fx3JUX3u2dKck+McM23bRiBwQjZ7+IcAa0ZLLCpk=;
        b=KskPCF3bYyWoNzxFuRJ3NgLbgKNSdZkz0vNaz912M+ERLesGgAjb+GpesdJwTh/u8f
         Sce6oA6vvLYmeliZmu3dvf+uMuMSJRAVVpO0Un8skbJxKyLWqzPX/WFPbBtewVD0HgGm
         hmhFaanG8skNMnhJzYp9JSX1gsq4hJipUUU4zeHhIQsWgJQqlj0e+WS/3/sPfeyf5V8B
         mhVyT5AsuMs6tdHX2AZwuAi8y0S6si3e0r8uPje/2Q1Fvnd/7FWmiDgvpgrf3gMW8JfS
         O77HWN3ImIUq51u1K6NCWjrw72dm0bxYw0c/6MrenLUL2qAkGz3lHe0sNUnwsQiH7CWX
         L1Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUcTd7TVbzLUtQJeJoRmZgZXMcUp2kAC6DEeSczt6ahOr9YqC5hbIJbtriu3JKoGfvl4LjnOuwP9PxThq3jZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQRUPh84XlYN6aGZtp2AQNW2TzRoATtFr4QOPwAQA8ALO6WZhk
	81pCJaVIOLOtZaTWxfdwSnGs9adZ6OihLKMTh0M7kVAYNRpwRrkjQWVcpq++ce9FKSDD2uPxbwI
	PYUqYFO46cpNTv3yqwJYEP/UMhcCVxAYIgwZB
X-Gm-Gg: ASbGncs1Hj3xgtQt2AakG3gkJuFSARR2u+ajwnU7uLvhbtV9DHgpT3vawQaaoNgF7vc
	3OXjXU/7xoLr6FR3LlOU5Ui6rwoum/ROsksofJeXhHZVQ1k8Iq7qCjtKZfjp+QoiasRfNPxAsHd
	UtjRaQdP3vZjZ0MJk7a8/VypDFQeMlOVOB77XxIA3brdvBw92cDoeEkWwz
X-Google-Smtp-Source: AGHT+IHFc927WC5eRCRSDfBXA0XqiOhGtyDN7XLuxTKf/qyibaNv2UtNAUxgvJbSjXDVkJNQWUugR4vM32kYYcyULrs=
X-Received: by 2002:a05:6808:2385:b0:3f9:1fee:8030 with SMTP id
 5614622812f47-3fefa5093b2mr2731620b6e.9.1743085867999; Thu, 27 Mar 2025
 07:31:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321111535.3740332-1-bqe@google.com> <20250321111535.3740332-4-bqe@google.com>
 <Z92N8dyIE42ROW2t@thinkpad>
In-Reply-To: <Z92N8dyIE42ROW2t@thinkpad>
From: Burak Emir <bqe@google.com>
Date: Thu, 27 Mar 2025 15:30:56 +0100
X-Gm-Features: AQ5f1JodtcsemPDMh5HfhW33tUQpcaVdpKIHFq-B5EhP6MiA5P0AEsd7FkUBn3s
Message-ID: <CACQBu=WyAdKOeXUwJxDWXVAtq_uvQKqxjT3S_WPiwrAYyCiPHQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] rust: add bitmap API.
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

On Fri, Mar 21, 2025 at 5:04=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> On Fri, Mar 21, 2025 at 11:15:31AM +0000, Burak Emir wrote:
> > Provides an abstraction for C bitmap API and bitops operations.
> > Includes enough to implement a Binder data structure that was
> > introduced in commit 15d9da3f818c ("binder: use bitmap for faster
> > descriptor lookup"), namely drivers/android/dbitmap.h.
> >
> > The implementation is optimized to represent the bitmap inline
> > if it would take the space of a pointer. This saves allocations.
> > We offer a safe API through bounds checks which panic if violated.
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
> > Signed-off-by: Burak Emir <bqe@google.com>
> > ---
> >  MAINTAINERS           |   7 +
> >  rust/kernel/bitmap.rs | 293 ++++++++++++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs    |   1 +
> >  3 files changed, 301 insertions(+)
> >  create mode 100644 rust/kernel/bitmap.rs
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7cd15c25a43c..bc8f05431689 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4114,6 +4114,13 @@ S:     Maintained
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
> > index 000000000000..118dceaf2b4b
> > --- /dev/null
> > +++ b/rust/kernel/bitmap.rs
> > @@ -0,0 +1,293 @@
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
> > +  bitmap: usize,
> > +  ptr: NonNull<usize>
> > +}
> > +
> > +/// Represents a bitmap.
> > +///
> > +/// Wraps underlying C bitmap API.
> > +///
> > +/// # Examples
> > +///
> > +/// Basic usage
> > +///
> > +/// ```
> > +/// use kernel::alloc::flags::GFP_KERNEL;
> > +/// use kernel::bitmap::Bitmap;
> > +///
> > +/// let mut b =3D Bitmap::new(16, GFP_KERNEL)?;
> > +/// assert_eq!(16, b.len());
> > +/// for i in 0..16 {
> > +///   if i % 4 =3D=3D 0 {
> > +///     b.set_bit(i);
> > +///   }
> > +/// }
>
> In C we separate declarations from function body with an empty line.
> Can you do that in rust? Can you point to a rust coding style? Do you
> guys really use 2-whitespace tabs?

Fixed the indentation.

I assume you the line `let mut b =3D ...` declaration.
Added an empty line.

>
> > +/// assert_eq!(Some(1), b.next_zero_bit(0));
> > +/// assert_eq!(Some(5), b.next_zero_bit(5));
> > +/// assert_eq!(Some(12), b.last_bit());
> > +/// # Ok::<(), Error>(())
> > +/// ```
>
> I think I already asked to make the test a separate unit. It's amazing
> that rust understands scattered commented blocks of code and can turn
> them into unit tests. Unfortunately, I'm not.
>
> Please create a separate unit and test everything there, just like we
> do with normal C code.
>
> For find_bit functions we have a lib/find_bit_benchmark.c Can you add
> a similar rust test, so we'll make sure you're not introducing
> performance regressions with your wrappers?
>
> Please don't use KUNITs. It's not ready for benchmarks, and tests built
> against it don't run on major distros.
>

I will try out the Rust unit test infrastructure that Miguel mentioned
has landed.
Rust unit tests are in the same file.

I need to find out whether infrastructure exists for Rust benchmarks.

> > +///
> > +/// Requesting too large values results in [`AllocError`]
> > +///
> > +/// ```
> > +/// use kernel::alloc::flags::GFP_KERNEL;
> > +/// use kernel::bitmap::Bitmap;
> > +/// assert!(Bitmap::new(1 << 31, GFP_KERNEL).is_err());
> > +/// ```
> > +///
> > +/// # Invariants
> > +///
> > +/// * `nbits` is `<=3D i32::MAX - 1` and never changes.
>
> Undershoot this time. It's exactly i32::MAX.

Fixed

>
> > +/// * if `nbits <=3D bindings::BITS_PER_LONG`, then `repr` is a bitmap=
.
> > +/// * otherwise, `repr` holds a non-null pointer that was obtained fro=
m a
> > +///   successful call to `bitmap_zalloc` and holds the address of an i=
nitialized
> > +///   array of `unsigned long` that is large enough to hold `nbits` bi=
ts.
>
> Are you sure a public method description should bear implementation
> details? I'm not. If implementation changes in future, the public API
> should stay stable (yes, including comments).

This is a good point, but there is a conflict: it is an /// #
Invariants which helps makes sense of safety comments.
I believe this necessarily has to mention implementation detail.

Maybe this should be // comments instead of ///, but all existing code
uses /// # Invariants.
I'd appreciate some Rust-for-Linux guidance here, going to leave as is for =
now.

> > +pub struct Bitmap {
> > +    /// Representation of bitmap.
> > +    repr: BitmapRepr,
> > +    /// Length of this bitmap. Must be `<=3D i32::MAX - 1`.
> > +    nbits: usize,
> > +}
> > +
> > +impl Drop for Bitmap {
> > +    fn drop(&mut self) {
> > +        if self.nbits <=3D bindings::BITS_PER_LONG as _ {
> > +            return
> > +        }
> > +        // SAFETY: `self.ptr` was returned by the C `bitmap_zalloc`.
> > +        //
> > +        // INVARIANT: there is no other use of the `self.ptr` after th=
is
> > +        // call and the value is being dropped so the broken invariant=
 is
> > +        // not observable on function exit.
> > +        unsafe { bindings::bitmap_free(self.as_mut_ptr()) };
> > +    }
> > +}
> > +
> > +impl Bitmap {
> > +    /// Constructs a new [`Bitmap`].
> > +    ///
> > +    /// If the length `nbits` is small enough to admit inline represen=
tation, this
>
> The "length nbits" is a tautology.
>
> > +    /// implementation does not allocate.
> > +    ///
> > +    /// Fails with [`AllocError`] when the [`Bitmap`] could not be all=
ocated. This
> > +    /// includes the case when `nbits` is greater than `i32::MAX - 1`.
> > +    #[inline]
> > +    pub fn new(nbits: usize, flags: Flags) -> Result<Self, AllocError>=
 {
> > +        if nbits <=3D bindings::BITS_PER_LONG as _ {
> > +            return Ok(Bitmap { repr: BitmapRepr { bitmap: 0 }, nbits }=
);
> > +        }
> > +        if nbits <=3D i32::MAX.try_into().unwrap() {
>
> OK, I'm not a rust professional, but I have a serious question: is
> this method chain the simplest way to compare two numbers?

This is due to the different types: i32 and usize are different types.
As humans,
we can see that i32::MAX will be positive and fit into usize, and rustc wil=
l
figure this out during translation, but the type-system does not take range=
s
into account and forces us to spell out a fallible conversion.

> > +            let nbits_u32 =3D u32::try_from(nbits).unwrap();
> > +            // SAFETY: `nbits <=3D i32::MAX - 1` and the C function ha=
ndles `nbits =3D=3D 0`.
> > +            let ptr =3D unsafe { bindings::bitmap_zalloc(nbits_u32, fl=
ags.as_raw()) };
> > +            let ptr =3D NonNull::new(ptr).ok_or(AllocError)?;
> > +            // INVARIANT: `ptr` returned by C `bitmap_zalloc` and `nbi=
ts` checked.
> > +            return Ok(Bitmap {
> > +                repr: BitmapRepr { ptr },
> > +                nbits,
> > +            });
> > +        }
> > +        Err(AllocError)
>
> Can you revert the logic and save indentation level?

Done

> > +    }
> > +
> > +    /// Returns length of this [`Bitmap`].
> > +    #[inline]
> > +    pub fn len(&self) -> usize {
> > +        self.nbits
> > +    }
> > +
> > +    /// Returns a mutable raw pointer to the backing [`Bitmap`].
> > +    #[inline]
> > +    fn as_mut_ptr(&mut self) -> *mut usize {
> > +        if self.nbits <=3D bindings::BITS_PER_LONG as _ {
> > +            // SAFETY: Bitmap is represented inline.
> > +            unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
> > +        } else {
> > +            // SAFETY: Bitmap is represented as array of `unsigned lon=
g`.
> > +            unsafe { self.repr.ptr.as_mut() }
> > +        }
> > +    }
> > +
> > +    /// Returns a raw pointer to the backing [`Bitmap`].
> > +    #[inline]
> > +    fn as_ptr(&self) -> *const usize {
> > +        if self.nbits <=3D bindings::BITS_PER_LONG as _ {
> > +            // SAFETY: Bitmap is represented inline.
> > +            unsafe { core::ptr::addr_of!(self.repr.bitmap) }
> > +        } else {
> > +            // SAFETY: Bitmap is represented as array of `unsigned lon=
g`.
> > +            unsafe { self.repr.ptr.as_ptr() }
> > +        }
> > +    }
> > +
> > +    /// Set bit with index `index`.
> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if `index` is greater than or equal to `self.nbits`.
> > +    #[inline]
> > +    pub fn set_bit(&mut self, index: usize) {
> > +        assert!(
> > +            index < self.nbits,
> > +            "Bit `index` must be < {}, was {}",
> > +            self.nbits,
> > +            index
> > +        );
> > +        // SAFETY: Bit `index` is within bounds.
> > +        unsafe { bindings::__set_bit(index as u32, self.as_mut_ptr()) =
};
> > +    }
> > +
> > +    /// Set bit with index `index`, atomically.
> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if `index` is greater than or equal to `self.nbits`.
>
> I think we agreed that if you decide to change set_bit() notation from
> atomic to non-atomic, you'll add a beefy paragraph explaining your
> choice. Please do so. Please prepend your paragraph with an ATTENTION!
> or even WARNING! eye-catcher. Please describe it in cover-letter, commit
> message and here, right in the source code.
>
> Is there any mechanism in rust to enforce the rule: set_bit_atomic() is
> never for more than once in a raw on the same bitmap, or together with
> a non-atomic bitmap function, like dbitmap.h does? C lacks for it despera=
tely.

Oh, this is good point.

I considered making this unsafe - but it seems this is actually safe:

The argument for safety would be one of exclusive access:
- when one has a &mut reference, then there cannot be another thread
that can call set_bit_atomic or clear_bit_atomic.
- when multiple threads have shared referenced &bitmap, then they
cannot call non-atomic methods.


> > +    #[inline]
> > +    pub fn set_bit_atomic(&self, index: usize) {
> > +        assert!(
> > +            index < self.nbits,
> > +            "Bit `index` must be < {}, was {}",
> > +            self.nbits,
> > +            index
> > +        );
> > +        // SAFETY: `index` is within bounds and `set_bit` is atomic.
> > +        unsafe { bindings::set_bit(index as u32, self.as_ptr() as *mut=
 usize) };
> > +    }
> > +
> > +    /// Clear bit with index `index`.
>
> Index 'index' is also a tautology. Can you just say:
>         Clear 'index' bit

Done.

> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if `index` is greater than or equal to `self.nbits`.
> > +    #[inline]
> > +    pub fn clear_bit(&mut self, index: usize) {
> > +        assert!(
> > +            index < self.nbits,
> > +            "Bit `index` must be < {}, was {}",
> > +            self.nbits,
> > +            index
> > +        );
> > +        // SAFETY: `index` is within bounds.
> > +        unsafe { bindings::__clear_bit(index as u32, self.as_mut_ptr()=
) };
> > +    }
> > +
> > +    /// Clear bit with index `index`, atomically.
> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if `index` is greater than or equal to `self.nbits`.
> > +    #[inline]
> > +    pub fn clear_bit_atomic(&self, index: usize) {
> > +        assert!(
> > +            index < self.nbits,
> > +            "Bit `index` must be < {}, was {}",
> > +            self.nbits,
> > +            index
> > +        );
> > +        // SAFETY: `index` is within bounds and `clear_bit` is atomic.
> > +        unsafe { bindings::clear_bit(index as u32, self.as_ptr() as *m=
ut usize) };
> > +    }
> > +
> > +    /// Copy `src` into this [`Bitmap`] and set any remaining bits to =
zero.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
> > +    /// use kernel::bitmap::Bitmap;
> > +    ///
> > +    /// let mut long_bitmap =3D Bitmap::new(256, GFP_KERNEL)?;
> > +    /// assert_eq!(None, long_bitmap.last_bit());
> > +    /// let mut short_bitmap =3D Bitmap::new(16, GFP_KERNEL)?;
> > +    /// short_bitmap.set_bit(7);
> > +    ///
> > +    /// long_bitmap.copy_and_extend(&short_bitmap);
> > +    /// assert_eq!(Some(7), long_bitmap.last_bit());
> > +    ///
> > +    /// long_bitmap.clear_bit(7);
> > +    /// assert_eq!(None, long_bitmap.last_bit());
> > +    ///
> > +    /// # Ok::<(), AllocError>(())
> > +    /// ```
> > +    #[inline]
> > +    pub fn copy_and_extend(&mut self, src: &Bitmap) {
> > +        let len =3D core::cmp::min(src.nbits, self.nbits);
> > +        // SAFETY: access to `self` and `src` is within bounds.
> > +        unsafe {
> > +            bindings::bitmap_copy_and_extend(
> > +                self.as_mut_ptr(),
> > +                src.as_ptr(),
> > +                len as u32,
> > +                self.nbits as u32,
> > +            )
> > +        };
> > +    }
> > +
> > +    /// Finds last bit that is set.
>
> Find last set bit, please.

Done

> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// use kernel::alloc::{AllocError, flags::GFP_KERNEL};
> > +    /// use kernel::bitmap::Bitmap;
> > +    ///
> > +    /// let bitmap =3D Bitmap::new(64, GFP_KERNEL)?;
> > +    /// match bitmap.last_bit() {
> > +    ///     Some(idx) =3D> {
> > +    ///         pr_info!("The last bit has index {idx}.\n");
> > +    ///     }
> > +    ///     None =3D> {
> > +    ///         pr_info!("All bits in this bitmap are 0.\n");
> > +    ///     }
> > +    /// }
> > +    /// # Ok::<(), AllocError>(())
> > +    /// ```
> > +    #[inline]
> > +    pub fn last_bit(&self) -> Option<usize> {
> > +        // SAFETY: `nbits =3D=3D 0` is supported and access is within =
bounds.
> > +        let index =3D unsafe { bindings::_find_last_bit(self.as_ptr(),=
 self.nbits) };
> > +        if index =3D=3D self.nbits {
> > +            None
> > +        } else {
> > +            Some(index)
> > +        }
> > +    }
> > +
> > +    /// Finds next zero bit, starting from `start`.
> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if `index` is greater than or equal to `self.nbits`.
> > +    #[inline]
> > +    pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
> > +        assert!(
> > +            start < self.nbits,
> > +            "Offset `start` must be < {}, was {}",
>
> The 'offset' and 'start' here are the same. You can use just 'start'.
> Are you sure that rust printing function will handle backquotes properly?
>
Done. Backticks are not special in format strings.

> I'm not sure that every user of bitmaps should panic if he goes out of
> boundaries. If your assert() is similar to WARN_ON() or BUG_ON(), it's
> wrong. You can do that in client code, but not in a generic library.
> (Except for hardening reasons under a corresponding config.)

Yes we discussed this: it is purely for hardening reasons.

> for_each_set_bitrange() is an example where offset >=3D nbits is an
> expected and normal behavior.

Makes sense, but we could offer iteration in the Rust API without
permitting offset >=3D nbits in public methods.

> > +            self.nbits,
> > +            start
> > +        );
> > +
> > +        // SAFETY: access is within bounds.
> > +        let index =3D unsafe { bindings::_find_next_zero_bit(self.as_p=
tr(), self.nbits, start) };
> > +        if index =3D=3D self.nbits {
> > +            None
> > +        } else {
> > +            Some(index)
> > +        }
> > +    }
> > +}
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index 6b46bc481d94..9f675c0841e6 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -36,6 +36,7 @@
> >  pub use ffi;
> >
> >  pub mod alloc;
> > +pub mod bitmap;
> >  #[cfg(CONFIG_BLOCK)]
> >  pub mod block;
> >  #[doc(hidden)]
> > --
> > 2.49.0.395.g12beb8f557-goog
