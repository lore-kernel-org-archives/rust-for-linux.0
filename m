Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6EF41E6D4
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205292; cv=none; b=fIrqQbkMZXtOlIKeaItKbmeFl1VPDYaXWonJ4eRUj/wSpT1v5aFvflaDR8PijHVTyefAfrYkXDjFI0kwdOI0VclrUyVqCtadYEehhdgvGTWeeK83seOIeloB53NFtQfW5MIm2b2Ty30obmnLTV3sXz56cvyzeWOctkSPMOn27jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205292; c=relaxed/simple;
	bh=F3XfE2qmquOsjgl5Z7SgmdoRF1G91H01/1f0xHWJi/c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qIOH4ufYlF50bedpaThnuLtmQAjgGYlm7t3+/9yXijRE8yPcxjtV8cUPGQftZQ7+gDecw4CloRIHXy9sDKi0dbmjTxCmvzY9jsxtQ5SdIuekhXtjHg5iMBiEAfkcoqDOUcf3Li50zJ/gAHWmKpZl6TXkg3TY2VBcxbCe4sKVZHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gTnHaGZ4; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gTnHaGZ4"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-46fb9079a04so3297610f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784205286; x=1784810086; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcHRQa5oaNT52Q3NzivF4AOmmeBmFBenYIo8+2bH3+U=;
        b=gTnHaGZ4lbT7PsE/nDcuT33Dt/xLpTU7LktH4Wsd4g+VhwL9+gEYu4GYEPaSCFaW25
         pSTYvf+jXp7t9eX7ZsISqiqAleMYJUZGbprm9HaZG4dF8rCObbkwUKREfOcw7VxAPa6b
         /09Gpc/N7gk2eLXmRpR0Zrahjf4LyHuCLYh1VmnEKpHzuAU7Zuqc/Ew5Bn2ExlbuMf6N
         osnalzWuiPiIEK6S8zqyiPj8q5tXoetD2pI2yDnAAYkrXHzuirLWBD16bZ5yG+C6d6bL
         vi+RZTuRM4HMSbw/nSJlx+vsSnq6cTMZrSsFwOl9SbejnuqknFj8SmPhc2Vzmfjl4kUC
         oo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205286; x=1784810086;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcHRQa5oaNT52Q3NzivF4AOmmeBmFBenYIo8+2bH3+U=;
        b=g1GbQFTEjlskn5+Opjt8uyg298TYo4uB0WmJbQZ2U+W1Jyx9liq9jvLF8hocHrul6P
         DBeCCR/5vB8ITmGGlvlUh4o0F1vgGhdcBXyq+HqH2piV7u4mE8DnwLdEDDTlGmFbksOo
         LcAz6IJgQ92cOuJhWxkB/umteRYz2JpyQnP/XDCpukBSMbdE3Da448qB0Qtun1vPI6Bh
         Fv8ryc/7DzcoBxl5+bfuUZXN/Ad3yaMrKOymeD+UbyPTmdMsM7rm66cgjvcl6tgbXo/0
         +hup/akhrrzUqey6EZn+T5LOuK6sUKt3W8O2fBNCrhvz6QCatzd5yrXi9zGjmyqhCwet
         +ERw==
X-Forwarded-Encrypted: i=1; AHgh+Rrnctm1hUfjZMncA2h39Ju8hLpzsbomOAjQZ73C9oje19NGLrggzYPZEvhpsDrY60lcLKPNyjIbT2xHA00IBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMup9xRqXmkVF8T8wkjhtAD3FCnRMjAt0GBqGsBznqjHCtBk5l
	bNlitWD5KQjpDumw6MhcGhA1ste3rPgO5nXXrNLI6FvAGPGiCqRSleFWK0ybS+GGHqIqDCqzXgR
	OMR5+Ngml5vhZfca/YA==
X-Received: from wrvi4.prod.google.com ([2002:a5d:5584:0:b0:47f:3eaa:11e1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:178b:b0:47f:2de3:b351 with SMTP id ffacd0b85a97d-47f4634dd31mr15994410f8f.26.1784205285556;
 Thu, 16 Jul 2026 05:34:45 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:34:25 +0000
In-Reply-To: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11207; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=F3XfE2qmquOsjgl5Z7SgmdoRF1G91H01/1f0xHWJi/c=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqWM/iVDgYXKSHMFQ2++zmGF5G3oQOlRAGCOgpA
 M4ZMwY8jLiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaljP4gAKCRAEWL7uWMY5
 RtEaD/9KW/JA2rWruHWbEO2E5cC9DljvaeFIjSkd91BzBWwESyiGAoZ/GE22uEWmYWwfbD7GLRG
 81WKqtnnhjnHUTQwEkvdSEowgyX2UzB9f1u3jdIOqijVamSyr5Uqm7TDjRR1x1qlLcLAfeqPKgQ
 UAWNWg0LIq9LQJnhy40tqtMpXVKlm9fld9awRpIOE8XanE25h4s7QGop8cVMOk/HeND5oBDi51W
 vnyArAzzLdmL6Y9aPMoV65o2m2SfP71XsdEuxR4GhY4br8MUPpHSLcXAmlOjw/NTEJ2g1wKsc37
 26xjLuj0Opf/eh1KvzyadXWZkKNCt7bo1lyAWB/gDiIKEtus7it/NOkcRay0z9Dl1pYWgaoIpyv
 d+Odb95KAXwEwOvY3uvSgLB095MS4TJ1m0iZD4gnjPTkfHzwcrdUmwmMuYenCKwqng/CdSlkLan
 RetTh6ZYwA/Sy09UJLWxzr/6tZLXsFs55AfJBlOvxUvE+9U5DTcnJCpBRBtroAVaDn4RImH+vqP
 4gJ7fiMENglhbp5zqQhBe66Gx39PDAliO9WdbEzCmWwFkWgoACiM/xa2RL1TsmXc+ZW0nZDAoIN
 Qlsx3PNTzD0uJzDCuOpCPIxouCBZcGoNsdVlxpuaVGdn0kyAy44snOUFHe4ufWo6edkQxHAk1wP xaIPtuud6ga9N0w==
X-Mailer: b4 0.14.3
Message-ID: <20260716-pr-ratelimited-v2-1-31c27a4543d2@google.com>
Subject: [PATCH v2 1/5] rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
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
Thus, move them to a submodule.

For commonly used lockdep logic it's useful to keep re-exports in
kernel::sync, and this also avoids the need to update any users.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Boqun Feng <boqun@kernel.org>
Reviewed-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync.rs         | 135 +-----------------------------------------
 rust/kernel/sync/lockdep.rs | 139 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 141 insertions(+), 133 deletions(-)

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

