Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C1F3C65FD
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086173; cv=none; b=Lk1gWQhbuJ7iC9tr9yJbjfzuaVmPuANQeruOeTlCZr6/aZ4hK0vpQyGAqUA2hgPijXFCcSYuBG80RWp12beywZ/D3EaZU1agbpTGGMyOBZp5kON9sAb81BYf/M4SfXLk8qumtW2Hexgw+0C3bJORv7p5JyQ5KHRwzYBrFWgSE7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086173; c=relaxed/simple;
	bh=kZU5uFqdjWiRbrVf1fTNRv9ePx+qKQEq8Hc6Bs6H2Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hepoJhVCpZKmYiXeAv3PQkvQLf+Mr8OZNkbs8kEgATKSjNoCmvYPf2QlvrQvkEVwdcWMO/uU+l8zBWMv6YGNXMACih1QEdBGPZQHoyIt3KE3HYZL1yNwjSnR/QLuPLldTpFurFYgfgOFy/NKKV4Z7yXsA0RV/2aK+nZ9dkk6l4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOwHgkn3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOwHgkn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FFE1F00A3A;
	Fri,  7 Aug 2026 07:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086171;
	bh=2MYZgIP+osziR2bs888gmmBvgXIfwDVrZfFhcS+axXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AOwHgkn3Zdc2Cjrg1ADruJb0ghMa1PzYZhoUlqK8rF54i6f06pKX/I3+L8dz9TgiO
	 EDa41QMueaS65L6s+gjBdkj5OfclKIu3VYNU2TvmKNtHonSftyWayv+Y6yCppWYoih
	 K0L+Mlh8Vkm2QDJdeXVrGsO1zlOeggbpFr6/i4vlz4ToliqmZ2iYczstrYdwnuy8rw
	 qWhFLidHuEE4Pytc8oCGC+F6/n3CNCwh+7xYrzg1DtnWSKMA5flscKMPN8U5Iz2H3a
	 bH6I0AmqdiyZUlAfYrVpHmxILemaLjf5a8+wbbUdPZBPzEBxYl/WJuY9lFfConZ/Nu
	 C6Pce288JNh5Q==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id E9751F40067;
	Fri,  7 Aug 2026 03:02:49 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 07 Aug 2026 03:02:49 -0400
X-ME-Sender: <xms:GYN1alCqGKApHoDS2uCZR9OYqkOokDRQykaGmeOYWH7mQD4-Yi8RcQ>
    <xme:GYN1av0txmJxdBVgqyYAdXIDUPbz-m9gY6hSsMZjfbolJsYccWfz-G1ZcbCDoTS_1
    S_JzEezKwhzIg8La6dWtbgch2NYnPj8qE8eJWHkuG4hOQ6FEhGBijI>
X-ME-Received: <xmr:GYN1aiOF5KATnS-lxMcAi1d5zNfIEmZsNDduF-1kxO3LfH-P3BvHw7BOWrO5WFUyLLvSZkbNd45hh4m-3ACrP3Jm7fdT2QxZ>
X-ME-Proxy-Cause: dmFkZTELsVbnxrvhPb2j61weS49pxhnQ59QQ/kkvzVAF7RfvMFBahj3W+J/ZYvUaUDGUKL
    rkIpWI9Kqh7tdFeNxTw91APFY2yZOuGFzh0R7L9linn/K/VkHskzHhqZIAbhz+FzEI2/39
    p/Gf/98yNPd7kqv7ASor+gx/DK4WZv4tGUkwpXImaVpTVn9yjG8Hsrc4m1zuPGR3jPjYfV
    aGaWr2EDt/5hU/phchzQPFGxTjKWqqv3f39Pht190FqbXj8fyXB6xLi7X5zcPt/Liyw23y
    b+4UgNbRpkgjQlqdkJa7EiS5FEj8Oxro36Xe5RlI+SlnX1fghWIXGuRondD8d1wH6SlNBW
    5RQjxsaRGjdQy2PmDdfm40Cl5FkLsO02LGHI5fWvMZPCNy/BnMKs83zlmulKgzS45ZHh8Y
    ui8slDvH0wg10uGffJs7CKt9/PxJgPgd1sG7EcpE2biN48Br+MlRK1WGFQp99CNTRGdMqk
    A2eVnGdAOzEfWo/iCvmgGRf1s875yzUGh+hsP6FbkLctjRNrJJ6tYOdisyJx6U6Zke11ad
    euXHrQwtYTWTyW3c+75B/0Iku4x3RLYLMu/BoQwdmlnZl4eO0qUqqUO2oGHZTvNQGI09xk
    JMok34eac9v7wSw7eaLXJOZjDWC+NF9BrkhSxSK07DlNwjlhJCWlOXAsZk/g
