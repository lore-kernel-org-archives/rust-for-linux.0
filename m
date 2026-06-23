Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CC72E2F0E
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 15:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229095; cv=none; b=cMMMHfnW2mHODQ8jxnm26BwrEzuu6qaqus0w+fH2xNCDkbjehSQMHglByEY/ySILgDG0xygCljwJCce5LJo4Zz8cVQhFofkVByKKveMjxbn9TODQEV2Q6dIVlNJDDYPNCr1k2hLSFMP/jYYHJB8gpl664cYR20DwrAbdbtJ1ZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229095; c=relaxed/simple;
	bh=p2+Qo8PqWpb6uqx/xOCuE0Ijw2ueJ+mZl5MXQTpB40A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r2l+K39YDWzuF81jOub+5a8GRUKOBAKlvJHACfddpFCimvGTSP9DNl1POQu59Hze7m/bIv19gSAOpojRrh+qGyv/Ss9iVg51SzfpNR4qQxdWKdibTsuPk3FWNe8hS6IFVIrEoBRp1hxIIE4V2CwcMotqh4exJZRSUFLvgUnsv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KlVeje9F; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KlVeje9F"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-49221de4ed4so194635e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782229092; x=1782833892; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MIEApMQHyLSUdXECm4YA7jVc5PbooeuTWkg4BTsIV80=;
        b=KlVeje9FCbsy+mVc/anoIvX6sTNG0xxzy9us6jC6LzO7lKFBw+OA8GDqhLPINmLgEV
         MREkRFInQLvIPpeCZDY+BbEYcL5kD6qRxT5pWTe7zkrIqJ51vmvtFldx0IKZWU7KIf0d
         u7P7oukhSdDqOUG6gZcZwBluUW7c9chPFgOZ1X/I9q34Pn4AhmEvRRTA73xoTe2f/gAV
         RwSTASJZOnOK+lv4Ow8IK10dBJXEE+jf//ucIVZAHiQJO9qQlFZdRRfppecMkvsQUogt
         1RFltQcpJHZud+JVwTvBqw4CrQ8SuJLQ4+nLPIvFIoom2eZKhHptruqYON96eZqXX79Z
         ZPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229092; x=1782833892;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIEApMQHyLSUdXECm4YA7jVc5PbooeuTWkg4BTsIV80=;
        b=ls5QYqgsS3wgn1GCgtZvTHUKaxjLYk8BF5MVh0y12i1y1SBvECXjE3jT5zYEMk2pcE
         P1WKpwtDC/5fjLlejKzyQcUsl48TZNTljdj3byfZYpVckZxzYKuBtoDMuA14wn86rPxt
         GQSNLd4ZpROG/PGCOgbnCk2nFEaHP5OHn+m0WYuVnI4kgeWHh/dur67FW3lJQK3bxo9P
         pZXeNaiOqNGRVvlw/BUv8gxP8NmP1KSy2ZEZmAnSs5ZPRrUROqVOX+ELdDcYMHA3kg9z
         LhQt2+UC8D9rTBduVMH/mpscJD/19sKyCdqtIJTm03K9d967yTZbUxD5XZshtvFCapCc
         Rykw==
X-Forwarded-Encrypted: i=1; AFNElJ9oUvBcpqLsd6ssSZx+kysbmymtXBtSpOnLI8zxoGjje7OqFz+DWXguyt6rAV5fKAq2ZaCPLW2x7sc3PmYPuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXIn41v1bh+pgt6Q+GRyMhypGmcXDHyA1eiOMaUIKStrEv9Ho7
	vAqIAVQfSvnpqVXkNxJZJdHWPIkPO1DMrtyF/LjOMSOVw6X+EaOzRQbixgfid91tKLcxA1ldIBF
	krWrObVZJ2XYYNlk2ng==
X-Received: from wma7.prod.google.com ([2002:a05:600c:8907:b0:492:450b:fe7b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4342:b0:490:bde3:d112 with SMTP id 5b1f17b1804b1-49240e9547amr200834545e9.30.1782229091367;
 Tue, 23 Jun 2026 08:38:11 -0700 (PDT)
Date: Tue, 23 Jun 2026 15:38:04 +0000
In-Reply-To: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11075; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=p2+Qo8PqWpb6uqx/xOCuE0Ijw2ueJ+mZl5MXQTpB40A=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqOqhgRAVD/jTmFBpEI6GiJZOhzVgrJAGe8VyKB
 cTH2ruNlXKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCajqoYAAKCRAEWL7uWMY5
 Rp9ED/9Wgz3+xQWKd+dYjnJBFlpqOK/9cQtfMpyaHgtedcXUWpduiJTwcDiz33+ZcE4U/f0gSG7
 JTN/pWiwGEdQ2JSaYbwQDebrWzeWKj0zFNSI8A1o3AZdGh34pDSHFh87BtMHxc7xNDM12jUXkkq
 jtqW/bI3vfrOAkAc8vsggenSvG63JLLDBXCp/e4SSkACMRzd3Zc4NJc/h4YfZGJD55vEJJHDgv/
 c6fsuRWsB8auaBGvtsnfZgogL0Sik6zFJNdbcsyAVJUZsKeahCZCSNIfrNs5AKV/A38m+cDMVKa
 uHDFHeuZlC8tL6mZAsA1ZNhPsNF7hoVjWrVmsAROd/2RswKQoAr3y9X2tregjC8Al528/w7/Gvw
 v5ffeJpPJQmFMMwz70a5FQAb04T9ullaNLpNTD4nzmEemfeRP/c0Nw6D9RTUOrn6X+WyD8Vi0Pu
 apBA+IUlL8EQ0MVwk+YbdmVNULizHpJ0dgr4WPdhs3+LoNDlYvE/7EgPpauteTuGJ+DidKHDt0G
 hxRaYeveUQJwtN/rpNGsmeua2VHo2IZlxTiulovjmi3vZDpyKSJOWv2SQFxdupaX07+x7DzbfU/
 Q6KOfFLAzthZug5dxqGE5ZJ5JCnNYQ3FMGixBEEnF5pqFh5Y4qlDaO68b+/PpfIOWE0zMtYz1U0 E0iglMCrw8XYXEg==
X-Mailer: b4 0.14.3
Message-ID: <20260623-pr-ratelimited-v1-1-cc922f544dc0@google.com>
Subject: [PATCH 1/5] rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
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
2.55.0.rc0.799.gd6f94ed593-goog

