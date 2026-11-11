Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426945;
	b=SnBAD/RPU1VjAA0mDoM8nHmVR4nQrUYmWTQ4tXHfOUqxVx3Rqr9WPOQOuL2zHySHzyQB
	 4mhp2Q6x1khEjwKix0D9wqtbxqyovDiuXdII1M0vASxa74UgdbYoboeKWn+a4t5k5qVdy
	 w7IuCtcrNVDe3S96rF7q71agehWIe5H20fT/GZPA+zvOUSMN+09W4GB1qWmOwYLbjkyha
	 NkHQkxeGRXO9QUhAb5b6V1C0LruE9vcPSlyugr+74jrAR1xSB0TIItuaFp11nSWQOLhB4
	 oxRKhtujTzP3qqw/wdQIBPyfwi7lV99vKhhx5SCOLW4TopRdM2vJbW0GHat6EUmamog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426945;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=V+dp3rFjfLrFJJRZDXSY3L8HZ6QVBhJEqczcQrEnUDE=;
	b=sJ/sqxR/SefFm9fyP1x0CKfM5x+jW/fRfuuHHaCkgWACp61gQxjqMhx8G41mpC1QcK4t
	 RdfoTfguAT08EepLiLMJJE2Q1rOyugQb7obT45SpK4FpDYy2u1n06PPpOPEVSnpgqWEBg
	 IYx3vH1LBM72PwzqF/lLFvrmz1sHQVU8SXKdyM8SsUYDdhSx4Nsk6nqFlTUb+CHlR0rQf
	 W17D4d/7qjZFXP4yt/JZS/ag3F0jLmocnOPO26MjvCpBxLD1nMeZ6GVtkWAZ8mOn626dX
	 +g0MqrQ0F4VqGj836ijISdkRHRlwT1+C5hsupgUX1neapueHKgCeLd4HmqRV4fie5ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IW7v+S5P;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925EA606A31C;
	Wed, 11 Nov 2026 19:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 925EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IW7v+S5P
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616EF153B;
	Wed, 11 Nov 2026 11:55:39 -0800 (PST)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CC533F673;
	Wed, 11 Nov 2026 11:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794426942; bh=qcHwEQYuVCujJwVfO6O0H1Y1tNUbPRInYvkJL6neQy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IW7v+S5Pp+T/Na2KA4YERdA4Ac9NGoqQ+OLL8F+qjtIcwGs43DTXtet2mEbGE+IXw
	 J5S/55zOcJU1B/ibhPUkSbFC5IxagMr0aartTorgQNiXClI5WJQH3NBEEFv6m73o7M
	 BO0hVZOwi0+kgK4zmxnR0XdvLQe1vkqHw0t01L0o=
Date: Wed, 11 Nov 2026 20:55:29 +0100
From: Beata Michalska <beata.michalska@arm.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	felipe_life@live.com, daniel@sedlak.dev,
	daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 6/7] rust: ww_mutex: implement DynLockSet
Message-ID: <avTIMTuuFnxHhS74@arm.com>
References: <20261020153112.299745-1-work@onurozkan.dev>
 <20261020153112.299745-7-work@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020153112.299745-7-work@onurozkan.dev>

Hi Onur,

