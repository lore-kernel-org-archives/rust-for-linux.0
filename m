Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E70A49A3B7
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383437; cv=none; b=ofi+VlgkUjehD/E2NjsduV8Q84ButD89aKT81733nL/6Si7q1xriEhpqQWiD5tJ7uMgQHIIpWKjM65cGsfY4YpHUDkFalI3tCIXXYz5BtnmRg8foqLd0jSWIG3MMtdyUtHEr6H0BcWL2XYpbNJ+nV940K0SRIDo0qQ4t0ffsvXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383437; c=relaxed/simple;
	bh=JV4/PMZ6Qtt6dKqcbmjdH6LkG0roW7BtzA3z3s9fqso=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iNmGx2ixW0/qVDcylnHfqzgfmq8ughHJz8Os/HrH2xI9247IAoHk/5pysPaBUceyrlZ8LetLF5j+/aMBuGuJZsWiJC0usolgqAVeQHxxLSy9ZqXvUnxPXWPedsSB2kIM9z6HdOKSVb8poKWPwVnoyM/Tbdzvh4/E+/dsdlIsI0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q41VB4jM; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q41VB4jM"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17b4c613fso10774475e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383427; x=1791988227; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JWXAcmfB32d9GBcvB29QMhU4vBRy5jqckmELBbDhl6E=;
        b=Q41VB4jMQaTcnzZfi1UwZ6WrqrcISrQ0VHVFWG6uer/O2nuj9uDq1HNdQMo+IDyrF9
         YpgBRJWudeFagBdYtvJLMrm+oImBw8Vw+FCIO5RsTvPAC7dWnPr1fxCiu361Tz6f4NUF
         xiSRTChqSzLRDoQaBKrNVFV2ojj1x+BwD4eYXPzQFgUNiHepx82xUKh3GW62TWIGwrFZ
         BfXYIJvxxbSumbEluJcGvBzKfMk9JYCvlgLtg6yIVpPEp9UHwETTysMhOUud5XeRz3Ou
         A86gbQqTtQEOvLpN5YSmoung5ocTcvsG1GAyB58zsmthcsoLqem1f8to4PYDRFryb9NV
         jJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383427; x=1791988227;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWXAcmfB32d9GBcvB29QMhU4vBRy5jqckmELBbDhl6E=;
        b=ZDLrEFw8zJLzVLlpTnJWps8/5xid+IY5Y8zT1Dns+oYQ594oXqtboWrxsytfoYQtAy
         6LmPi7G2DxzGYTGGHmlY//wfvXmUZf4hDvXkj9dTeMpXg4VkR9iqcIrFi/k+4peXxbeD
         /YGpS9+TrKQSo81Iho5o1VEaGS8n9C/Hen82kQID6bZSgEzEIVajk0qIVv/PXZ403bXC
         LD4APh3YnbPburw7+xMZJJiyDzJhTya9Ro4ubS7dGPN0LRyyU56P/D59XIZHsA2WcUSn
         lPo8MWy4vkGsz/WHxTO7W42CLFZ/yuwr818uctPr5vHfm7d01C4heylehF+JcyHgHXIB
         Hp2w==
X-Forwarded-Encrypted: i=1; AKwUvByvekbLcDSRI2RrL5GMFyL3Wd4yyLvbYScsVI7a/CVj8dg7dg1ZzsB3TaBoHO0XHkzbeXdmhCkBLKiFHTom4A==@vger.kernel.org
X-Gm-Message-State: AFuF++nPX1Cqi8vKTLqkkgI/dFApDlPFc6tuQ38nQ5u3aKGMZ3xaA06M
	iPi9Vjy6Nr8+UXT8wULPpoQgxMJxiZDc/PXdZlbHO4LUum5ud+9xQljkkGU8segcV4UuRIqHnNU
	kDIJVoM0GleMbP/6S8w==
