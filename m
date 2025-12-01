Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEF1849C;
	Mon,  1 Dec 2025 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584971; cv=none; b=iSR65B1b7FLHtJttkvHE9zIsZzS01nmcBZhY/eSPxP72zUOR0uVjGXp1xSR4EH5ULCkgyVL0OKkaBwC6Owr9QKXlT2ajr/JKXA8HgHBPjCNBYugoxFJR8mQcJ/BbljSFgnJJbpDBctuIp0nhqp7x4R3MfHuHjuEgjhVxCZ6MtbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584971; c=relaxed/simple;
	bh=u35omZgDEJ123XobYZDHHaiUg+wFdHkojsz4MkxFkak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fbbbl0D6UWcp3Od8NCypPphgCZ+2Ah399NEGXgxw1lmsBogS7Hzay0NnJHh0i8Z0f7Gc4Bi/JoEXV5V53MGuE0+Bb/pZyqVIKaxcandXiSdG6/Be6K0M0uqH4mgZaiVCfgFHpMOTlQ8wBxzJM3F0jcDmkrsbHtHsyuKJYjRd+lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=DImYPAfw; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="DImYPAfw"
Received: from mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8a9a:0:640:e327:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id F3DD9C00D6;
	Mon, 01 Dec 2025 13:29:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id wSfJU4kLMiE0-utZgXoMt;
	Mon, 01 Dec 2025 13:29:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764584959;
	bh=eQhb/6+6YKrKWbsqTeFUeDZP97xac7dS5ys6ItfDGxo=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=DImYPAfwpN7dG9wLUYmO4RKDbSGYrPgEtIZeXRM7ehEBgefaDRYQjQH902ZWCoV6H
	 Y1HymADT/wWw5YX+6BQ/dstWrINxT7DiNoE1DoUULAafzk5x2+BZUFPWIboFNPF3iv
	 JOv3+QdnhlkvlzOjxwNEpuUAjkdpI3fdHistMScE=
Authentication-Results: mail-nwsmtp-smtp-production-main-92.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
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
Subject: [PATCH v8 4/6] rust: implement Class for ww_class support
Date: Mon,  1 Dec 2025 13:28:53 +0300
Message-ID: <20251201102855.4413-5-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251201102855.4413-1-work@onurozkan.dev>
References: <20251201102855.4413-1-work@onurozkan.dev>
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
 rust/kernel/sync/lock/ww_mutex/class.rs | 156 ++++++++++++++++++++++++
 3 files changed, 164 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 27202beef90c..5b320c2b28c1 100644
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
index 000000000000..b0753093f1e0
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/class.rs
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Provides [`Class`] to group wound/wait mutexes to be acquired together
+//! and specifies which deadlock avoidance algorithm to use (e.g., wound-wait
+//! or wait-die).
+//!
+//! The [`define_class`] macro and [`Class::new_wait_die`]/[`Class::new_wound_wait`]
+//! constructors provide safe ways to create classes.
+
+use crate::bindings;
+use crate::prelude::*;
+use crate::types::Opaque;
+
+/// Creates static [`Class`] instances.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::{c_str, define_class};
+///
+/// define_class!(WOUND_WAIT_GLOBAL_CLASS, wound_wait, c_str!("wound_wait_global_class"));
+/// define_class!(WAIT_DIE_GLOBAL_CLASS, wait_die, c_str!("wait_die_global_class"));
+/// ```
+#[macro_export]
+macro_rules! define_class {
+    ($name:ident, wound_wait, $class_name:expr) => {
+        static $name: $crate::sync::lock::ww_mutex::Class =
+            // SAFETY: This is `static`, so address is fixed and won't move.
+            unsafe { $crate::sync::lock::ww_mutex::Class::unpinned_new($class_name, false) };
+    };
+    ($name:ident, wait_die, $class_name:expr) => {
+        static $name: $crate::sync::lock::ww_mutex::Class =
+            // SAFETY: This is `static`, so address is fixed and won't move.
+            unsafe { $crate::sync::lock::ww_mutex::Class::unpinned_new($class_name, true) };
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
+/// use kernel::sync::lock::ww_mutex::Class;
+/// use kernel::c_str;
+/// use pin_init::stack_pin_init;
+///
+/// stack_pin_init!(let _wait_die_class = Class::new_wait_die(c_str!("some_class")));
+/// stack_pin_init!(let _wound_wait_class = Class::new_wound_wait(c_str!("some_other_class")));
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
+// SAFETY: [`Class`] is set up once and never modified. It's fine to share it across threads.
+unsafe impl Sync for Class {}
+// SAFETY: Doesn't hold anything thread-specific. It's safe to send to other threads.
+unsafe impl Send for Class {}
+
+impl Class {
+    /// Creates an unpinned [`Class`].
+    ///
+    /// # Safety
+    ///
+    /// Caller must guarantee that the returned value is not moved after creation.
+    pub const unsafe fn unpinned_new(name: &'static CStr, is_wait_die: bool) -> Self {
+        Class {
+            inner: Opaque::new(bindings::ww_class {
+                stamp: bindings::atomic_long_t { counter: 0 },
+                acquire_name: name.as_char_ptr(),
+                mutex_name: name.as_char_ptr(),
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
+    /// Creates a [`Class`].
+    ///
+    /// You should not use this function directly. Use the [`define_class!`]
+    /// macro or call [`Class::new_wait_die`] or [`Class::new_wound_wait`] instead.
+    fn new(name: &'static CStr, is_wait_die: bool) -> impl PinInit<Self> {
+        pin_init! {
+            Self {
+                inner <- Opaque::ffi_init(|slot: *mut bindings::ww_class| {
+                    // SAFETY: The fields are being initialized. The `name` pointer is valid for a
+                    // static lifetime. The keys are zeroed, which is what the C side does.
+                    unsafe {
+                        slot.write(bindings::ww_class {
+                            stamp: bindings::atomic_long_t { counter: 0 },
+                            acquire_name: name.as_char_ptr(),
+                            mutex_name: name.as_char_ptr(),
+                            is_wait_die: is_wait_die.into(),
+                            // TODO: Replace with `bindings::lock_class_key::default()` once
+                            // stabilized for `const`.
+                            //
+                            // SAFETY: This is always zero-initialized when defined with
+                            // `DEFINE_WD_CLASS` globally on C side.
+                            //
+                            // For reference, see __WW_CLASS_INITIALIZER() in
+                            // "include/linux/ww_mutex.h".
+                            acquire_key: core::mem::zeroed(),
+                            mutex_key: core::mem::zeroed(),
+                        });
+                    }
+                }),
+            }
+        }
+    }
+
+    /// Creates wait-die [`Class`].
+    pub fn new_wait_die(name: &'static CStr) -> impl PinInit<Self> {
+        Self::new(name, true)
+    }
+
+    /// Creates wound-wait [`Class`].
+    pub fn new_wound_wait(name: &'static CStr) -> impl PinInit<Self> {
+        Self::new(name, false)
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
-- 
2.51.2

