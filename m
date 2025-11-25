Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0400F32FA13;
	Tue, 25 Nov 2025 18:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764095584; cv=pass; b=gVZet9w/+OJPOanrPsjzqT3T0cfLeqEEd8v0Usg0hQFYWoNdWNlrnA2nvV/7892M6qWZ9KOB6S2Int9h4r1Olb67Y+Vh1eISbvPVqpcaB6a4f11RkyDzh2n3Zmi8Vra2WgKfUQBgG1stgbyqSIBa4D3Ck+Fu+ZwrhgT44ddgJEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764095584; c=relaxed/simple;
	bh=IBNsQsLp8n+PqJOkLKlr0xlzov+LMPAIPEkLXKD9sNY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=X1iCBLcO6YZFlrvnZIHlU2ivqde/511G/LWmvMUjVpBvy+akqvDj2vwTyoJRBZqc+gqHPeY3VHGH5a7MmWfEOQ98CaNX38WXVm61cyFVXr0lvK6Ri6GFxNPPHjCfoRJuJGOPEcox/5Z093FsDTyQ5m2z6ih9MVw/13GOR58XUYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=W+RwynH4; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="W+RwynH4"
ARC-Seal: i=1; a=rsa-sha256; t=1764095548; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MfF0D74m12JIoDtGV7xcz9MCNntMnLRJv7V2Y1jlwX/BshE6/RSkXIOgKM1FZnlY+VUyzLZs1uizyOTdkCQ2AQik6sxukMfvhbyevNxixS9xXDXeskB8Hg+I3ol8rA4aiBXIwwWRYXRPGr/vREwtW9EexsCN4cdicmC/zenpXo4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764095548; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ssDWf796IXcQW1Yfcyfxu6lPR8cUrhUcPMmBHHb+Ruo=; 
	b=ehY/kuCb9/0AbB4qBXK4KobaAXYx8t/qD+N55R71qrYe66ODXy4JI71O59ZeafvwpOwu1BMbkYtywgcT38AsRGp0miYMLFxDB0QkIZNQwI8Pw+Z0AIgN/E0FI3eMPw1GhDcFkZELSBzIq3iyhAWNDapg6ds0oHDn4gL12yQAYEA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764095548;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=ssDWf796IXcQW1Yfcyfxu6lPR8cUrhUcPMmBHHb+Ruo=;
	b=W+RwynH4HtEyU/2UTfHRWV/szzykFn6x2gZv5k3szW+8C6D8Y3HSLAAPtH23eBY5
	XGWnL5+Tm2BNmFJbpZJNfk42uKhFXu9q0h1tPKzpoKcaOHQNeKu7B2inGgvdjTJFZTm
	Je6BZbFlUiA2Z3rOqc4tWbTNn3zhQs8HVfyqYVMs=
Received: by mx.zohomail.com with SMTPS id 1764095544857733.6565010032966;
	Tue, 25 Nov 2025 10:32:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 4/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251101161056.22408-5-work@onurozkan.dev>
