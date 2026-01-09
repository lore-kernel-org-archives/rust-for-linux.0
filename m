Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9722777F3
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Jan 2026 16:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974500; cv=none; b=ScHMRYuhF5JVRaUAQWxUc80CyQWLL4FHSk6EpBodqc/VmG3d6e8ei8x2ygMAw6XwzPgyM1pjeEnTYUc/ZjL7jQaVU8YD3HSxdn0nhXOXH29LToYF+xXepIWJy5JvjgYI7AQLrocewcJ5IHPesd9c0tEMalbMaXjZ1uMjL8vGk+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974500; c=relaxed/simple;
	bh=J6cJjsCRN1IpiSaCVa815VV8yeaLxUUuzo34+Pfs+rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c4//8Sk7RkX4JmXIFNtN8KSFj+kXYbca99Rr1K7jaaPjElngO/Saijv9sDUI1q9XrrNU5DErnyBiMKw2OFMirfBIDhAYIqc4teu/BrfHWBUdEGF+OUoeCHdiHzZJc87fueAZxCLhRSOREu1oHNa4GM86JZhzahRWGxSZngs+MB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMphu/le; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMphu/le"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59b679cff1fso3342339e87.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jan 2026 08:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767974497; x=1768579297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxM+4jHs11xdcor7IEmxLKA7/eufwcVQAeFlthVnZYk=;
        b=QMphu/leeFSfL82gst6wL6No1t+y+pxcsuiNrODD/t9kXVzjOo3vDnL0LPinSEXpiO
         HTvUbqwryCvfB/mKp/xJ4Jv8U5LYqc8tbwRCbkLYCpZ5eibivyTFHBCz0aJkVLBKg8O/
         0K/YUmWJg7Xw44o8kjf1OkBxoPdLWx7pEg6kFa9h3fNU/xSQeMhdTKu4sQkWDMTa3zv9
         c9yiB1S4Nj7xITcw8qM1aPbkue2iwMWkB+PcbQSHrDnl8TxHWnYtuAg2YPVA7kCzyi50
         lN6AK/DBjfMBzKPngxnUMnmBJgqrSuwcx3rfez+bYszaSnXGB5zUyjsr3db8lViBdxm0
         2IDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974497; x=1768579297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VxM+4jHs11xdcor7IEmxLKA7/eufwcVQAeFlthVnZYk=;
        b=LFNGoMs8bz7Lgru2IvvZvyv0ipUhRfemhq78dHKYitOLya4xE/UKDJ/sP00nsB6Uz0
         uLYSlSWT8BCxO2mqv8PhF3aS0OBDiFAoKac6fthBMGOyRYfOob7W2vncK78OjjJlLC1g
         3w85KdsMm7Nx+Ef9no//k/gjEmro7DysAHTR0O+8BbM2QSDGRhPnwRQiayWaHh5t8+RD
         rw8elJj4jJQhqYGPZXFwYc9c4wXiBWC0qCiekcwvhMddO44gDMRfA5WMjkS6HFyMBO3v
         zglMnJB6RBvDzEiYr8iofqLlhJEGv4C1A7clgLUxZIerv90sgCXqGmsXeKCEHcHFSEjD
         9KhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFSZSrj388Dghhabit+MDztf9cTjDdgl2TEGqjTLJrasGQ80+kaADv/QDll+NzEH06oVX3OpMPzuhJ3pNxrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97A+INldM+rMT9d83uS2QzGIUb5fsBqQal/ku8Kph4CMYLUwz
	ibSL5DuySRdPAAltn8Y54RxpeWzbvL/8xd4VuWaj2eNti9hmmmOnRp2RZYdoFUj+ZJyh/8MmXO8
	jszQLbqA6o+0p/tjgZKSn4EqFvFlPfFQ=
