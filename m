Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510304;
	b=wnPmu4B+/m5UuJ8evxqsaGu2chRdnwr1bGzgmqdKTFeJohzxR89q+pIJK+OMgvE5dUna
	 WQWpL1mnSYqp7kmYQsnbXF+R6n+nqiQJfN3juQJEqSgr8QBaV12/q8sqYysZWzxF8Ihq1
	 hD1XBdtMLUa1+plLhuKwDMkAwxdWAin51iwDRENuBOb68Vesv3tKiDJUPRcrWpzDl2Dl/
	 zjewcmWI/J5oA5yYJORxt/YkKiM0hDD7dMFqpcX5ex+12MVvX67pypKF+oI0kTdfXnQeT
	 v4DFINTq8uRkLpbBIvKcnR/7wIvHznewTe92wKp12kn4Vs8hU1EvflSwQ8SW3om7ItA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510304;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=GhFpatQuguB0Qy+Ol1F7HVOmuK/PMM91MwO3mEyvWcQ=;
	b=mW6AL+wy1GmEmqZN66/SGA7Jcfe/IYXFKi5o+NroIlTxsi/0bVBBWCTDZG3JjPrmCT71
	 8y2uQJYv7u9BHRw9OxNY4DIMon+7JF+xoNthQUzxodYtwNSpdR9TIYeaVsusE4z2Rzu/+
	 DvzzhvzkSzjJZTcRmcVdYgRAnkpexwcaqbAoyimIOFIIy34+W/ZD6tI1obKx2KqBjdDjR
	 wxRJ7+onL1ds2jTSTeDnw1youhzrz2D4NkM/posyECWkAXoMowsLx4vHx4r5PUKXIbD9Y
	 jL+C6q3YCdMGOmN+rHAjjRiv5BHcWxVyJ3srYo9fzYjRHOFB1vdBaAVEto5XcxzHO0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b="ABvE/TnH";
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6960A262C
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 15:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA6960A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=ABvE/TnH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792510301; x=1792769501;
	bh=GhFpatQuguB0Qy+Ol1F7HVOmuK/PMM91MwO3mEyvWcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ABvE/TnHdAfD4t5kvxE/A9kFlODbsiOEN/4nSIc0oyS93VbByZFdK1bwnqrl7+BB3
	 CGISk7uZCHMzn6pl8D89c2MGomR4M574WhlEiE3dYj6bSeDMIFlIhVbSV+47DDFDnV
	 ev0r7aoHcs4pIRRNamQa75g+RsIzWEPrTHLsQ/2PiftIVBlW8EglE6KxQXXV4j5gBP
	 G+JR9rm7fAnERr2dD+0aO20fHf+oweU0/yXrBI6/MeJNgDQQGAdQFRwpT7MK9amr6u
	 gDk+iXdyGA082YzB/1PxCmY9e/+NkgtbyaUTuXBJqm3ARIXjjUO8CyDrt7f/7cwd7T
	 30Io1uu7PQktw==
X-Pm-Submission-Id: 4j8Gbr0yxcz2ScPL
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
Subject: [PATCH v13 5/7] rust: ww_mutex: add AcquireCtxBackoff
Date: Tue, 20 Oct 2026 18:29:41 +0300
Message-ID: <20261020153112.299745-6-work@onurozkan.dev>
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

AcquireCtxBackoff wraps AcquireCtx to remember the contended mutex.
The ww_transaction helper provides deadlock retries with ordinary
guards.

After the caller releases its guards, backoff waits for the contended
mutex. Retries keep the same acquire context and ticket.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock/ww_mutex.rs             |   7 +
 .../sync/lock/ww_mutex/acquire_ctx_backoff.rs | 283 ++++++++++++++++++
 2 files changed, 290 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx_backoff.rs

diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
index 91eaa6cf2a189..2249214959b1c 100644
--- a/rust/kernel/sync/lock/ww_mutex.rs
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -6,6 +6,8 @@
 //! that belong to the same [`Class`]. Each lock acquisition uses an
 //! [`AcquireCtx`] to track ordering and ensure forward progress.
 //!
