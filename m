Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095F3385AA
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 18:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765821913; cv=none; b=CqAVGvNuDxJ4IQs9f8fY6lFZEzICgyJ14mzrMeOo+wa5IVcMBVOGLYnfyWvptExr3ZfrVN7LDZPy/uIu1R8V1WXoZd2BnJz2SFDgzNFEVP9K9wEImp+L2IwusSUd0cppHn6+CBfeZgv4Wi6Xa7+P9LPErSrc6bt/J86tQUTfFEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765821913; c=relaxed/simple;
	bh=7kYeJC+PKDePcSPxfUhPBrOdJchIEOEf5xR2h1Ww+5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hKy40TXYxL/nBRWdAIpWZSzUbeY5o+mn/c0RU2s3x4UUdoC2qiPcYj0kXDK8BSH1NFq6iBomhbqdk4+eam6q7rpTlHAT/oBCJYoV5ZydSMhchfoR4rOUq0nc0Aid+KBOKpFaZBx34XCh5DaP9L2jXIw4h1HbKvertyC6lur8nXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuIFVQRR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuIFVQRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765821910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ti5msfkMSTNbClRocDHXSKKV1CsLVFfaetmLCgzkRhQ=;
	b=VuIFVQRRucfzAbiUHJ7JHCZ4SeIDN0pLEzxYkS1cKz8SLWT70X4w5pNNU5xQz+0aPLTt/7
	OS82SdKPfIQZq1qKvz618wCVjwH9yPG72+ZRvBYoVkHGnQ0cVm5abI8w/XvxVLn6vibR5X
	Lwmj7YB0zAL0MrB2OoiTFKa9HuAMwvY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-Dy_KiyviNZyqxd70-o1WfA-1; Mon,
 15 Dec 2025 13:02:55 -0500
X-MC-Unique: Dy_KiyviNZyqxd70-o1WfA-1
X-Mimecast-MFC-AGG-ID: Dy_KiyviNZyqxd70-o1WfA_1765821768
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D444183459C;
	Mon, 15 Dec 2025 17:59:07 +0000 (UTC)
