Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZPTBXsl7"
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F55B8
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 09:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=qwmb6ilfgre7rfrmbintnxywfy.protonmail; t=1701105596; x=1701364796;
	bh=h7wt9r82eFZ8yCEvLZLMKzp/kkq6DzZrIMcBSsdx0aA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZPTBXsl7hmM85bbUJODj8LX2Qdf2oVx3n7Bf3TQDRL0WAQaX3fAAiCq9hM1qoIUak
	 FjNltk1eNFyYhdTKerrneijqef3XqsGBcFzIa/jpEmVHQqXb05dxACvZ2SiISGFEvl
	 KmNjcWqRf2Wi2dcl2wbWqPr7kiieljzL7Sow0AQpkHIF1YNfeDavqWPF3SsA0yADVr
	 hpmsLTjaCzp7sgDmBF5RakuWVE44ct8bNDOouI09ALTIWO2JCi/HbXWwRpM0R+rWVJ
	 t2wgqE1JSYMQvX1/n2b9K68j8eg1JiOpLzIJGv0GxF9PmfRuS3hZB1zdUuDPkNz3iJ
	 idogrhc3HRMgg==
Date: Mon, 27 Nov 2023 17:19:44 +0000
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Matthew Wilcox <willy@infradead.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4] rust: xarray: Add an abstraction for XArray
Message-ID: <df33bee1-f3a3-45f7-919a-6f016877d2c3@proton.me>
In-Reply-To: <20231126131210.1384490-1-mcanal@igalia.com>
References: <20231126131210.1384490-1-mcanal@igalia.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.11.23 14:01, Ma=C3=ADra Canal wrote:

[...]

> +/// Wrapper for a value owned by the `XArray` which holds the `XArray` l=
ock until dropped.
> +///
> +/// # Invariants
> +///
> +/// The `*mut T` is always non-NULL and owned by the referenced `XArray`

This invariant is missing that the lock must be held.

> +pub struct Guard<'a, T: ForeignOwnable>(*mut T, &'a Opaque<bindings::xar=
ray>);

If `self.0` is always non-null, why don't you use `NonNull<T>`?

> +impl<'a, T: ForeignOwnable> Guard<'a, T> {
> +    /// Borrow the underlying value wrapped by the `Guard`.
> +    ///
> +    /// Returns a `T::Borrowed` type for the owned `ForeignOwnable` type=
.
> +    pub fn borrow<'b>(&'b self) -> T::Borrowed<'b>
> +    where
> +        'a: 'b,

Any reason for spelling out the lifetimes? IIRC you should just
be able to write

     pub fn borrow(&self) -> T::Borrowed<'_>

> +    {
> +        // SAFETY: The value is owned by the `XArray`, the lifetime it i=
s borrowed for must not
> +        // outlive the `XArray` itself, nor the Guard that holds the loc=
k ensuring the value
> +        // remains in the `XArray`.

- What prevents the `XArray` from calling `T::from_foreign`?
- Why is `self.0` a pointer that was returned by a call to
   `into_foreign`?

these things should be part of the guard safety invariant.

> +        unsafe { T::borrow(self.0 as _) }
> +    }
> +}

[...]

> +/// Represents a reserved slot in an `XArray`, which does not yet have a=
 value but has an assigned
> +/// index and may not be allocated by any other user. If the Reservation=
 is dropped without
