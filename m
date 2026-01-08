Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF6943AD4C;
	Thu,  8 Jan 2026 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864312; cv=none; b=lN0wmmcVsmSUkFE5MaSKSGQoGv1y8w7Lcf4+Fy7d8XbF9Fjl8pENkmQIJTsWAcy/hPXPqCa56NaCv9mC9buwJ8nmSobPmctc2XSnK0d9wtOKFi1YWVsMFS5vBG7GK3ylO/3znhkDHx9gdwwbZ52Nc1+IiwwkRtMCCAKMr6gcx50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864312; c=relaxed/simple;
	bh=Ho9QgxO3WBQbpjGPLcGgOoGNyoHbqZAsFhwf2DaFVdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X13u2z+1OrR/yTGNJ9z+wt9FZUIFNi55bWGSbrs9PO6TwtEAKMPdhdNSgBdoSHksGKtMmRGsT4yof4QW131oJL0jn1lBzYjYxN9wl4GnH0u2x9/1qxmuCYdE2YRW8SZfevrAg1HbTr91mhfe2p/fd1uZWsxsVmzx/W2nkWLZPow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmmJTFtM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmmJTFtM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45327C116C6;
	Thu,  8 Jan 2026 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767864311;
	bh=Ho9QgxO3WBQbpjGPLcGgOoGNyoHbqZAsFhwf2DaFVdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EmmJTFtMzczv6lNIwl7uM7rwVQqJsv0AdrdxEFgwqWOn6ZSKnZc4+3JED+3WcvwLz
	 bqHzZEAj+YrSd7aMzAWSVt0V4LLUPQ+Ni5nfOb33hoVXye84bEeSsZQJBeIi1b1mHZ
	 2ptFw37gphXjMqieVwvhNTBExd81pOtv+Foa/IOm788+TKChAHTn31EYJ/rMxvEp2T
	 LlfZc1RM2eQfVSXKbuyoMA9wgVO7o11USxPNAze7Zt/nLyiWaWfRtXK96oRjcOwyYI
	 6w49aZrbl9BttDr7htPOpr0qcNQut7qep76Re59iIHTpOs7bSPxKa9uQhOvJ/Hjxw6
	 9WtYmKbdllzDg==
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
In-Reply-To: <CAJ-ks9kYoxpPnB9amA-11SRNHbqUbp_D51qVCNDdvBZSo2gsTQ@mail.gmail.com>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-8-9e5ffd5e3cf0@kernel.org>
 <CAJ-ks9kYoxpPnB9amA-11SRNHbqUbp_D51qVCNDdvBZSo2gsTQ@mail.gmail.com>
Date: Thu, 08 Jan 2026 10:25:01 +0100
Message-ID: <875x9ch2xe.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Add an Entry API for XArray that provides ergonomic access to array
>> slots that may be vacant or occupied. The API follows the pattern of
>> Rust's standard library HashMap entry API, allowing efficient
>> conditional insertion and modification of entries.
>>
>> The implementation uses the XArray state API (`xas_*` functions) for
>> efficient operations without requiring multiple lookups. Helper
>> functions are added to rust/helpers/xarray.c to wrap C macros that are
>> not directly accessible from Rust.
>>
>> Also update MAINTAINERS to cover the new rust files.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  MAINTAINERS                 |   1 +
>>  rust/helpers/xarray.c       |  17 ++
>>  rust/kernel/xarray.rs       | 112 +++++++++++++
>>  rust/kernel/xarray/entry.rs | 376 +++++++++++++++++++++++++++++++++++++=
+++++++
>>  4 files changed, 506 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e8f06145fb54c..79d4c9c9b2b63 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -27909,6 +27909,7 @@ B:      https://github.com/Rust-for-Linux/linux/=
issues
>>  C:     https://rust-for-linux.zulipchat.com
>>  T:     git https://github.com/Rust-for-Linux/linux.git xarray-next
>>  F:     rust/kernel/xarray.rs
>> +F:     rust/kernel/xarray/
>>
>>  XBOX DVD IR REMOTE
>>  M:     Benjamin Valentin <benpicco@googlemail.com>
>> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
>> index 60b299f11451d..425a6cc494734 100644
>> --- a/rust/helpers/xarray.c
>> +++ b/rust/helpers/xarray.c
>> @@ -26,3 +26,20 @@ void rust_helper_xa_unlock(struct xarray *xa)
>>  {
>>         return xa_unlock(xa);
>>  }
>> +
>> +void *rust_helper_xas_result(struct xa_state *xas, void *curr)
>> +{
>> +       if (xa_err(xas->xa_node))
>> +               curr =3D xas->xa_node;
>> +       return curr;
>> +}
>
> Instead of this duplication, can we expose `xas_result` from the header?

