Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E75330D24
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 20:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770324458; cv=none; b=kLgWTSdTBoUUOVS4JPFkVerFUmUp+fqqVwA2dZyBM3xEuJqEcXBuiGvjCFzyYpk6D1QQb4Z3D2enDKoNMJTdSjCUIqq1NOtImRvLhEHrbgrAA6XftvddSPen9eY/Gn0ZZ9leseMDtfuSjO2g3LI2TjzJkew3tgjVQkbf0Gfq3H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770324458; c=relaxed/simple;
	bh=+GIRYZy86CnIH5l2vxfFelwhybPAW6qZxj1otMkVhjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=trxWHVmX0MtxwYJaT3bkwsW9U3W2AE2JhnFaYytCqitsBD0Rgt9giuQOduY7QJ7uvsZ+Ugo/a40mA7XzDUpkQnJzny8be7/MZRIXl54K9TFhOfwTV5J80MvjHXFW1RXBtswkV9cR/BxT/w7mRlzotOlub4pQB6ZpT8LIeL7iBCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OVI8w87G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OVI8w87G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770324457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lb0et9/QppgsxMWk1Ve5CtNXbz/GWz/gwyzKgDtRpPM=;
	b=OVI8w87GICUVnsTc+hPhPV/9b/kyqxFU+bxR7z0jg8nexeMlVOvLHGz8gZ20Ve/GYkcamM
	HkmsljI+8iiq9Oy/9zoxh0la+Gv/KgBigIi7WUerwAEVd/n3do1IpOgQSRXY1fJhu+eALe
	lSctm0BwHtG4hy5eOoTMd8Thrtz9Bns=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-338-zDzPZ4QlMo-uHm4eWwGq0Q-1; Thu,
 05 Feb 2026 15:47:31 -0500
X-MC-Unique: zDzPZ4QlMo-uHm4eWwGq0Q-1
X-Mimecast-MFC-AGG-ID: zDzPZ4QlMo-uHm4eWwGq0Q_1770324449
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BC521800265;
	Thu,  5 Feb 2026 20:47:29 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.82.65])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0F5F419560A7;
	Thu,  5 Feb 2026 20:47:26 +0000 (UTC)
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
Subject: [PATCH v18 5/5] rust: sync: Introduce SpinLockIrq::lock_with() and friends
Date: Thu,  5 Feb 2026 15:44:31 -0500
Message-ID: <20260205204709.528234-6-lyude@redhat.com>
In-Reply-To: <20260205204709.528234-1-lyude@redhat.com>
References: <20260205204709.528234-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: ygyaiKMS-rFj6vHm_PqM6a1ifh8SXFjvw1bYZMuZfT0_1770324449
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`SpinLockIrq` and `SpinLock` use the exact same underlying C structure,
with the only real difference being that the former uses the irq_disable()
and irq_enable() variants for locking/unlocking. These variants can
introduce some minor overhead in contexts where we already know that
local processor interrupts are disabled, and as such we want a way to be
able to skip modifying processor interrupt state in said contexts in order
to avoid some overhead - just like the current C API allows us to do.

In order to do this, we add some special functions for SpinLockIrq:
lock_with() and try_lock_with(), which allow acquiring the lock without
changing the interrupt state - as long as the caller can provide a
LocalInterruptDisabled reference to prove that local processor interrupts
have been disabled.

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

    (note that there were some runs on x86_64 where lock() on irq disabled
    vs. lock_with() on irq disabled had equivalent benchmarks, but it very
    much appeared to be a minority of test runs.

While it's not clear how this affects real-world workloads yet, let's add
this for the time being so we can find out.

This makes it so that a `SpinLockIrq` will work like a `SpinLock` if
interrupts are disabled. So a function:

        (&'a SpinLockIrq, &'a InterruptDisabled) -> Guard<'a, .., SpinLockBackend>

makes sense. Note that due to `Guard` and `InterruptDisabled` having the
same lifetime, interrupts cannot be enabled while the Guard exists.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

---
This was originally two patches, but keeping them split didn't make sense
after going from BackendInContext to BackendWithContext.

V10:
* Fix typos - Dirk/Lyude
* Since we're adding support for context locks to GlobalLock as well, let's
  also make sure to cover try_lock while we're at it and add try_lock_with
* Add a private function as_lock_in_context() for handling casting from a
  Lock<T, B> to Lock<T, B::ContextualBackend> so we don't have to duplicate
  safety comments
V11:
* Fix clippy::ref_as_ptr error in Lock::as_lock_in_context()
V14:
* Add benchmark results, rewrite commit message
V17:
* Introduce `BackendWithContext`, move context-related bits into there and
  out of `Backend`.
* Add missing #[must_use = …] for try_lock_with()
* Remove all unsafe code from lock_with() and try_lock_with():
  Somehow I never noticed that literally none of the unsafe code in these
  two functions is needed with as_lock_in_context()...
V18:
* Get rid of BackendWithContext
* Just use transmute in as_lock_in_context()
* Now that we're only supporting IRQ spinlocks and not using traits, use
  the type aliases for SpinLock and SpinLockGuard
* Improve the docs now that we're not using traits.

 rust/kernel/sync/lock/spinlock.rs | 78 ++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index f11a84505ba0e..de736cb777e93 100644
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
@@ -224,6 +227,45 @@ macro_rules! new_spinlock_irq {
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
 /// [`lock_with()`]: SpinLockIrq::lock_with
 pub type SpinLockIrq<T> = super::Lock<T, SpinLockIrqBackend>;
@@ -286,6 +328,40 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
     }
 }
 
+impl<T: ?Sized> Lock<T, SpinLockIrqBackend> {
+    /// Casts the lock as a `Lock<T, SpinLockBackend>`.
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
2.53.0

