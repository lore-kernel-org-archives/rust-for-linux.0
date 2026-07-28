Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D513C3F7D
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231186; cv=none; b=EuYj3Y1TP9bAYISiVAwBBCcXWaG39KcuRhGKrSWVjg5J6BqyXR8VxAEO1jh4j2xlZPX/NVV3WnBAGnXCHilriusaREgX0cGAZ4u87adBI7uVJahxxr4ZKULrFbipueJH0I0v12i6JfSVhF702I0Kj34lgcxpb8xwG8yUa1ZuyXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231186; c=relaxed/simple;
	bh=JhpcOG3Zz1HctB3gNnbzyFoa3qgSKxMFzg4d+cIf1Qk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J4P9D0Vzwh6BLCj6Cq7HSTb2Nnyypugemq34bad+OvLUECyP03jW+rCceUSKQLd3a+Gl/K8cs9aAY1UbS6FWhHzEgYS1lXudWgk3UsfKcl875IHATEccUZg5ZvD1lZ4xlSXu3CFY2Dqs8ftCMtmdZVw5Ft3QJsH7G5l5cFPzqwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OqAEwcAS; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OqAEwcAS"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f8580ed9eso3099277f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 02:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785231182; x=1785835982; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5t+U8RETtK22WOse8MyplQsC9iqz9nTAGDkXGx7u+B4=;
        b=OqAEwcASUf9XVcMCB5InwO/hb1InvjvDBiyDSetSv5dfxD3QOC0LBuYE7vck/r9Eby
         CKdHkOvKNJZxFrFdR1Nj2ga+rfNneLyk+k4yg+k26f97MzZRJb41SUT21bwIjk84jnXN
         f+Fj44WQHfjS+7FLxOTMZgVumJaJmUcABCJH+RsOnvcWDZG8uOclB413U6+6j1orDfaU
         MuRT5rnyp58wQN4acSJqGw9uY9KMoSuKBUh6W/QlviKk8rRUii0LTtu7rg8TDY86tPNA
         RZBS7bDIq+vUoeNrARwkRAvm30o4mvnWcY6zwBEUN2RYzCmrh82u1ibcOSW9hbDnFVy/
         W8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231182; x=1785835982;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5t+U8RETtK22WOse8MyplQsC9iqz9nTAGDkXGx7u+B4=;
        b=ctTuvfbNO8lUCfsXS4FZXgveJFnKz4AoEhQM3Lrt3uI7bw5DDwp305InEdV5lfP8I0
         khxpMJ6SZ9e+dPgi8y6ilmtiwkRyGDh1Yk3CDfCjHbU1O3g9JmZTOC0mPm67cCJFVu9g
         otBqSDxJpXyjvXwHV5AU2d2uiREsRm/xLN+JFTyfVAWw88/eM8LoexitNA0aEb980GoB
         yqWzS8eKuIeQOZskZmfrtpaQIGhfqrJjqufVzDV/QKPH0ROQ6lUA+TZIiR5l3pc6v2w6
         v1QZJqpwjpnG/dfo1iUCCW9CoERKSwoGAMvCVRrPlCTwHXwAnVOfRO9+4s3xBGw7/wjy
         GEpg==
X-Forwarded-Encrypted: i=1; AHgh+RofvJgdLxFX0ho1Qn3uIKPT+Pk+JqDif+hMd1Qz6iAZhNkG6ue/tLNPHtpsmNO985j/C+av29ncKE/vW94e+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIRpCV6r2tAJxv/sWdqGfdS1vcEcLLCV/VAMgNU7VzAgLNP1OU
	7ML39V7KTzhLXM/xiUR6MgJkvPN3CpWCw9InB/zQ+QQV6lP+fM4GiJOkcB4LjAjLnUTnc5clkSb
	6w+fm22T1otQIsiykyA==
X-Received: from wmbjv10.prod.google.com ([2002:a05:600c:570a:b0:492:346d:8d96])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8485:b0:493:f822:ac5e with SMTP id 5b1f17b1804b1-496c6590688mr16382205e9.23.1785231181935;
 Tue, 28 Jul 2026 02:33:01 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:32:51 +0000
