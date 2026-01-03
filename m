Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [178.154.239.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1943729DB99;
	Sat,  3 Jan 2026 07:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767425795; cv=none; b=OjmfsqJc0iMqmEf5m5prhFL/Pz0fSVGQ85seoWZ8uuPp62W8RZDvVPsgWiG+3kGIcBQvpBPBOYDELKO23mUQit2QXBHi3uAKxiYjV18jZZvi3BVDLd68IGU9st8symODIqLpy3mjDl7TSQ22MAjKFdsjW3ZQyZQ9zTf5eyTVVcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767425795; c=relaxed/simple;
	bh=H4qaJKpJttCpf4TmafmqUWEKqyH7F4iD2zhAYDyG4vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CNX5IKNVasq2eRI0U0wigkkQWgkDH58VKU3IYodeO0IcK/Ki0U8kJ/Zr3RKHUFiWf2DFYDIaHweA29+meKeE5ndBxqKGfDAkvPWfIAodqaHLiIQrhpwotxIOpJxaqy2fkufSodOECBJfsT+JRfgEFQdaNbxrQb6z1OocQbzowLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=jWHHxayU; arc=none smtp.client-ip=178.154.239.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="jWHHxayU"
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 7453480C54;
	Sat, 03 Jan 2026 10:36:30 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id vZgUW4MHrmI0-BEPIfLmw;
	Sat, 03 Jan 2026 10:36:29 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767425789;
	bh=IEaKmF1WxfztJUxe10S/39KiXHFlYLdUUr90Fm6GRbU=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=jWHHxayU9Xcr0wl+5p7fAXrTsVu4zs1wCnc/ill7gWA8iqgp8ULpHM3jGOjwOnQ7V
	 IH5wOliADjt+PN1eSmUvfO55G4KoGbC8G8eZX0Yu7BIOLL9hWAk/e1BRwFSthG+t0M
	 vtZS9d/ZGzjuF2oqX7doUzm0mVwQIK6ZVEYophqM=
Authentication-Results: mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: lossin@kernel.org,
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
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v10 6/7] rust: ww_mutex: implement LockSet
Date: Sat,  3 Jan 2026 10:35:53 +0300
Message-ID: <20260103073554.34855-7-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260103073554.34855-1-work@onurozkan.dev>
References: <20260103073554.34855-1-work@onurozkan.dev>
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

When EDEADLK is hit it drops all held locks, resets
the acquire context and retries the given (by the user)
locking algorithm until it succeeds.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock/ww_mutex.rs          |   6 +
 rust/kernel/sync/lock/ww_mutex/lock_set.rs | 370 +++++++++++++++++++++
 2 files changed, 376 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex/lock_set.rs

diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
index e36a0204a00e..0c12dfc05f22 100644
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
 
 use crate::error::to_result;
@@ -18,9 +22,11 @@
 
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
index 000000000000..db5ca4fe7cb4
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/lock_set.rs
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Provides [`LockSet`] which automatically detects [`EDEADLK`],
+//! releases all locks, resets the state and retries the user
+//! supplied locking algorithm until success.
+
+use super::{AcquireCtx, Class, Mutex};
+use crate::bindings;
+use crate::prelude::*;
+use crate::types::NotThreadSafe;
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
+        }
+    }
+
+    /// Attempts to lock the given [`Mutex`] and stores a guard for it.
+    pub fn lock<T>(&mut self, mutex: &'a Mutex<'a, T>) -> Result {
+        let guard = self.acquire_ctx.lock(mutex)?;
+
+        self.taken.push(
+            RawGuard {
+                // SAFETY: We just locked it above so it's a valid pointer.
+                mutex_ptr: unsafe { NonNull::new_unchecked(guard.mutex.inner.get()) },
+                _not_send: NotThreadSafe,
+            },
+            GFP_KERNEL,
+        )?;
+
+        // Avoid unlocking here; `release_all_locks` (also run by `Drop`)
+        // performs the unlock for `LockSet`.
+        core::mem::forget(guard);
+
+        Ok(())
+    }
+
+    /// Runs `locking_algorithm` until success with retrying on deadlock.
+    ///
+    /// `locking_algorithm` should attempt to acquire all needed locks.
+    /// If [`EDEADLK`] is detected, this function will roll back, reset
+    /// the context and retry automatically.
+    ///
+    /// Once all locks are acquired successfully, `on_all_locks_taken` is
+    /// invoked for exclusive access to the locked values. Afterwards, all
+    /// locks are released.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// use kernel::alloc::KBox;
+    /// use kernel::define_ww_class;
+    /// use kernel::prelude::*;
+    /// use kernel::sync::Arc;
+    /// use kernel::sync::lock::ww_mutex::{LockSet, Mutex};
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
+                    // Deadlock detected, retry from scratch.
+                    self.cleanup_on_deadlock();
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
+    /// Resets this [`LockSet`] after a deadlock detection.
+    ///
+    /// Drops all held locks and reinitializes the [`AcquireCtx`].
+    ///
+    /// It is intended to be used for internal implementation only.
+    fn cleanup_on_deadlock(&mut self) {
+        self.release_all_locks();
+
+        // SAFETY: We released all the locks just above.
+        unsafe { self.acquire_ctx.as_mut().reinit() };
+    }
+}
+
+#[kunit_tests(rust_kernel_lock_set)]
+mod tests {
+    use crate::prelude::*;
+    use crate::sync::Arc;
+    use crate::{define_wd_class, define_ww_class};
+
+    use super::*;
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
+                let _ = lock_set.lock(&mutex1)?;
+                let _ = lock_set.lock(&mutex2)?;
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
+        let mutex = Arc::pin_init(Mutex::new(99, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mut lock_set = KBox::pin_init(LockSet::new(&TEST_WOUND_WAIT_CLASS)?, GFP_KERNEL)?;
+        let mut first_try = true;
+
+        let res = lock_set.lock_all(
+            // `locking_algorithm` closure
+            |lock_set| {
+                if first_try {
+                    first_try = false;
+                    // Simulate deadlock on first attempt.
+                    return Err(EDEADLK);
+                }
+                lock_set.lock(&mutex)
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

