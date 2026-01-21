Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5177544BCB6
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 22:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035239; cv=none; b=ZIetnUtD8/xtGjC8sjy9Nz+koWhafJi2e7r5HqA3p1bc+UtonNM+6KMs2fQ6bkp87/wKw01miri/9iGLZ7IIKjYWqFhUQlLoHPBGXT6pcDw1bXosGXmn6w2758+MCVl7ir60vW0DZ684/FvmAGSK58a41vK7FoelwDrwSGYnRe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035239; c=relaxed/simple;
	bh=Y5i+GVPEllObdijfuWZ9I1W6YV+9xv+1duARbR47X9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqm9ACFArm0CeUnPqlA8Pnx6uF1Yd8i7KJXEZJACkx9iG0++8wqQCedhXlGzEB1i+o8mEujFMNE0xvYfzTKyKTSOctN04vFJzkXw2w9Bm272Mp2PdieFprktO+qU9yFBmnL+9UPv9A7SDVIRp9j3ybElzspGFE37KSRO9FXxrCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jFdqG+T+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jFdqG+T+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769035229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bb3vM/HltnILUnQCfknRXYpdwRws5q5vWcnYkLy8n18=;
	b=jFdqG+T+/kxzURnf1sfeWV81r/2cfRDExHC86DCSEqIpe8PPieusPKYTePn9j6npYsSAuH
	5ztsOBQtJFwLZTFFBHDHgLWfF4rEQ9FYrlfqzYCOFEfu2blp0ZCABSWdxfTo8KqvSTGJ2m
	RtqIXZ9Ku8BT7q5d+uYuY6ZRV3n0xkU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-mctYfoVCPhqxLArjR_Gecg-1; Wed,
 21 Jan 2026 17:40:25 -0500
X-MC-Unique: mctYfoVCPhqxLArjR_Gecg-1
X-Mimecast-MFC-AGG-ID: mctYfoVCPhqxLArjR_Gecg_1769035223
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E62C1956080;
	Wed, 21 Jan 2026 22:40:23 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.232])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9F72019560AB;
	Wed, 21 Jan 2026 22:40:20 +0000 (UTC)
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
Subject: [PATCH v17 10/16] rust: sync: Introduce lock::Lock::lock_with() and friends
Date: Wed, 21 Jan 2026 17:39:13 -0500
Message-ID: <20260121223933.1568682-11-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-1-lyude@redhat.com>
References: <20260121223933.1568682-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

`SpinLockIrq` and `SpinLock` use the exact same underlying C structure,
with the only real difference being that the former uses the irq_disable()
and irq_enable() variants for locking/unlocking. These variants can
introduce some minor overhead in contexts where we already know that
local processor interrupts are disabled, and as such we want a way to be
able to skip modifying processor interrupt state in said contexts in order
to avoid some overhead - just like the current C API allows us to do. So,
`ContextualBackend` allows us to cast a lock into it's contextless version
for situations where we already have whatever guarantees would be provided
by `BackendWithContext::ContextualBackend` in place.

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
this for the time being so we can find out. Implement
lock::Lock::lock_with() and lock::BackendWithContext::ContextualBackend.
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

 rust/kernel/sync/lock.rs          | 71 ++++++++++++++++++++++++++++++-
 rust/kernel/sync/lock/spinlock.rs | 48 ++++++++++++++++++++-
 2 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 46a57d1fc309d..9f6d7b381bd15 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -30,10 +30,15 @@
 ///   is owned, that is, between calls to [`lock`] and [`unlock`].
 /// - Implementers must also ensure that [`relock`] uses the same locking method as the original
 ///   lock operation.
+/// - Implementers must ensure if [`BackendInContext`] is a [`Backend`], it's safe to acquire the
+///   lock under the [`Context`], the [`State`] of two backends must be the same.
 ///
 /// [`lock`]: Backend::lock
 /// [`unlock`]: Backend::unlock
 /// [`relock`]: Backend::relock
