Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830052F8E9C
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 15:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229098; cv=none; b=dI+U+S2htud/wQQ8yBUF0Pi8QtUbjfixgWfVMMVoKrjt/Yb1GYZ8Z6NmjXXYPu+8IwRQckjfH8WLF7viRkyp8i8GiavOHu1wt/1zs2gR5rX+m/2I5YUJb2mh//40UjSlD3/jHyDy1iWZBF3vRF2mkPojMiCg3zEeDlwwGHeb0Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229098; c=relaxed/simple;
	bh=sEQdxcu9HGG50KUtI+Yfq3UE5aDnJQn2IehrjvSaf+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XySqnt3jzzof7WtHaf1TIUsz/dTpsRHuBS/j5o7l5g/k2pzqnliLpgkkZb0RYpA4l7jjZ5yPLNk3dz0ir4DcBJ6m4DtuXCJQkuQIAfqpVTfisdz25GmZcxYJGKqr6WxrszoeQ01hwkkWFTlvfhKUBCsLydR31l7lSykplPtcC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W1zOcbSz; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W1zOcbSz"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-462c1cf9003so24451f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 08:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782229095; x=1782833895; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhj+S01Z5M3KHkLhUrinNT/zcDOEFzaUBDPoel20ve0=;
        b=W1zOcbSze3VzTnCVQNjpmDLHERsyhJ1Fo5j9JQ6G6Z0yiOjQl85TXrMQ05VPoID3YH
         Kf0b0rmfIcsxq3FWAoD+SXjqhNk9kFtGNBjk9/MX8WL6I/m+CeFoiHjnjEZ0oAXEZC/w
         h2oZB7BUh4I6KA89x0wbzZh11NvD6Ebf3guG4oDASiUtPOh8ps42rcdzjlupodkmdoDe
         1pW7fChkmyq3XD8PPPG/78AwGNUaQlhKWEVTlZoiv7EXAPokcozimM3HE7n7CoX/Sa6a
         aICkch9ZCeHaT6LRCUgGKWV7zCK9FG5tonphSE1+E6wla95dVKFIi91Hms4fdXOHJEEA
         XUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229095; x=1782833895;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhj+S01Z5M3KHkLhUrinNT/zcDOEFzaUBDPoel20ve0=;
        b=UGKPzK07LGBGc9+dMJtLAYFlGwjZwRTjYvIzJ60n9cqtRXeLeszSWZcnJu+3jA6Bmb
         Npay9Z6gzLcVpzpwVYVNORz4TzH5bEfnxKwxi6DvVGk8Rl3u/otkf9WvHaTnhKWdfkkY
         FRdborTIbWeQhhH3WgKNrSJoT8wacLzNTc6wpY3P4G84X63I174K49R0Mcd70C/FXeSJ
         Sgyqy65660bG91lhf9aKs4VGYL1cYcT1KGyUCWrz4ESKTQ2mUOE9z/ub+5KIz4W01bBM
         7kkmlUUW1Pg/tYT1/rz4kLHCDP6fwIGNKCCP8WzKV7WiIfEvC9PmGzaimDmlA+ovPYwX
         wzvg==
X-Forwarded-Encrypted: i=1; AFNElJ9f7HOpfiaGwZoPyAMHHYp856u+qstodZV+EjNekhs5gvep0SNadkDlHkPKSi8McuI9w3Jaf/z+3YZVRhMrKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBaIAenwU45iS2FzQwMiteJ1vmthFc8EG9tbCCczCaQO3ywKZS
	+rxGkq/Il5wXk9DuosYqk8T3fdaokLVbJmStvNwcndKwAF0Z1GefP2tVFZguKLrbosVmJyzHRIa
	S9TIfOCM+gdHigWFBdQ==
