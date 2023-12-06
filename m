Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AEh2POcM"
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C61DE
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Dec 2023 03:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1701862274; x=1702121474;
	bh=MawjpEgvddTffXN7C9CoX/mzwjZrjbc6qLXMvPPc1UQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AEh2POcMNd7hHJzKWc2xtt8SheF9gMMZVLFkT4cbir+j/X6cqydFam4/pIScy+edk
	 kGspeG7NGGr87v27hlA4Thy5HOX+CU3pEoRvh2bIRH8kCm64k5rxxN56ZRh8jFABY3
	 nCGT6Gvwf9espjqOIHjyrpzSAcX8Mf74n1lIvqTpSkEBOcDrHMZKnTnMmY/wOSod1H
	 pubVfi7jNUxrPZnyqq2TlbokId5dNux+76T5dDVs4rJKTyo1YaObwyVazFIebpAGlF
	 kWBMtsHwI4HHFKkEKJ6q0CIdttzfeS7WscbTbr2gLJv8iLG+CwADH6EWJ7hxBNI2OX
	 9Pf5Cf1+SBI9w==
Date: Wed, 06 Dec 2023 11:31:08 +0000
To: =?utf-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Matthew Wilcox <willy@infradead.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH v5] rust: xarray: Add an abstraction for XArray
Message-ID: <cbd727dd-3bb1-4a1b-8264-cf31f231a328@proton.me>
In-Reply-To: <20231201195300.1329092-1-mcanal@igalia.com>
References: <20231201195300.1329092-1-mcanal@igalia.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/1/23 20:50, Ma=C3=ADra Canal wrote:
> +/// Wrapper for a value owned by the `XArray` which holds the `XArray` l=
ock until dropped.
> +pub struct Guard<'a, T: ForeignOwnable>(NonNull<T>, Pin<&'a XArray<T>>);

No invariant for `self.0` being a pointer derived from
`T::into_foreign`?

> +// INVARIANTS: The lock held by the Guard prevents concurrent access to =
the XArray.
> +// The Guard's Drop implementation releases the lock only when the Guard=
 is
> +// dropped, ensuring exclusive access during its existence. Therefore, w=
ithin
> +// the Guard's lifetime, no other operation (including the XArray
> +// calling `T::from_foreign`) can access or modify the underlying value.

Why is this invariants comment on the `impl`?

> +// The Guard holds a reference (`self.0`) to the underlying value owned =
by
> +// XArray. You can use the `into_foreign` method to obtain a pointer to =
the
> +// foreign representation of the owned value, which is valid for the lif=
etime
> +// of the Guard.
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

Here would be the right place to mention the `Guard` invariant, but not
using an `INVARIANT` comment, instead use "by the type invariant of
`Guard`...".

> +        unsafe { T::borrow(self.0.as_ptr() as _) }
> +    }
> +}
> +
> +// Convenience impl for `ForeignOwnable` types whose `Borrowed`
> +// form implements Deref.
> +impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
> +where
> +    T::Borrowed<'a>: Deref,
> +    for<'b> T::Borrowed<'b>: Into<&'b <T::Borrowed<'a> as Deref>::Target=
>,
> +{
> +    type Target =3D <T::Borrowed<'a> as Deref>::Target;
> +
> +    fn deref(&self) -> &Self::Target {
> +        self.borrow().into()
> +    }
> +}
> +
> +impl<'a, T: ForeignOwnable> Drop for Guard<'a, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: The XArray we have a reference to owns the C xarray o=
bject.

This must also be justified by the type invariant.

> +        unsafe { bindings::xa_unlock(self.1.xa.get()) };
> +    }
> +}
> +
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

When using pin-init (see below for what I mean by this), the
`Pin<&'a ..>` is not needed (instead just use `&'a ..`).

[...]

> +/// An array which efficiently maps sparse integer indices to owned obje=
cts.
> +///
> +/// This is similar to a `Vec<Option<T>>`, but more efficient when there=
 are holes in the
> +/// index space, and can be efficiently grown.
> +///
> +/// This structure is expected to often be used with an inner type that
> +/// can be efficiently cloned, such as an `Arc<T>`.

No invariants?

