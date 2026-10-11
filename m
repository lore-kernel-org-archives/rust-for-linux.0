Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA33D6461
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 18:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744039; cv=none; b=WgmB8Sfk/9M5gYuA8WHNbMEMYQ1fx+L+GHF5QNVxN2DzxKhJy4zqzbWO/K5jPNKvgQ+HnbH88nE8mvWBlMbMVMgPlJI0JilJLN3Kz0UdVhdx8DrBN5fQGb6ZGHV0CeNkQW5gL5sSLhyhTq3BZDuaD2+wgvmyo7PUdZRjY1KkbV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744039; c=relaxed/simple;
	bh=/DwPvg6tQqgDAgbYDIINfVVFbrdJDbnGhMd+yjZzrMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcTQcMHcih86+YqeMTd+FRttWRvJ+A3cF/ojogkD1YSORZvaxVXDZsFPoTyGJPwl2P9ou2HHKmwTPrBl7Ekz2UU+9/L3u0oAuoI488GfZ/vxHgH/IbGtm8PlUpy/k0lPcuDcz/D4Yo5GTJXtgjb8m25/kpAilo3UM0DrH3BOUQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=kIWUyhOQ; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="kIWUyhOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791744033; x=1792003233;
	bh=tcttsn0JtZWYQ81rF42lYZXwhDXTdPaMaLOr53lKM2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kIWUyhOQntT67OxDXqpQxckPYe7oM16afN+YSnpiBKNXG97HFPCwC6FXQje+M44RD
	 kGxXqGcRnhijcWEPNBYhCsx3jMxveqR5wy6lXFUB1s85/Edb6GoPNnpxbfyXvRWTlb
	 JTUMgXKVomQ58jPBvaTSYuueDohIPkSJ5t4wevo7nfCdzxiivrcADvV4Nhi1YdN6HB
	 wfOA5AdJYPF+oCvgN3OVF80qw3mXvTms2YYQf87LFUFSLxh96VTy2S/HtDXzasj8js
	 SLMO33S94+CDTeAzkQWQPfLaznrRVw9lqQYpxw5TeP+sKZr4Npo3qpxRpzUWTLV33C
	 3OegQqCrA24eQ==
X-Pm-Submission-Id: 4j2qCw6nwRz2ScPh
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	daniel.almeida@collabora.com,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 3/6] rust: implement Class for ww_class support
Date: Sun, 11 Oct 2026 21:39:21 +0300
Message-ID: <003bc88697dc8e450156264d9783c220173dc492.1791743500.git.work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1791743500.git.work@onurozkan.dev>
References: <cover.1791743500.git.work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the Class type, the first step in supporting ww_mutex in Rust.
Class represents ww_class, used for deadlock avoidance for supporting
both wait-die and wound-wait semantics.

Also adds the define_ww_class and define_wd_class macros for safely
declaring static instances.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock.rs                |   1 +
 rust/kernel/sync/lock/ww_mutex.rs       |   7 ++
 rust/kernel/sync/lock/ww_mutex/class.rs | 144 ++++++++++++++++++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024..f509250822c5 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -15,6 +15,7 @@
 
 pub mod mutex;
 pub mod spinlock;
+pub mod ww_mutex;
 
 pub(super) mod global;
 pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend, GlobalLockedBy};