X-Gm-Gg: AY/fxX4S2H7etqx49NjYLvCroBR4i8a9NBbewDIetjLZjlTh0e+JDziYK431q3BoLW0
	pFq3WvWhfNO6EnRljuwRjfyEYyYB6E4p1FQTiIe6R0mKIp6hr/JsdaGSRvNU3WO2ZuXtXgwgwYu
	3M4WD8ZawmEPjhLH0yhFHJUxnezk5wWjBZAxnupL9jDMDePJvRRbEpuUd6h0rbQLvFuQVL37xHh
	2jxCTqaiEV1m8rIfCy1OMRx0fH9NIDKSAFHilWZQ0vPaqRSdCDkWAog4go9Y5UxOJ0CNsl8DbQR
	Sj9hpoVODKTkln88I9/FnWE8iQlpxYA80civAIlRoTvTM0yxnPTG6wi8No3tRR6GzLt780aOkSM
	wlIi8VVPXnJm8dcxF21dSKTpb7gIrHhpaW65P0QZDFw==
X-Google-Smtp-Source: AGHT+IGZ796tYaymVeM48pnZgtDnhjmw0zfBflkhpYLaiOlYHUanHiCUN6yEzV1Uo7Oo3FS9TkQBjIAHSKCDCtFNi+M=
X-Received: by 2002:a05:6512:4010:b0:59b:7e2b:33db with SMTP id
 2adb3069b0e04-59b7e2b4a4dmr1040344e87.28.1767974496170; Fri, 09 Jan 2026
 08:01:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
 <20251203-xarray-entry-send-v1-8-9e5ffd5e3cf0@kernel.org> <CAJ-ks9kYoxpPnB9amA-11SRNHbqUbp_D51qVCNDdvBZSo2gsTQ@mail.gmail.com>
 <875x9ch2xe.fsf@t14s.mail-host-address-is-not-set> <Ju4-5XXEy30j3L6c6jxvcJYkTSRjVww9x2MSKbNNKLFstWNFqEwSLHt1eiVMSeGBzLuo4klzhmhcQZU_tbNt_w==@protonmail.internalid>
 <CAJ-ks9=Gu8u==m_1SncFBNwzvhwmMXO-v3TG7Wxd0cRsTzkTtA@mail.gmail.com> <87qzrzf4ya.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87qzrzf4ya.fsf@t14s.mail-host-address-is-not-set>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 9 Jan 2026 11:00:59 -0500
X-Gm-Features: AZwV_QgyRfymzHogS8VBon0CmkJoHGshxtLmJXX18UlS2M6zozgoO4ZbbNCiyzQ
Message-ID: <CAJ-ks9kfsrNzBU5fL=rxhc_vRvoz+R0o=1DsWzo+k+BF5-xbSg@mail.gmail.com>
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

On Fri, Jan 9, 2026 at 5:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Tamir Duberstein" <tamird@gmail.com> writes:
>
> > On Thu, Jan 8, 2026 at 4:25=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Tamir Duberstein <tamird@gmail.com> writes:
> >>
> >> > On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@=
kernel.org> wrote:
> >> >>
> >> >> Add an Entry API for XArray that provides ergonomic access to array
> >> >> slots that may be vacant or occupied. The API follows the pattern o=
f
> >> >> Rust's standard library HashMap entry API, allowing efficient
> >> >> conditional insertion and modification of entries.
> >> >>
> >> >> The implementation uses the XArray state API (`xas_*` functions) fo=
r
> >> >> efficient operations without requiring multiple lookups. Helper
> >> >> functions are added to rust/helpers/xarray.c to wrap C macros that =
are
> >> >> not directly accessible from Rust.
> >> >>
> >> >> Also update MAINTAINERS to cover the new rust files.
> >> >>
> >> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> >> ---
> >> >>  MAINTAINERS                 |   1 +
> >> >>  rust/helpers/xarray.c       |  17 ++
> >> >>  rust/kernel/xarray.rs       | 112 +++++++++++++
> >> >>  rust/kernel/xarray/entry.rs | 376 ++++++++++++++++++++++++++++++++=
++++++++++++
> >> >>  4 files changed, 506 insertions(+)
> >> >>
> >> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> >> index e8f06145fb54c..79d4c9c9b2b63 100644
> >> >> --- a/MAINTAINERS
> >> >> +++ b/MAINTAINERS
> >> >> @@ -27909,6 +27909,7 @@ B:      https://github.com/Rust-for-Linux/l=
inux/issues
> >> >>  C:     https://rust-for-linux.zulipchat.com
> >> >>  T:     git https://github.com/Rust-for-Linux/linux.git xarray-next
> >> >>  F:     rust/kernel/xarray.rs
> >> >> +F:     rust/kernel/xarray/
> >> >>
> >> >>  XBOX DVD IR REMOTE
> >> >>  M:     Benjamin Valentin <benpicco@googlemail.com>
> >> >> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
> >> >> index 60b299f11451d..425a6cc494734 100644
> >> >> --- a/rust/helpers/xarray.c
> >> >> +++ b/rust/helpers/xarray.c
> >> >> @@ -26,3 +26,20 @@ void rust_helper_xa_unlock(struct xarray *xa)
> >> >>  {
> >> >>         return xa_unlock(xa);
> >> >>  }
> >> >> +
> >> >> +void *rust_helper_xas_result(struct xa_state *xas, void *curr)
> >> >> +{
> >> >> +       if (xa_err(xas->xa_node))
> >> >> +               curr =3D xas->xa_node;
> >> >> +       return curr;
> >> >> +}
> >> >
> >> > Instead of this duplication, can we expose `xas_result` from the hea=
der?
> >>
> >> `xas_result` is not currently exported. I'd rather not change that.
> >
> > Why?
>
> Because it requires patching the C code, which has a very long turn
> around time. I also assume that the function is private for a reason.
> Exposing it in the header file would make it available to the entire kern=
el.