Received: from chopper.lan (unknown [10.22.81.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4F69E180045B;
	Mon, 15 Dec 2025 17:59:02 +0000 (UTC)
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
Subject: [PATCH v16 11/17] rust: sync: lock: Add `Backend::BackendInContext`
Date: Mon, 15 Dec 2025 12:57:58 -0500
Message-ID: <20251215175806.102713-12-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-1-lyude@redhat.com>
References: <20251215175806.102713-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

From: Boqun Feng <boqun.feng@gmail.com>

`SpinLockIrq` and `SpinLock` use the exact same underlying C structure,
with the only real difference being that the former uses the irq_disable()
and irq_enable() variants for locking/unlocking. These variants can
introduce some minor overhead in contexts where we already know that
local processor interrupts are disabled, and as such we want a way to be
able to skip modifying processor interrupt state in said contexts in order
to avoid some overhead - just like the current C API allows us to do. So,
`BackendInContext` allows us to cast a lock into it's contextless version
for situations where we already have whatever guarantees would be provided
by `Backend::Context` in place.

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

Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V10:
* Fix typos - Dirk/Lyude
* Since we're adding support for context locks to GlobalLock as well, let's
  also make sure to cover try_lock while we're at it and add try_lock_with
* Add a private function as_lock_in_context() for handling casting from a
  Lock<T, B> to Lock<T, B::BackendInContext> so we don't have to duplicate
  safety comments
V11:
* Fix clippy::ref_as_ptr error in Lock::as_lock_in_context()
V14:
* Add benchmark results, rewrite commit message

 rust/kernel/sync/lock.rs          | 61 ++++++++++++++++++++++++++++++-
 rust/kernel/sync/lock/mutex.rs    |  1 +
 rust/kernel/sync/lock/spinlock.rs | 41 +++++++++++++++++++++
 3 files changed, 101 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index bf2d94c1999bd..938ffe1bac06c 100644
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
@@ -47,6 +52,9 @@ pub unsafe trait Backend {
     /// The context which can be provided to acquire the lock with a different backend.
     type Context<'a>;
 
+    /// The alternative backend we can use if a [`Context`](Backend::Context) is provided.
+    type BackendInContext: Sized;
+
     /// Initialises the lock.
     ///
     /// # Safety
@@ -171,10 +179,59 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
 }
 
 impl<T: ?Sized, B: Backend> Lock<T, B> {
+    /// Casts the lock as a `Lock<T, B::BackendInContext>`.
+    fn as_lock_in_context<'a>(
+        &'a self,
+        _context: B::Context<'a>,
+    ) -> &'a Lock<T, B::BackendInContext>
+    where
+        B::BackendInContext: Backend,
+    {
+        // SAFETY:
+        // - Per the safety guarantee of `Backend`, if `B::BackendInContext` and `B` should
+        //   have the same state, the layout of the lock is the same so it's safe to convert one to
+        //   another.
+        // - The caller provided `B::Context<'a>`, so it is safe to recast and return this lock.
+        unsafe { &*(core::ptr::from_ref(self) as *const _) }
+    }
+
     /// Acquires the lock with the given context and gives the caller access to the data protected
     /// by it.
-    pub fn lock_with<'a>(&'a self, _context: B::Context<'a>) -> Guard<'a, T, B> {
-        todo!()
+    pub fn lock_with<'a>(&'a self, context: B::Context<'a>) -> Guard<'a, T, B::BackendInContext>
+    where
+        B::BackendInContext: Backend,
+    {
+        let lock = self.as_lock_in_context(context);
+
+        // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
+        // that `init` was called. Plus the safety guarantee of `Backend` guarantees that `B::State`
+        // is the same as `B::BackendInContext::State`, also it's safe to call another backend
+        // because there is `B::Context<'a>`.
+        let state = unsafe { B::BackendInContext::lock(lock.state.get()) };
+
+        // SAFETY: The lock was just acquired.
+        unsafe { Guard::new(lock, state) }
+    }
+
+    /// Tries to acquire the lock with the given context.
+    ///
+    /// Returns a guard that can be used to access the data protected by the lock if successful.
+    pub fn try_lock_with<'a>(
+        &'a self,
+        context: B::Context<'a>,
+    ) -> Option<Guard<'a, T, B::BackendInContext>>
+    where
+        B::BackendInContext: Backend,
+    {
+        let lock = self.as_lock_in_context(context);
+
+        // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
+        // that `init` was called. Plus the safety guarantee of `Backend` guarantees that `B::State`
+        // is the same as `B::BackendInContext::State`, also it's safe to call another backend
+        // because there is `B::Context<'a>`.
+        unsafe {
+            B::BackendInContext::try_lock(lock.state.get()).map(|state| Guard::new(lock, state))
+        }
     }
 
     /// Acquires the lock and gives the caller access to the data protected by it.
diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
index be1e2e18cf42d..662a530750703 100644
--- a/rust/kernel/sync/lock/mutex.rs
+++ b/rust/kernel/sync/lock/mutex.rs
@@ -102,6 +102,7 @@ unsafe impl super::Backend for MutexBackend {
     type State = bindings::mutex;
     type GuardState = ();
     type Context<'a> = ();
+    type BackendInContext = ();
 
     unsafe fn init(
         ptr: *mut Self::State,
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 70d19a2636afe..81384ea239955 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -102,6 +102,7 @@ unsafe impl super::Backend for SpinLockBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
     type Context<'a> = ();
+    type BackendInContext = ();
 
     unsafe fn init(
         ptr: *mut Self::State,
@@ -221,6 +222,45 @@ macro_rules! new_spinlock_irq {
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
@@ -245,6 +285,7 @@ unsafe impl super::Backend for SpinLockIrqBackend {
     type State = bindings::spinlock_t;
     type GuardState = ();
     type Context<'a> = &'a LocalInterruptDisabled;
+    type BackendInContext = SpinLockBackend;
 
     unsafe fn init(
         ptr: *mut Self::State,
-- 
2.52.0