`xas_result` is not currently exported. I'd rather not change that.

>
>> +
>> +void *rust_helper_xa_zero_to_null(void *entry)
>> +{
>> +       return xa_is_zero(entry) ? NULL : entry;
>> +}
>> +
>> +int rust_helper_xas_error(const struct xa_state *xas)
>> +{
>> +       return xas_error(xas);
>> +}
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index 9d4589979fd1d..2b8d56c81e36b 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -13,11 +13,17 @@
>>          NonNull, //
>>      },
>>  };
>> +pub use entry::{
>> +    Entry,
>> +    OccupiedEntry,
>> +    VacantEntry, //
>> +};
>>  use kernel::{
>>      alloc,
>>      bindings,
>>      build_assert, //
>>      error::{
>> +        to_result,
>>          Error,
>>          Result, //
>>      },
>> @@ -255,6 +261,35 @@ pub fn get_mut(&mut self, index: usize) -> Option<T=
::BorrowedMut<'_>> {
>>          Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
>>      }
>>
>> +    /// Gets an entry for the specified index, which can be vacant or o=
ccupied.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// assert_eq!(guard.contains_index(42), false);
>> +    ///
>> +    /// match guard.get_entry(42) {
>> +    ///     Entry::Vacant(entry) =3D> {
>> +    ///         entry.insert(KBox::new(0x1337u32, GFP_KERNEL)?)?;
>> +    ///     }
>> +    ///     Entry::Occupied(_) =3D> unreachable!("We did not insert an =
entry yet"),
>> +    /// }
>> +    ///
>> +    /// assert_eq!(guard.get(42), Some(&0x1337));
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn get_entry<'b>(&'b mut self, index: usize) -> Entry<'a, 'b, T=
> {
>> +        match self.load(index) {
>> +            None =3D> Entry::Vacant(VacantEntry::new(self, index)),
>> +            Some(ptr) =3D> Entry::Occupied(OccupiedEntry::new(self, ind=
ex, ptr)),
>> +        }
>> +    }
>
> Why not "entry" like the stdlib collections?

Right, it has to be `entry`, so says the API naming guidelines.

>
>> +
>>      fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_void>=
)> {
>>          let mut state =3D XArrayState::new(self, index);
>>          // SAFETY: `state.state` is always valid by the type invariant =
of
>> @@ -320,6 +355,76 @@ pub fn find_next_mut(&mut self, index: usize) -> Op=
tion<(usize, T::BorrowedMut<'
>>              .map(move |(index, ptr)| (index, unsafe { T::borrow_mut(ptr=
as_ptr()) }))
>>      }
>>
>> +    /// Finds the next occupied entry starting from the given index.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    /// guard.store(20, KBox::new(20u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    ///
>> +    /// if let Some(entry) =3D guard.find_next_entry(5) {
>> +    ///     assert_eq!(entry.index(), 10);
>> +    ///     let value =3D entry.remove();
>> +    ///     assert_eq!(*value, 10);
>> +    /// }
>> +    ///
>> +    /// assert_eq!(guard.get(10), None);
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn find_next_entry<'b>(&'b mut self, index: usize) -> Option<Oc=
cupiedEntry<'a, 'b, T>> {
>> +        let mut state =3D XArrayState::new(self, index);
>> +
>> +        // SAFETY: `state.state` is properly initialized by XArrayState=
::new and the caller holds
>> +        // the lock.
>> +        let ptr =3D NonNull::new(unsafe { bindings::xas_find(&mut state=
state, usize::MAX) })?;
>> +
>> +        Some(OccupiedEntry { state, ptr })
>> +    }
>
> I'm surprised this doesn't share code with find_next_mut. Can it?
> Again, I'd have expected the bulk of the logic to be on XArrayState.

I'll try to move the logic and reuse `load_next`.