+//! [`ww_transaction`] provides automatic deadlock recovery for ordinary guards.
+//!
 //! See srctree/Documentation/locking/ww-mutex-design.rst for more details.
 
 use crate::{
@@ -21,9 +23,14 @@
 use core::cell::UnsafeCell;
 
 pub use acquire_ctx::AcquireCtx;
+pub use acquire_ctx_backoff::{
+    ww_transaction,
+    AcquireCtxBackoff, //
+};
 pub use class::Class;
 
 mod acquire_ctx;
+mod acquire_ctx_backoff;
 mod class;
 
 /// A wound-wait (ww) mutex that is powered with deadlock avoidance
diff --git a/rust/kernel/sync/lock/ww_mutex/acquire_ctx_backoff.rs b/rust/kernel/sync/lock/ww_mutex/acquire_ctx_backoff.rs
new file mode 100644
index 0000000000000..71ad1cba37192
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/acquire_ctx_backoff.rs
@@ -0,0 +1,283 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Contended-lock backoff and transaction helpers for wound/wait mutexes.
+
+use super::{
+    AcquireCtx,
+    Class,
+    Mutex,
+    MutexGuard, //
+};
+use crate::prelude::*;
+use core::cell::Cell;
+
+/// An [`AcquireCtx`] that remembers the contended mutex.
+///
+/// After [`Self::lock`] returns [`EDEADLK`], release all guards and call
+/// [`Self::backoff`] before retrying. [`ww_transaction`] handles this retry loop.
+///
+/// Mutexes must outlive this wrapper so they remain valid for retry.
+///
+/// # Invariants
+///
+/// `backoff_guard`, when present, is the sole guard for a mutex locked with `ctx`.
+/// It is released before the context borrow ends. If this wrapper is forgotten,
+/// `AcquireCtx`'s destructor checks for remaining locks.
+pub struct AcquireCtxBackoff<'ctx, 'a> {
+    ctx: Pin<&'ctx mut AcquireCtx>,
+    // The cells also make `'a` invariant: recorded mutexes must outlive retries.
+    contended: Cell<Option<&'a Mutex<()>>>,
+    backoff_guard: Cell<Option<MutexGuard<'a, ()>>>,
+}
+
+impl<'ctx, 'a> AcquireCtxBackoff<'ctx, 'a> {
+    /// Creates a wrapper for an existing [`AcquireCtx`].
+    ///
+    /// Preserves the context's state and ticket.
+    ///
+    /// # Panics
+    ///
+    /// Panics if the context still holds any locks, including forgotten guards.
+    #[inline]
+    pub fn new(ctx: Pin<&'ctx mut AcquireCtx>) -> Self {
+        // INVARIANT: There is no acquired backoff lock yet.
+        let this = Self {
+            ctx,
+            contended: Cell::new(None),
+            backoff_guard: Cell::new(None),
+        };
+        this.assert_no_locks_held();
+        this
+    }
+
+    /// Locks `mutex`, remembering it if the acquisition returns [`EDEADLK`].
+    ///
+    /// Further acquisitions return [`EDEADLK`] until [`Self::backoff`] succeeds.
+    /// A mutex already acquired by the caller returns [`EALREADY`].
+    pub fn lock<'b, T>(&'b self, mutex: &'a Mutex<T>) -> Result<MutexGuard<'b, T>> {
+        if self.contended.get().is_some() {
+            return Err(EDEADLK);
+        }
+
+        if let Some(guard) = self.backoff_guard.take() {
+            if guard.mutex.inner.get() == mutex.inner.get() {
+                // Transfer ownership of the backoff lock.
+                core::mem::forget(guard);
+                return Ok(MutexGuard::new(mutex));
+            }
+            self.backoff_guard.set(Some(guard));
+        }
+
+        match self.ctx.lock(mutex) {
+            Err(e) if e == EDEADLK => {
+                // SAFETY: `mutex` is initialized, remains valid for `'a`, and
+                // its class is static. Only the C mutex is accessed through this view.
+                let mutex = unsafe { Mutex::from_raw(mutex.inner.get()) };
+                self.contended.set(Some(mutex));
+                Err(e)
+            }
+            result => result,
+        }
+    }
+
+    /// Acquires the contended mutex after the caller's guards are released.
+    ///
+    /// The next [`Self::lock`] for this mutex returns its guard without locking
+    /// it again. The context and its ticket are preserved.
+    /// Returns [`EDEADLK`] if no failed acquisition was recorded.
+    ///
+    /// # Panics
+    ///
+    /// Panics if any caller-owned locks are still held, including forgotten guards.
+    pub fn backoff(&self) -> Result {
+        drop(self.backoff_guard.take());
+        self.assert_no_locks_held();
+        let mutex = self.contended.take().ok_or(EDEADLK)?;
+
+        // With no locks held, regular locking waits for this mutex to become available.
+        // INVARIANT: The guard stays in this wrapper until transferred or dropped,
+        // and `Drop` releases it before the borrow of the context ends.
+        let guard = super::lock(mutex, Some(&self.ctx))?;
+        self.backoff_guard.set(Some(guard));
+        Ok(())
+    }
+
+    /// Marks acquisition complete; no more locks may be acquired with this context.
+    #[inline]
+    pub fn done(&self) {
+        self.ctx.done();
+    }
+
+    #[inline]
+    fn assert_no_locks_held(&self) {
+        // SAFETY: This initialized context belongs to the current task.
+        let acquired = unsafe { (*self.ctx.inner.get()).acquired };
+        assert_eq!(acquired, 0, "ww transaction still holds caller-owned locks");
+    }
+}
+
+impl Drop for AcquireCtxBackoff<'_, '_> {
+    #[inline]
+    fn drop(&mut self) {
+        // Release the backoff lock before ending the context borrow.
+        drop(self.backoff_guard.take());
+    }
+}
+
+/// Runs a locking algorithm, backing off and retrying on [`EDEADLK`].
+///
+/// The callback must immediately propagate acquisition errors and drop its guards
+/// on return. It may use the protected data once all needed locks are acquired.
+/// The context is stack allocated, and retries keep the same ticket. Mutexes must
+/// outlive the transaction. Do not nest transactions on the same context.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{
+///     define_ww_class,
+///     prelude::*,
+///     sync::lock::ww_mutex::{
+///         ww_transaction,
+///         Mutex, //
+///     }, //
+/// };
+/// use pin_init::stack_pin_init;
+///
+/// define_ww_class!(CLASS);
+/// stack_pin_init!(let first = Mutex::new(1, &CLASS));
+/// stack_pin_init!(let second = Mutex::new(2, &CLASS));
+/// ww_transaction(&CLASS, |ctx| {
+///     let mut first = ctx.lock(&first)?;
+///     let mut second = ctx.lock(&second)?;
+///     core::mem::swap(&mut *first, &mut *second);
+///     Ok(())
+/// })?;
+/// # Ok::<(), Error>(())
+/// ```
+pub fn ww_transaction<'a, R>(
+    class: &'static Class,
+    mut transaction: impl FnMut(&AcquireCtxBackoff<'_, 'a>) -> Result<R>,
+) -> Result<R> {
+    pin_init::stack_pin_init!(let acquire_ctx = AcquireCtx::new(class));
+    let ctx = AcquireCtxBackoff::new(acquire_ctx.as_mut());
+    retry(&ctx, || transaction(&ctx))
+}
+
+fn retry<R>(
+    ctx: &AcquireCtxBackoff<'_, '_>,
+    mut transaction: impl FnMut() -> Result<R>,
+) -> Result<R> {
+    loop {
+        match transaction() {
+            Err(e) if e == EDEADLK => ctx.backoff()?,
+            result => return result,
+        }
+    }
+}
+
+#[kunit_tests(rust_kernel_ww_transaction)]
+mod tests {
+    use super::*;
+    use crate::define_ww_class;
+    use pin_init::stack_pin_init;
+
+    define_ww_class!(TEST_TRANSACTION_CLASS);
+
+    #[test]
+    fn test_transaction_retry() -> Result {
+        stack_pin_init!(let first = Mutex::new(10, &TEST_TRANSACTION_CLASS));
+        stack_pin_init!(let second = Mutex::new(20, &TEST_TRANSACTION_CLASS));
+        let mut attempts = 0;
+        let mut identity = None;
+
+        let values = ww_transaction(&TEST_TRANSACTION_CLASS, |ctx| {
+            attempts += 1;
+            let ptr = ctx.ctx.inner.get();
+            // SAFETY: The transaction owns this initialized context throughout
+            // the callback, and this task is its only user.
+            let stamp = unsafe { (*ptr).stamp };
+
+            if attempts == 1 {
+                identity = Some((ptr, stamp));
+                let _guard = ctx.lock(&first)?;
+                // Simulate a failed acquisition with its contended mutex recorded.
+                // SAFETY: `second` is initialized, pinned, and outlives the transaction.
+                let mutex = unsafe { Mutex::from_raw(second.inner.get()) };
+                ctx.contended.set(Some(mutex));
+                return Err(EDEADLK);
+            }
+
+            assert_eq!(attempts, 2);
+            assert_eq!(identity, Some((ptr, stamp)));
+            assert!(!first.is_locked());
+            assert!(second.is_locked());
+
+            // Request the contended mutex after acquiring another lock.
+            let mut a = ctx.lock(&first)?;
+            let mut b = ctx.lock(&second)?;
+            assert_eq!(ctx.lock(&second).err(), Some(EALREADY));
+            core::mem::swap(&mut *a, &mut *b);
+            Ok((*a, *b))
+        })?;
+
+        assert_eq!(attempts, 2);
+        assert_eq!(values, (20, 10));
+        assert!(!first.is_locked());
+        assert!(!second.is_locked());
+        Ok(())
+    }
+
+    #[test]
+    fn test_backoff_lock_cleanup() -> Result {
+        stack_pin_init!(let first = Mutex::new(1, &TEST_TRANSACTION_CLASS));
+        stack_pin_init!(let contended = Mutex::new(2, &TEST_TRANSACTION_CLASS));
+
+        // Release the unclaimed backoff lock on both success and error.
+        for fail in [false, true] {
+            let mut attempts = 0;
+            let result = ww_transaction(&TEST_TRANSACTION_CLASS, |ctx| {
+                attempts += 1;
+                let _guard = ctx.lock(&first)?;
+                if attempts == 1 {
+                    // SAFETY: `contended` is initialized, pinned, and outlives the transaction.
+                    let mutex = unsafe { Mutex::from_raw(contended.inner.get()) };
+                    ctx.contended.set(Some(mutex));
+                    return Err(EDEADLK);
+                }
+
+                assert_eq!(attempts, 2);
+                assert!(contended.is_locked());
+                if fail {
+                    Err(EINVAL)
+                } else {
+                    Ok(())
+                }
+            });
+
+            assert_eq!(result, if fail { Err(EINVAL) } else { Ok(()) });
+            assert_eq!(attempts, 2);
+            assert!(!first.is_locked());
+            assert!(!contended.is_locked());
+        }
+        Ok(())
+    }
+
+    #[test]
+    fn test_deadlock_without_contention() -> Result {
+        stack_pin_init!(let mutex = Mutex::new(5, &TEST_TRANSACTION_CLASS));
+        let mut attempts = 0;
+
+        let result: Result = ww_transaction(&TEST_TRANSACTION_CLASS, |ctx| {
+            attempts += 1;
+            let _guard = ctx.lock(&mutex)?;
+            // A callback-generated EDEADLK cannot identify a lock to wait for.
+            Err(if attempts == 1 { EDEADLK } else { EINVAL })
+        });
+
+        assert_eq!(result, Err(EDEADLK));
+        assert_eq!(attempts, 1);
+        assert!(!mutex.is_locked());
+        Ok(())
+    }
+}
-- 
2.51.2

