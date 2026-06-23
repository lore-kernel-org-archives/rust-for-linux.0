Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68972EBDFA
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 15:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229096; cv=none; b=h88/y/rRc6z7bdvNTYYvV7AjUoJ/7sQABmKshy2EY5TyRpWuBgYVJNCocBUnjyRGydKk0PJS/fSX/0PNPAqTx4+cUYlc0A6AD2PVpR0t+im9sXSE3sXhhhoTz9OQybEGrIUVrtbT0DInnMnfdJUkMU/U3H3ohdTPbkfOzZlvmmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229096; c=relaxed/simple;
	bh=0YsI02N6fj8tUdtPl/piIvar7asdlAk25mgHlV4sDoM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qjy20AsjYMpfgkXlVCM8dphuNfbMu7LpBXihWOQCq4dOCvT3oEoVzmCs6oDzIhtUjJcdRKR4H7LvesEW+W96mgctAWOPhJv1pXz+lGoAlFfRy5slHRCGHbA0zM+O4zjnuuGfhRka+Sr+bYvPPXMtQZD5+BO2gcZm7XUgaT9+vAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rTL3ym8S; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rTL3ym8S"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-697d4710e7bso2128701a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782229093; x=1782833893; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dCrcmpF50o4mXaFGSqBg47rQjQe+iFTVliLzF4khG0k=;
        b=rTL3ym8S9xcY2m420trFckhsvwlUylKNTzFWBRuNzas+TUl4mhA+YYnsRFw0ZPg/GW
         oQO8D4cs9QyZZ6Wt/ju+TPhLWHfLFzeG5lKUU5WS3TmrHubSLfSEKbkxTp+gDya3bY8k
         WnLjE8uwWAfg8BBcE2UixQlT5SQqeGQd+T8P4xfZPrPaV7YaXm41u63NJQ5STfjblatp
         CNTgWbIPIcKa2AnN8vz4+YdMXiUCy7SafcnX8YRQuTV9vFdapGbBM3lMZpHBRfXnS/r3
         5YwkHhsLkSd4QJUzcmjg5fiIe8la2KK1m0vBtBlUrA011UG90XcmClWFXtYDSyM4EWYs
         BhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229093; x=1782833893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCrcmpF50o4mXaFGSqBg47rQjQe+iFTVliLzF4khG0k=;
        b=RmtRmTFb+ASaMOy2zgbYLtDVx3B8xMt70B0gbMn5TV0TQRfbBuonzOlaj4N3fL+Eqy
         yZMeusENHbHvk/WODVrfBiUAxfH0UH7ZRoHINUdM6s8nQ+2RmreVhSpiD01omGDLGrjC
         1K5NFL0SCx/YW6vC9MdzMutDl9tIswSnNScqWeskxRFIQqKbim8hI/x7iAEQEsJd2a1C
         f+nQFJdg8yQ6/RtiZcfSuc9c9YkbJwDu7BfgJWTwXkkhnJRMbdSnt61KRNXxUE6/9bxf
         7MFkwdE+gblYHOBPeuZ2a865xCHPuIeZ65rc2jxnShI3oDvIL2dZQ7BnBQL7ZbNkM8kw
         fcBw==
X-Forwarded-Encrypted: i=1; AFNElJ/G1pBkr46XcepwAEDoRMBLNSJIwsIWDz9rbLn4x8EYCC7L6mim6gbLr4AgkimlPjpDmpX+WcejNJlHrnWmag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlMtfx3jsWCC+zlC0wyArF2SQcPYwdzM/OCef84aOAMp2bpm1X
	kRbN8cGzTD6MTszFGYV8BjTdPPFEJfuTONFNupy68F+URr6CV/9bVOkqWzqeEXw97+uBZi+AcBz
	UspMGIXoVbICqZCsJmA==
