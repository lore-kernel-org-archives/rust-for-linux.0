Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F511B6D08
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767025559; cv=none; b=QxvCWYplSnx8fuoF8nFX5fi7OI3NGkMhn+uOAo1rPf2iKetSla+1xFDBpQGx2WCnIyDeGzQP378fOs3UwMmQacIe0ylulYR83NDFrB71vMv1E43MVhPUmJ2gSqr+5rYyk7WaqtaDwHt+WmZ6Zg3iVOs0+ZySnHD932dmNug5atI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767025559; c=relaxed/simple;
	bh=Bv4rd/ID81SnLULY/P/vf4kGvGj+iX8WkteWPFX7e88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McqUIUdvqzJnIFbwDmjXBFHUeQi6GVutKj/UvwX+Aw5VPHZjLn4rQLHOy/R5IN4p6/IQ2yZzTlCvEN60hMiEI1IttQjPCDzMFRF0UJ3Q/Fpj0PB+ZAqSMgeFxOoBg3eiZyfV7fc1fAXuIzEmPtRAniCHZdQe+au8joT/j68e5dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCJkjRXV; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCJkjRXV"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37d13ddaa6aso63438301fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 08:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767025555; x=1767630355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEyKHldIcXH5Ol9iSd/hBkajVhYNW5J18A5pQpy9X/E=;
        b=QCJkjRXVFHW2f20uemWweQAtarQSVFRN+yHd0tzTzebO4JkzS/TmZVe41pA8OGEz9k
         Rv82nW5qIzDQN4OqciPtt3wKpuOM89URMQoWoRsYSVK01euFyuPAGtQZKkJ4RaIbKMbB
         /ds233zUgv8M8mvKCg3WNLSTBFf9RTiIVqW3EKWryux9wAWSMPa1EWG2vrv+JRNtb2XX
         A+eypbKaGTmK+eABdZxTNroTq/QR4mGyjsvK+/7ov8deUhiBGk+XJ4Kwfnvlgm3ZBjZt
         xJhwwDkvcVDqMQVZIUmgcTudc481ok1QjapJNSMmwfkMGHOiDEqU63Fz0h6AWP51Sul3
         rWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767025555; x=1767630355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zEyKHldIcXH5Ol9iSd/hBkajVhYNW5J18A5pQpy9X/E=;
        b=EcoTEDWCyYxfbs5UrR4Z3rYvmN8WWXljdK7yZI4scNrHC+zN6cT6KKVeD33f8zUIgo
         lDWYXTvu0oJGnJMLlTLMsuVuyLo4+wV9F9wYCwqB9DIkqDs5qT2EoU7ZxHjdMZPhNUYZ
         nLxTZaaF86nCeB6M9TCsaXlwY+b2cGQ1WcCbCro3lVC0L8jT9Mvjk/3md3gMmpaPhV5G
         USGNUppAQPOOhXMf4gnAXRGRix9wpyC1xULPUdLl7TpcwfHjgmdBQCrQORL//2185YQc
         KXgVnZ0IFGnMfIUvZFj9svCYKXPIweRv/oI7bTIPtyjWAa213P04g3rdQhw7ucWnvuPm
         iilQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzeyH6OB0UxO2OL03lKaOd6kCLQ4sY3kpH4CxWqhVUj8lDQUdO1Zn4UpKPw6a39PEW+0nnl7i4sVwCXGvuTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuX3LNRwOstb6wYTct2yl7a49lT9EJkmYmfj1qcMz65udbhLDA
	+O5r8+1XRnawbdQMwZt0oUi3krdWMFjzZPQ6P5KBNRZ2OZvxGRwk88vD8Sz7QRgf68efKeWPS8C
	A36ofQnNxQaWMScqgqee66JMjZ71lSho=