+/// [`BackendInContext`]: Backend::BackendInContext
+/// [`Context`]: Backend::Context
+/// [`State`]: Backend::State
 pub unsafe trait Backend {
     /// The state required by the lock.
     type State;
@@ -97,6 +102,34 @@ unsafe fn relock(ptr: *mut Self::State, guard_state: &mut Self::GuardState) {
     unsafe fn assert_is_held(ptr: *mut Self::State);
 }
 
+/// A lock [`Backend`] with a [`ContextualBackend`] that can make lock acquisition cheaper.
+///
+/// Some locks, such as [`SpinLockIrq`](super::SpinLockIrq), can only be acquired in specific
+/// hardware contexts (e.g. local processor interrupts disabled). Entering and exiting these
+/// contexts incurs additional overhead. But this overhead may be avoided if we know ahead of time
+/// that we are already within the correct context for a given lock as we can then skip any costly
+/// operations required for entering/exiting said context.
+///
+/// Any lock implementing this trait requires such a interrupt context, and can provide cheaper
+/// lock-acquisition functions through [`Lock::lock_with`] and [`Lock::try_lock_with`] as long as a
+/// context token of type [`Context`] is available.
+///
+/// # Safety
+///
+/// - Implementors must ensure that it is safe to acquire the lock under [`Context`].
+///
+/// [`ContextualBackend`]: BackendWithContext::ContextualBackend
+/// [`Context`]: BackendWithContext::Context
+pub unsafe trait BackendWithContext: Backend {
+    /// The context which must be provided in order to acquire the lock with the
+    /// [`ContextualBackend`](BackendWithContext::ContextualBackend).
+    type Context<'a>;
+
+    /// The alternative cheaper backend we can use if a [`Context`](BackendWithContext::Context) is
+    /// provided.
+    type ContextualBackend: Backend<State = Self::State>;
+}
+
 /// A mutual exclusion primitive.
 ///
 /// Exposes one of the kernel locking primitives. Which one is exposed depends on the lock
@@ -169,7 +202,8 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
 
 impl<T: ?Sized, B: Backend> Lock<T, B> {
     /// Acquires the lock and gives the caller access to the data protected by it.
-    pub fn lock(&self) -> Guard<'_, T, B> {
+    #[inline]
+    pub fn lock<'a>(&'a self) -> Guard<'a, T, B> {
         // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
         // that `init` was called.
         let state = unsafe { B::lock(self.state.get()) };
@@ -189,6 +223,41 @@ pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
     }
 }
 
+impl<T: ?Sized, B: BackendWithContext> Lock<T, B> {
+    /// Casts the lock as a `Lock<T, B::ContextualBackend>`.
+    fn as_lock_in_context<'a>(
+        &'a self,
+        _context: B::Context<'a>,
+    ) -> &'a Lock<T, B::ContextualBackend>
+    where
+        B::ContextualBackend: Backend,
+    {
+        // SAFETY:
+        // - Per the safety guarantee of `Backend`, if `B::ContextualBackend` and `B` should
+        //   have the same state, the layout of the lock is the same so it's safe to convert one to
+        //   another.
+        // - The caller provided `B::Context<'a>`, so it is safe to recast and return this lock.
+        unsafe { &*(core::ptr::from_ref(self) as *const _) }
+    }
+
+    /// Acquires the lock with the given context and gives the caller access to the data protected
+    /// by it.
+    pub fn lock_with<'a>(&'a self, context: B::Context<'a>) -> Guard<'a, T, B::ContextualBackend> {
+        self.as_lock_in_context(context).lock()
+    }
+
+    /// Tries to acquire the lock with the given context.
+    ///
+    /// Returns a guard that can be used to access the data protected by the lock if successful.
+    #[must_use = "if unused, the lock will be immediately unlocked"]
+    pub fn try_lock_with<'a>(
+        &'a self,
+        context: B::Context<'a>,
+    ) -> Option<Guard<'a, T, B::ContextualBackend>> {
+        self.as_lock_in_context(context).try_lock()
+    }
+}
+
 /// A lock guard.
 ///
 /// Allows mutual exclusion primitives that implement the [`Backend`] trait to automatically unlock
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 3fdfb0a8a0ab1..e082791a0d23c 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -3,7 +3,7 @@
 //! A kernel spinlock.
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
-use crate::prelude::*;
+use crate::{interrupt::LocalInterruptDisabled, prelude::*};
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -220,6 +220,45 @@ macro_rules! new_spinlock_irq {
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
@@ -283,6 +322,13 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
     }
 }
 
+// SAFETY: When executing with local processor interrupts disabled, [`SpinLock`] and [`SpinLockIrq`]
+// are identical.
+unsafe impl super::BackendWithContext for SpinLockIrqBackend {
+    type Context<'a> = &'a LocalInterruptDisabled;
+    type ContextualBackend = SpinLockBackend;
+}
+
 #[kunit_tests(rust_spinlock_irq_condvar)]
 mod tests {
     use super::*;
-- 
2.52.0

