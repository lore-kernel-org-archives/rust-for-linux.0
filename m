Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A88453A56;
	Fri,  7 Aug 2026 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086175; cv=none; b=nJZo2j3Hbgx5652TxmHhF7AysvWfhRBkjvnDhJvWtT/C1xOnZoGM8RAlUCw80E+WTBg+47+ZfvtLuYh6d3Kfq4Fy5dQhJBBh1g+URa2OOujLcyZCAzwUuOATIIvVE0RlDh6EwMgeVrQcAXUfkLEhUsSq9BiiazWTNpYmGaUL720=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086175; c=relaxed/simple;
	bh=yOW+vEyMmlLd/rvdAQOpfI7rRLssPojgy8OC8Xdb7b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRYek8cJmLzK3lCqyS6BpXzo6eWyTMFA/xkXPGAVo6XGX+CswgrwknX7vP6b/L9Xrz8+BkzwshiMzrOTs51SrjQJCvfE1RbP7Greji5+0HVENYEHkLfqxIEc4FYYQz3bm1HnAB3YfQSju8tD+io2ft4DKCafkD9iqihLD5xiw+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E667DoEu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E667DoEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520331F00A3E;
	Fri,  7 Aug 2026 07:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086174;
	bh=J5r9F5NVhPBA6Gj8qaTBPl3yuPTDh/upo+Mtrw3vN6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E667DoEuUg5FLa1rShvLUT1sgtX8nZrv0/CNyUHS9tjTpKR3AHVE0rGTZU2faQXTR
	 wxwZofYFNWikHwGFcwZFOd1QUjBFEReeGlmbvhtsYVr0VjqJlUDxhvcdN1EsHgWw9I
	 jcHvBW6vipNO9bt7u33iNmx4suVEh6Npaq0tJ4v9Qh98LoJp/xnWr+3kJtV6gpx4bI
	 69N90nLuiTPyigHV8xQW4VXRmCW649sl3yzH3Kt6t6JosrcsyTNapfhzWb5bcBc+Hr
	 SgBBClSi1ugk5Fbl4GJKvfWbqXQ10amdKSA32DS+TmPw0jiJ7aF10ufYAtefOuhUyl
	 lvDYsX2eDAGdw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 67C2DF40067;
	Fri,  7 Aug 2026 03:02:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 07 Aug 2026 03:02:52 -0400
X-ME-Sender: <xms:HIN1anuLJGpjw0JUjWKqciXQyJ38uvAwlamE8U7AiSreeqLxPRuORg>
    <xme:HIN1akyvxfPniw3LtXk5oIkF69Jqzg1gLMVr_9E2PLGIMxG6IsMrrwjoNwEmjV5wV
    LrmO8n35f551Idfk2pUxEnQHpnzbDCM3reqc9_uiC9TfXTpql36XDs>
X-ME-Received: <xmr:HIN1asaNr6LpXxpU-73aiSHL1BDMNgTnei9uOrYh2CkV0nwQTb_-c7W5hmwMD6L7H8vx4oVSTFxedFNfTEsuXLHNJQmrZEo4>
X-ME-Proxy-Cause: dmFkZTE8lydczuBK1/wbIQK6YmAUX4f+Ec5X1qeyT1wkaZMDCCrXPb/HwP7HtUh+NFCVhL
    clfOjleQYAT5amWLr98/fJKXH/Ntk/RmBOsiX4zJwLbn9uvLVg0Z2RCdCAyc3px4IZj1/F
    ZXlNyt+DCzc16VlaYTrYu1UhJyVcL7yhJjjdgA1mmIOIu4WyN8hdfZ77TUSFvr7zainkfb
    /D4Vb+s510TJTP/ca9Uc2yFXK2vJOFV/1XWJhRwp5UtJWnttiGxniEnW/HP1Cjlu1j23Af
    wuD2iIZFmRtkrayImScufIH/fO2ZEneI3YN/an93v1hbc/Xl2wv2f6L6jtPknYrY05temU
    A4AyfVg5tI3rD7OfZHOqnLTfrnA8qYbt1WUCAaEWNw3uNyiqjssGxytnvcZEcG3Wxj1RmG
    EpEmNJpld7TnmkxXF0FrfvaIHEILdREMWDo/tFvMDtZ5QPSUVxB7utLfnilcV1rsgMiKC1
    qKFMAAIB6ZbGT+ttHZ6w0pNFLHbRrCUyJT9brHBy27MoX9uvyVYb1Jo4V+qC8WtbnxnpGJ
    yaEY29CuWL6Vt0pTYHbdqyYTQpa+zzMnOdPBk4tVblMk8zOKSkjQIuG03dH1wHHgjE98kR
    rPAGFfTx/X8lm6htFLxcPjzxYaTm1NV03d6C3tO7V1Oj/3n8zL7S8GOJYmJw
