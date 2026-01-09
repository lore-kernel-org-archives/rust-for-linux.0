Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B80331207;
	Fri,  9 Jan 2026 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955134; cv=none; b=kjovKpfJYNQKyf9bzVzpzu4ksxbgRjOrE15bJrzoaj+v8nYJU/ZRoIWjlNLyywGEZOluKsNOe30lLYxI3yHLnViJaT0g4AfZZ3NIpn6/1DuIDoiv9P1VurKUtBpGjFnIfuuP3OrtA/wZkr/hZ/iucuenif9F1ipR8XaVcQMQ0O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955134; c=relaxed/simple;
	bh=gaISv2zBLwv7gv0VLIl6C25vYedRJp6HCSudOpXztmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mweCnKOZtyZcX5oNOT5fg5Tp0kJ81L1ck2flILURKBVhsm41Qsoh4VUP4RpGReDriF6dVTu1CAa7+yyLp2ZirUC6kDyBgbjM+wIwsuC3k35b5k0SyHy0Yx3sd1RxSJ+MVT56nxWXZMGwQ45/HE3eWoYkZH4fSaAq8QFA/AkoIvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9m811U3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9m811U3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D46BC16AAE;
	Fri,  9 Jan 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767955133;
	bh=gaISv2zBLwv7gv0VLIl6C25vYedRJp6HCSudOpXztmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P9m811U34vTtmsoCfHarLL/1iBpwPiRZQKc/Zdf68AZ4CsQED+oQR1EukcMj7v75b
	 t2IbuQdWwZ03WE0WxfGmz9dxNUtX7YzgKqfIpdYk7tPNxD1kh14bjY+xpXoodDhIR/
	 dTtsoGhtlQN3KOpkh0qo9vAl19If5fF1Uw5mqjGPrzBoXRp3l1P9i0SBGuINSXE/7K
	 oib3X6fJs9TH5/zjyKPH0ERyEOwRxrOgfyoLULNMvQD50ieIX49DJ33dg2Nu07AAry
	 TWqirYrk9sZ0RGJM+g56a7dcsQg4jVPToH97G/J+wJLftP1NO9dSC2qVEDhkwLD5zY
	 PCSKDd5zcVcOg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] rust: xarray: add entry API
In-Reply-To: <CAJ-ks9=Gu8u==m_1SncFBNwzvhwmMXO-v3TG7Wxd0cRsTzkTtA@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-8-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9kYoxpPnB9amA-11SRNHbqUbp_D51qVCNDdvBZSo2gsTQ@mail.gmail.com>
 <875x9ch2xe.fsf@t14s.mail-host-address-is-not-set>
 <Ju4-5XXEy30j3L6c6jxvcJYkTSRjVww9x2MSKbNNKLFstWNFqEwSLHt1eiVMSeGBzLuo4klzhmhcQZU_tbNt_w==@protonmail.internalid>
 <CAJ-ks9=Gu8u==m_1SncFBNwzvhwmMXO-v3TG7Wxd0cRsTzkTtA@mail.gmail.com>
Date: Fri, 09 Jan 2026 11:36:29 +0100
Message-ID: <87qzrzf4ya.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Tamir Duberstein" <tamird@gmail.com> writes:

> On Thu, Jan 8, 2026 at 4:25=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Tamir Duberstein <tamird@gmail.com> writes:
>>
>> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
>> >>
>> >> Add an Entry API for XArray that provides ergonomic access to array
>> >> slots that may be vacant or occupied. The API follows the pattern of
>> >> Rust's standard library HashMap entry API, allowing efficient
>> >> conditional insertion and modification of entries.
>> >>
>> >> The implementation uses the XArray state API (`xas_*` functions) for
>> >> efficient operations without requiring multiple lookups. Helper
>> >> functions are added to rust/helpers/xarray.c to wrap C macros that are
>> >> not directly accessible from Rust.
>> >>
>> >> Also update MAINTAINERS to cover the new rust files.
>> >>
>> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> >> ---
>> >>  MAINTAINERS                 |   1 +
>> >>  rust/helpers/xarray.c       |  17 ++
>> >>  rust/kernel/xarray.rs       | 112 +++++++++++++
>> >>  rust/kernel/xarray/entry.rs | 376 ++++++++++++++++++++++++++++++++++=
++++++++++
>> >>  4 files changed, 506 insertions(+)
>> >>
>> >> diff --git a/MAINTAINERS b/MAINTAINERS
>> >> index e8f06145fb54c..79d4c9c9b2b63 100644
>> >> --- a/MAINTAINERS
>> >> +++ b/MAINTAINERS
>> >> @@ -27909,6 +27909,7 @@ B:      https://github.com/Rust-for-Linux/lin=
ux/issues
>> >>  C:     https://rust-for-linux.zulipchat.com
>> >>  T:     git https://github.com/Rust-for-Linux/linux.git xarray-next
>> >>  F:     rust/kernel/xarray.rs
>> >> +F:     rust/kernel/xarray/
>> >>
>> >>  XBOX DVD IR REMOTE
>> >>  M:     Benjamin Valentin <benpicco@googlemail.com>
>> >> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
>> >> index 60b299f11451d..425a6cc494734 100644
>> >> --- a/rust/helpers/xarray.c
>> >> +++ b/rust/helpers/xarray.c
>> >> @@ -26,3 +26,20 @@ void rust_helper_xa_unlock(struct xarray *xa)
>> >>  {
>> >>         return xa_unlock(xa);
>> >>  }
>> >> +
>> >> +void *rust_helper_xas_result(struct xa_state *xas, void *curr)
>> >> +{
>> >> +       if (xa_err(xas->xa_node))
>> >> +               curr =3D xas->xa_node;
>> >> +       return curr;
>> >> +}
>> >
>> > Instead of this duplication, can we expose `xas_result` from the heade=
r?
>>
>> `xas_result` is not currently exported. I'd rather not change that.
>
> Why?

Because it requires patching the C code, which has a very long turn
around time. I also assume that the function is private for a reason.
Exposing it in the header file would make it available to the entire kernel.

<cut>

>> >> +
>> >> +    /// Finds the next occupied entry starting at the given index, w=
rapping around.
>> >> +    ///
>> >> +    /// Searches for an entry starting at `index` up to the maximum =
index. If no entry
>> >> +    /// is found, wraps around and searches from index 0 up to `inde=
x`.
>> >> +    ///
>> >> +    /// # Examples
>> >> +    ///
>> >> +    /// ```
>> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
>> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(Alloc=
Kind::Alloc), GFP_KERNEL)?;
>> >> +    /// let mut guard =3D xa.lock();
>> >> +    ///
>> >> +    /// guard.store(100, KBox::new(42u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> >> +    /// let entry =3D guard.find_next_entry_circular(101);
>> >> +    /// assert_eq!(entry.map(|e| e.index()), Some(100));
>> >> +    ///
>> >> +    /// # Ok::<(), kernel::error::Error>(())
>> >> +    /// ```
>> >> +    pub fn find_next_entry_circular<'b>(
>> >> +        &'b mut self,
>> >> +        index: usize,
>> >> +    ) -> Option<OccupiedEntry<'a, 'b, T>> {
>> >> +        let mut state =3D XArrayState::new(self, index);
>> >> +
>> >> +        // SAFETY: `state.state` is properly initialized by XArraySt=
ate::new and the caller holds
>> >> +        // the lock.
>> >> +        let ptr =3D NonNull::new(unsafe { bindings::xas_find(&mut st=
atestate, usize::MAX) })
>> >> +            .or_else(|| {
>> >> +                state.state.xa_node =3D bindings::XAS_RESTART as *mu=
t bindings::xa_node;
>> >> +                state.state.xa_index =3D 0;
>> >> +                // SAFETY: `state.state` is properly initialized and=
 by type invariant, we hold the
>> >> +                // xarray lock.
>> >> +                NonNull::new(unsafe { bindings::xas_find(&mut state.=
state, index) })
>> >> +            })?;
>> >> +
>> >> +        Some(OccupiedEntry { state, ptr })
>> >> +    }
>> >
>> > Instead of this function, can find_next_entry take a Range? Then it
>> > would be simple for the caller to wrap if they want, without bloating
>> > this API.
>>
>> We could do that, but I am not sure if it is idiomatic? The range syntax
>> a..b is considered empty if b<a. But it still produces a valid
>> `core::ops::Range` that we could use.
>
> Can you clearly state your objection?

 - Reverse ranges are considered empty.
 - I am unsure if the approach is idiomatic.