In-Reply-To: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11681; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JhpcOG3Zz1HctB3gNnbzyFoa3qgSKxMFzg4d+cIf1Qk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqaHdK9XAgER4zeN+IzR3W7c71UlGD+LopYi8lg
 3q5QaHi1TGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamh3SgAKCRAEWL7uWMY5
 RswoD/9Jk9e8pP6gKhD8zTW4Q+SrYO+qqVJZZFaKYfKZD2ALjbQ/V/Z5J5kPP43NkHLAulhJ7x5
 OMZew6r2K3BXSRHQOCaP9S3o7sX0Jw6OklLdV8sAxwRDeOmTVeG6syDpg0lcpXl5y7BnJ+3tdMU
 1lT6+rA2xBT7zM/H8xd23AP4rmcWDFDtG/8s2VEV752TsepIDT2oaz9f6GFCBwItVpM7I4gK0hd
 7bcwdlDl9k5RnTlP3DczuhCiH1TjvuNFSpE1gdqVCRSRDiqFbA1swiJMsHSp5lRwOSu+ZW+q7M/
 pLLoTB0IR5GeD2x6PSTF4SjgKx59L+b0OcMvEUOybjZdjHj7UCLxP3ggje5PD9WxQVrrj6dFaH4
 CXfBVpwJSvuoujgPcn7apoxHZfAZShSc5q9TCGk/0zHVSqDAElRGlzOHYKVzqSswDslUn/Q77KS
 oP8fr6IzF6lWCHzmbQeksW7j7OEQSH1qqxNbufhlX3V17zyIolrVNAa0j/dQ9kQ6qNOidnuWFPT
 qryPDhXP6CV4Ww/0t0Pe4VDJCRw1tVAlGwELHV+Mm3cAMjK1qjPlUizzKelBlLpAzQ3I5fn2/BY
 1wdy660IJgVRwD9BI4Vhn/QERBrXu60hZw38SjbDqUB9KaQe/jpf69KWgKQ1mUWjMhyroB2HHW/ OhU+a6KMjzu1O9w==
X-Mailer: b4 0.14.3
Message-ID: <20260728-pr-ratelimited-v4-1-435f8d6e9605@google.com>
Subject: [PATCH v4 1/5] rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The lockdep types are currently stored directly in rust/kernel/sync.rs,
but there are starting to be too many of them to keep them in that file.
Thus, move them to a submodule. The new module is listed under LOCKING
PRIMITIVES in the MAINTAINERS file.

For commonly used lockdep logic it's useful to keep re-exports in
kernel::sync, and this also avoids the need to update any users.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Boqun Feng <boqun@kernel.org>
Reviewed-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                 |   1 +
 rust/kernel/sync.rs         | 135 +-----------------------------------------
 rust/kernel/sync/lockdep.rs | 139 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+), 133 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c01afd563d6..31e126d9e30b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15159,6 +15159,7 @@ F:	rust/helpers/mutex.c
 F:	rust/helpers/spinlock.c
 F:	rust/kernel/sync/lock.rs
 F:	rust/kernel/sync/lock/
+F:	rust/kernel/sync/lockdep.rs
 F:	rust/kernel/sync/locked_by.rs
 X:	kernel/locking/locktorture.c
 
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 993dbf2caa0e..e87a7e339994 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -5,10 +5,6 @@
 //! This module contains the kernel APIs related to synchronisation that have been ported or
 //! wrapped for usage by Rust code in the kernel.
 
-use crate::prelude::*;
-use crate::types::Opaque;
-use pin_init;
-
 mod arc;
 pub mod aref;
 pub mod atomic;
@@ -16,6 +12,7 @@
 pub mod completion;
 mod condvar;
 pub mod lock;
+pub mod lockdep;
 mod locked_by;
 pub mod poll;
 pub mod rcu;