Date: Tue, 25 Nov 2025 15:32:08 -0300
Cc: rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 bjorn3_gh@protonmail.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A3A21F48-4F9A-46CD-9CC8-80A55B32CDE2@collabora.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
 <20251101161056.22408-5-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 1 Nov 2025, at 13:10, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Implements full locking API (lock, try_lock, slow path,
> interruptible variants) and integration with kernel bindings.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
> rust/kernel/sync/lock/ww_mutex.rs             | 276 ++++++++++++++++++
> rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 211 +++++++++++++
> 2 files changed, 487 insertions(+)
> create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
>=20
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs =
b/rust/kernel/sync/lock/ww_mutex.rs
> index 727c51cc73af..2a9c1c20281b 100644
> --- a/rust/kernel/sync/lock/ww_mutex.rs
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -1,7 +1,283 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> //! Rust abstractions for the kernel's wound-wait locking primitives.
> +//!
> +//! It is designed to avoid deadlocks when locking multiple =
[`Mutex`]es
> +//! that belong to the same [`Class`]. Each lock acquisition uses an
> +//! [`AcquireCtx`] to track ordering and ensure forward progress.
>=20
> +use crate::error::to_result;
> +use crate::prelude::*;
> +use crate::types::{NotThreadSafe, Opaque};
> +use crate::{bindings, container_of};
> +
> +use core::cell::UnsafeCell;
> +use core::marker::PhantomData;
> +
> +pub use acquire_ctx::AcquireCtx;
> pub use class::Class;
>=20
> +mod acquire_ctx;
> mod class;
> +
> +/// A wound-wait (ww) mutex that is powered with deadlock avoidance
> +/// when acquiring multiple locks of the same [`Class`].
> +///
> +/// Each mutex belongs to a [`Class`], which the wound-wait algorithm
> +/// uses to figure out the order of acquisition and prevent =
deadlocks.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::c_str;
> +/// use kernel::sync::Arc;
> +/// use kernel::sync::lock::ww_mutex::{AcquireCtx, Class, Mutex};
> +/// use pin_init::stack_pin_init;
> +///
> +/// stack_pin_init!(let class =3D =
Class::new_wound_wait(c_str!("some_class")));
> +/// let mutex =3D Arc::pin_init(Mutex::new(42, &class), GFP_KERNEL)?;
> +///
> +/// let ctx =3D KBox::pin_init(AcquireCtx::new(&class), GFP_KERNEL)?;
> +///
> +/// // SAFETY: Both `ctx` and `mutex` uses the same class.
> +/// let guard =3D unsafe { ctx.lock(&mutex)? };
> +/// assert_eq!(*guard, 42);
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +pub struct Mutex<'a, T: ?Sized> {
> +    #[pin]
> +    inner: Opaque<bindings::ww_mutex>,
> +    _p: PhantomData<&'a Class>,
> +    data: UnsafeCell<T>,
> +}
> +
> +// SAFETY: `Mutex` can be sent to another thread if the protected
> +// data `T` can be.
> +unsafe impl<T: ?Sized + Send> Send for Mutex<'_, T> {}
> +
> +// SAFETY: `Mutex` can be shared across threads if the protected
> +// data `T` can be.
> +unsafe impl<T: ?Sized + Send + Sync> Sync for Mutex<'_, T> {}
> +
> +impl<'class, T> Mutex<'class, T> {
> +    /// Initializes [`Mutex`] with the given `data` and [`Class`].
> +    pub fn new(data: T, class: &'class Class) -> impl PinInit<Self> {
> +        let class_ptr =3D class.inner.get();
> +        pin_init!(Mutex {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| =
{
> +                // SAFETY: `class` is valid for the lifetime `'class` =
captured by `Self`.
> +                unsafe { bindings::ww_mutex_init(slot, class_ptr) }
> +            }),
> +            data: UnsafeCell::new(data),
> +            _p: PhantomData
> +        })
> +    }
> +}
> +
> +impl<'class> Mutex<'class, ()> {
> +    /// Creates a [`Mutex`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is a valid pointer to a =
`ww_mutex`
> +    /// and that it remains valid for the lifetime `'a`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) -> &'a =
Self {
> +        // SAFETY: By the safety contract, the caller guarantees that =
`ptr`
> +        // points to a valid `ww_mutex` which is the `inner` field of =
`Mutex`
> +        // and remains valid for the lifetime `'a`.
> +        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, inner) =
}
> +    }
> +}
> +
> +impl<'class, T: ?Sized> Mutex<'class, T> {
> +    /// Checks if the mutex is currently locked.
> +    pub fn is_locked(&self) -> bool {
> +        // SAFETY: The mutex is pinned and valid.
> +        unsafe { bindings::ww_mutex_is_locked(self.inner.get()) }
> +    }
> +
> +    /// Locks the given mutex without acquire context =
([`AcquireCtx`]).
> +    pub fn lock<'a>(&'a self) -> Result<MutexGuard<'a, T>> {
> +        // SAFETY: `ctx` is `None`, so no class matching is required.
> +        unsafe { lock_common(self, None, LockKind::Regular) }
> +    }
> +
> +    /// Similar to `lock`, but can be interrupted by signals.
> +    pub fn lock_interruptible<'a>(&'a self) -> Result<MutexGuard<'a, =
T>> {
> +        // SAFETY: `ctx` is `None`, so no class matching is required.
> +        unsafe { lock_common(self, None, LockKind::Interruptible) }
> +    }
> +
> +    /// Locks the given mutex without acquire context =
([`AcquireCtx`]) using the slow path.
> +    ///
> +    /// This function should be used when `lock` fails (typically due =
to a potential deadlock).
> +    pub fn lock_slow<'a>(&'a self) -> Result<MutexGuard<'a, T>> {
> +        // SAFETY: `ctx` is `None`, so no class matching is required.
> +        unsafe { lock_common(self, None, LockKind::Slow) }
> +    }
> +
> +    /// Similar to `lock_slow`, but can be interrupted by signals.
> +    pub fn lock_slow_interruptible<'a>(&'a self) -> =
Result<MutexGuard<'a, T>> {
> +        // SAFETY: `ctx` is `None`, so no class matching is required.
> +        unsafe { lock_common(self, None, LockKind::SlowInterruptible) =
}
> +    }
> +
> +    /// Tries to lock the mutex with no [`AcquireCtx`] and without =
blocking.
> +    ///
> +    /// Unlike `lock`, no deadlock handling is performed.
> +    pub fn try_lock<'a>(&'a self) -> Result<MutexGuard<'a, T>> {
> +        // SAFETY: `ctx` is `None`, so no class matching is required.
> +        unsafe { lock_common(self, None, LockKind::Try) }
> +    }
> +}
> +
> +/// A guard that provides exclusive access to the data protected
> +/// by a [`Mutex`].
> +///
> +/// # Invariants
> +///
> +/// The guard holds an exclusive lock on the associated [`Mutex`]. =
The lock is held
> +/// for the entire lifetime of this guard and is automatically =
released when the
> +/// guard is dropped.
> +#[must_use =3D "the lock unlocks immediately when the guard is =
unused"]
> +pub struct MutexGuard<'a, T: ?Sized> {
> +    mutex: &'a Mutex<'a, T>,
> +    _not_send: NotThreadSafe,
> +}
> +
> +// SAFETY: [`MutexGuard`] can be shared between threads if the data =
can.
> +unsafe impl<T: ?Sized + Sync> Sync for MutexGuard<'_, T> {}
> +
> +impl<'a, T: ?Sized> MutexGuard<'a, T> {
> +    /// Creates a new guard for a locked mutex.
> +    fn new(mutex: &'a Mutex<'a, T>) -> Self {
> +        Self {
> +            mutex,
> +            _not_send: NotThreadSafe,
> +        }
> +    }
> +}
> +
> +impl<'a> MutexGuard<'a, ()> {
> +    /// Creates a [`MutexGuard`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is a valid pointer to a =
`ww_mutex`
> +    /// and that it remains valid for the lifetime `'a`.
> +    pub unsafe fn from_raw<'b>(ptr: *mut bindings::ww_mutex) -> =
MutexGuard<'b, ()> {
> +        // SAFETY: By the safety contract, the caller guarantees that =
`ptr`
> +        // points to a valid `ww_mutex` which is the `mutex` field of =
`Mutex`
> +        // and remains valid for the lifetime `'a`.
> +        let mutex =3D unsafe { Mutex::from_raw(ptr) };
> +
> +        MutexGuard::new(mutex)
> +    }
> +}
> +
> +impl<T: ?Sized> core::ops::Deref for MutexGuard<'_, T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: We hold the lock, so we have exclusive access.
> +        unsafe { &*self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized + Unpin> core::ops::DerefMut for MutexGuard<'_, T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: We hold the lock, so we have exclusive access.
> +        unsafe { &mut *self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized> Drop for MutexGuard<'_, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: We hold the lock and are about to release it.
> +        unsafe { bindings::ww_mutex_unlock(self.mutex.inner.get()) };
> +    }
> +}
> +
> +/// Locking kinds used by [`lock_common`] to unify the internal
> +/// locking logic.
> +///
> +/// It's best not to expose this type (and [`lock_common`]) to the
> +/// kernel, as it allows internal API changes without worrying
> +/// about breaking external compatibility.
> +#[derive(Copy, Clone, Debug)]
> +enum LockKind {
> +    /// Blocks until lock is acquired.
> +    Regular,
> +    /// Blocks but can be interrupted by signals.
> +    Interruptible,
> +    /// Used in slow path after deadlock detection.
> +    Slow,
> +    /// Slow path but interruptible.
> +    SlowInterruptible,
> +    /// Does not block, returns immediately if busy.
> +    Try,
> +}
> +
> +/// Internal helper that unifies the different locking kinds.
> +///
> +/// # Safety
> +///
> +/// If `ctx` is `Some`, the given `mutex` must be created with the =
[`Class`] that
> +/// was used to initialize `ctx`.
> +unsafe fn lock_common<'a, T: ?Sized>(
> +    mutex: &'a Mutex<'a, T>,
> +    ctx: Option<&AcquireCtx<'_>>,
> +    kind: LockKind,
> +) -> Result<MutexGuard<'a, T>> {
> +    let ctx_ptr =3D ctx.map_or(core::ptr::null_mut(), |c| =
c.inner.get());
> +
> +    let mutex_ptr =3D mutex.inner.get();
> +
> +    match kind {
> +        LockKind::Regular =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is =
`Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both =
cases are safe.
> +            let ret =3D unsafe { bindings::ww_mutex_lock(mutex_ptr, =
ctx_ptr) };
> +
> +            to_result(ret)?;
> +        }
> +        LockKind::Interruptible =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is =
`Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both =
cases are safe.
> +            let ret =3D unsafe { =
bindings::ww_mutex_lock_interruptible(mutex_ptr, ctx_ptr) };
> +
> +            to_result(ret)?;
> +        }
> +        LockKind::Slow =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is =
`Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both =
cases are safe.
> +            unsafe { bindings::ww_mutex_lock_slow(mutex_ptr, ctx_ptr) =
};
> +        }
> +        LockKind::SlowInterruptible =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is =
`Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both =
cases are safe.
> +            let ret =3D unsafe { =
bindings::ww_mutex_lock_slow_interruptible(mutex_ptr, ctx_ptr) };
> +
> +            to_result(ret)?;
> +        }
> +        LockKind::Try =3D> {
> +            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is =
`Some`, it is pinned,
> +            // if `None`, it is set to `core::ptr::null_mut()`. Both =
cases are safe.
> +            let ret =3D unsafe { =
bindings::ww_mutex_trylock(mutex_ptr, ctx_ptr) };
> +
> +            if ret =3D=3D 0 {
> +                return Err(EBUSY);
> +            } else {
> +                to_result(ret)?;
> +            }
> +        }
> +    };
> +
> +    Ok(MutexGuard::new(mutex))
> +}
> diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs =
b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
> new file mode 100644
> index 000000000000..65a955b5809d
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Provides [`AcquireCtx`] for managing multiple wound/wait
> +//! mutexes from the same [`Class`].
> +
> +use crate::bindings;
> +use crate::prelude::*;
> +use crate::types::Opaque;
> +
> +use core::marker::PhantomData;
> +
> +use super::{lock_common, Class, LockKind, Mutex, MutexGuard};
> +
> +/// Groups multiple [`Mutex`]es for deadlock avoidance when acquired
> +/// with the same [`Class`].
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::sync::lock::ww_mutex::{Class, AcquireCtx, Mutex};
> +/// use kernel::c_str;
> +/// use kernel::sync::Arc;
> +/// use pin_init::stack_pin_init;
> +///
> +/// stack_pin_init!(let class =3D =
Class::new_wound_wait(c_str!("demo")));
> +///
> +/// // Create mutexes.
> +/// let mutex1 =3D Arc::pin_init(Mutex::new(1, &class), GFP_KERNEL)?;
> +/// let mutex2 =3D Arc::pin_init(Mutex::new(2, &class), GFP_KERNEL)?;
> +///
> +/// // Create acquire context for deadlock avoidance.
> +/// let ctx =3D KBox::pin_init(AcquireCtx::new(&class), GFP_KERNEL)?;
> +///
> +/// let guard1 =3D unsafe { ctx.lock(&mutex1)? };
> +/// let guard2 =3D unsafe { ctx.lock(&mutex2)? };
> +///
> +/// // Mark acquisition phase as complete.
> +/// // SAFETY: It's called exactly once here and nowhere else.
> +/// unsafe { ctx.done() };
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data(PinnedDrop)]
> +#[repr(transparent)]
> +pub struct AcquireCtx<'a> {
> +    #[pin]
> +    pub(super) inner: Opaque<bindings::ww_acquire_ctx>,
> +    _p: PhantomData<&'a Class>,
> +}
> +
> +impl<'class> AcquireCtx<'class> {
> +    /// Initializes a new [`AcquireCtx`] with the given `class`.
> +    pub fn new(class: &'class Class) -> impl PinInit<Self> {
> +        let class_ptr =3D class.inner.get();
> +        pin_init!(AcquireCtx {
> +            inner <- Opaque::ffi_init(|slot: *mut =
bindings::ww_acquire_ctx| {
> +                // SAFETY: `class` is valid for the lifetime `'class` =
captured
> +                // by `AcquireCtx`.
> +                unsafe { bindings::ww_acquire_init(slot, class_ptr) }
> +            }),
> +            _p: PhantomData
> +        })
> +    }
> +
> +    /// Creates a [`AcquireCtx`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is a valid pointer to the =
`inner` field
> +    /// of [`AcquireCtx`] and that it remains valid for the lifetime =
`'a`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_acquire_ctx) -> =
&'a Self {
> +        // SAFETY: By the safety contract, `ptr` is valid to =
construct `AcquireCtx`.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Marks the end of the acquire phase.
> +    ///
> +    /// Calling this function is optional. It is just useful to =
document
> +    /// the code and clearly designated the acquire phase from =
actually
> +    /// using the locked data structures.
> +    ///
> +    /// After calling this function, no more mutexes can be acquired =
with
> +    /// this context.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that this function is called only =
once.
> +    pub unsafe fn done(&self) {
> +        // SAFETY: By the safety contract, the caller guarantees that =
this
> +        // function is called only once.
> +        unsafe { bindings::ww_acquire_done(self.inner.get()) };
> +    }
> +
> +    /// Re-initializes the [`AcquireCtx`].
> +    ///
> +    /// Must be called after releasing all locks when [`EDEADLK`] =
occurs.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The given class must be equal to the class that was used to
> +    /// initialize this [`AcquireCtx`].
> +    pub unsafe fn reinit(self: Pin<&mut Self>, class: &'class Class) =
{
> +        let ctx =3D self.inner.get();
> +
> +        // SAFETY:
> +        //  - Lifetime of any guard (which hold an immutable borrow =
of `self`) cannot overlap
> +        //    with the execution of this function. This enforces that =
all locks acquired via
> +        //    this context have been released.
> +        //
> +        //  - `ctx` is valid pointer to a `ww_acquire_ctx`.
> +        //
> +        //  - `ctx` is guaranteed to be initialized because =
`ww_acquire_fini`
> +        //    can only be called from the `Drop` implementation.
> +        //
> +        //  - `ww_acquire_fini` is safe to call on an initialized =
context.
> +        unsafe { bindings::ww_acquire_fini(ctx) };
> +
> +        // SAFETY:
> +        //  - `ctx` is valid pointer to a `ww_acquire_ctx`.
> +        //
> +        //  - `class` is a valid pointer to a `ww_class`.
> +        //
> +        //  - `ww_acquire_init` is safe to call with valid pointers
> +        //     to initialize an uninitialized context.
> +        //
> +        //   - By the safety contract, the caller guarantees that the =
given
> +        //     `class` is the same as the one used to initialize this =
`AcquireCtx`.
> +        unsafe { bindings::ww_acquire_init(ctx, class.inner.get()) };
> +    }
> +
> +    /// Locks the given mutex on this [`AcquireCtx`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The given `mutex` must be created with the [`Class`] that was =
used
> +    /// to initialize this [`AcquireCtx`].
> +    pub unsafe fn lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> =
Result<MutexGuard<'a, T>> {
> +        // SAFETY: By the safety contract, `mutex` belongs to the =
same `Class`
> +        // as `self` does.
> +        unsafe { lock_common(mutex, Some(self), LockKind::Regular) }
> +    }
> +
> +    /// Similar to `lock`, but can be interrupted by signals.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The given `mutex` must be created with the [`Class`] that was =
used
> +    /// to initialize this [`AcquireCtx`].
> +    pub unsafe fn lock_interruptible<'a, T>(
> +        &'a self,
> +        mutex: &'a Mutex<'a, T>,
> +    ) -> Result<MutexGuard<'a, T>> {
> +        // SAFETY: By the safety contract, `mutex` belongs to the =
same `Class`
> +        // as `self` does.
> +        unsafe { lock_common(mutex, Some(self), =
LockKind::Interruptible) }
> +    }
> +
> +    /// Locks the given mutex on this [`AcquireCtx`] using the slow =
path.
> +    ///
> +    /// This function should be used when `lock` fails (typically due =
to a potential deadlock).
> +    ///
> +    /// # Safety
> +    ///
> +    /// The given `mutex` must be created with the [`Class`] that was =
used
> +    /// to initialize this [`AcquireCtx`].

