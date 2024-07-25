Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA0E149C74
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jul 2024 22:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721946547; cv=none; b=aBmFvRulyGX13TVuHr/ZhgcuekrDTX9vnDafwdfHXHO2EStAYgoIbt8Duau8q1lNPu1gYGF8sBWliBDrh5S41Bm53bYrmDyzJ30QZErnXsXBUrNXo+1xkmD693UtTcCrMddOW5xr3XYKJAzTZWtr8MZ+UZnc5jULKH49UzpUpzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721946547; c=relaxed/simple;
	bh=UpE/KlSAvjJRssU1QWm5QjKZZb8uvq6GbKMRucyy1wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zhkq5eeJfvSRYQYYO3PpP+cG7twnfIOB1tJ3TX/cqkEkf7Gyka2RlHCEjlzY5i5NBHRpmd/J2T951SwV/Uzzxti1g3xzgTDEWOhJubvaDrlSQCfotoxweYhGLLHy71fQSwNAvsP420+Mg/l5eQUe1+f76gh6+Jhg07MomO5k+lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N+8qc+yt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N+8qc+yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721946545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKry+1+I9j1B94z4/fSmsOA44XHb4W8hd+f97cYKsJs=;
	b=N+8qc+ytcOyoGasclX9ApYjUJXRnvQGps05Ub5NEJcHc9BkXP+ejNhqSYuVMLIrxQ4pDnB
	0KE5+moigdInxgkRVKWfKX6NdJwi8xsaEeWnqB6ZNE1YD7PJFPu6p1lW3LGy4f97ecGJpG
	29FrsNRDP8QRrAGdfan9L8tDRQHt6CU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-vUfrPBynMempMfjl1qM0cw-1; Thu,
 25 Jul 2024 18:28:58 -0400
X-MC-Unique: vUfrPBynMempMfjl1qM0cw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57E3B1955D42;
	Thu, 25 Jul 2024 22:28:56 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.33.21])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B6913000194;
	Thu, 25 Jul 2024 22:28:52 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@redhat.com>,
	airlied@redhat.com,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] rust: sync: Add IrqSpinLock
Date: Thu, 25 Jul 2024 18:27:52 -0400
Message-ID: <20240725222822.1784931-4-lyude@redhat.com>
In-Reply-To: <20240725222822.1784931-1-lyude@redhat.com>
References: <20240725222822.1784931-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

A variant of SpinLock that is expected to be used in noirq contexts, and
thus requires that the user provide an kernel::irq::IrqDisabled to prove
they are in such a context upon lock acquisition. This is the rust
equivalent of spin_lock_irqsave()/spin_lock_irqrestore().

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/sync.rs               |   2 +-
 rust/kernel/sync/lock/spinlock.rs | 101 ++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 14a79ebbb42d5..d3e2e9cb0e120 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -15,7 +15,7 @@
 pub use arc::{Arc, ArcBorrow, UniqueArc};
 pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
 pub use lock::mutex::{new_mutex, Mutex};
-pub use lock::spinlock::{new_spinlock, SpinLock};
+pub use lock::spinlock::{new_irq_spinlock, new_spinlock, IrqSpinLock, SpinLock};
 pub use lock::LockContainer;
 pub use locked_by::LockedBy;
 
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index ea5c5bc1ce12e..f63c75c19344f 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -3,6 +3,8 @@
 //! A kernel spinlock.
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
+use core::marker::*;
+use kernel::{irq::*, prelude::*};
 
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
@@ -115,3 +117,102 @@ unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
         unsafe { bindings::spin_unlock(ptr) }
     }
 }
+
+/// Creates a [`IrqSpinLock`] initialiser with the given name and a newly-created lock class.
+///
+/// It uses the name if one is given, otherwise it generates one based on the file name and line
+/// number.
+#[macro_export]
+macro_rules! new_irq_spinlock {
+    ($inner:expr $(, $name:literal)? $(,)?) => {
+        $crate::sync::IrqSpinLock::new(
+            $inner, $crate::optional_name!($($name)?), $crate::static_lock_class!())
+    };
+}
+pub use new_irq_spinlock;
+
+/// A spinlock that may be acquired when interrupts are disabled.
+///
+/// A version of [`SpinLock`] that can only be used in contexts where interrupts for the local CPU
+/// are disabled. It requires that the user acquiring the lock provide proof that interrupts are
+/// disabled through [`IrqDisabled`]
+///
+/// For more info, see [`SpinLock`].
+///
+/// # Examples
+///
+/// The following example shows how to declare, allocate initialise and access a struct (`Example`)
+/// that contains an inner struct (`Inner`) that is protected by a spinlock.
+///
+/// ```
+/// use kernel::{
+///     sync::{new_irq_spinlock, IrqSpinLock},
+///     irq::{with_irqs_disabled, IrqDisabled}
+/// };
+///
+/// struct Inner {
+///     a: u32,
+///     b: u32,
+/// }
+///
+/// #[pin_data]
+/// struct Example {
+///     c: u32,
+///     #[pin]
+///     d: IrqSpinLock<Inner>,
+/// }
+///
+/// impl Example {
+///     fn new() -> impl PinInit<Self> {
+///         pin_init!(Self {
+///             c: 10,
+///             d <- new_irq_spinlock!(Inner { a: 20, b: 30 }),
+///         })
+///     }
+/// }
+///
+/// // Accessing an `Example` from a function that can only be called in no-irq contexts
+/// fn noirq_work(e: &Example, irq: &IrqDisabled<'_>) {
+///     assert_eq!(e.c, 10);
+///     assert_eq!(e.d.lock(&irq).a, 20);
+/// }
+///
+/// // Allocate a boxed `Example`
+/// let e = Box::pin_init(Example::new(), GFP_KERNEL)?;
+///
+/// // Accessing an `Example` from a context where IRQs may not be disabled already.
+/// let b = with_irqs_disabled(|irq| {
+///     noirq_work(&e, &irq);
+///     e.d.lock(&irq).b
+/// );
+/// assert_eq!(b, 30);
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data]
+pub struct IrqSpinLock<T> {
+    #[pin]
+    inner: SpinLock<T>,
+    #[pin]
+    _p: PhantomPinned,
+}
+
+impl<T> IrqSpinLock<T> {
+    /// Constructs a new IRQ spinlock initialiser
+    pub fn new(t: T, name: &'static CStr, key: &'static super::LockClassKey) -> impl PinInit<Self> {
+        pin_init!(Self {
+            inner <- SpinLock::new(t, name, key),
+            _p: PhantomPinned,
+        })
+    }
+
+    /// Acquires the lock and gives the caller access to the data protected by it
+    pub fn lock<'a>(&'a self, _irq: &'a IrqDisabled<'a>) -> super::Guard<'a, T, SpinLockBackend> {
+        self.inner.lock()
+    }
+}
+
+impl<T> super::LockContainer<T, SpinLockBackend> for IrqSpinLock<T> {
+    unsafe fn get_lock_ref(&self) -> &super::Lock<T, SpinLockBackend> {
+        &self.inner
+    }
+}
-- 
2.45.2

