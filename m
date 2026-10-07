Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8115B468C27
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383430; cv=none; b=G5jF3GrGH6dbJq1JNzca0dr8NiKTuxlluXfKn+LQ3lfTjte7WhTFBd0eijv35mra5wsW4+VMO0S/B1Fy3NiPPAoRMpcCRwYgF2VD9DrntQO5WyF3oL68fkgPJvYQpWNlJtrBUwYOlYdZmoSkaqBbdlsFe1QBILGAxDxDCc0lT9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383430; c=relaxed/simple;
	bh=Qfli/8yFD2jARriIawOhQs/GAKYSJIucQKH/lIezYOc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h7lreyz7SDh2Xv9+uztLCfYpVeOfveOcVXq89LEkwO42a6iKTSTqP+WyVo65qD2Xu9f7ua7A6XRm7FpGE5LWT4q/TkLtygzeFG57GhTRIbBCZlJrZdgiHBbGfOAkdV5ySRG9bF/CXiE+pKyCqBJ7yRRxGQi+DuiQdeXiGWWPbSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HxgBRdjU; arc=none smtp.client-ip=209.85.221.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HxgBRdjU"
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c46582442so2119575f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383419; x=1791988219; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=53KwSMYJX4+uA9WreYswvyBSh7+MhNbzUNt0tODS6tk=;
        b=HxgBRdjU1JdnrKGb9hniEejAhRB9AWHF+5hPiWB14hMVG3Pdf+6MYgdlBT1HyIpFGX
         mOie7s0dClBc95/CUQx1eRBfeDcrbxwhBtCunpAbpjZ9QVD6Sk0OtFfCLCIOnNjgrqvM
         dRcRGN6RORgdUeftk8jxKwHm9zL48myh845+4N83L42ryP3HkqUW41NUbQzwYwNowSda
         7KBDvFDo4JMRfSgPai3LMuN7Xvx1sL2+6/Jy3/MlBf+cx+fwvzJx4pyktF6GHKofxAgl
         T3tWZh8a2+DH5ZsAOehRMLv1witcIS7FwnE6fid36Re+knj6O8e7ieM9Ufn0AdXieKzn
         Qvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383419; x=1791988219;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=53KwSMYJX4+uA9WreYswvyBSh7+MhNbzUNt0tODS6tk=;
        b=YLsA96d3PlbRo4eGFJg9nbqe+caTb7IBiBEj5gXtVjkB+/hbMX38WmIKDBqkCHdTUA
         75Jx09WftOBDYTq0GxN1+nMhyZdop7LMvgtTZU5awFCCBmRNeB9bSuYLRKF/WVDCLsLK
         XPy3nDEgn++WmyNJcnZY0BCWv7bzzCYo92ebMVIFbGERoVmgFB5Owo7TKdMf0u83YDTg
         OSrqAwljWsT9LlewVvwA9eAaYmOzr2R6meAUPKmh/jXsVTsPF2mMAEZMGfeGZGy7feX2
         1j/XnAPV/2trgrtg5NprQjrjwxK6HHIZT3v6WYYEgTF1bzw4nnzNGT7lmzyKO+mU6YrU
         JstQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTWa95HwjUinUYZODSbyips5QoNVDnMiMJAJymjf01KU+RWALwa/6rSwOBuAjxmJdjuXlwAXmTwiE5QT8bhw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIiaNS1Lp150f2+UDfpDI79jsyd16rb5dJRO8+n1FaTCejtVe/A
	BFzM7J62ssbDGHwwFLuRoxVFcFpxbiGyRqnvRIjPEbSipqIQ6x1/uQmvpGSK4cuVrWPOyYLeATj
	u9KsSgAZYhFDqHSu2lA==
X-Received: from wroi11.prod.google.com ([2002:adf:f30b:0:b0:48a:f246:83ad])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2585:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48c72889ca6mr4790614f8f.22.1791383419136;
 Wed, 07 Oct 2026 07:30:19 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:30:01 +0000
In-Reply-To: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11580; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Qfli/8yFD2jARriIawOhQs/GAKYSJIucQKH/lIezYOc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqxld38T+YXPeKdufXp+mSKQAvcYSuT7BzjdSQ4
 /mzrJQwkUGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasZXdwAKCRAEWL7uWMY5
 RnKLD/4osaC7VreQDAMlbZfsWMG0KYFkZTYoLgo2YyBtjMUtKFVYvyy9BE1cleNZFlY8HWSdBCo
 yjgM5zV1H1Hxav1GdafnirorpWRQni6WkpKCdEMidII9qD+4+j+8EWhBKLT+0vDVuXt3nIemdaF
 1vvh69pC4OmURBJdwZccCVPPyMfqdpj+07ZPBQg2p6E1Rj9pjseC1mUq+l9NzNInN933dM2A++Y
 rQP/34TCTNjsyXXVXXdZiBjFbxfq22QE2K+0vP7cWa01w+kW8c7hoKiDePCLBj6HBYpcgFBn04n
 Scud4KoqSP6lFfdFhu5nnvBEwGvzbIxpirW4dMHwA66yDyeKb+2em/m4fGRaAwEYz+j2tUD6Y9I
 Rzy6rQla2C8foo1AHpD8oZgbcIc7dS5HvWiqCCTpOFbwdxMqYcIHqy8t/1h+CH6LzzdSxNovul1
 kYvxoK4uQfyt059omBOwc3hpO9jiHRQolynF9x3ydeIFGUVkBSsVmrbbaNJ25MHXyy9k9i6RsqA
 Xq23rcpq5e9mBr67AJdf3R/0tAzgxCF5uWiKdRrHKYEfondsmtxInVYwO/7EnSRC2jrbvANEngh
 8JiB1cXa/uyRBUu8AemJEmSNAsjQPx24DM0N7UpDY5TbnpJlSzzubUOWTPzQBvJSI/mkDm4AC11 kd9O/jQVB574QNA==
X-Mailer: b4 0.14.3
Message-ID: <20261007-pr-ratelimited-v6-1-f14accd4ea3b@google.com>
Subject: [PATCH v6 1/4] rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
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
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                 |   1 +
 rust/kernel/sync.rs         | 135 +-----------------------------------------
 rust/kernel/sync/lockdep.rs | 139 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+), 133 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 72294ddfa5b7..3f9cdca2f770 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15284,6 +15284,7 @@ F:	rust/helpers/mutex.c
 F:	rust/helpers/spinlock.c
 F:	rust/kernel/sync/lock.rs
 F:	rust/kernel/sync/lock/
+F:	rust/kernel/sync/lockdep.rs
 F:	rust/kernel/sync/locked_by.rs
 X:	kernel/locking/locktorture.c
 
diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 3e55de3b1636..c14d62a8ebb6 100644
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
@@ -36,136 +33,8 @@
     SpinLockIrq,
     SpinLockIrqGuard, //
 };
+pub use lockdep::{static_lock_class, LockClassKey};
 pub use locked_by::LockedBy;
 pub use refcount::Refcount;
 pub use set_once::SetOnce;
 pub use srcu::Srcu;
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
2.56.0.rc1.315.gc6ed9934b7-goog

