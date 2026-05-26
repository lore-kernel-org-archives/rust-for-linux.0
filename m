Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC3326C3BD
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 20:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828885; cv=none; b=jJ7eNwEs9YPFk9IniQhTw//hD4ESXhoPmy9W1Mj/fJO9IF9VP/TPAxpGUAKzrM4s1vSGGAdgaqYkuggg62qXV4QQB1e+z6oMo8c+QkvYHXslrmFzC5jv9m6tK7uzLU/NX7I+fgidM6F5Ei4lKcbQOzzLvgrT7fcxj+ei9G97sx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828885; c=relaxed/simple;
	bh=WkWF9E3PYo2ftwN9mjVdhWo+H3ClONdyUEwKj2KXKyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=ao+VZVxfj6DBePCGGX5CkaVZyl0Sh5qtGA5cBNZLuLmiU9Ozbtnf578w/SfCpCIEeXMpcC3tpfdbA6taSK9ci3MjIJHAkbAudxw5Gnm2hxXP77XqiocpWyJqJirUFMDDqS2SG2ikbKsEHSagl60XhxWEuCpIq4JXltXMQMaWNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WphUChFh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WphUChFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779828882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WOfmBRCKxr/gyXVGWymUHEp0qbXUCHLlesjJounLkj0=;
	b=WphUChFhKYBTeaEKYtejb1G7OuFbFlY0clsZ0SdLlDcI0PAYfEjZcX4t5F9FZ44EDCi4J9
	04qiYGTtDpT1ybVGRy25Z2DBCNZmN3PUdHSuJ4hNyAoiwjYdPb6YQ+Pzi8loPdMXk5BGjP
	KdfJl4HkW0cNaw/zCWjjVTBS+EosscI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-146-FPDUYXV9NXu7KGG5-IvBWw-1; Tue,
 26 May 2026 16:54:39 -0400
X-MC-Unique: FPDUYXV9NXu7KGG5-IvBWw-1
X-Mimecast-MFC-AGG-ID: FPDUYXV9NXu7KGG5-IvBWw_1779828877
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1B03195608B;
	Tue, 26 May 2026 20:54:36 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.238])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B9961681;
	Tue, 26 May 2026 20:54:34 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org
Cc: "Gary Guo" <gary@garyguo.net>,
	"Ingo Molnar" <mingo@redhat.com>,
	"Miguel Ojeda" <ojeda@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	"Tamir Duberstein" <tamird@kernel.org>,
	"Boqun Feng" <boqun@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Shankari Anand" <shankari.ak0208@gmail.com>,
	"Viresh Kumar" <viresh.kumar@linaro.org>,
	"Benno Lossin" <lossin@kernel.org>,
	"Will Deacon" <will@kernel.org>,
	"Lyude Paul" <lyude@redhat.com>
Subject: [PATCH 2/2] rust: sync: Introduce LazyInit
Date: Tue, 26 May 2026 16:41:34 -0400
Message-ID: <20260526205419.1055109-3-lyude@redhat.com>
In-Reply-To: <20260526205419.1055109-1-lyude@redhat.com>
References: <20260526205419.1055109-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: j4qP0DZ1FHB1tQtQP7HQaTArY347ouuhmlB7bCFCEdg_1779828877
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

SetOnce is nice, but it does have one problem - you can't use it with
fallible initializers. While we will be adding support for doing that with
SetOnce, this leads into another problem: There's no way for racing callers
to actually block on the initialization of SetOnce, which makes it a
difficult type to use safely for situations where we want to initialize
data fallibly once, and then provide access to it to multiple users at once
until drop.

So to solve this, introduce a new type: LazyInit. LazyInit is like SetOnce
with a couple of important differences:

* It can't be used in const context
* It can handle in-place fallible initializers.
* It uses a Mutex for synchronization instead of an atomic, allowing
  callers to block on initialization.
* It requires its contents already be Send + Sync, since the Mutex protects
  initializing data and not the data itself.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync.rs           |   2 +
 rust/kernel/sync/lazy_init.rs | 354 ++++++++++++++++++++++++++++++++++
 2 files changed, 356 insertions(+)
 create mode 100644 rust/kernel/sync/lazy_init.rs

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 993dbf2caa0e3..d18c26c56c4d2 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -15,6 +15,7 @@
 pub mod barrier;
 pub mod completion;
 mod condvar;
+mod lazy_init;
 pub mod lock;
 mod locked_by;
 pub mod poll;
@@ -25,6 +26,7 @@
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use completion::Completion;
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
+pub use lazy_init::*;
 pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
 pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
 pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
