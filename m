Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D07A1755E
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Feb 2024 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707129419; cv=none; b=SLnC1A9x5ds1j3fJ2EnBtziwco9LGwpWXkIofXGE7JXyRH68Hg+NKQiRBQ4u0vx8SPMvMq74CISjXppI6wqSVOq8/Zt3HPIFcXCjhN3Wi2DSnzODxKDU1OhOn6ly4PbQgi3JEPKpXmNLKX0pg6HredkKG5bRTUXy+ZmswONE/Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707129419; c=relaxed/simple;
	bh=X2ao3HH8uc2WLBeyDMNruz6LtqEHjZv6JFTnI5ERHk8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=Qp92ar4DGm78aUq5DwlNu8qbMxkD/T7qTFrLTnUpW/y47hTpTKPNkcBTrSMZzP0UMg8sWhE85r+aCH8o2cZXHqdaM19k0IjgVNp3INplRZnW3wIBiGVMquYRv0TuQT4y82GIDdMJa89ebuorl9vkwN3/LD9B00Y3FAENAFbJ/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=MAGmhAgL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="MAGmhAgL"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40fdddbb8b1so1812015e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 02:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1707129414; x=1707734214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Y2sb4XMwNJ4v8GkTn5qnI3Jux2tB5BguvyFsQdoY8k=;
        b=MAGmhAgLWSBbl/UM4W69bs2Zmo6ci/uzcuAvkoyQrBU67FqD3vgEyDGUImDHOI9ojS
         YFKIgbyNkkhwRTHdjLnuxUwoqIFYHWDWnx3ecYxzihHMDlzPSQFNOoZWbUAbBxUYYyXD
         re4NVX4LgT1WMIZmRSlIRicWNtuRQr0Igne6Mc6I4+nhLLDhfEw8FJEYUp64dhq8OF5W
         dXZdF6BEShaJmQlt7JIUxHdjTxwF0H1CmiahNqS+vL0oD7fCr5g2BaF/HEd8cGDVy3wP
         RC9QYjIZ/5hodeF9N21MsSwzTo04OU5SXdK441074J+W9BkT8e6hbXgT2amnHLUC11nf
         tH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707129414; x=1707734214;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Y2sb4XMwNJ4v8GkTn5qnI3Jux2tB5BguvyFsQdoY8k=;
        b=ewy6yPYPQ/0hiGgTnjSiem0zq9KplkCQC046rjusNnBwSsRg/1EXgLUegDGwiWUE/8
         fYKy6VSCz93hDbOmX+wvw2PiTnWXU8wFQKcietXQtBi3tnN4TcYBpxpincnsR4tTRzpV
         588WBgHGKnulaJzWbtoHhaPxk0vMzFL8ocs0eIqgngnzNYTC/97oH4xo/qMa2ebg7i+6
         GzntHh0ExrKlNc/nBgCr6EYT36ByOQcqHXb88i0NV+gnlxO3LX1wggCYXCIAna7cbFP9
         ey/w5YV1FB2MRlZA7sBv4b5rQLSJnejqnRAJi/uqf41b2XKJ874D3B/P4UJuj5GYcDnG
         /tkg==
X-Gm-Message-State: AOJu0YxdaYf5NFqDZ72HDEe80dB6efkI98D6aHErXOTzWfxY8gmwV4+F
	BnZQXZckqppbw407jv9DS4fRiNGtC6eQvcy6kuAMaLBEF7KtrHfHpXBwOZNgTCw=
