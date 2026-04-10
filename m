Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB733DEFE3
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 21:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856988; cv=none; b=KNC3QSaV0KzmsHyGGn+zM9p/b6u5IPaEgio97GE8jOf2BvudmFaYKFX3xj1B9tY+gA6XEK0tEHh2TkYuh7BCZytCoBkJ4aoYB3dEuYZPNy6eL4WJWfnVkcVTaQ+/ptMnjbk3n/z98ZoWCE1MWuwkGmG3Q9N9LdxKItTPz0wyT20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856988; c=relaxed/simple;
	bh=BjduRcn3ssQj78fY+L89MJz6yy9e4tAyqjivAYqoheo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0Qm3ZIibusLZYV5Gb+gNiWvlbUbYlqNMwr/+AolsLidgv094SG4lIx4gc2QmTzlzRZAgzN6G2l03ACqmHRjO0d5Yb1ehSgXIACir2p64ZJ0l3RfXGr3RBCL5SGpqj19nx1W4XfmRb9jS0WJc7WGXmUJ5OAit6wYMpJMww9ionk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIvnoNlv; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIvnoNlv"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82cebbdab08so2001327b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 14:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856986; x=1776461786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjXgZakwtxdl0VN9G7aNOYuETb1QANXt4gyFlj+iho8=;
        b=LIvnoNlvWancibu+55M3E6sX2holU0jHxI+Vz0Nov0TfsIFK7NOR4DhF8f2Oc2joe/
         yt0brppY/EqXG5NvLXeOGzPIYKodIgqz3YACf/umCpDVUSPK6nP4GQxiM7gC34DtnO/N
         yQSTSP/uOE2Vada16duXmxA9J/2OJ5+OO70Q8bMTyePn4DGjtyYP+Ias1PnTtuerASEP
         9WBivvoykaT4rv+EqaXq/n3h+VLpQ+ou3784ijTeu/w83CPbahYuo/BLcEL/9JjAjK+P
         4cf9SQFzUpn/saCvNWhaia8mg+PcMiI2jpSZrQg3Trz7mZUQlTWSgNrZMfSO4dl6ibdU
         hbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856986; x=1776461786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sjXgZakwtxdl0VN9G7aNOYuETb1QANXt4gyFlj+iho8=;
        b=YJu67QNh5H27bjEQFFtF62BhFu2mSWtS7aJYeS+XZSQgD/O7CdY5E4hoq+43BVowBL
         u40iNdxDWd6hHhYI9lS1yZ8ZUD3PERf15mfKm9ULJ3Gc2MhU2qgbNdQoD3QT6n96zcnm
         UdS/rnoPU03sXeXGnv8YTZMDeHqqJfAE3lNgWJqaoRZgn/m/Mf+K6hX76ayHAFVKPsLp
         d8Tr4S07zPLdzDgMUK8gGz1PrnxMnk5KcE1+Sv+RO5513buMcJbVOQojNn7prknPmHVH
         +Bsm0CtTE4cae9jUiv3NAdun5IbdQ5ElEECvp6pY+P/bn9Qb/qkA0PkKgZi6E0WtTTlC
         QOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUx60efESkE2NNDNgEzKNfnNohCXmqY0dsPL2NXudOwf93/Uv2CgdWZ1oo7NujDU7WC96oGSAp4wo+iokUjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzueK4PiRIP/nSSJAujXnXaRec5W+v41/a1yfxhKsWXIFHPRyqC
	+Nk3gokzesK+nyQu6uItRj09GZakiWKZtvO90RyNLt0umdMYiTwMtVZo
X-Gm-Gg: AeBDieuw6AYDSCAxiIazMcDL6JTjWRb4xmFzO6y4wZxTIYW+WN2/hWZK5Ggibrg39Ln
	rTCX5VGuNHVKkY0Yf285IqFYpPQ+lmEv5IScQ4izqdqMGWvQBDkX1sHBmhlNFE6ko6rhIEtHO3Y
	v7kG6RBAWn0JqW2qhdB17prP2GqkoHSEHR22pkGJ8OoXj7iZXlAzMiXi5bcyCAf47f4hF5CtGQ+
	hhHJZqlQoEu5HzkBDLH5Gj0m1VD7guTzF2QSuhyZLCbyJnbICqMR1qyOPeU0IyuKaJ2mQgG2hf8
	xcO5NAvMFOYv7I41R1peDqXdH8QhDLivMUj1VE4yL9DpHUM2xHMRXUQOUvutJkvKT2lazfED8KC
	Z8dLGd3ztPj5ocJsJEUcCMdW9YbrmU4LhLD7gZVVpYdvUk8X4sXyvW1mYwp6ltkhSfyfJdudzlX
	RYhrUqucsWV+Nc0TnCd3SKN6Y7zgD/pJD6y60sexCOBKa4