> +pub struct XArray<T: ForeignOwnable> {
> +    xa: Opaque<bindings::xarray>,
> +    _p: PhantomData<T>,
> +    _q: PhantomPinned,

You do not need this, recently we changed `Opaque<T>` to have the same
functionality.

> +}
> +
> +impl<T: ForeignOwnable> XArray<T> {
> +    /// Creates a new `XArray` with the given flags.
> +    pub fn new(flags: Flags) -> XArray<T> {

Sorry, it seems I forgot to tell you about the pin-init API. See the
documentation at [1].
You should change the return type of `new` to be `impl PinInit<Self>`.
Then the pin-init API ensures that an `XArray` can only be created in a
pinned state.

The body of `new` should then just use `pin_init!` and
`Opaque::ffi_init`.

Doing this allows you to use `&self` as the receiver type.


[1]: https://rust-for-linux.github.io/docs/v6.6-rc2/kernel/init/index.html

> +        let xa =3D Opaque::uninit();
> +
> +        // SAFETY: We have just created `xa`. This data structure does n=
ot require
> +        // pinning.
> +        unsafe { bindings::xa_init_flags(xa.get(), flags) };
> +
> +        // INVARIANT: All pointers stored in the array are pointers obta=
ined by
> +        // calling `T::into_foreign`.

This invariant is not recorded on the type itself?

> +        XArray {
> +            xa,
> +            _p: PhantomData,
> +            _q: PhantomPinned,
> +        }
> +    }
> +
> +    /// Replaces an entry with a new value, returning the old value (if =
any).
> +    pub fn replace(self: Pin<&Self>, index: usize, value: T) -> Result<O=
ption<T>> {

As I said above, if you use the `pin-init` API, you can use `&self`
here.

[...]

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

Is that really the only requirement for calling `xa_unlock`?

> +
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        let p =3D unsafe { bindings::xa_load(self.xa.get(), index.try_in=
to().ok()?) };

Are you required to hold the lock for this operation? Then you need to
state so in the SAFETY comment.

> +
> +        NonNull::new(p as *mut T).map(|p| {
> +            guard.dismiss();
> +            Guard(p, self)
> +        })
> +    }
> +
> +    /// Removes and returns an entry, returning it if it existed.
> +    pub fn remove(self: Pin<&Self>, index: usize) -> Option<T> {
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        let p =3D unsafe { bindings::xa_erase(self.xa.get(), index.try_i=
nto().ok()?) };
> +        if p.is_null() {
> +            None
> +        } else {
> +            // SAFETY: All pointers stored in the array are pointers obt=
ained by
> +            // calling `T::into_foreign`.
> +            Some(unsafe { T::from_foreign(p) })
> +        }
> +    }
> +
> +    /// Allocates a new index in the array, optionally storing a new val=
ue into it, with
> +    /// configurable bounds for the index range to allocate from.
> +    ///
> +    /// If `value` is `None`, then the index is reserved from further al=
location but remains
> +    /// free for storing a value into it.
> +    fn alloc_limits_opt(self: Pin<&Self>, value: Option<T>, min: u32, ma=
x: u32) -> Result<usize> {

In my last mail I wrote:

    I find it a bit weird to have both the reservation mechanism *and* this
    function taking an `Option<T>`. Is this really needed?
   =20
    I think the name could be changed to `insert_between`, since that would
    better reflect the "datastructure"-nature of this type. But it would
    also be reasonable to keep the name `alloc`, since in C the function is
    called `xa_alloc`.

I have no idea what your rationale for the current choice is, could you
please explain?

[...]

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

This block needs to be split such that it is clear which operations are
unsafe and which operations are safe. Additionally there is the
`T::from_foreign` call inside for which the SAFETY comment has no
justification.

> +
> +        // SAFETY: Locked locks are not safe to drop. Normally we would =
want to
> +        // try_lock()/unlock() here for safety or something similar, but=
 in this
> +        // case xa_destroy() is guaranteed to acquire the lock anyway. T=
his will
> +        // deadlock if a lock guard was improperly dropped, but that is =
not UB,
> +        // so it's sufficient for soundness purposes.

This SAFETY comment is unclear, please try to reduce it to the satisfied
requirements of `xa_destroy`. If you want to state something else, you
can still have a comment above.

--=20
Cheers,
Benno

> +        unsafe {
> +            bindings::xa_destroy(self.xa.get());
> +        }
> +    }
> +}
> +
> +// SAFETY: XArray is thread-safe and all mutation operations are interna=
lly locked.
> +unsafe impl<T: Send + ForeignOwnable> Send for XArray<T> {}
> +unsafe impl<T: Sync + ForeignOwnable> Sync for XArray<T> {}
> --
> 2.42.0
>=20

