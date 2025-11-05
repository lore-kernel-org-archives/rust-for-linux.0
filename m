Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD32F5319
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 23:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762383755; cv=none; b=HwOVg7K3PRLBcsWpfIC8rSgEyspvHn+JFuDotLYciLh8CPHfEjhIUgPwPckO0VSot5pEgAey0d4e+RofOvE7ZlGpLN5t1MXP9QV0wXQt3D4PJvqJcs/hXG/ONf3bFPV4bwZ8Rnl52rYrnkQKEJf2qqtr9XjuPpRFPcSYKF78cEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762383755; c=relaxed/simple;
	bh=mFg9QLMAwyqIxa/N6WNggn20WoF/wqWYILNGfUHwvYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYXnf9ELEq21oJm85y6LEJxcRZsC1I+655CMklsnsMoYV/oXwUq930ZV3oh6P+echCetRlsl96aJ7qpHKKpG+AjGp3ahOdjKPVDu0cFw2X1T4eO+PLDf6mEgp8ykdTLCnRfdW7+QVkYNCtYdBvOnzyvwuSBhVZS69O1GP0D7YcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTk6P1vu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTk6P1vu"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-295247a814bso4891915ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 15:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762383752; x=1762988552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFJ1wrPBcxrrD+LBS55P13yiT8NfiLst30CpnCOiPfc=;
        b=mTk6P1vuXWUriJvC0nFh8CdhlAZVDPPqTdYbH2LlHcacney1GY1wo8Xd8jRNRXs/Ax
         HXgnpc1hlIhzQaKLc0ZA9xv58WrtVAuQ3dc6QKO/BgZyDjGffNyj3pJasyOjImxNhWvn
         zNCqoGOxAh7nXH9AWsiJR1TCXN5qUJ3pbyc22BeK1b9HqkIij/jBwdkehDpQPTfks3bM
         REjsHLyddO0H98deZXbCAS6ownS4w1ZpE+5B+G9HucbfGVEjAzaanmLN5otPR+Y/DX5L
         BpGVmfPo44NGSmx7MBip1U70gR0A+8nUkmSNcjpHZeMYG/kAWMiXjm5c4WtT7viLdHnd
         MsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762383752; x=1762988552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFJ1wrPBcxrrD+LBS55P13yiT8NfiLst30CpnCOiPfc=;
        b=Thg+s+TC0Cd+2kNOpYD/+OAq4d8GPo7otQqkB877tiz5cQpx4Hj0sntZyGsWqZODiO
         YFywE27VKQHNit2RPZDFYcz+pVYHqd74UymAos/L6/K7eUlceB65gc7drpcX9/vRIyJL
         IphD3hkqEFITvdKgVX8KKwIB5gclAZehIoFwqXWilACGvNUOOQ6XJPnx9gYWp9MgQyKu
         +3fdSAM6y4LJeKGB7b37g+S2H/iIBgOJ9LMXqN6ZGE+zzxmLIA0lo3COaEfAjiGF/y1X
         JdB92JmLWLeBGcsXE2a2INcb5DgZ/93X9upw30xesYER1HI9IQ41AHKqSTKHCZx6IRkq
         0TJw==
X-Forwarded-Encrypted: i=1; AJvYcCVYpjx6mQgdRasH64HDzQdl+ogQOjzp5Y4jYvaBuB10pG0q+MqAXEUc4a3Rzc4I5wRKUfkfPdbFUGJQUZLvqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfETFHsFefTUfjeEdMPUCTJ8i2bdEetqQoRpYYDX/cYzGj5wEB
	nEdpRKuaColb2Sdn5YuMo+ZGWzhYvMGO9gXA8o2g1pmzQL/o1hJiELoc