X-Received: from edff9.prod.google.com ([2002:a05:6402:1e89:b0:696:1b2:b2ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:278e:b0:697:8f08:6ffe with SMTP id 4fb4d7f45d1cf-6978f0870bdmr6272340a12.24.1782229093089;
 Tue, 23 Jun 2026 08:38:13 -0700 (PDT)
Date: Tue, 23 Jun 2026 15:38:05 +0000
In-Reply-To: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4876; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=0YsI02N6fj8tUdtPl/piIvar7asdlAk25mgHlV4sDoM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqOqhgAbklDLYK/h2bghoFoOd6qe90ZSdmk0jjK
 pteoARh4rqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCajqoYAAKCRAEWL7uWMY5
 RuxND/9cHPKL9A2q68w2UGYKhFivmmZJCRT3+BJ1tB4Fs9Dyjs1SAXB2W+eLx5xprgvOCHMydLb
 htJB2or77KTzRPAY7WLz8p9NeZRTbJ25wLKA7Q6mDKk8grOb/Ey/7vievNmOtjKwItHJPOPVwzu
 Q3zfOYrsz/Cf8pzoCyWcEVdhcrGpyWxjthQCkyImcw8q/gyAYYH+x9TcKEkfNsYS9gOnQMCITZy
 pWWN8rcyc2zzmrRz0s6r1jFT2prkzjyaTnY6vspBQVnx516tLptlkBDuTeRmdsRvcCDNQLDr0Oi
 k1N5p9xSqNOU7GLMXEjHbU8x70JzOBs/a97E0B1Ag81Mt+5H8dnrak+Q1Iiy6WyWWm7nj85fRA6
 M1BtjNOnCRaQz5ci+E7xGGuKWenH3AC2z+XMlRLA+FTexYLAxsovcLfKpbrnNJJ5EzXHyCWO5y4
 zS9PtZxi2Ee6XQbxqi8+uf81AzlzI8iUhHFGl27lrbYPLU4XZQzNslq6JbFF44fBBjswFbJNPH2
 /wcE6A7eIhG3sapN0uoH88RKA3NtP6f7e9PSWAZawvc7TtPkSQWj3ScCPpJ/B7xU6JH5X9dbt4b
 sPZN4kvsl8anZshD5NFnyGvTgMp0NpCxRMLOYbc/OKkav8yaId3k5O9+l7F4xupj4DXH7aH1cFO 3cFrvqvX+qHmyEQ==
X-Mailer: b4 0.14.3
Message-ID: <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com>
Subject: [PATCH 2/5] rust: sync: add const constructor for raw_spinlock_t
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

The abstractions for pr_*_ratelimited! need to construct a global
`struct ratelimit_state`, which contains a `raw_spinlock_t` field. Thus,
add a const constructor for the `raw_spinlock_t` type.

The SPINLOCK_OWNER_INIT constant isn't mirrored via a const helper
because bindgen generates a 'static mut' instead of a constant from the
pointer constant.,

The __ARCH_SPIN_LOCK_UNLOCKED constant cannot be translated by bindgen
because it's a define for a struct without type annotations, so it's
explicitly declared in Rust.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/spinlock_types_raw.h |  4 ++++
 rust/bindings/lib.rs               | 24 ++++++++++++++++++++++++
 rust/kernel/sync/lock/spinlock.rs  | 29 +++++++++++++++++++++++++++++
 rust/kernel/sync/lockdep.rs        | 22 ++++++++++++++++++++++
 4 files changed, 79 insertions(+)

diff --git a/include/linux/spinlock_types_raw.h b/include/linux/spinlock_types_raw.h
index e5644ab2161f..942c229c90bb 100644
--- a/include/linux/spinlock_types_raw.h
+++ b/include/linux/spinlock_types_raw.h
@@ -11,6 +11,10 @@
 
 #include <linux/lockdep_types.h>
 
+/*
+ * Keep in sync with rust/kernel/sync/lock/spinlock.rs
+ */
+
 context_lock_struct(raw_spinlock) {
 	arch_spinlock_t raw_lock;
 #ifdef CONFIG_DEBUG_SPINLOCK
diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 854e7c471434..adde41e41edc 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -77,3 +77,27 @@ mod bindings_helper {
         None
     }
 };
+
+// Explicitly list architectures where this logic is checked correct.
+#[cfg(any(
+    CONFIG_ARM,
+    CONFIG_ARM64,
+    CONFIG_LOONGARCH,
+    CONFIG_PPC,
+    CONFIG_RISCV,
+    CONFIG_S390,
+    CONFIG_X86,
+))]
+pub const __ARCH_SPIN_LOCK_UNLOCKED: arch_spinlock_t = {
+    // SAFETY: The `arch_spinlock_t` type can be zeroed.
+    #[allow(unused_mut)]
+    let mut lock: arch_spinlock_t = unsafe { core::mem::zeroed() };
+
+    #[cfg(not(CONFIG_SMP))]
+    #[cfg(CONFIG_DEBUG_SPINLOCK)]
+    {
+        lock.slock = 1;
+    }
+
+    lock
+};
diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
index ef76fa07ca3a..8babfb79098f 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -4,6 +4,8 @@
 //!
 //! This module allows Rust code to use the kernel's `spinlock_t`.
 
