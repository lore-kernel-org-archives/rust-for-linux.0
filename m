Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBAF3E2ABA
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 09:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231187; cv=none; b=Nbxgx/nGWkZW14s4w3JGZope7VHb2qIBkWxB6hJwqKxIo8ARwr7NLmOaV7I2RLAoN2ZPD5LUsemifKJaMrxdjCxl74eDGDNwMfYejWJ3ljslVfyYifsO4TCZtJISUnE+4ciLOEkhLEO8V0ldZ4Lo7EV9Yri5bnwmE/DgQyVSAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231187; c=relaxed/simple;
	bh=yYTW/YCtTG64KJXIcF+6Rt2z9XEGwhz+AhjLcJ6qvVA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NNZiZMzxZ1X3liAu8MgAXVXrigM/R6g2fvPnCugkTRE/FEIxo2PmJRBUeuwk3ubt9elKsQ8SaMJO3MJaqOYuEoSq5+uMBc3dZ8KatOK5hd3ZByegJNUSjawpIg1zfrcsJ7iEwyhlv4REahTaF/oxrt4CZL0S+r9sW4kEDcd26y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LxBpzt9s; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LxBpzt9s"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-472a798fc7cso2771540f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 02:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785231184; x=1785835984; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Akaj1G20N+GUpw+fJ1iolQ/M0zigZeHSHuU4UIVEr9w=;
        b=LxBpzt9s3Kp2O50hv367ToZjhhK6FA+RZuJKB/crKOzAGvbZOBAm5hfwGFkhXWgA0q
         xJ1ygcRnexsk3IQNOquWJQYeowUF6KHemzv/iMxdyg39+mfN3aKSln01JUUxkTikevKQ
         /P4SrCaTCpMrdPWoc+JTKhKAY5fdTBIf1awbxdrYZnPoK7Vdwb/H496a2TkzzdMC8mjM
         1CTruk5khUyFpXMFP/VvYhbfM4g7GflnImrm/Xt/TVoXveIjmOIydRYwW+DvY+oouu2x
         fiw0f9ZqlrXR+vg9kveD4cgrEamaU/XWYo2MX57wgE9ca6yy7nx0yez2jDpql2xTvEM/
         Gqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231184; x=1785835984;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Akaj1G20N+GUpw+fJ1iolQ/M0zigZeHSHuU4UIVEr9w=;
        b=POcBwVEL2RD/ceyDHzWyfMLem8YmQaRWTn7GzFUbxu8QiRFIPc6oY4KlIYNkAvKb1Z
         MGy1u0YlGy6WsER+eKCMfsnCyPggwvn1HwCXzTFtO6EQBmNz4z1JSX9P+Fr2UADs5SMp
         l6eh/aBBXAx4ENRLRAbxZYzWhZrCKgK/LCUkuL53s2ee1spCeEEHTpJ/98DOeSFZTck4
         pn9GmdXuJf7dwZgFbRzdqBG1KVnuSGxpbmBh9kZ6ZQiK2d9O8gbpo7Wn3BhGL1EkyN8H
         vktl4GkE9pUQIZPG1mEEwQf0UUyB0lisJL3mzMKNdf3mhvTggQ5cTOpUDxn8KgnS0CPk
         SUnA==
X-Forwarded-Encrypted: i=1; AHgh+RpultlorIFfNCd+crnHyFlCVjXX0AGlbmamkM5VjMr62MvqVTlVT5qBv/3qyzUfn/t396/2UxDSNcfZn5c/yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwldV6u9pGrGSdDqtrrELN5gCozMKnOdmmKmjqDfY+TLUz6YRfs
	4LIn5daveoPkynzUl9m6UT2LMcIC0qjPFVIOnYcXNmvhxc+ChGvB5BwjA6fUCTHjSXe4nNb8kB2
	dZuQcosDD2xXHUmqVfA==
