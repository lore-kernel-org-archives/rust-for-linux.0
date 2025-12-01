Received: from forward204b.mail.yandex.net (forward204b.mail.yandex.net [178.154.239.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4529BDA2;
	Mon,  1 Dec 2025 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764585431; cv=none; b=Yenc+2Sb6c6cIbzo0YWQogk7YoBhLKbHXjJBBB93hgcZ+4TkTqXkCx0G84GN2QixRTX8vVZ+bLLTxNtWZ3pWzRAoR6dF36p9jN2Wk769l8/X4m93u46IZrfzzWAB5GVasVs7RtJOBfveD81TrQvuc2jlTI5kYGSGtAVSHkTm7dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764585431; c=relaxed/simple;
	bh=8MZ/cCiqPrsKtrai2li2IUfUNaHxg/CMj0dcvbi6i/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D7VrqAnvagOYh9o9x6Nte2tm1OfuW1Ftg7in/RczsNfjFnuQjabJHGVy6vRCOyso5IGdBdNrRd1lew/2xCWLxDzn0Qs4eNMciiHOzduY1xFGj6gGQeUf0oIKa4AigvAXYVjR1P8Ko6tfQWh1kqJpyCTVKHfYmILuRQxdS0bM/ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=J/HebFQY; arc=none smtp.client-ip=178.154.239.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="J/HebFQY"
Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d101])
	by forward204b.mail.yandex.net (Yandex) with ESMTPS id D56B484B96;
	Mon, 01 Dec 2025 13:29:31 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8a9a:0:640:e327:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id 24A7BC010B;
	Mon, 01 Dec 2025 13:29:23 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id wSfJU4kLMiE0-2Fqb8OuE;
	Mon, 01 Dec 2025 13:29:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764584962;
	bh=8Hs7tCXjC1sV8r+GXdGQA59lgFCJPeFA1b/8ZUhI58w=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=J/HebFQY41znBzjMvDBeaitUh1D2AppstUvPMcHCyDYce0ns+m2Xm+puaumuvuZAL
	 Drwaxqy4uPQN9x6jkJ+woWcej3h8e+fUrwWmocp8gG6xq2G7S9MwpsxAP7uyXxcXDX
	 g7cvpbsP8i3C6ZpPDEgIKLiC9U0mTh5Y1RmbIHUE=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
Date: Mon,  1 Dec 2025 13:28:54 +0300
Message-ID: <20251201102855.4413-6-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251201102855.4413-1-work@onurozkan.dev>
References: <20251201102855.4413-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Covers the entire low-level locking API (lock, try_lock,
slow path, interruptible variants) and integration with
kernel bindings.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock/ww_mutex.rs             | 442 ++++++++++++++++++
 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 172 +++++++
 2 files changed, 614 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs

diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
index 727c51cc73af..00e25872a042 100644
--- a/rust/kernel/sync/lock/ww_mutex.rs
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -1,7 +1,449 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Rust abstractions for the kernel's wound-wait locking primitives.
+//!
+//! It is designed to avoid deadlocks when locking multiple [`Mutex`]es
+//! that belong to the same [`Class`]. Each lock acquisition uses an
+//! [`AcquireCtx`] to track ordering and ensure forward progress.
+//!
+//! It is recommended to use [`LockSet`] as it provides safe high-level
+//! interface that automatically handles deadlocks, retries and context
+//! management.
 
+use crate::error::to_result;
+use crate::prelude::*;
+use crate::types::{NotThreadSafe, Opaque};
+use crate::{bindings, container_of};
+
+use core::cell::UnsafeCell;
+use core::marker::PhantomData;
+
+pub use acquire_ctx::AcquireCtx;
 pub use class::Class;
+pub use lock_set::LockSet;
 
+mod acquire_ctx;
 mod class;
