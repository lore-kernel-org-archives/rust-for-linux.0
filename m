Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686E23AA4E4
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 07:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742214; cv=none; b=tcnFGsQZ33JPFo8OQmtvRZTA6MSi+t9L9QO63bI9a5JNe0J3oEJQZkXs5ZVk4SGPsSbmLOKM2XgfMRfPbXJj0BsrURekBopzFSzbc6JlkWa1oaBkxk5C49abajDN+P6H4VGZxlgTD1JjlI1CN9QiJq4bsVmQtrMevjHsO0ZikrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742214; c=relaxed/simple;
	bh=wsBlPPFoPxaCiPxaYA/jzfhWKDKs0lL+T/BXOyyCY2Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hR490jSNjOb+M8CjQ5vCUytR0GDwO6y9pD9nrxeWEW6hqj5xpeLKVQHHd3dWUxrdCrUMfhxQI58krlIP4ZY0RqUYQxAW/xAVvMPcJiFOPhdG2rAnEEuk7c60J7YF4v7kTpAwrNQAFMxGG1e46yyS4E6x5VfgQ71Cim046CK6ARM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=waHBsN44; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="waHBsN44"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f8580ed9eso3121523f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785742208; x=1786347008; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQvPB6jYC+U9y7/R1Rdle/evzG9UICK1eR/7QT1ydDg=;
        b=waHBsN44Y+y570YN8SqVi7ZLgYjvdHJ6ZuMA2zqCRXRaJLKzxiPY3oBbDwxCCCUUPs
         rp4qnp6syF+ZPv4cTu3C+D6hLbPgOQuRVtYAQTA1BuTl/B+boA58pez28unry3Bi1zlW
         1sHdy/W4lxKJNYYXISTfcSL6QfTQJwNN0KShk8QqVTS+8DzjFjGh1r/3W2gfHJaViAlp
         3FJG4NtVMDdpLpaX4HVoBMhRt6YHLvjRwjjfI7AgELe2Zr6VjXNWcsd4Oj7FBLKEna+s
         KXu0ift1+4fvwzOy2V4cVThb5pzWULP4aXJO2KxF2uokgCdmzRJgxhEHtWScgUJAmtwJ
         Sw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742208; x=1786347008;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQvPB6jYC+U9y7/R1Rdle/evzG9UICK1eR/7QT1ydDg=;
        b=CjNeIM5o0dGi2K7Sjw+u8vbmo44fnr3mRKQ8QRjxLNvXIG8xUP4EuDDMNrmZk8uryu
         B1Y/2pZIOfgbzptHp9wcU3mU5un2ScFcndKAZoNxbgCj8BfL/qCf++EeJNTsK00zIL+/
         m/bg0dlCmTPGztvV3AN+STwDrOljDmhUCm+AW4IZQqZfnJjBHJ/XyY+KH4702t7+Hpci
         McB9yOystZcIC9/LcxaynnRhNvha0GeBKRDb6tYXOyFQt8oozXYzX2MK3z4AXbWQ/ZE+
         4u6vfo7aR/NI8MefyaPkWaJsnrH0IYNR/wqDFQDKhx6cnrvRi5ezsN1oDU86jnbbAjrj
         q8RQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBii9MYB45lgTHXqGEmcZSncvPVFdSaNYo7v4UEZczdHvwBT+KwRMU1SQONZwBmi4TFPlx2T7F1cniA4aLNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnqr2Q43PkX5UNtRFJfJG4lz9H0DaQTu4huf01uDuhRbCHYWgm
	YAC90gh7W+AQzJbIZ8pwqov+J36TuBpdQuFypbL1nImVPdifgGZBfpSYdB8hS/Hajk5cwXH5SmF
	Gouw0gmqG8OLT/J6heQ==
X-Received: from wruz5.prod.google.com ([2002:a5d:6405:0:b0:47a:f6a1:70d2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:640d:0:b0:47f:9568:ebf0 with SMTP id ffacd0b85a97d-47fd72a904emr17895903f8f.23.1785742207772;
 Mon, 03 Aug 2026 00:30:07 -0700 (PDT)
Date: Mon, 03 Aug 2026 07:29:54 +0000
In-Reply-To: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=10826; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=wsBlPPFoPxaCiPxaYA/jzfhWKDKs0lL+T/BXOyyCY2Y=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqcEN4PJJXzvvRdmhB1u/dQ1F2sX27IAKExNTuY
 1ZucVUyniuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCanBDeAAKCRAEWL7uWMY5
 RoGHD/9U26Z4XszYOQyjNAxBMiZGN43z/4tn4mx/mwECyvNVbLYMtiXr1AyeBK9un3CJm36Jy9p
 qirHf4a6Rd2qf1JTGx3gCOeEjvAQklhgh0DW+slvaNHn5b5gDgBQB3O40G9XcO2ZzBkcj60Tuwu
 oqiQS3HtDvbEt3d38aXhCG8FCN6mhgbWfw4/Imhx3JgilWaczsCQy9mm9VEfkzFxTAyRWeGY1Kd
 bIJDjdvHJtZXEV1/tituyNnYXNfwkYQvhgWTO+fGGlZ0MpVPIfovDx3y80ch2D+CthywSVbTvLn
 L233mii3ap9pR8MeGV9oSxe3P8vBU3Xh6Spdk9/NzWBRFekxuHXKa+MvtaDJGoNr7t20hUZI9Sz
 xR45D/70pVO2a9SnmeZEpu+xpvlMyQAi5ZOCfAoWcThqfWeaS8fvrEeRVtKds/mpTIlX1gbNb/l
 /RTkCKaq0JiO5jjGdXuE3MExNNG9x0OowywHg/FEXSAswlhUKcMp9UH4ae9/5vM8JSqjypprWvL
 tQs3xnHSJsN8WnStHBrKw+i217TpXsZvX+16u63yOC5Nf8M4tr0/jrIBPS3G+Gj75lrwUxiiv2+
 y67qImQoHXGJBOTCRk9i0Rc4Ua5ONBB6g0w8aRw1pdvorJCn8OAprYojjAKOjlx1XuvKgU7wAtJ ohtsau45Ceu8F2A==
X-Mailer: b4 0.14.3
Message-ID: <20260803-pr-ratelimited-v5-3-a77d456de974@google.com>
Subject: [PATCH v5 3/5] rust: add pr_*_ratelimit! macros for printing
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
index 000000000000..5f0deae819dd
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
2.55.0.508.g3f0d502094-goog

