Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EED647728A
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Aug 2026 16:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785860136; cv=none; b=E3bdDOuONTfd6Rt9ydi7Y5BPU3tI9+1pem6cqVzDrtK2RLERGtFKsMPvhh5ncqDzO3+9hz4dSaWfdaC3iOsiURbbs9vpT0D/r8MadkdQcNRn0UUwEaCewSF+O9wZjS1tdN0N1ZwlXGWAzXGNBQ26Bdv4df1Il8qC7eCquDqz/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785860136; c=relaxed/simple;
	bh=yOW+vEyMmlLd/rvdAQOpfI7rRLssPojgy8OC8Xdb7b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cwh3Cb/zAJKoLsF5Wz6JXw3VtP4FuOAk/+Oed9XXUurnrs3wwGZCQw4G6CSWQRj4qPbqFUkaOHWPhyR9kNb0yiBRwhzR4Nez2bv/X/WTLPIKYOEz+LvWCF4NooQ94d2ocFwL1wWxa1d3ybSAyzJRmcldMvS7ccYC5SmuaQlnO4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhtIyMs+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhtIyMs+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29011F00ADE;
	Tue,  4 Aug 2026 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785860124;
	bh=J5r9F5NVhPBA6Gj8qaTBPl3yuPTDh/upo+Mtrw3vN6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GhtIyMs+lDB/3WxFofpCVhr5lrAJAfiK/2Jmz7Yb5ccySl6rQotVGNNSWbwDzH6Om
	 5Gcqpn8c9dn9yEjLDupABxeqD8aVZe+jNHQt87w51hpe8Aisu1n5gTEB6hUN1sr04K
	 Gny5kXFM855sCVusdcQx1PtuOiBbXj8qOONk6gmFMWgll6rYu9ErqsC+PaKfP1Lm6M
	 Jh1Azipm7vIi1qGfu7hC+ZpJ+Szgs3w82j/m63cJlIG/rS2gm2Xp0JWO7BIoMO5oT8
	 GudAFFM60dImjdkX3Ev5dYcZgnd9t96v4w5AE2gcX8M1Mf0udewI2WxnGcHSnz3tCB
	 yY/hvJOLy2TiQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id E0698F40068;
	Tue,  4 Aug 2026 12:15:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 04 Aug 2026 12:15:23 -0400
X-ME-Sender: <xms:GxByarzlpXaux7O9gV0aXWNeGaifR_j2lMjnSCieJKCdU7R9hryG4Q>
    <xme:GxByaocA2pLvgbgThVLO-KvhrQ15Xry2TLLLrveHTSeonnLZTdA65P84mQCTa6TbW
    OjEGedpaUod6CwMv09wovtgng8PH5S6vhuNu5pQfahg2fDjwBuWZsc>
X-ME-Received: <xmr:GxByaosLKhGxpZc4s15Kf1XOw7PEvxSFsgyPKPmqK9NL0NXn2DwD423yU5c8t9tfq3c5O-DBTR1eGtucQvP7Y8HERJ-6g9Cw>
X-ME-Proxy-Cause: dmFkZTE6f1b/PLD7WfUEjv3UPH0IuooDzdONFOoQTajOMPpDZsgOHZQOVqJ4v+RHATO1sj
    EZSfNibFX853su8vPqAqnUSuvHiUbplQY0egsm0mTGT1lvu1S/5Nh/tuqaumzTAbEEqn88
    A4HuRrhsSYsTxma98RYyzM2Gbo4E2wg96qbDSuNUia/kyZtd9PuUf9ikEEX+FWBaYhk2LZ
    4A6T9U94iL3j6tNfmRpUMp/Z8p6+0GWHZbXf2pAo98Kg1ESY7btybSSSUnrcHypkA1CoVm
    T+WboQPfBLNhjm5E0DtWi31bTX/atiaNKg8ICM8aktklu407EF+Nx0w3ySFDe9rX99/5c7
    VHxd0IBeRLjSglLmGGu4qcFo6l3dFM8dlqsmahN6miVS0lDN1uZWPAhgUWk58n5dNfTejY
    O3XlDdY3zr/a45OAr6aLsOyn9N9frGmsOzWcXGIDsrsKwxBBbBdBSHbc7U+/PXIzYEdnIp
    XLi0Fm5TYkwEKFgsBYim6ZlA6G3VRnEbfq+bx4qUJtD9jjD+UHYqCmFNGzXeZZUwbGHCjb
    0FrfHhihkhv4i0JVaWFshEQPJ8wWTnJhu59no68G7UkSd/B0+bGTmdVG/7sYc/sGzR0Guq
    kHc5SXgxoWcLPZfgI2Ldw1o/s1T7ccCNIeshuUsOQ+f6gYWEB4R/m+m9jv2g
X-ME-Proxy: <xmx:GxByalALiOH3Z-M2Ya-bFo3RManis0F8E9_tVsM4_c7orteAQ17UJQ>
    <xmx:GxByaoFEUvEDIpWeIi7oKi_l09-bcoNw82QYmIkJXuq-fyxzq3j4EQ>
    <xmx:GxByatuQX--GZ4js9Pzxqlc-BMH8Rz-O1-GW34JqymYgjHp6jzaQ4A>
    <xmx:GxByamkAdX7Lx4bKzwJqHKK0jlIr31L89gwqbR-6DcZqqZ1S1_7HPQ>
    <xmx:GxByaoOXMOyeLEPrFqQ4P8qA0R_eM4rwGoaqbC1jeBaBRn_nHyjkRqNO>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Aug 2026 12:15:23 -0400 (EDT)
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
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 17/17] rust: sync: Introduce SpinLockIrq::lock_with() and friends
Date: Tue,  4 Aug 2026 09:14:39 -0700
Message-ID: <20260804161447.84806-18-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260804161447.84806-1-boqun@kernel.org>
References: <20260804161447.84806-1-boqun@kernel.org>
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

