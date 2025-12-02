Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206382D2382;
	Tue,  2 Dec 2025 18:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764700198; cv=pass; b=u3rzp2XsJNEqBRRnu+GXrbjE74V4OzzgJbNoyJuhSTcLZYavLQcBy7+Kt08Rz6irt8vu7dXI+doEy/sgJQFD0B0PSQUPxHGIUShCfoWQgSeaYsTsf4i3epM5NPRzfJcjaPWjW7J6bXeJqLKeKTzpO8mMz/KHsrccqzONBIKv/5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764700198; c=relaxed/simple;
	bh=gFRb+AsSUZpsKvyTZ0wfN/AeObfIQ59PEhTBV1L7AZw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=H8Ke3q2pfTjBMm8TKzn7hXq9vGRJkv7EdLfYEthF7/yjQ+w4Gz3bHaJSgYr7oQHD3BcM8mg18wuhmUEL8GTnFqncCS0Zxr+LtgQxCmdYloVHIVCTKfjBnl6MPAqn4f+Wl4xdI1MIsAH6d/dZtv5anM2JQtsy4GUUyW0cJdWnY0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=LpsHfGMR; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="LpsHfGMR"
ARC-Seal: i=1; a=rsa-sha256; t=1764700170; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=brQykR/opIVXWpVDrYztJHOVwaixY4X779Z9OJuKLoH/6enfxOQZNkKpSQb7S9kmC4uzNR9JS4+6ah1qnwzMNC5YSuUebUGLmwx44CEqPaJ2heF5JaP+62EEXHwZw6KsVOlpu+Ga9tyfkLnCTecvi9c5jf1QP3VacnGPYC490ng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764700170; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ny6JqR3XaxtQLGAa9QfyDgugZo2Ts86AlNDlspuSfyw=; 
	b=BOKcWQO0+O6P33A2KQx83mzgcgpaIyOf6fdFyyup8N39p9jSqNAXUOrBGELP7p82C1jvL+bondrDoYoZlkEH9t9Nih9CZdHJqm7Ed9VpMt9dhA/DKFPclVkJFh/mqMcGfoHksuAPFwuEJch3R99N0fSu/o450jfW/y9yYgVuX7g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764700170;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=ny6JqR3XaxtQLGAa9QfyDgugZo2Ts86AlNDlspuSfyw=;
	b=LpsHfGMRNjvXSi3bd1t3a8uRuPas/7d1sAyaidqmjJnMczPbhM1F0f7tOfsYS6au
	wxRlY/fYVOb2Ze0aQa69BYSNePRQ4irFHMLO2nXU5xEGgfNMY4UvSm4CHCsFWOf2ggg
	C6UGeJrQBtThzb2BD9faSWtNncToR8Dj5htsbotE=
Received: by mx.zohomail.com with SMTPS id 1764700168661847.9807330171712;
	Tue, 2 Dec 2025 10:29:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251201102855.4413-6-work@onurozkan.dev>
Date: Tue, 2 Dec 2025 15:29:02 -0300
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
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <70CA18E9-E858-4601-B023-5CF512A66DA7@collabora.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
 <20251201102855.4413-6-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Onur,

> On 1 Dec 2025, at 07:28, Onur =C3=96zkan <work@onurozkan.dev> wrote:
>=20
> Covers the entire low-level locking API (lock, try_lock,
> slow path, interruptible variants) and integration with
> kernel bindings.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---
> rust/kernel/sync/lock/ww_mutex.rs             | 442 ++++++++++++++++++
> rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 172 +++++++
> 2 files changed, 614 insertions(+)
> create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
>=20
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs =
b/rust/kernel/sync/lock/ww_mutex.rs
> index 727c51cc73af..00e25872a042 100644
> --- a/rust/kernel/sync/lock/ww_mutex.rs
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -1,7 +1,449 @@
> // SPDX-License-Identifier: GPL-2.0
>=20
> //! Rust abstractions for the kernel's wound-wait locking primitives.
> +//!
> +//! It is designed to avoid deadlocks when locking multiple =
[`Mutex`]es
> +//! that belong to the same [`Class`]. Each lock acquisition uses an
> +//! [`AcquireCtx`] to track ordering and ensure forward progress.
> +//!
> +//! It is recommended to use [`LockSet`] as it provides safe =
high-level
> +//! interface that automatically handles deadlocks, retries and =
context
> +//! management.

