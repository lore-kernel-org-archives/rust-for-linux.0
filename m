Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4CC487590
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870285; cv=none; b=NJYO+IVlH+xj1AmjJR/zOyKTVeNaknYZ0611UzXt3w7yzo5Axc3UT9L2IWSRN6159juSVjdEMktJZfzY5qEP0Dw6ONcnHAdNNdITWXqpG3RQdwsDtdYTwWKFXrqPktYhgF1tlIDcozFVuocXDkbZ4eGymByjsgRni9zXrXRuJ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870285; c=relaxed/simple;
	bh=PlAEYJcqWwDyeX0QkysA9GvtrJYtJwb/8rIgiRoJ8qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHRirGDTsinIioLUBE8JM6y1HATO217GOv036+5tAlGffxIaN7zEtyVZwpztRl513ANNgmoYlSRzzBg9iWcilSCOMUFV+ZDTnnVGahnZ+sdZdasLnxTaMzfDyaNXwYEWD6FFvoJvnBs4T1fowKQ0rOxupGJwuceYfXujI/U80JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpJw98Q8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpJw98Q8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fb535b73so17809261fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 03:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767870275; x=1768475075; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xvo67Xyb6aqUZw1cRX8qlN755D9vKYmI1l31FLtucZM=;
        b=bpJw98Q8dSXxL0egktlc8+eg4GoEGHhfCNrm52Mb3rc1++b2TM81fSw3kTAJghxJCA
         U9CJ+TUom/uoQVMJvvfoR+Y5KdvBtVjaLwVKx+cZ8UgA/7x/yoAieSuaUcjEjrGdk0ri
         U2LQEgA48mHlHm7yDxTiEYPz4cD5r4QZGRRPOtQr/4Ty3aCv1deeKytXOuaizrcoGhlI
         BduftSI/svEmg17MsMDrv8R5lrNzjokRdOjejSrtYLrN92KW5a13Psxs6O2ed0mMTzmp
         TrNxmH1HzT9Gs2undWxwZRB3P3OjJHUEyK8SZwRGT9qF6n5AYwedSvw9INXB5fAvr6BI
         oEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870275; x=1768475075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xvo67Xyb6aqUZw1cRX8qlN755D9vKYmI1l31FLtucZM=;
        b=V1+zYUgAYG+PB67xEyrczXQviXifYeWAaQiyCqtqJ0aHXiz1n/8bLM1zhxI/6nrMW6
         ojL9GcWb59PbPdvgB/nYHQWQ17OdHe7Fpw1dEfGOjJ+tqQYz03npMZlcnp+NMCOyOLMk
         TfrwL3GxzCWtS9VXOO0OvGd0sHoZQFq96ECSoasgkKRUZw2SXDTQINjjnc3keOOEEHbF
         NxwWTkTirII3vAnBqPhyKEjtcw+LRfvMhvdWYM6EnsEKS+/lFAWqQOQ//xCtTYjMYQNZ
         zBSeJlt82ij+7lvO0eb8QNRtT20XUMitZIia5qvcSklapzlQqlhgKqVl3RztNfIEPSWt
         0WuA==
X-Forwarded-Encrypted: i=1; AJvYcCWulshy3gNAlbM5MS6WSOMoQqSEFvnWdOuKYBT62ujxPZ0iU/i6Lu4rB8Cww2FusZB1aAL3L4bW3hOEPh6s4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlz2vc97hpRmN09TOvEVxSIFGcAnN0/Rd1a8VqaAJY6KMx7yNm
	uJPSL4jafBXQxI9cg8wOMvz9MogL2WyWwPAWLC9UHwVCriZDhim85uZH2N6kFMCKjvvtIWWdh0G
	xL6HHjA6cI0lD0165ESAeJeXfU6Q10nw=
