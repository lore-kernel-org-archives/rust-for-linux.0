Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510300;
	b=J6oaNYCbTrz6yATiH15otfZiWw/Dmol0dmGIO0a/K5f4eygAMbLLPBy/lg2CypoE3lSk
	 gSbbWSHyio53lgNeNy1WCLW2pmDbJj1FkZ7JMzX8RWs/fl6ul3JXyII02FdaQc0Bojgc9
	 qYe+iAL3YvmTOqF6lx0Qhij2gEvRl43UFCELGq4mggKnldHUJeVjTyLRVNIMnUbLk68WP
	 +TT07H58TvnRNtlzj2QNjs9awG7kMheylx7i6QVnYSRRccPOivGF0UrMYhdOIct0CFvMk
	 0jvGA2VSkT8cPxHIsfxm9KZdLFSLYu6ArCN7YtSrAlTE7GLDmRDh+y06cZgriEPQR9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510300;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ZbThbmpySPWpvkpJSYqpQSNbvUjssjuJKdv2vpTlQwQ=;
	b=YQKgMLf0TmJ9/gsuVzBLRl2y0cu5uyeN+FIFAyY9JAxr4DvypghUXUejGt2nppBC8f9b
	 vV9KcNh5GZd1m1aA3NOeJm8aaJNszx/V6KSyxrNE5ZxVuH0oLGvZ1bmRLaLql1vWW9IMr
	 Y6rRz3BHeVffe1lL9h8clNW81iUzrn8z2vTlthA2xKc8wFtVD1krN7z4BLZS6pCSa7v2d
	 Bz4KT0Hb2G+EH/Gk3Cu7PULu3FmNoey1LBNHMp7LkXkG77Yn0M4ZN+eMFwIb290YkX3uG
	 e5+sQ80+THjvYBtu29dDU+QaG5zTcogFIsuKJMAbJBJI3Q6925hOeiE3b2y+bcVknSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b="CjoE/t4X";
	arc=none smtp.remote-ip=185.70.43.172
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E764A60A2617
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 15:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E764A60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=CjoE/t4X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792510296; x=1792769496;
	bh=ZbThbmpySPWpvkpJSYqpQSNbvUjssjuJKdv2vpTlQwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CjoE/t4X/e7DPX/m3K7p0ybwb4akHoLQ62T9rRzvoVY+pCNBlc48dh3/50dMmWYtP
	 q+xAM+cTTHCmad6hT5FaefDStl3mi1R1VtXatE/JQNXJ0eiYQqQeGj/HnuCj67xHAg
	 U+OM66VQfHKd2JlnUe6AUs99CejZndfB0If/as2gxbExvQeT8HHYLcoufUUvO2FV0Z
	 /NmEmpI2v6y46d+CS0dHKoJ34+6sfZIvEYWK+9Ep+/KycS2yleIR9R4vWZcm35KSfR
	 gAAms+demBgTD4NVT+7BpFzTGCapZ0F0k3jHrCqAz1UtK0Mqfn0+1wumtnD8lFIh05
	 5zTu2xQ05ie1A==
X-Pm-Submission-Id: 4j8Gbm0wx2z2ScPc
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
Subject: [PATCH v13 4/7] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
Date: Tue, 20 Oct 2026 18:29:40 +0300
Message-ID: <20261020153112.299745-5-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20261020153112.299745-1-work@onurozkan.dev>
References: <20261020153112.299745-1-work@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Covers the low-level locking API (lock, try_lock and
interruptible variants) and integration with kernel bindings.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock/ww_mutex.rs             | 431 ++++++++++++++++++
 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs | 179 ++++++++
 2 files changed, 610 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs

diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
index 727c51cc73af8..91eaa6cf2a189 100644
--- a/rust/kernel/sync/lock/ww_mutex.rs
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -1,7 +1,438 @@
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
+use core::cell::UnsafeCell;
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
+/// let guard = ctx.lock(&mutex)?;
+/// assert_eq!(*guard, 42);
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data]
+#[repr(C)]
+pub struct Mutex<T: ?Sized> {
+    #[pin]
+    inner: Opaque<bindings::ww_mutex>,
+    data: UnsafeCell<T>,
+}
+
+impl<T> Mutex<T> {
+    /// Initializes [`Mutex`] with the given `data` and [`Class`].
+    #[inline]
+    pub fn new(data: T, class: &'static Class) -> impl PinInit<Self> {
+        let class_ptr = class.inner.get();
+        pin_init!(Mutex {
+            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_mutex| {
+                // SAFETY: `class` is valid indefinitely.
+                unsafe { bindings::ww_mutex_init(slot, class_ptr) }
+            }),
+            data: UnsafeCell::new(data),
+        })
+    }
+}
+
+impl<T: ?Sized> Mutex<T> {
+    /// Checks if this [`Mutex`] is currently locked.
+    ///
+    /// The returned value is racy as another thread can acquire
+    /// or release the lock immediately after this call returns.
+    #[inline]
+    pub fn is_locked(&self) -> bool {
+        // SAFETY: It's safe to call `ww_mutex_is_locked` on
+        // a valid mutex.
+        unsafe { bindings::ww_mutex_is_locked(self.inner.get()) }
+    }
+
+    /// Locks this [`Mutex`] without [`AcquireCtx`].
+    #[inline]
+    pub fn lock(&self) -> Result<MutexGuard<'_, T>> {
+        lock(self, None)
+    }
+
+    /// Similar to [`Self::lock`], but can be interrupted by signals.
+    #[inline]
+    pub fn lock_interruptible(&self) -> Result<MutexGuard<'_, T>> {
+        lock_interruptible(self, None)
+    }
+
+    /// Tries to lock this [`Mutex`] with no [`AcquireCtx`] and without blocking.
+    ///
+    /// Returns `None` if the mutex could not be acquired.
+    #[must_use = "if unused, the lock will be immediately unlocked"]
+    #[inline]
+    pub fn try_lock(&self) -> Option<MutexGuard<'_, T>> {
+        try_lock(self, None)
+    }
+}
+
+impl Mutex<()> {
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
+    /// - The `ww_class` associated with this mutex must be valid indefinitely.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) -> &'a Self {
+        // SAFETY: By the safety contract, the caller guarantees that `ptr`
+        // points to a valid `ww_mutex` which is the `inner` field of `Mutex`,
+        // that it remains valid for the lifetime `'a` and the associated
+        // `ww_class` remains valid indefinitely.
+        //
+        // Because [`Mutex`] is `#[repr(C)]`, the `inner` field sits at a
+        // stable offset that `container_of!` can safely rely on.
+        unsafe { &*container_of!(Opaque::cast_from(ptr), Self, inner) }
+    }
+}
+
+// SAFETY: `Mutex` can be sent to another thread if the protected
+// data `T` can be.
+unsafe impl<T: ?Sized + Send> Send for Mutex<T> {}
+
+// SAFETY: `Mutex` serialises access to the protected data, so it is
+// `Sync` as long as the data is `Send`.
+unsafe impl<T: ?Sized + Send> Sync for Mutex<T> {}
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
+    mutex: &'a Mutex<T>,
+    _not_send: NotThreadSafe,
+}
+
+impl<'a, T: ?Sized> MutexGuard<'a, T> {
+    /// Creates a new guard for the given [`Mutex`].
+    #[inline]
+    fn new(mutex: &'a Mutex<T>) -> Self {
+        debug_assert!(mutex.is_locked());
+
+        // INVARIANT: Locking and `from_raw` ensure that the current task holds the mutex
+        // and transfer sole responsibility for unlocking it to this guard.
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
+    /// The caller must ensure that:
+    ///
+    /// - `ptr` is a valid pointer to a `ww_mutex`.
+    /// - `ptr` must remain valid for the lifetime `'b`.
+    /// - The `ww_class` associated with the `ww_mutex` must be valid indefinitely.
+    /// - The current task holds the mutex.
+    /// - The caller transfers responsibility for unlocking the mutex to the returned guard
+    ///   and must not unlock it separately (including through another guard).
+    /// - Any associated acquire context remains valid until the mutex is unlocked,
+    ///   even if the returned guard is forgotten. The context must not be finalized or
+    ///   reinitialized before then.
+    #[inline]
+    pub unsafe fn from_raw<'b>(ptr: *mut bindings::ww_mutex) -> MutexGuard<'b, ()> {
+        // SAFETY: By this function's safety contract, the caller guarantees that `ptr` points to a
+        // valid `ww_mutex` which is the `inner` field of a `Mutex`. The caller also guarantees
+        // that `ptr` is valid for the lifetime `'b` and its `ww_class` is valid indefinitely.
+        let mutex = unsafe { Mutex::from_raw(ptr) };
+
+        MutexGuard::new(mutex)
+    }
+}
+
+impl<T: ?Sized> core::ops::Deref for MutexGuard<'_, T> {
+    type Target = T;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: self.mutex is locked, so we have exclusive access.
+        unsafe { &*self.mutex.data.get() }
+    }
+}
+
+impl<T: ?Sized + Unpin> core::ops::DerefMut for MutexGuard<'_, T> {
+    #[inline]
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: self.mutex is locked, so we have exclusive access.
+        unsafe { &mut *self.mutex.data.get() }
+    }
+}
+
+impl<T: ?Sized> Drop for MutexGuard<'_, T> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: self.mutex is locked and are about to release it.
+        unsafe { bindings::ww_mutex_unlock(self.mutex.inner.get()) };
+    }
+}
+
+// SAFETY: `MutexGuard` can be shared between threads if the data can.
+unsafe impl<T: ?Sized + Sync> Sync for MutexGuard<'_, T> {}
+
+/// Locks a mutex with an optional acquire context.
+#[inline]
+fn lock<'a, T: ?Sized>(mutex: &'a Mutex<T>, ctx: Option<&AcquireCtx>) -> Result<MutexGuard<'a, T>> {
+    let ctx_ptr = match ctx {
+        Some(ctx) => {
+            ctx.validate_mutex(mutex)?;
+            ctx.inner.get()
+        }
+        None => core::ptr::null_mut(),
+    };
+
+    // SAFETY: `mutex` is pinned and valid. `ctx_ptr` is null or refers to a pinned context of
+    // the same class. Callers keep the context valid until the mutex is unlocked.
+    let ret = unsafe { bindings::ww_mutex_lock(mutex.inner.get(), ctx_ptr) };
+    to_result(ret)?;
+
+    Ok(MutexGuard::new(mutex))
+}
+
+/// Locks a mutex with an optional acquire context, allowing interruption by signals.
+#[inline]
+fn lock_interruptible<'a, T: ?Sized>(
+    mutex: &'a Mutex<T>,
+    ctx: Option<&AcquireCtx>,
+) -> Result<MutexGuard<'a, T>> {
+    let ctx_ptr = match ctx {
+        Some(ctx) => {
+            ctx.validate_mutex(mutex)?;
+            ctx.inner.get()
+        }
+        None => core::ptr::null_mut(),
+    };
+
+    // SAFETY: `mutex` is pinned and valid. `ctx_ptr` is null or refers to a pinned context of
+    // the same class. Callers keep the context valid until the mutex is unlocked.
+    let ret = unsafe { bindings::ww_mutex_lock_interruptible(mutex.inner.get(), ctx_ptr) };
+    to_result(ret)?;
+
+    Ok(MutexGuard::new(mutex))
+}
+
+/// Tries to lock a mutex with an optional acquire context without blocking.
+#[inline]
+fn try_lock<'a, T: ?Sized>(
+    mutex: &'a Mutex<T>,
+    ctx: Option<&AcquireCtx>,
+) -> Option<MutexGuard<'a, T>> {
+    let ctx_ptr = match ctx {
+        Some(ctx) => {
+            ctx.validate_mutex(mutex).ok()?;
+            ctx.inner.get()
+        }
+        None => core::ptr::null_mut(),
+    };
+
+    // SAFETY: `mutex` is pinned and valid. `ctx_ptr` is null or refers to a pinned context of
+    // the same class. Callers keep the context valid until the mutex is unlocked.
+    let ret = unsafe { bindings::ww_mutex_trylock(mutex.inner.get(), ctx_ptr) };
+
+    if ret != 0 {
+        Some(MutexGuard::new(mutex))
+    } else {
+        None
+    }
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
+        let mutex = Arc::pin_init(Mutex::new(123, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+
+        // `try_lock` on unlocked mutex should succeed.
+        let guard = ctx.try_lock(&mutex).ok_or(EBUSY)?;
+        assert_eq!(*guard, 123);
+
+        // Now it should fail immediately as it's already locked.
+        assert!(ctx.try_lock(&mutex).is_none());
+
+        drop(guard);
+        assert!(ctx.try_lock(&mutex).is_some());
+
+        Ok(())
+    }
+
+    #[test]
+    fn test_ww_mutex_class_mismatch() -> Result {
+        let mutex = Arc::pin_init(Mutex::new(123, &TEST_WOUND_WAIT_CLASS), GFP_KERNEL)?;
+        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+
+        assert_eq!(ctx.lock(&mutex).err(), Some(EINVAL));
+        assert_eq!(ctx.lock_interruptible(&mutex).err(), Some(EINVAL));
+        assert!(ctx.try_lock(&mutex).is_none());
+        assert!(!mutex.is_locked());
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
+        let mutex1 = Arc::pin_init(Mutex::new(1, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+        let mutex2 = Arc::pin_init(Mutex::new(2, &TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+        let ctx = KBox::pin_init(AcquireCtx::new(&TEST_WAIT_DIE_CLASS), GFP_KERNEL)?;
+
+        // Acquire multiple mutexes with the same context.
+        let guard1 = ctx.lock(&mutex1)?;
+        let guard2 = ctx.lock(&mutex2)?;
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
+        assert!(mutex.try_lock().is_none());
+
+        drop(guard);
+        assert!(!mutex.is_locked());
+
+        let guard = mutex.try_lock().ok_or(EBUSY)?;
+        assert_eq!(*guard, 100);
+        drop(guard);
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
+        let guard = unsafe { MutexGuard::from_raw(mutex.inner.get()) };
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
index 0000000000000..777d177f985ff
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Provides [`AcquireCtx`] for managing multiple wound/wait
+//! mutexes from the same [`Class`].
+
+use super::{
+    lock,
+    lock_interruptible,
+    try_lock,
+    Class,
+    Mutex,
+    MutexGuard, //
+};
+use crate::{
+    bindings,
+    prelude::*,
+    types::Opaque, //
+};
+
+/// Groups multiple [`Mutex`]es for deadlock avoidance when acquired
+/// with the same [`Class`].
+///
+/// Dropping the context panics if any mutex acquired with it is still locked.
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
+/// let guard1 = ctx.lock(&mutex1)?;
+/// let guard2 = ctx.lock(&mutex2)?;
+///
+/// // Mark acquisition phase as complete.
+/// ctx.done();
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data(PinnedDrop)]
+#[repr(transparent)]
+pub struct AcquireCtx {
+    #[pin]
+    pub(super) inner: Opaque<bindings::ww_acquire_ctx>,
+}
+
+impl AcquireCtx {
+    /// Initializes a new [`AcquireCtx`] with the given [`Class`].
+    #[inline]
+    pub fn new(class: &'static Class) -> impl PinInit<Self> {
+        let class_ptr = class.inner.get();
+        pin_init!(AcquireCtx {
+            inner <- Opaque::ffi_init(|slot: *mut bindings::ww_acquire_ctx| {
+                // SAFETY: `class` is valid indefinitely.
+                unsafe { bindings::ww_acquire_init(slot, class_ptr) }
+            }),
+        })
+    }
+
+    /// Creates a [`AcquireCtx`] from a raw pointer.
+    ///
+    /// This function is intended for interoperability with C code.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` points to the `inner` field of an initialized
+    /// [`AcquireCtx`] belonging to the current task. The context must remain pinned
+    /// and valid for the lifetime `'a` and until all mutexes acquired with it are
+    /// unlocked, even if their guards are forgotten. It must not be finalized or
+    /// reinitialized during that time.
+    /// The associated `ww_class` must be valid indefinitely.
+    #[inline]
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
+    #[inline]
+    pub fn done(&self) {
+        // SAFETY: `self.inner` contains a valid, initialized acquire context.
+        unsafe { bindings::ww_acquire_done(self.inner.get()) };
+    }
+
+    /// Locks the given [`Mutex`] on this [`AcquireCtx`].
+    #[inline]
+    pub fn lock<'a, T>(&'a self, mutex: &'a Mutex<T>) -> Result<MutexGuard<'a, T>> {
+        lock(mutex, Some(self))
+    }
+
+    /// Similar to [`Self::lock`], but can be interrupted by signals.
+    #[inline]
+    pub fn lock_interruptible<'a, T>(&'a self, mutex: &'a Mutex<T>) -> Result<MutexGuard<'a, T>> {
+        lock_interruptible(mutex, Some(self))
+    }
+
+    /// Tries to lock the [`Mutex`] on this [`AcquireCtx`] without blocking.
+    ///
+    /// Unlike [`Self::lock`], no deadlock handling is performed.
+    ///
+    /// Returns `None` if the mutex belongs to a different [`Class`] or could not
+    /// be acquired.
+    #[must_use = "if unused, the lock will be immediately unlocked"]
+    #[inline]
+    pub fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<T>) -> Option<MutexGuard<'a, T>> {
+        try_lock(mutex, Some(self))
+    }
+
+    /// Checks the mutex's class and the acquired-lock count.
+    ///
+    /// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`] or
+    /// [`EOVERFLOW`] if the acquired-lock count cannot be incremented.
+    #[inline]
+    pub(super) fn validate_mutex<T: ?Sized>(&self, mutex: &Mutex<T>) -> Result {
+        let ctx_ptr = self.inner.get();
+        let mutex_ptr = mutex.inner.get();
+
+        // SAFETY: `ctx_ptr` is a valid pointer for the entire lifetime of `self`.
+        let ctx_class = unsafe { (*ctx_ptr).ww_class };
+
+        // SAFETY: `mutex_ptr` is a valid pointer for the entire lifetime of `mutex`.
+        let mutex_class = unsafe { (*mutex_ptr).ww_class };
+
+        // `self` and `mutex` must use the same class.
+        if ctx_class != mutex_class {
+            return Err(EINVAL);
+        }
+
+        // Check for overflow of the count checked by `AcquireCtx`'s destructor.
+        // SAFETY: `ctx_ptr` points to a valid context owned by the current task.
+        if unsafe { (*ctx_ptr).acquired } == u32::MAX {
+            return Err(EOVERFLOW);
+        }
+
+        Ok(())
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for AcquireCtx {
+    #[inline]
+    fn drop(self: Pin<&mut Self>) {
+        let ptr = self.inner.get();
+        // SAFETY: `ptr` points to this initialized context, owned by the current task.
+        let acquired = unsafe { (*ptr).acquired };
+        assert_eq!(
+            acquired, 0,
+            "ww acquire context dropped with locked mutexes"
+        );
+
+        // SAFETY: The assertion above ensures that all acquired locks were released.
+        unsafe { bindings::ww_acquire_fini(ptr) };
+    }
+}
-- 
2.51.2

