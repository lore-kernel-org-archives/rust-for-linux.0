Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="hU0fn6Wi"
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2300B10F8
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 21:22:06 -0800 (PST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5d95a3562faso16486957b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Dec 2023 21:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1702012925; x=1702617725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lbB2myBb5FFlXOOzNOBo88IPOW9pmKEbAjuAV2JY5k=;
        b=hU0fn6WiOhf5xTdtL0HEGZsXNGqOwNUiEZwfobmsj5qFy2LaKCCRC0bQai7nBqrO4C
         f67gEgOSMRU7IvZ0Dd8lG0uIddZh7gz4qY/KNZvoqzqKh3YRLvEErH5UHt41KYjCClkn
         fYZhwzicaJbRXlRshH/3/e6KKbwUhI+ldKi1jm2iQjyJiLxkb4wlUCNvV8SEwSGd7+rp
         PMeyxGpkOWlazcLkuOFZUUctFHOIwdMbSnoAXxT2MHtIb7iWqgQ09rKeWmtjygkouERU
         a3/8OW0wZVVWgEGrSQZpPCGxMAJDlls8EFj/Rkhm6ULbzScVgNoKUHZdJYwkaa3bwpna
         Opjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702012925; x=1702617725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lbB2myBb5FFlXOOzNOBo88IPOW9pmKEbAjuAV2JY5k=;
        b=rPqNuH/Mych9e/hDYe6XbTvhFF9Lq9v6Q+KVS7tXkGQW24BnKjG7Chz9wyADC7eKfF
         lxGAcK8ko2SWMMDJfgQ6RrYNIpT8+0hUJxRA4mPgy1pCceE7/qORWA9inP4DuHe+2p5q
         VRNvK8vhz6gm8b0Xwqj5n3Vi2N/FhNjVHCTbnV2/lQYxW+QmMLaVTTCnJ5jtRwUuQ7VG
         NZuimUTF7g3MRs7kPwxG2RW7u4ygU5UC3NE6jmlR+YfRtxhYV0em1HsSppXFgq2vQ7YO
         Ymisq0W0GHPSAYR9j9SB9R89KRGF+jodarIoD0sqDq2fEd70HGE+TtrNywbFwV9HV3jp
         AUWQ==
X-Gm-Message-State: AOJu0YzjvJuPS3J59wr2kJJXvCE4PmN7DUTznfghgEVKR9b75wYjKymF
	9Vngn3H0uxTjR+v3xrzk22txVGkXccawNhmr3VIhVg==
X-Google-Smtp-Source: AGHT+IEhb7PO1zY/4RpsjlrgjbcQith+akekw36Lnzynyfj1IhrHJ/SPcQt9N8TQzNIt3AaRHj1er28v9s1xoxShqkA=
X-Received: by 2002:a05:690c:c84:b0:5d8:2b37:e085 with SMTP id
 cm4-20020a05690c0c8400b005d82b37e085mr3112586ywb.20.1702012925216; Thu, 07
 Dec 2023 21:22:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201195300.1329092-1-mcanal@igalia.com>
In-Reply-To: <20231201195300.1329092-1-mcanal@igalia.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 8 Dec 2023 00:21:53 -0500
Message-ID: <CALNs47svFebQKvBf6fOajGBY-u6wYqiPbS9uRHG9ahKh9wKsFQ@mail.gmail.com>
Subject: Re: [PATCH v5] rust: xarray: Add an abstraction for XArray
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthew Wilcox <willy@infradead.org>, 
	rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 2:54=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com>=
 wrote:
> +impl<'a, T: ForeignOwnable> Guard<'a, T> {
> +    /// Borrow the underlying value wrapped by the `Guard`.
> +    ///
> +    /// Returns a `T::Borrowed` type for the owned `ForeignOwnable` type=
.
> +    pub fn borrow(&self) -> T::Borrowed<'_> {
> +        // SAFETY: The value is owned by the `XArray`, the lifetime it i=
s borrowed for must not
> +        // outlive the `XArray` itself, nor the Guard that holds the loc=
k ensuring the value
> +        // remains in the `XArray`.
> +        unsafe { T::borrow(self.0.as_ptr() as _) }
> +    }
> +}