X-ME-Proxy: <xmx:HIN1ajUA7K21OEwObadkv6VuKozGdII2v2hi1U9VvXplY3dlrXDGrw>
    <xmx:HIN1atFQaf8m7Vc4T7GIPkBJ0ly0bI8tbFNDBXK1G2P_U8Izf2hXsg>
    <xmx:HIN1atAHxT-JR2eOBwsNobSj-k5hbPm_TINdLu3eERps9yWc2fZqWw>
    <xmx:HIN1alzmaMx2J3QnuaeF-Ig8OPo8gk1MmeXKFgHuy5tRcTnDylrDSQ>
    <xmx:HIN1auBYmQnwBb05uVOKDD2288UCiNe_nl27zctJZMNiQvGi7rqF4kD7>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 03:02:51 -0400 (EDT)
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
Subject: [PATCH v5 18/18] rust: sync: Introduce SpinLockIrq::lock_with() and friends
Date: Fri,  7 Aug 2026 00:02:15 -0700
Message-ID: <20260807070218.27144-19-boqun@kernel.org>
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

`SpinLockIrq` and `SpinLock` use the exact same underlying C structure,
with the only real difference being that the former uses the
irq_disable() and irq_enable() variants for locking/unlocking. These
variants can introduce some minor overhead in contexts where we already
know that local processor interrupts are disabled, and as such we want a
way to be able to skip modifying processor interrupt state in said
contexts in order to avoid some overhead - just like the current C API
allows us to do.

In order to do this, we add some special functions for SpinLockIrq:
lock_with() and try_lock_with(), which allow acquiring the lock without
changing the interrupt state - as long as the caller can provide a
LocalInterruptDisabled reference to prove that local processor
interrupts have been disabled.

In some hacked-together benchmarks we ran, most of the time this did
actually seem to lead to a noticeable difference in overhead:

  From an aarch64 VM running on a MacBook M4:
    lock() when irq is disabled, 100 times cost Delta { nanos: 500 }
    lock_with() when irq is disabled, 100 times cost Delta { nanos: 292 }
    lock() when irq is enabled, 100 times cost Delta { nanos: 834 }

    lock() when irq is disabled, 100 times cost Delta { nanos: 459 }
    lock_with() when irq is disabled, 100 times cost Delta { nanos: 291 }
    lock() when irq is enabled, 100 times cost Delta { nanos: 709 }

  From an x86_64 VM (qemu/kvm) running on a i7-13700H
    lock() when irq is disabled, 100 times cost Delta { nanos: 1002 }
    lock_with() when irq is disabled, 100 times cost Delta { nanos: 729 }
    lock() when irq is enabled, 100 times cost Delta { nanos: 1516 }

    lock() when irq is disabled, 100 times cost Delta { nanos: 754 }
    lock_with() when irq is disabled, 100 times cost Delta { nanos: 966 }
    lock() when irq is enabled, 100 times cost Delta { nanos: 1227 }

    (note that there were some runs on x86_64 where lock() on irq
    disabled vs. lock_with() on irq disabled had equivalent benchmarks,
    but it very much appeared to be a minority of test runs.)

While it's not clear how this affects real-world workloads yet, let's
add this for the time being so we can find out.

This makes it so that a `SpinLockIrq` will work like a `SpinLock` if
interrupts are disabled. So a function:

        (&'a SpinLockIrq, &'a LocalInterruptDisabled) -> Guard<'a, .., SpinLockBackend>

makes sense. Note that due to `Guard` and `LocalInterruptDisabled`
having the same lifetime, interrupts cannot be enabled while the Guard
exists.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 rust/kernel/sync/lock/spinlock.rs | 92 ++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 872544948e5d..aafc80125f59 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -4,7 +4,10 @@
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
 use super::*;
