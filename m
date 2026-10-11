Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD0A3BCD0E
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744043; cv=none; b=o0fmtzoi0t5NIRJl3lLXB9MKTokM0u8O9iATPJny/p34Wt4ygwYWYds3+1Fk4JUJi1jwCduWDjJUcQmtYH+hN4XohcmIxzIpB29/DPghJIsmtuL7dl4s+F4mHcJZ0hCGo4HunUABw6O1d+TM9USVuFuF+WY7pzb4VXGAS8fXgG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744043; c=relaxed/simple;
	bh=uAh75fzfa7VEzl6xBmXowS6tsy/jRrP/wCbAOngqrGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sZrAUBsC+AzeTCEo7Tg4cGMNcCxb+DXjkgQIoCMKBGtlpD05VEPHFPPKv9naZ9cEzzJ+iRBUD++iRuI5fFgX/8jNXWriUGPSpf4IbNkjoyztaepK1nAPoF9kyh0GkmykmvPHri1I4O3N8dGd7AL0C+K1COF41exxQWMW7J9fICU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=puRlDibl; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="puRlDibl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791744035; x=1792003235;
	bh=qh1Q5lB7uRZZxwixOEeRcaEJAZKhFFRNT4vzlfm4czw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=puRlDiblLvLDoR9QBuTyS43TZUgOXT+6+fm28jsYZ6WBtefbDCPA5OlZnR2k8FWbf
	 aUDVJsUnj7ERPVSEAqDT/+Wn7amkWTvrAXr7V3kRseuTHJRi6w5gEITfr6tJ06Q8DR
	 nARX9FXztSi3PGms4ABVu2bR+a/5wGBcZH+FHbj0o1s0wSShdBH1ThHLwKa55yESvi
	 ykz2gBlXftZCsR53G6e+XBR6eLsjiiAoO94tolQ67Y7+uZWBuDFJpvrEQrxLB0sJYf
	 2iiwZ9TsGZ9zZkKX5oAwlGAdaFU5rKyxFDpF6PokmqGR972jrFoKaPKG9fz73HnyXj
	 K2SGGz/9yXJfA==
X-Pm-Submission-Id: 4j2qD02pYSz2ScPd
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
Subject: [PATCH v11 4/6] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
Date: Sun, 11 Oct 2026 21:39:22 +0300
Message-ID: <293fbbc0bcc0ff5b9bb3aa682bf4c23a378e3167.1791743500.git.work@onurozkan.dev>
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

Covers the low-level locking API (lock, try_lock and
interruptible variants) and integration with kernel bindings.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock/ww_mutex.rs             | 430 ++++++++++++++++++
 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 148 ++++++
 2 files changed, 578 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs

diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
index 727c51cc73af..1626ec811a83 100644
--- a/rust/kernel/sync/lock/ww_mutex.rs
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -1,7 +1,437 @@
 // SPDX-License-Identifier: GPL-2.0
 
 //! Rust abstractions for the kernel's wound-wait locking primitives.
+//!
+//! It is designed to avoid deadlocks when locking multiple [`Mutex`]es
+//! that belong to the same [`Class`]. Each lock acquisition uses an
+//! [`AcquireCtx`] to track ordering and ensure forward progress.
+//!
+//! See srctree/Documentation/locking/ww-mutex-design.rst for more details.
 
+use crate::{
+    bindings,
+    container_of,
+    error::to_result,
+    prelude::*,
+    types::{
+        NotThreadSafe,
+        Opaque, //
+    }, //
+};
+use core::{
+    cell::UnsafeCell,
+    marker::PhantomData, //
+};
+
+pub use acquire_ctx::AcquireCtx;
 pub use class::Class;
 
