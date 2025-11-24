Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A00314B76;
	Mon, 24 Nov 2025 16:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764000233; cv=none; b=G6ogzj4DR0TWNBG3z9vTCBcmzj3WFR6NToZpKvksCOk65dGRHFKFYSk17fE5Sx1oPV3jFws2drS4m3jZ+sLq590rkB4spBwcF16WxZ0YCKIojrcFzqQLmxHDeKk9zyr05zqyHwMmWqx8US0RysxunzGSeUOJztJtTXa5Aqm6lWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764000233; c=relaxed/simple;
	bh=38091BdA717cPW6KIDBj/+kEE4cEO868PNQuG1HpX0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fbh8+pYzvmJg1/WtrshCxo3ejFsqDS0ysiaBFu7dc4hiJQKAEs6VkOfkZFS9d8eDXc1P6JlmxZxzI5K3/XYrhGkjX1qdfTCXJE56CjTKH+FT4lQW5T0HGGyo245soMEGQRbI0NRWgiawkkw3vJsbbNgE8JXBP8lJWPgxW6fsh9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=pzBb8j6g; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="pzBb8j6g"
Received: from mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:330a:0:640:a968:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id D4DF4C1351;
	Mon, 24 Nov 2025 18:49:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id VndG6JbLLOs0-8YibfLmi;
	Mon, 24 Nov 2025 18:49:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1763999376;
	bh=GWzUIT+IHrjyEro/Np/ibvEaUczPak9ycopTbl4eVIE=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=pzBb8j6gqLGKJvzC+HUA0k0oh14nGC5ibX3Hhm1UnqfVup8JbA14TiDNCfyVbrkJ3
	 BRfjnVxSS61ShriFbMrnp7HRhbhKJYdstfG2ZtniTda6wX0qsgLWdUdWaLUCfbSV0l
	 e3O/5moXI8yOhBv1AiOql9Zo1syU/2FdvDrprvVg=
Authentication-Results: mail-nwsmtp-smtp-production-main-58.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Mon, 24 Nov 2025 18:49:28 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 bjorn3_gh@protonmail.com, daniel.almeida@collabora.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] rust: ww_mutex: implement LockSet
Message-ID: <20251124184928.30b8bbaf@nimda>
In-Reply-To: <92563347110cc9fd6195ae5cb9d304fc6d480571.camel@redhat.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
	<20251101161056.22408-6-work@onurozkan.dev>
	<92563347110cc9fd6195ae5cb9d304fc6d480571.camel@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Nov 2025 17:34:15 -0500
Lyude Paul <lyude@redhat.com> wrote:

> On Sat, 2025-11-01 at 19:10 +0300, Onur =C3=96zkan wrote:
> > `LockSet` is a high-level and safe API built on top of
> > ww_mutex, provides a simple API while keeping the ww_mutex
> > semantics.
> >=20
> > When `EDEADLK` is hit, it drops all held locks, resets
> > the acquire context and retries the given (by the user)
> > locking algorithm until it succeeds.
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/kernel/sync/lock/ww_mutex.rs          |   6 +
> >  rust/kernel/sync/lock/ww_mutex/lock_set.rs | 245
> > +++++++++++++++++++++ 2 files changed, 251 insertions(+)
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs
> >=20
> > diff --git a/rust/kernel/sync/lock/ww_mutex.rs
> > b/rust/kernel/sync/lock/ww_mutex.rs index
> > 2a9c1c20281b..d4c3b272912d 100644 ---
> > a/rust/kernel/sync/lock/ww_mutex.rs +++
> > b/rust/kernel/sync/lock/ww_mutex.rs @@ -5,6 +5,10 @@
> >  //! It is designed to avoid deadlocks when locking multiple
> > [`Mutex`]es //! that belong to the same [`Class`]. Each lock
> > acquisition uses an //! [`AcquireCtx`] to track ordering and ensure
> > forward progress. +//!
> > +//! It is recommended to use [`LockSet`] as it provides safe
> > high-level +//! interface that automatically handles deadlocks,
> > retries and context +//! management.
> > =20
> >  use crate::error::to_result;
> >  use crate::prelude::*;
> > @@ -16,9 +20,11 @@
> > =20
> >  pub use acquire_ctx::AcquireCtx;
> >  pub use class::Class;
> > +pub use lock_set::LockSet;
> > =20
> >  mod acquire_ctx;
> >  mod class;
> > +mod lock_set;
> > =20
> >  /// A wound-wait (ww) mutex that is powered with deadlock avoidance
> >  /// when acquiring multiple locks of the same [`Class`].
> > diff --git a/rust/kernel/sync/lock/ww_mutex/lock_set.rs
> > b/rust/kernel/sync/lock/ww_mutex/lock_set.rs new file mode 100644
> > index 000000000000..ae234fd1e0be
> > --- /dev/null
> > +++ b/rust/kernel/sync/lock/ww_mutex/lock_set.rs
> > @@ -0,0 +1,245 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Provides [`LockSet`] which automatically detects [`EDEADLK`],
> > +//! releases all locks, resets the state and retries the user
> > +//! supplied locking algorithm until success.
> > +
> > +use super::{AcquireCtx, Class, Mutex};
> > +use crate::bindings;
> > +use crate::prelude::*;
> > +use crate::types::NotThreadSafe;
> > +use core::ptr::NonNull;
> > +
> > +/// A tracked set of [`Mutex`] locks acquired under the same
> > [`Class`]. +///
> > +/// It ensures proper cleanup and retry mechanism on deadlocks and
> > provides +/// safe access to locked data via
> > [`LockSet::with_locked`]. +///
> > +/// Typical usage is through [`LockSet::lock_all`], which retries a
> > +/// user supplied locking algorithm until it succeeds without
> > deadlock. +pub struct LockSet<'a> {
> > +    acquire_ctx: Pin<KBox<AcquireCtx<'a>>>,
> > +    taken: KVec<RawGuard>,
> > +    class: &'a Class,
> > +}
> > +
> > +/// Used by `LockSet` to track acquired locks.
> > +///
> > +/// This type is strictly crate-private and must never be exposed
> > +/// outside this crate.
> > +struct RawGuard {
> > +    mutex_ptr: NonNull<bindings::ww_mutex>,
> > +    _not_send: NotThreadSafe,
> > +}
> > +
> > +impl Drop for RawGuard {
> > +    fn drop(&mut self) {
> > +        // SAFETY: `mutex_ptr` originates from a locked `Mutex`
> > and remains
> > +        // valid for the lifetime of this guard, so unlocking here
> > is sound.
> > +        unsafe {
> > bindings::ww_mutex_unlock(self.mutex_ptr.as_ptr()) };
> > +    }
> > +}
> > +
> > +impl<'a> Drop for LockSet<'a> {
> > +    fn drop(&mut self) {
> > +        self.release_all_locks();
> > +    }
> > +}
> > +
> > +impl<'a> LockSet<'a> {
> > +    /// Creates a new [`LockSet`] with the given class.
> > +    ///
> > +    /// All locks taken through this [`LockSet`] must belong to the
> > +    /// same class.
> > +    pub fn new(class: &'a Class) -> Result<Self> {
> > +        Ok(Self {
> > +            acquire_ctx: KBox::pin_init(AcquireCtx::new(class),
> > GFP_KERNEL)?,
> > +            taken: KVec::new(),
> > +            class,
> > +        })
> > +    }
> > +
> > +    /// Creates a new [`LockSet`] using an existing [`AcquireCtx`]
> > and
> > +    /// [`Class`].
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that `acquire_ctx` is properly
> > initialized,
> > +    /// holds no mutexes and that the provided `class` matches the
> > one used
> > +    /// to initialize the given `acquire_ctx`.
> > +    pub unsafe fn new_with_acquire_ctx(
> > +        acquire_ctx: Pin<KBox<AcquireCtx<'a>>>,
> > +        class: &'a Class,
> > +    ) -> Self {
> > +        Self {
> > +            acquire_ctx,
> > +            taken: KVec::new(),
> > +            class,
> > +        }
> > +    }
> > +
> > +    /// Attempts to lock a [`Mutex`] and records the guard.
> > +    ///
> > +    /// Returns [`EDEADLK`] if lock ordering would cause a
> > deadlock.
> > +    ///
> > +    /// Returns [`EBUSY`] if `mutex` was locked outside of this
> > [`LockSet`].
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The given `mutex` must be created with the [`Class`] that
> > was used
> > +    /// to initialize this [`LockSet`].
> > +    pub unsafe fn lock<T>(&mut self, mutex: &'a Mutex<'a, T>) ->
> > Result {
> > +        if mutex.is_locked()
> > +            && !self
> > +                .taken
> > +                .iter()
> > +                .any(|guard| guard.mutex_ptr.as_ptr() =3D=3D
> > mutex.inner.get())
> > +        {
> > +            return Err(EBUSY);
> > +        }
>=20
> I don't think that we need or want to keep track of this - even for
> checking if we've acquired a lock already. The kernel already does
> this (from __ww_rt_mutex_lock()):
>=20

The code is here self-documenting. It checks whether the mutex was
locked outside this context (which should never happen). This makes the
implementation easier to understand IMO.

> if (ww_ctx) {
> if (unlikely(ww_ctx =3D=3D READ_ONCE(lock->ctx)))
> return -EALREADY;
>=20
> /*
> * Reset the wounded flag after a kill. No other process can
> * race and wound us here, since they can't have a valid owner
> * pointer if we don't have any locks held.
> */
> if (ww_ctx->acquired =3D=3D 0)
> ww_ctx->wounded =3D 0;
>=20
> #ifdef CONFIG_DEBUG_LOCK_ALLOC
> nest_lock =3D &ww_ctx->dep_map;
> #endif
> }
> > +
> > +        // SAFETY: By the safety contract, `mutex` belongs to the
> > same `Class`
> > +        // as `self.acquire_ctx` does.
> > +        let guard =3D unsafe { self.acquire_ctx.lock(mutex)? };
> > +
> > +        self.taken.push(
> > +            RawGuard {
> > +                // SAFETY: We just locked it above so it's a valid
> > pointer.
> > +                mutex_ptr: unsafe {
> > NonNull::new_unchecked(guard.mutex.inner.get()) },
> > +                _not_send: NotThreadSafe,
> > +            },
> > +            GFP_KERNEL,
> > +        )?;
> > +
> > +        // Avoid unlocking here; `release_all_locks` (also run by
> > `Drop`)
> > +        // performs the unlock for `LockSet`.
> > +        core::mem::forget(guard);
> > +
> > +        Ok(())
> > +    }
> > +
> > +    /// Runs `locking_algorithm` until success with retrying on
> > deadlock.
> > +    ///
> > +    /// `locking_algorithm` should attempt to acquire all needed
> > locks.
> > +    /// If [`EDEADLK`] is detected, this function will roll back,
> > reset
> > +    /// the context and retry automatically.
> > +    ///
> > +    /// Once all locks are acquired successfully,
> > `on_all_locks_taken` is
> > +    /// invoked for exclusive access to the locked values.
> > Afterwards, all
> > +    /// locks are released.
> > +    ///
> > +    /// # Example
> > +    ///
> > +    /// ```
> > +    /// use kernel::alloc::KBox;
> > +    /// use kernel::c_str;
> > +    /// use kernel::prelude::*;
> > +    /// use kernel::sync::Arc;
> > +    /// use kernel::sync::lock::ww_mutex::{Class, LockSet, Mutex};
> > +    /// use pin_init::stack_pin_init;
> > +    ///
> > +    /// stack_pin_init!(let class =3D
> > Class::new_wound_wait(c_str!("test")));
> > +    ///
> > +    /// let mutex1 =3D Arc::pin_init(Mutex::new(0, &class),
> > GFP_KERNEL)?;
> > +    /// let mutex2 =3D Arc::pin_init(Mutex::new(0, &class),
> > GFP_KERNEL)?;
> > +    /// let mut lock_set =3D KBox::pin_init(LockSet::new(&class)?,
> > GFP_KERNEL)?;
> > +    ///
> > +    /// lock_set.lock_all(
> > +    ///     // `locking_algorithm` closure
> > +    ///     |lock_set| {
> > +    ///         // SAFETY: Both `lock_set` and `mutex1` uses the
> > same class.
> > +    ///         unsafe { lock_set.lock(&mutex1)? };
> > +    ///
> > +    ///         // SAFETY: Both `lock_set` and `mutex2` uses the
> > same class.
> > +    ///         unsafe { lock_set.lock(&mutex2)? };
>=20
> I wonder if there's some way we can get rid of the safety contract
> here and verify this at compile time, it would be a shame if every
> single lock invocation needed to be unsafe.
>=20