diff --git a/rust/kernel/sync/lazy_init.rs b/rust/kernel/sync/lazy_init.rs
new file mode 100644
index 0000000000000..707af369e965d
--- /dev/null
+++ b/rust/kernel/sync/lazy_init.rs
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Thread-safe Lazy-[`Init`] and [`PinInit`]
+use crate::{
+    prelude::*,
+    sync::{
+        LockClassKey,
+        Mutex,
+        MutexGuard, //
+    },
+};
+use core::{
+    mem::{
+        self,
+        MaybeUninit, //
+    },
+    ptr,
+};
+use pin_init::{
+    pin_init,
+    PinInit, //
+};
+
+/// # Invariants
+///
+/// - `data` is guaranteed to be initialized if `is_init` is `true`.
+/// - `data` is only written to once from `LazyInit::init()`, and once from `LazyInit::reset()`
+///   (which cannot race with `LazyInit::init()` due to requiring a `&mut` reference to the
+///   `LazyInit`).
+#[pin_data(PinnedDrop)]
+struct Inner<T: Send + Sync> {
+    #[pin]
+    data: MaybeUninit<T>,
+    is_init: bool,
+}
+
+#[pinned_drop]
+impl<T: Send + Sync> PinnedDrop for Inner<T> {
+    fn drop(self: Pin<&mut Self>) {
+        if self.is_init {
+            // SAFETY: The only contents from `this` that we move is `is_init`. `is_init` is Unpin,
+            // making this OK.
+            let this = unsafe { self.get_unchecked_mut() };
+
+            // INVARIANT: This is the only place other then `LazyInit::populate()` where we write to
+            // `data`, and this function requires &mut self - ensuring it cannot race with
+            // `LazyInit::populate()`.
+            // SAFETY: Since `is_init` is true, our type invariants guarantee `data` is initialized.
+            unsafe { this.data.assume_init_drop() };
+
+            this.is_init = false;
+        }
+    }
+}
+
+/// Errors that can occur during [`LazyInit::new`].
+#[derive(Debug)]
+pub enum LazyInitError<'a, T: Send + Sync, E = Error> {
+    /// The [`LazyInit`] has already been initialized.
+    ///
+    /// `self.0` contains a reference to the previously initialized value.
+    AlreadyInit(&'a T),
+    /// An error occurred during initialization.
+    DuringInit(E),
+}
+
+impl<'a, T: Send + Sync, E> From<E> for LazyInitError<'a, T, E> {
+    fn from(value: E) -> Self {
+        Self::DuringInit(value)
+    }
+}
+
+/// Creates a [`LazyInit`] initialiser with the given name and newly-created lock class.
+///
+/// It uses the name if one is given, otherwise it generates one based on the file name and line
+/// number.
+#[macro_export]
+macro_rules! new_lazy_init {
+    ($( $name:literal )?) => {
+        $crate::sync::LazyInit::new($crate::optional_name!($($name)?), $crate::static_lock_class!())
+    };
+}
+pub use new_lazy_init;
+
+/// A thread-safe container that allows thread-safe single-time initialization of its contents,
+/// which can then have shared references taken to its contents. It is similar to [`SetOnce`] except
+/// that it uses a [`Mutex`], it can be populated using fallible [`PinInit`] initializers, and
+/// multiple callers attempting to initialize at the same time will block until the conetents of the
+/// [`LazyInit`] is finished initializing.
+///
+/// This type cannot be used in `const` contexts, however, unlike [`SetOnce`] users of this type are
+/// able to block if another thread is busy populating the [`SetOnce`]. This also allows the use of
+/// fallible initializers for population.
+///
+/// This type internally uses a [`Mutex`] for synchronizing creation of `T`, but allows access to
+/// `T` outside of lock post-init. This means that only the initialization of the value is protected
+/// by the lock, and thus `T` must provide it's own synchronization by implementing `Send` + `Sync`.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::{
+///     LazyInit,
+///     LazyInitError,
+///     Arc,
+///     new_lazy_init, //
+/// };
+///
+/// struct Inner {
+///     a: u8,
+/// }
+///
+/// #[pin_data]
+/// struct Example {
+///     #[pin]
+///     lazy: LazyInit<Arc<Inner>>,
+/// }
+///
+/// impl Example {
+///     fn new() -> impl PinInit<Self> {
+///         pin_init!(Self {
+///             lazy <- new_lazy_init!(),
+///         })
+///     }
+/// }
+///
+/// // Allocate a boxed `Example`.
+/// let e = KBox::pin_init(Example::new(), GFP_KERNEL)?;
+///
+/// assert!(e.lazy.init(Arc::init(init!(Inner { a: 42 }), GFP_KERNEL)).is_ok());
+///
+/// // `as_ref()` can be used to get a reference to the contents of a `LazyInit` if its initialized.
+/// assert_eq!(e.lazy.as_ref().unwrap().a, 42);
+///
+/// // If `LazyInit::init()` fails due to the `LazyInit` already being initialized, a reference to
+/// // the initialized data can still be retrieved from the error.
+/// match e.lazy.init(Arc::init(init!(Inner { a: 54 }), GFP_KERNEL)) {
+///     Err(LazyInitError::AlreadyInit(ret)) => assert_eq!(ret.a, 42),
+///     _ => unreachable!(),
+/// }
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// [`SetOnce`]: super::SetOnce
+#[pin_data]
+pub struct LazyInit<T: Send + Sync> {
+    #[pin]
+    inner: Mutex<Inner<T>>,
+}
+
+impl<T: Send + Sync> LazyInit<T> {
+    /// Create a new initializer for an empty [`LazyInit`].
+    pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit<Self> {
+        pin_init!(Self {
+            inner <- Mutex::new(
+                pin_init!(Inner {
+                    data <- MaybeUninit::uninit(),
+                    is_init: false,
+                }),
+                name,
+                key
+            )
+        })
+    }
+
+    /// Retrieve the contents of `inner.data` and extend their lifetime.
+    ///
+    /// # Safety
+    ///
+    /// The caller guarantees that `self.inner.data` has been previously initialized.
+    #[inline(always)]
+    unsafe fn data<'a>(&'a self, inner: &MutexGuard<'_, Inner<T>>) -> &'a T {
+        // SAFETY:
+        // - Our safety contract guarantees `inner.data` is initialized.
+        // - `T` is `Send` + `Sync`, and thus does not need the `Mutex` for synchronization, making
+        //   it safe to hold onto outside of the lock.
+        // - We're guaranteed the container of `T` will not be written to via `Inner`s type
+        //   invariants until `Drop`, ensuring it remains populated for the lifetime of 'a.
+        unsafe { mem::transmute::<&_, &'a _>(inner.data.assume_init_ref()) }
+    }
+
+    /// Attempt to init the contents of [`LazyInit`] and return a reference to its contents.
+    ///
+    /// If the contents of the [`LazyInit`] were already initialized, they will not be
+    /// re-initialized.
+    ///
+    /// Returns:
+    ///
+    /// - `Ok(&T)` if the container was initialized successfully, or if it was already initialized
+    ///   by another user.
+    /// - [`Err(LazyInitError::AlreadyInit)`](LazyInitError::AlreadyInit) if the container was
+    ///   already initialized. This error contains a reference to the contents of the [`LazyInit`].
+    /// - [`Err(LazyInitError::DuringInit)`](LazyInitError::DuringInit) if an error was encountered
+    ///   while trying to initialize this [`LazyInit`].
+    pub fn init<'a, E>(
+        &'a self,
+        init: impl PinInit<T, E>,
+    ) -> Result<&'a T, LazyInitError<'a, T, E>> {
+        let mut inner = self.inner.lock();
+        let do_init = !inner.is_init;
+
+        if do_init {
+            // SAFETY: The only thing that we move is `is_init`, which is Unpin.
+            let inner = unsafe { inner.as_mut().get_unchecked_mut() };
+
+            // INVARIANT: This is the only place we can write to `data` before Drop, fulfilling
+            // `Inner`'s relevant type invariant.
+            //
+            // SAFETY:
+            // - Via Inner's invariants, since we checked `is_init` we're guaranteed `data` is
+            //   uninitialized.
+            // - We do not touch `data` at any point after this if we fail.
+            // - This does not move `data`.
+            unsafe { init.__pinned_init(inner.data.as_mut_ptr()) }?;
+
+            inner.is_init = true;
+        }
+
+        // INVARIANT: This code is only reachable if `data` was, either previously or just now,
+        // initialized with a valid instance of `T`. Otherwise we've never written to it and `data`
+        // is guaranteed to be uninitialized, fulfilling `Inner`s type invariants regarding
+        // `data` initialization state.
+
+        // SAFETY: We confirmed `data` is initialized above.
+        let ret = unsafe { self.data(&inner) };
+
+        match do_init {
+            true => Ok(ret),
+            false => Err(LazyInitError::AlreadyInit(ret)),
+        }
+    }
+
+    /// Get a reference to the contained object.
+    ///
+    /// Returns [`None`] if this [`LazyInit`] is empty.
+    pub fn as_ref<'a>(&'a self) -> Option<&'a T> {
+        let inner = self.inner.lock();
+
+        inner.is_init.then(|| {
+            // SAFETY: This closure can only execute if `inner.is_init` is true, guaranteeing
+            // `inner.data` is initialized via `Inner`s type invariants.
+            unsafe { self.data(&inner) }
+        })
+    }
+
+    /// Release the contents of the [`LazyInit`].
+    ///
+    /// Since this call borrows the [`LazyInit`] mutably, no locking actually needs to take place -
+    /// as parallel lock acquisitions are prevented via the compiler enforcing Rust's borrowing
+    /// rules.
+    ///
+    /// Returns [`true`] if `self` was initialized before calling this function.
+    pub fn reset(self: Pin<&mut Self>) -> bool {
+        let inner = self.project().inner.get_mut_pinned();
+        let was_init = inner.is_init;
+
+        // SAFETY:
+        // - We drop in place, and therefore do not move `inner`
+        // - The `PinnedDrop` implementation of `Inner` leaves it in a well-defined
+        //   state, so we do not need to worry about UB from further usage.
+        unsafe { ptr::drop_in_place(inner.get_unchecked_mut()) };
+
+        was_init
+    }
+}
+
+#[kunit_tests(rust_lazy_init)]
+mod tests {
+    use super::*;
+    use core::ops::Deref;
+    use pin_init::{
+        init_from_closure,
+        stack_pin_init, //
+    };
+
+    #[derive(Debug)]
+    #[pin_data]
+    struct LazyInitTest {}
+
+    impl LazyInitTest {
+        fn init_ok() -> impl Init<Self> {
+            init!(LazyInitTest {})
+        }
+
+        fn init_err(e: Error) -> impl Init<Self, Error> {
+            // SAFETY:
+            // This initializer is intended to fail for testing purposes, and does not actually
+            // initialize any data meaning:
+            //
+            // - We don't need to worry about returning Ok(()).
+            // - We have nothing to actually clean in the slot.
+            // - Since there is no data in the slot, nothing can meaningfully move and we have no
+            //   pinning invariants.
+            unsafe { init_from_closure(move |_| Err(e)) }
+        }
+    }
+
+    fn try_lazy_init(once: &LazyInit<LazyInitTest>) -> Result<(), Error> {
+        // It should start as being empty.
+        assert!((*once).as_ref().is_none());
+
+        // Try populating it a single time, this should succeed.
+        let res = once.init(LazyInitTest::init_ok()).map_err(|_| EINVAL)?;
+        assert!((*once).as_ref().is_some());
+
+        // Populating a second time should fail and return the contents.
+        match once.init(LazyInitTest::init_ok()) {
+            Err(LazyInitError::AlreadyInit(data)) => assert!(core::ptr::eq(data, res)),
+            r @ _ => panic!("Calling once.init() twice returned unexpected value: {r:?}"),
+        }
+
+        // And it should still hold a value
+        assert!((*once).as_ref().is_some());
+
+        Ok(())
+    }
+
+    #[test]
+    fn lazy_init() -> Result {
+        stack_pin_init!(let once: LazyInit<LazyInitTest> = new_lazy_init!());
+
+        try_lazy_init(&once)?;
+        Ok(())
+    }
+
+    #[test]
+    fn lazy_init_error() -> Result {
+        stack_pin_init!(let once: LazyInit<LazyInitTest> = new_lazy_init!());
+
+        // Make sure it starts as empty.
+        assert!((*once).as_ref().is_none());
+
+        // Try populating it with a initializer that fails.
+        match once.init(LazyInitTest::init_err(EJUKEBOX)) {
+            Err(LazyInitError::DuringInit(e)) => assert_eq!(e, EJUKEBOX),
+            r @ _ => panic!(
+                "Calling once.init() with a failing initializer returned an unexpected value: {r:?}"
+            ),
+        }
+
+        try_lazy_init(&once)?;
+        Ok(())
+    }
+
+    #[test]
+    fn lazy_init_reset() -> Result {
+        stack_pin_init!(let once: LazyInit<LazyInitTest> = new_lazy_init!());
+
+        try_lazy_init(&once)?;
+        assert_eq!(once.as_mut().reset(), true);
+        assert_eq!(once.as_mut().reset(), false);
+        try_lazy_init(&once)
+    }
+}
-- 
2.54.0