X-Gm-Gg: AY/fxX7+zf0isGQvgX1RZhyxU9juckIShEXPDJH2cQVROxV/i3n9PSyETgfxf0hyA/g
	hlOGlNqMGpEj8ZA2WkYcfhB7x1KwrJZkKHVLR/7L3hhLtb8spqvBnbzMk0BAU3RGlYQQ/s4kmF4
	2OYolkMnYeZ3s9mCdBLD6VnbGbtUfYNhpu6hcYh8Z7fNp/9ZOubpjFjdceSnOYctrfQTQfUMHwH
	6lAYoHPyyjZRW1d7WEFtMrhvPmtDJOOA91alxICkxPp5MGaC52Z7ScBIHROuVRqYx+LXGQx6uqY
	ORinQrvWl8AJOpsvtrN+8yBsCVF6mYpk/OCL8qCYkTbhvuer8AURryTVSqHu/qn15vxyHMZjWpQ
	Q76WObAIXKkOh8AmK1uuiBGqMBxwGdtdozp5HqlZqAA==
X-Google-Smtp-Source: AGHT+IGa7r26f9REKayaWuLwWLIQlEYUDPRVSp6dJZQube9ozwQo6T2L1CudcAdky55ZDwPKsHp2hH4ybEDiAbamocg=
X-Received: by 2002:a05:651c:2103:b0:37a:432f:8ecc with SMTP id
 38308e7fff4ca-382ff81fc89mr19569931fa.33.1767870274411; Thu, 08 Jan 2026
 03:04:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-8-9e5ffd5e3cf0@kernel.org> <CAJ-ks9kYoxpPnB9amA-11SRNHbqUbp_D51qVCNDdvBZSo2gsTQ@mail.gmail.com>
 <875x9ch2xe.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <875x9ch2xe.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 8 Jan 2026 06:03:58 -0500
X-Gm-Features: AQt7F2q6TjnWQOML2Kphn-lLsBGUsqIyKnAuK8KsiN5PGNKe8UEnjooH1GivkQs
Message-ID: <CAJ-ks9=Gu8u==m_1SncFBNwzvhwmMXO-v3TG7Wxd0cRsTzkTtA@mail.gmail.com>
Subject: Re: [PATCH 08/10] rust: xarray: add entry API
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 4:25=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Tamir Duberstein <tamird@gmail.com> writes:
>
> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Add an Entry API for XArray that provides ergonomic access to array
> >> slots that may be vacant or occupied. The API follows the pattern of
> >> Rust's standard library HashMap entry API, allowing efficient
> >> conditional insertion and modification of entries.
> >>
> >> The implementation uses the XArray state API (`xas_*` functions) for
> >> efficient operations without requiring multiple lookups. Helper
> >> functions are added to rust/helpers/xarray.c to wrap C macros that are
> >> not directly accessible from Rust.
> >>
> >> Also update MAINTAINERS to cover the new rust files.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> ---
> >>  MAINTAINERS                 |   1 +
> >>  rust/helpers/xarray.c       |  17 ++
> >>  rust/kernel/xarray.rs       | 112 +++++++++++++
> >>  rust/kernel/xarray/entry.rs | 376 +++++++++++++++++++++++++++++++++++=
+++++++++
> >>  4 files changed, 506 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index e8f06145fb54c..79d4c9c9b2b63 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -27909,6 +27909,7 @@ B:      https://github.com/Rust-for-Linux/linu=
x/issues
> >>  C:     https://rust-for-linux.zulipchat.com
> >>  T:     git https://github.com/Rust-for-Linux/linux.git xarray-next
> >>  F:     rust/kernel/xarray.rs
> >> +F:     rust/kernel/xarray/
> >>
> >>  XBOX DVD IR REMOTE
> >>  M:     Benjamin Valentin <benpicco@googlemail.com>
> >> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
> >> index 60b299f11451d..425a6cc494734 100644
> >> --- a/rust/helpers/xarray.c
> >> +++ b/rust/helpers/xarray.c
> >> @@ -26,3 +26,20 @@ void rust_helper_xa_unlock(struct xarray *xa)
> >>  {
> >>         return xa_unlock(xa);
> >>  }
> >> +
> >> +void *rust_helper_xas_result(struct xa_state *xas, void *curr)
> >> +{
> >> +       if (xa_err(xas->xa_node))
> >> +               curr =3D xas->xa_node;
> >> +       return curr;
> >> +}
> >
> > Instead of this duplication, can we expose `xas_result` from the header=
?
>
> `xas_result` is not currently exported. I'd rather not change that.