X-Google-Smtp-Source: AGHT+IEG0qN/AgYQJAwQtFKTOIJhM0dUxW9pxrUcH+k4E6HOdEfMVUp453KSQchj446BGdC1uczZSg==
X-Received: by 2002:a05:600c:4e89:b0:40f:d0a7:da96 with SMTP id f9-20020a05600c4e8900b0040fd0a7da96mr3826646wmq.5.1707129413684;
        Mon, 05 Feb 2024 02:36:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVmjqnAUquzLVYbRJEFmeFlBGjT+s+8/FEx18XFn5TltzdeqiCo9t/gt9sZD3p1OBhzVTurmOhh+uyRdJU1RDXjuI4xx+nn3N6fBWKgp+0D2zbdzRWM4J97o1CCuhIvXX2dNGyN2qytv+ZawS3B48vjGPz0yNJZqzqcuNMUympFI7zID12S2JAw1RWYuHLBz28p2sEiW+WajbVsntubeWkdw3HCKFX2P38jaow/UAb/Grqqtmn3B0B+FMwk1aJwlHIGPmrnxasxyZXVVI0NcKPAL8lNCyetA4PPFh576hhweI6ZaVyi/aDWX87JQH94dTbw3djEVqliu5j+jryB1QS+1DbIMNIpDKLn7e4vUK5e2QPCxVxLv1I/sYERp3nA0UMH0xprxA==
Received: from localhost ([165.225.194.203])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c310600b0040fdd8f5e18sm1105613wmo.34.2024.02.05.02.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 02:36:52 -0800 (PST)
References: <20240116151728.370238-1-mcanal@igalia.com>
 <ZacW_e1mnNi6hT7M@boqun-archlinux>
User-agent: mu4e 1.10.8; emacs 29.2
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Asahi Lina
 <lina@asahilina.net>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson
 Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>, Matthew Wilcox <willy@infradead.org>,
 rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v6] rust: xarray: Add an abstraction for XArray
Date: Mon, 05 Feb 2024 11:29:06 +0100
In-reply-to: <ZacW_e1mnNi6hT7M@boqun-archlinux>
Message-ID: <87h6intcyh.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Boqun Feng <boqun.feng@gmail.com> writes:

> On Tue, Jan 16, 2024 at 12:06:03PM -0300, Ma=C3=ADra Canal wrote:
>> From: Asahi Lina <lina@asahilina.net>
>>=20
> [...]
>> v5 -> v6: https://lore.kernel.org/rust-for-linux/20231201195300.1329092-=
1-mcanal@igalia.com/T/
>>=20
>> - Update constants to the new format (RUST_CONST_HELPER)
>> - Add invariant for `self.0` being a pointer derived from `T::from_forei=
gn` (Benno Lossin)
>> - Fix the place of the INVARIANT comments (Benno Lossin)
>> - Use the Pin-Init API (Benno Lossin)
>> - Remove PhantomPinned from XArray (Benno Lossin)
>> - Add new requirements for calling `xa_unlock()` (Benno Lossin)
>> - Improve SAFETY comments (Benno Lossin)
>> - Split unsafe block (Benno Lossin)
>> - s/alloc_limits_opt/insert_between (Benno Lossin)
>> - Specify the target type of the cast (Andreas Hindborg/Trevor Gross)
>> - Guarantee that T is 4-byte aligned (Andreas Hindborg)
>> - Add code examples in the code (Boqun Feng)
>
> Thanks!
>
>>=20
>> [1] https://github.com/mairacanal/linux/pull/11
>>=20
>>  rust/bindings/bindings_helper.h |  17 ++
>>  rust/helpers.c                  |  37 +++
>>  rust/kernel/lib.rs              |   1 +
>>  rust/kernel/xarray.rs           | 383 ++++++++++++++++++++++++++++++++
>>  4 files changed, 438 insertions(+)
>>  create mode 100644 rust/kernel/xarray.rs
>>=20
>
> [...]
>
>> +
>> +/// Wrapper for a value owned by the `XArray` which holds the `XArray` =
lock until dropped.
>> +///
>
> Although the comment here says that `Guard` represents a *locked* slot
> in the xarray, but..
>
>> +/// INVARIANT: `Guard` holds a reference (`self.0`) to the underlying v=
alue owned by XArray.
>> +/// You can use the `into_foreign` method to obtain a pointer to the fo=
reign representation
>> +/// of the owned value, which is valid for the lifetime of the Guard.
>
> nothing about the xa lock is mentioned here in the type invariants. I
> think it's better to say:
>
> /// INVARIANT: `Guard` holds a reference (`self.0`) to the underlying
> /// value owned by the `XArray` (`self.1`) with its lock held...
>
> and then at the Guard::drop..
>
>> +pub struct Guard<'a, T: ForeignOwnable>(NonNull<T>, &'a XArray<T>);
>> +
>> +impl<'a, T: ForeignOwnable> Guard<'a, T> {
>> +    /// Borrow the underlying value wrapped by the `Guard`.
>> +    ///
>> +    /// Returns a `T::Borrowed` type for the owned `ForeignOwnable` typ=
e.
>> +    pub fn borrow(&self) -> T::Borrowed<'_> {
>> +        // SAFETY: The value is owned by the `XArray`, the lifetime it =
is borrowed for must not
>> +        // outlive the `XArray` itself, nor the Guard that holds the lo=
ck ensuring the value
>> +        // remains in the `XArray`.
>> +        //
>> +        // By the type invariant of `Guard`, we can guarantee that `Gua=
rd` holds this reference
>> +        // (`self.0`).
>> +        unsafe { T::borrow(self.0.as_ptr().cast()) }
>> +    }
>> +}
>> +
>> +// Convenience impl for `ForeignOwnable` types whose `Borrowed`
>> +// form implements Deref.
>> +impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
>> +where
>> +    T::Borrowed<'a>: Deref,
>> +    for<'b> T::Borrowed<'b>: Into<&'b <T::Borrowed<'a> as Deref>::Targe=
t>,
>> +{
>> +    type Target =3D <T::Borrowed<'a> as Deref>::Target;
>> +
>> +    fn deref(&self) -> &Self::Target {
>> +        self.borrow().into()
>> +    }
>> +}
>> +
>> +impl<'a, T: ForeignOwnable> Drop for Guard<'a, T> {
>> +    fn drop(&mut self) {
>> +        // SAFETY: By the type invariant, we guarantee that we have a r=
eference
>> +        // that owns the C xarray object.
>
> you can (and should) also mention, "by the type invariant, `Guard` is
> the owner of the xarray lock, so it's safe to unlock". Justifying the
> ownership of lock at unlock point is safety related, since otherwise a
> data race may happen.
>
>> +        unsafe { bindings::xa_unlock(self.1.xa.get()) };
>> +    }
>> +}
>> +
>> +/// Represents a reserved slot in an `XArray`, which does not yet have =
a value but has an assigned
>> +/// index and may not be allocated by any other user. If the Reservatio=
n is dropped without
>> +/// being filled, the entry is marked as available again.
>> +///
>> +/// Users must ensure that reserved slots are not filled by other mecha=
nisms, or otherwise their
>> +/// contents may be dropped and replaced (which will print a warning).
>
> I feel like this is a bit weird: instead of dropping and replacing, I
> would expect we do nothing if someone steals our unused reservation ;-)
> But let's see whether there would be a real user complain ;-)
>
>> +pub struct Reservation<'a, T: ForeignOwnable>(&'a XArray<T>, usize, Pha=
ntomData<T>);
>> +
>> +impl<'a, T: ForeignOwnable> Reservation<'a, T> {
>> +    /// Stores a value into the reserved slot.
>> +    pub fn store(self, value: T) -> Result<usize> {
>> +        if self.0.replace(self.1, value)?.is_some() {
>> +            crate::pr_err!("XArray: Reservation stored but the entry al=
ready had data!\n");
>> +            // Consider it a success anyway, not much we can do
>> +        }
>> +        let index =3D self.1;
>> +        // The reservation is now fulfilled, so do not run our destruct=
or.
>> +        core::mem::forget(self);
>> +        Ok(index)
>> +    }
>> +
>> +    /// Returns the index of this reservation.
>> +    pub fn index(&self) -> usize {
>> +        self.1
>> +    }
>> +}
>> +
>> +impl<'a, T: ForeignOwnable> Drop for Reservation<'a, T> {
>> +    fn drop(&mut self) {
>> +        if self.0.remove(self.1).is_some() {
>> +            crate::pr_err!("XArray: Reservation dropped but the entry w=
as not empty!\n");
>> +        }
>> +    }
>> +}
>> +
>> +/// An array which efficiently maps sparse integer indices to owned obj=
ects.
>> +///
>> +/// This is similar to a `Vec<Option<T>>`, but more efficient when ther=
e are holes in the
>> +/// index space, and can be efficiently grown.
>> +///
>> +/// This structure is expected to often be used with an inner type that
>> +/// can be efficiently cloned, such as an `Arc<T>`.
>> +///
>> +/// INVARIANT: All pointers stored in the array are pointers obtained by
>> +/// calling `T::into_foreign`.
>
> ... or null pointers (considering reserve() cases).
>
>> +#[pin_data(PinnedDrop)]
>> +pub struct XArray<T: ForeignOwnable> {
>> +    #[pin]
>> +    xa: Opaque<bindings::xarray>,
>> +    _p: PhantomData<T>,
>> +}
>> +
>> +///
>> +/// # Examples
>> +///
>> +/// ```rust
>> +/// # use kernel::xarray;
>> +/// # use kernel::prelude::*;
>> +/// # use kernel::sync::Arc;
>> +///
>> +/// # struct Foo {
>> +/// #     a: u32,
>> +/// #     b: u32,
>> +/// # }
>> +///
>> +/// let arr =3D Box::pin_init(xarray::XArray::<Arc<Foo>>::new(xarray::f=
lags::ALLOC1))
>> +///                                                    .expect("Unable =
to allocate XArray");
>> +///
>> +/// let foo =3D Arc::try_new(Foo { a : 1, b: 2 }).expect("Unable to all=
ocate Foo");
>> +/// let index =3D arr.alloc(foo).expect("Error allocating Index");
>> +///
>> +/// if let Some(guard) =3D arr.get(index) {
>> +///     assert_eq!(guard.borrow().a, 1);
>> +///     assert_eq!(guard.borrow().b, 2);
>> +/// } else {
>> +///     pr_info!("No value found in index {}", index);
>> +/// }
>> +///
>> +/// let foo =3D Arc::try_new(Foo { a : 3, b: 4 }).expect("Unable to all=
ocate Foo");
>> +/// let index =3D arr.alloc(foo).expect("Error allocating Index");
>> +///
>> +/// if let Some(removed_data) =3D arr.remove(index) {
>> +///     assert_eq!(removed_data.a, 3);
>> +///     assert_eq!(removed_data.b, 4);
>> +/// } else {
>> +///     pr_info!("No value found in index {}", index);
>> +/// }
>
> Again, thanks!
>
>> +/// ```
>> +impl<T: ForeignOwnable> XArray<T> {
>> +    /// Creates a new `XArray` with the given flags.
>> +    pub fn new(flags: Flags) -> impl PinInit<Self> {
>> +        pin_init!(Self {
>> +            // SAFETY: `xa` is valid while the closure is called.
>> +            xa <- Opaque::ffi_init(|xa| unsafe {
>> +                bindings::xa_init_flags(xa, flags)
>> +            }),
>> +            _p: PhantomData,
>> +        })
>> +    }
>> +
>> +    /// Replaces an entry with a new value, returning the old value (if=
 any).
>> +    pub fn replace(&self, index: usize, value: T) -> Result<Option<T>> {
>> +        let new =3D value.into_foreign();
>> +
>> +        build_assert!(mem::align_of::<T>() <=3D 4);
>
> I know Benno suggested this, but this is not quite right ;-) Sorry I
> didn't mention this earlier. Here T is a ForeignOwnable type, e.g.
> Box<_>, Arc<_>, while they may be 4-byte aligned but the return pointers
> of into_foreign() may not. What we need here is that `new` is at least 4
> bytes aligned. Yes, this is a boring difference, but it's a difference..

Also, this line would assert that the alignment of `T` is less than or
equal to 4 bytes? So a 2 byte aligned type would be accepted, which is
not what we want. 4, 8, 12, etc. is fine.

Instead of this, we can check that the last two bits of `new` is zero.
But that would not be const =F0=9F=98=AC

This is the relevant part of documentation:

> Normal pointers may be stored in the XArray directly.  They must be 4-byte
> aligned, which is true for any pointer returned from kmalloc() and
> alloc_page().  It isn't true for arbitrary user-space pointers,
> nor for function pointers.  You can store pointers to statically allocated
> objects, as long as those objects have an alignment of at least 4.

BR Andreas