X-Gm-Gg: AY/fxX5HMnHQ3T/b15447eRFkrLRV7O6V9hEJw4mmSlesE14gxP+W7WMrvGDBS/Phzb
	UCzqxTDH9HIQaBh8lQi/rqX392ou15oUBRpAl2D/HtPZ9xS4j+QovNrV7FMmzXEtbmTwSesiAuI
	PajeuJGFYb9eO/3tv/m1K/9yrL7iXfCPI2iPL862evgJ74i0UEF0kpQBfoV2YhIT12eCfnPitmX
	2dPugKzo2c4SKWKyM3GADcRBpYxRjhrXbCEFZr1sJsweF9rxVLji5tDRjqYHqdjG82eIGtu78y4
	Px5zttkucdiHIYhyMmM/aaNny+MmA8LHXc5PCPB1x21SSBcYoPupvLJ+qhOaiT6jvFSSXs612zy
	Ym3MWH/SMu6Ns7vBWtSwpvc02pIiVZQ5+4UubPFwI3w==
X-Google-Smtp-Source: AGHT+IEkzpyvFsdZY8cCBptKB9Mqv8/0sUhEmajeuA/olm96EpwWeX1j/8saPyREOVxJKxL+xvMhTB+97aKXyxmZEFc=
X-Received: by 2002:a05:651c:1b96:b0:37b:90fb:9caf with SMTP id
 38308e7fff4ca-3812169eee6mr92049321fa.41.1767025554509; Mon, 29 Dec 2025
 08:25:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-8-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-8-9e5ffd5e3cf0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 11:25:18 -0500
X-Gm-Features: AQt7F2onmdEskJMwT5QZ8un9cNEDCUs0imwGaDy_GOeEdpQ7CcMabFc-clHcIRo
Message-ID: <CAJ-ks9kYoxpPnB9amA-11SRNHbqUbp_D51qVCNDdvBZSo2gsTQ@mail.gmail.com>
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

On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Add an Entry API for XArray that provides ergonomic access to array
> slots that may be vacant or occupied. The API follows the pattern of
> Rust's standard library HashMap entry API, allowing efficient
> conditional insertion and modification of entries.
>
> The implementation uses the XArray state API (`xas_*` functions) for
> efficient operations without requiring multiple lookups. Helper
> functions are added to rust/helpers/xarray.c to wrap C macros that are
> not directly accessible from Rust.
>
> Also update MAINTAINERS to cover the new rust files.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  MAINTAINERS                 |   1 +
>  rust/helpers/xarray.c       |  17 ++
>  rust/kernel/xarray.rs       | 112 +++++++++++++
>  rust/kernel/xarray/entry.rs | 376 ++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 506 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e8f06145fb54c..79d4c9c9b2b63 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27909,6 +27909,7 @@ B:      https://github.com/Rust-for-Linux/linux/i=
ssues
>  C:     https://rust-for-linux.zulipchat.com
>  T:     git https://github.com/Rust-for-Linux/linux.git xarray-next
>  F:     rust/kernel/xarray.rs
> +F:     rust/kernel/xarray/
>
>  XBOX DVD IR REMOTE
>  M:     Benjamin Valentin <benpicco@googlemail.com>
> diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
> index 60b299f11451d..425a6cc494734 100644
> --- a/rust/helpers/xarray.c
> +++ b/rust/helpers/xarray.c
> @@ -26,3 +26,20 @@ void rust_helper_xa_unlock(struct xarray *xa)
>  {
>         return xa_unlock(xa);
>  }
> +
> +void *rust_helper_xas_result(struct xa_state *xas, void *curr)
> +{
> +       if (xa_err(xas->xa_node))
> +               curr =3D xas->xa_node;
> +       return curr;
> +}

Instead of this duplication, can we expose `xas_result` from the header?