Why?

>
> >
> >> +
> >> +void *rust_helper_xa_zero_to_null(void *entry)
> >> +{
> >> +       return xa_is_zero(entry) ? NULL : entry;
> >> +}
> >> +
> >> +int rust_helper_xas_error(const struct xa_state *xas)
> >> +{
> >> +       return xas_error(xas);
> >> +}
> >> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> >> index 9d4589979fd1d..2b8d56c81e36b 100644
> >> --- a/rust/kernel/xarray.rs
> >> +++ b/rust/kernel/xarray.rs
> >> @@ -13,11 +13,17 @@
> >>          NonNull, //
> >>      },
> >>  };
> >> +pub use entry::{
> >> +    Entry,
> >> +    OccupiedEntry,
> >> +    VacantEntry, //
> >> +};
> >>  use kernel::{
> >>      alloc,
> >>      bindings,
> >>      build_assert, //
> >>      error::{
> >> +        to_result,
> >>          Error,
> >>          Result, //
> >>      },
> >> @@ -255,6 +261,35 @@ pub fn get_mut(&mut self, index: usize) -> Option=
<T::BorrowedMut<'_>> {
> >>          Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
> >>      }
> >>
> >> +    /// Gets an entry for the specified index, which can be vacant or=
 occupied.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// assert_eq!(guard.contains_index(42), false);
