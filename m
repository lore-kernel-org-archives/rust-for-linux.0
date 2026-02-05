Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5B032F764
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770324454; cv=none; b=N02fN8p8us9mL37vTITJymi3KxYoRhG+H5xB9WKI+xVrcHtq+whEfd+DvhAAt3s9Dec1EvvnL/Ig/XbcZzuityBmHbKrFVIRKDnx7b16Dr0TBAGm12/Re/0KU8JTnMHRMuPBLoN8onqvuBQ1WgX018D0bUBmhxCBt/qpz53lSWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770324454; c=relaxed/simple;
	bh=v+DCi/hzLJkJ/b32X85KNK/8hEmuzwviMqhmRqUwcwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ulFXAFTqm4aOhe31UmTNpQ0xfyFsw29pt+Sv91zUZdysi6XBjmgyOBUYK3WKRIMdojxI4+w7gFwfa91AFRnE2LBWDoX39CC6qcD9j3e7gnkASEdWIQBF+T8xRx/xb4whZxofHh9Bz7d73kiN3fjL5fFJZMqYeLeGZklzSiFnwMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eOpTCEg5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eOpTCEg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770324453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x96nRVCgkq5io+ucQyqbDW4fy4k6BOi/8ORsc1oyY6U=;
	b=eOpTCEg5RKxCcUfebBpRS3fBGUmBN2HH5sDSp8vwa2K4FlUrAf5Vp/Ia3ngKzvAxbpeAVb
	z91ZSSGHLbPXr8dVnTY6QklZqs0iIzgN3/XVRHa9SNOyGYU7Y48EC/hHWgOP6iU9Ew0i2k
	3nzlg2SWErXETpPV0xYx8Y6cA6YXUiI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-132-eDkQZMWwNXqW0ax-INw9fA-1; Thu,
 05 Feb 2026 15:47:29 -0500
X-MC-Unique: eDkQZMWwNXqW0ax-INw9fA-1
X-Mimecast-MFC-AGG-ID: eDkQZMWwNXqW0ax-INw9fA_1770324447
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1A2D18003F6;
	Thu,  5 Feb 2026 20:47:26 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.82.65])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D40819560A7;
	Thu,  5 Feb 2026 20:47:24 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v18 4/5] rust: sync: Add SpinLockIrq
Date: Thu,  5 Feb 2026 15:44:30 -0500
Message-ID: <20260205204709.528234-5-lyude@redhat.com>
In-Reply-To: <20260205204709.528234-1-lyude@redhat.com>
References: <20260205204709.528234-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: m4EqnP6w5XZF5gU7CBY2V3zW2pjk6arslv92enE_FqI_1770324447
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

A variant of `SpinLock` that ensures interrupts are disabled in the
critical section. `lock()` will ensure that either interrupts are already
disabled or disable them. `unlock()` will reverse the respective operation.

[Boqun: Port to use spin_lock_irq_disable() and
spin_unlock_irq_enable()]

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

---
V10:
* Also add support to GlobalLock
* Documentation fixes from Dirk
V11:
* Add unit test requested by Daniel Almeida
V14:
* Improve rustdoc for SpinLockIrqBackend
V17:
* Update Git summary according to Benno's review
V18:
* Add missing comment change requested by Benno in V16

 rust/kernel/sync.rs               |   4 +-
 rust/kernel/sync/lock/global.rs   |   3 +
 rust/kernel/sync/lock/spinlock.rs | 228 ++++++++++++++++++++++++++++++
 3 files changed, 234 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 993dbf2caa0e3..58af785d62b99 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -27,7 +27,9 @@
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
 pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
 pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
-pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
+pub use lock::spinlock::{
+    new_spinlock, new_spinlock_irq, SpinLock, SpinLockGuard, SpinLockIrq, SpinLockIrqGuard,
+};
 pub use locked_by::LockedBy;
 pub use refcount::Refcount;
 pub use set_once::SetOnce;
diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/global.rs
index aecbdc34738fb..32efcbc870500 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -304,4 +304,7 @@ macro_rules! global_lock_inner {
     (backend SpinLock) => {
         $crate::sync::lock::spinlock::SpinLockBackend
     };
+    (backend SpinLockIrq) => {
+        $crate::sync::lock::spinlock::SpinLockIrqBackend
+    };
 }
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index d75af32218bae..f11a84505ba0e 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -4,6 +4,7 @@
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
 use super::*;
