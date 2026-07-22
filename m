Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A0A481FB0
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784715148; cv=none; b=fDhss8vxy5DCgvvtbusA2lg2395M/jSHGOvVMbhGm+SGb+75PthpTFuW8sBcLWCbPMXyeIGYvgrxs7IL1lI/prxYJXTUmGVsuDWxi5M39/d/CwLf/oCgmnI7c64kfGOD5o+uJGyOzY43iNYEcw8Y6zfOyBOTpSG23r4K/hWzZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784715148; c=relaxed/simple;
	bh=3i3GDjIlwvozhnGmllgMo5tK2nwxQB1v2sugL7c30P4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IhJBkZ9nFHzib1OWhS3EKqtqKB7bqKarFxoiIq9Cfqi/vphASPjO3bLpV49+kxbRnt3nW6FhJPoVBH+dE452TXW0ocneQR4E8qTk359Mmt1MMYADakL0JuuHyomDN4RUpXATrvu29mXd8JP6DRmiPZmI8iWt3hYpOl3HpOx6iPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iHsY3UWC; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iHsY3UWC"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4955e865174so21257275e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 03:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784715144; x=1785319944; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cqy/U1/ec//K4h0kBammt9qPwKEI8xiFB29un8NNrvk=;
        b=iHsY3UWCN6SuFQNaWUPfJexmzhDFhSHez+64WpSqEAacqaopjAoc7rSQAR7fH5JYZV
         HJPmtyGFDXRfsqzpU+GxOkXpJCH9lPW7Zii3fLMxdbJbLVLFt/NMleLWE6VwWftpyPce
         jGVnoNg7/jrjVUzlz6fBWGqsGXxLW47PAfIo/DuWAXId0VvVfUW6vyPz6YYJPapVjHda
         1L8COQXzqvRmqcTS+mDjDaZ0LCF9zOPFCYI3QTDAJUDuR3U6LWHAt2OAPqJ29zNdkSXd
         +kqCO/TAEJ+S2u43b9dRQCp0I9SlRbxfPORaQYAlCO8DY8rpTDXParFHJZKtqrXMVCYN
         ZNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715144; x=1785319944;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cqy/U1/ec//K4h0kBammt9qPwKEI8xiFB29un8NNrvk=;
        b=rxkf9mm9t/uxE2usdLeD/rBapXz2m5NfpCKiFRf/FThqts9QZPSYpR2SgrbsNb/MHD
         SkrfoKGqp9x44LaVF5S7KhUouHYwYH3yVRyxy0pWBaz6imdTQL6e5PamNzT4niv8NGKV
         eoN2Cy8iTLm/jedInU2l0gTcj4EUg2LGL9ZIjw/G3LthdkAtGf4FbQtmvx3VCYbTEaNU
         XKczkATUy4LkFIYXdNEMYY+AaYFOQzEWPdG+QVlHiNZ/B5l53iiR3neL2F3NgabnzPOx
         237TBVkAreONZhZdyFiIBi0nffHZZbQzJpNqqyIZS1IhdMspW4y5MH5XxqciROYXKZed
         ez/A==
X-Forwarded-Encrypted: i=1; AHgh+RrxJjJ9spcfZaHqIxPS32s2JDhVgD9JSPiWA7Lz8Ylk0PRbiW3kZ0uCZ7IQc+W/97FVXuVBQ3dhQ1zYO4Pz7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDKj4Cbu8WW4QbDgQE3gj1xTThVV7X7Wko16DlVAPOEA9H8gZQ
	SoOY0OKNKs2CPwVyGClDSUXvC9vn56IBS6u2fa3bPVQlZ/B9nD3568QdcNhOZoM/HgL89qbzvAb
	8NTVWGABD22DBdokhbA==
X-Received: from wmbha11.prod.google.com ([2002:a05:600c:860b:b0:493:b301:e269])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190b:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-4954aa1a10amr240255935e9.36.1784715143275;
 Wed, 22 Jul 2026 03:12:23 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:12:11 +0000