Yeah :(. We could get rid of them easily by keeping the class that was
passed to the constructor functions but that becomes a problem for the
from_raw implementations.

I think the best solution would be to expose ww_class type from
ww_acquire_ctx and ww_mutex unconditionally (right now it depends on
DEBUG_WW_MUTEXES). That way we can just access the class and verify
that the mutex and acquire_ctx classes match.

What do you think? I can submit a patch for the C-side implementation.
It should be straightforward and shouldn't have any runtime impact.

> > +    ///
> > +    ///         Ok(())
> > +    ///     },
> > +    ///     // `on_all_locks_taken` closure
> > +    ///     |lock_set| {
> > +    ///         // Safely mutate both values while holding the
> > locks.
> > +    ///         lock_set.with_locked(&mutex1, |v| *v +=3D 1)?;
> > +    ///         lock_set.with_locked(&mutex2, |v| *v +=3D 1)?;
> > +    ///
> > +    ///         Ok(())
> > +    ///     },
>=20
> I'm still pretty confident we don't need or want both closures and
> can combine them into a single closure. And I am still pretty sure
> the only thing that needs to be tracked here is which lock we failed
> to acquire in the event of a deadlock.
>=20
> Let me see if I can do a better job of explaining why. Or, if I'm
> actually wrong about this - maybe this will help you correct me and
> see where I've misunderstood something :).
>=20
> First, let's pretend we've made a couple of changes here:
>=20
>  * We remove `taken: KVec<RawGuard>` and replace it with `failed: *mut
>    Mutex<=E2=80=A6>`
>  * lock_set.lock():
>     - Now returns a `Guard` that executes `ww_mutex_unlock` in its
> destructor
>     - If `ww_mutex_lock` fails due to -EDEADLK, this function stores
> a pointer to the respective mutex in `lock_set.failed`.
>     - Before acquiring a lock, we now check:
>        + if lock_set.failed =3D=3D lock
>           * Return a Guard for lock without calling ww_mutex_lock()
>           * lock_set.failed =3D null_mut();
>  * We remove `on_all_locks_taken()`, and rename `locking_algorithm` to
>    `ww_cb`.
>  * If `ww_cb()` returns Err(EDEADLK):
>     - if !lock_set.failed.is_null()
>        + ww_mutex_lock(lock_set.failed) // Don't store a guard
>  * If `ww_cb()` returns Ok(=E2=80=A6):
>     - if !lock_set.failed.is_null()
>       // This could only happen if we hit -EDEADLK but then `ww_cb`
> did not // re-acquire `lock_set.failed` on the next attempt
>        + ww_mutex_unlock(lock_set.failed)
>=20
> With all of those changes, we can rewrite `ww_cb` to look like this:
>=20
> |lock_set| {
> // SAFETY: Both `lock_set` and `mutex1` uses the same class.
> let g1 =3D unsafe { lock_set.lock(&mutex1)? };
>=20
> // SAFETY: Both `lock_set` and `mutex2` uses the same class.
> let g2 =3D unsafe { lock_set.lock(&mutex2)? };
>=20
> *g1 +=3D 1;
> *g2 +=3D 2;
>=20
> Ok(())
> }
>=20
> If we hit -EDEADLK when trying to acquire g2, this is more or less
> what would happen:
>=20
>  * let res =3D ww_cb():
>     - let g1 =3D =E2=80=A6; // (we acquire g1 successfully)
>     - let g2 =3D =E2=80=A6; // (enter .lock())
>        + res =3D ww_mutex_lock(mutex2);
>        + if (res) =3D=3D EDEADLK
>           * lock_set.failed =3D mutex2;
>        + return Err(EDEADLK);
>     - return Err(-EDEADLK);
>       // Exiting ww_cb(), so rust will drop all variables in this
> scope:
>        + ww_mutex_unlock(mutex1) // g1's Drop
>=20
>  * // (res =3D=3D Err(EDEADLK))
>    // All locks have been released at this point
>=20
>  * if !lock_set.failed.is_null()
>     - ww_mutex_lock(lock_set.failed) // Don't create a guard
>    // We've now re-acquired the lock we dead-locked on
>=20
>  * let res =3D ww_cb():
>     - let g1 =3D =E2=80=A6; // (we acquire g1 successfully)
>     - let g2 =3D =E2=80=A6; // (enter .lock())
>        + if lock_set.failed =3D=3D lock
>           * lock_set.failed =3D null_mut();
>           * return Guard(=E2=80=A6); // but don't call ww_mutex_lock(), i=
t's
> already locked
>     - // We acquired g2 successfully!
>     - *g1 +=3D 1;
>     - *g2 +=3D 2;
>=20
>  * etc=E2=80=A6
>=20
> The only challenge with this is that users need to write their ww_cb()
> implementations to be idempotent (so that calling it multiple times
> isn't unexpected). But that's already what we do on the C side, and
> is kind of what I expected we would want to do in rust anyhow.
>=20
> Does this make sense, or was there something I made a mistake with
> here?

Thanks a lot for analyzing and providing an alternative on this!

However, collapsing everything into a single callback would require the
caller to self-police various disciplines like "don't touch gN until
gN+1 succeeded", which is exactly the foot-gun we are trying avoid with
2 closures.

Separating acquire and use logics not just simpler API to implement (and
provide), but also more effective compare to your example here. With
single closure we basically move API responsibility to the users (e.g.,
do not run this part of the code in the loop, do not access to any data
behind any guard if all the locks aren't taken yet, etc.), which is not
a good thing to do, especially from the high-level API.

>=20
> > +    /// )?;
> > +    ///
> > +    /// # Ok::<(), Error>(())
> > +    /// ```
> > +    pub fn lock_all<T, Y, Z>(
> > +        &mut self,
> > +        mut locking_algorithm: T,
> > +        mut on_all_locks_taken: Y,
> > +    ) -> Result<Z>
> > +    where
> > +        T: FnMut(&mut LockSet<'a>) -> Result,
> > +        Y: FnMut(&mut LockSet<'a>) -> Result<Z>,
> > +    {
> > +        loop {
> > +            match locking_algorithm(self) {
> > +                Ok(()) =3D> {
> > +                    // All locks in `locking_algorithm` succeeded.
> > +                    // The user can now safely use them in
> > `on_all_locks_taken`.
> > +                    let res =3D on_all_locks_taken(self);
> > +                    self.release_all_locks();
> > +
> > +                    return res;
> > +                }
> > +                Err(e) if e =3D=3D EDEADLK =3D> {
> > +                    // Deadlock detected, retry from scratch.
> > +                    self.cleanup_on_deadlock();
> > +                    continue;
> > +                }
> > +                Err(e) =3D> {
> > +                    self.release_all_locks();
> > +                    return Err(e);
> > +                }
> > +            }
> > +        }
> > +    }
> > +
> > +    /// Executes `access` with a mutable reference to the data
> > behind `mutex`.
> > +    ///
> > +    /// Fails with [`EINVAL`] if the mutex was not locked in this
> > [`LockSet`].
> > +    pub fn with_locked<T: Unpin, Y>(
> > +        &mut self,
> > +        mutex: &'a Mutex<'a, T>,
> > +        access: impl for<'b> FnOnce(&'b mut T) -> Y,
> > +    ) -> Result<Y> {
> > +        let mutex_ptr =3D mutex.inner.get();
> > +
> > +        if self
> > +            .taken
> > +            .iter()
> > +            .any(|guard| guard.mutex_ptr.as_ptr() =3D=3D mutex_ptr)
> > +        {
> > +            // SAFETY: We hold the lock corresponding to `mutex`,
> > so we have
> > +            // exclusive access to its protected data.
> > +            let value =3D unsafe { &mut *mutex.data.get() };
> > +            Ok(access(value))
> > +        } else {
> > +            // `mutex` isn't locked in this `LockSet`.
> > +            Err(EINVAL)
> > +        }
> > +    }
> > +
> > +    /// Releases all currently held locks in this [`LockSet`].
> > +    fn release_all_locks(&mut self) {
> > +        // `Drop` implementation of the `RawGuard` takes care of
> > the unlocking.
> > +        self.taken.clear();
> > +    }
> > +
> > +    /// Resets this [`LockSet`] after a deadlock detection.
> > +    ///
> > +    /// Drops all held locks and reinitializes the [`AcquireCtx`].
> > +    ///
> > +    /// It is intended to be used for internal implementation only.
> > +    fn cleanup_on_deadlock(&mut self) {
> > +        self.release_all_locks();
> > +
> > +        // SAFETY: We are passing the same `class` that was used
> > +        // to initialize `self.acquire_ctx`.
> > +        unsafe { self.acquire_ctx.as_mut().reinit(self.class) };
> > +    }
> > +}
>=20