X-Received: from wrpu2.prod.google.com ([2002:adf:f882:0:b0:46a:9cd4:74ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:524d:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-4925b38cccfmr44921415e9.33.1782229094535;
 Tue, 23 Jun 2026 08:38:14 -0700 (PDT)
Date: Tue, 23 Jun 2026 15:38:06 +0000
In-Reply-To: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9438; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=sEQdxcu9HGG50KUtI+Yfq3UE5aDnJQn2IehrjvSaf+0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqOqhgqM9WK2vQmR3P/AxFCBVGZn8550S2s+9/t
 Oezn2vaUmWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCajqoYAAKCRAEWL7uWMY5
 RveiD/9RL56fCKylr5DFRQI7iTzz2pfNO1NjLymLwdmyL23fjS25pOxcrHSij2VyY4PnL+5ZZFN
 RaIt39fBzYc3HEwl/3MeAdD+3NjO3ctud/wmEYhAbuaRhkESY1ZQ8Li3d2DotQoC0iiGP/aIZXB
 pMcaDVqbjBLzeASU55bCLigGonIdcPk7znQeROA1yQ9aXih4mhFMVW72+U2n4PPBeQwmBUNAJAk
 NLRioLXVLoX2WCkJswkKlVmqHfDnjATo+SkE2z2OE5kJqLddLtJu7wEybc+npiH2g49qvQHyJ7s
 M7sYo5nxSCDI2RAMA7PQ6UGD+2Ye1/jAHwghPApum/04ixQG05dKba4FtSlbVYvMYAcdIEtsePE
 thrqKhcxemu5VjG6k0gCiIOdtHPJ8NZyIo/qKbQQImLt/MM4fxE+O7Ay4przlolpNWqfFVZ9B/n
 wzDyntxsKWm6Ht/RGtX4erSt23Y7JLdP8e5D8RTWY0Ix8fl8opgwEXDJOr6aQhF4LUKHHR6Nc0x
 KNl4qncAgC/PpL462bSbsofhSydxtLCWVVkhhlBJXDD0jsHJE+jDs+Z/cifRGj7Z3JrTB3ou/7A
 gtrFp8Gm25VzedZ/YC0jTqir4H+xENo+QF2kNg84dHmtshBS/VVku5aVPAEzXBgYE8t5vEEhlVG yWkyP9Y9fJxLl5A==
X-Mailer: b4 0.14.3
Message-ID: <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
Subject: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
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

Printing can be very expensive if it occurs often, so printing that can
be triggered by userspace should be rate limited. For this purpose, add
a Rust wrapper around `struct ratelimit_state` and use it in the new
macros.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/helpers.c   |   1 +
 rust/helpers/ratelimit.c |  14 ++++
 rust/kernel/lib.rs       |   1 +
 rust/kernel/prelude.rs   |   8 ++
 rust/kernel/ratelimit.rs | 202 +++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 226 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d17eaec76450..2184b11c927f 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -80,6 +80,7 @@
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
index b72b2fbe046d..ba65ab4f0b8c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -111,6 +111,7 @@
 pub mod ptr;
 #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
 pub mod pwm;
+pub mod ratelimit;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
index 44edf72a4a24..5a66028dd973 100644
--- a/rust/kernel/prelude.rs
+++ b/rust/kernel/prelude.rs
@@ -89,13 +89,21 @@
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
     static_assert,
     str::CStrExt as _,
     try_init,
diff --git a/rust/kernel/ratelimit.rs b/rust/kernel/ratelimit.rs
new file mode 100644
index 000000000000..da0a49412023
--- /dev/null
+++ b/rust/kernel/ratelimit.rs
@@ -0,0 +1,202 @@
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
+            let init: $crate::bindings::ratelimit_state = $crate::bindings::ratelimit_state {
+                lock: $crate::sync::lock::spinlock::raw_spin_lock_unlocked($crate::c_str!(
+                    ::core::stringify!($name)
+                )),
+                interval: $interval,
+                burst: $burst,
+                // SAFETY: This type can be zeroed.
+                ..unsafe { ::core::mem::zeroed() }
+            };
+            // SAFETY: This is a repr(transparent) wrapper, and the invariants are satisfied.
+            unsafe { ::core::mem::transmute(init) }
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
+    /// The default interval used for rate limiting.
+    pub const DEFAULT_INTERVAL: i32 = bindings::DEFAULT_RATELIMIT_INTERVAL as i32;
+
+    /// The default burst size.
+    pub const DEFAULT_BURST: i32 = bindings::DEFAULT_RATELIMIT_BURST as i32;
+
+    /// Check if an action should be rate-limited.
+    ///
+    /// Returns `true` if the action is allowed, and `false` if it should be suppressed.
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

-- 
2.55.0.rc0.799.gd6f94ed593-goog