diff --git a/rust/kernel/sync/lock/ww_mutex.rs b/rust/kernel/sync/lock/ww_mutex.rs
new file mode 100644
index 000000000000..727c51cc73af
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex.rs
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust abstractions for the kernel's wound-wait locking primitives.
+
+pub use class::Class;
+
+mod class;
diff --git a/rust/kernel/sync/lock/ww_mutex/class.rs b/rust/kernel/sync/lock/ww_mutex/class.rs
new file mode 100644
index 000000000000..9327403ab077
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/class.rs
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Provides [`Class`] to group wound/wait mutexes to be acquired together
+//! and specifies which deadlock avoidance algorithm to use (e.g., wound-wait
+//! or wait-die).
+//!
+//! The [`define_ww_class!`] and [`define_wd_class!`] macros provide safe
+//! ways to create classes.
+
+use crate::{
+    bindings,
+    prelude::*,
+    types::Opaque, //
+};
+
+/// Defines a static wound-wait [`Class`].
+///
+/// # Examples
+///
+/// ```
+/// use kernel::define_ww_class;
+///
+/// define_ww_class!(SOME_WW_CLASS);
+/// ```
+#[macro_export]
+macro_rules! define_ww_class {
+    ($name:ident) => {
+        static $name: $crate::sync::lock::ww_mutex::Class =
+            // SAFETY: This is `static`, so address is fixed and won't move.
+            unsafe {
+                $crate::sync::lock::ww_mutex::Class::new_unpinned(
+                    $crate::c_str!(::core::stringify!($name)),
+                    false,
+                )
+            };
+    };
+}
+
+/// Defines a static wait-die [`Class`].
+///
+/// # Examples
+///
+/// ```
+/// use kernel::define_wd_class;
+///
+/// define_wd_class!(SOME_WD_CLASS);
+/// ```
+#[macro_export]
+macro_rules! define_wd_class {
+    ($name:ident) => {
+        static $name: $crate::sync::lock::ww_mutex::Class =
+            // SAFETY: This is `static`, so address is fixed and won't move.
+            unsafe {
+                $crate::sync::lock::ww_mutex::Class::new_unpinned(
+                    $crate::c_str!(::core::stringify!($name)),
+                    true,
+                )
+            };
+    };
+}
+
+/// Used to group mutexes together for deadlock avoidance.
+///
+/// All mutexes that might be acquired together should use the same class.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{
+///     define_wd_class,
+///     define_ww_class, //
+/// };
+///
+/// define_ww_class!(SOME_WW_CLASS);
+/// define_wd_class!(SOME_WD_CLASS);
+///
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data]
+#[repr(transparent)]
+pub struct Class {
+    #[pin]
+    pub(super) inner: Opaque<bindings::ww_class>,
+}
+
+impl Class {
+    /// Creates an unpinned [`Class`].
+    ///
+    /// You should prefer using [`define_ww_class!`] and [`define_wd_class!`]
+    /// macros. This function is `pub` only so that those macros can use it.
+    /// The alternative would be to expose the private fields of [`Class`]
+    /// which is less desirable.
+    ///
+    /// # Safety
+    ///
+    /// Caller must guarantee that the returned value must be pinned before
+    /// its first use.
+    pub const unsafe fn new_unpinned(name: &'static CStr, is_wait_die: bool) -> Self {
+        Class {
+            inner: Opaque::new(bindings::ww_class {
+                stamp: bindings::atomic_long_t { counter: 0 },
+                acquire_name: crate::str::as_char_ptr_in_const_context(name),
+                mutex_name: crate::str::as_char_ptr_in_const_context(name),
+                is_wait_die: is_wait_die as u32,
+                // TODO: Replace with `bindings::lock_class_key::default()` once
+                // stabilized for `const`.
+                //
+                // SAFETY: This is always zero-initialized when defined with
+                // `DEFINE_WD_CLASS` globally on C side.
+                //
+                // For reference, see __WW_CLASS_INITIALIZER() in
+                // "include/linux/ww_mutex.h".
+                acquire_key: unsafe { core::mem::zeroed() },
+                // TODO: Replace with `bindings::lock_class_key::default()` once
+                // stabilized for `const`.
+                //
+                // SAFETY: This is always zero-initialized when defined with
+                // `DEFINE_WD_CLASS` globally on C side.
+                //
+                // For reference, see __WW_CLASS_INITIALIZER() in
+                // "include/linux/ww_mutex.h".
+                mutex_key: unsafe { core::mem::zeroed() },
+            }),
+        }
+    }
+
+    /// Creates a [`Class`] from a raw pointer.
+    ///
+    /// This function is intended for interoperability with C code.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that `ptr` points to the `inner` field of
+    /// [`Class`] and that it remains valid for the lifetime `'a`.
+    pub const unsafe fn from_raw<'a>(ptr: *mut bindings::ww_class) -> &'a Self {
+        // SAFETY: By the safety contract, `ptr` is valid to construct `Class`.
+        unsafe { &*ptr.cast() }
+    }
+}
+
+// SAFETY: [`Class`] is set up once and never modified. It's fine to share it across threads.
+unsafe impl Sync for Class {}
+// SAFETY: Doesn't hold anything thread-specific. It's safe to send to other threads.
+unsafe impl Send for Class {}
-- 
2.51.2