+use kernel::prelude::*;
+
 /// Creates a [`SpinLock`] initialiser with the given name and a newly-created lock class.
 ///
 /// It uses the name if one is given, otherwise it generates one based on the file name and line
@@ -144,3 +146,30 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
         unsafe { bindings::spin_assert_is_held(ptr) }
     }
 }
+
+/// Helper for creating a raw unlocked `bindings::raw_spinlock_t`.
+///
+/// For use in statics containing raw spinlocks.
+pub const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings::raw_spinlock_t {
+    // Silence unused variable warnings.
+    #[cfg(not(CONFIG_DEBUG_LOCK_ALLOC))]
+    let _ = name;
+
+    bindings::raw_spinlock_t {
+        raw_lock: bindings::__ARCH_SPIN_LOCK_UNLOCKED,
+
+        #[cfg(CONFIG_DEBUG_SPINLOCK)]
+        magic: bindings::SPINLOCK_MAGIC,
+        #[cfg(CONFIG_DEBUG_SPINLOCK)]
+        owner_cpu: u32::MAX,
+        #[cfg(CONFIG_DEBUG_SPINLOCK)]
+        owner: usize::MAX as *mut c_void,
+
+        #[cfg(CONFIG_DEBUG_LOCK_ALLOC)]
+        dep_map: kernel::sync::lockdep::raw_lockdep_map(
+            name,
+            kernel::sync::lockdep::LD_WAIT_SPIN,
+            kernel::sync::lockdep::LD_WAIT_INV,
+        ),
+    }
+}
diff --git a/rust/kernel/sync/lockdep.rs b/rust/kernel/sync/lockdep.rs
index 784821cc2a39..c0f8b196c084 100644
--- a/rust/kernel/sync/lockdep.rs
+++ b/rust/kernel/sync/lockdep.rs
@@ -137,3 +137,25 @@ macro_rules! optional_name {
         $crate::c_str!($name)
     };
 }
+
+/// Not checked, catch all.
+pub const LD_WAIT_INV: u8 = bindings::lockdep_wait_type_LD_WAIT_INV as u8;
+/// Spin loops, `raw_spinlock_t` etc
+pub const LD_WAIT_SPIN: u8 = bindings::lockdep_wait_type_LD_WAIT_SPIN as u8;
+
+/// Helper for declaring a raw `struct lockdep_map` for locks in statics.
+///
+/// It's up to the caller to use the returned `struct lockdep_map` correctly.
+#[cfg(CONFIG_LOCKDEP)]
+pub const fn raw_lockdep_map(
+    name: &'static CStr,
+    wait_type_inner: u8,
+    wait_type_outer: u8,
+) -> bindings::lockdep_map {
+    // SAFETY: All zeros is valid for this type.
+    let mut map: bindings::lockdep_map = unsafe { core::mem::zeroed() };
+    map.name = kernel::str::as_char_ptr_in_const_context(name);
+    map.wait_type_inner = wait_type_inner;
+    map.wait_type_outer = wait_type_outer;
+    map
+}

-- 
2.55.0.rc0.799.gd6f94ed593-goog