> +/// being filled, the entry is marked as available again.
> +///
> +/// Users must ensure that reserved slots are not filled by other mechan=
isms, or otherwise their
> +/// contents may be dropped and replaced (which will print a warning).
> +pub struct Reservation<'a, T: ForeignOwnable>(&'a XArray<T>, usize, Phan=
tomData<T>);
> +
> +impl<'a, T: ForeignOwnable> Reservation<'a, T> {
> +    /// Store a value into the reserved slot.
> +    pub fn store(self, value: T) -> Result<usize> {
> +        if self.0.replace(self.1, value)?.is_some() {
> +            crate::pr_err!("XArray: Reservation stored but the entry alr=
eady had data!\n");
> +            // Consider it a success anyway, not much we can do
> +        }
> +        let index =3D self.1;
> +        core::mem::forget(self);
> +        Ok(index)
> +    }
> +
> +    /// Returns the index of this reservation.
> +    pub fn index(&self) -> usize {
> +        self.1
> +    }
> +}
> +
> +impl<'a, T: ForeignOwnable> Drop for Reservation<'a, T> {
> +    fn drop(&mut self) {
> +        if self.0.remove(self.1).is_some() {
> +            crate::pr_err!("XArray: Reservation dropped but the entry wa=
s not empty!\n");
> +        }
> +    }
> +}
> +
> +/// An array which efficiently maps sparse integer indices to owned obje=
cts.
> +///
> +/// This is similar to a `Vec<Option<T>>`, but more efficient when there=
 are holes in the
> +/// index space, and can be efficiently grown.
> +///
> +/// This structure is expected to often be used with an inner type that =
can either be efficiently
> +/// cloned, such as an `Arc<T>`.

~> "This structure is expected to often be used with an inner type that
can be efficiently cloned, such as an `Arc<T>`."

> +pub struct XArray<T: ForeignOwnable> {
> +    xa: Opaque<bindings::xarray>,
> +    _p: PhantomData<T>,
> +}
> +
> +impl<T: ForeignOwnable> XArray<T> {
> +    /// Creates a new `XArray` with the given flags.
> +    pub fn new(flags: Flags) -> Result<XArray<T>> {
> +        let xa =3D Opaque::uninit();
> +
> +        // SAFETY: We have just created `xa`. This data structure does n=
ot require
> +        // pinning.
> +        unsafe { bindings::xa_init_flags(xa.get(), flags) };
> +
> +        // INVARIANT: Initialize the `XArray` with a valid `xa`.

There is no such invariant on `XArray`.

> +        Ok(XArray {
> +            xa,
> +            _p: PhantomData,
> +        })
> +    }

I have taken a very quick look at the C side and it seems
that there is a spinlock inside of the `struct xarray`.
Our current abstraction `Spinlock<T>` requires pinning,
because there might be some architectures that require
that for their spinlocks (AFAIK, maybe Boqun or someone else
can confirm?). So I would expect `XArray` to also require pinning
and thus use pin-init for initialization.


> +
> +    /// Replaces an entry with a new value, returning the old value (if =
any).
> +    pub fn replace(&self, index: usize, value: T) -> Result<Option<T>> {
> +        let new =3D value.into_foreign();
> +        let guard =3D ScopeGuard::new(|| unsafe {

Missing SAFETY comment.

> +            T::from_foreign(new);
> +        });
> +
> +        let old =3D unsafe {

Missing SAFETY comment.

> +            bindings::xa_store(
> +                self.xa.get(),
> +                index.try_into()?,
> +                new as *mut _,
> +                bindings::GFP_KERNEL,
> +            )
> +        };
> +
> +        let err =3D unsafe { bindings::xa_err(old) };

Missing SAFETY comment.

> +        if err !=3D 0 {
> +            Err(Error::from_errno(err))
> +        } else if old.is_null() {
> +            guard.dismiss();
> +            Ok(None)
> +        } else {
> +            guard.dismiss();
> +            Ok(Some(unsafe { T::from_foreign(old) }))

Missing SAFETY comment.

> +        }

For the error handling here, I would use `kernel::error::to_result`:

     to_result(unsafe { bindings::xa_err(old) })?;
     guard.dismiss();
     Ok(if old.is_null() {
        None
     } else {
         Some(unsafe { T::from_foreign(old) })
     })

> +    }
> +
> +    /// Replaces an entry with a new value, dropping the old value (if a=
ny).
> +    pub fn set(&self, index: usize, value: T) -> Result {
> +        self.replace(index, value)?;
> +        Ok(())
> +    }
> +
> +    /// Looks up and returns a reference to an entry in the array, retur=
ning a `Guard` if it
> +    /// exists.
> +    ///
> +    /// This guard blocks all other actions on the `XArray`. Callers are=
 expected to drop the
> +    /// `Guard` eagerly to avoid blocking other users, such as by taking=
 a clone of the value.
> +    pub fn get(&self, index: usize) -> Option<Guard<'_, T>> {
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        let p =3D unsafe {
> +            bindings::xa_lock(self.xa.get());
> +            bindings::xa_load(self.xa.get(), index.try_into().ok()?)
> +        };
> +
> +        if p.is_null() {
> +            unsafe { bindings::xa_unlock(self.xa.get()) };

Again, missing SAFETY comment. I will omit this complain from now on.

> +            None
> +        } else {
> +            Some(Guard(p as _, &self.xa))
> +        }

I think it is better to use a `ScopeGuard` to do the locking and
unlocking and to just give ownership of that `ScopeGuard` to your
`Guard` in the happy path.

> +    }
> +
> +    /// Removes and returns an entry, returning it if it existed.
> +    pub fn remove(&self, index: usize) -> Option<T> {
> +        let p =3D unsafe { bindings::xa_erase(self.xa.get(), index.try_i=
nto().ok()?) };
> +        if p.is_null() {
> +            None
> +        } else {
> +            Some(unsafe { T::from_foreign(p) })

I think you should have the invariant on `XArray` that all pointers
stored in the array are pointers obtained by calling `T::into_foreign`.

> +        }
> +    }
> +
> +    /// Allocate a new index in the array, optionally storing a new valu=
e into it, with
> +    /// configurable bounds for the index range to allocate from.
> +    ///
> +    /// If `value` is `None`, then the index is reserved from further al=
location but remains
> +    /// free for storing a value into it.
> +    pub fn alloc_limits(&self, value: Option<T>, min: u32, max: u32) -> =
Result<usize> {

I find it a bit weird to have both the reservation mechanism *and* this
function taking an `Option<T>`. Is this really needed?

I think the name could be changed to `insert_between`, since that would
better reflect the "datastructure"-nature of this type. But it would
also be reasonable to keep the name `alloc`, since in C the function is
called `xa_alloc`.

> +        let new =3D value.map_or(core::ptr::null(), |a| a.into_foreign()=
);
> +        let mut id: u32 =3D 0;
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
> +
> +        if ret < 0 {
> +            // Make sure to drop the value we failed to store
> +            if !new.is_null() {
> +                // SAFETY: If `new` is not NULL, it came from the `Forei=
gnOwnable` we got
> +                // from the caller.
> +                unsafe { T::from_foreign(new) };
> +            }

The error handling should be done with `ScopeGuard`.

> +            Err(Error::from_errno(ret))
> +        } else {
> +            Ok(id as usize)
> +        }
> +    }
> +
> +    /// Allocate a new index in the array, optionally storing a new valu=
e into it.
> +    ///
> +    /// If `value` is `None`, then the index is reserved from further al=
location but remains
> +    /// free for storing a value into it.
> +    pub fn alloc(&self, value: Option<T>) -> Result<usize> {
> +        self.alloc_limits(value, 0, u32::MAX)
> +    }
> +
> +    /// Reserve a new index in the array within configurable bounds for =
the index.
> +    ///
> +    /// Returns a `Reservation` object, which can then be used to store =
a value at this index or
> +    /// otherwise free it for reuse.
> +    pub fn reserve_limits(&self, min: u32, max: u32) -> Result<Reservati=
on<'_, T>> {
> +        Ok(Reservation(
> +            self,
> +            self.alloc_limits(None, min, max)?,
> +            PhantomData,
> +        ))
> +    }
> +
> +    /// Reserve a new index in the array.
> +    ///
> +    /// Returns a `Reservation` object, which can then be used to store =
a value at this index or
> +    /// otherwise free it for reuse.
> +    pub fn reserve(&self) -> Result<Reservation<'_, T>> {
> +        Ok(Reservation(self, self.alloc(None)?, PhantomData))
> +    }
> +}
> +
> +impl<T: ForeignOwnable> Drop for XArray<T> {
> +    fn drop(&mut self) {
> +        // SAFETY: `self.xa` is valid by the type invariant, and as we h=
ave the only reference to
> +        // the `XArray` we can safely iterate its contents and drop ever=
ything.
> +        unsafe {
> +            let mut index: core::ffi::c_ulong =3D 0;
> +            let mut entry =3D bindings::xa_find(
> +                self.xa.get(),
> +                &mut index,
> +                core::ffi::c_ulong::MAX,
> +                bindings::BINDINGS_XA_PRESENT,
> +            );
> +            while !entry.is_null() {
> +                T::from_foreign(entry);
> +                entry =3D bindings::xa_find_after(
> +                    self.xa.get(),
> +                    &mut index,
> +                    core::ffi::c_ulong::MAX,
> +                    bindings::BINDINGS_XA_PRESENT,
> +                );
> +            }
> +
> +            bindings::xa_destroy(self.xa.get());
> +        }

Please split this `unsafe` block.

--=20
Cheers,
Benno

> +    }
> +}
> +
> +// SAFETY: XArray is thread-safe and all mutation operations are interna=
lly locked.
> +unsafe impl<T: Send + ForeignOwnable> Send for XArray<T> {}
> +unsafe impl<T: Sync + ForeignOwnable> Sync for XArray<T> {}
> --
> 2.41.0
>=20

