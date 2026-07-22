Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F833859E2
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 10:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715144; cv=none; b=otVI/1r0XJ1MDIMJt38/ZLX6fuwPPF1V4uHdYYKUPHt6BMGKdmVdWAmCwSFSDvkafZpj0KWGwe5TCBblWqmXA/CTX6k56Dbl1iemAhbEjWyoWY96KkdIbTJFCWDeC0OG9sf0lxrFFz9sq7kuR6BKpQOmn9DjpaM+1q4u/mAt4Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715144; c=relaxed/simple;
	bh=+tuwon26i7NMHDgudyG/uZWyjNbEDWOkDlgtBA6Yz7Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CcIUAVq7DA8f0H1Xz5sIoUImOUW9q1TLi9GWKoxhkjtMRUrkic471GImwfuqamUZc7xSFTnuQXGRrySO1CBD5tmXs4y2U0zHPFRWO7Y85q9auo1gqotCwc5LAJKI4UaQTiVCETkB6eyLwn/wwo0e192+NaGw7JYOlwlu3Q4/abc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=REL+VI0S; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="REL+VI0S"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15deb3377eso1060696666b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 03:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784715140; x=1785319940; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y2BvQ11kXLIbDEiQSMA80OPUJbvs5+anKj476L5SRjQ=;
        b=REL+VI0SXXn6OSCU66ZIu+uMnsqydZMRySEQzu9Y2dE5e+9XNh0visoEo9PE8ofx5f
         1Qy/69C77ytoVFbtsDw6kwiRsAMCZKkFHTJCoe+3aoOCvHAU+8VP8izeaBJZyzQU9ST5
         xgJsd31kxzPFzNbRB3rq2VgUDQpNBZdidHswZNeGAUrdulmqajH13njMwlmxcTeGc8lR
         QDhCsYRKuGzq16bzfGePuuze77jNLKcrhjkJIxfjEHB91Nc8ZOqoHC/TRxlyDlkN4D14
         XzjnTAoaK1nOGvEbKCU5AkxKPEBDNDblLh4RiBMZKwCyv7w2xbLpYO7YmXpylshLwUhc
         hgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715140; x=1785319940;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y2BvQ11kXLIbDEiQSMA80OPUJbvs5+anKj476L5SRjQ=;
        b=CWyQFH2BjCv8kJUe8k1H2JoMu2hK/GLB/Sl/inFRfGcP1Qxtmqaf9sLmwxKO8O6lzn
         UGAnH76SmgEqapDOlRWjdPz5HM1rgsUd0MI6p8eXWVlyNRfyXphGcsaLPPt9++5FAE9w
         anyI3b1f+1BdChmor+7DnEtwNCCNxurW1ARxtPmZkc4kuKa8haQfjcmX3fm5h4kYNh7E
         yUxWxls1pcachfqvSNm0cWQuYlUDovmauLlJA5mIAdo6zfrJYk6Ig+pHCGWHjHdDOUp9
         rfmQTLd+AYgFwjULlU99zQ+4a5yxAZE3f43ZXv/wsu4xk+i3HB+dEULjTWPoolVPelni
         I0Fw==
X-Forwarded-Encrypted: i=1; AHgh+RpuoaG0KPjvqLf0s/xwkWTt//jePFiUk0pmOtcHlBpRCzXRAONLiVPMDWPOmTyKiYj59scSZqphILS7pnsyMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz147DbsCmq8/VcmVqt/9HZzIwXaoodUv5ZIed62z8Qj2SZn4N2
	frGjj5jPXRum5rxrxh8AsbyR0+AahtC24ANTBYA4VWDmKYzHQMiCYxnDcgqB56wPpcxQ6REsg1n
	iVisXh/AfYnptbYEK8A==
X-Received: from ejbcb18.prod.google.com ([2002:a17:906:a452:b0:c12:83ae:cb65])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3d04:b0:c16:1ba4:f29 with SMTP id a640c23a62f3a-c16b48355a1mr952622466b.44.1784715140066;
 Wed, 22 Jul 2026 03:12:20 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:12:09 +0000
In-Reply-To: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11681; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+tuwon26i7NMHDgudyG/uZWyjNbEDWOkDlgtBA6Yz7Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqYJeAU4/lgMt5ABrgp3XguJBH5wlL5etP3yxVx
 38s9PVoJTuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamCXgAAKCRAEWL7uWMY5
 RnEsD/wOKSV0CXn+iLIpCwCnAMp63a0ZvAbuwtNsa1lH1BF6ZnjKyNQ5aqDY0d//i30XhKBVZVH
 oeS2oFGMGJbrWqaF/52UErXFAbGhoknMsV17K2iSCnIQzM1/FZ2CkQJkmaCOM5WjulZl8NFqM8Q
 z3fpLTRa6yFJQKmEyX/WMq7a5pDblbqbK4UjbgpBx0Eo9nZL4B1Q9do0vO8ioeXAATz5/VazMw5
 ofmaH2cRwB6qYj534iSFkE30VUxqZYbHqKgc91Pjcr0zAVZP1x/+ortZZf2BwNPgbNb+ZuyXPSe
 dATUHaprX0btt7LpbtZWTi0wP5pxxcHP273MB9eBvvrzV6KSYhn+BftvP5tWTMsYbxG7heB6W7g
 LGfFECg06a/EpFujLIdOwkjH5X1LDsmeavDKXAJ18Y2DiYFhAMXM3lgTYS2zRj4Gpe/Q/Dsktxa
 Y+IjVU+O+egY9edGwqyVjjpUdj4KssX5nrJus49y3fSpCRlyteJ/qj2nJdqealnwn/dKeA0hUF1
 ROHfh0P9uzJnMNwho5ajJAVUx/lDZnykXk0ytsE4PzQ3ILVTONtiSi/lXzUcXnRF1gLmCnSYwp1
 SwH7AqbrF2E/WSRUTyJ74y+jivBAS+oltIN9TtAYBhaa9UT6Qk8J9aFjLgimlC62m8/237gDNhP 8LOQudkXKG2zsSg==
X-Mailer: b4 0.14.3
Message-ID: <20260722-pr-ratelimited-v3-1-57faa37fdfbd@google.com>
Subject: [PATCH v3 1/5] rust: sync: move lockdep types to rust/kernel/sync/lockdep.rs
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
index a3edb1fa7954..814ca2b12f16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15156,6 +15156,7 @@ F:	rust/helpers/mutex.c
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