This will break the docs, since LockSet is introduced in the next =
commit.
Perhaps add this last paragraph in the next commit?

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
> +pub use lock_set::LockSet;
>=20
> +mod acquire_ctx;
> mod class;
> +mod lock_set;
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
> +/// let guard =3D ctx.lock(&mutex)?;
> +/// assert_eq!(*guard, 42);
> +///
> +/// # Ok::<(), Error>(())
> +/// ```
> +#[pin_data]
> +#[repr(C)]
> +pub struct Mutex<'a, T: ?Sized> {
> +    _p: PhantomData<&'a Class>,

nit: can you keep this last? Let=E2=80=99s not start a #[repr(C)] struct =
with a ZST if we can help it.


> +    #[pin]
> +    inner: Opaque<bindings::ww_mutex>,
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

Foo and impl Foo together, please.

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
> +        //
> +        // Because [`Mutex`] is `#[repr(C)]`, the `inner` field sits =
at a
> +        // stable offset that `container_of!` can safely rely on.
> +        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, inner) =
}
> +    }
> +}

nit: can you move this implementation to be after the fully generic one?

> +
> +impl<'class, T: ?Sized> Mutex<'class, T> {
> +    /// Checks if this [`Mutex`] is currently locked.
> +    ///
> +    /// The returned value is racy as another thread can acquire
> +    /// or release the lock immediately after this call returns.

Then why have this? Apparently there=E2=80=99s only a handful of users =
in the entire kernel?

> +    pub fn is_locked(&self) -> bool {
> +        // SAFETY: It's safe to call `ww_mutex_is_locked` on
> +        // a valid mutex.
> +        unsafe { bindings::ww_mutex_is_locked(self.inner.get()) }
> +    }
> +
> +    /// Locks this [`Mutex`] without [`AcquireCtx`].
> +    pub fn lock(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Regular)
> +    }
> +
> +    /// Similar to [`Self::lock`], but can be interrupted by signals.
> +    pub fn lock_interruptible(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Interruptible)
> +    }
> +
> +    /// Locks this [`Mutex`] without [`AcquireCtx`] using the slow =
path.
> +    ///
> +    /// This function should be used when [`Self::lock`] fails =
(typically due
> +    /// to a potential deadlock).
> +    pub fn lock_slow(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Slow)
> +    }
> +
> +    /// Similar to [`Self::lock_slow`], but can be interrupted by =
signals.
> +    pub fn lock_slow_interruptible(&self) -> Result<MutexGuard<'_, =
T>> {
> +        lock_common(self, None, LockKind::SlowInterruptible)
> +    }
> +
> +    /// Tries to lock this [`Mutex`] with no [`AcquireCtx`] and =
without blocking.
> +    ///
> +    /// Unlike [`Self::lock`], no deadlock handling is performed.
> +    pub fn try_lock(&self) -> Result<MutexGuard<'_, T>> {
> +        lock_common(self, None, LockKind::Try)
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
> +// SAFETY: `MutexGuard` can be shared between threads if the data =
can.
> +unsafe impl<T: ?Sized + Sync> Sync for MutexGuard<'_, T> {}
> +
> +impl<'a, T: ?Sized> MutexGuard<'a, T> {
> +    /// Creates a new guard for the given [`Mutex`].
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

The caller must ensure that the ww_mutex is indeed locked, as an =
invariant of
Guards is that they=E2=80=99re acquired by locking the underlying =
synchronization
primitive.

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

Not if you call from_raw() on an unlocked ww_mutex.

> +        unsafe { &*self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized + Unpin> core::ops::DerefMut for MutexGuard<'_, T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: We hold the lock, so we have exclusive access.

Same here.

> +        unsafe { &mut *self.mutex.data.get() }
> +    }
> +}
> +
> +impl<T: ?Sized> Drop for MutexGuard<'_, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: We hold the lock and are about to release it.
> +        unsafe { bindings::ww_mutex_unlock(self.mutex.inner.get()) };