Why assume that? It was probably never needed before. As for
turnaround time - I can empathize, but I don't think this is a strong
argument for duplication.

>
> <cut>
>
> >> >> +
> >> >> +    /// Finds the next occupied entry starting at the given index,=
 wrapping around.
> >> >> +    ///
> >> >> +    /// Searches for an entry starting at `index` up to the maximu=
m index. If no entry
> >> >> +    /// is found, wraps around and searches from index 0 up to `in=
dex`.
> >> >> +    ///
> >> >> +    /// # Examples
> >> >> +    ///
> >> >> +    /// ```
> >> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> >> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(All=
ocKind::Alloc), GFP_KERNEL)?;
> >> >> +    /// let mut guard =3D xa.lock();
> >> >> +    ///
> >> >> +    /// guard.store(100, KBox::new(42u32, GFP_KERNEL)?, GFP_KERNEL=
)?;
> >> >> +    /// let entry =3D guard.find_next_entry_circular(101);
> >> >> +    /// assert_eq!(entry.map(|e| e.index()), Some(100));
> >> >> +    ///
> >> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> >> +    /// ```
> >> >> +    pub fn find_next_entry_circular<'b>(
> >> >> +        &'b mut self,
> >> >> +        index: usize,
> >> >> +    ) -> Option<OccupiedEntry<'a, 'b, T>> {
> >> >> +        let mut state =3D XArrayState::new(self, index);
> >> >> +
> >> >> +        // SAFETY: `state.state` is properly initialized by XArray=
State::new and the caller holds
> >> >> +        // the lock.
> >> >> +        let ptr =3D NonNull::new(unsafe { bindings::xas_find(&mut =
statestate, usize::MAX) })
> >> >> +            .or_else(|| {
> >> >> +                state.state.xa_node =3D bindings::XAS_RESTART as *=
mut bindings::xa_node;
> >> >> +                state.state.xa_index =3D 0;
> >> >> +                // SAFETY: `state.state` is properly initialized a=
nd by type invariant, we hold the
> >> >> +                // xarray lock.
> >> >> +                NonNull::new(unsafe { bindings::xas_find(&mut stat=
e.state, index) })
> >> >> +            })?;
> >> >> +
> >> >> +        Some(OccupiedEntry { state, ptr })
> >> >> +    }
> >> >
> >> > Instead of this function, can find_next_entry take a Range? Then it
> >> > would be simple for the caller to wrap if they want, without bloatin=
g
> >> > this API.
> >>
> >> We could do that, but I am not sure if it is idiomatic? The range synt=
ax
> >> a..b is considered empty if b<a. But it still produces a valid
> >> `core::ops::Range` that we could use.
> >
> > Can you clearly state your objection?
>
>  - Reverse ranges are considered empty.
>  - I am unsure if the approach is idiomatic.
>
> >
> >>
> >> >
> >> >> +
> >> >>      /// Removes and returns the element at the given index.
> >> >>      pub fn remove(&mut self, index: usize) -> Option<T> {
> >> >>          // SAFETY:
> >> >> @@ -416,8 +521,15 @@ fn new(access: &'b Guard<'a, T>, index: usize)=
 -> Self {
> >> >>              },
> >> >>          }
> >> >>      }
> >> >> +
> >> >> +    fn status(&self) -> Result {
> >> >> +        // SAFETY: `self.state` is properly initialized and valid.
> >> >> +        to_result(unsafe { bindings::xas_error(&self.state) })
> >> >> +    }
> >> >>  }
> >> >>
> >> >> +mod entry;
> >> >> +
> >> >>  // SAFETY: `XArray<T>` has no shared mutable state so it is `Send`=
 iff `T` is `Send`.