X-ME-Proxy: <xmx:GYN1as7gcjBCz-5pJpeRav54lCYmVwxsiIgEJiXst4XqKokMguN-dQ>
    <xmx:GYN1avZnrHsd07ytcvwwrUQ9UZDHWk1MUlkXvH2cpFnSG6TlmNIVaw>
    <xmx:GYN1apEgPdsz0kcxfyvPldgmWmAW29AHWd_X5Gxh6EPfWQIDiWN0aw>
    <xmx:GYN1aonWtBRYheHKyUGm3q09nPyMyj8yP3JFSdu_SBMXnZE-MEYR1A>
    <xmx:GYN1agkKM3tIJd941qusfObDrNx4_p9QAOlFU1a-kfgaXEIe7R6oypnS>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:49 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Ingo Molnar" <mingo@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Waiman Long" <longman@redhat.com>,
	"Gary Guo" <gary@garyguo.net>,
	"Alice Ryhl" <aliceryhl@google.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Daniel Almeida" <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [PATCH v5 17/18] rust: sync: Add SpinLockIrq
Date: Fri,  7 Aug 2026 00:02:14 -0700
Message-ID: <20260807070218.27144-18-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260807070218.27144-1-boqun@kernel.org>
References: <20260807070218.27144-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lyude Paul <lyude@redhat.com>

A variant of `SpinLock` that ensures interrupts are disabled in the
critical section. `lock()` will ensure that either interrupts are
already disabled or disable them. `unlock()` will reverse the respective
operation.

[Boqun: Port to use spin_lock_irq_disable() and
spin_unlock_irq_enable()]

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 rust/kernel/sync.rs               |   9 +-
 rust/kernel/sync/lock/global.rs   |   3 +
 rust/kernel/sync/lock/spinlock.rs | 230 ++++++++++++++++++++++++++++++
 3 files changed, 241 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 993dbf2caa0e..df4f2604ff9b 100644
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
index ec2dd84316fc..ebb10521d8bd 100644
--- a/rust/kernel/sync/lock/global.rs
+++ b/rust/kernel/sync/lock/global.rs
@@ -306,4 +306,7 @@ macro_rules! global_lock_inner {
     (backend SpinLock) => {
         $crate::sync::lock::spinlock::SpinLockBackend
     };
+    (backend SpinLockIrq) => {
+        $crate::sync::lock::spinlock::SpinLockIrqBackend
+    };
 }
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index d75af32218ba..872544948e5d 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -4,6 +4,7 @@
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
 use super::*;
+use crate::prelude::*;
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -143,3 +144,232 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
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
+pub type SpinLockIrq<T> = super::Lock<T, SpinLockIrqBackend>;
+
+/// A kernel `spinlock_t` lock backend that can only be acquired in interrupt disabled contexts.
+pub struct SpinLockIrqBackend;
+
+/// A [`Guard`] acquired from locking a [`SpinLockIrq`] using [`lock()`].
+///
+/// This is simply a type alias for a [`Guard`] returned from locking a [`SpinLockIrq`] using
+/// [`lock()`]. It will unlock the [`SpinLockIrq`] and decrement the local processor's interrupt
+/// disablement refcount upon being dropped.
+///
+/// [`lock()`]: SpinLockIrq::lock
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
2.50.1 (Apple Git-155)