I=E2=80=99m assuming we either can=E2=80=99t or otherwise don=E2=80=99t =
want to store this in the Mutex itself?

IOW: the class is =E2=80=99static IIUC, so it=E2=80=99s always safe to =
store a reference anyways, at the
cost of providing the storage.

> +    pub unsafe fn lock_slow<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) =
-> Result<MutexGuard<'a, T>> {
> +        // SAFETY: By the safety contract, `mutex` belongs to the =
same `Class`
> +        // as `self` does.
> +        unsafe { lock_common(mutex, Some(self), LockKind::Slow) }
> +    }
> +
> +    /// Similar to `lock_slow`, but can be interrupted by signals.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The given `mutex` must be created with the [`Class`] that was =
used
> +    /// to initialize this [`AcquireCtx`].
> +    pub unsafe fn lock_slow_interruptible<'a, T>(
> +        &'a self,
> +        mutex: &'a Mutex<'a, T>,
> +    ) -> Result<MutexGuard<'a, T>> {
> +        // SAFETY: By the safety contract, `mutex` belongs to the =
same `Class`
> +        // as `self` does.
> +        unsafe { lock_common(mutex, Some(self), =
LockKind::SlowInterruptible) }
> +    }
> +
> +    /// Tries to lock the mutex on this [`AcquireCtx`] without =
blocking.
> +    ///
> +    /// Unlike `lock`, no deadlock handling is performed.

You can use [`lock`] here for better docs.

> +    ///
> +    /// # Safety
> +    ///
> +    /// The given `mutex` must be created with the [`Class`] that was =
used
> +    /// to initialize this [`AcquireCtx`].
> +    pub unsafe fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) =
-> Result<MutexGuard<'a, T>> {
> +        // SAFETY: By the safety contract, `mutex` belongs to the =
same `Class`
> +        // as `self` does.
> +        unsafe { lock_common(mutex, Some(self), LockKind::Try) }
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for AcquireCtx<'_> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: Given the lifetime bounds we know no locks are =
held,
> +        // so calling `ww_acquire_fini` is safe.
> +        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
> +    }
> +}
> --=20
> 2.51.2
>=20
>=20

=E2=80=94 Daniel=