X-Received: by 2002:a05:6a00:94ed:b0:82c:d7e7:2f8a with SMTP id d2e1a72fcca58-82f0c2cc05emr5545403b3a.39.1775856985480;
        Fri, 10 Apr 2026 14:36:25 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm5111551b3a.48.2026.04.10.14.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:36:25 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Fri, 10 Apr 2026 14:35:35 -0700
Subject: [PATCH v5 5/8] rust: percpu: introduce a rust API for dynamic
 per-CPU variables
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rust-percpu-v5-5-4292380d7a41@gmail.com>
References: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
In-Reply-To: <20260410-rust-percpu-v5-0-4292380d7a41@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
 Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
 Christoph Lameter <cl@linux.com>, Danilo Krummrich <dakr@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Boqun Feng <boqun@kernel.org>
Cc: Tyler Hicks <code@tyhicks.com>, Allen Pais <apais@linux.microsoft.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, Mitchell Levy <levymitchell0@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775856978; l=13283;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=BjduRcn3ssQj78fY+L89MJz6yy9e4tAyqjivAYqoheo=;
 b=vPb/14JfjlCNy2Aq44p4Ja3wajyFXY8LTQ+t/jJAZ8E1v/jGU8q4uLMF2F0plaErQ17GRtHuV
 5wCbzE4dktkBmGXInmVsi80MCVhObpuRvyc7xVz4vPr/KoprywWlv08
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Dynamically allocated per-CPU variables are core to many of the
use-cases of per-CPU variables (e.g., ref counting). Add support for
them using the core `PerCpuPtr<T>` primitive, implementing the
`PerCpu<T>` and `CheckedPerCpu<T>` traits.

Co-developed-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/percpu.c         |  12 +++
 rust/kernel/percpu.rs         |  30 +++++-
 rust/kernel/percpu/dynamic.rs | 217 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 255 insertions(+), 4 deletions(-)

diff --git a/rust/helpers/percpu.c b/rust/helpers/percpu.c
index 463186b8af9d..3b2f69a96c66 100644
--- a/rust/helpers/percpu.c
+++ b/rust/helpers/percpu.c
@@ -7,3 +7,15 @@ void __percpu *rust_helper_alloc_percpu(size_t sz, size_t align)
 {
 	return __alloc_percpu(sz, align);
 }