> >> +    ///
> >> +    /// match guard.get_entry(42) {
> >> +    ///     Entry::Vacant(entry) =3D> {
> >> +    ///         entry.insert(KBox::new(0x1337u32, GFP_KERNEL)?)?;
> >> +    ///     }
> >> +    ///     Entry::Occupied(_) =3D> unreachable!("We did not insert a=
n entry yet"),
> >> +    /// }
> >> +    ///
> >> +    /// assert_eq!(guard.get(42), Some(&0x1337));
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn get_entry<'b>(&'b mut self, index: usize) -> Entry<'a, 'b,=
 T> {
> >> +        match self.load(index) {
> >> +            None =3D> Entry::Vacant(VacantEntry::new(self, index)),
> >> +            Some(ptr) =3D> Entry::Occupied(OccupiedEntry::new(self, i=
ndex, ptr)),
> >> +        }
> >> +    }
> >
> > Why not "entry" like the stdlib collections?
>
> Right, it has to be `entry`, so says the API naming guidelines.
>
> >
> >> +
> >>      fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_voi=
d>)> {
> >>          let mut state =3D XArrayState::new(self, index);
> >>          // SAFETY: `state.state` is always valid by the type invarian=
t of
> >> @@ -320,6 +355,76 @@ pub fn find_next_mut(&mut self, index: usize) -> =
Option<(usize, T::BorrowedMut<'
> >>              .map(move |(index, ptr)| (index, unsafe { T::borrow_mut(p=
tras_ptr()) }))
> >>      }
> >>
> >> +    /// Finds the next occupied entry starting from the given index.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
> >> +    /// guard.store(20, KBox::new(20u32, GFP_KERNEL)?, GFP_KERNEL)?;
> >> +    ///
> >> +    /// if let Some(entry) =3D guard.find_next_entry(5) {
> >> +    ///     assert_eq!(entry.index(), 10);
> >> +    ///     let value =3D entry.remove();
> >> +    ///     assert_eq!(*value, 10);
> >> +    /// }
> >> +    ///
> >> +    /// assert_eq!(guard.get(10), None);
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn find_next_entry<'b>(&'b mut self, index: usize) -> Option<=
OccupiedEntry<'a, 'b, T>> {
> >> +        let mut state =3D XArrayState::new(self, index);
> >> +
> >> +        // SAFETY: `state.state` is properly initialized by XArraySta=
te::new and the caller holds
> >> +        // the lock.
> >> +        let ptr =3D NonNull::new(unsafe { bindings::xas_find(&mut sta=
testate, usize::MAX) })?;
> >> +
> >> +        Some(OccupiedEntry { state, ptr })
> >> +    }
> >
> > I'm surprised this doesn't share code with find_next_mut. Can it?
> > Again, I'd have expected the bulk of the logic to be on XArrayState.
>
> I'll try to move the logic and reuse `load_next`.
>
> >
> >> +
> >> +    /// Finds the next occupied entry starting at the given index, wr=
apping around.
> >> +    ///
> >> +    /// Searches for an entry starting at `index` up to the maximum i=
ndex. If no entry
> >> +    /// is found, wraps around and searches from index 0 up to `index=
`.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// guard.store(100, KBox::new(42u32, GFP_KERNEL)?, GFP_KERNEL)?;
> >> +    /// let entry =3D guard.find_next_entry_circular(101);
> >> +    /// assert_eq!(entry.map(|e| e.index()), Some(100));
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn find_next_entry_circular<'b>(
> >> +        &'b mut self,
> >> +        index: usize,
> >> +    ) -> Option<OccupiedEntry<'a, 'b, T>> {
> >> +        let mut state =3D XArrayState::new(self, index);
> >> +
> >> +        // SAFETY: `state.state` is properly initialized by XArraySta=
te::new and the caller holds
> >> +        // the lock.
> >> +        let ptr =3D NonNull::new(unsafe { bindings::xas_find(&mut sta=
testate, usize::MAX) })
> >> +            .or_else(|| {
> >> +                state.state.xa_node =3D bindings::XAS_RESTART as *mut=
 bindings::xa_node;
> >> +                state.state.xa_index =3D 0;
> >> +                // SAFETY: `state.state` is properly initialized and =
by type invariant, we hold the
> >> +                // xarray lock.
> >> +                NonNull::new(unsafe { bindings::xas_find(&mut state.s=
tate, index) })
> >> +            })?;
> >> +
> >> +        Some(OccupiedEntry { state, ptr })
> >> +    }
> >
> > Instead of this function, can find_next_entry take a Range? Then it
> > would be simple for the caller to wrap if they want, without bloating
> > this API.
>
> We could do that, but I am not sure if it is idiomatic? The range syntax
> a..b is considered empty if b<a. But it still produces a valid
> `core::ops::Range` that we could use.

Can you clearly state your objection?

>
> >
> >> +
> >>      /// Removes and returns the element at the given index.
> >>      pub fn remove(&mut self, index: usize) -> Option<T> {
> >>          // SAFETY:
> >> @@ -416,8 +521,15 @@ fn new(access: &'b Guard<'a, T>, index: usize) ->=
 Self {
> >>              },
> >>          }
> >>      }
> >> +
> >> +    fn status(&self) -> Result {
> >> +        // SAFETY: `self.state` is properly initialized and valid.
> >> +        to_result(unsafe { bindings::xas_error(&self.state) })
> >> +    }
> >>  }
> >>
> >> +mod entry;
> >> +
> >>  // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` if=
f `T` is `Send`.
> >>  unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
> >>
> >> diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
> >> new file mode 100644
> >> index 0000000000000..1268dc35bac58
> >> --- /dev/null
> >> +++ b/rust/kernel/xarray/entry.rs
> >> @@ -0,0 +1,376 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +use super::{
> >> +    Guard,
> >> +    StoreError,
> >> +    XArrayState, //
> >> +};
> >> +use core::ptr::NonNull;
> >> +use kernel::{
> >> +    prelude::*,
> >> +    types::ForeignOwnable, //
> >> +};
> >> +
> >> +/// Represents either a vacant or occupied entry in an XArray.
> >> +pub enum Entry<'a, 'b, T: ForeignOwnable> {
> >> +    /// A vacant entry that can have a value inserted.
> >> +    Vacant(VacantEntry<'a, 'b, T>),
> >> +    /// An occupied entry containing a value.
> >> +    Occupied(OccupiedEntry<'a, 'b, T>),
> >> +}
> >> +
> >> +impl<T: ForeignOwnable> Entry<'_, '_, T> {
> >> +    /// Returns true if this entry is occupied.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    ///
> >> +    /// let entry =3D guard.get_entry(42);
> >> +    /// assert_eq!(entry.is_occupied(), false);
> >> +    ///
> >> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL=
)?;
> >> +    /// let entry =3D guard.get_entry(42);
> >> +    /// assert_eq!(entry.is_occupied(), true);
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn is_occupied(&self) -> bool {
> >> +        matches!(self, Entry::Occupied(_))
> >> +    }
> >
> > Do we need this? IMO less is more, and even stdlib doesn't have this.
>
> Similar to `contains_index`, it de-clutters at call sites. I like
>
> if entry.is_occupied() {...}
>
> better than
>
> if matches!(entry, Entry::Occupied(_)) {...}