X-Gm-Gg: ASbGncvFNltOweb2X2TN634Wd0hajdLqvK4sdu0hHz9MXGz8G3/bT/AzvihFoMoTL/I
	g6hG9tIRiDv7BD60JT4p1OqUTQYGSXwQr5ahKcCs2kR83p530X+XoKE0thNlTzPxDQURYeqjWLd
	+o6/ANNQCGh9Hu65TKFDzNXqqrOJB3biJ2R9kT+K0ohK5M9Y0Con+XgGZAFxfDbetn24xFwT2aw
	oy05VXaRr5icVANSQPT9AltoaKXa3mNAQ11+8eykQVDXF1LUpGdhgSGGCyt5GFl8LTVoZqDxtfB
	1rnLRowZFK149n215laWD+kWmWlC5/n4IVvPB18JhGiy9hkHbVJofDNHswLDlP0TrUvnux+h3LT
	RZltpiPr8z5hnVcWN8mK0fS+S83BeGoIqzYY4OoQQ+o1WnBrdrAy/l0/PytXPfhRzkwcHFbPrPb
	aRYABhQG53l0UwqjMuix49zlzI/lK0U+BOIQ==
X-Google-Smtp-Source: AGHT+IE1c9+ZrzqLcSGm3uQ2ejRBT2CJMVQlT9ke7gOJ6htC5411VVsiXKPhB80c9d8mxSq7gHQUCw==
X-Received: by 2002:a17:903:1b65:b0:294:e8a0:382b with SMTP id d9443c01a7336-2962ae57374mr72286265ad.54.1762383752237;
        Wed, 05 Nov 2025 15:02:32 -0800 (PST)
Received: from mitchelllevy.localdomain ([131.107.147.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096839asm6325645ad.13.2025.11.05.15.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:02:31 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Wed, 05 Nov 2025 15:01:17 -0800
Subject: [PATCH v4 5/9] rust: percpu: introduce a rust API for dynamic
 per-CPU variables
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-rust-percpu-v4-5-984b1470adcb@gmail.com>
References: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
In-Reply-To: <20251105-rust-percpu-v4-0-984b1470adcb@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762383744; l=9789;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=mFg9QLMAwyqIxa/N6WNggn20WoF/wqWYILNGfUHwvYw=;
 b=rC6LvrXQz84xbSb5BvGzEQo3PK2NO2XHoHUt+ISh2JaHvuW2RktvXy7YCgzUy8bvkJ1wqFQWO
 bxVWrfmsXOSBxGpV0RbAHoOa2jK6XivWxBpY5qWUYmJnPND48kmTwbK
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Dynamically allocated per-CPU variables are core to many of the
use-cases of per-CPU variables (e.g., ref counting). Add support for
them using the core `PerCpuPtr<T>` primitive, implementing the
`PerCpu<T>` trait.

Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/percpu.c         |  10 ++++
 rust/kernel/percpu.rs         |  30 ++++++++--
 rust/kernel/percpu/dynamic.rs | 130 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 166 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/percpu.c b/rust/helpers/percpu.c
index a091389f730f..35656333dfae 100644
--- a/rust/helpers/percpu.c
+++ b/rust/helpers/percpu.c
@@ -7,3 +7,13 @@ void __percpu *rust_helper_alloc_percpu(size_t sz, size_t align)
 	return __alloc_percpu(sz, align);
 }
 
+void *rust_helper_per_cpu_ptr(void __percpu *ptr, unsigned int cpu)
+{
+	return per_cpu_ptr(ptr, cpu);
+}
+
+void rust_helper_on_each_cpu(smp_call_func_t func, void *info, int wait)
+{
+	on_each_cpu(func, info, wait);
+}
+
diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
index 2fba9a165636..294b8ffc4f62 100644
--- a/rust/kernel/percpu.rs
+++ b/rust/kernel/percpu.rs
@@ -1,14 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 //! Per-CPU variables.
 //!
-//! See the [`crate::define_per_cpu!`] macro and the [`PerCpu<T>`] trait.
+//! See the [`crate::define_per_cpu!`] macro, the [`DynamicPerCpu`] type, and the [`PerCpu<T>`]
+//! trait.
 
 pub mod cpu_guard;
+mod dynamic;
 mod static_;
 
+#[doc(inline)]
+pub use dynamic::*;
 #[doc(inline)]
 pub use static_::*;
 
+use crate::cpu::CpuId;
 use crate::declare_extern_per_cpu;
 use crate::percpu::cpu_guard::CpuGuard;
 use crate::types::Opaque;
@@ -123,6 +128,23 @@ pub fn get_ptr(&self) -> *mut MaybeUninit<T> {
         // the invariant that self.0 is a valid offset into the per-CPU area.
         (this_cpu_area).wrapping_add(self.0 as usize).cast()
     }
+
+    /// Get a [`*mut MaybeUninit<T>`](MaybeUninit) to the per-CPU variable on the CPU represented
+    /// by `cpu`. Note that without some kind of synchronization, use of the returned pointer may
+    /// cause a data race. It is the caller's responsibility to use the returned pointer in a
+    /// reasonable way.
+    ///
+    /// # Returns
+    /// - The returned pointer is valid only if `self` is (that is, it points to a live allocation
+    ///   correctly sized and aligned to hold a `T`)
+    /// - The returned pointer is valid only if the bit corresponding to `cpu` is set in
+    ///   [`kernel::cpumask::Cpumask::possible_cpus()`].
+    pub fn get_remote_ptr(&self, cpu: CpuId) -> *mut MaybeUninit<T> {
+        // SAFETY: `bindings::per_cpu_ptr` is just doing pointer arithmetic. The returned pointer
+        // may not be valid (under the conditions specified in this function's documentation), but
+        // the act of producing the pointer is safe.
+        unsafe { bindings::per_cpu_ptr(self.0.cast(), cpu.as_u32()) }.cast()
+    }
 }
 
 // SAFETY: Sending a [`PerCpuPtr<T>`] to another thread is safe because as soon as it's sent, the