-use crate::prelude::*;
+use crate::{
+    interrupt::LocalInterruptDisabled,
+    prelude::*, //
+};
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -160,6 +163,16 @@ macro_rules! new_spinlock_irq {
 
 /// A variant of `SpinLock` that ensures interrupts are disabled in the critical section.
 ///
+/// This lock can be acquired in two ways:
+///
+/// - Using [`lock()`] like any other type of lock, in which case the bindings will modify the
+///   interrupt state to ensure that local processor interrupts remain disabled for at least as
+///   long as the [`SpinLockIrqGuard`] exists.
+/// - Using [`lock_with()`] in contexts where a [`LocalInterruptDisabled`] token is present and
+///   local processor interrupts are already known to be disabled, in which case the local
+///   interrupt state will not be touched. This method should be preferred if a
+///   [`LocalInterruptDisabled`] token is present in the scope.
+///
 /// For more info on spinlocks, see [`SpinLock`]. For more information on interrupts,
 /// [see the interrupt module](kernel::interrupt).
 ///
@@ -213,7 +226,47 @@ macro_rules! new_spinlock_irq {
 /// # Ok::<(), Error>(())
 /// ```
 ///
+/// The next example demonstrates locking a [`SpinLockIrq`] using [`lock_with()`] in a function
+/// which can only be called when local processor interrupts are already disabled.
+///
+/// ```
+/// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
+/// use kernel::interrupt::*;
+///
+/// struct Inner {
+///     a: u32,
+/// }
+///
+/// #[pin_data]
+/// struct Example {
+///     #[pin]
+///     inner: SpinLockIrq<Inner>,
+/// }
+///
+/// impl Example {
+///     fn new() -> impl PinInit<Self> {
+///         pin_init!(Self {
+///             inner <- new_spinlock_irq!(Inner { a: 20 }),
+///         })
+///     }
+/// }
+///
+/// // Accessing an `Example` from a function that can only be called in no-interrupt contexts.
+/// fn noirq_work(e: &Example, interrupt_disabled: &LocalInterruptDisabled) {
+///     // Because we know interrupts are disabled from interrupt_disable, we can skip toggling
+///     // interrupt state using lock_with() and the provided token
+///     assert_eq!(e.inner.lock_with(interrupt_disabled).a, 20);
+/// }
+///
+/// # let e = KBox::pin_init(Example::new(), GFP_KERNEL)?;
+/// # let interrupt_guard = local_interrupt_disable();
+/// # noirq_work(&e, &interrupt_guard);
+/// #
+/// # Ok::<(), Error>(())
+/// ```
+///
 /// [`lock()`]: SpinLockIrq::lock
+/// [`lock_with()`]: SpinLockIrq::lock_with
 pub type SpinLockIrq<T> = super::Lock<T, SpinLockIrqBackend>;
 
 /// A kernel `spinlock_t` lock backend that can only be acquired in interrupt disabled contexts.
@@ -278,6 +331,43 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
     }
 }
 
+impl<T: ?Sized> Lock<T, SpinLockIrqBackend> {
+    /// Casts the lock as a `Lock<T, SpinLockBackend>`.
+    #[inline]
+    fn as_lock_in_interrupt<'a>(&'a self, _context: &'a LocalInterruptDisabled) -> &'a SpinLock<T> {
+        // SAFETY:
+        // - `Lock<T, SpinLockBackend>` and `Lock<T, SpinLockIrqBackend>` both have identical data
+        //   layouts.
+        // - As long as local interrupts are disabled (which is proven to be true by _context), it
+        //   is safe to treat a lock with SpinLockIrqBackend as a SpinLockBackend lock.
+        unsafe { core::mem::transmute(self) }
+    }
+
+    /// Acquires the lock without modifying local interrupt state.
+    ///
+    /// This function should be used in place of the more expensive [`Lock::lock()`] function when
+    /// possible for [`SpinLockIrq`] locks.
+    #[inline]
+    pub fn lock_with<'a>(&'a self, context: &'a LocalInterruptDisabled) -> SpinLockGuard<'a, T> {
+        self.as_lock_in_interrupt(context).lock()
+    }
+
+    /// Tries to acquire the lock without modifying local interrupt state.
+    ///
+    /// This function should be used in place of the more expensive [`Lock::try_lock()`] function
+    /// when possible for [`SpinLockIrq`] locks.
+    ///
+    /// Returns a guard that can be used to access the data protected by the lock if successful.
+    #[must_use = "if unused, the lock will be immediately unlocked"]
+    #[inline]
+    pub fn try_lock_with<'a>(
+        &'a self,
+        context: &'a LocalInterruptDisabled,
+    ) -> Option<SpinLockGuard<'a, T>> {
+        self.as_lock_in_interrupt(context).try_lock()
+    }
+}
+
 #[kunit_tests(rust_spinlock_irq_condvar)]
 mod tests {
     use super::*;
-- 
2.50.1 (Apple Git-155)