>
>>
>> >
>> >> +
>> >>      /// Removes and returns the element at the given index.
>> >>      pub fn remove(&mut self, index: usize) -> Option<T> {
>> >>          // SAFETY:
>> >> @@ -416,8 +521,15 @@ fn new(access: &'b Guard<'a, T>, index: usize) -=
> Self {
>> >>              },
>> >>          }
>> >>      }
>> >> +
>> >> +    fn status(&self) -> Result {
>> >> +        // SAFETY: `self.state` is properly initialized and valid.
>> >> +        to_result(unsafe { bindings::xas_error(&self.state) })
>> >> +    }
>> >>  }
>> >>
>> >> +mod entry;
>> >> +
>> >>  // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` i=
ff `T` is `Send`.
>> >>  unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
>> >>
>> >> diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
>> >> new file mode 100644
>> >> index 0000000000000..1268dc35bac58
>> >> --- /dev/null
>> >> +++ b/rust/kernel/xarray/entry.rs
>> >> @@ -0,0 +1,376 @@
>> >> +// SPDX-License-Identifier: GPL-2.0
>> >> +
>> >> +use super::{
>> >> +    Guard,
>> >> +    StoreError,
>> >> +    XArrayState, //
>> >> +};
>> >> +use core::ptr::NonNull;
>> >> +use kernel::{
>> >> +    prelude::*,
>> >> +    types::ForeignOwnable, //
>> >> +};
>> >> +
>> >> +/// Represents either a vacant or occupied entry in an XArray.
>> >> +pub enum Entry<'a, 'b, T: ForeignOwnable> {
>> >> +    /// A vacant entry that can have a value inserted.
>> >> +    Vacant(VacantEntry<'a, 'b, T>),
>> >> +    /// An occupied entry containing a value.
>> >> +    Occupied(OccupiedEntry<'a, 'b, T>),
>> >> +}
>> >> +
>> >> +impl<T: ForeignOwnable> Entry<'_, '_, T> {
>> >> +    /// Returns true if this entry is occupied.
>> >> +    ///
>> >> +    /// # Examples
>> >> +    ///
>> >> +    /// ```
>> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry=
}};
>> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(Alloc=
Kind::Alloc), GFP_KERNEL)?;
>> >> +    /// let mut guard =3D xa.lock();
>> >> +    ///
>> >> +    ///
>> >> +    /// let entry =3D guard.get_entry(42);
>> >> +    /// assert_eq!(entry.is_occupied(), false);
>> >> +    ///
>> >> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNE=
L)?;
>> >> +    /// let entry =3D guard.get_entry(42);
>> >> +    /// assert_eq!(entry.is_occupied(), true);
>> >> +    ///
>> >> +    /// # Ok::<(), kernel::error::Error>(())
>> >> +    /// ```
>> >> +    pub fn is_occupied(&self) -> bool {
>> >> +        matches!(self, Entry::Occupied(_))
>> >> +    }
>> >
>> > Do we need this? IMO less is more, and even stdlib doesn't have this.
>>
>> Similar to `contains_index`, it de-clutters at call sites. I like
>>
>> if entry.is_occupied() {...}
>>
>> better than
>>
>> if matches!(entry, Entry::Occupied(_)) {...}
>
> Similar to the discussion on `contains_index` -- discarding
> information in this way seems to be a smell, but I can't say without
> seeing more code. My suggestion is not to add this until there's a
> usage that we can see in the same series.

I don't have a user for this one at the moment. I guess I can drop it.

<cut>

