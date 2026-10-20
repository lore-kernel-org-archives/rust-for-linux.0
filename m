Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510297;
	b=O9wkM7OL8MBkEpPpY1Du8syy8eSAP/frY888k4wRqcLr0bKfPBWFUv4Vw0n8RtNTIXkI
	 O1xEUjnUQ7iJBrWkRTT5373nkXW38Y1Zhp4w/9qXOzTrjRyevaWYVeoHaYTtTk3DjLjAv
	 L37wJGM/aRdB67MYsBmyVNZfCEfaA0w4hrhEyCRr4vpzo2/K200zIU9aJn2GksEkGnUVr
	 qZF7yqhcSazjTaJeS4m/+BQb8Ug3fBVr2Cpt9N36qTTQsGAg54JZP23esNKgsY9RvAPPd
	 CHB+u/r/HyfAsMT/VInOU70Of3FSZh7UxcQ1jXyvbXOyZSzHgCRiwURb2UpLyT0yQlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510297;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=ozMRWgTmERbTm7OTdn+HlrOHvH/CkZpAs4fZ5ypYxgk=;
	b=J23LTKZAN9SM3tgOEslUePySYkR24Ac6xcrjf36DO28ugbut/90HwSzTTMNEx9r+jpBs
	 eAr7lqZHurJYv7Tz4eWK9rE+iIOm0SCFMxE/cGglFPwmHH2fz+R69puQyTm6JKI8KWTRI
	 +Nk3/COOJuw/DcviL+Cgw2RG1OUwQFaGA1j7WCXPX19JwMUMHM+u5tbdxRTUyK+ZFzV8s
	 4yaO/XvvDZljF+6gWKifkcRw0UnF6YO6NP7xvn9OkG4R+LjnnKJosWcgRF37EZ5LhGqGX
	 nSTF5byiRiYfDC0xF/A3KS2pvdvaFUbMOhToLDPqBHw/3xqKQLQnNqQcYe0voLWHQYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onurozkan.dev;
	spf=pass smtp.mailfrom=onurozkan.dev;
	dkim=pass header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=ftu16uXZ;
	arc=none smtp.remote-ip=79.135.106.111
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B82606A335;
	Tue, 20 Oct 2026 15:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B82606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onurozkan.dev header.i=@onurozkan.dev header.a=rsa-sha256 header.s=protonmail2 header.b=ftu16uXZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1792510294; x=1792769494;
	bh=ozMRWgTmERbTm7OTdn+HlrOHvH/CkZpAs4fZ5ypYxgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ftu16uXZHrnYCNUW+rKuptAMdPJUPvl5lOooz/n8/BGbP95mB2vmjxUKkB1G2yIwS
	 wmv99Uvb3Icx1D/nWvuL5ZkK2TAS2yB1bHsCBW/uR8ac/QkpxzFexKGU5Nu6ZcPw0+
	 5OMacfqM8qJqSLtsoDKiT1TMXBTSEKMGEPO4ETj+vv8rv9pghazpsK20XRtW6qaM17
	 8N+h1QKnKnM3pZTEz+8BrtzCkpV0sul4U9+k4Op7pRW0QxyxyejTO+fIy2OEcR8Izi
	 9r7k+9s3nPzM6MAm2XLkTR2ppDP9nMGbzj3Zgrt5P8mXdTosnJyMIvOlJGrruF3Cq1
	 rA/WneWgSBCuQ==
X-Pm-Submission-Id: 4j8Gbf4TMCz2ScPL
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
Subject: [PATCH v13 3/7] rust: implement Class for ww_class support
Date: Tue, 20 Oct 2026 18:29:39 +0300
Message-ID: <20261020153112.299745-4-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20261020153112.299745-1-work@onurozkan.dev>
References: <20261020153112.299745-1-work@onurozkan.dev>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the Class type, the first step in supporting ww_mutex in Rust.
Class represents ww_class, used for deadlock avoidance for supporting
both wait-die and wound-wait semantics.

Also adds the define_ww_class and define_wd_class macros for safely
declaring static instances.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/sync/lock.rs                |   1 +
 rust/kernel/sync/lock/ww_mutex.rs       |   7 ++
 rust/kernel/sync/lock/ww_mutex/class.rs | 130 ++++++++++++++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
 create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 10b6b5e9b024f..f509250822c55 100644
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
index 0000000000000..727c51cc73af8
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
index 0000000000000..36c7e87d72660
--- /dev/null
+++ b/rust/kernel/sync/lock/ww_mutex/class.rs
@@ -0,0 +1,130 @@
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
+                    $crate::c_str!(::core::concat!(::core::stringify!($name), "_acquire")),
+                    $crate::c_str!(::core::concat!(::core::stringify!($name), "_mutex")),
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
+                    $crate::c_str!(::core::concat!(::core::stringify!($name), "_acquire")),
+                    $crate::c_str!(::core::concat!(::core::stringify!($name), "_mutex")),
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
+    /// # Safety
+    ///
+    /// Caller must guarantee that the returned value must be pinned before
+    /// its first use.
+    #[doc(hidden)]
+    pub const unsafe fn new_unpinned(
+        acquire_name: &'static CStr,
+        mutex_name: &'static CStr,
+        is_wait_die: bool,
+    ) -> Self {
+        Class {
+            inner: Opaque::new(bindings::ww_class {
+                stamp: bindings::atomic_long_t { counter: 0 },
+                acquire_name: crate::str::as_char_ptr_in_const_context(acquire_name),
+                mutex_name: crate::str::as_char_ptr_in_const_context(mutex_name),
+                is_wait_die: is_wait_die as u32,
+                ..pin_init::zeroed()
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
+    #[inline]
+    pub const unsafe fn from_raw<'a>(ptr: *mut bindings::ww_class) -> &'a Self {
+        // SAFETY: By the safety contract, `ptr` is valid to construct `Class`.
+        unsafe { &*ptr.cast() }
+    }
+}
+
+// SAFETY: [`Class`] is immutable except for its atomic stamp. It's fine to share it across threads.
+unsafe impl Sync for Class {}
+// SAFETY: Doesn't hold anything thread-specific. It's safe to send to other threads.
+unsafe impl Send for Class {}
-- 
2.51.2

