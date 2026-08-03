Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10A3A9605
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 07:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742211; cv=none; b=CrHlvK9SVbZRcjLh4Ef00Dua5SKM3KjeMLbU/Wh3WPLryj1vtw2QSvBpmLcdRl5Wz/Qb5Q9d5dLQHEUy6SdEhwExqvYE1CJJSanx9EBRaDgeuEqjjOgFrN40lgJDyyXE6xTVqVkjCJ3kTqZuzADVey0+5LbRJKsuWMjWc2gauUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742211; c=relaxed/simple;
	bh=/YSWTZGXJkQntouN56tM4ixvsFNBxXhnHTqTdRkBQRo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o3H9ZeL+Ac3hsKBubcSn9iBGRp3tzfuoXifui89fjuxQ5H4w4tK8EcxnAkcCKYiBTFnvOo12gp0LYlcE49tRajwYBwxLxtQP+IrN9KHdBWQy/zkkXLD4xTTe1QUB9AUEyTwPb0/0IC2g5mqRKmh7gU8RX7H34+Z0nINxnDgb50A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PGmglckf; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PGmglckf"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49554715277so16637595e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 00:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785742206; x=1786347006; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bkaEES2jtN2KJns/0+l19TJj6puYgWk/U6tLYEyDvi0=;
        b=PGmglckfxttpAPWRyGumHrwmpeSeXnZeFjRVkeHnXPG2kDQb8zI2awOrv1if/vKsFP
         I5I3g6yCwEJ0dvHNwWutdZmisHLio5ACpkm/bdGVnb0csADTOXjG8QHsLZaDBiK5bjN+
         wZk0qT3fvIPel6AJn6LE8Lxp3XX7LqpNzA+jsdDm0Q08sFIJsQK3nwt+p+JVx9aaR91i
         IYelkx5xE1Bkf5gRq+jq9WhWHYX2FBswDPqODGTR+Vw8VZR7RS5L8YuVoj+/vArx6ju4
         WdUM1wY+uuxy3aPPY8899JuZ0IOBvKGv0y4lxl6IoqhiT8131S+iJAMewalVSqQOnF/d
         FWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742206; x=1786347006;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkaEES2jtN2KJns/0+l19TJj6puYgWk/U6tLYEyDvi0=;
        b=SXqmmEhJDFNas3HfCc0DoYEEEM1wZdDjSSnMVJ/MyyQ7m+wKStcQHy1cUmDak0CZX7
         agNGPEx07CbdllRi4LmLBQ0XOekKmkKf+Wo/j9t9IrlpwWgQqcA14yBPT5Iqo4eNHA5r
         pZV2kqU+a39XKsVLvq5exrk3uAoLHrqihZTupL0vAVmPqcNLpckDJ+UK0JbRp3gYqt15
         IoV3ApynJlrTWawD0xO+usocxbb5NfaPXvE8uPRbzLZCss7gGmFl2JQvNB+AikR3stXH
         Zc2salYICVHzraRrM8AUSuFNcG3cWUrhCpBmeCTjDizMpxeq2BKTphAmAYq1JWZgsmv9
         wnfA==
X-Forwarded-Encrypted: i=1; AHgh+RpWSL503xvjkAbrFptGcxMI1+8Jb2rNsVHWDhB0mP/usQilHKRyrOPu3CF73KVkNdWxZQgUrzobI2lfl8a5vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWpldA4rNbjGIz8jkAXlswckLlhi+PiSwXaB/rsZNBY1LrrL/0
	5aozi4tH+CcM51jD4VH25msfixqqf/AGBpqY+SDN+ie12sihuOzzhVWccmQ/EPW2RfntwCmQ1RB
	rfTAkH3tRubSG5wS8ow==
X-Received: from wmqa8.prod.google.com ([2002:a05:600c:3488:b0:493:b6e1:bb31])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8492:b0:496:c1f3:e8fb with SMTP id 5b1f17b1804b1-4980c64acc6mr139337445e9.8.1785742206114;
 Mon, 03 Aug 2026 00:30:06 -0700 (PDT)
Date: Mon, 03 Aug 2026 07:29:53 +0000
In-Reply-To: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5116; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=/YSWTZGXJkQntouN56tM4ixvsFNBxXhnHTqTdRkBQRo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqcEN4Ve4blYo1pZZEDpCXE1zwMBVY9riO9gCIX
 MBdPlkzJDeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCanBDeAAKCRAEWL7uWMY5
 RoKnD/9U0B3iya3glyqJsSO325Q0tbvKYl8k4XowSGvRnGGZqZ0HjfCiQjNxObD5s49DP0Q1Qeh
 DMILqykvsmmlwuu5SLEBOJy/abin4f2jqiXI8sMvf5CpERZJDnSbqD+OtJwL3l5zb5R2/Nsjg27
 lrCuqtDc8R84YiYZfp7Wz+HU98G/o6SrO8MPWQkvBXtEy+Aj+N/iufIROvGzY41GL2meqPE/3HW
 5N3bm62EAEZN7j2FbQRqdjvCp+V6i5NlnzY6jB4ZecicUXH06RQr2iCr3LUAwXqzWxk7ISN7li1
 6Txd3zf+93KkoXI1CfdwcpiD+CfkrNle5gjgrIA1/RQDtSCend7n/OGrSaxBnVSGpvsN7bfiUjm
 jMPrjzIkRAoyV89V4lUcgn1ts3r1QYS1zxC1Zk6IYGt218SC92xZGP1OkVAF4xckIDU/ycdczVP
 fwTFG6fUd+f0CMKxQS8tRxJzb+Dkn2nSm51oeIPeg6Ja+lBnImZCOufohxlGQ51wdOT0jngj8UI
 PM2BN2XzbNJuLrpCJ+r6isy7pWnPQxeIghbhJZQmotzmE2sRhu6ZNWtqszakEjKhPbuxj5t88QI
 Wsueu/q+85pz2YM2+diArB7969eBIExDp54yfbAN8FhfPlGjkNOQEL+LJoO6lEUCk578ex9z8+J paur039SITrl1YA==
X-Mailer: b4 0.14.3
Message-ID: <20260803-pr-ratelimited-v5-2-a77d456de974@google.com>
Subject: [PATCH v5 2/5] rust: sync: add const constructor for raw_spinlock_t
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
Acked-by: Miguel Ojeda <ojeda@kernel.org>
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
2.55.0.508.g3f0d502094-goog

