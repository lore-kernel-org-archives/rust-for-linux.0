Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311E3A9DB2
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 07:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742212; cv=none; b=jF4NCoVX3j5LM9Jpji8k6ljWzY4IVGqBvzwO9P2vk3GIJ84Z9E15bEhT3KmrwtfF6bAYJubxLEGRvmDYCAy0/BRiZDS74ZRPKiG8YT19fX/U7Aa3+tibCATVdcxyW2lcAPmoxvWTHLLncMh4l9XqXljlmDGoOPh5Yb76qytCrv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742212; c=relaxed/simple;
	bh=6OUtJxUyEDdDWF9enVUC+jQgSwejH/Ezn97FdauMTkM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H/M9QGbcckxPW9TtkFE7W/PLHh7VP+unSRqAwYpUZvpWYyZbWRDhw5GcF6/+c5gSDfREdvgt9j9Q2zYZmoWVO2E4l6PdW2KNbsvvv6k984f8hQplMiymdFWGGTZIkkKk7/arNN8W9KO1rn6j/EunvqpN/nwY33aAywkH+P4NjnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MNsYaRYc; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MNsYaRYc"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4954b1c6310so16944885e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 00:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785742207; x=1786347007; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9W9h7wEPytZk5LBhtU84b9W9YgvfWvTGpSYytbAHAc=;
        b=MNsYaRYc0Wgmf2ujQ9Lf3VEkxDz1u4wYo/AFN9pVlRkwzoqfEScyjrtd4K9+szCyJl
         f2MD313kouWjQPb4j2llwHHRMqAmxdXmXR/R7X+VamLr+aHgfD/6mGVbEqojfvoudwek
         LPFOPH7V0i/NeIju+ddiZ5w2dACByYKdJ00Oo2zdTudXbaGB2b4eeX48rcseOo/3Ktur
         0tphclmxhjUR6/J8GaF7VEyDnSXyPpkpfNRW6KPYV97oDMpH/F+Fw7koXCA4s4qqtdqe
         LqTqtT5hfFhNvqK1qID82U1Za3B4gWJ3DOp63AWz8R7oUmr37//tqu+yahv0OYAI74hK
         p3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742207; x=1786347007;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9W9h7wEPytZk5LBhtU84b9W9YgvfWvTGpSYytbAHAc=;
        b=NTRai5CGlZ1FErkb2goapvpHFWsD5LUL9OuIKjEeAZvvMapzapAfMlCPg4dAkAaOpU
         fxN28gOnO7TF7F0L5zGasHpt3Jr8kZ9DCHnYy3C4dD5Xuyryfa6va255VAEBkC6Jdx+w
         lqCTvZ1Y9HNB7fEEUB/+9kgE82N2ww1IMbhYx7oLhGptmtRNhgnrxULvVl9lPiR0aNRM
         qkMhcFAUOodw73555rKH/qXjY8k19H2wrhYS6V16+qyrLZFPdI+X4xtibdAbyO9oGb2n
         Xme+/AV5h37/6j97w7frFdiGjxujacR+K5fgFt31iAzs4HQp2wl4eaa0DkkJ5blYjKpH
         oShg==
X-Forwarded-Encrypted: i=1; AHgh+RrgvoVEA/HQwYjgoKUPg0q3+Vcte2Dovin8KZwKMWqR8PVh/qodYvJ3W9tS4GB1MTfcXPJzvklGWJNHjHqfnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBpcjmh8QCxeA8E3bODR5aG84I10W19UHTzPURTDfl7pCW/HeB
	faqzqNRTX3FEz1ViQG3zqqMGR+mvNaMoD5uVX2KGWQ9mzDCvI4rwA3fv0XT1b58rK+ZoD+FRFyM
	CWlKwWux6ZDrycDYnpg==
X-Received: from wmlz23.prod.google.com ([2002:a05:600c:2217:b0:495:6d55:63ba])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1553:b0:498:ee7:e40a with SMTP id 5b1f17b1804b1-4980ee7e62amr162987955e9.16.1785742203558;
 Mon, 03 Aug 2026 00:30:03 -0700 (PDT)
Date: Mon, 03 Aug 2026 07:29:52 +0000
In-Reply-To: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11724; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6OUtJxUyEDdDWF9enVUC+jQgSwejH/Ezn97FdauMTkM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqcEN41oMlro3w60O+akneTmGXlxWbwAEoYT54v
 EB+cJ+AcceJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCanBDeAAKCRAEWL7uWMY5
 RqtDD/9kaJK0aWWNQxtSRgytOW+VJlAzDk9ts6DD06NQlgjz2obtDGAuIu87Ms5kda9054CkZVE
 SaC5cnsx4XHzfQ9TwBBDQO5IKmmx0oNAYs1I/x5XcaaQlvAz/3nztDKNd33XcD/1lVmMCGGMRit
 B89f0+DO9iNB0wXORywUZlQPbzJYy2Tbwn4Vql14D9IUP5eHMcXzFKp4Pxq0g+QTVwGBeK4sDKZ
 ltDqU3KBByfw2uakPBQUdwhBWq7WjtC7lqdZmXCiFD2qZAWuR2tcLtMyOYdnNEV1ZprcLMYy1H+
 7xOJU2eoBj6lsdxUMoQJetxAwmmjJddMTXTtqw5A7JRmiD4qAbfPsMpePcj+e7cSAwjdmMiFarg
 cVfha2qB1YJH4v8QD78J3GAX/rMUFt+j2hzlHH6UQ+dCwkX9mAugfiH7Sg7+dxYeCaIujQ/7M0N
 Mm2y/roxSCi9XQb2LZ8S4DvXBQmxMiKQbR/gG2zowehLR0E9cVKOsaOvjaq0GLIVnfRBtr2/Rhd
 P8ryJjp6KwnljhhrywBXIztWGt5oAUtjmDDU8JFdYZDOU5ILOI7+QQ3gNdwFyhUZNiKdGX6Ca5K
 bb8pK2dvTSPKrwwMdkvQE/VyaJO7xtKCbm9lG1+soSiHvJfsLFUuFkGQ2H+pNr19ASCl0KvtBq3 iCLA5RPb5mKOtkg==
X-Mailer: b4 0.14.3
Message-ID: <20260803-pr-ratelimited-v5-1-a77d456de974@google.com>
Subject: [PATCH v5 1/5] rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
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
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                 |   1 +
 rust/kernel/sync.rs         | 135 +-----------------------------------------
 rust/kernel/sync/lockdep.rs | 139 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+), 133 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e27c49ffe48..5c945f981fee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15161,6 +15161,7 @@ F:	rust/helpers/mutex.c
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
2.55.0.508.g3f0d502094-goog

