Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A00B3B9D98
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 18:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744047; cv=none; b=EimTEGvLSeKzZObWaISOcwAFYPk2/T/1vqteAN7V0YEHRs/OZO/NTAcqWndMMia2xCcKFGRWvImbCmxejf82HXOb+n6lvFDA3s5DFHy+0i9xmUUgpfwMPkl4g4C+0magbcUWckyv3jiv/qp1X/2f7sXXqWIteNI4+Yo8qTrFPwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744047; c=relaxed/simple;
	bh=4IhjcplZBqzDWi0D/wmN5vHZTfp3nXxeocxH+Z3azZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nvg14Ym027Hr+6Z+pq/cLVwUhn0doy9k46E4eMyAtSwSCn1Nv0G5pJrb/2RS1nJJXfHDWWSRmeoD0x6/UDbdy2K3kH7OWDPO2Iseh2i8WW5vdJuv8G1Uk4maEB6kAWjPykvyBRrlQMQJPt72Ey8nMwxyR2a3hwgeATQOw3+JyC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=OmMbmqBG; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="OmMbmqBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791744040; x=1792003240;
	bh=HqwrntehHhSGQCqP6IPz3nS7yq1buc4NvWhzyooHCKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OmMbmqBG9NyBkX4Xw1WNBIoa+tgxR7bBuYbDqfKcMF7FQcpQNqoa0W8ohM+XRQv5o
	 DPZIxmkfocnX3+tlcQ2fcgRHEyRWN2mZAgLSV5QwoUi7/15sg893pGyxjasD1p8Xqb
	 Q1pIQA3o9vU3S9P8dUsKz1cLGNzZTguzG9ShE6BhsIkcGeXSnpuRy4KXhya2pWmrAN
	 GArHuoXKBomGgfvYZg4AbnmMb/r1vmtVLWBoIAlx/d2r2J2qZx2MEoRxAObCb2vB+v
	 IV+SVCf6u4OUXSyEYNicgDKzoucKdjAsICAe4r94nTPEr3ZxzfciSNYk96WOqP5Zi7
	 +ntrAGRDOpmmg==
X-Pm-Submission-Id: 4j2qD34XHvz2ScPh
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
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
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 5/6] rust: ww_mutex: implement LockSet
Date: Sun, 11 Oct 2026 21:39:23 +0300
Message-ID: <d085c15ba9da4343148287a57abc7e6c4e0fe70f.1791743500.git.work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1791743500.git.work@onurozkan.dev>
References: <cover.1791743500.git.work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LockSet is a high-level and safe API built on top of
ww_mutex which provides a safe and easy to use API
while keeping the ww_mutex semantics.

When EDEADLK is hit it drops all held locks and waits for the
contended mutex. It then retries the given (by the user)
locking algorithm with that mutex held and the same acquire
context until it succeeds.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock/ww_mutex.rs          |   6 +
 rust/kernel/sync/lock/ww_mutex/lock_set.rs | 448 +++++++++++++++++++++
 2 files changed, 454 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs

diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
index 1626ec811a83..99b5a32d033d 100644
--- a/rust/kernel/sync/lock/ww_mutex.rs
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -6,6 +6,10 @@
 //! that belong to the same [`Class`]. Each lock acquisition uses an
 //! [`AcquireCtx`] to track ordering and ensure forward progress.
 //!