Prefer `.cast::<...>()` or at least `.cast()` wherever possible since
you can't accidentally change mutability (the others mentioned this
area too)

> +// Convenience impl for `ForeignOwnable` types whose `Borrowed`
> +// form implements Deref.
> +impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
> +where
> +    T::Borrowed<'a>: Deref,
> +    for<'b> T::Borrowed<'b>: Into<&'b <T::Borrowed<'a> as Deref>::Target=
>,

You can make these doc comments if there is any value to a user seeing them

> +/// Represents a reserved slot in an `XArray`, which does not yet have a=
 value but has an assigned
> +/// index and may not be allocated by any other user. If the Reservation=
 is dropped without
> +/// being filled, the entry is marked as available again.
> +///
> +/// Users must ensure that reserved slots are not filled by other mechan=
isms, or otherwise their
> +/// contents may be dropped and replaced (which will print a warning).
> +pub struct Reservation<'a, T: ForeignOwnable>(Pin<&'a XArray<T>>, usize,=
 PhantomData<T>);

Can you clarify who users are here, and give an example of what other
mechanisms would be?

Docs nits:

- s/Represents a/A/ (noun form for object docs)
- Split "If the Reservation..." to a new paragraph so there isn't a long su=
mmary
- s/or otherwise/otherwise/