@@ -146,9 +168,9 @@ impl<T> Copy for PerCpuPtr<T> {}
 
 /// A trait representing a per-CPU variable.
 ///
-/// This is implemented for [`StaticPerCpu<T>`]. The main usage of this trait is to call
-/// [`Self::get_mut`] to get a [`PerCpuToken`] that can be used to access the underlying per-CPU
-/// variable.
+/// This is implemented for both [`StaticPerCpu<T>`] and [`DynamicPerCpu<T>`]. The main usage of
+/// this trait is to call [`Self::get_mut`] to get a [`PerCpuToken`] that can be used to access the
+/// underlying per-CPU variable.
 ///
 /// See [`PerCpuToken::with`].
 pub trait PerCpu<T> {
diff --git a/rust/kernel/percpu/dynamic.rs b/rust/kernel/percpu/dynamic.rs
new file mode 100644
index 000000000000..1863f31a2817
--- /dev/null
+++ b/rust/kernel/percpu/dynamic.rs
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Dynamically allocated per-CPU variables.
+
+use super::*;
+
+use crate::alloc::Flags;
+use crate::bindings::{alloc_percpu, free_percpu};
+use crate::cpumask::Cpumask;
+use crate::prelude::*;
+use crate::sync::Arc;
+use core::mem::{align_of, size_of, MaybeUninit};
+
+/// Represents a dynamic allocation of a per-CPU variable via `alloc_percpu`. Calls `free_percpu`
+/// when dropped.
+///
+/// # Contents
+/// Note that the allocated memory need not be initialized, and this type does not track when/if
+/// the memory location on any particular CPU has been initialized. This means that it cannot tell
+/// whether it should drop the *contents* of the allocation when it is dropped. It is up to the
+/// user to do this via something like [`core::ptr::drop_in_place`].
+pub struct PerCpuAllocation<T>(PerCpuPtr<T>);
+
+impl<T: Zeroable> PerCpuAllocation<T> {
+    /// Dynamically allocates a space in the per-CPU area suitably sized and aligned to hold a `T`,
+    /// initially filled with the zero value for `T`.
+    ///
+    /// Returns [`None`] under the same circumstances the C function `alloc_percpu` returns `NULL`.
+    pub fn new_zero() -> Option<PerCpuAllocation<T>> {
+        let ptr: *mut MaybeUninit<T> =
+            // SAFETY: No preconditions to call `alloc_percpu`; `MaybeUninit<T>` is
+            // `#[repr(transparent)]`, so we can cast a `*mut T` to it.
+            unsafe { alloc_percpu(size_of::<T>(), align_of::<T>()) }.cast();
+        if ptr.is_null() {
+            return None;
+        }
+
+        // alloc_percpu returns zero'ed memory
+        Some(Self(PerCpuPtr::new(ptr)))
+    }
+}
+
+impl<T> PerCpuAllocation<T> {
+    /// Makes a per-CPU allocation sized and aligned to hold a `T`.
+    ///
+    /// Returns [`None`] under the same circumstances the C function `alloc_percpu` returns `NULL`.
+    pub fn new_uninit() -> Option<PerCpuAllocation<T>> {
+        let ptr: *mut MaybeUninit<T> =
+            // SAFETY: No preconditions to call `alloc_percpu`; `MaybeUninit<T>` is
+            // `#[repr(transparent)]`, so we can cast a `*mut T` to it.
+            unsafe { alloc_percpu(size_of::<T>(), align_of::<T>()) }.cast();
+        if ptr.is_null() {
+            return None;
+        }
+
+        Some(Self(PerCpuPtr::new(ptr)))
+    }
+}
+
+impl<T> Drop for PerCpuAllocation<T> {
+    fn drop(&mut self) {
+        // SAFETY: self.0.0 was returned by alloc_percpu, and so was a valid pointer into
+        // the percpu area, and has remained valid by the invariants of PerCpuAllocation<T>.
+        unsafe { free_percpu(self.0 .0.cast()) }
+    }
+}
+
+/// Holds a dynamically-allocated per-CPU variable.
+#[derive(Clone)]
+pub struct DynamicPerCpu<T> {
+    // INVARIANT: `alloc` is `Some` unless this object is in the process of being dropped.
+    // INVARIANT: The allocation held by `alloc` is sized and aligned for a `T`.
+    // INVARIANT: The memory location in each CPU's per-CPU area pointed at by the alloc is
+    // initialized.
+    alloc: Option<Arc<PerCpuAllocation<T>>>,
+}
+
+impl<T: Zeroable> DynamicPerCpu<T> {
+    /// Allocates a new per-CPU variable
+    ///
+    /// # Arguments
+    /// * `flags` - [`Flags`] used to allocate an [`Arc`] that keeps track of the underlying
+    ///   [`PerCpuAllocation`].
+    pub fn new_zero(flags: Flags) -> Option<Self> {
+        let alloc: PerCpuAllocation<T> = PerCpuAllocation::new_zero()?;
+
+        let arc = Arc::new(alloc, flags).ok()?;
+
+        Some(Self { alloc: Some(arc) })
+    }
+}
+
+impl<T> PerCpu<T> for DynamicPerCpu<T> {
+    unsafe fn get_mut(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
+        // SAFETY:
+        // 1. Invariants of this type assure that `alloc` is `Some`.
+        // 2. The requirements of `PerCpu::get_mut` ensure that no other `[Checked]PerCpuToken`
+        //    exists on the current CPU.
+        // 3. The invariants of `DynamicPerCpu` ensure that the contents of the allocation are
+        //    initialized on each CPU.
+        // 4. The existence of a reference to the `PerCpuAllocation` ensures that the allocation is
+        //    live.
+        // 5. The invariants of `DynamicPerCpu` ensure that the allocation is sized and aligned for
+        //    a `T`.
+        unsafe { PerCpuToken::new(guard, &self.alloc.as_ref().unwrap_unchecked().0) }
+    }
+}
+
+impl<T> Drop for DynamicPerCpu<T> {
+    fn drop(&mut self) {
+        // SAFETY: This type's invariant ensures that `self.alloc` is `Some`.
+        let alloc = unsafe { self.alloc.take().unwrap_unchecked() };
+        if let Some(unique_alloc) = alloc.into_unique_or_drop() {
+            let ptr = unique_alloc.0;
+            for cpu in Cpumask::possible_cpus().iter() {
+                let remote_ptr = ptr.get_remote_ptr(cpu);
+                // SAFETY: `remote_ptr` is valid because the allocation it points to is still live,
+                // `cpu` appears in `Cpumask::possible_cpus()`, and the original allocation was
+                // sized and aligned for a `T`.
+                //
+                // This type's invariant ensures that the memory location in each CPU's per-CPU
+                // area pointed at by `alloc.0` has been initialized. We have a `UniqueArc`, so we
+                // know we're the only ones with a reference to the memory. These two facts
+                // together satisfy the requirements for `assume_init_drop`.
+                unsafe {
+                    (*remote_ptr).assume_init_drop();
+                }
+            }
+        }
+    }
+}

-- 
2.34.1

