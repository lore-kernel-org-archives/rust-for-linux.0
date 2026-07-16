Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468341F5D9
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205294; cv=none; b=F6XLR7gLBqId+boIG4mTNqBYJgxOXWz8ahlZl7h3spbO7tm70ZmtnWPqpU/XWwdS8MewTtOpFy3jiqvC5jRWmmR8HQEWCldaQEG4WxTY8ICjn+wYVG/mB6p/ZNm2EUVTrurWn2mhdQaajGKwoo2CofwHZcc8CUmzdUhIduKWe0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205294; c=relaxed/simple;
	bh=3i3GDjIlwvozhnGmllgMo5tK2nwxQB1v2sugL7c30P4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BsECW35AJeWvi9k8hfOnVUKd52mSBUIh6NZsJ5aw0h/8lys17Ez7vypRl0oACdLOPRRUQ1NAlIzTK64bGa4u1yv+/NtEsa8/wKKFY17UmNB2l/G2h/B/Qj7A6VIHuV1vVtsPY/FtGVZB8vct/v8p1sxwqdGWifpVqfl1ETBKhp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rSZV67NK; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rSZV67NK"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493ce08a6b4so59871535e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784205289; x=1784810089; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cqy/U1/ec//K4h0kBammt9qPwKEI8xiFB29un8NNrvk=;
        b=rSZV67NKtbZIIkhMC874t2d3978DHAKEzkkZUH+Uq3cOVaUzwLztNVmBYNqKZj3i71
         IyNDdSODY/nibqDOD3GRtmbRlhISW/ZvsBFVWeJ0BXUeCTZHgUql0azILHOJhp2Sql+/
         tBVerQjaVhw3wbyNyUpjEqPREpIzPvrk+Yh1kmDr2OZAoc5gMp1GtM7whUe+THMfWSlE
         6K45LkogkPRnRBrqWCKmrD3fD0A/buSzLLec+mzKugMNpa34WDzLAsKZrVD+CkcUqIlK
         HX1NWXC4eWdDr1uy5H3kfm4A0citsNY/MKBJRnt6HGZ9maXm8x6uWIIqYtTndOHUoscp
         MW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205289; x=1784810089;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cqy/U1/ec//K4h0kBammt9qPwKEI8xiFB29un8NNrvk=;
        b=WlInkb15CDR90bFJcv8HZDGpRoQrHr+AYGVjRjTHFf7w9tGlDSRxdR9FRCRSCd1rgk
         2kvboL3b9WdCYUx+NpWBHWYbWS+NSWTnEAk8xNmOtkhZWw6Vn6sI5xKs9+21YLUuWEd8
         XPew2X/V29RCrcd0XsWwbCHEKac9pzFEWdO/7EbxtV3/tBveNl9PSiSXw5Y0I9Bc6SjC
         nclFYnIe43et1lpVyHBXx9N46eRJNp/2h9Vi/Mc8ScSj07FzZV8r4OVX03O12Bk+4mDb
         jDBZC4QN68JlCR37a42qM+lSvITGdJaTN9ZsU3xuRaZtWRePzeI+zLjpGnbXHdRb2sTY
         yGhw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2nacNtqnWjy9luCUVC/ElHkzpC4DMSfx0ZWYlaHSQtuzDsRRxmolsK+eJMbkjlDEtr6iFHY4K4oy86e5wuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmO5GvSPEltxuOn3BvyoUQyW11WJO1DfCi++X1dqcKjmFOCPMQ
	cOzmlo32FrqAVa8lgJHBAL6NVOPQsiZPSWTWqMKiAlAW/iNv5O18J/qmcvnUtwiKOoRwHFFL8nJ
	hFsQ3ZgAWRq6/BMDOVA==
X-Received: from wmep2.prod.google.com ([2002:a05:600c:4302:b0:489:1b01:386f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3514:b0:493:c2cc:aecb with SMTP id 5b1f17b1804b1-49538cc87b2mr108722365e9.38.1784205288635;
 Thu, 16 Jul 2026 05:34:48 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:34:27 +0000
In-Reply-To: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10696; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=3i3GDjIlwvozhnGmllgMo5tK2nwxQB1v2sugL7c30P4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqWM/i0aMkkwr8jJK6RXR5ijh+strMt/nx/VQQA
 hAJI1cgowWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaljP4gAKCRAEWL7uWMY5
 RmvRD/9goH8Dtjs+5f/EJvJO14oTTVI9FhiOXxIXLsWwtEMMpXjN+133Er+4pnrIDiZzHP2LuoA
 YEqIzP18UmpsjgivoUfjlCQoUEUhy0PPbD9wlx4FD42Ae5CvLpOoc+xWBHwyTuC68kWEItiBbuU
 6Yk17iTk8KE+pywMbiyZs2C/b+KlUIRqHFWSgtla0fom0aBgeHz1YeMZNOUhdwz0pFjE62HHJHA
 gwRji5npr4aOvq7iGSZPb6JHvn3BjmdkU6GqsvuIds3jl99z4JxqRO0yvkZM9Abemm3gFs6m23H
 KMLBsSXfPKnH4nSQR2TCICWHLiVLTPK/Ra5A4mlHcIfgKhhtOpdnSI6nlHYrXl3RYx/GUxdAlZx
 w89PzHDJ2kFblNNyPs5cOakClFZ8D6fl51ooQPW1b/jeEndvaw1ygsJ5qGmWb8sLAYFMTbrk5Is
 mwxDI+voHmMwPVdyj0eb9MUnbo9jHncHjT5KeSLKkZFnx7uRWlkjxUI6EIfRNBD1uHaZzBwORPA
 4/9h/iEGkIVV5nZuIedrs8/v8/PqrR6WiGC8s0TFDwpdxUDYlvFONSjlL4y5oTyEN5wMc5dzWow
 LSsmyCQA4kg0O4ljX8DSV07iqzMoNNy8aGbJVMZ3476fLUqx3JuGPrUePFPaLHZKYeD53yMtWGA D/5Szpi0OLWKNmQ==
X-Mailer: b4 0.14.3
Message-ID: <20260716-pr-ratelimited-v2-3-31c27a4543d2@google.com>
Subject: [PATCH v2 3/5] rust: add pr_*_ratelimit! macros for printing
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