+mod lock_set;
+
+/// A wound-wait (ww) mutex that is powered with deadlock avoidance
+/// when acquiring multiple locks of the same [`Class`].
+///
+/// Each mutex belongs to a [`Class`], which the wound-wait algorithm
+/// uses to figure out the order of acquisition and prevent deadlocks.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::c_str;
+/// use kernel::sync::Arc;
+/// use kernel::sync::lock::ww_mutex::{AcquireCtx, Class, Mutex};
+/// use pin_init::stack_pin_init;
+///
+/// stack_pin_init!(let class = Class::new_wound_wait(c_str!("some_class")));
+/// let mutex = Arc::pin_init(Mutex::new(42, &class), GFP_KERNEL)?;
+///
+/// let ctx = KBox::pin_init(AcquireCtx::new(&class), GFP_KERNEL)?;
+///
+/// let guard = ctx.lock(&mutex)?;
+/// assert_eq!(*guard, 42);
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data]
+#[repr(C)]
+pub struct Mutex<'a, T: ?Sized> {
+    _p: PhantomData<&'a Class>,
+    #[pin]
+    inner: Opaque<bindings::ww_mutex>,
+    data: UnsafeCell<T>,
+}
+
+// SAFETY: `Mutex` can be sent to another thread if the protected
+// data `T` can be.
+unsafe impl<T: ?Sized + Send> Send for Mutex<'_, T> {}
+
+// SAFETY: `Mutex` can be shared across threads if the protected
+// data `T` can be.
+unsafe impl<T: ?Sized + Send + Sync> Sync for Mutex<'_, T> {}
+
+impl<'class, T> Mutex<'class, T> {
+    /// Initializes [`Mutex`] with the given `data` and [`Class`].
+    pub fn new(data: T, class: &'class Class) -> impl PinInit<Self> {
+        let class_ptr = class.inner.get();
+        pin_init!(Mutex {
+            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
+                // SAFETY: `class` is valid for the lifetime `'class` captured by `Self`.
+                unsafe { bindings::ww_mutex_init(slot, class_ptr) }
+            }),
+            data: UnsafeCell::new(data),
+            _p: PhantomData
+        })
+    }
+}
+
+impl<'class> Mutex<'class, ()> {
+    /// Creates a [`Mutex`] from a raw pointer.
+    ///
+    /// This function is intended for interoperability with C code.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is a valid pointer to a `ww_mutex`
+    /// and that it remains valid for the lifetime `'a`.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) -> &'a Self {
+        // SAFETY: By the safety contract, the caller guarantees that `ptr`
+        // points to a valid `ww_mutex` which is the `inner` field of `Mutex`
+        // and remains valid for the lifetime `'a`.
+        //
+        // Because [`Mutex`] is `#[repr(C)]`, the `inner` field sits at a
+        // stable offset that `container_of!` can safely rely on.
+        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, inner) }
+    }
+}
+
+impl<'class, T: ?Sized> Mutex<'class, T> {
+    /// Checks if this [`Mutex`] is currently locked.
+    ///
+    /// The returned value is racy as another thread can acquire
+    /// or release the lock immediately after this call returns.
+    pub fn is_locked(&self) -> bool {
+        // SAFETY: It's safe to call `ww_mutex_is_locked` on
+        // a valid mutex.
+        unsafe { bindings::ww_mutex_is_locked(self.inner.get()) }
+    }
+
+    /// Locks this [`Mutex`] without [`AcquireCtx`].
+    pub fn lock(&self) -> Result<MutexGuard<'_, T>> {
+        lock_common(self, None, LockKind::Regular)
+    }
+
+    /// Similar to [`Self::lock`], but can be interrupted by signals.
+    pub fn lock_interruptible(&self) -> Result<MutexGuard<'_, T>> {
+        lock_common(self, None, LockKind::Interruptible)
+    }
+
+    /// Locks this [`Mutex`] without [`AcquireCtx`] using the slow path.
+    ///
+    /// This function should be used when [`Self::lock`] fails (typically due
+    /// to a potential deadlock).
+    pub fn lock_slow(&self) -> Result<MutexGuard<'_, T>> {
+        lock_common(self, None, LockKind::Slow)
+    }
+
+    /// Similar to [`Self::lock_slow`], but can be interrupted by signals.
+    pub fn lock_slow_interruptible(&self) -> Result<MutexGuard<'_, T>> {
+        lock_common(self, None, LockKind::SlowInterruptible)
+    }
+
+    /// Tries to lock this [`Mutex`] with no [`AcquireCtx`] and without blocking.
+    ///
+    /// Unlike [`Self::lock`], no deadlock handling is performed.
+    pub fn try_lock(&self) -> Result<MutexGuard<'_, T>> {
+        lock_common(self, None, LockKind::Try)
+    }
+}
+
+/// A guard that provides exclusive access to the data protected
+/// by a [`Mutex`].
+///
+/// # Invariants
+///
+/// The guard holds an exclusive lock on the associated [`Mutex`]. The lock is held
+/// for the entire lifetime of this guard and is automatically released when the
+/// guard is dropped.
+#[must_use = "the lock unlocks immediately when the guard is unused"]
+pub struct MutexGuard<'a, T: ?Sized> {
+    mutex: &'a Mutex<'a, T>,
+    _not_send: NotThreadSafe,
+}
+
+// SAFETY: `MutexGuard` can be shared between threads if the data can.
+unsafe impl<T: ?Sized + Sync> Sync for MutexGuard<'_, T> {}
+
+impl<'a, T: ?Sized> MutexGuard<'a, T> {
+    /// Creates a new guard for the given [`Mutex`].
+    fn new(mutex: &'a Mutex<'a, T>) -> Self {
+        Self {
+            mutex,
+            _not_send: NotThreadSafe,
+        }
+    }
+}
+
+impl<'a> MutexGuard<'a, ()> {
+    /// Creates a [`MutexGuard`] from a raw pointer.
+    ///
+    /// This function is intended for interoperability with C code.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is a valid pointer to a `ww_mutex`
+    /// and that it remains valid for the lifetime `'a`.
+    pub unsafe fn from_raw<'b>(ptr: *mut bindings::ww_mutex) -> MutexGuard<'b, ()> {
+        // SAFETY: By the safety contract, the caller guarantees that `ptr`
+        // points to a valid `ww_mutex` which is the `mutex` field of `Mutex`
+        // and remains valid for the lifetime `'a`.
+        let mutex = unsafe { Mutex::from_raw(ptr) };
+
+        MutexGuard::new(mutex)
+    }
+}
+
+impl<T: ?Sized> core::ops::Deref for MutexGuard<'_, T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: We hold the lock, so we have exclusive access.
+        unsafe { &*self.mutex.data.get() }
+    }
+}
+
+impl<T: ?Sized + Unpin> core::ops::DerefMut for MutexGuard<'_, T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: We hold the lock, so we have exclusive access.
+        unsafe { &mut *self.mutex.data.get() }
+    }
+}
+
+impl<T: ?Sized> Drop for MutexGuard<'_, T> {
+    fn drop(&mut self) {
+        // SAFETY: We hold the lock and are about to release it.
+        unsafe { bindings::ww_mutex_unlock(self.mutex.inner.get()) };
+    }
+}
+
+/// Locking kinds used by [`lock_common`] to unify the internal
+/// locking logic.
+///
+/// It's best not to expose this type (and [`lock_common`]) to the
+/// kernel, as it allows internal API changes without worrying
+/// about breaking external compatibility.
+#[derive(Copy, Clone, Debug)]
+enum LockKind {
+    /// Blocks until lock is acquired.
+    Regular,
+    /// Blocks but can be interrupted by signals.
+    Interruptible,
+    /// Used in slow path after deadlock detection.
+    Slow,
+    /// Slow path but interruptible.
+    SlowInterruptible,
+    /// Does not block, returns immediately if busy.
+    Try,
+}
+
+/// Internal helper that unifies the different locking kinds.
+///
+/// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`].
+fn lock_common<'a, T: ?Sized>(
+    mutex: &'a Mutex<'a, T>,
+    ctx: Option<&AcquireCtx<'_>>,
+    kind: LockKind,
+) -> Result<MutexGuard<'a, T>> {
+    let mutex_ptr = mutex.inner.get();
+
+    let ctx_ptr = match ctx {
+        Some(acquire_ctx) => {
+            let ctx_ptr = acquire_ctx.inner.get();
+
+            // SAFETY: `ctx_ptr` is a valid pointer for the entire
+            // lifetime of `ctx`.
+            let ctx_class = unsafe { (*ctx_ptr).ww_class };
+
+            // SAFETY: `mutex_ptr` is a valid pointer for the entire
+            // lifetime of `mutex`.
+            let mutex_class = unsafe { (*mutex_ptr).ww_class };
+
+            // `ctx` and `mutex` must use the same class.
+            if ctx_class != mutex_class {
+                return Err(EINVAL);
+            }
+
+            ctx_ptr
+        }
+        None => core::ptr::null_mut(),
+    };
+
+    match kind {
+        LockKind::Regular => {
+            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
+            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
+            let ret = unsafe { bindings::ww_mutex_lock(mutex_ptr, ctx_ptr) };
+
+            to_result(ret)?;
+        }
+        LockKind::Interruptible => {
+            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
+            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
+            let ret = unsafe { bindings::ww_mutex_lock_interruptible(mutex_ptr, ctx_ptr) };
+
+            to_result(ret)?;
+        }
+        LockKind::Slow => {
+            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
+            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
+            unsafe { bindings::ww_mutex_lock_slow(mutex_ptr, ctx_ptr) };
+        }
+        LockKind::SlowInterruptible => {
+            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
+            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
+            let ret = unsafe { bindings::ww_mutex_lock_slow_interruptible(mutex_ptr, ctx_ptr) };
+
+            to_result(ret)?;
+        }
+        LockKind::Try => {
+            // SAFETY: `Mutex` is always pinned. If `AcquireCtx` is `Some`, it is pinned,
+            // if `None`, it is set to `core::ptr::null_mut()`. Both cases are safe.
+            let ret = unsafe { bindings::ww_mutex_trylock(mutex_ptr, ctx_ptr) };
+
+            if ret == 0 {
+                return Err(EBUSY);
+            } else {
+                to_result(ret)?;
+            }
+        }
+    };
+
+    Ok(MutexGuard::new(mutex))
+}
+
+#[kunit_tests(rust_kernel_ww_mutex)]
+mod tests {
+    use crate::prelude::*;
+    use crate::sync::Arc;
+    use crate::{c_str, define_class};
+    use pin_init::stack_pin_init;
+
+    use super::*;
+
+    // A simple coverage on `define_class` macro.
+    define_class!(TEST_WOUND_WAIT_CLASS, wound_wait, c_str!("test"));
+    define_class!(TEST_WAIT_DIE_CLASS, wait_die, c_str!("test"));
+
+    #[test]
+    fn test_ww_mutex_basic_lock_unlock() -> Result {
+        stack_pin_init!(let class = Class::new_wound_wait(c_str!("test")));
+
+        let mutex = Arc::pin_init(Mutex::new(42, &class), GFP_KERNEL)?;
+
+        let ctx = KBox::pin_init(AcquireCtx::new(&class), GFP_KERNEL)?;
+
+        let guard = ctx.lock(&mutex)?;
+        assert_eq!(*guard, 42);
+
+        // Drop the lock.
+        drop(guard);
+
+        let mut guard = ctx.lock(&mutex)?;
+        *guard = 100;
+        assert_eq!(*guard, 100);
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_ww_mutex_trylock() -> Result {
+        stack_pin_init!(let class = Class::new_wound_wait(c_str!("test")));
+
+        let mutex = Arc::pin_init(Mutex::new(123, &class), GFP_KERNEL)?;
+
+        let ctx = KBox::pin_init(AcquireCtx::new(&class), GFP_KERNEL)?;
+
+        // `try_lock` on unlocked mutex should succeed.
+        let guard = ctx.try_lock(&mutex)?;
+        assert_eq!(*guard, 123);
+
+        // Now it should fail immediately as it's already locked.
+        assert!(ctx.try_lock(&mutex).is_err());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_ww_mutex_is_locked() -> Result {
+        stack_pin_init!(let class = Class::new_wait_die(c_str!("test")));
+
+        let mutex = Arc::pin_init(Mutex::new("hello", &class), GFP_KERNEL)?;
+
+        let ctx = KBox::pin_init(AcquireCtx::new(&class), GFP_KERNEL)?;
+
+        // Should not be locked initially.
+        assert!(!mutex.is_locked());
+
+        let guard = ctx.lock(&mutex)?;
+        assert!(mutex.is_locked());
+
+        drop(guard);
+        assert!(!mutex.is_locked());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_ww_acquire_context_done() -> Result {
+        stack_pin_init!(let class = Class::new_wound_wait(c_str!("test")));
+
+        let mutex1 = Arc::pin_init(Mutex::new(1, &class), GFP_KERNEL)?;
+        let mutex2 = Arc::pin_init(Mutex::new(2, &class), GFP_KERNEL)?;
+
+        let ctx = KBox::pin_init(AcquireCtx::new(&class), GFP_KERNEL)?;
+
+        // Acquire multiple mutexes with the same context.
+        let guard1 = ctx.lock(&mutex1)?;
+        let guard2 = ctx.lock(&mutex2)?;
+
+        assert_eq!(*guard1, 1);
+        assert_eq!(*guard2, 2);
+
+        // SAFETY: It's called exactly once here and nowhere else.
+        unsafe { ctx.done() };
+
+        // We shouldn't be able to lock once it's `done`.
+        assert!(ctx.lock(&mutex1).is_err());
+        assert!(ctx.lock(&mutex2).is_err());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_with_global_classes() -> Result {
+        let mutex1 = Arc::pin_init(Mutex::new(100, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let mutex2 = Arc::pin_init(Mutex::new(200, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+
+        let ww_ctx = KBox::pin_init(AcquireCtx::new(&TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let wd_ctx = KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+
+        let ww_guard = ww_ctx.lock(&mutex1)?;
+        let wd_guard = wd_ctx.lock(&mutex2)?;
+
+        assert_eq!(*ww_guard, 100);
+        assert_eq!(*wd_guard, 200);
+
+        assert!(mutex1.is_locked());
+        assert!(mutex2.is_locked());
+
+        drop(ww_guard);
+        drop(wd_guard);
+
+        assert!(!mutex1.is_locked());
+        assert!(!mutex2.is_locked());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_mutex_without_ctx() -> Result {
+        let mutex = Arc::pin_init(Mutex::new(100, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let guard = mutex.lock()?;
+
+        assert_eq!(*guard, 100);
+        assert!(mutex.is_locked());
+
+        drop(guard);
+
+        assert!(!mutex.is_locked());
+
+        Ok(())
+    }
+}
diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
new file mode 100644
index 000000000000..141300e849eb
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Provides [`AcquireCtx`] for managing multiple wound/wait
+//! mutexes from the same [`Class`].
+
+use crate::bindings;
+use crate::prelude::*;
+use crate::types::Opaque;
+
+use core::marker::PhantomData;
+
+use super::{lock_common, Class, LockKind, Mutex, MutexGuard};
+
+/// Groups multiple [`Mutex`]es for deadlock avoidance when acquired
+/// with the same [`Class`].
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::lock::ww_mutex::{Class, AcquireCtx, Mutex};
+/// use kernel::c_str;
+/// use kernel::sync::Arc;
+/// use pin_init::stack_pin_init;
+///
+/// stack_pin_init!(let class = Class::new_wound_wait(c_str!("demo")));
+///
+/// // Create mutexes.
+/// let mutex1 = Arc::pin_init(Mutex::new(1, &class), GFP_KERNEL)?;
+/// let mutex2 = Arc::pin_init(Mutex::new(2, &class), GFP_KERNEL)?;
+///
+/// // Create acquire context for deadlock avoidance.
+/// let ctx = KBox::pin_init(AcquireCtx::new(&class), GFP_KERNEL)?;
+///
+/// let guard1 = ctx.lock(&mutex1)?;
+/// let guard2 = ctx.lock(&mutex2)?;
+///
+/// // Mark acquisition phase as complete.
+/// // SAFETY: It's called exactly once here and nowhere else.
+/// unsafe { ctx.done() };
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data(PinnedDrop)]
+#[repr(transparent)]
+pub struct AcquireCtx<'a> {
+    #[pin]
+    pub(super) inner: Opaque<bindings::ww_acquire_ctx>,
+    _p: PhantomData<&'a Class>,
+}
+
+impl<'class> AcquireCtx<'class> {
+    /// Initializes a new [`AcquireCtx`] with the given [`Class`].
+    pub fn new(class: &'class Class) -> impl PinInit<Self> {
+        let class_ptr = class.inner.get();
+        pin_init!(AcquireCtx {
+            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_ctx| {
+                // SAFETY: `class` is valid for the lifetime `'class` captured
+                // by `AcquireCtx`.
+                unsafe { bindings::ww_acquire_init(slot, class_ptr) }
+            }),
+            _p: PhantomData
+        })
+    }
+
+    /// Creates a [`AcquireCtx`] from a raw pointer.
+    ///
+    /// This function is intended for interoperability with C code.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` is a valid pointer to the `inner` field
+    /// of [`AcquireCtx`] and that it remains valid for the lifetime `'a`.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_acquire_ctx) -> &'a Self {
+        // SAFETY: By the safety contract, `ptr` is valid to construct `AcquireCtx`.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Marks the end of the acquire phase.
+    ///
+    /// Calling this function is optional. It is just useful to document
+    /// the code and clearly designated the acquire phase from actually
+    /// using the locked data structures.
+    ///
+    /// After calling this function, no more mutexes can be acquired with
+    /// this context.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that this function is called only once
+    /// and after calling it, no further mutexes are acquired using
+    /// this context.
+    pub unsafe fn done(&self) {
+        // SAFETY: By the safety contract, the caller guarantees that this
+        // function is called only once.
+        unsafe { bindings::ww_acquire_done(self.inner.get()) };
+    }
+
+    /// Re-initializes the [`AcquireCtx`].
+    ///
+    /// Must be called after releasing all locks when [`EDEADLK`] occurs.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure no locks are held in this [`AcquireCtx`].
+    pub unsafe fn reinit(self: Pin<&mut Self>) {
+        let ctx = self.inner.get();
+
+        // SAFETY: `ww_class` is always a valid pointer in properly initialized
+        // `AcquireCtx`.
+        let class_ptr = unsafe { (*ctx).ww_class };
+
+        // SAFETY:
+        //  - Lifetime of any guard (which hold an immutable borrow of `self`) cannot overlap
+        //    with the execution of this function. This enforces that all locks acquired via
+        //    this context have been released.
+        //
+        //  - `ctx` is guaranteed to be initialized because `ww_acquire_fini`
+        //    can only be called from the `Drop` implementation.
+        //
+        //  - `ww_acquire_fini` is safe to call on an initialized context.
+        unsafe { bindings::ww_acquire_fini(ctx) };
+
+        // SAFETY: `ww_acquire_init` is safe to call with valid pointers
+        // to initialize an uninitialized context.
+        unsafe { bindings::ww_acquire_init(ctx, class_ptr) };
+    }
+
+    /// Locks the given [`Mutex`] on this [`AcquireCtx`].
+    pub fn lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Result<MutexGuard<'a, T>> {
+        lock_common(mutex, Some(self), LockKind::Regular)
+    }
+
+    /// Similar to [`Self::lock`], but can be interrupted by signals.
+    pub fn lock_interruptible<'a, T>(
+        &'a self,
+        mutex: &'a Mutex<'a, T>,
+    ) -> Result<MutexGuard<'a, T>> {
+        lock_common(mutex, Some(self), LockKind::Interruptible)
+    }
+
+    /// Locks the given [`Mutex`] on this [`AcquireCtx`] using the slow path.
+    ///
+    /// This function should be used when [`Self::lock`] fails (typically due
+    /// to a potential deadlock).
+    pub fn lock_slow<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Result<MutexGuard<'a, T>> {
+        lock_common(mutex, Some(self), LockKind::Slow)
+    }
+
+    /// Similar to [`Self::lock_slow`], but can be interrupted by signals.
+    pub fn lock_slow_interruptible<'a, T>(
+        &'a self,
+        mutex: &'a Mutex<'a, T>,
+    ) -> Result<MutexGuard<'a, T>> {
+        lock_common(mutex, Some(self), LockKind::SlowInterruptible)
+    }
+
+    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without blocking.
+    ///
+    /// Unlike [`Self::lock`], no deadlock handling is performed.
+    pub fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Result<MutexGuard<'a, T>> {
+        lock_common(mutex, Some(self), LockKind::Try)
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for AcquireCtx<'_> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: Given the lifetime bounds we know no locks are held,
+        // so calling `ww_acquire_fini` is safe.
+        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
+    }
+}
-- 
2.51.2

