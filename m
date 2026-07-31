Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34BC3890E5
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529869; cv=none; b=lVmc9Hy6qV9e2KJqreoL6O/x5DsmjyO4VfofBTsneOv7HBohP2myc0h0W5fi2Sp/4X+P/VmtE7Z75nzV46BYdZZezf8ksNgHVNsNTR4DYXxFtRFr9YGJCmUIlMGR3iYJQ7+0nTY9pbriauzqI7rFA3X62Dcd3PUV9KNV7rM373Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529869; c=relaxed/simple;
	bh=i9nGddE3sqAXPLgutnT8ESKgFg7Kb7yokE3ucgABtww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8dk8acqUdSWU3MRSrGvWck3iuCEch+BfmR+ihPYHvjCwqvf7hPT9WAD2zEK65vY2aCk2og0WkVhZQ5HpBeP9YNMX+YcaiDjz77GSmTGZtzr09lBOla+XMz48AIDvJCmwFiUCWxTnn1fRDDkLyYiwyNaq53BQh7YCB4e+HK5akM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9tP5t8K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9tP5t8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E9E1F00ACA;
	Fri, 31 Jul 2026 20:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785529867;
	bh=8YTnDGD6y/NHAmGtt4JsavW6KfpbSRfQwfKSQHrHcMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C9tP5t8KysNhMoEraZvd32X2bdwVx6Id9SO4+CNABts3rAFRLa3cwsW+3l7V2Foof
	 GOGQK4WTtJPp/nOaRIKXefq/G6Zm08muxI2Yg+LpdS/DBcdGJf7BImkX3SNoNCo42e
	 mwy1P1+B6wMXBK2EPTTc1vrauSj6NDPIPE2Gs+7XttuURF1Fs8Wo0iVcF1V1jECK+0
	 ccXez5XG4E+o2s/Un1bpCQaMXOeHzjVkZTtPM+9sZTuCnP81XWSw55rF9pwJdtiP2Y
	 k0rEl8jFDUHlhFcvIpp24bjqDzcDubhhZ44fesjg4ZQERXURuMErpMJoEdBDWLTz5B
	 CFPB0gmkudamg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 73601F40077;
	Fri, 31 Jul 2026 16:31:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 31 Jul 2026 16:31:06 -0400
X-ME-Sender: <xms:CgZtat-Sk8Gtc7JeMVwSHqBx_WXi_Sc2XjFhnZBZzC1-13IMJ8LvCg>
    <xme:CgZtasH3klDZbdZPZ7LbS5u0q1NV4j1IbC0FPCvBOTQlfXwqmfiNJXV_iVMygVXBM
    f1eoCNC7WTlkP3tbLOXJpuewnxgiYUnOKOQA6OeXQcllEXf35m2og>
X-ME-Received: <xmr:CgZtahKD3ck7LiluxcM_JRaTh5V9Tg_osOt5j6cs73IVzgNEI70wv0MOhWvV02gXZx3-Jr509bvuIjFrMXCOrXhZ0j8ZZEiM>
X-ME-Proxy-Cause: dmFkZTFYc6116FG2quGqEuyKIxKnFMEmlYb32kQQ7CtbFGYD9qEYkru11crvm5k1myTjrD
    mprk+Q3zryg6Sw+VBlHk+Fh2dsP+vkQ+R6SId6D6PQHJ2MNR0r6gfBCLOd3kp8148kZ7F/
    KLgIA+5OGrlMzKnGLja63bpFSrAh19/D1KowErF7/fMLoXr6/uBxuTdAfInIovWJuydywf
    zjiEDrBy2ZQGTG+wDuq3UDJInF4v///JGqWliNx3oB8ndvgTYjGjYM24OlzqaeVHYGQ/UH
    n/uNgL2CgUXmcpbS+mAJlGjkfOgTDC/OpURLEQyF+W0WAZBtt5IfiFk+NFnrr0x50+Kqpr
    2qtvbZBRjsKKzXx2naQYia/F5xoCinX8ZR7Zn3DHW6g1yMMZ66Ub0x3ezqCTCjlnqa0E7I
    0dvHN1QgQnNfBIoUtbutNnmbMGAFOSws1xEDWqZ5xW22apxjzKY4NdM2Oyt5wYtYBa7O7w
    ArcEGVLLCeidiWPDKGpp+B1AReCxPKcjtU3nxjEjCABqveQTuR/CTg0fUU9+N52AFwgW9G
    xm2E0tLBj4IEtT2qTyslxHccWwHsgikADSt0jpnEdqz0GULVuofg1q/OHPuWCrEFSFhZp0
    Y73l2KsixYxlFFT2l+rIbyuEpYlpOubAH+ghzwZXMBv7IaWVcDQGQo0xJ27Q
X-ME-Proxy: <xmx:CgZtaskeEoNaj2ZRQo-LhqPT9TK2HcW4mpyfuJ7uAG1G9HeBsg7XSw>
    <xmx:CgZtaqy21ll5ffqcZMHDI1DQ_7zNdJWrQLZk5lXrkNLBQpQBMBcN_Q>
    <xmx:CgZtamvCxOqsHfnURqC5colkIQZ1JS0mP6dwfR1-eYvyJgb0qhJhCQ>
    <xmx:CgZtasFZ-iERebXqkUdQjqHEeTGNctm7q8Fk17oQ4qc-iZpWT3AS9w>
    <xmx:CgZtas5sudbt8bd1XQewTp0MeH4SWoUvllSnN2rjXhWON-cSGwvADwG7>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 Jul 2026 16:31:05 -0400 (EDT)
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
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 18/24] rust: sync: Introduce SpinLockIrq::lock_with() and friends
Date: Fri, 31 Jul 2026 13:30:19 -0700
Message-ID: <20260731203031.13679-19-boqun@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203031.13679-1-boqun@kernel.org>
References: <20260731203031.13679-1-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lyude Paul <lyude@redhat.com>

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
Reviewed-by: Gary Guo <gary@garyguo.net>
Link: https://patch.msgid.link/20260302232154.861916-6-lyude@redhat.com
Signed-off-by: Boqun Feng <boqun@kernel.org>
---
 rust/kernel/sync/lock/spinlock.rs | 81 ++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 6b8f92d5b046..069fcdb58735 100644
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
@@ -291,6 +333,43 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
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