>
>> +
>> +    /// Finds the next occupied entry starting at the given index, wrap=
ping around.
>> +    ///
>> +    /// Searches for an entry starting at `index` up to the maximum ind=
ex. If no entry
>> +    /// is found, wraps around and searches from index 0 up to `index`.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// guard.store(100, KBox::new(42u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    /// let entry =3D guard.find_next_entry_circular(101);
>> +    /// assert_eq!(entry.map(|e| e.index()), Some(100));
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn find_next_entry_circular<'b>(
>> +        &'b mut self,
>> +        index: usize,
>> +    ) -> Option<OccupiedEntry<'a, 'b, T>> {
>> +        let mut state =3D XArrayState::new(self, index);
>> +
>> +        // SAFETY: `state.state` is properly initialized by XArrayState=
::new and the caller holds
>> +        // the lock.
>> +        let ptr =3D NonNull::new(unsafe { bindings::xas_find(&mut state=
state, usize::MAX) })
>> +            .or_else(|| {
>> +                state.state.xa_node =3D bindings::XAS_RESTART as *mut b=
indings::xa_node;
>> +                state.state.xa_index =3D 0;
>> +                // SAFETY: `state.state` is properly initialized and by=
 type invariant, we hold the
>> +                // xarray lock.
>> +                NonNull::new(unsafe { bindings::xas_find(&mut state.sta=
te, index) })
>> +            })?;
>> +
>> +        Some(OccupiedEntry { state, ptr })
>> +    }
>
> Instead of this function, can find_next_entry take a Range? Then it
> would be simple for the caller to wrap if they want, without bloating
> this API.

We could do that, but I am not sure if it is idiomatic? The range syntax
a..b is considered empty if b<a. But it still produces a valid
`core::ops::Range` that we could use.