+
+__rust_helper
+void *rust_helper_per_cpu_ptr(void __percpu *ptr, unsigned int cpu)
+{
+	return per_cpu_ptr(ptr, cpu);
+}
+
+__rust_helper
+void rust_helper_on_each_cpu(smp_call_func_t func, void *info, int wait)
+{
+	on_each_cpu(func, info, wait);
+}
diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
index 615859d4daad..0ec1245038bb 100644
--- a/rust/kernel/percpu.rs
+++ b/rust/kernel/percpu.rs
@@ -1,15 +1,20 @@
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
 
 use crate::{
+    cpu::CpuId,
     declare_extern_per_cpu,
     percpu::cpu_guard::CpuGuard,
     types::Opaque, //
@@ -132,6 +137,23 @@ pub fn get_ptr(&self) -> *mut MaybeUninit<T> {
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
@@ -155,9 +177,9 @@ impl<T> Copy for PerCpuPtr<T> {}
 
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
index 000000000000..40514704b3d0
--- /dev/null
+++ b/rust/kernel/percpu/dynamic.rs
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Dynamically allocated per-CPU variables.
+
+use super::*;
+
+use crate::{
+    alloc::Flags,
+    bindings::{
+        alloc_percpu,
+        free_percpu, //
+    },
+    cpumask::Cpumask,
+    prelude::*,
+    sync::Arc, //
+};
+
+use core::mem::{
+    align_of,
+    size_of,
+    MaybeUninit, //
+};
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
+            // SAFETY: No preconditions to call `alloc_percpu`. The pointer is sized/aligned for a
+            // `T`, and `MaybeUninit<T>` is `#[repr(transparent)]` (and thus same size/align), so
+            // we can cast this `*mut c_void` to it.
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
+            // SAFETY: No preconditions to call `alloc_percpu`. The pointer is sized/aligned for a
+            // `T`, and `MaybeUninit<T>` is `#[repr(transparent)]` (and thus same size/align), so
+            // we can cast this `*mut c_void` to it.
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
+///
+/// # Examples
+/// ```
+/// # use kernel::prelude::*;
+/// # use kernel::percpu::*;
+/// # use kernel::percpu::cpu_guard::CpuGuard;
+///
+/// let mut pcpu: DynamicPerCpu<u32> =
+///   DynamicPerCpu::new_zero(GFP_KERNEL).expect("failed to allocate per-CPU variable");
+/// {
+///   let _guard = CpuGuard::new();
+///   // SAFETY: No other `pcpu` reference
+///   unsafe { pcpu.get_mut(CpuGuard::new()) }.with(|val| *val = 42);
+///   // SAFETY: No other `pcpu` reference
+///   unsafe { pcpu.get_mut(CpuGuard::new()) }.with(|val| assert!(*val == 42));
+/// }
+/// ```
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
+impl<T: Clone> DynamicPerCpu<T> {
+    /// Allocates a new per-CPU variable
+    ///
+    /// # Arguments
+    /// * `val` - The initial value of the per-CPU variable on all CPUs.
+    /// * `flags` - Flags used to allocate an [`Arc`] that keeps track of the underlying
+    ///   [`PerCpuAllocation`].
+    pub fn new_with(val: &T, flags: Flags) -> Option<Self> {
+        Self::new_from(|_| val.clone(), flags)
+    }
+}
+
+impl<T> DynamicPerCpu<T> {
+    /// Allocates a new per-CPU variable
+    ///
+    /// # Arguments
+    /// * `initer` - A function that takes a `CpuId` and returns the initial value of the per-CPU
+    ///   variable on the corresponding CPU. Called once for each possible CPU (i.e.,
+    ///   `Cpumask::possible_cpus().weight()` times).
+    /// * `flags` - Flags used to allocate an [`Arc`] that keeps track of the underlying
+    ///   [`PerCpuAllocation`].
+    pub fn new_from(mut initer: impl FnMut(CpuId) -> T, flags: Flags) -> Option<Self> {
+        let alloc: PerCpuAllocation<T> = PerCpuAllocation::new_uninit()?;
+        let ptr = alloc.0;
+
+        let arc = Arc::new(alloc, flags).ok()?;
+
+        for cpu in Cpumask::possible_cpus().iter() {
+            let remote_ptr = ptr.get_remote_ptr(cpu);
+            // SAFETY: `remote_ptr` is valid because `ptr` points to a live allocation and `cpu`
+            // appears in `Cpumask::possible_cpus()`.
+            //
+            // Each CPU's slot corresponding to `ptr` is currently uninitialized, and no one else
+            // has a reference to it. Therefore, we can freely write to it without worrying about
+            // the need to drop what was there or whether we're racing with someone else.
+            unsafe {
+                (*remote_ptr).write(initer(cpu));
+            }
+        }
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
+impl<T: InteriorMutable> CheckedPerCpu<T> for DynamicPerCpu<T> {
+    fn get(&self, guard: CpuGuard) -> CheckedPerCpuToken<'_, T> {
+        // SAFETY:
+        // 1. Invariants of this type assure that `alloc` is `Some`.
+        // 2. The invariants of `DynamicPerCpu` ensure that the contents of the allocation are
+        //    initialized on each CPU.
+        // 3. The existence of a reference to the `PerCpuAllocation` ensures that the allocation is
+        //    live.
+        // 4. The invariants of `DynamicPerCpu` ensure that the allocation is sized and aligned for
+        //    a `T`.
+        unsafe { CheckedPerCpuToken::new(guard, &self.alloc.as_ref().unwrap_unchecked().0) }
+    }
+}
+
+impl<T> Drop for DynamicPerCpu<T> {
+    fn drop(&mut self) {
+        // SAFETY: This type's invariant ensures that `self.alloc` is `Some`.
+        let alloc = unsafe { self.alloc.take().unwrap_unchecked() };
+        if let Some(unique_alloc) = Arc::into_unique_or_drop(alloc) {
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