> >> >>  unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
> >> >>
> >> >> diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry=
.rs
> >> >> new file mode 100644
> >> >> index 0000000000000..1268dc35bac58
> >> >> --- /dev/null
> >> >> +++ b/rust/kernel/xarray/entry.rs
> >> >> @@ -0,0 +1,376 @@
> >> >> +// SPDX-License-Identifier: GPL-2.0
> >> >> +
> >> >> +use super::{
> >> >> +    Guard,
> >> >> +    StoreError,
> >> >> +    XArrayState, //
> >> >> +};
> >> >> +use core::ptr::NonNull;
> >> >> +use kernel::{
> >> >> +    prelude::*,
> >> >> +    types::ForeignOwnable, //
> >> >> +};
> >> >> +
> >> >> +/// Represents either a vacant or occupied entry in an XArray.
> >> >> +pub enum Entry<'a, 'b, T: ForeignOwnable> {
> >> >> +    /// A vacant entry that can have a value inserted.
> >> >> +    Vacant(VacantEntry<'a, 'b, T>),
> >> >> +    /// An occupied entry containing a value.
> >> >> +    Occupied(OccupiedEntry<'a, 'b, T>),
> >> >> +}
> >> >> +
> >> >> +impl<T: ForeignOwnable> Entry<'_, '_, T> {
> >> >> +    /// Returns true if this entry is occupied.
> >> >> +    ///
> >> >> +    /// # Examples
> >> >> +    ///
> >> >> +    /// ```
> >> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Ent=
ry}};
> >> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(All=
ocKind::Alloc), GFP_KERNEL)?;
> >> >> +    /// let mut guard =3D xa.lock();
> >> >> +    ///
> >> >> +    ///
> >> >> +    /// let entry =3D guard.get_entry(42);
> >> >> +    /// assert_eq!(entry.is_occupied(), false);
> >> >> +    ///
> >> >> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KER=
NEL)?;
> >> >> +    /// let entry =3D guard.get_entry(42);
> >> >> +    /// assert_eq!(entry.is_occupied(), true);
> >> >> +    ///
> >> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> >> +    /// ```
> >> >> +    pub fn is_occupied(&self) -> bool {
> >> >> +        matches!(self, Entry::Occupied(_))
> >> >> +    }
> >> >
> >> > Do we need this? IMO less is more, and even stdlib doesn't have this=
.
> >>
> >> Similar to `contains_index`, it de-clutters at call sites. I like
> >>
> >> if entry.is_occupied() {...}
> >>
> >> better than
> >>
> >> if matches!(entry, Entry::Occupied(_)) {...}
> >
> > Similar to the discussion on `contains_index` -- discarding
> > information in this way seems to be a smell, but I can't say without
> > seeing more code. My suggestion is not to add this until there's a
> > usage that we can see in the same series.
>
> I don't have a user for this one at the moment. I guess I can drop it.
>
> <cut>
>
> >> >> +
> >> >> +        self.state.status().map(|()| new).map_err(|error| {
> >> >> +            // SAFETY: `new` came from `T::into_foreign` and `xas_=
store` does not take ownership of
> >> >> +            // the value on error.
> >> >> +            let value =3D unsafe { T::from_foreign(new) };
> >> >> +            StoreError { value, error }
> >> >> +        })
> >> >> +    }
> >> >> +
> >> >> +    /// Inserts a value into this vacant entry.
> >> >> +    ///
> >> >> +    /// Returns a reference to the newly inserted value.
> >> >> +    ///
> >> >> +    /// - This method will fail if the nodes on the path to the in=
dex
> >> >> +    ///   represented by this entry are not present in the XArray.
> >> >> +    /// - This method will not drop the XArray lock.
> >> >> +    ///
> >> >> +    ///
> >> >> +    /// # Examples
> >> >> +    ///
> >> >> +    /// ```
> >> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Ent=
ry}};
> >> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(All=
ocKind::Alloc), GFP_KERNEL)?;
> >> >> +    /// let mut guard =3D xa.lock();
> >> >> +    ///
> >> >> +    /// assert_eq!(guard.get(42), None);
> >> >> +    ///
> >> >> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
> >> >> +    ///     let value =3D KBox::new(0x1337u32, GFP_KERNEL)?;
> >> >> +    ///     let borrowed =3D entry.insert(value)?;
> >> >> +    ///     assert_eq!(*borrowed, 0x1337);
> >> >> +    /// }
> >> >> +    ///
> >> >> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
> >> >> +    ///
> >> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> >> +    /// ```
> >> >> +    pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>=
, StoreError<T>> {
> >> >> +        let new =3D self.insert_internal(value)?;
> >> >> +
> >> >> +        // SAFETY: `new` came from `T::into_foreign`.The entry has=
 exclusive
> >> >
> >> > This is knowledge at a distance. There's no comment anywhere that
> >> > promises that insert_internal called T::into_foreign.
> >>
> >> How would you handle this? Add documentation to `insert_internal`?
> >
> > I think `insert_internal` can return a reference, which would be
> > cleaner (i.e. call T::borrow_mut *there*).
>
> This does not compose well with the implementation of `insert_entry`,
> which needs the void pointer type. `T::BorrowedMut<_>` cannot be turned
> back into a pointer, because we do not set any bounds on it.

I confess that this discussion exceeds what I can do in an email. I'll
take a look at this again in the next version and if I can suggest a
refactor, I will.

>
> <cut>
>
> >> >> +/// A view into an occupied entry in an XArray.
> >> >> +pub struct OccupiedEntry<'a, 'b, T: ForeignOwnable> {
> >> >> +    pub(crate) state: XArrayState<'a, 'b, T>,
> >> >> +    pub(crate) ptr: NonNull<c_void>,
> >> >> +}
> >> >> +
> >> >> +impl<'a, 'b, T> OccupiedEntry<'a, 'b, T>
> >> >> +where
> >> >> +    T: ForeignOwnable,
> >> >> +{
> >> >> +    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize, p=
tr: NonNull<c_void>) -> Self {
> >> >> +        Self {
> >> >> +            state: XArrayState::new(guard, index),
> >> >> +            ptr,
> >> >> +        }
> >> >> +    }
> >> >> +
> >> >> +    /// Removes the value from this occupied entry and returns it,=
 consuming the entry.
> >> >> +    ///
> >> >> +    /// # Examples
> >> >> +    ///
> >> >> +    /// ```
> >> >> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Ent=
ry}};
> >> >> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(All=
ocKind::Alloc), GFP_KERNEL)?;
> >> >> +    /// let mut guard =3D xa.lock();
> >> >> +    ///
> >> >> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KER=
NEL)?;
> >> >> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
> >> >> +    ///
> >> >> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
> >> >> +    ///     let value =3D entry.remove();
> >> >> +    ///     assert_eq!(*value, 0x1337);
> >> >> +    /// }
> >> >> +    ///
> >> >> +    /// assert_eq!(guard.get(42), None);
> >> >> +    ///
> >> >> +    /// # Ok::<(), kernel::error::Error>(())
> >> >> +    /// ```
> >> >> +    pub fn remove(mut self) -> T {
> >> >> +        // NOTE: Storing NULL to an occupied slot never fails.
> >> >
> >> > Shouldn't this be on the debug assert below? Also, is there a citati=
on?
> >>
> >> I'll move it.
> >>
> >> I don't think I have a citation for that. This is a consequence of the
> >> data structure design. If the slot is occupied, the node has already
> >> been allocated, and allocation error is the only failure mode for this=
 path.
> >
> > OK, if there's no citation, then you've got to document your reasoning
> > for this conclusion, I think.
>
> Ok, I'll expand the NOTE.
>
>
> Best regards,
> Andreas Hindborg
>
>

Thanks!