X-Received: from wmfv12.prod.google.com ([2002:a05:600c:15cc:b0:4a1:7f93:3bcf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6095:b0:4a0:da23:e06d with SMTP id 5b1f17b1804b1-4a1804192a4mr39138815e9.10.1791383426249;
 Wed, 07 Oct 2026 07:30:26 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:30:03 +0000
In-Reply-To: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10917; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JV4/PMZ6Qtt6dKqcbmjdH6LkG0roW7BtzA3z3s9fqso=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqxld33kVQUou01eXxuBI42+V1hHiIcTbkR/nc0
 uDYPafw6aOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasZXdwAKCRAEWL7uWMY5
 RonqD/9SaOND/uaYWHgzSu9YkSY6ntSf4Y5FfrIaiqKOPuZxiuIQA0mLgssvCj2P0lNnU2d/DS3
 QwUk9Nz9Uv+877wpm31u0ZbP+wR0fzBab70AJopoN6dOwBCBl6Fwxh0R4aydOh30/pDtz84mrJV
 uZlu/p9krYLTZ4TmS/DMujUlIPYd+x4VvNMmr6PYiKNK8E7TjHpXG/U5C+jMBwxIrMxI1nngKPi
 Zsy7C/4J8OHGoPGBeNvB+ccJ10APDv/85saCt8Yeh9dzqARqUrMVLkKMPLTeDmAlE7AcILY3+k6
 iS8mF6eXDx9Oh78Rnb5j6LyMSrwAKcNkmUlQx3/yAlYnSR4gK7X1VN74w5U6RABJElkmZAcBAuT
 O1mPGUXMAN6YW1R2Qc74wkIxeaCd/BGiR8kqUz3m/UsGje7/DMmY+t3GegOiYK+UWBTcGdfcorX
 A4fKAhZ/94Dpw68bsTMLG4Nq0yazHJvJhqBf+VSlfHF5ghf/+IQ//taQ5wLD76ngc5gNt3Yx4KM
 ssjyZGAREj5z3ZprsbHUi+wSIt98tfixzMgyupVW9Bf60NfwQRxHGc0nmowUgc4deEM0/UVItz0
 PwODBJlWhNTH7JFoirorYo+qC/oJhxxE2LsnU8Kynsi3IiM/r1gf1ekcXIAEraJuVgsymU3DYQp VCVZaqyseHLvr2w==
X-Mailer: b4 0.14.3
Message-ID: <20261007-pr-ratelimited-v6-3-f14accd4ea3b@google.com>
Subject: [PATCH v6 3/4] rust: add pr_*_ratelimit! macros for printing
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
	Alice Ryhl <aliceryhl@google.com>, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="utf-8"

Printing can be very expensive if it occurs often, so printing that can
be triggered by userspace should be rate limited. For this purpose, add
a Rust wrapper around `struct ratelimit_state` and use it in the new
macros.

The new files will fall under the catch-all RUST maintainers entry.

Tested-by: Alvin Sun <alvin.sun@linux.dev>
Reviewed-by: Carlos Llamas <cmllamas@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/122
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/helpers.c            |   1 +
 rust/helpers/ratelimit.c          |  14 +++
 rust/kernel/lib.rs                |   1 +
 rust/kernel/prelude.rs            |   8 ++
 rust/kernel/ratelimit.rs          | 216 ++++++++++++++++++++++++++++++++++++++
 rust/kernel/sync/lock/spinlock.rs |   1 -
 6 files changed, 240 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 440fb7638e3c..d08958e69de7 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -85,6 +85,7 @@
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
index 7225abc64084..a4747f75b163 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -120,6 +120,7 @@
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
index 000000000000..ea7253e84c38
--- /dev/null
+++ b/rust/kernel/ratelimit.rs
@@ -0,0 +1,216 @@
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
+    #[inline]
+    pub const unsafe fn new_static(name: &'static CStr, interval: i32, burst: i32) -> Self {
+        // INVARIANT: This creates a `Ratelimit` containing an initialized `struct ratelimit_state`.
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
+    pub fn ratelimit(&self, func: &CStr) -> bool {
+        // SAFETY: `self.inner.get()` is a valid pointer to a `struct ratelimit_state`.
+        // The lifetime of `func` ensures the pointer remains valid for the duration of the call.
+        // The C function `___ratelimit` handles its own internal locking, so it is safe to call
+        // concurrently.
+        unsafe { bindings::___ratelimit(self.inner.get(), func.as_char_ptr()) != 0 }
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
+        let loc = $crate::c_str!(::core::concat!(::core::file!(), ":", ::core::line!()));
+        if $crate::ratelimit::Ratelimit::ratelimit(&_rs, loc) {
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
index 037fa63ebcac..6a71bb3a5c45 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -468,7 +468,6 @@ fn spinlock_irq_condvar() -> Result {
 ///
 /// For use in statics containing raw spinlocks.
 #[doc(alias("__SPIN_LOCK_UNLOCKED", "DEFINE_SPINLOCK"))]
-#[expect(dead_code)]
 pub(crate) const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings::raw_spinlock_t {
     // Silence unused variable warnings.
     #[cfg(not(CONFIG_DEBUG_LOCK_ALLOC))]

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