+use crate::prelude::*;
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -143,3 +144,230 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
         unsafe { bindings::spin_assert_is_held(ptr) }
     }
 }
+
+/// Creates a [`SpinLockIrq`] initialiser with the given name and a newly-created lock class.
+///
+/// It uses the name if one is given, otherwise it generates one based on the file name and line
+/// number.
+#[macro_export]
+macro_rules! new_spinlock_irq {
+    ($inner:expr $(, $name:literal)? $(,)?) => {
+        $crate::sync::SpinLockIrq::new(
+            $inner, $crate::optional_name!($($name)?), $crate::static_lock_class!())
+    };
+}
+pub use new_spinlock_irq;
+
+/// A variant of `SpinLock` that ensures interrupts are disabled in the critical section.
+///
+/// This is a version of [`SpinLock`] that can only be used in contexts where interrupts for the
+/// local CPU are disabled. It can be acquired in two ways:
+///
+/// - Using [`lock()`] like any other type of lock, in which case the bindings will modify the
+///   interrupt state to ensure that local processor interrupts remain disabled for at least as long
+///   as the [`SpinLockIrqGuard`] exists.
+/// - Using [`lock_with()`] in contexts where a [`LocalInterruptDisabled`] token is present and
+///   local processor interrupts are already known to be disabled, in which case the local interrupt
+///   state will not be touched. This method should be preferred if a [`LocalInterruptDisabled`]
+///   token is present in the scope.
+///
+/// For more info on spinlocks, see [`SpinLock`]. For more information on interrupts,
+/// [see the interrupt module](kernel::interrupt).
+///
+/// # Examples
+///
+/// The following example shows how to declare, allocate initialise and access a struct (`Example`)
+/// that contains an inner struct (`Inner`) that is protected by a spinlock that requires local
+/// processor interrupts to be disabled.
+///
+/// ```
+/// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
+///
+/// struct Inner {
+///     a: u32,
+///     b: u32,
+/// }
+///
+/// #[pin_data]
+/// struct Example {
+///     #[pin]
+///     c: SpinLockIrq<Inner>,
+///     #[pin]
+///     d: SpinLockIrq<Inner>,
+/// }
+///
+/// impl Example {
+///     fn new() -> impl PinInit<Self> {
+///         pin_init!(Self {
+///             c <- new_spinlock_irq!(Inner { a: 0, b: 10 }),
+///             d <- new_spinlock_irq!(Inner { a: 20, b: 30 }),
+///         })
+///     }
+/// }
+///
+/// // Allocate a boxed `Example`
+/// let e = KBox::pin_init(Example::new(), GFP_KERNEL)?;
+///
+/// // Accessing an `Example` from a context where interrupts may not be disabled already.
+/// let c_guard = e.c.lock(); // interrupts are disabled now, +1 interrupt disable refcount
+/// let d_guard = e.d.lock(); // no interrupt state change, +1 interrupt disable refcount
+///
+/// assert_eq!(c_guard.a, 0);
+/// assert_eq!(c_guard.b, 10);
+/// assert_eq!(d_guard.a, 20);
+/// assert_eq!(d_guard.b, 30);
+///
+/// drop(c_guard); // Dropping c_guard will not re-enable interrupts just yet, since d_guard is
+///                // still in scope.
+/// drop(d_guard); // Last interrupt disable reference dropped here, so interrupts are re-enabled
+///                // now
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// [`lock()`]: SpinLockIrq::lock
+/// [`lock_with()`]: SpinLockIrq::lock_with
+pub type SpinLockIrq<T> = super::Lock<T, SpinLockIrqBackend>;
+
+/// A kernel `spinlock_t` lock backend that can only be acquired in interrupt disabled contexts.
+pub struct SpinLockIrqBackend;
+
+/// A [`Guard`] acquired from locking a [`SpinLockIrq`] using [`lock()`].
+///
+/// This is simply a type alias for a [`Guard`] returned from locking a [`SpinLockIrq`] using
+/// [`lock_with()`]. It will unlock the [`SpinLockIrq`] and decrement the local processor's
+/// interrupt disablement refcount upon being dropped.
+///
+/// [`lock()`]: SpinLockIrq::lock
+/// [`lock_with()`]: SpinLockIrq::lock_with
+pub type SpinLockIrqGuard<'a, T> = Guard<'a, T, SpinLockIrqBackend>;
+
+// SAFETY: The underlying kernel `spinlock_t` object ensures mutual exclusion. `relock` uses the
+// default implementation that always calls the same locking method.
+unsafe impl Backend for SpinLockIrqBackend {
+    type State = bindings::spinlock_t;
+    type GuardState = ();
+
+    unsafe fn init(
+        ptr: *mut Self::State,
+        name: *const crate::ffi::c_char,
+        key: *mut bindings::lock_class_key,
+    ) {
+        // SAFETY: The safety requirements ensure that `ptr` is valid for writes, and `name` and
+        // `key` are valid for read indefinitely.
+        unsafe { bindings::__spin_lock_init(ptr, name, key) }
+    }
+
+    unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState {
+        // SAFETY: The safety requirements of this function ensure that `ptr` points to valid
+        // memory, and that it has been initialised before.
+        unsafe { bindings::spin_lock_irq_disable(ptr) }
+    }
+
+    unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
+        // SAFETY: The safety requirements of this function ensure that `ptr` is valid and that the
+        // caller is the owner of the spinlock.
+        unsafe { bindings::spin_unlock_irq_enable(ptr) }
+    }
+
+    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
+        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
+        let result = unsafe { bindings::spin_trylock_irq_disable(ptr) };
+
+        if result != 0 {
+            Some(())
+        } else {
+            None
+        }
+    }
+
+    unsafe fn assert_is_held(ptr: *mut Self::State) {
+        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
+        unsafe { bindings::spin_assert_is_held(ptr) }
+    }
+}
+
+#[kunit_tests(rust_spinlock_irq_condvar)]
+mod tests {
+    use super::*;
+    use crate::{
+        sync::*,
+        workqueue::{self, impl_has_work, new_work, Work, WorkItem},
+    };
+
+    struct TestState {
+        value: u32,
+        waiter_ready: bool,
+    }
+
+    #[pin_data]
+    struct Test {
+        #[pin]
+        state: SpinLockIrq<TestState>,
+
+        #[pin]
+        state_changed: CondVar,
+
+        #[pin]
+        waiter_state_changed: CondVar,
+
+        #[pin]
+        wait_work: Work<Self>,
+    }
+
+    impl_has_work! {
+        impl HasWork<Self> for Test { self.wait_work }
+    }
+
+    impl Test {
+        pub(crate) fn new() -> Result<Arc<Self>> {
+            Arc::try_pin_init(
+                try_pin_init!(
+                    Self {
+                        state <- new_spinlock_irq!(TestState {
+                            value: 1,
+                            waiter_ready: false
+                        }),
+                        state_changed <- new_condvar!(),
+                        waiter_state_changed <- new_condvar!(),
+                        wait_work <- new_work!("IrqCondvarTest::wait_work")
+                    }
+                ),
+                GFP_KERNEL,
+            )
+        }
+    }
+
+    impl WorkItem for Test {
+        type Pointer = Arc<Self>;
+
+        fn run(this: Arc<Self>) {
+            // Wait for the test to be ready to wait for us
+            let mut state = this.state.lock();
+
+            while !state.waiter_ready {
+                this.waiter_state_changed.wait(&mut state);
+            }
+
+            // Deliver the exciting value update our test has been waiting for
+            state.value += 1;
+            this.state_changed.notify_sync();
+        }
+    }
+
+    #[test]
+    fn spinlock_irq_condvar() -> Result {
+        let testdata = Test::new()?;
+
+        let _ = workqueue::system().enqueue(testdata.clone());
+
+        // Let the updater know when we're ready to wait
+        let mut state = testdata.state.lock();
+        state.waiter_ready = true;
+        testdata.waiter_state_changed.notify_sync();
+
+        // Wait for the exciting value update
+        testdata.state_changed.wait(&mut state);
+        assert_eq!(state.value, 2);
+        Ok(())
+    }
+}
-- 
2.53.0