> +impl<'a, T: ForeignOwnable> Reservation<'a, T> {
> +    /// Stores a value into the reserved slot.
> +    pub fn store(self, value: T) -> Result<usize> {

Add to the docs what this return value is

> +        if self.0.replace(self.1, value)?.is_some() {
> +            crate::pr_err!("XArray: Reservation stored but the entry alr=
eady had data!\n");
> +            // Consider it a success anyway, not much we can do
> +        }
> +        let index =3D self.1;
> +        // The reservation is now fulfilled, so do not run our destructo=
r.
> +        core::mem::forget(self);

Add a note about when the destructor does get run

> +        Ok(index)
> +    }


> +    /// Replaces an entry with a new value, returning the old value (if =
any).
> +    pub fn replace(self: Pin<&Self>, index: usize, value: T) -> Result<O=
ption<T>> {
> +        let new =3D value.into_foreign();
> +        // SAFETY: `new` just came from into_foreign(), and we dismiss t=
his guard if
> +        // the xa_store operation succeeds and takes ownership of the po=
inter.
> +        let guard =3D ScopeGuard::new(|| unsafe {
> +            T::from_foreign(new);
> +        });
> +
> +        // SAFETY: `self.xa` is always valid by the type invariant, and =
we are storing
> +        // a `T::into_foreign()` result which upholds the later invarian=
ts.

What type invariant, I don't see one on the type itself :)

> +        let guard =3D ScopeGuard::new(|| unsafe {
> +            T::from_foreign(new);
> +        });
> +
> +        // SAFETY: `self.xa` is always valid by the type invariant, and =
we are storing
> +        // a `T::into_foreign()` result which upholds the later invarian=
ts.
> +        let old =3D unsafe {
> +            bindings::xa_store(
> +                self.xa.get(),
> +                index.try_into()?,
> +                new as *mut _,
> +                bindings::GFP_KERNEL,
> +            )
> +        };

`as` -> `.cast::<...>()`

> +        Ok(if old.is_null() {
> +            None
> +        } else {
> +            // SAFETY: The old value must have been stored by either thi=
s function or
> +            // `alloc_limits_opt`, both of which ensure non-NULL entries=
 are valid
> +            // ForeignOwnable pointers.
> +            Some(unsafe { T::from_foreign(old) })

It's obviously done right there, but it doesn't hurt to clarify in the
comment that you checked for null (part of the `from_foreign`
invariant). There are a few cases like this.

Nit: it looks cleaner to `let ret =3D if ...` .. `Ok(ret)` than it does
to wrap a larger `if` block in `Ok`.

> +    /// Looks up and returns a reference to an entry in the array, retur=
ning a `Guard` if it
> +    /// exists.
> +    ///
> +    /// This guard blocks all other actions on the `XArray`. Callers are=
 expected to drop the
> +    /// `Guard` eagerly to avoid blocking other users, such as by taking=
 a clone of the value.
> +    pub fn get(self: Pin<&Self>, index: usize) -> Option<Guard<'_, T>> {
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        unsafe { bindings::xa_lock(self.xa.get()) };
> +
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        let guard =3D ScopeGuard::new(|| unsafe { bindings::xa_unlock(se=
lf.xa.get()) });
> +
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        let p =3D unsafe { bindings::xa_load(self.xa.get(), index.try_in=
to().ok()?) };

Is it worth any sort of

> +        NonNull::new(p as *mut T).map(|p| {
> +            guard.dismiss();
> +            Guard(p, self)
> +        })
> +    }

`as` -> `.cast::<...>()`

> +    /// Removes and returns an entry, returning it if it existed.
> +    pub fn remove(self: Pin<&Self>, index: usize) -> Option<T> {

Docs wording is redundant

> +    /// Allocates a new index in the array, optionally storing a new val=
ue into it, with
> +    /// configurable bounds for the index range to allocate from.
> +    ///
> +    /// If `value` is `None`, then the index is reserved from further al=
location but remains
> +    /// free for storing a value into it.
> +    fn alloc_limits_opt(self: Pin<&Self>, value: Option<T>, min: u32, ma=
x: u32) -> Result<usize> {

Should min and max be usize to be cohesive with indices? And then
return an error if they don't fit. Same questions for below.

> +        let new =3D value.map_or(core::ptr::null(), |a| a.into_foreign()=
);
> +        let mut id: u32 =3D 0;
> +
> +        let guard =3D ScopeGuard::new(|| {
> +            if !new.is_null() {
> +                // SAFETY: If `new` is not NULL, it came from the `Forei=
gnOwnable` we got
> +                // from the caller.
> +                unsafe { T::from_foreign(new) };
> +            }
> +        });
> +
> +        // SAFETY: `self.xa` is always valid by the type invariant. If t=
his succeeds, it
> +        // takes ownership of the passed `T` (if any). If it fails, we m=
ust drop the
> +        // `T` again.
> +        let ret =3D unsafe {
> +            bindings::xa_alloc(
> +                self.xa.get(),
> +                &mut id,
> +                new as *mut _,
> +                bindings::xa_limit { min, max },
> +                bindings::GFP_KERNEL,
> +            )
> +        };

`as` -> `.cast::<...>()`

> +        if ret < 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            guard.dismiss();
> +            Ok(id as usize)
> +        }
> +    }

> +impl<T: ForeignOwnable> Drop for XArray<T> {
> +    fn drop(&mut self) {
> +        let mut index: core::ffi::c_ulong =3D 0;
> +
> +        // SAFETY: `self.xa` is valid by the type invariant, and as we h=
ave
> +        // the only reference to the `XArray` we can safely iterate its =
contents
> +        // and drop everything.
> +        unsafe {
> +            let mut entry =3D bindings::xa_find(
> +                self.xa.get(),
> +                &mut index,
> +                core::ffi::c_ulong::MAX,
> +                bindings::BINDINGS_XA_PRESENT,
> +            );
> +
> +            while !entry.is_null() {
> +                T::from_foreign(entry);
> +                entry =3D bindings::xa_find_after(
> +                    self.xa.get(),
> +                    &mut index,
> +                    core::ffi::c_ulong::MAX,
> +                    bindings::BINDINGS_XA_PRESENT,
> +                );
> +            }
> +        }

This may be better split into two safety blocks (as Benno mentioned)

> +        // SAFETY: Locked locks are not safe to drop. Normally we would =
want to
> +        // try_lock()/unlock() here for safety or something similar, but=
 in this
> +        // case xa_destroy() is guaranteed to acquire the lock anyway. T=
his will
> +        // deadlock if a lock guard was improperly dropped, but that is =
not UB,
> +        // so it's sufficient for soundness purposes.
> +        unsafe {
> +            bindings::xa_destroy(self.xa.get());
> +        }
> +    }
> +}

Nit: put the semicolon outside the {...} so it goes on one line.

Looks great so far!

- Trevor