>> >> +
>> >> +        self.state.status().map(|()| new).map_err(|error| {
>> >> +            // SAFETY: `new` came from `T::into_foreign` and `xas_st=
ore` does not take ownership of
>> >> +            // the value on error.
>> >> +            let value =3D unsafe { T::from_foreign(new) };
>> >> +            StoreError { value, error }
>> >> +        })
>> >> +    }
>> >> +
>> >> +    /// Inserts a value into this vacant entry.
>> >> +    ///
>> >> +    /// Returns a reference to the newly inserted value.
>> >> +    ///
>> >> +    /// - This method will fail if the nodes on the path to the index
>> >> +    ///   represented by this entry are not present in the XArray.
>> >> +    /// - This method will not drop the XArray lock.
>> >> +    ///
>> >> +    ///
>> >> +    /// # Examples
>> >> +    ///
>> >> +    /// ```
>> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry=
}};
>> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(Alloc=
Kind::Alloc), GFP_KERNEL)?;
>> >> +    /// let mut guard =3D xa.lock();
>> >> +    ///
>> >> +    /// assert_eq!(guard.get(42), None);
>> >> +    ///
>> >> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
>> >> +    ///     let value =3D KBox::new(0x1337u32, GFP_KERNEL)?;
>> >> +    ///     let borrowed =3D entry.insert(value)?;
>> >> +    ///     assert_eq!(*borrowed, 0x1337);
>> >> +    /// }
>> >> +    ///
>> >> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
>> >> +    ///
>> >> +    /// # Ok::<(), kernel::error::Error>(())
>> >> +    /// ```
>> >> +    pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, =
StoreError<T>> {
>> >> +        let new =3D self.insert_internal(value)?;
>> >> +
>> >> +        // SAFETY: `new` came from `T::into_foreign`.The entry has e=
xclusive
>> >
>> > This is knowledge at a distance. There's no comment anywhere that
>> > promises that insert_internal called T::into_foreign.
>>
>> How would you handle this? Add documentation to `insert_internal`?
>
> I think `insert_internal` can return a reference, which would be
> cleaner (i.e. call T::borrow_mut *there*).

This does not compose well with the implementation of `insert_entry`,
which needs the void pointer type. `T::BorrowedMut<_>` cannot be turned
back into a pointer, because we do not set any bounds on it.

<cut>

>> >> +/// A view into an occupied entry in an XArray.
>> >> +pub struct OccupiedEntry<'a, 'b, T: ForeignOwnable> {
>> >> +    pub(crate) state: XArrayState<'a, 'b, T>,
>> >> +    pub(crate) ptr: NonNull<c_void>,
>> >> +}
>> >> +
>> >> +impl<'a, 'b, T> OccupiedEntry<'a, 'b, T>
>> >> +where
>> >> +    T: ForeignOwnable,
>> >> +{
>> >> +    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize, ptr=
: NonNull<c_void>) -> Self {
>> >> +        Self {
>> >> +            state: XArrayState::new(guard, index),
>> >> +            ptr,
>> >> +        }
>> >> +    }
>> >> +
>> >> +    /// Removes the value from this occupied entry and returns it, c=
onsuming the entry.
>> >> +    ///
>> >> +    /// # Examples
>> >> +    ///
>> >> +    /// ```
>> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry=
}};
>> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(Alloc=
Kind::Alloc), GFP_KERNEL)?;
>> >> +    /// let mut guard =3D xa.lock();
>> >> +    ///
>> >> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNE=
L)?;
>> >> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
>> >> +    ///
>> >> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
>> >> +    ///     let value =3D entry.remove();
>> >> +    ///     assert_eq!(*value, 0x1337);
>> >> +    /// }
>> >> +    ///
>> >> +    /// assert_eq!(guard.get(42), None);
>> >> +    ///
>> >> +    /// # Ok::<(), kernel::error::Error>(())
>> >> +    /// ```
>> >> +    pub fn remove(mut self) -> T {
>> >> +        // NOTE: Storing NULL to an occupied slot never fails.
>> >
>> > Shouldn't this be on the debug assert below? Also, is there a citation?
>>
>> I'll move it.
>>
>> I don't think I have a citation for that. This is a consequence of the
>> data structure design. If the slot is occupied, the node has already
>> been allocated, and allocation error is the only failure mode for this p=
ath.
>
> OK, if there's no citation, then you've got to document your reasoning
> for this conclusion, I think.

Ok, I'll expand the NOTE.


Best regards,
Andreas Hindborg