X-Received: from wmqg6.prod.google.com ([2002:a05:600c:4ec6:b0:495:72a8:661f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f85:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-496c654f6c3mr17844295e9.13.1785231183690;
 Tue, 28 Jul 2026 02:33:03 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:32:52 +0000
In-Reply-To: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5073; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=yYTW/YCtTG64KJXIcF+6Rt2z9XEGwhz+AhjLcJ6qvVA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqaHdKyXNntk4iT+d57GlkOywrAfiVcdw3usEf0
 mjbLd0DDI6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCamh3SgAKCRAEWL7uWMY5
 RnttEACcle0Biy4shf9A3m2L8hNLZKeN8cv9meAm5wavtoPHWgRKWK0Y+06mLoduzFfygUbdBmo
 HnlkwoOX/u6R1UgMRXDpoT9303Vo7L0QkynISbSvUuWy3x7k9acUaTilUp67y5fE9T4YjKT8Hlw
 f7+AEGUid3gcJjqPR6utmi4cwPGOayovZmSDGHGGuJ48MYr6YCTafHVAbHSrt9r/9hV0pUNoAin
 2sUXIPAJRpy1VBnaY1vb+mUu/aZekNY2/6yePWvnQ52pXV4wFAzSlwKTxR9j3Z8iXplQ0OIxC/7
 yYnrnw4bX+qVWN+a9eh02tgDiP43iF1yD5M3p7FgP0BbSJ/wuCUZzDw8rdqrTDBiIiwdLiBoQ9B
 JFFUrFr5qXeKdQxqQlkMCQ30vY3+SEtTmMokXBbioCQx1BNEAJQP6lM5mTLC6BTc8MlPj8oSZe3
 SO/4XmIE8XuZmLBfnx6jiHBfn2pfixE13WmcllihY99WNbfoJX7J7xT7Pu91fnSkLnUk3DBEr20
 bbonO24AE3Y9Q1SCphB9UlZb0Hajp/mVC30iAC9FDEWZ8kQ9hrrjWG+SH4u11B7KZKY18BMdBic
 w/NbgUt5V/w7avmYGeeCg7OBicJzASGfHzqTY2RApgxqwnCzlV8QjyRXSWG/yZA1pssuAmz123j SNKeFTqQcBDhGPg==
X-Mailer: b4 0.14.3
Message-ID: <20260728-pr-ratelimited-v4-2-435f8d6e9605@google.com>
Subject: [PATCH v4 2/5] rust: sync: add const constructor for raw_spinlock_t
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

Reviewed-by: Boqun Feng <boqun@kernel.org>
Reviewed-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 include/linux/spinlock_types_raw.h |  4 ++++
 rust/bindings/lib.rs               | 24 ++++++++++++++++++++++++
 rust/kernel/sync/lock/spinlock.rs  | 31 +++++++++++++++++++++++++++++++
 rust/kernel/sync/lockdep.rs        | 22 ++++++++++++++++++++++
 4 files changed, 81 insertions(+)

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
index 812f8e5a08d5..bb35e64957cd 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -81,3 +81,27 @@ mod bindings_helper {
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
index ef76fa07ca3a..697efa7e04c6 100644
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
@@ -144,3 +146,32 @@ unsafe fn assert_is_held(ptr: *mut Self::State) {
         unsafe { bindings::spin_assert_is_held(ptr) }
     }
 }
+
+/// Helper for creating a raw unlocked `bindings::raw_spinlock_t`.
+///
+/// For use in statics containing raw spinlocks.
+#[doc(alias("__SPIN_LOCK_UNLOCKED", "DEFINE_SPINLOCK"))]
+#[expect(dead_code)]
+pub(crate) const fn raw_spin_lock_unlocked(name: &'static CStr) -> bindings::raw_spinlock_t {
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
index 784821cc2a39..d9222be0fb29 100644
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
+#[cfg(CONFIG_DEBUG_LOCK_ALLOC)]
+pub(crate) const fn raw_lockdep_map(
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
2.55.0.229.g6434b31f56-goog