>
>> +
>>      /// Removes and returns the element at the given index.
>>      pub fn remove(&mut self, index: usize) -> Option<T> {
>>          // SAFETY:
>> @@ -416,8 +521,15 @@ fn new(access: &'b Guard<'a, T>, index: usize) -> S=
elf {
>>              },
>>          }
>>      }
>> +
>> +    fn status(&self) -> Result {
>> +        // SAFETY: `self.state` is properly initialized and valid.
>> +        to_result(unsafe { bindings::xas_error(&self.state) })
>> +    }
>>  }
>>
>> +mod entry;
>> +
>>  // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff =
`T` is `Send`.
>>  unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
>>
>> diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
>> new file mode 100644
>> index 0000000000000..1268dc35bac58
>> --- /dev/null
>> +++ b/rust/kernel/xarray/entry.rs
>> @@ -0,0 +1,376 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use super::{
>> +    Guard,
>> +    StoreError,
>> +    XArrayState, //
>> +};
>> +use core::ptr::NonNull;
>> +use kernel::{
>> +    prelude::*,
>> +    types::ForeignOwnable, //
>> +};
>> +
>> +/// Represents either a vacant or occupied entry in an XArray.
>> +pub enum Entry<'a, 'b, T: ForeignOwnable> {
>> +    /// A vacant entry that can have a value inserted.
>> +    Vacant(VacantEntry<'a, 'b, T>),
>> +    /// An occupied entry containing a value.
>> +    Occupied(OccupiedEntry<'a, 'b, T>),
>> +}
>> +
>> +impl<T: ForeignOwnable> Entry<'_, '_, T> {
>> +    /// Returns true if this entry is occupied.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    ///
>> +    /// let entry =3D guard.get_entry(42);
>> +    /// assert_eq!(entry.is_occupied(), false);
>> +    ///
>> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    /// let entry =3D guard.get_entry(42);
>> +    /// assert_eq!(entry.is_occupied(), true);
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn is_occupied(&self) -> bool {
>> +        matches!(self, Entry::Occupied(_))
>> +    }
>
> Do we need this? IMO less is more, and even stdlib doesn't have this.

Similar to `contains_index`, it de-clutters at call sites. I like

if entry.is_occupied() {...}

better than

if matches!(entry, Entry::Occupied(_)) {...}

>
>> +}
>> +
>> +/// A view into a vacant entry in an XArray.
>> +pub struct VacantEntry<'a, 'b, T: ForeignOwnable> {
>> +    state: XArrayState<'a, 'b, T>,
>> +}
>> +
>> +impl<'a, 'b, T> VacantEntry<'a, 'b, T>
>> +where
>> +    T: ForeignOwnable,
>> +{
>> +    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize) -> Sel=
f {
>> +        Self {
>> +            state: XArrayState::new(guard, index),
>> +        }
>> +    }
>> +
>> +    fn insert_internal(&mut self, value: T) -> Result<*mut c_void, Stor=
eError<T>> {
>> +        let new =3D T::into_foreign(value).cast();
>> +
>> +        // SAFETY: `self.state.state` is properly initialized and `new`=
 came from `T::into_foreign`.
>> +        // We hold the xarray lock.
>> +        unsafe { bindings::xas_store(&mut self.state.state, new) };
>
> Can this please be on XArray?

OK.

>
>> +
>> +        self.state.status().map(|()| new).map_err(|error| {
>> +            // SAFETY: `new` came from `T::into_foreign` and `xas_store=
` does not take ownership of
>> +            // the value on error.
>> +            let value =3D unsafe { T::from_foreign(new) };
>> +            StoreError { value, error }
>> +        })
>> +    }
>> +
>> +    /// Inserts a value into this vacant entry.
>> +    ///
>> +    /// Returns a reference to the newly inserted value.
>> +    ///
>> +    /// - This method will fail if the nodes on the path to the index
>> +    ///   represented by this entry are not present in the XArray.
>> +    /// - This method will not drop the XArray lock.
>> +    ///
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// assert_eq!(guard.get(42), None);
>> +    ///
>> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
>> +    ///     let value =3D KBox::new(0x1337u32, GFP_KERNEL)?;
>> +    ///     let borrowed =3D entry.insert(value)?;
>> +    ///     assert_eq!(*borrowed, 0x1337);
>> +    /// }
>> +    ///
>> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, Sto=
reError<T>> {
>> +        let new =3D self.insert_internal(value)?;
>> +
>> +        // SAFETY: `new` came from `T::into_foreign`.The entry has excl=
usive
>
> This is knowledge at a distance. There's no comment anywhere that
> promises that insert_internal called T::into_foreign.

How would you handle this? Add documentation to `insert_internal`?

>
>> +        // ownership of `new` as it holds a mutable reference to `Guard=
`.
>> +        Ok(unsafe { T::borrow_mut(new) })
>> +    }
>> +
>> +    /// Inserts a value and returns an occupied entry representing the =
newly inserted value.
>> +    ///
>> +    /// - This method will fail if the nodes on the path to the index
>> +    ///   represented by this entry are not present in the XArray.
>> +    /// - This method will not drop the XArray lock.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// assert_eq!(guard.get(42), None);
>> +    ///
>> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
>> +    ///     let value =3D KBox::new(0x1337u32, GFP_KERNEL)?;
>> +    ///     let occupied =3D entry.insert_entry(value)?;
>> +    ///     assert_eq!(occupied.index(), 42);
>> +    /// }
>> +    ///
>> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn insert_entry(mut self, value: T) -> Result<OccupiedEntry<'a,=
 'b, T>, StoreError<T>> {
>> +        let new =3D self.insert_internal(value)?;
>> +
>> +        Ok(OccupiedEntry::<'a, 'b, T> {
>> +            state: self.state,
>> +            // SAFETY: `new` came from `T::into_foreign` and is guarant=
eed non-null.
>
> Same.
>
>> +            ptr: unsafe { core::ptr::NonNull::new_unchecked(new) },
>> +        })
>> +    }
>> +
>> +    /// Returns the index of this vacant entry.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// assert_eq!(guard.get(42), None);
>> +    ///
>> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
>> +    ///     assert_eq!(entry.index(), 42);
>> +    /// }
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn index(&self) -> usize {
>> +        self.state.state.xa_index
>> +    }
>> +}
>> +
>> +/// A view into an occupied entry in an XArray.
>> +pub struct OccupiedEntry<'a, 'b, T: ForeignOwnable> {
>> +    pub(crate) state: XArrayState<'a, 'b, T>,
>> +    pub(crate) ptr: NonNull<c_void>,
>> +}
>> +
>> +impl<'a, 'b, T> OccupiedEntry<'a, 'b, T>
>> +where
>> +    T: ForeignOwnable,
>> +{
>> +    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize, ptr: N=
onNull<c_void>) -> Self {
>> +        Self {
>> +            state: XArrayState::new(guard, index),
>> +            ptr,
>> +        }
>> +    }
>> +
>> +    /// Removes the value from this occupied entry and returns it, cons=
uming the entry.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
>> +    ///
>> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
>> +    ///     let value =3D entry.remove();
>> +    ///     assert_eq!(*value, 0x1337);
>> +    /// }
>> +    ///
>> +    /// assert_eq!(guard.get(42), None);
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn remove(mut self) -> T {
>> +        // NOTE: Storing NULL to an occupied slot never fails.
>
> Shouldn't this be on the debug assert below? Also, is there a citation?

I'll move it.

I don't think I have a citation for that. This is a consequence of the
data structure design. If the slot is occupied, the node has already
been allocated, and allocation error is the only failure mode for this path.

>
>> +        // SAFETY: `self.state.state` is properly initialized and valid=
 for XAS operations.
>> +        let ptr =3D unsafe {
>> +            bindings::xas_result(
>> +                &mut self.state.state,
>> +                bindings::xa_zero_to_null(bindings::xas_store(
>> +                    &mut self.state.state,
>> +                    core::ptr::null_mut(),
>> +                )),
>> +            )
>> +        };
>> +
>> +        // SAFETY: `ptr` is a valid return value from xas_result.
>> +        let errno =3D unsafe { bindings::xa_err(ptr) };
>> +        debug_assert!(errno =3D=3D 0);
>> +
>> +        // SAFETY:
>> +        // - `ptr` came from `T::into_foreign`.
>> +        // - As this method takes self by value, the lifetimes of any [=
`T::Borrowed`] and
>> +        //   [`T::BorrowedMut`] we have created must have ended.
>> +        unsafe { T::from_foreign(ptr.cast()) }
>> +    }
>> +
>> +    /// Returns the index of this occupied entry.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    ///
>> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
>> +    ///     assert_eq!(entry.index(), 42);
>> +    /// }
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn index(&self) -> usize {
>> +        self.state.state.xa_index
>> +    }
>> +
>> +    /// Replaces the value in this occupied entry and returns the old v=
alue.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    ///
>> +    /// if let Entry::Occupied(mut entry) =3D guard.get_entry(42) {
>> +    ///     let new_value =3D KBox::new(0x9999u32, GFP_KERNEL)?;
>> +    ///     let old_value =3D entry.insert(new_value);
>> +    ///     assert_eq!(*old_value, 0x1337);
>> +    /// }
>> +    ///
>> +    /// assert_eq!(guard.get(42).copied(), Some(0x9999));
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn insert(&mut self, value: T) -> T {
>> +        // NOTE: Storing to an occupied slot never fails.
>
> Citation?
>
>> +        let new =3D T::into_foreign(value).cast();
>> +        // SAFETY: `new` came from `T::into_foreign` and is guaranteed =
non-null.
>> +        self.ptr =3D unsafe { NonNull::new_unchecked(new) };
>> +
>> +        // SAFETY: `self.state.state` is properly initialized and valid=
 for XAS operations.
>> +        let old =3D unsafe {
>> +            bindings::xas_result(
>> +                &mut self.state.state,
>> +                bindings::xa_zero_to_null(bindings::xas_store(&mut self=
state.state, new)),
>> +            )
>> +        };
>> +
>> +        // SAFETY: `old` is a valid return value from xas_result.
>> +        let errno =3D unsafe { bindings::xa_err(old) };
>> +        debug_assert!(errno =3D=3D 0);
>> +
>> +        // SAFETY:
>> +        // - `ptr` came from `T::into_foreign`.
>> +        // - As this method takes self by value, the lifetimes of any [=
`T::Borrowed`] and
>> +        //   [`T::BorrowedMut`] we have created must have ended.
>> +        unsafe { T::from_foreign(old) }
>> +    }
>> +
>> +    /// Converts this occupied entry into a mutable reference to the va=
lue in the slot represented
>> +    /// by the entry.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    ///
>> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
>> +    ///     let value_ref =3D entry.into_mut();
>> +    ///     *value_ref =3D 0x9999;
>> +    /// }
>> +    ///
>> +    /// assert_eq!(guard.get(42).copied(), Some(0x9999));
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn into_mut(self) -> T::BorrowedMut<'b> {
>> +        // SAFETY: `ptr` came from `T::into_foreign`.
>> +        unsafe { T::borrow_mut(self.ptr.as_ptr()) }
>> +    }
>> +
>> +    /// Swaps the value in this entry with the provided value.
>> +    ///
>> +    /// Returns the old value that was in the entry.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
>> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKin=
d::Alloc), GFP_KERNEL)?;
>> +    /// let mut guard =3D xa.lock();
>> +    ///
>> +    /// guard.store(42, KBox::new(100u32, GFP_KERNEL)?, GFP_KERNEL)?;
>> +    ///
>> +    /// if let Entry::Occupied(mut entry) =3D guard.get_entry(42) {
>> +    ///     let old_value =3D entry.swap(200u32);
>> +    ///     assert_eq!(old_value, 100);
>> +    ///     assert_eq!(*entry, 200);
>> +    /// }
>> +    ///
>> +    /// # Ok::<(), kernel::error::Error>(())
>> +    /// ```
>> +    pub fn swap<U>(&mut self, mut other: U) -> U
>> +    where
>> +        T: for<'c> ForeignOwnable<Borrowed<'c> =3D &'c U, BorrowedMut<'=
c> =3D &'c mut U>,
>> +    {
>> +        use core::ops::DerefMut;
>> +        core::mem::swap(self.deref_mut(), &mut other);
>> +        other
>> +    }
>> +}
>
> Does this need to return anything?

We probably should take `other` by mutable reference to align with
`core::mem::swap`.

Thanks for the comments!


Best regards,
Andreas Hindborg