Similar to the discussion on `contains_index` -- discarding
information in this way seems to be a smell, but I can't say without
seeing more code. My suggestion is not to add this until there's a
usage that we can see in the same series.

>
> >
> >> +}
> >> +
> >> +/// A view into a vacant entry in an XArray.
> >> +pub struct VacantEntry<'a, 'b, T: ForeignOwnable> {
> >> +    state: XArrayState<'a, 'b, T>,
> >> +}
> >> +
> >> +impl<'a, 'b, T> VacantEntry<'a, 'b, T>
> >> +where
> >> +    T: ForeignOwnable,
> >> +{
> >> +    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize) -> S=
elf {
> >> +        Self {
> >> +            state: XArrayState::new(guard, index),
> >> +        }
> >> +    }
> >> +
> >> +    fn insert_internal(&mut self, value: T) -> Result<*mut c_void, St=
oreError<T>> {
> >> +        let new =3D T::into_foreign(value).cast();
> >> +
> >> +        // SAFETY: `self.state.state` is properly initialized and `ne=
w` came from `T::into_foreign`.
> >> +        // We hold the xarray lock.
> >> +        unsafe { bindings::xas_store(&mut self.state.state, new) };
> >
> > Can this please be on XArray?
>
> OK.
>
> >
> >> +
> >> +        self.state.status().map(|()| new).map_err(|error| {
> >> +            // SAFETY: `new` came from `T::into_foreign` and `xas_sto=
re` does not take ownership of
> >> +            // the value on error.
> >> +            let value =3D unsafe { T::from_foreign(new) };
> >> +            StoreError { value, error }
> >> +        })
> >> +    }
> >> +
> >> +    /// Inserts a value into this vacant entry.
> >> +    ///
> >> +    /// Returns a reference to the newly inserted value.
> >> +    ///
> >> +    /// - This method will fail if the nodes on the path to the index
> >> +    ///   represented by this entry are not present in the XArray.
> >> +    /// - This method will not drop the XArray lock.
> >> +    ///
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// assert_eq!(guard.get(42), None);
> >> +    ///
> >> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
> >> +    ///     let value =3D KBox::new(0x1337u32, GFP_KERNEL)?;
> >> +    ///     let borrowed =3D entry.insert(value)?;
> >> +    ///     assert_eq!(*borrowed, 0x1337);
> >> +    /// }
> >> +    ///
> >> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, S=
toreError<T>> {
> >> +        let new =3D self.insert_internal(value)?;
> >> +
> >> +        // SAFETY: `new` came from `T::into_foreign`.The entry has ex=
clusive
> >
> > This is knowledge at a distance. There's no comment anywhere that
> > promises that insert_internal called T::into_foreign.
>
> How would you handle this? Add documentation to `insert_internal`?

I think `insert_internal` can return a reference, which would be
cleaner (i.e. call T::borrow_mut *there*).

>
> >
> >> +        // ownership of `new` as it holds a mutable reference to `Gua=
rd`.
> >> +        Ok(unsafe { T::borrow_mut(new) })
> >> +    }
> >> +
> >> +    /// Inserts a value and returns an occupied entry representing th=
e newly inserted value.
> >> +    ///
> >> +    /// - This method will fail if the nodes on the path to the index
> >> +    ///   represented by this entry are not present in the XArray.
> >> +    /// - This method will not drop the XArray lock.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// assert_eq!(guard.get(42), None);
> >> +    ///
> >> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
> >> +    ///     let value =3D KBox::new(0x1337u32, GFP_KERNEL)?;
> >> +    ///     let occupied =3D entry.insert_entry(value)?;
> >> +    ///     assert_eq!(occupied.index(), 42);
> >> +    /// }
> >> +    ///
> >> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn insert_entry(mut self, value: T) -> Result<OccupiedEntry<'=
a, 'b, T>, StoreError<T>> {
> >> +        let new =3D self.insert_internal(value)?;
> >> +
> >> +        Ok(OccupiedEntry::<'a, 'b, T> {
> >> +            state: self.state,
> >> +            // SAFETY: `new` came from `T::into_foreign` and is guara=
nteed non-null.
> >
> > Same.
> >
> >> +            ptr: unsafe { core::ptr::NonNull::new_unchecked(new) },
> >> +        })
> >> +    }
> >> +
> >> +    /// Returns the index of this vacant entry.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// assert_eq!(guard.get(42), None);
> >> +    ///
> >> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
> >> +    ///     assert_eq!(entry.index(), 42);
> >> +    /// }
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn index(&self) -> usize {
> >> +        self.state.state.xa_index
> >> +    }
> >> +}
> >> +
> >> +/// A view into an occupied entry in an XArray.
> >> +pub struct OccupiedEntry<'a, 'b, T: ForeignOwnable> {
> >> +    pub(crate) state: XArrayState<'a, 'b, T>,
> >> +    pub(crate) ptr: NonNull<c_void>,
> >> +}
> >> +
> >> +impl<'a, 'b, T> OccupiedEntry<'a, 'b, T>
> >> +where
> >> +    T: ForeignOwnable,
> >> +{
> >> +    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize, ptr:=
 NonNull<c_void>) -> Self {
> >> +        Self {
> >> +            state: XArrayState::new(guard, index),
> >> +            ptr,
> >> +        }
> >> +    }
> >> +
> >> +    /// Removes the value from this occupied entry and returns it, co=
nsuming the entry.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL=
)?;
> >> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
> >> +    ///
> >> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
> >> +    ///     let value =3D entry.remove();
> >> +    ///     assert_eq!(*value, 0x1337);
> >> +    /// }
> >> +    ///
> >> +    /// assert_eq!(guard.get(42), None);
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn remove(mut self) -> T {
> >> +        // NOTE: Storing NULL to an occupied slot never fails.
> >
> > Shouldn't this be on the debug assert below? Also, is there a citation?
>
> I'll move it.
>
> I don't think I have a citation for that. This is a consequence of the
> data structure design. If the slot is occupied, the node has already
> been allocated, and allocation error is the only failure mode for this pa=
th.

OK, if there's no citation, then you've got to document your reasoning
for this conclusion, I think.

>
> >
> >> +        // SAFETY: `self.state.state` is properly initialized and val=
id for XAS operations.
> >> +        let ptr =3D unsafe {
> >> +            bindings::xas_result(
> >> +                &mut self.state.state,
> >> +                bindings::xa_zero_to_null(bindings::xas_store(
> >> +                    &mut self.state.state,
> >> +                    core::ptr::null_mut(),
> >> +                )),
> >> +            )
> >> +        };
> >> +
> >> +        // SAFETY: `ptr` is a valid return value from xas_result.
> >> +        let errno =3D unsafe { bindings::xa_err(ptr) };
> >> +        debug_assert!(errno =3D=3D 0);
> >> +
> >> +        // SAFETY:
> >> +        // - `ptr` came from `T::into_foreign`.
> >> +        // - As this method takes self by value, the lifetimes of any=
 [`T::Borrowed`] and
> >> +        //   [`T::BorrowedMut`] we have created must have ended.
> >> +        unsafe { T::from_foreign(ptr.cast()) }
> >> +    }
> >> +
> >> +    /// Returns the index of this occupied entry.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL=
)?;
> >> +    ///
> >> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
> >> +    ///     assert_eq!(entry.index(), 42);
> >> +    /// }
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn index(&self) -> usize {
> >> +        self.state.state.xa_index
> >> +    }
> >> +
> >> +    /// Replaces the value in this occupied entry and returns the old=
 value.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL=
)?;
> >> +    ///
> >> +    /// if let Entry::Occupied(mut entry) =3D guard.get_entry(42) {
> >> +    ///     let new_value =3D KBox::new(0x9999u32, GFP_KERNEL)?;
> >> +    ///     let old_value =3D entry.insert(new_value);
> >> +    ///     assert_eq!(*old_value, 0x1337);
> >> +    /// }
> >> +    ///
> >> +    /// assert_eq!(guard.get(42).copied(), Some(0x9999));
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn insert(&mut self, value: T) -> T {
> >> +        // NOTE: Storing to an occupied slot never fails.
> >
> > Citation?
> >
> >> +        let new =3D T::into_foreign(value).cast();
> >> +        // SAFETY: `new` came from `T::into_foreign` and is guarantee=
d non-null.
> >> +        self.ptr =3D unsafe { NonNull::new_unchecked(new) };
> >> +
> >> +        // SAFETY: `self.state.state` is properly initialized and val=
id for XAS operations.
> >> +        let old =3D unsafe {
> >> +            bindings::xas_result(
> >> +                &mut self.state.state,
> >> +                bindings::xa_zero_to_null(bindings::xas_store(&mut se=
lfstate.state, new)),
> >> +            )
> >> +        };
> >> +
> >> +        // SAFETY: `old` is a valid return value from xas_result.
> >> +        let errno =3D unsafe { bindings::xa_err(old) };
> >> +        debug_assert!(errno =3D=3D 0);
> >> +
> >> +        // SAFETY:
> >> +        // - `ptr` came from `T::into_foreign`.
> >> +        // - As this method takes self by value, the lifetimes of any=
 [`T::Borrowed`] and
> >> +        //   [`T::BorrowedMut`] we have created must have ended.
> >> +        unsafe { T::from_foreign(old) }
> >> +    }
> >> +
> >> +    /// Converts this occupied entry into a mutable reference to the =
value in the slot represented
> >> +    /// by the entry.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL=
)?;
> >> +    ///
> >> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
> >> +    ///     let value_ref =3D entry.into_mut();
> >> +    ///     *value_ref =3D 0x9999;
> >> +    /// }
> >> +    ///
> >> +    /// assert_eq!(guard.get(42).copied(), Some(0x9999));
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn into_mut(self) -> T::BorrowedMut<'b> {
> >> +        // SAFETY: `ptr` came from `T::into_foreign`.
> >> +        unsafe { T::borrow_mut(self.ptr.as_ptr()) }
> >> +    }
> >> +
> >> +    /// Swaps the value in this entry with the provided value.
> >> +    ///
> >> +    /// Returns the old value that was in the entry.
> >> +    ///
> >> +    /// # Examples
> >> +    ///
> >> +    /// ```
> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}=
};
> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocK=
ind::Alloc), GFP_KERNEL)?;
> >> +    /// let mut guard =3D xa.lock();
> >> +    ///
> >> +    /// guard.store(42, KBox::new(100u32, GFP_KERNEL)?, GFP_KERNEL)?;
> >> +    ///
> >> +    /// if let Entry::Occupied(mut entry) =3D guard.get_entry(42) {
> >> +    ///     let old_value =3D entry.swap(200u32);
> >> +    ///     assert_eq!(old_value, 100);
> >> +    ///     assert_eq!(*entry, 200);
> >> +    /// }
> >> +    ///
> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> +    /// ```
> >> +    pub fn swap<U>(&mut self, mut other: U) -> U
> >> +    where
> >> +        T: for<'c> ForeignOwnable<Borrowed<'c> =3D &'c U, BorrowedMut=
<'c> =3D &'c mut U>,
> >> +    {
> >> +        use core::ops::DerefMut;
> >> +        core::mem::swap(self.deref_mut(), &mut other);
> >> +        other
> >> +    }
> >> +}
> >
> > Does this need to return anything?
>
> We probably should take `other` by mutable reference to align with
> `core::mem::swap`.
>
> Thanks for the comments!
>
>
> Best regards,
> Andreas Hindborg
>
>
>