> +
> +void *rust_helper_xa_zero_to_null(void *entry)
> +{
> +       return xa_is_zero(entry) ? NULL : entry;
> +}
> +
> +int rust_helper_xas_error(const struct xa_state *xas)
> +{
> +       return xas_error(xas);
> +}
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index 9d4589979fd1d..2b8d56c81e36b 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -13,11 +13,17 @@
>          NonNull, //
>      },
>  };
> +pub use entry::{
> +    Entry,
> +    OccupiedEntry,
> +    VacantEntry, //
> +};
>  use kernel::{
>      alloc,
>      bindings,
>      build_assert, //
>      error::{
> +        to_result,
>          Error,
>          Result, //
>      },
> @@ -255,6 +261,35 @@ pub fn get_mut(&mut self, index: usize) -> Option<T:=
:BorrowedMut<'_>> {
>          Some(unsafe { T::borrow_mut(ptr.as_ptr()) })
>      }
>
> +    /// Gets an entry for the specified index, which can be vacant or oc=
cupied.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// assert_eq!(guard.contains_index(42), false);
> +    ///
> +    /// match guard.get_entry(42) {
> +    ///     Entry::Vacant(entry) =3D> {
> +    ///         entry.insert(KBox::new(0x1337u32, GFP_KERNEL)?)?;
> +    ///     }
> +    ///     Entry::Occupied(_) =3D> unreachable!("We did not insert an e=
ntry yet"),
> +    /// }
> +    ///
> +    /// assert_eq!(guard.get(42), Some(&0x1337));
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn get_entry<'b>(&'b mut self, index: usize) -> Entry<'a, 'b, T>=
 {
> +        match self.load(index) {
> +            None =3D> Entry::Vacant(VacantEntry::new(self, index)),
> +            Some(ptr) =3D> Entry::Occupied(OccupiedEntry::new(self, inde=
x, ptr)),
> +        }
> +    }

Why not "entry" like the stdlib collections?

> +
>      fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_void>)=
> {
>          let mut state =3D XArrayState::new(self, index);
>          // SAFETY: `state.state` is always valid by the type invariant o=
f
> @@ -320,6 +355,76 @@ pub fn find_next_mut(&mut self, index: usize) -> Opt=
ion<(usize, T::BorrowedMut<'
>              .map(move |(index, ptr)| (index, unsafe { T::borrow_mut(ptr.=
as_ptr()) }))
>      }
>
> +    /// Finds the next occupied entry starting from the given index.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    /// guard.store(20, KBox::new(20u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    ///
> +    /// if let Some(entry) =3D guard.find_next_entry(5) {
> +    ///     assert_eq!(entry.index(), 10);
> +    ///     let value =3D entry.remove();
> +    ///     assert_eq!(*value, 10);
> +    /// }
> +    ///
> +    /// assert_eq!(guard.get(10), None);
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn find_next_entry<'b>(&'b mut self, index: usize) -> Option<Occ=
upiedEntry<'a, 'b, T>> {
> +        let mut state =3D XArrayState::new(self, index);
> +
> +        // SAFETY: `state.state` is properly initialized by XArrayState:=
:new and the caller holds
> +        // the lock.
> +        let ptr =3D NonNull::new(unsafe { bindings::xas_find(&mut state.=
state, usize::MAX) })?;
> +
> +        Some(OccupiedEntry { state, ptr })
> +    }

I'm surprised this doesn't share code with find_next_mut. Can it?
Again, I'd have expected the bulk of the logic to be on XArrayState.

> +
> +    /// Finds the next occupied entry starting at the given index, wrapp=
ing around.
> +    ///
> +    /// Searches for an entry starting at `index` up to the maximum inde=
x. If no entry
> +    /// is found, wraps around and searches from index 0 up to `index`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// guard.store(100, KBox::new(42u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    /// let entry =3D guard.find_next_entry_circular(101);
> +    /// assert_eq!(entry.map(|e| e.index()), Some(100));
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn find_next_entry_circular<'b>(
> +        &'b mut self,
> +        index: usize,
> +    ) -> Option<OccupiedEntry<'a, 'b, T>> {
> +        let mut state =3D XArrayState::new(self, index);
> +
> +        // SAFETY: `state.state` is properly initialized by XArrayState:=
:new and the caller holds
> +        // the lock.
> +        let ptr =3D NonNull::new(unsafe { bindings::xas_find(&mut state.=
state, usize::MAX) })
> +            .or_else(|| {
> +                state.state.xa_node =3D bindings::XAS_RESTART as *mut bi=
ndings::xa_node;
> +                state.state.xa_index =3D 0;
> +                // SAFETY: `state.state` is properly initialized and by =
type invariant, we hold the
> +                // xarray lock.
> +                NonNull::new(unsafe { bindings::xas_find(&mut state.stat=
e, index) })
> +            })?;
> +
> +        Some(OccupiedEntry { state, ptr })
> +    }

Instead of this function, can find_next_entry take a Range? Then it
would be simple for the caller to wrap if they want, without bloating
this API.