+mod acquire_ctx;
 mod class;
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
+/// use kernel::{
+///     define_ww_class,
+///     sync::{
+///         lock::ww_mutex::{
+///             AcquireCtx,
+///             Class,
+///             Mutex, //
+///         },
+///         Arc,
+///     },
+/// };
+/// use pin_init::stack_pin_init;
+///
+/// define_ww_class!(SOME_WW_CLASS);
+///
+/// let mutex = Arc::pin_init(Mutex::new(42, &SOME_WW_CLASS), GFP_KERNEL)?;
+/// let ctx = KBox::pin_init(AcquireCtx::new(&SOME_WW_CLASS), GFP_KERNEL)?;
+///
+/// // SAFETY: The guard is dropped before `ctx`.
+/// let guard = unsafe { ctx.lock(&mutex) }?;
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
+    /// Tries to lock this [`Mutex`] with no [`AcquireCtx`] and without blocking.
+    ///
+    /// Unlike [`Self::lock`], no deadlock handling is performed.
+    pub fn try_lock(&self) -> Result<MutexGuard<'_, T>> {
+        lock_common(self, None, LockKind::Try)
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
+    /// The caller must ensure that:
+    ///
+    /// - `ptr` is a valid pointer to a `ww_mutex`.
+    /// - `ptr` must remain valid for the lifetime `'a`.
+    /// - ww_class associated with this mutex must be valid for
+    ///   the lifetime `'class`.
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) -> &'a Self {
+        // SAFETY: By the safety contract, the caller guarantees that `ptr`
+        // points to a valid `ww_mutex` which is the `inner` field of `Mutex`,
+        // that it remains valid for the lifetime `'a` and the associated
+        // ww_class outlives `'class`.
+        //
+        // Because [`Mutex`] is `#[repr(C)]`, the `inner` field sits at a
+        // stable offset that `container_of!` can safely rely on.
+        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, inner) }
+    }
+}
+
+// SAFETY: `Mutex` can be sent to another thread if the protected
+// data `T` can be.
+unsafe impl<T: ?Sized + Send> Send for Mutex<'_, T> {}
+
+// SAFETY: `Mutex` serialises access to the protected data, so it is
+// `Sync` as long as the data is `Send`.
+unsafe impl<T: ?Sized + Send> Sync for Mutex<'_, T> {}
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
+impl<'a, T: ?Sized> MutexGuard<'a, T> {
+    /// Creates a new guard for the given [`Mutex`].
+    fn new(mutex: &'a Mutex<'a, T>) -> Self {
+        assert!(mutex.is_locked());
+
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
+    /// If the given pointer refers to a mutex that is not locked,
+    /// returns [`EINVAL`].
+    ///
+    /// This function is intended for interoperability with C code.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that:
+    ///
+    /// - `ptr` is a valid pointer to a `ww_mutex`.
+    /// - `ptr` must remain valid for the lifetime `'b`.
+    /// - The `ww_class` associated with the `ww_mutex` must be valid for the lifetime `'b`.
+    /// - The current task holds the mutex.
+    /// - The caller transfers responsibility for unlocking the mutex to the returned guard
+    ///   and must not unlock it separately (including through another guard).
+    /// - Any associated acquire context remains valid until the mutex is unlocked,
+    ///   even if the returned guard is forgotten. The context must not be finalized or
+    ///   reinitialized before then.
+    pub unsafe fn from_raw<'b>(ptr: *mut bindings::ww_mutex) -> Result<MutexGuard<'b, ()>> {
+        // SAFETY: By this function's safety contract, the caller guarantees that `ptr` points to a
+        // valid `ww_mutex` which is the `inner` field of a `Mutex`. The caller also guarantees
+        // that both `ptr` and the associated `ww_class` are valid for the lifetime `'b`.
+        let mutex = unsafe { Mutex::from_raw(ptr) };
+
+        if !mutex.is_locked() {
+            return Err(EINVAL);
+        }
+
+        Ok(MutexGuard::new(mutex))
+    }
+}
+
+impl<T: ?Sized> core::ops::Deref for MutexGuard<'_, T> {
+    type Target = T;
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: self.mutex is locked, so we have exclusive access.
+        unsafe { &*self.mutex.data.get() }
+    }
+}
+
+impl<T: ?Sized + Unpin> core::ops::DerefMut for MutexGuard<'_, T> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: self.mutex is locked, so we have exclusive access.
+        unsafe { &mut *self.mutex.data.get() }
+    }
+}
+
+impl<T: ?Sized> Drop for MutexGuard<'_, T> {
+    fn drop(&mut self) {
+        // SAFETY: self.mutex is locked and are about to release it.
+        unsafe { bindings::ww_mutex_unlock(self.mutex.inner.get()) };
+    }
+}
+
+// SAFETY: `MutexGuard` can be shared between threads if the data can.
+unsafe impl<T: ?Sized + Sync> Sync for MutexGuard<'_, T> {}
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
+    fn test_ww_mutex_basic_lock_unlock() -> Result {
+        let mutex = Arc::pin_init(Mutex::new(42, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+
+        // SAFETY: The guard is dropped before `ctx`.
+        let guard = unsafe { ctx.lock(&mutex) }?;
+        assert_eq!(*guard, 42);
+
+        // Drop the lock.
+        drop(guard);
+
+        // SAFETY: The guard is dropped before `ctx`.
+        let mut guard = unsafe { ctx.lock(&mutex) }?;
+        *guard = 100;
+        assert_eq!(*guard, 100);
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_ww_mutex_trylock() -> Result {
+        let mutex = Arc::pin_init(Mutex::new(123, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+
+        // `try_lock` on unlocked mutex should succeed.
+        // SAFETY: The guard is dropped before `ctx`.
+        let guard = unsafe { ctx.try_lock(&mutex) }?;
+        assert_eq!(*guard, 123);
+
+        // Now it should fail immediately as it's already locked.
+        // SAFETY: Any returned guard is dropped immediately, before `ctx`.
+        assert!(unsafe { ctx.try_lock(&mutex) }.is_err());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_ww_mutex_is_locked() -> Result {
+        let mutex = Arc::pin_init(Mutex::new("hello", &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+
+        // Should not be locked initially.
+        assert!(!mutex.is_locked());
+
+        // SAFETY: The guard is dropped before `ctx`.
+        let guard = unsafe { ctx.lock(&mutex) }?;
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
+        let mutex1 = Arc::pin_init(Mutex::new(1, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+        let mutex2 = Arc::pin_init(Mutex::new(2, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+
+        // Acquire multiple mutexes with the same context.
+        // SAFETY: The guard is dropped before `ctx`.
+        let guard1 = unsafe { ctx.lock(&mutex1) }?;
+        // SAFETY: The guard is dropped before `ctx`.
+        let guard2 = unsafe { ctx.lock(&mutex2) }?;
+
+        assert_eq!(*guard1, 1);
+        assert_eq!(*guard2, 2);
+
+        ctx.done();
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
+
+    #[test]
+    fn test_guard_from_raw_unlocks_mutex() -> Result {
+        let mutex = Arc::pin_init(Mutex::new((), &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let guard = mutex.lock()?;
+
+        // Keep the mutex locked without leaving another guard responsible for unlocking it.
+        core::mem::forget(guard);
+
+        // SAFETY: `mutex` and its class remain valid for this test. The current task holds
+        // the mutex, and forgetting the previous guard lets this guard take over unlocking it.
+        let guard = unsafe { MutexGuard::from_raw(mutex.inner.get()) }?;
+        assert!(mutex.is_locked());
+
+        drop(guard);
+        assert!(!mutex.is_locked());
+
+        Ok(())
+    }
+}
diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
new file mode 100644
index 000000000000..827604d6b413
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Provides [`AcquireCtx`] for managing multiple wound/wait
+//! mutexes from the same [`Class`].
+
+use super::{
+    lock_common,
+    Class,
+    LockKind,
+    Mutex,
+    MutexGuard, //
+};
+use crate::{
+    bindings,
+    prelude::*,
+    types::Opaque, //
+};
+use core::marker::PhantomData;
+
+/// Groups multiple [`Mutex`]es for deadlock avoidance when acquired
+/// with the same [`Class`].
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{
+///     define_ww_class,
+///     sync::{
+///         lock::ww_mutex::{
+///             AcquireCtx,
+///             Class,
+///             Mutex, //
+///         },
+///         Arc,
+///     },
+/// };
+/// use pin_init::stack_pin_init;
+///
+/// define_ww_class!(SOME_WW_CLASS);
+///
+/// // Create mutexes.
+/// let mutex1 = Arc::pin_init(Mutex::new(1, &SOME_WW_CLASS), GFP_KERNEL)?;
+/// let mutex2 = Arc::pin_init(Mutex::new(2, &SOME_WW_CLASS), GFP_KERNEL)?;
+///
+/// // Create acquire context for deadlock avoidance.
+/// let ctx = KBox::pin_init(AcquireCtx::new(&SOME_WW_CLASS), GFP_KERNEL)?;
+///
+/// // SAFETY: The guard is dropped before `ctx`.
+/// let guard1 = unsafe { ctx.lock(&mutex1) }?;
+/// // SAFETY: The guard is dropped before `ctx`.
+/// let guard2 = unsafe { ctx.lock(&mutex2) }?;
+///
+/// // Mark acquisition phase as complete.
+/// ctx.done();
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
+    pub fn done(&self) {
+        // SAFETY: `self.inner` contains a valid, initialized acquire context.
+        unsafe { bindings::ww_acquire_done(self.inner.get()) };
+    }
+
+    /// Locks the given [`Mutex`] on this [`AcquireCtx`].
+    ///
+    /// # Safety
+    ///
+    /// On success, the caller must keep this context valid until the mutex is unlocked,
+    /// even if the returned guard is forgotten. The context must not be finalized or
+    /// reinitialized while the mutex remains locked.
+    pub unsafe fn lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Result<MutexGuard<'a, T>> {
+        lock_common(mutex, Some(self), LockKind::Regular)
+    }
+
+    /// Similar to [`Self::lock`], but can be interrupted by signals.
+    ///
+    /// # Safety
+    ///
+    /// The same requirements as [`Self::lock`] apply.
+    pub unsafe fn lock_interruptible<'a, T>(
+        &'a self,
+        mutex: &'a Mutex<'a, T>,
+    ) -> Result<MutexGuard<'a, T>> {
+        lock_common(mutex, Some(self), LockKind::Interruptible)
+    }
+
+    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without blocking.
+    ///
+    /// Unlike [`Self::lock`], no deadlock handling is performed.
+    ///
+    /// # Safety
+    ///
+    /// The same requirements as [`Self::lock`] apply.
+    pub unsafe fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a, T>) -> Result<MutexGuard<'a, T>> {
+        lock_common(mutex, Some(self), LockKind::Try)
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for AcquireCtx<'_> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: The locking methods require callers to release all acquired locks
+        // before this context is dropped.
+        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
+    }
+}
-- 
2.51.2