In-Reply-To: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-pr-ratelimited-v3-0-57faa37fdfbd@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10696; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=3i3GDjIlwvozhnGmllgMo5tK2nwxQB1v2sugL7c30P4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqYJeAQWMR55n30JeNseWxvHvsvNWsTDmSCdNU/
 j/Ab3QM64eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamCXgAAKCRAEWL7uWMY5
 RhTuEACnwc9is6TBh96Rvo3qwhDVoygAzJGXd2QKHu3jgso3wgsRAGxxx3cyFl6Ig4yI6BAyllE
 yaTwqvFnm++S9p+h43S9yGqbzx9cJvV0KFQ5O9iaXKAoGUsCSw5J3PPdUe8HHPiG9Hi9i+Si7Kd
 iZNRgtoIl/rTsjlmnOmWytY6+oOrcJpb9VxNjxsZNew/JIiVUMVbT8rDJr/fVVszpPT6kLXyPtj
 HYzKYf6aozCoY53JvdW/PzzpRHbL+En0SgzwjthwqanwzfshwK21lqtOKYHou4I5+r/66DYqWpc
 uBsHhlaSwTtwLQSzT88k5L1E0TJT6wQfc6ylQZlHr36g12u4a/V4uJYazWO+4Wq+9EOJnp7sO8q
 zB6l1z/aX1RoDIRHwgEIL87kBpzRMpIhV/ahnqfsTTGn1DSC0vbj/fP7heYtobNl6Unbb1xFuVd
 W26l9J12Z2hstwMF/E1W9P7byWy5TyIc8C2eJQtdQ3b+9LWAJA4ChBYRdqt0noDNRaqO0nBfE5v
 Vbc896Dcj2BbC5JUiCvdHf77bzCQ3RYeJ7cnXJq8usXxgX4X1JoaFQxpk+5N8caKOVoAqnZXUPs
 LByx0+GMnT3vpleTiSuYszxrtTRVkl7ikKPV24w/So4XmBaqWKo8+7Y5jmB64INwobFO3RChAUk NI0d9aHktB9pjYg==
X-Mailer: b4 0.14.3
Message-ID: <20260722-pr-ratelimited-v3-3-57faa37fdfbd@google.com>
Subject: [PATCH v3 3/5] rust: add pr_*_ratelimit! macros for printing
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
	Alice Ryhl <aliceryhl@google.com>, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="utf-8"

Printing can be very expensive if it occurs often, so printing that can
be triggered by userspace should be rate limited. For this purpose, add
a Rust wrapper around `struct ratelimit_state` and use it in the new
macros.

Tested-by: Alvin Sun <alvin.sun@linux.dev>
Reviewed-by: Carlos Llamas <cmllamas@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/122
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/helpers.c            |   1 +
 rust/helpers/ratelimit.c          |  14 +++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/prelude.rs            |   8 ++
 rust/kernel/ratelimit.rs          | 215 ++++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/lock/spinlock.rs |   1 -
 6 files changed, 239 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 1d4ee51f576b..cbecf152f647 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -82,6 +82,7 @@
 #include "processor.c"
 #include "property.c"
 #include "pwm.c"
+#include "ratelimit.c"
 #include "rbtree.c"
 #include "rcu.c"
 #include "refcount.c"
diff --git a/rust/helpers/ratelimit.c b/rust/helpers/ratelimit.c
new file mode 100644
index 000000000000..e5052f568b81
--- /dev/null
+++ b/rust/helpers/ratelimit.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/ratelimit.h>
+
+__rust_helper void rust_helper_ratelimit_state_init(struct ratelimit_state *rs,
+						    int interval, int burst)
+{
+	ratelimit_state_init(rs, interval, burst);
+}
+
+__rust_helper void rust_helper_ratelimit_state_exit(struct ratelimit_state *rs)
+{
+	ratelimit_state_exit(rs);
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..f53dd564aef5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -112,6 +112,7 @@
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
+pub mod ratelimit;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index ca396f1f78a6..bcaa232205be 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -107,13 +107,21 @@
     },
     init::InPlaceInit,
     pr_alert,
+    pr_alert_ratelimited,
     pr_crit,
+    pr_crit_ratelimited,
     pr_debug,
+    pr_debug_ratelimited,
     pr_emerg,
+    pr_emerg_ratelimited,
     pr_err,
+    pr_err_ratelimited,
     pr_info,
+    pr_info_ratelimited,
     pr_notice,
+    pr_notice_ratelimited,
     pr_warn,