> +
>      /// Removes and returns the element at the given index.
>      pub fn remove(&mut self, index: usize) -> Option<T> {
>          // SAFETY:
> @@ -416,8 +521,15 @@ fn new(access: &'b Guard<'a, T>, index: usize) -> Se=
lf {
>              },
>          }
>      }
> +
> +    fn status(&self) -> Result {
> +        // SAFETY: `self.state` is properly initialized and valid.
> +        to_result(unsafe { bindings::xas_error(&self.state) })
> +    }
>  }
>
> +mod entry;
> +
>  // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `=
T` is `Send`.
>  unsafe impl<T: ForeignOwnable + Send> Send for XArray<T> {}
>
> diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
> new file mode 100644
> index 0000000000000..1268dc35bac58
> --- /dev/null
> +++ b/rust/kernel/xarray/entry.rs
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use super::{
> +    Guard,
> +    StoreError,
> +    XArrayState, //
> +};
> +use core::ptr::NonNull;
> +use kernel::{
> +    prelude::*,
> +    types::ForeignOwnable, //
> +};
> +
> +/// Represents either a vacant or occupied entry in an XArray.
> +pub enum Entry<'a, 'b, T: ForeignOwnable> {
> +    /// A vacant entry that can have a value inserted.
> +    Vacant(VacantEntry<'a, 'b, T>),
> +    /// An occupied entry containing a value.
> +    Occupied(OccupiedEntry<'a, 'b, T>),
> +}
> +
> +impl<T: ForeignOwnable> Entry<'_, '_, T> {
> +    /// Returns true if this entry is occupied.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    ///
> +    /// let entry =3D guard.get_entry(42);
> +    /// assert_eq!(entry.is_occupied(), false);
> +    ///
> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    /// let entry =3D guard.get_entry(42);
> +    /// assert_eq!(entry.is_occupied(), true);
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn is_occupied(&self) -> bool {
> +        matches!(self, Entry::Occupied(_))
> +    }

Do we need this? IMO less is more, and even stdlib doesn't have this.

> +}
> +
> +/// A view into a vacant entry in an XArray.
> +pub struct VacantEntry<'a, 'b, T: ForeignOwnable> {
> +    state: XArrayState<'a, 'b, T>,
> +}
> +
> +impl<'a, 'b, T> VacantEntry<'a, 'b, T>
> +where
> +    T: ForeignOwnable,
> +{
> +    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize) -> Self=
 {
> +        Self {
> +            state: XArrayState::new(guard, index),
> +        }
> +    }
> +
> +    fn insert_internal(&mut self, value: T) -> Result<*mut c_void, Store=
Error<T>> {
> +        let new =3D T::into_foreign(value).cast();
> +
> +        // SAFETY: `self.state.state` is properly initialized and `new` =
came from `T::into_foreign`.
> +        // We hold the xarray lock.
> +        unsafe { bindings::xas_store(&mut self.state.state, new) };

Can this please be on XArray?

> +
> +        self.state.status().map(|()| new).map_err(|error| {
> +            // SAFETY: `new` came from `T::into_foreign` and `xas_store`=
 does not take ownership of
> +            // the value on error.
> +            let value =3D unsafe { T::from_foreign(new) };
> +            StoreError { value, error }
> +        })
> +    }
> +
> +    /// Inserts a value into this vacant entry.
> +    ///
> +    /// Returns a reference to the newly inserted value.
> +    ///
> +    /// - This method will fail if the nodes on the path to the index
> +    ///   represented by this entry are not present in the XArray.
> +    /// - This method will not drop the XArray lock.
> +    ///
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// assert_eq!(guard.get(42), None);
> +    ///
> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
> +    ///     let value =3D KBox::new(0x1337u32, GFP_KERNEL)?;
> +    ///     let borrowed =3D entry.insert(value)?;
> +    ///     assert_eq!(*borrowed, 0x1337);
> +    /// }
> +    ///
> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn insert(mut self, value: T) -> Result<T::BorrowedMut<'b>, Stor=
eError<T>> {
> +        let new =3D self.insert_internal(value)?;
> +
> +        // SAFETY: `new` came from `T::into_foreign`.The entry has exclu=
sive

This is knowledge at a distance. There's no comment anywhere that
promises that insert_internal called T::into_foreign.

> +        // ownership of `new` as it holds a mutable reference to `Guard`=
.
> +        Ok(unsafe { T::borrow_mut(new) })
> +    }
> +
> +    /// Inserts a value and returns an occupied entry representing the n=
ewly inserted value.
> +    ///
> +    /// - This method will fail if the nodes on the path to the index
> +    ///   represented by this entry are not present in the XArray.
> +    /// - This method will not drop the XArray lock.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// assert_eq!(guard.get(42), None);
> +    ///
> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
> +    ///     let value =3D KBox::new(0x1337u32, GFP_KERNEL)?;
> +    ///     let occupied =3D entry.insert_entry(value)?;
> +    ///     assert_eq!(occupied.index(), 42);
> +    /// }
> +    ///
> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn insert_entry(mut self, value: T) -> Result<OccupiedEntry<'a, =
'b, T>, StoreError<T>> {
> +        let new =3D self.insert_internal(value)?;
> +
> +        Ok(OccupiedEntry::<'a, 'b, T> {
> +            state: self.state,
> +            // SAFETY: `new` came from `T::into_foreign` and is guarante=
ed non-null.

Same.

> +            ptr: unsafe { core::ptr::NonNull::new_unchecked(new) },
> +        })
> +    }
> +
> +    /// Returns the index of this vacant entry.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// assert_eq!(guard.get(42), None);
> +    ///
> +    /// if let Entry::Vacant(entry) =3D guard.get_entry(42) {
> +    ///     assert_eq!(entry.index(), 42);
> +    /// }
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn index(&self) -> usize {
> +        self.state.state.xa_index
> +    }
> +}
> +
> +/// A view into an occupied entry in an XArray.
> +pub struct OccupiedEntry<'a, 'b, T: ForeignOwnable> {
> +    pub(crate) state: XArrayState<'a, 'b, T>,
> +    pub(crate) ptr: NonNull<c_void>,
> +}
> +
> +impl<'a, 'b, T> OccupiedEntry<'a, 'b, T>
> +where
> +    T: ForeignOwnable,
> +{
> +    pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize, ptr: No=
nNull<c_void>) -> Self {
> +        Self {
> +            state: XArrayState::new(guard, index),
> +            ptr,
> +        }
> +    }
> +
> +    /// Removes the value from this occupied entry and returns it, consu=
ming the entry.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    /// assert_eq!(guard.get(42).copied(), Some(0x1337));
> +    ///
> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
> +    ///     let value =3D entry.remove();
> +    ///     assert_eq!(*value, 0x1337);
> +    /// }
> +    ///
> +    /// assert_eq!(guard.get(42), None);
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn remove(mut self) -> T {
> +        // NOTE: Storing NULL to an occupied slot never fails.

Shouldn't this be on the debug assert below? Also, is there a citation?

> +        // SAFETY: `self.state.state` is properly initialized and valid =
for XAS operations.
> +        let ptr =3D unsafe {
> +            bindings::xas_result(
> +                &mut self.state.state,
> +                bindings::xa_zero_to_null(bindings::xas_store(
> +                    &mut self.state.state,
> +                    core::ptr::null_mut(),
> +                )),
> +            )
> +        };
> +
> +        // SAFETY: `ptr` is a valid return value from xas_result.
> +        let errno =3D unsafe { bindings::xa_err(ptr) };
> +        debug_assert!(errno =3D=3D 0);
> +
> +        // SAFETY:
> +        // - `ptr` came from `T::into_foreign`.
> +        // - As this method takes self by value, the lifetimes of any [`=
T::Borrowed`] and
> +        //   [`T::BorrowedMut`] we have created must have ended.
> +        unsafe { T::from_foreign(ptr.cast()) }
> +    }
> +
> +    /// Returns the index of this occupied entry.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    ///
> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
> +    ///     assert_eq!(entry.index(), 42);
> +    /// }
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn index(&self) -> usize {
> +        self.state.state.xa_index
> +    }
> +
> +    /// Replaces the value in this occupied entry and returns the old va=
lue.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    ///
> +    /// if let Entry::Occupied(mut entry) =3D guard.get_entry(42) {
> +    ///     let new_value =3D KBox::new(0x9999u32, GFP_KERNEL)?;
> +    ///     let old_value =3D entry.insert(new_value);
> +    ///     assert_eq!(*old_value, 0x1337);
> +    /// }
> +    ///
> +    /// assert_eq!(guard.get(42).copied(), Some(0x9999));
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn insert(&mut self, value: T) -> T {
> +        // NOTE: Storing to an occupied slot never fails.

Citation?

> +        let new =3D T::into_foreign(value).cast();
> +        // SAFETY: `new` came from `T::into_foreign` and is guaranteed n=
on-null.
> +        self.ptr =3D unsafe { NonNull::new_unchecked(new) };
> +
> +        // SAFETY: `self.state.state` is properly initialized and valid =
for XAS operations.
> +        let old =3D unsafe {
> +            bindings::xas_result(
> +                &mut self.state.state,
> +                bindings::xa_zero_to_null(bindings::xas_store(&mut self.=
state.state, new)),
> +            )
> +        };
> +
> +        // SAFETY: `old` is a valid return value from xas_result.
> +        let errno =3D unsafe { bindings::xa_err(old) };
> +        debug_assert!(errno =3D=3D 0);
> +
> +        // SAFETY:
> +        // - `ptr` came from `T::into_foreign`.
> +        // - As this method takes self by value, the lifetimes of any [`=
T::Borrowed`] and
> +        //   [`T::BorrowedMut`] we have created must have ended.
> +        unsafe { T::from_foreign(old) }
> +    }
> +
> +    /// Converts this occupied entry into a mutable reference to the val=
ue in the slot represented
> +    /// by the entry.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    ///
> +    /// if let Entry::Occupied(entry) =3D guard.get_entry(42) {
> +    ///     let value_ref =3D entry.into_mut();
> +    ///     *value_ref =3D 0x9999;
> +    /// }
> +    ///
> +    /// assert_eq!(guard.get(42).copied(), Some(0x9999));
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn into_mut(self) -> T::BorrowedMut<'b> {
> +        // SAFETY: `ptr` came from `T::into_foreign`.
> +        unsafe { T::borrow_mut(self.ptr.as_ptr()) }
> +    }
> +
> +    /// Swaps the value in this entry with the provided value.
> +    ///
> +    /// Returns the old value that was in the entry.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
> +    /// let mut xa =3D KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind=
::Alloc), GFP_KERNEL)?;
> +    /// let mut guard =3D xa.lock();
> +    ///
> +    /// guard.store(42, KBox::new(100u32, GFP_KERNEL)?, GFP_KERNEL)?;
> +    ///
> +    /// if let Entry::Occupied(mut entry) =3D guard.get_entry(42) {
> +    ///     let old_value =3D entry.swap(200u32);
> +    ///     assert_eq!(old_value, 100);
> +    ///     assert_eq!(*entry, 200);
> +    /// }
> +    ///
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```
> +    pub fn swap<U>(&mut self, mut other: U) -> U
> +    where
> +        T: for<'c> ForeignOwnable<Borrowed<'c> =3D &'c U, BorrowedMut<'c=
> =3D &'c mut U>,
> +    {
> +        use core::ops::DerefMut;
> +        core::mem::swap(self.deref_mut(), &mut other);
> +        other
> +    }
> +}

Does this need to return anything?

> +
> +impl<T, U> core::ops::Deref for OccupiedEntry<'_, '_, T>
> +where
> +    T: for<'a> ForeignOwnable<Borrowed<'a> =3D &'a U, BorrowedMut<'a> =
=3D &'a mut U>,
> +{
> +    type Target =3D U;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: `ptr` came from `T::into_foreign`.
> +        unsafe { T::borrow(self.ptr.as_ptr()) }
> +    }
> +}
> +
> +impl<T, U> core::ops::DerefMut for OccupiedEntry<'_, '_, T>
> +where
> +    T: for<'a> ForeignOwnable<Borrowed<'a> =3D &'a U, BorrowedMut<'a> =
=3D &'a mut U>,
> +{
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: `ptr` came from `T::into_foreign`.
> +        unsafe { T::borrow_mut(self.ptr.as_ptr()) }
> +    }
> +}
>
> --
> 2.51.2
>
>
