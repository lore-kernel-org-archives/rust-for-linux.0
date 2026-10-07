Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFBA4B338A
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383434; cv=none; b=hRHmWIpnqfhgY464Ux0AgQepP6yiwNNKRVg+fI5cJ6p+2wBsGOtHHWFE/kFZRpMuszCFiJAMrocae0tenqE8MdgeJH5d/eNb7OULEdIgMHsb7Gs3uuIQQjhmQG12UH0iUzz1m2uBb4wNHAz2+KUZf7WpSIo27nmVwN50QR2Nnqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383434; c=relaxed/simple;
	bh=VkcBvqhJgE5e7EfXX9M936ALkxN+JB7EdeqtMUM2+Wc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QMFRsDSPI4eTsMdKzRYW6FXYqUhHCxNj7pioS4hqLJbe1Xmf8or0bkvUJ7lBWMIknMIeG+gVqYSXe/MOF1XuzXGLAkAtooVZ8iZglSiqCrdjV2/eBO1/oVMR3DthUm5IcE0H57bpul4G0jEUysblCDbwBROTKHf+Y5cqzr2HkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BokSc/C6; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BokSc/C6"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6b5c5f44so63612025e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Oct 2026 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791383427; x=1791988227; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P4xl7iEeB8DBJtdIeM9BSRG6cgKYSvp/1se9UhiVhUY=;
        b=BokSc/C6F+cWgx9Wq6aC2qLhg5mmp7lcHuLacOp+WShnnnZu+7lWfD0M3/gKN+BQlL
         sJ8t63n262mQ3tOAaPvKpTjT+RAiMY3nYPpgv+XXBS6xiE4i3y7NrzW5N7xtd/QP2Zyz
         +aNlGnfB2mSiTprLSwyeBUMhhyVY3NVtohRjdrrUOlNcwvHQZZ3a4i/pfKaZqb3mqx5r
         Ud5RY4XIqGAQ8wJaN9xK8we/q1P9HV7xKZyM2aUhu22L6dhTX4xwl8LJFhUysyydM7ok
         52BtL94Ld5lwi83rMYyGOwnOEpQTuT2HK3hBqEH+QOTwG3aO1weR/r7RnqjvJKA0pA1C
         0FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383427; x=1791988227;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4xl7iEeB8DBJtdIeM9BSRG6cgKYSvp/1se9UhiVhUY=;
        b=16nFXQa80iFkd5t1/XoU8FTJ70Wl92n+KKqMmFjdcfRWBznVARNeuZWS9G/afaQK+Z
         qIyvQgGb0VGIwSV3GLt5HJw++8xo275lBpaxq8DniZV/j/ksHUrMfi9kDPo5bgb/+6nH
         DpTiA3zTbS4w1ZVZ1TQVnaF+SFGRZ/cZHKjWwrh2ZNAnU7G1AB0FVTJpAG8gPWR3ACkR
         McyaPt+MvYSmCMBc30b9057wWrNCs2mxB53m6zaPV9867C29KhVYy18RmdXvUvXwMzCd
         kpKuM0L34KXQMlRMXSCzVCrjPNThXULXIFWRWftaa8LiUG/h6knXAe1Z1A5j9Qr1HSKc
         Qn/Q==
X-Forwarded-Encrypted: i=1; AKwUvByBWSoIJusu2HdQ83N1xNf+UFxtY5l7GBZsc0ZV97GHAM21OVtkT6TkZjBTdhfOwj/rF78jL/2/QOhpFWLu/w==@vger.kernel.org
X-Gm-Message-State: AFuF++kwVpIdiItv1dT9Q15D6gi0JWyV9CGBT+FOV49F1GJpbN8ZMUOK
	0u3RTWyuyLQCJOA/+UW1cg+YSTZj/KHpVgLWvOq61pEIQYehfg/cvdQYx8hPVkhR2enfYKdgN/Z
	1NgpCNpmP4fMlxIQkow==
X-Received: from wmpd9.prod.google.com ([2002:a05:600c:4c09:b0:49f:e58b:90d5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ed0:b0:4a1:7f41:b9dc with SMTP id 5b1f17b1804b1-4a18043b80amr37747435e9.23.1791383420616;
 Wed, 07 Oct 2026 07:30:20 -0700 (PDT)
Date: Wed, 07 Oct 2026 14:30:02 +0000
In-Reply-To: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261007-pr-ratelimited-v6-0-f14accd4ea3b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4768; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VkcBvqhJgE5e7EfXX9M936ALkxN+JB7EdeqtMUM2+Wc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqxld3dOp4Fo7xkyij20cYVpygnr7onqbGPUxio
 vldZdNIzGeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCasZXdwAKCRAEWL7uWMY5
 Rhq2EACNflkGDxeRaozl2z6PB2rF0Xfd+Pn+Hl8SBmFTaUT7zsJ2sYu4eW3rh/Sb/9c64JwTAfI
 nnkyWRSuPBWeWIpICnYx2zAIhpLJhvDH7FFGRLvx4gGwpmp4bQFuz5BfCCnNPVgijYL2AlC0L4E
 UlPzEShyPyWXChTr8WqSZ39ovo7wMlVvL3pPjJN02DNvU6sLVg6CbPohFXqG5RFtXpyx7qwO8IJ
 PZHJxjAIyOQFvTFw2332OHHwqHx08Qjda5m6u78S0uBocbBsgX0EQ4yUjE2FLRQ0jZ5n5dt0igS
 KN1rPb3UTYUfQjD9NDUN8NFMi8fUU2jUJq4yT0uMDBeoYOQB8pFssjKeEJqqD2BRCwKY9U/FpYj
 GerAsoPDGXeBUwoY7SzzZay/WciQFb8QP8Y1vrlFutFPqr9LjLqRHzK4up8dXb85scsVL7cAKSk
 ZtbOieoRH8xK9sCxwu78r9vMsABXMn6pa58gRYuGcamlvXO4+GDJlzjQuBjjHI8kRRCr55wrjbq
 jOWbpFNpPfaiD4t9CafThjlT8q540TQ7IOwUR3UeL8gkzL8+XbF3wHTjOCpuEkChQfnyAF+9gaO
 AmSoRjmnmjYksJqGRPNeQXxeeJrBFTxuYc+IYn4X/N8EpcihQn/+V0b3IcD/GoEr5RJrcCqOFoS gTapXfc66kk7RFA==
X-Mailer: b4 0.14.3
Message-ID: <20261007-pr-ratelimited-v6-2-f14accd4ea3b@google.com>
Subject: [PATCH v6 2/4] rust: sync: add const constructor for raw_spinlock_t
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
 rust/bindings/lib.rs               | 25 +++++++++++++++++++++++++
 rust/kernel/sync/lock/spinlock.rs  | 29 +++++++++++++++++++++++++++++
 rust/kernel/sync/lockdep.rs        | 22 ++++++++++++++++++++++
 4 files changed, 80 insertions(+)

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
index 439ab88a5da1..076058e25ccf 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -83,3 +83,28 @@ mod bindings_helper {
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
+    CONFIG_UML_X86,
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
index aafc80125f59..037fa63ebcac 100644
--- a/rust/kernel/sync/lock/spinlock.rs
+++ b/rust/kernel/sync/lock/spinlock.rs
@@ -463,3 +463,32 @@ fn spinlock_irq_condvar() -> Result {
         Ok(())
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
2.56.0.rc1.315.gc6ed9934b7-goog