On Tue, Oct 20, 2026 at 06:29:42PM +0300, Onur Özkan wrote:
> DynLockSet is a high-level and safe API built on top of ww_mutex
> for dynamically discovered locks. It keeps acquired locks held,
> handles repeated objects and provides access to their data.
> 
> When EDEADLK is hit it drops all held locks and waits for the
> contended mutex. It then retries the given (by the user)
> locking algorithm with that mutex held and the same acquire
> context until it succeeds.
> 
> Signed-off-by: Onur Özkan <work@onurozkan.dev>
> ---
>  rust/kernel/sync/lock/ww_mutex.rs             |   4 +
>  .../sync/lock/ww_mutex/acquire_ctx_backoff.rs | 138 ++++++-
>  .../kernel/sync/lock/ww_mutex/dyn_lock_set.rs | 351 ++++++++++++++++++
>  3 files changed, 489 insertions(+), 4 deletions(-)
>  create mode 100644 rust/kernel/sync/lock/ww_mutex/dyn_lock_set.rs
> 
> diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
> index 2249214959b1c..fea2603d1bd1f 100644
> --- a/rust/kernel/sync/lock/ww_mutex.rs
> +++ b/rust/kernel/sync/lock/ww_mutex.rs
> @@ -7,6 +7,8 @@
>  //! [`AcquireCtx`] to track ordering and ensure forward progress.
>  //!
>  //! [`ww_transaction`] provides automatic deadlock recovery for ordinary guards.
> +//! Use [`DynLockSet::ww_transaction`] for dynamically discovered locks and
> +//! separate acquisition and work callbacks.
>  //!
>  //! See srctree/Documentation/locking/ww-mutex-design.rst for more details.
>  
> @@ -28,10 +30,12 @@
>      AcquireCtxBackoff, //
>  };
>  pub use class::Class;
> +pub use dyn_lock_set::DynLockSet;
>  
>  mod acquire_ctx;
>  mod acquire_ctx_backoff;
>  mod class;
> +mod dyn_lock_set;
>  
>  /// A wound-wait (ww) mutex that is powered with deadlock avoidance
>  /// when acquiring multiple locks of the same [`Class`].
> diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx_backoff.rs b/rust/kernel/sync/lock/ww_mutex/acquire_ctx_backoff.rs
> index 71ad1cba37192..c6d213f74635f 100644
> --- a/rust/kernel/sync/lock/ww_mutex/acquire_ctx_backoff.rs
> +++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx_backoff.rs
> @@ -8,13 +8,17 @@
>      Mutex,
>      MutexGuard, //
>  };
> -use crate::prelude::*;
> +use crate::{
> +    bindings,
> +    prelude::*, //
> +};
>  use core::cell::Cell;
>  
>  /// An [`AcquireCtx`] that remembers the contended mutex.
>  ///
>  /// After [`Self::lock`] returns [`EDEADLK`], release all guards and call
> -/// [`Self::backoff`] before retrying. [`ww_transaction`] handles this retry loop.
> +/// [`Self::backoff`] before retrying. [`ww_transaction`] and
> +/// [`super::DynLockSet::ww_transaction`] handle this retry loop.
>  ///
>  /// Mutexes must outlive this wrapper so they remain valid for retry.
>  ///
> @@ -109,11 +113,36 @@ pub fn done(&self) {
>      }
>  
>      #[inline]
> -    fn assert_no_locks_held(&self) {
> +    pub(super) fn take_contended_guard(&self) -> Option<MutexGuard<'_, ()>> {
> +        self.backoff_guard.take()
> +    }
> +
> +    #[inline]
> +    pub(super) fn assert_no_locks_held(&self) {
>          // SAFETY: This initialized context belongs to the current task.
>          let acquired = unsafe { (*self.ctx.inner.get()).acquired };
>          assert_eq!(acquired, 0, "ww transaction still holds caller-owned locks");
>      }
> +
> +    #[inline]
> +    pub(super) fn clear_backoff(&self) {
> +        drop(self.backoff_guard.take());
> +        self.contended.set(None);
> +    }
> +
> +    pub(super) fn restart(&self) {
> +        self.clear_backoff();
> +        self.assert_no_locks_held();
> +        let ptr = self.ctx.inner.get();
> +        // SAFETY: This wrapper exclusively borrows the initialized, pinned context.
> +        // No acquired locks remain, so it can be finalized and reinitialized with
> +        // its static class.
> +        unsafe {
> +            let class = (*ptr).ww_class;
> +            bindings::ww_acquire_fini(ptr);
> +            bindings::ww_acquire_init(ptr, class);
> +        }
> +    }
>  }
>  
>  impl Drop for AcquireCtxBackoff<'_, '_> {
> @@ -164,7 +193,7 @@ pub fn ww_transaction<'a, R>(
>      retry(&ctx, || transaction(&ctx))
>  }
>  
> -fn retry<R>(
> +pub(super) fn retry<R>(
>      ctx: &AcquireCtxBackoff<'_, '_>,
>      mut transaction: impl FnMut() -> Result<R>,
>  ) -> Result<R> {
> @@ -178,6 +207,7 @@ fn retry<R>(
>  
>  #[kunit_tests(rust_kernel_ww_transaction)]
>  mod tests {
> +    use super::super::DynLockSet;
>      use super::*;
>      use crate::define_ww_class;
>      use pin_init::stack_pin_init;
> @@ -280,4 +310,104 @@ fn test_deadlock_without_contention() -> Result {
>          assert!(!mutex.is_locked());
>          Ok(())
>      }
> +
> +    #[test]
> +    fn test_dynamic_retry() -> Result {
> +        stack_pin_init!(let first = Mutex::new(10, &TEST_TRANSACTION_CLASS));
> +        stack_pin_init!(let second = Mutex::new(20, &TEST_TRANSACTION_CLASS));
> +        stack_pin_init!(let acquire_ctx = AcquireCtx::new(&TEST_TRANSACTION_CLASS));
> +        let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> +        let mut set = DynLockSet::new(&ctx);
> +        let mut attempts = 0;
> +        let mut identity = None;
> +
> +        let result = set.ww_transaction(
> +            |set| {
> +                attempts += 1;
> +                let ptr = ctx.ctx.inner.get();
> +                // SAFETY: The pinned context is initialized and used only by
> +                // this task throughout the transaction.
> +                let stamp = unsafe { (*ptr).stamp };
> +                if attempts == 1 {
> +                    identity = Some((ptr, stamp));
> +                    set.lock(&first)?;
> +                    // SAFETY: `second` is initialized, pinned, and outlives the transaction.
> +                    let mutex = unsafe { Mutex::from_raw(second.inner.get()) };
> +                    ctx.contended.set(Some(mutex));
> +                    return Err(EDEADLK);
> +                }
> +
> +                assert_eq!(attempts, 2);
> +                assert_eq!(identity, Some((ptr, stamp)));
> +                assert!(!first.is_locked());
> +                // Backoff makes the contended mutex available before lock().
> +                assert_eq!(set.with_locked(&second, |v| *v)?, 20);
> +                set.lock(&second)?;
> +                set.lock(&first)
> +            },
> +            |set| {
> +                set.with_locked(&first, |v| *v += 1)?;
> +                set.with_locked(&second, |v| {
> +                    *v += 2;
> +                    *v
> +                })
> +            },
> +        )?;
> +
> +        assert_eq!(result, 22);
> +        assert_eq!(attempts, 2);
> +        assert!(!first.is_locked());
> +        assert!(!second.is_locked());
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_dynamic_error_cleanup() -> Result {
> +        stack_pin_init!(let first = Mutex::new(1, &TEST_TRANSACTION_CLASS));
> +        stack_pin_init!(let contended = Mutex::new(2, &TEST_TRANSACTION_CLASS));
> +        stack_pin_init!(let acquire_ctx = AcquireCtx::new(&TEST_TRANSACTION_CLASS));
> +        let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> +        let mut set = DynLockSet::new(&ctx);
> +
> +        for swallow in [false, true] {
> +            let mut work_ran = false;
> +            let result = set.ww_transaction(
> +                |set| {
> +                    set.lock(&first)?;
> +                    // A swallowed or mapped EDEADLK must not poison the next call.
> +                    // SAFETY: `contended` is initialized, pinned, and outlives the transaction.
> +                    let mutex = unsafe { Mutex::from_raw(contended.inner.get()) };
> +                    ctx.contended.set(Some(mutex));
> +                    assert_eq!(set.lock(&first), Err(EDEADLK));
> +                    if swallow {
> +                        Ok(())
> +                    } else {
> +                        Err(EINVAL)
> +                    }
> +                },
> +                |set| {
> +                    work_ran = true;
> +                    ctx.done();
> +                    set.with_locked(&first, |v| *v += 1)
> +                },
> +            );
> +
> +            assert_eq!(result, if swallow { Ok(()) } else { Err(EINVAL) });
> +            assert_eq!(work_ran, swallow);
> +            assert!(ctx.contended.get().is_none());
> +            assert!(!first.is_locked());
> +            assert!(!contended.is_locked());
> +
> +            set.ww_transaction(
> +                |set| {
> +                    set.lock(&contended)?;
> +                    set.lock(&first)
> +                },
> +                |set| set.with_locked(&contended, |v| *v += 1),
> +            )?;
> +            assert!(!first.is_locked());
> +            assert!(!contended.is_locked());
> +        }
> +        Ok(())
> +    }
>  }
> diff --git a/rust/kernel/sync/lock/ww_mutex/dyn_lock_set.rs b/rust/kernel/sync/lock/ww_mutex/dyn_lock_set.rs
> new file mode 100644
> index 0000000000000..d82da83839ffb
> --- /dev/null
> +++ b/rust/kernel/sync/lock/ww_mutex/dyn_lock_set.rs
> @@ -0,0 +1,351 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Wound/wait locking for a set of objects discovered at runtime.
> +//!
> +//! [`DynLockSet`] keeps locks held while the caller inspects objects and finds
> +//! more locks to acquire. It handles repeated mutexes and provides access to
> +//! their protected data. [`DynLockSet::ww_transaction`] handles deadlock retries
> +//! and runs the work callback once all locks are held.
> +
> +use super::{
> +    acquire_ctx_backoff::retry,
> +    AcquireCtxBackoff,
> +    Mutex,
> +    MutexGuard, //
> +};
> +use crate::{
> +    bindings,
> +    prelude::*,
> +    types::NotThreadSafe, //
> +};
> +use core::ptr::NonNull;
> +
> +/// Used by [`DynLockSet`] to track acquired locks.
> +///
> +/// This type is strictly crate-private and must never be exposed
> +/// outside this crate.
> +struct RawGuard {
> +    mutex_ptr: NonNull<bindings::ww_mutex>,
> +    _not_send: NotThreadSafe,
> +}
> +
> +impl Drop for RawGuard {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: `mutex_ptr` originates from a locked `Mutex` and remains
> +        // valid for the lifetime of this guard, so unlocking here is sound.
> +        unsafe { bindings::ww_mutex_unlock(self.mutex_ptr.as_ptr()) };
> +    }
> +}
> +
> +/// A tracked set of [`Mutex`] locks acquired with the same [`AcquireCtxBackoff`].
> +///
> +/// Keeps locks held across loops and helper calls, handles repeated mutexes and
> +/// provides access to their data through [`Self::with_locked`].
> +pub struct DynLockSet<'ctx, 'm> {
> +    ctx: &'ctx AcquireCtxBackoff<'ctx, 'm>,
> +    taken: KVec<RawGuard>,
> +}
> +
> +impl<'ctx, 'm> DynLockSet<'ctx, 'm> {
> +    /// Creates an empty set using the given acquire context.
> +    #[inline]
> +    pub fn new(ctx: &'ctx AcquireCtxBackoff<'ctx, 'm>) -> Self {
> +        Self {
> +            ctx,
> +            taken: KVec::new(),
> +        }
> +    }
> +
> +    /// Attempts to lock the given [`Mutex`] and stores a guard for it.
> +    ///
> +    /// Returns success if the mutex is already held by this set, unless deadlock
> +    /// recovery is pending.
> +    pub fn lock<T>(&mut self, mutex: &'m Mutex<T>) -> Result {
> +        match self.ctx.lock(mutex) {
> +            Ok(guard) => self.add_guard(guard),
> +            Err(e) if e == EALREADY => {
> +                // The context may hold a guard owned outside this set.
> +                if self
> +                    .taken
> +                    .iter()
> +                    .any(|guard| guard.mutex_ptr.as_ptr() == mutex.inner.get())
> +                {
> +                    Ok(())
> +                } else {
> +                    Err(e)
> +                }
> +            }
> +            Err(e) => Err(e),
> +        }
> +    }
> +
> +    /// Acquires a dynamic set, retrying on deadlock then runs `work` once.
> +    ///
> +    /// Each call releases existing locks and starts a new transaction. Retries keep
> +    /// the same ticket. The set retains its allocation across retries and calls.
> +    ///
> +    /// `work` runs once after acquisition and must not acquire more locks. Its errors
> +    /// are returned without retrying. All locks and pending backoff state are released
> +    /// on return. The callbacks must not change the set's context or nest transactions
> +    /// on that context.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if the context holds caller-owned locks outside this set at a transaction
> +    /// boundary, including forgotten guards.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::{
> +    ///     define_ww_class,
> +    ///     prelude::*,
> +    ///     sync::lock::ww_mutex::{
> +    ///         AcquireCtx,
> +    ///         AcquireCtxBackoff,
> +    ///         DynLockSet,
> +    ///         Mutex, //
> +    ///     }, //
> +    /// };
> +    /// use pin_init::stack_pin_init;
> +    ///
> +    /// define_ww_class!(CLASS);
> +    ///
> +    /// stack_pin_init!(let first = Mutex::new(1, &CLASS));
> +    /// stack_pin_init!(let second = Mutex::new(2, &CLASS));
> +    ///
> +    /// stack_pin_init!(let acquire_ctx = AcquireCtx::new(&CLASS));
> +    /// let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> +    /// let mut set = DynLockSet::new(&ctx);
> +    ///
> +    /// set.ww_transaction(
> +    ///     |set| {
> +    ///         set.lock(&first)?;
> +    ///
> +    ///         if set.with_locked(&first, |value| *value > 0)? {
> +    ///             set.lock(&second)?;
> +    ///         }
> +    ///
> +    ///         Ok(())
> +    ///     },
> +    ///     |set| set.with_locked(&first, |value| *value += 1),
> +    /// )?;
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn ww_transaction<R>(
> +        &mut self,
> +        mut acquire: impl FnMut(&mut Self) -> Result,
> +        work: impl FnOnce(&mut Self) -> Result<R>,
> +    ) -> Result<R> {
So I have been pondering a bit on that one, in a context of drm_exec and
potentially having a Rust version of drm_gpuvm_exec_lock & co, and I'm having
some doubts really. The `drm_exec` implementation, apart from locking and
reserving fences, also plays with the `drm_gem_object` reference counting.
The `drm_exec` pairs each tracked lock with a GEM reference and releases both
during backoff or cleanup. Proposed implementation makes it rather cumbersome
to drop the reference when unlocking the mutex on a rollback (or backoff in
this series terminology). I assume that would require some sort of extension
to the `DynLockSet` ? Or am I missing smth ?

---
BR
Beata

> +        let ctx = self.ctx;
> +        self.clear();
> +        ctx.restart();
> +
> +        let result = retry(ctx, || {
> +            if let Some(guard) = self.ctx.take_contended_guard() {
> +                self.add_guard(guard)?;
> +            }
> +
> +            let result = acquire(self);
> +            if result.is_err() {
> +                self.clear();
> +            }
> +
> +            result
> +        });
> +
> +        let result = result.and_then(|()| work(self));
> +
> +        self.clear();
> +        ctx.clear_backoff();
> +        ctx.assert_no_locks_held();
> +
> +        result
> +    }
> +
> +    fn add_guard<T: ?Sized>(&mut self, guard: MutexGuard<'ctx, T>) -> Result {
> +        let raw_guard = RawGuard {
> +            // SAFETY: The guard holds this mutex which remains valid for `'ctx`.
> +            mutex_ptr: unsafe { NonNull::new_unchecked(guard.mutex.inner.get()) },
> +            _not_send: NotThreadSafe,
> +        };
> +
> +        // Transfer unlocking to `raw_guard` before the fallible push so failure
> +        // drops only one guard and unlocks the mutex exactly once.
> +        core::mem::forget(guard);
> +        self.taken.push(raw_guard, GFP_KERNEL)?;
> +
> +        Ok(())
> +    }
> +
> +    /// Executes `access` with a mutable reference to the data behind [`Mutex`].
> +    ///
> +    /// Fails with [`EINVAL`] if the [`Mutex`] was not locked in this set.
> +    pub fn with_locked<T: Unpin, Y>(
> +        &mut self,
> +        mutex: &'m Mutex<T>,
> +        access: impl for<'b> FnOnce(&'b mut T) -> Y,
> +    ) -> Result<Y> {
> +        let mutex_ptr = mutex.inner.get();
> +
> +        if self
> +            .taken
> +            .iter()
> +            .any(|guard| guard.mutex_ptr.as_ptr() == mutex_ptr)
> +        {
> +            // SAFETY: We hold the lock corresponding to `mutex` so we have
> +            // exclusive access to its protected data.
> +            let value = unsafe { &mut *mutex.data.get() };
> +
> +            Ok(access(value))
> +        } else {
> +            // `mutex` isn't locked in this set.
> +            Err(EINVAL)
> +        }
> +    }
> +
> +    /// Releases all locks in the set.
> +    #[inline]
> +    pub fn clear(&mut self) {
> +        // `Drop` implementation of the `RawGuard` takes care of the unlocking.
> +        self.taken.clear();
> +    }
> +}
> +
> +impl Drop for DynLockSet<'_, '_> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        self.clear();
> +    }
> +}
> +
> +#[kunit_tests(rust_kernel_dyn_lock_set)]
> +mod tests {
> +    use super::super::AcquireCtx;
> +    use super::*;
> +    use crate::{
> +        define_wd_class,
> +        define_ww_class, //
> +    };
> +    use pin_init::stack_pin_init;
> +
> +    define_ww_class!(TEST_WOUND_WAIT_CLASS);
> +    define_wd_class!(TEST_WAIT_DIE_CLASS);
> +
> +    #[test]
> +    fn test_lock_and_clear() -> Result {
> +        stack_pin_init!(let mutex = Mutex::new(10, &TEST_WOUND_WAIT_CLASS));
> +        stack_pin_init!(let acquire_ctx = AcquireCtx::new(&TEST_WOUND_WAIT_CLASS));
> +        let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> +        let mut set = DynLockSet::new(&ctx);
> +
> +        assert_eq!(set.taken.capacity(), 0);
> +
> +        set.lock(&mutex)?;
> +        set.lock(&mutex)?;
> +        assert_eq!(set.taken.len(), 1);
> +
> +        set.with_locked(&mutex, |v| *v += 7)?;
> +        assert_eq!(set.with_locked(&mutex, |v| *v)?, 17);
> +
> +        let capacity = set.taken.capacity();
> +        assert!(capacity > 0);
> +
> +        set.clear();
> +        assert!(!mutex.is_locked());
> +        assert_eq!(set.taken.len(), 0);
> +        assert_eq!(set.taken.capacity(), capacity);
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_drop_unlocks() -> Result {
> +        stack_pin_init!(let first = Mutex::new(1, &TEST_WOUND_WAIT_CLASS));
> +        stack_pin_init!(let second = Mutex::new(2, &TEST_WOUND_WAIT_CLASS));
> +        stack_pin_init!(let acquire_ctx = AcquireCtx::new(&TEST_WOUND_WAIT_CLASS));
> +        let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> +
> +        {
> +            let mut set = DynLockSet::new(&ctx);
> +
> +            set.lock(&first)?;
> +            set.lock(&second)?;
> +        }
> +
> +        assert!(!first.is_locked());
> +        assert!(!second.is_locked());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_context_reuse() -> Result {
> +        stack_pin_init!(let mutex = Mutex::new(5, &TEST_WOUND_WAIT_CLASS));
> +        let mut acquire_ctx = KBox::pin_init(AcquireCtx::new(&TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
> +
> +        {
> +            let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> +            let mut set = DynLockSet::new(&ctx);
> +
> +            set.ww_transaction(
> +                |set| set.lock(&mutex),
> +                |set| set.with_locked(&mutex, |value| *value += 1),
> +            )?;
> +
> +            assert!(!mutex.is_locked());
> +        }
> +
> +        let guard = acquire_ctx.lock(&mutex)?;
> +        assert_eq!(*guard, 6);
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_reject_external_guard() -> Result {
> +        stack_pin_init!(let mutex = Mutex::new(5, &TEST_WOUND_WAIT_CLASS));
> +        stack_pin_init!(let acquire_ctx = AcquireCtx::new(&TEST_WOUND_WAIT_CLASS));
> +        let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> +        let guard = ctx.lock(&mutex)?;
> +        let mut set = DynLockSet::new(&ctx);
> +
> +        assert_eq!(set.lock(&mutex), Err(EALREADY));
> +        assert_eq!(set.with_locked(&mutex, |v| *v), Err(EINVAL));
> +
> +        set.clear();
> +        assert!(mutex.is_locked());
> +        assert_eq!(*guard, 5);
> +
> +        drop(guard);
> +        assert!(!mutex.is_locked());
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_access_without_lock() -> Result {
> +        stack_pin_init!(let mutex = Mutex::new(5, &TEST_WOUND_WAIT_CLASS));
> +        stack_pin_init!(let acquire_ctx = AcquireCtx::new(&TEST_WOUND_WAIT_CLASS));
> +        let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> +        let mut set = DynLockSet::new(&ctx);
> +
> +        assert_eq!(set.with_locked(&mutex, |v| *v), Err(EINVAL));
> +
> +        Ok(())
> +    }
> +
> +    #[test]
> +    fn test_class_mismatch() -> Result {
> +        stack_pin_init!(let mutex = Mutex::new(5, &TEST_WOUND_WAIT_CLASS));
> +        stack_pin_init!(let acquire_ctx = AcquireCtx::new(&TEST_WAIT_DIE_CLASS));
> +        let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
> +        let mut set = DynLockSet::new(&ctx);
> +
> +        assert_eq!(set.lock(&mutex), Err(EINVAL));
> +        assert!(!mutex.is_locked());
> +
> +        Ok(())
> +    }
> +}
> -- 
> 2.51.2
> 
> 
