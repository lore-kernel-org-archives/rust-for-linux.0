Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0DC33D4FE
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493745; cv=none; b=bhafk8RPFJGWOITZK262Y4RtTz6okhggMEUz133MaTyK01/5uFV2jjQ4vlFXPhRnFYC1GqTC85BRDVa8UKqvOP6k8T0WPb4k80dt3tCfR9hCWfXEJ3gROPTTeECiDI1yppb5uD8irBiH7SlFgSeACB7OIaGAY2s2dBFSzMIPN9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493745; c=relaxed/simple;
	bh=vhX36MQZVGpWzaIVv8Frgf/s2WraBLGaWw9FzlVCjHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=adVR2Qw4T7aYmZcZEus76YKb5PmB1Li2MKohb1WgWpJOoEFAkISENCTp8fSzdZFaiEyz5RL31UqHYyXbJE6O11h+NW0ZESB19+EuEPGtDOX32PgznC0+8otCE7kFRfzv0y+ESqYzWGebs2NtyvDqQw0D5jvXuyQPMqTzlrFhAI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhDyR51I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhDyR51I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772493743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=13VTjGFUdPQkTTMndfPOfbIQCqCjOBqVYS+4lJ2byuA=;
	b=BhDyR51IqnG8EAgfwu1i/CE0qAI1SToQURIDRI25QCI78YoC1NJZvp8XFNJozlUMs8zczP
	cKew2Rc2rwdgSC3PVgF6gHGeC0RAE7X5pj/ZBC3fcmHimwBrW00NHKIJc7L5Vnzq8/Uqp0
	Ci2L6ionhtrQL57+kqXEUHcnvsTh77M=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-263-Y_Qn3-4QNtOdknxoCB-y8w-1; Mon,
 02 Mar 2026 18:22:17 -0500
X-MC-Unique: Y_Qn3-4QNtOdknxoCB-y8w-1
X-Mimecast-MFC-AGG-ID: Y_Qn3-4QNtOdknxoCB-y8w_1772493735
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5DE5C1800451;
	Mon,  2 Mar 2026 23:22:15 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.90.7])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 96AC41800576;
	Mon,  2 Mar 2026 23:22:12 +0000 (UTC)
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
Subject: [PATCH v19 4/5] rust: sync: Add SpinLockIrq
Date: Mon,  2 Mar 2026 18:16:47 -0500
Message-ID: <20260302232154.861916-5-lyude@redhat.com>
In-Reply-To: <20260302232154.861916-1-lyude@redhat.com>
References: <20260302232154.861916-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 3LJSINRR4VTYUIitWKdOuCH1dUJ-dAniVzVSyLfXm7I_1772493735
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
Reviewed-by: Gary Guo <gary@garyguo.net>

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
V19:
* Convert to the kernel import style
* #[inline] all the things
* Add an assertion to ensure that IRQs are actually disabled for the kunit
  tests.
* Use kernel import style

 rust/kernel/sync.rs               |   9 +-
 rust/kernel/sync/lock/global.rs   |   3 +
 rust/kernel/sync/lock/spinlock.rs | 243 ++++++++++++++++++++++++++++++
 3 files changed, 254 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 993dbf2caa0e3..df4f2604ff9bc 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -27,7 +27,14 @@
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
 pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
 pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
-pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
+pub use lock::spinlock::{
+    new_spinlock,
+    new_spinlock_irq,
+    SpinLock,
+    SpinLockGuard,
+    SpinLockIrq,
+    SpinLockIrqGuard, //
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
index d75af32218bae..6b8f92d5b0467 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -4,6 +4,7 @@
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
 use super::*;
+use crate::prelude::*;
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -143,3 +144,245 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
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
+    #[inline]
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
+    #[inline]
+    unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState {
+        // SAFETY: The safety requirements of this function ensure that `ptr` points to valid
+        // memory, and that it has been initialised before.
+        unsafe { bindings::spin_lock_irq_disable(ptr) }
+    }
+
+    #[inline]
+    unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
+        // SAFETY: The safety requirements of this function ensure that `ptr` is valid and that the
+        // caller is the owner of the spinlock.
+        unsafe { bindings::spin_unlock_irq_enable(ptr) }
+    }
+
+    #[inline]
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
+    #[inline]
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
+        workqueue::{
+            self,
+            impl_has_work,
+            new_work,
+            Work,
+            WorkItem, //
+        },
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
+            // Make sure the interrupts actually turned off
+            // SAFETY: It's always safe to call `lockdep_assert_irqs_disabled()`
+            unsafe { bindings::lockdep_assert_irqs_disabled() };
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