+//! It is recommended to use [`LockSet`] as it provides safe high-level
+//! interface that automatically handles deadlocks, retries and context
+//! management.
+//!
 //! See srctree/Documentation/locking/ww-mutex-design.rst for more details.
 
 use crate::{
@@ -25,9 +29,11 @@
 
 pub use acquire_ctx::AcquireCtx;
 pub use class::Class;
+pub use lock_set::LockSet;
 
 mod acquire_ctx;
 mod class;
+mod lock_set;
 
 /// A wound-wait (ww) mutex that is powered with deadlock avoidance
 /// when acquiring multiple locks of the same [`Class`].
diff --git a/rust/kernel/sync/lock/ww_mutex/lock_set.rs b/rust/kernel/sync/lock/ww_mutex/lock_set.rs
new file mode 100644
index 000000000000..7099de30243d
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/lock_set.rs
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Provides [`LockSet`] which automatically detects [`EDEADLK`],
+//! releases all locks, waits for the contended mutex and retries the user
+//! supplied locking algorithm with the same acquire context.
+
+use super::{
+    AcquireCtx,
+    Class,
+    Mutex, //
+};
+use crate::{
+    bindings,
+    prelude::*,
+    types::NotThreadSafe, //
+};
+use core::ptr::NonNull;
+
+/// A tracked set of [`Mutex`] locks acquired under the same [`Class`].
+///
+/// It ensures proper cleanup and retry mechanism on deadlocks and provides
+/// safe access to locked data via [`LockSet::with_locked`].
+///
+/// Typical usage is through [`LockSet::lock_all`], which retries a
+/// user supplied locking algorithm until it succeeds without deadlock.
+pub struct LockSet<'a> {
+    acquire_ctx: Pin<KBox<AcquireCtx<'a>>>,
+    taken: KVec<RawGuard>,
+    // Set by `lock()` on `EDEADLK`; the mutex remains valid for `'a`.
+    contended: Option<NonNull<bindings::ww_mutex>>,
+}
+
+/// Used by [`LockSet`] to track acquired locks.
+///
+/// This type is strictly crate-private and must never be exposed
+/// outside this crate.
+struct RawGuard {
+    mutex_ptr: NonNull<bindings::ww_mutex>,
+    _not_send: NotThreadSafe,
+}
+
+impl Drop for RawGuard {
+    fn drop(&mut self) {
+        // SAFETY: `mutex_ptr` originates from a locked `Mutex` and remains
+        // valid for the lifetime of this guard, so unlocking here is sound.
+        unsafe { bindings::ww_mutex_unlock(self.mutex_ptr.as_ptr()) };
+    }
+}
+
+impl<'a> Drop for LockSet<'a> {
+    fn drop(&mut self) {
+        self.release_all_locks();
+    }
+}
+
+impl<'a> LockSet<'a> {
+    /// Creates a new [`LockSet`] with the given [`Class`].
+    ///
+    /// All locks taken through this [`LockSet`] must belong to the
+    /// same [`Class`].
+    pub fn new(class: &'a Class) -> Result<Self> {
+        Ok(Self {
+            acquire_ctx: KBox::pin_init(AcquireCtx::new(class), GFP_KERNEL)?,
+            taken: KVec::new(),
+            contended: None,
+        })
+    }
+
+    /// Creates a new [`LockSet`] using an existing [`AcquireCtx`].
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `acquire_ctx` is properly initialized
+    /// and holds no [`Mutex`]es.
+    pub unsafe fn new_with_acquire_ctx(acquire_ctx: Pin<KBox<AcquireCtx<'a>>>) -> Self {
+        Self {
+            acquire_ctx,
+            taken: KVec::new(),
+            contended: None,
+        }
+    }
+
+    /// Attempts to lock the given [`Mutex`] and stores a guard for it.
+    ///
+    /// Returns success if the mutex is already held by this set.
+    pub fn lock<T>(&mut self, mutex: &'a Mutex<'a, T>) -> Result {
+        // Preserve the first contended mutex until deadlock recovery has completed.
+        if self.contended.is_some() {
+            return Err(EDEADLK);
+        }
+
+        // SAFETY: All tracked locks are released before the context is dropped.
+        // Forgetting the set leaks the context.
+        let guard = match unsafe { self.acquire_ctx.lock(mutex) } {
+            Ok(guard) => guard,
+            Err(e) if e == EDEADLK => {
+                self.contended = NonNull::new(mutex.inner.get());
+                return Err(e);
+            }
+            // The mutex acquired during backoff is encountered again on retry.
+            Err(e) if e == EALREADY => return Ok(()),
+            Err(e) => return Err(e),
+        };
+
+        let raw_guard = RawGuard {
+            // SAFETY: We just locked it above so it's a valid pointer.
+            mutex_ptr: unsafe { NonNull::new_unchecked(guard.mutex.inner.get()) },
+            _not_send: NotThreadSafe,
+        };
+
+        // Transfer unlocking to `raw_guard` before the fallible push, so failure
+        // drops only one guard and unlocks the mutex exactly once.
+        core::mem::forget(guard);
+        self.taken.push(raw_guard, GFP_KERNEL)?;
+
+        Ok(())
+    }
+
+    /// Runs `locking_algorithm` until success with retrying on deadlock.
+    ///
+    /// `locking_algorithm` must acquire all needed locks and immediately propagate
+    /// any error from [`Self::lock`] unchanged (e.g. using `?`).
+    /// If [`Self::lock`] returns [`EDEADLK`], this function releases all held locks
+    /// and waits to acquire the contended mutex. It then retries with that mutex
+    /// held, preserving the acquire context's original ticket.
+    ///
+    /// Once all locks are acquired successfully, `on_all_locks_taken` is
+    /// invoked for exclusive access to the locked values. It must not acquire
+    /// additional locks through this set. Afterwards, all locks are released.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// use kernel::{
+    ///     alloc::KBox,
+    ///     define_ww_class,
+    ///     prelude::*,
+    ///     sync::{
+    ///         lock::ww_mutex::{
+    ///             LockSet,
+    ///             Mutex, //
+    ///         },
+    ///         Arc,
+    ///     },
+    /// };
+    /// use pin_init::stack_pin_init;
+    ///
+    /// define_ww_class!(SOME_WOUND_WAIT_CLASS);
+    ///
+    /// let mutex1 = Arc::pin_init(Mutex::new(0, &SOME_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+    /// let mutex2 = Arc::pin_init(Mutex::new(0, &SOME_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+    /// let mut lock_set = KBox::pin_init(LockSet::new(&SOME_WOUND_WAIT_CLASS)?, GFP_KERNEL)?;
+    ///
+    /// lock_set.lock_all(
+    ///     // `locking_algorithm` closure
+    ///     |lock_set| {
+    ///         lock_set.lock(&mutex1)?;
+    ///         lock_set.lock(&mutex2)?;
+    ///
+    ///         Ok(())
+    ///     },
+    ///     // `on_all_locks_taken` closure
+    ///     |lock_set| {
+    ///         // Safely mutate both values while holding the locks.
+    ///         lock_set.with_locked(&mutex1, |v| *v += 1)?;
+    ///         lock_set.with_locked(&mutex2, |v| *v += 1)?;
+    ///
+    ///         Ok(())
+    ///     },
+    /// )?;
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn lock_all<T, Y, Z>(
+        &mut self,
+        mut locking_algorithm: T,
+        mut on_all_locks_taken: Y,
+    ) -> Result<Z>
+    where
+        T: FnMut(&mut LockSet<'a>) -> Result,
+        Y: FnMut(&mut LockSet<'a>) -> Result<Z>,
+    {
+        loop {
+            match locking_algorithm(self) {
+                Ok(()) => {
+                    // All locks in `locking_algorithm` succeeded.
+                    // The user can now safely use them in `on_all_locks_taken`.
+                    let res = on_all_locks_taken(self);
+                    self.release_all_locks();
+
+                    return res;
+                }
+                Err(e) if e == EDEADLK => {
+                    self.cleanup_on_deadlock()?;
+                    continue;
+                }
+                Err(e) => {
+                    self.release_all_locks();
+                    return Err(e);
+                }
+            }
+        }
+    }
+
+    /// Executes `access` with a mutable reference to the data behind [`Mutex`].
+    ///
+    /// Fails with [`EINVAL`] if the [`Mutex`] was not locked in this [`LockSet`].
+    pub fn with_locked<T: Unpin, Y>(
+        &mut self,
+        mutex: &'a Mutex<'a, T>,
+        access: impl for<'b> FnOnce(&'b mut T) -> Y,
+    ) -> Result<Y> {
+        let mutex_ptr = mutex.inner.get();
+
+        if self
+            .taken
+            .iter()
+            .any(|guard| guard.mutex_ptr.as_ptr() == mutex_ptr)
+        {
+            // SAFETY: We hold the lock corresponding to `mutex`, so we have
+            // exclusive access to its protected data.
+            let value = unsafe { &mut *mutex.data.get() };
+            Ok(access(value))
+        } else {
+            // `mutex` isn't locked in this `LockSet`.
+            Err(EINVAL)
+        }
+    }
+
+    /// Releases all currently held locks in this [`LockSet`].
+    fn release_all_locks(&mut self) {
+        // `Drop` implementation of the `RawGuard` takes care of the unlocking.
+        self.taken.clear();
+    }
+
+    /// Releases all locks and acquires the contended mutex with the same context.
+    fn cleanup_on_deadlock(&mut self) -> Result {
+        self.release_all_locks();
+
+        // A callback may return `EDEADLK` without a failed lock acquisition.
+        let contended = self.contended.take().ok_or(EDEADLK)?;
+
+        // SAFETY: `lock()` recorded this pointer from a mutex borrowed for `'a`,
+        // so both the mutex and its class remain valid for that lifetime.
+        let mutex = unsafe { Mutex::from_raw(contended.as_ptr()) };
+
+        // With no locks held, regular locking waits for this mutex to become available.
+        self.lock(mutex)
+    }
+}
+
+#[kunit_tests(rust_kernel_lock_set)]
+mod tests {
+    use super::*;
+    use crate::{
+        define_wd_class,
+        define_ww_class,
+        sync::Arc, //
+    };
+
+    define_ww_class!(TEST_WOUND_WAIT_CLASS);
+    define_wd_class!(TEST_WAIT_DIE_CLASS);
+
+    #[test]
+    fn test_lock_set_basic_lock_unlock() -> Result {
+        let mutex = Arc::pin_init(Mutex::new(10, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mut lock_set = KBox::pin_init(LockSet::new(&TEST_WOUND_WAIT_CLASS)?, GFP_KERNEL)?;
+
+        lock_set.lock(&mutex)?;
+        lock_set.lock(&mutex)?;
+        assert_eq!(lock_set.taken.len(), 1);
+
+        lock_set.with_locked(&mutex, |v| {
+            assert_eq!(*v, 10);
+        })?;
+
+        lock_set.release_all_locks();
+        assert!(!mutex.is_locked());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_lock_set_with_locked_mutates_data() -> Result {
+        let mutex = Arc::pin_init(Mutex::new(5, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mut lock_set = KBox::pin_init(LockSet::new(&TEST_WOUND_WAIT_CLASS)?, GFP_KERNEL)?;
+
+        lock_set.lock(&mutex)?;
+
+        lock_set.with_locked(&mutex, |v| {
+            assert_eq!(*v, 5);
+            // Increment the value.
+            *v += 7;
+        })?;
+
+        lock_set.with_locked(&mutex, |v| {
+            // Check that mutation took effect.
+            assert_eq!(*v, 12);
+        })?;
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_lock_all_success() -> Result {
+        let mutex1 = Arc::pin_init(Mutex::new(1, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mutex2 = Arc::pin_init(Mutex::new(2, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mut lock_set = KBox::pin_init(LockSet::new(&TEST_WOUND_WAIT_CLASS)?, GFP_KERNEL)?;
+
+        let res = lock_set.lock_all(
+            // `locking_algorithm` closure
+            |lock_set| {
+                lock_set.lock(&mutex1)?;
+                lock_set.lock(&mutex2)?;
+                Ok(())
+            },
+            // `on_all_locks_taken` closure
+            |lock_set| {
+                lock_set.with_locked(&mutex1, |v| *v += 10)?;
+                lock_set.with_locked(&mutex2, |v| *v += 20)?;
+                Ok((
+                    lock_set.with_locked(&mutex1, |v| *v)?,
+                    lock_set.with_locked(&mutex2, |v| *v)?,
+                ))
+            },
+        )?;
+
+        assert_eq!(res, (11, 22));
+        assert!(!mutex1.is_locked());
+        assert!(!mutex2.is_locked());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_with_different_input_type() -> Result {
+        let mutex1 = Arc::pin_init(Mutex::new(1, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mutex2 = Arc::pin_init(Mutex::new("hello", &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mut lock_set = KBox::pin_init(LockSet::new(&TEST_WOUND_WAIT_CLASS)?, GFP_KERNEL)?;
+
+        lock_set.lock_all(
+            // `locking_algorithm` closure
+            |lock_set| {
+                lock_set.lock(&mutex1)?;
+                lock_set.lock(&mutex2)?;
+
+                Ok(())
+            },
+            // `on_all_locks_taken` closure
+            |lock_set| {
+                lock_set.with_locked(&mutex1, |v| assert_eq!(*v, 1))?;
+                lock_set.with_locked(&mutex2, |v| assert_eq!(*v, "hello"))?;
+                Ok(())
+            },
+        )?;
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_lock_all_retries_on_deadlock() -> Result {
+        let first = Arc::pin_init(Mutex::new(1, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mutex = Arc::pin_init(Mutex::new(99, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mut lock_set = KBox::pin_init(LockSet::new(&TEST_WOUND_WAIT_CLASS)?, GFP_KERNEL)?;
+        let mut first_try = true;
+        let ctx = lock_set.acquire_ctx.inner.get();
+        // SAFETY: The set owns this initialized context throughout the test.
+        let stamp = unsafe { (*ctx).stamp };
+
+        let res = lock_set.lock_all(
+            // `locking_algorithm` closure
+            |lock_set| {
+                if first_try {
+                    first_try = false;
+                    lock_set.lock(&first)?;
+                    // Simulate a failed acquisition with its contended mutex recorded.
+                    lock_set.contended = NonNull::new(mutex.inner.get());
+                    return Err(EDEADLK);
+                }
+
+                assert!(!first.is_locked());
+                // Backoff must acquire the contended mutex before retrying this callback.
+                lock_set.with_locked(&mutex, |v| assert_eq!(*v, 99))?;
+                lock_set.lock(&mutex)?;
+                assert_eq!(lock_set.taken.len(), 1);
+                Ok(())
+            },
+            // `on_all_locks_taken` closure
+            |lock_set| {
+                lock_set.with_locked(&mutex, |v| {
+                    *v += 1;
+                    *v
+                })
+            },
+        )?;
+
+        assert_eq!(res, 100);
+        assert!(!first.is_locked());
+        assert!(!mutex.is_locked());
+        // SAFETY: The context is still owned by the set and remains initialized.
+        assert_eq!(unsafe { (*ctx).stamp }, stamp);
+        Ok(())
+    }
+
+    #[test]
+    fn test_lock_all_deadlock_without_contended_mutex() -> Result {
+        let mutex = Arc::pin_init(Mutex::new(1, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mut lock_set = KBox::pin_init(LockSet::new(&TEST_WOUND_WAIT_CLASS)?, GFP_KERNEL)?;
+        let mut attempts = 0;
+
+        let res = lock_set.lock_all(
+            |lock_set| {
+                attempts += 1;
+                lock_set.lock(&mutex)?;
+                // Return a different error on an unexpected retry to avoid an endless loop.
+                Err(if attempts == 1 { EDEADLK } else { EINVAL })
+            },
+            |_| Ok(()),
+        );
+
+        assert_eq!(res, Err(EDEADLK));
+        assert_eq!(attempts, 1);
+        assert!(!mutex.is_locked());
+        Ok(())
+    }
+
+    #[test]
+    fn test_with_locked_on_unlocked_mutex() -> Result {
+        let mutex = Arc::pin_init(Mutex::new(5, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mut lock_set = KBox::pin_init(LockSet::new(&TEST_WOUND_WAIT_CLASS)?, GFP_KERNEL)?;
+
+        let ecode = lock_set.with_locked(&mutex, |_v| {}).unwrap_err();
+        assert_eq!(EINVAL, ecode);
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_with_different_classes() -> Result {
+        let mutex = Arc::pin_init(Mutex::new(5, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mut lock_set = KBox::pin_init(LockSet::new(&TEST_WAIT_DIE_CLASS)?, GFP_KERNEL)?;
+
+        let ecode = lock_set.lock(&mutex).unwrap_err();
+        assert_eq!(EINVAL, ecode);
+
+        Ok(())
+    }
+}
-- 
2.51.2