@@ -28,135 +25,7 @@
 pub use lock::global::{global_lock, GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
 pub use lock::mutex::{new_mutex, Mutex, MutexGuard};
 pub use lock::spinlock::{new_spinlock, SpinLock, SpinLockGuard};
+pub use lockdep::{static_lock_class, LockClassKey};
 pub use locked_by::LockedBy;
 pub use refcount::Refcount;
 pub use set_once::SetOnce;
-
-/// Represents a lockdep class.
-///
-/// Wraps the kernel's `struct lock_class_key`.
-#[repr(transparent)]
-#[pin_data(PinnedDrop)]
-pub struct LockClassKey {
-    #[pin]
-    inner: Opaque<bindings::lock_class_key>,
-}
-
-// SAFETY: Unregistering a lock class key from a different thread than where it was registered is
-// allowed.
-unsafe impl Send for LockClassKey {}
-
-// SAFETY: `bindings::lock_class_key` is designed to be used concurrently from multiple threads and
-// provides its own synchronization.
-unsafe impl Sync for LockClassKey {}
-
-impl LockClassKey {
-    /// Initializes a statically allocated lock class key.
-    ///
-    /// This is usually used indirectly through the [`static_lock_class!`] macro. See its
-    /// documentation for more information.
-    ///
-    /// # Safety
-    ///
-    /// * Before using the returned value, it must be pinned in a static memory location.
-    /// * The destructor must never run on the returned `LockClassKey`.
-    pub const unsafe fn new_static() -> Self {
-        LockClassKey {
-            inner: Opaque::uninit(),
-        }
-    }
-
-    /// Initializes a dynamically allocated lock class key.
-    ///
-    /// In the common case of using a statically allocated lock class key, the
-    /// [`static_lock_class!`] macro should be used instead.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// use kernel::alloc::KBox;
-    /// use kernel::types::ForeignOwnable;
-    /// use kernel::sync::{LockClassKey, SpinLock};
-    /// use pin_init::stack_pin_init;
-    ///
-    /// let key = KBox::pin_init(LockClassKey::new_dynamic(), GFP_KERNEL)?;
-    /// let key_ptr = key.into_foreign();
-    ///
-    /// {
-    ///     stack_pin_init!(let num: SpinLock<u32> = SpinLock::new(
-    ///         0,
-    ///         c"my_spinlock",
-    ///         // SAFETY: `key_ptr` is returned by the above `into_foreign()`, whose
-    ///         // `from_foreign()` has not yet been called.
-    ///         unsafe { <Pin<KBox<LockClassKey>> as ForeignOwnable>::borrow(key_ptr) }
-    ///     ));
-    /// }
-    ///
-    /// // SAFETY: We dropped `num`, the only use of the key, so the result of the previous
-    /// // `borrow` has also been dropped. Thus, it's safe to use from_foreign.
-    /// unsafe { drop(<Pin<KBox<LockClassKey>> as ForeignOwnable>::from_foreign(key_ptr)) };
-    /// # Ok::<(), Error>(())
-    /// ```
-    pub fn new_dynamic() -> impl PinInit<Self> {
-        pin_init!(Self {
-            // SAFETY: lockdep_register_key expects an uninitialized block of memory
-            inner <- Opaque::ffi_init(|slot| unsafe { bindings::lockdep_register_key(slot) })
-        })
-    }
-
-    /// Returns a raw pointer to the inner C struct.
-    ///
-    /// It is up to the caller to use the raw pointer correctly.
-    pub fn as_ptr(&self) -> *mut bindings::lock_class_key {
-        self.inner.get()
-    }
-}
-
-#[pinned_drop]
-impl PinnedDrop for LockClassKey {
-    fn drop(self: Pin<&mut Self>) {
-        // SAFETY: `self.as_ptr()` was registered with lockdep and `self` is pinned, so the address
-        // hasn't changed. Thus, it's safe to pass it to unregister.
-        unsafe { bindings::lockdep_unregister_key(self.as_ptr()) }
-    }
-}
-
-/// Defines a new static lock class and returns a pointer to it.
-///
-/// # Examples
-///
-/// ```
-/// use kernel::sync::{static_lock_class, Arc, SpinLock};
-///
-/// fn new_locked_int() -> Result<Arc<SpinLock<u32>>> {
-///     Arc::pin_init(SpinLock::new(
-///         42,
-///         c"new_locked_int",
-///         static_lock_class!(),
-///     ), GFP_KERNEL)
-/// }
-/// ```
-#[macro_export]
-macro_rules! static_lock_class {
-    () => {{
-        static CLASS: $crate::sync::LockClassKey =
-            // SAFETY: The returned `LockClassKey` is stored in static memory and we pin it. Drop
-            // never runs on a static global.
-            unsafe { $crate::sync::LockClassKey::new_static() };
-        $crate::prelude::Pin::static_ref(&CLASS)
-    }};
-}
-pub use static_lock_class;
-
-/// Returns the given string, if one is provided, otherwise generates one based on the source code
-/// location.
-#[doc(hidden)]
-#[macro_export]
-macro_rules! optional_name {
-    () => {
-        $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()))
-    };
-    ($name:literal) => {
-        $crate::c_str!($name)
-    };
-}
diff --git a/rust/kernel/sync/lockdep.rs b/rust/kernel/sync/lockdep.rs
new file mode 100644
index 000000000000..784821cc2a39
--- /dev/null
+++ b/rust/kernel/sync/lockdep.rs
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Utilities related to lockdep.
+//!
+//! C headers: [`include/linux/lockdep.h`](srctree/include/linux/lockdep.h)
+
+use crate::{
+    prelude::*,
+    types::Opaque, //
+};
+
+/// Represents a lockdep class.
+///
+/// Wraps the kernel's `struct lock_class_key`.
+#[repr(transparent)]
+#[pin_data(PinnedDrop)]
+pub struct LockClassKey {
+    #[pin]
+    inner: Opaque<bindings::lock_class_key>,
+}
+
+// SAFETY: Unregistering a lock class key from a different thread than where it was registered is
+// allowed.
+unsafe impl Send for LockClassKey {}
+
+// SAFETY: `bindings::lock_class_key` is designed to be used concurrently from multiple threads and
+// provides its own synchronization.
+unsafe impl Sync for LockClassKey {}
+
+impl LockClassKey {
+    /// Initializes a statically allocated lock class key.
+    ///
+    /// This is usually used indirectly through the [`static_lock_class!`] macro. See its
+    /// documentation for more information.
+    ///
+    /// # Safety
+    ///
+    /// * Before using the returned value, it must be pinned in a static memory location.
+    /// * The destructor must never run on the returned `LockClassKey`.
+    pub const unsafe fn new_static() -> Self {
+        LockClassKey {
+            inner: Opaque::uninit(),
+        }
+    }
+
+    /// Initializes a dynamically allocated lock class key.
+    ///
+    /// In the common case of using a statically allocated lock class key, the
+    /// [`static_lock_class!`] macro should be used instead.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::alloc::KBox;
+    /// use kernel::types::ForeignOwnable;
+    /// use kernel::sync::{LockClassKey, SpinLock};
+    /// use pin_init::stack_pin_init;
+    ///
+    /// let key = KBox::pin_init(LockClassKey::new_dynamic(), GFP_KERNEL)?;
+    /// let key_ptr = key.into_foreign();
+    ///
+    /// {
+    ///     stack_pin_init!(let num: SpinLock<u32> = SpinLock::new(
+    ///         0,
+    ///         c"my_spinlock",
+    ///         // SAFETY: `key_ptr` is returned by the above `into_foreign()`, whose
+    ///         // `from_foreign()` has not yet been called.
+    ///         unsafe { <Pin<KBox<LockClassKey>> as ForeignOwnable>::borrow(key_ptr) }
+    ///     ));
+    /// }
+    ///
+    /// // SAFETY: We dropped `num`, the only use of the key, so the result of the previous
+    /// // `borrow` has also been dropped. Thus, it's safe to use from_foreign.
+    /// unsafe { drop(<Pin<KBox<LockClassKey>> as ForeignOwnable>::from_foreign(key_ptr)) };
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn new_dynamic() -> impl PinInit<Self> {
+        pin_init!(Self {
+            // SAFETY: lockdep_register_key expects an uninitialized block of memory
+            inner <- Opaque::ffi_init(|slot| unsafe { bindings::lockdep_register_key(slot) })
+        })
+    }
+
+    /// Returns a raw pointer to the inner C struct.
+    ///
+    /// It is up to the caller to use the raw pointer correctly.
+    pub fn as_ptr(&self) -> *mut bindings::lock_class_key {
+        self.inner.get()
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for LockClassKey {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: `self.as_ptr()` was registered with lockdep and `self` is pinned, so the address
+        // hasn't changed. Thus, it's safe to pass it to unregister.
+        unsafe { bindings::lockdep_unregister_key(self.as_ptr()) }
+    }
+}
+
+/// Defines a new static lock class and returns a pointer to it.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sync::{static_lock_class, Arc, SpinLock};
+///
+/// fn new_locked_int() -> Result<Arc<SpinLock<u32>>> {
+///     Arc::pin_init(SpinLock::new(
+///         42,
+///         c"new_locked_int",
+///         static_lock_class!(),
+///     ), GFP_KERNEL)
+/// }
+/// ```
+#[macro_export]
+macro_rules! static_lock_class {
+    () => {{
+        static CLASS: $crate::sync::LockClassKey =
+            // SAFETY: The returned `LockClassKey` is stored in static memory and we pin it. Drop
+            // never runs on a static global.
+            unsafe { $crate::sync::LockClassKey::new_static() };
+        $crate::prelude::Pin::static_ref(&CLASS)
+    }};
+}
+pub use static_lock_class;
+
+/// Returns the given string, if one is provided, otherwise generates one based on the source code
+/// location.
+#[doc(hidden)]
+#[macro_export]
+macro_rules! optional_name {
+    () => {
+        $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()))
+    };
+    ($name:literal) => {
+        $crate::c_str!($name)
+    };
+}

-- 
2.55.0.229.g6434b31f56-goog