Same here. Also, unlocking mutex that was not locked in the first place =
would
possibly have some unintended consequences.

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
> +/// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`].
> +fn lock_common<'a, T: ?Sized>(
> +    mutex: &'a Mutex<'a, T>,
> +    ctx: Option<&AcquireCtx<'_>>,
> +    kind: LockKind,
> +) -> Result<MutexGuard<'a, T>> {
> +    let mutex_ptr =3D mutex.inner.get();
> +
> +    let ctx_ptr =3D match ctx {
> +        Some(acquire_ctx) =3D> {
> +            let ctx_ptr =3D acquire_ctx.inner.get();
> +
> +            // SAFETY: `ctx_ptr` is a valid pointer for the entire
> +            // lifetime of `ctx`.
> +            let ctx_class =3D unsafe { (*ctx_ptr).ww_class };
> +
> +            // SAFETY: `mutex_ptr` is a valid pointer for the entire
> +            // lifetime of `mutex`.
> +            let mutex_class =3D unsafe { (*mutex_ptr).ww_class };
> +
> +            // `ctx` and `mutex` must use the same class.
> +            if ctx_class !=3D mutex_class {

IMHO, this is indeed better!

> +                return Err(EINVAL);
> +            }
> +
> +            ctx_ptr
> +        }
> +        None =3D> core::ptr::null_mut(),
> +    };
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
> +
> +#[kunit_tests(rust_kernel_ww_mutex)]
> +mod tests {
> +    use crate::prelude::*;
> +    use crate::sync::Arc;
> +    use crate::{c_str, define_class};
> +    use pin_init::stack_pin_init;
> +
> +    use super::*;
> +
> +    // A simple coverage on `define_class` macro.
> +    define_class!(TEST_WOUND_WAIT_CLASS, wound_wait, c_str!("test"));
> +    define_class!(TEST_WAIT_DIE_CLASS, wait_die, c_str!("test"));
> +
> +    #[test]
> +    fn test_ww_mutex_basic_lock_unlock() -> Result {
> +        stack_pin_init!(let class =3D =
Class::new_wound_wait(c_str!("test")));
> +
> +        let mutex =3D Arc::pin_init(Mutex::new(42, &class), =
GFP_KERNEL)?;
> +
> +        let ctx =3D KBox::pin_init(AcquireCtx::new(&class), =
GFP_KERNEL)?;
> +
> +        let guard =3D ctx.lock(&mutex)?;
> +        assert_eq!(*guard, 42);
> +
> +        // Drop the lock.
> +        drop(guard);
> +
> +        let mut guard =3D ctx.lock(&mutex)?;
> +        *guard =3D 100;
> +        assert_eq!(*guard, 100);
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_ww_mutex_trylock() -> Result {
> +        stack_pin_init!(let class =3D =
Class::new_wound_wait(c_str!("test")));
> +
> +        let mutex =3D Arc::pin_init(Mutex::new(123, &class), =
GFP_KERNEL)?;
> +
> +        let ctx =3D KBox::pin_init(AcquireCtx::new(&class), =
GFP_KERNEL)?;
> +
> +        // `try_lock` on unlocked mutex should succeed.
> +        let guard =3D ctx.try_lock(&mutex)?;
> +        assert_eq!(*guard, 123);
> +
> +        // Now it should fail immediately as it's already locked.
> +        assert!(ctx.try_lock(&mutex).is_err());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_ww_mutex_is_locked() -> Result {
> +        stack_pin_init!(let class =3D =
Class::new_wait_die(c_str!("test")));
> +
> +        let mutex =3D Arc::pin_init(Mutex::new("hello", &class), =
GFP_KERNEL)?;
> +
> +        let ctx =3D KBox::pin_init(AcquireCtx::new(&class), =
GFP_KERNEL)?;
> +
> +        // Should not be locked initially.
> +        assert!(!mutex.is_locked());
> +
> +        let guard =3D ctx.lock(&mutex)?;
> +        assert!(mutex.is_locked());
> +
> +        drop(guard);
> +        assert!(!mutex.is_locked());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_ww_acquire_context_done() -> Result {
> +        stack_pin_init!(let class =3D =
Class::new_wound_wait(c_str!("test")));
> +
> +        let mutex1 =3D Arc::pin_init(Mutex::new(1, &class), =
GFP_KERNEL)?;
> +        let mutex2 =3D Arc::pin_init(Mutex::new(2, &class), =
GFP_KERNEL)?;
> +
> +        let ctx =3D KBox::pin_init(AcquireCtx::new(&class), =
GFP_KERNEL)?;
> +
> +        // Acquire multiple mutexes with the same context.
> +        let guard1 =3D ctx.lock(&mutex1)?;
> +        let guard2 =3D ctx.lock(&mutex2)?;
> +
> +        assert_eq!(*guard1, 1);
> +        assert_eq!(*guard2, 2);
> +
> +        // SAFETY: It's called exactly once here and nowhere else.
> +        unsafe { ctx.done() };
> +
> +        // We shouldn't be able to lock once it's `done`.
> +        assert!(ctx.lock(&mutex1).is_err());
> +        assert!(ctx.lock(&mutex2).is_err());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_with_global_classes() -> Result {
> +        let mutex1 =3D Arc::pin_init(Mutex::new(100, =
&TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +        let mutex2 =3D Arc::pin_init(Mutex::new(200, =
&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
> +
> +        let ww_ctx =3D =
KBox::pin_init(AcquireCtx::new(&TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +        let wd_ctx =3D =
KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
> +
> +        let ww_guard =3D ww_ctx.lock(&mutex1)?;
> +        let wd_guard =3D wd_ctx.lock(&mutex2)?;
> +
> +        assert_eq!(*ww_guard, 100);
> +        assert_eq!(*wd_guard, 200);
> +
> +        assert!(mutex1.is_locked());
> +        assert!(mutex2.is_locked());
> +
> +        drop(ww_guard);
> +        drop(wd_guard);
> +
> +        assert!(!mutex1.is_locked());
> +        assert!(!mutex2.is_locked());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_mutex_without_ctx() -> Result {
> +        let mutex =3D Arc::pin_init(Mutex::new(100, =
&TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +        let guard =3D mutex.lock()?;
> +
> +        assert_eq!(*guard, 100);
> +        assert!(mutex.is_locked());
> +
> +        drop(guard);
> +
> +        assert!(!mutex.is_locked());
> +
> +        Ok(())
> +    }
> +}
> diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs =
b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
> new file mode 100644
> index 000000000000..141300e849eb
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
> @@ -0,0 +1,172 @@
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
> +/// let guard1 =3D ctx.lock(&mutex1)?;
> +/// let guard2 =3D ctx.lock(&mutex2)?;
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
> +    /// Initializes a new [`AcquireCtx`] with the given [`Class`].
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
> +    /// The caller must ensure that this function is called only once
> +    /// and after calling it, no further mutexes are acquired using
> +    /// this context.
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
> +    /// The caller must ensure no locks are held in this =
[`AcquireCtx`].
> +    pub unsafe fn reinit(self: Pin<&mut Self>) {
> +        let ctx =3D self.inner.get();
> +
> +        // SAFETY: `ww_class` is always a valid pointer in properly =
initialized
> +        // `AcquireCtx`.
> +        let class_ptr =3D unsafe { (*ctx).ww_class };
> +
> +        // SAFETY:
> +        //  - Lifetime of any guard (which hold an immutable borrow =
of `self`) cannot overlap
> +        //    with the execution of this function. This enforces that =
all locks acquired via
> +        //    this context have been released.
> +        //
> +        //  - `ctx` is guaranteed to be initialized because =
`ww_acquire_fini`
> +        //    can only be called from the `Drop` implementation.
> +        //
> +        //  - `ww_acquire_fini` is safe to call on an initialized =
context.
> +        unsafe { bindings::ww_acquire_fini(ctx) };
> +
> +        // SAFETY: `ww_acquire_init` is safe to call with valid =
pointers
> +        // to initialize an uninitialized context.
> +        unsafe { bindings::ww_acquire_init(ctx, class_ptr) };
> +    }
> +
> +    /// Locks the given [`Mutex`] on this [`AcquireCtx`].
> +    pub fn lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> =
Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Regular)
> +    }
> +
> +    /// Similar to [`Self::lock`], but can be interrupted by signals.
> +    pub fn lock_interruptible<'a, T>(
> +        &'a self,
> +        mutex: &'a Mutex<'a, T>,
> +    ) -> Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Interruptible)
> +    }
> +
> +    /// Locks the given [`Mutex`] on this [`AcquireCtx`] using the =
slow path.
> +    ///
> +    /// This function should be used when [`Self::lock`] fails =
(typically due
> +    /// to a potential deadlock).
> +    pub fn lock_slow<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> =
Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Slow)
> +    }
> +
> +    /// Similar to [`Self::lock_slow`], but can be interrupted by =
signals.
> +    pub fn lock_slow_interruptible<'a, T>(
> +        &'a self,
> +        mutex: &'a Mutex<'a, T>,
> +    ) -> Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::SlowInterruptible)
> +    }
> +
> +    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without =
blocking.
> +    ///
> +    /// Unlike [`Self::lock`], no deadlock handling is performed.
> +    pub fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> =
Result<MutexGuard<'a, T>> {
> +        lock_common(mutex, Some(self), LockKind::Try)
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

I pointed out a few things, but IMHO this is starting to look pretty =
good :)

=E2=80=94 Daniel=
