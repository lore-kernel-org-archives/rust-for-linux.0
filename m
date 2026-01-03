Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [178.154.239.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AD92BD001;
	Sat,  3 Jan 2026 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767425789; cv=none; b=sxAUv7UWK/h6zsJusIhEB4nspBIEOtvlfZLYM5q+cBUNZ3r7t/WTKOCY6BoUqUoTrfjbwt1rLw4WN/tnE0fzZ8Is/k46PhEMoZyesOloKU7b6soVsUe0mdNjv13GXWSaGcH/f5lNxVRdmMloV8LlrM9d0PZwZ1BmG2ZwVsV7HHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767425789; c=relaxed/simple;
	bh=mx1XwExiBMpwPcIDb8Bk/zFD7ucxlMXBHJ/Q5HhXBW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I4tfaqpQTd0u/JagcfjyHfEGn0m8ZEUS+DsjfObvC+YKDeUjQsKJUE4HP35+ISuwHkmHyOngd3fINOb+GQGaXRvZ2KdQbWUuGe8CjBf8I4Fa/tOi5dgOeaFNfk6FfCIsqNhMmMVFX9ABjARJDi7w6Q+OxlPBMI5LLn1r/jVnlkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=KUU53zLH; arc=none smtp.client-ip=178.154.239.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="KUU53zLH"
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 345B1C005E;
	Sat, 03 Jan 2026 10:36:25 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id vZgUW4MHrmI0-BHoz7saj;
	Sat, 03 Jan 2026 10:36:24 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1767425784;
	bh=5h1taYK8Ik1h8HK1Vjon+hdeAv1dK1mYLr6IxPRcYGw=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=KUU53zLH30N+OHFlqUYQwJ+oADyaY5buPkFWRoZsVi0nUQKB+bFJQw1Wq+WglsleW
	 sXGUfFUoRgGDlIDA7FgwM8MzHmI7u5IcJt3Vx3SrkGymED6rSrZ9TXeEwdc9saYcTo
	 3TDaIq2wcopEQpc/XrT7OOMDU6AbKraQ/EivFtrA=
Authentication-Results: mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: lossin@kernel.org,
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
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH v10 4/7] rust: implement Class for ww_class support
Date: Sat,  3 Jan 2026 10:35:51 +0300
Message-ID: <20260103073554.34855-5-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260103073554.34855-1-work@onurozkan.dev>
References: <20260103073554.34855-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the Class type, the first step in supporting
ww_mutex in Rust. Class represents ww_class, used
for deadlock avoidance for supporting both wait-die
and wound-wait semantics.

Also adds the define_class macro for safely declaring
static instances.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock.rs                |   1 +
 rust/kernel/sync/lock/ww_mutex.rs       |   7 ++
 rust/kernel/sync/lock/ww_mutex/class.rs | 139 ++++++++++++++++++++++++
 3 files changed, 147 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 46a57d1fc309..ef7f4a023177 100644
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
index 000000000000..d57478f33659
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/class.rs
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Provides [`Class`] to group wound/wait mutexes to be acquired together
+//! and specifies which deadlock avoidance algorithm to use (e.g., wound-wait
+//! or wait-die).
+//!
+//! The [`define_ww_class!`] and [`define_wd_class!`] macros provide safe
+//! ways to create classes.
+
+use crate::bindings;
+use crate::prelude::*;
+use crate::types::Opaque;
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
+/// use kernel::{define_ww_class, define_wd_class};
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
+                acquire_name: name.as_ptr().cast(),
+                mutex_name: name.as_ptr().cast(),
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