+    pr_warn_ratelimited,
     str::CStrExt as _,
     try_init,
     try_pin_init,
diff --git a/rust/kernel/ratelimit.rs b/rust/kernel/ratelimit.rs
new file mode 100644
index 000000000000..426992e452a2
--- /dev/null
+++ b/rust/kernel/ratelimit.rs
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rate limiting support.
+//!
+//! C header: [`include/linux/ratelimit.h`](srctree/include/linux/ratelimit.h)
+
+use crate::{
+    bindings,
+    prelude::*,
+    types::Opaque, //
+};
+
+/// Defines a `static` containing a [`Ratelimit`].
+#[macro_export]
+macro_rules! ratelimit_state_init {
+    ($name:ident, $interval:expr, $burst:expr $(,)?) => {
+        static $name: $crate::ratelimit::Ratelimit = {
+            let name = $crate::c_str!(::core::stringify!($name));
+            let interval = $interval;
+            let burst = $burst;
+            // SAFETY: This will be stored in static memory.
+            unsafe { $crate::ratelimit::Ratelimit::new_static(name, interval, burst) }
+        };
+    };
+}
+pub use ratelimit_state_init;
+
+/// Rate limiter state.
+///
+/// # Invariants
+///
+/// The `inner` field contains an initialized `struct ratelimit_state`.
+#[pin_data(PinnedDrop)]
+#[repr(transparent)]
+pub struct Ratelimit {
+    #[pin]
+    inner: Opaque<bindings::ratelimit_state>,
+}
+
+// SAFETY: `Ratelimit` is safe to be sent to any task.
+unsafe impl Send for Ratelimit {}
+
+// SAFETY: `Ratelimit` is safe to be accessed concurrently as it is protected by an internal
+// spinlock.
+unsafe impl Sync for Ratelimit {}
+
+impl Ratelimit {
+    /// Constructs a [`Ratelimit`] with the specified configuration.
+    ///
+    /// If `interval` is zero, then no rate limit is applied.
+    #[inline]
+    pub fn new(interval: i32, burst: i32) -> impl PinInit<Self> {
+        // INVARIANT: This creates a `Ratelimit` containing an initialized `struct ratelimit_state`
+        pin_init!(Self {
+            inner <- Opaque::ffi_init(|slot: *mut bindings::ratelimit_state| {
+                // SAFETY: `slot` is a valid pointer to an uninitialized `struct ratelimit_state`.
+                // The memory is pinned so it remains valid until `ratelimit_state_exit` is called.
+                unsafe { bindings::ratelimit_state_init(slot, interval, burst) };
+            }),
+        })
+    }
+
+    /// Constructs a [`Ratelimit`] with the default configuration.
+    #[inline]
+    pub fn new_default() -> impl PinInit<Self> {
+        Ratelimit::new(Ratelimit::DEFAULT_INTERVAL, Ratelimit::DEFAULT_BURST)
+    }
+
+    /// Constructs a [`Ratelimit`] with the specified configuration.
+    ///
+    /// The name will be used for the lockdep name of the internal spinlock. See [`Self::new`] for
+    /// the meaning of `interval` and `burst`.
+    ///
+    /// # Safety
+    ///
+    /// The resulting value must be stored in static memory.
+    pub const unsafe fn new_static(name: &'static CStr, interval: i32, burst: i32) -> Self {
+        Self {
+            inner: Opaque::new(bindings::ratelimit_state {
+                lock: kernel::sync::lock::spinlock::raw_spin_lock_unlocked(name),
+                interval,
+                burst,
+                ..pin_init::zeroed()
+            }),
+        }
+    }
+
+    /// The default interval used for rate limiting.
+    pub const DEFAULT_INTERVAL: i32 = bindings::DEFAULT_RATELIMIT_INTERVAL as i32;
+
+    /// The default burst size.
+    pub const DEFAULT_BURST: i32 = bindings::DEFAULT_RATELIMIT_BURST as i32;
+
+    /// Check if an action should be rate-limited.
+    ///
+    /// Returns [`true`] if the action is allowed, and [`false`] if it should be suppressed.
+    #[inline]
+    pub fn ratelimit(&self) -> bool {
+        // We don't set `RATELIMIT_MSG_ON_RELEASE`, so the function name parameter is not used.
+        //
+        // SAFETY: `self.inner.get()` is a valid pointer to a `struct ratelimit_state`.
+        // The lifetime of `func` ensures the pointer remains valid for the duration of the call.
+        // The C function `___ratelimit` handles its own internal locking, so it is safe to call
+        // concurrently.
+        unsafe { bindings::___ratelimit(self.inner.get(), c"Rust".as_char_ptr()) != 0 }
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for Ratelimit {
+    #[inline]
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: By the type invariants, this struct contains an initialized `struct
+        // ratelimit_state`.
+        unsafe { bindings::ratelimit_state_exit(self.inner.get()) };
+    }
+}
+
+/// Helper macro to implement ratelimited printing.
+#[macro_export]
+#[doc(hidden)]
+macro_rules! print_ratelimited {
+    ($print_macro:ident, $($arg:tt)*) => {{
+        $crate::ratelimit::ratelimit_state_init!(
+            _rs,
+            $crate::ratelimit::Ratelimit::DEFAULT_INTERVAL,
+            $crate::ratelimit::Ratelimit::DEFAULT_BURST,
+        );
+        if $crate::ratelimit::Ratelimit::ratelimit(&_rs) {
+            $crate::$print_macro!($($arg)*);
+        }
+    }};
+}
+
+/// Prints an emergency-level message (level 0) if allowed by a rate limiter.
+///
+/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
+#[macro_export]
+macro_rules! pr_emerg_ratelimited (
+    ($($arg:tt)*) => (
+        $crate::print_ratelimited!(pr_emerg, $($arg)*)
+    )
+);
+
+/// Prints an alert-level message (level 1) if allowed by a rate limiter.
+///
+/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
+#[macro_export]
+macro_rules! pr_alert_ratelimited (
+    ($($arg:tt)*) => (
+        $crate::print_ratelimited!(pr_alert, $($arg)*)
+    )
+);
+
+/// Prints a critical-level message (level 2) if allowed by a rate limiter.
+///
+/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
+#[macro_export]
+macro_rules! pr_crit_ratelimited (
+    ($($arg:tt)*) => (
+        $crate::print_ratelimited!(pr_crit, $($arg)*)
+    )
+);
+
+/// Prints an error-level message (level 3) if allowed by a rate limiter.
+///
+/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
+#[macro_export]
+macro_rules! pr_err_ratelimited (
+    ($($arg:tt)*) => (
+        $crate::print_ratelimited!(pr_err, $($arg)*)
+    )
+);
+
+/// Prints a warning-level message (level 4) if allowed by a rate limiter.
+///
+/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
+#[macro_export]
+macro_rules! pr_warn_ratelimited (
+    ($($arg:tt)*) => (
+        $crate::print_ratelimited!(pr_warn, $($arg)*)
+    )
+);
+
+/// Prints a notice-level message (level 5) if allowed by a rate limiter.
+///
+/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
+#[macro_export]
+macro_rules! pr_notice_ratelimited (
+    ($($arg:tt)*) => (
+        $crate::print_ratelimited!(pr_notice, $($arg)*)
+    )
+);
+
+/// Prints an info-level message (level 6) if allowed by a rate limiter.
+///
+/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
+#[macro_export]
+macro_rules! pr_info_ratelimited (
+    ($($arg:tt)*) => (
+        $crate::print_ratelimited!(pr_info, $($arg)*)
+    )
+);
+
+/// Prints a debug-level message (level 7) if allowed by a rate limiter.
+///
+/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
+#[macro_export]
+macro_rules! pr_debug_ratelimited (
+    ($($arg:tt)*) => (
+        if cfg!(debug_assertions) {
+            $crate::print_ratelimited!(pr_debug, $($arg)*)
+        }
+    )
+);
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index 697efa7e04c6..b9869f958ce0 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -151,7 +151,6 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
 ///
 /// For use in statics containing raw spinlocks.
 #[doc(alias("__SPIN_LOCK_UNLOCKED", "DEFINE_SPINLOCK"))]
-#[expect(dead_code)]
 pub(crate) const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings::raw_spinlock_t {
     // Silence unused variable warnings.
     #[cfg(not(CONFIG_DEBUG_LOCK_ALLOC))]

-- 
2.55.0.229.g6434b31f56-goog

