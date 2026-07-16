Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C980D41F370
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205293; cv=none; b=UGqKNiKHKIl0WXOQlxMeADLiS0fWnnu9gZymIoCTwiC53G5Z5w03ZMVKn51Nb/3jro+DhPl1JIbVbiRFIQJK0LY6Rwtb76MrPoVrmoWRJDpQkNySYueKuZijFRsDCP7YHJvD1LbE9+271BbCUMR4Jpw4QF/ErgOfstEMKiINdcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205293; c=relaxed/simple;
	bh=VJEn9k0cad7bQSpM4TtNmV26i5N7k4ratpVcrf9ivaI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SdgyQ+pW4fsXhGv18uM6kyzeBqlaOkdcFx3dBK9ymUo/KvcE/ZEzY7Gn/eFnQYTjX57q/tq9HlwWQZvzFyruUHngJ9X3hc1c3Y1edIKBcWWnMRi5siWrb3sp7S6DxV2edmglDoxC/79uqLZ2Got7fOz45eVcIKpxDWxv9PIBALQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LJDz1sVZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LJDz1sVZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493c47a09b5so34749305e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784205288; x=1784810088; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbRCBYBDraMwLArP9KmBXsMFVhgFXmfSbkHCccVZDpg=;
        b=LJDz1sVZ0SH+UArK9XAuJIORf8v10C6aqIAfPuKK5ETcIZaw0Jt10K0z1TrfV6GE1k
         i0NmAYKuVnOJTHKk9RuH5zhYy0kZLt2w7bmFT2vvLzBLc4PnQel3eafP3iaz8KcaZXw7
         9oM7Rfo6CXafb4pn8R1Jhq3h+2vY39XRgScsKIItEOVgJMBQZ2DriOK3QITM2Nh1iPyI
         uKm6dmHa9Kk8pRS0L5QBpeyrrPVQsLbOOgmda2kUDRiwKTvPNVvEyFpFijWfeuKTIFKg
         4fuQQk0O+i+9peaGApw32SHdBKGV2ZjTY7GXjRBiECJIiLLhW1mWY4SjSxzjwbPXd956
         NWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205288; x=1784810088;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbRCBYBDraMwLArP9KmBXsMFVhgFXmfSbkHCccVZDpg=;
        b=cWFOyjP+B8rDXZZ4cMFWqRyIxszZEOduXRcAq3rc4PrNZ25pzJlLTOemx9PuyFeRJB
         lnD4DkqQ36gFqY0nsDFusYyfpCV2BTgL8WKKS4xy0CunrXX/u8zhtfvCvqCPtbhtz5Ga
         fwGGYuZArCmOIpTV4adsVjASsaONLgp1l/Pv6Ut/ehsr1Z1QxQ585r+04j+dFVOYBY4M
         83m1zCdo7Hb6eQurEUOofEYIv9iLx6vDO6wDsQ1Wy5CfQLHywqhwplStMJgkC/h1xMgF
         NJUfKW3dEW2Lxd8bWgjqAph8Mpalh/9qY0tq9o8T8BT3yxCHk/YmlLQpWKooUkZZg81E
         9Ftg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1RyJ/pzzYx1U8X/H++v5O5llFG4/k59WO4uvQhpNwmU5u7oLpW8W6BnRW5ZzS9nMXeEsBTbrH2gJAvuClRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr31XTJpPaXpCjlWNBiIVcEJ3N5zYYsZyN7Pl3sTt86yQZ9/ij
	2pCs/Nc7Dxy3VKb0xput53Ym9hFFWlXp4lvhZ7ZTljDSjq41eIqwwjL0KTnHvBpVZNPB5pEjZ2r
	wKp9c5mL4r7gUj7BERg==
X-Received: from wmbdx5.prod.google.com ([2002:a05:600c:63c5:b0:490:b475:af08])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c7:b0:495:4044:11ff with SMTP id 5b1f17b1804b1-49540441383mr48255335e9.33.1784205286967;
 Thu, 16 Jul 2026 05:34:46 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:34:26 +0000
In-Reply-To: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260716-pr-ratelimited-v2-0-31c27a4543d2@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5073; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VJEn9k0cad7bQSpM4TtNmV26i5N7k4ratpVcrf9ivaI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqWM/iXLyOlWEYBfW4/1jjGVlHKoI7/XEjhkDVl
 pFtZFTmD4mJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaljP4gAKCRAEWL7uWMY5
 Rl/JD/0VY9TlA5qNLV1iYoacv02nsZWTv+SRIGzqm+s+kzR1RWkOUFiwO48mdy5gYwICCDi8Ua6
 3zbMg0DACh2HBmP31heQZVxYDh5J4vGlVAq7WgbAU49R+s8DB49I+5L0tp63L3d/wz9DHo3wDZ+
 NsljI8JucpvHqjlkLbTqr5KysMBPFCi44/Y0op9cbU1ogIHoQD51dWmxXlL5YSJfXSUw3NQ9YJ4
 k3ySpgq5NpK2Ru04XFNJXLSAag71s/V+s/JxVdo5jCbNrvwERwk3Mpq8nlM8dgEPrU9eNebvzo5
 IGOQwkVryFbf3t6YubT07O3g7Bl457wY4Hrcv24Rt7GmoFGdG98FjO3dBuXoGDt6nceZmLOp0Wx
 6wI5Uo2aZspYilqJerMB4js7Y5OSkNiLyX1eMEzjJG5ad+67vreeuos/AePEum8jVTgm+CotRh5
 gprJWjbl9vk+w0AnRWFo6enPPXNvvMF44HzjdaqFbavk8Chlrk0djdBqVJ5/L7qOelm0+DzqdMX
 KatK37qHPxXgyGeFol59RWiIu3Q7P0oj2z+nANhPeC6a2VjyekKrGRg4sizxabqOINjOgR/wfh6
 hBbaBKEDwOg7Et82naXVvI0fWpfFI1ickbaLpnIWvYOsnDkHv6Iw6hc29UsZslBqJ2/rgvID1N3 436izqQBoQSIZgA==
X-Mailer: b4 0.14.3
Message-ID: <20260716-pr-ratelimited-v2-2-31c27a4543d2@google.com>
Subject: [PATCH v2 2/5] rust: sync: add const constructor for raw_spinlock_t
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

