Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054F3DF01F
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856990; cv=none; b=dFXbszstSPJagg1rzUeDDSpePi9xZ1M3gt10wsBluCZ2CkVI4GeT8id0KTZ3hFcma5XCHlf9+WhAGQ03j1oEGlG03JOV9NVtVu9Hu5wHMzWiUQgzpjJMlcMj9I9HyITihhUJrmd9haMD4lY5dReuouSD8CkrYHkpfxk7ds0aTxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856990; c=relaxed/simple;
	bh=IyeQBCcNFTW60JZl2i8GXrsguuamIFDOED+ecW44t6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dRJ/gTz6DtWQwH+qrrjHRHgmQ5QqP+UQFEgEB2uvwYtapxnIEGmKFEJjj02Tm6LHLxcYCRfwQ6neD6JTB3IXjtqlV1E+O2rKmuCpDQxm139xVc3bOX4CUllwLDrFghGRhNI5OMiTY0OVVzGvBuHd8DzdbxW6aJMebA6VBj9JYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDz5wGIv; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDz5wGIv"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c757a9251faso968774a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 14:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856988; x=1776461788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JzMtJCfhE/cOyRCL4deN82RoA6oSUseqvroceFE1d8=;
        b=tDz5wGIvoS7Vswqgc5VP3oVtqwBcqJ1zz0Z72nuIczcbg8l17HxtOFKyGnjhVgpY1U
         J8NKVLP93VFTGVebqUDdzTVgkGk6kcCBkvILVT2fU8MRihS7Et66xmKhHAaqNtroSqua
         Nu89omNpi7D2bwIWmtTWBLKyuhI38I1t+rxy9ttb/RgkL/YvVHRDF75P2UT2zV/49v3M
         tRwslg4qgRFbKi5O874S5GD2O6blceu+QU844b9MemiPskXlH5MpWnZQ1jIOXLbBECe1
         HD0RXUBVHhMgz+NCj2E0GNlIn/rN2kKggnxIHV8FAqmvEwzkOdrcPO93bXr/M6gEOBu0
         fP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856988; x=1776461788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+JzMtJCfhE/cOyRCL4deN82RoA6oSUseqvroceFE1d8=;
        b=J36692AJ1tm3Z2fQ6ahd88oLrWbpi2W+iQZJQRB0UAZpfOGYvU8TX4eZ/9BZDBJEGV
         7SGadq6rGFYLCOavfgVA3B1zGWq5Cr8VIi5LrYHeUsSvWbCgyAyuroq9iIXiVVQqSyRJ
         bnBCbqq5GgJD8YwYvbwm6DVYsx23I//D7zyIJWYu4QQETFjETyIr9Q9GuAdljOaUxTn7
         1LfpGfNCg7+9rJk9fX/cIzf4XO/7KEiXpekIIzSeiX4EcMlzSfcaCebl3iMO71gIb922
         moZTb6CcPI/vPyXg3RzIMoEhQe7xkBgs5zL7KV7d2chIzg6wXMaNeq3xm3WJfWNQeQEP
         u67g==
X-Forwarded-Encrypted: i=1; AJvYcCUNXhQxGoXl+Vm0bEKu6LCeAr+cp2qutbyJ5OtPdC3widznQbK3SdsS43609FQm+yhkWnba1wH0BDCcmRsaRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5IUC/SoH252OSFIJ6sfi0S5t2C/MH2xfPcHTMmYDor0QH2H7
	d6h2YSpWk485NN2N+aUqFBsucrWOP+QeB3/bvyMnEqFCVu59H/BLz6s3
X-Gm-Gg: AeBDies2G9yJLOvkTvQnQnytsn132+9D4mG2f0EmPIH45YTlNjlZ2ArWmkKZWu9gK4Z
	hd3+TlwnYs/WuEuq2vyyjVoCRMkwDUdBmkk7gezYJdH+i+PEPecsamv3FnMo5/pXb/Cxwc1NCkp
	IliJ70gjuKBY8ynalhtCBMmVfC8W1/cAYiea+3j9p6TWTqe+ZLZ7MD3uA0zGMYFzcJU52AGl7Lo
	FuRcq1KM7xVXDJZT/Iwv5VNE6vv1dhdjy71s6YZZTxBDJXwUIm26j5XJlpFiSMyV2AXAWueUkx0
	Mj9XidqntTjs5n2Yn8XvSthbk61U5v+59fBB4jBYFR30hTFFQgUUsWPD7q+2xWvQtUXo5gSk5SP
	XZS/wheQi+8duNoyVdzKUA/r2ha1q/JSMZHkyJGci6JJe/lHCeJVI+Y7nvvdzMp4dMMwP7O6hvg
	xyAv3g1nUEFPuyJTUQ8kB6Rhy0pK70wqtmd0J0lASXF/V24xvm5Ls3uJM=
X-Received: by 2002:a05:6a20:2588:b0:398:a5c7:3dc9 with SMTP id adf61e73a8af0-39fe405dd2amr5667454637.49.1775856988108;
        Fri, 10 Apr 2026 14:36:28 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm5111551b3a.48.2026.04.10.14.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:36:27 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Fri, 10 Apr 2026 14:35:37 -0700
Subject: [PATCH v5 7/8] rust: percpu: Add pin-hole optimizations for
 numerics
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rust-percpu-v5-7-4292380d7a41@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775856978; l=10544;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=IyeQBCcNFTW60JZl2i8GXrsguuamIFDOED+ecW44t6k=;
 b=1sEnwXSt8TG44DrXsJ2xdTtZ9Hvqtj8T/1xbiPRQKEcLDvTwN0VJ1fuUJa/x5cbQVfQfLhG1a
 2UllwHEsDBTB8lfz/5JZy2p3OjK9kiS+VnYge4/oR35vnsTFhL0mRoI
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

The C implementations of `this_cpu_add`, `this_cpu_sub`, etc., are
optimized to save an instruction by avoiding having to compute
`this_cpu_ptr(&x)` for some per-CPU variable `x`. For example, rather
than

    u64 *x_ptr = this_cpu_ptr(&x);
    *x_ptr += 5;

the implementation of `this_cpu_add` is clever enough to make use of the
fact that per-CPU variables are implemented on x86 via segment
registers, and so we can use only a single instruction (where we assume
`&x` is already in `rax`)

    add gs:[rax], 5

Add this optimization via a `PerCpuNumeric` type to enable code-reuse
between `DynamicPerCpu` and `StaticPerCpu`.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/kernel/percpu.rs         |   1 +
 rust/kernel/percpu/dynamic.rs |  10 ++-
 rust/kernel/percpu/numeric.rs | 138 ++++++++++++++++++++++++++++++++++++++++++
 samples/rust/rust_percpu.rs   |  36 +++++++++++
 4 files changed, 184 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
index 72c83fef68ee..ff04607ee047 100644
--- a/rust/kernel/percpu.rs
+++ b/rust/kernel/percpu.rs
@@ -6,6 +6,7 @@
 
 pub mod cpu_guard;
 mod dynamic;
+pub mod numeric;
 mod static_;
 
 #[doc(inline)]
diff --git a/rust/kernel/percpu/dynamic.rs b/rust/kernel/percpu/dynamic.rs
index 40514704b3d0..a717138b93dc 100644
--- a/rust/kernel/percpu/dynamic.rs
+++ b/rust/kernel/percpu/dynamic.rs
@@ -28,7 +28,7 @@
 /// the memory location on any particular CPU has been initialized. This means that it cannot tell
 /// whether it should drop the *contents* of the allocation when it is dropped. It is up to the
 /// user to do this via something like [`core::ptr::drop_in_place`].
-pub struct PerCpuAllocation<T>(PerCpuPtr<T>);
+pub struct PerCpuAllocation<T>(pub(super) PerCpuPtr<T>);
 
 impl<T: Zeroable> PerCpuAllocation<T> {
     /// Dynamically allocates a space in the per-CPU area suitably sized and aligned to hold a `T`,
@@ -162,6 +162,14 @@ pub fn new_from(mut initer: impl FnMut(CpuId) -> T, flags: Flags) -> Option<Self
     }
 }
 
+impl<T> DynamicPerCpu<T> {
+    /// Gets the allocation backing this per-CPU variable.
+    pub(crate) fn alloc(&self) -> &Arc<PerCpuAllocation<T>> {
+        // SAFETY: This type's invariant ensures that `self.alloc` is `Some`.
+        unsafe { self.alloc.as_ref().unwrap_unchecked() }
+    }
+}
+
 impl<T> PerCpu<T> for DynamicPerCpu<T> {
     unsafe fn get_mut(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
         // SAFETY:
diff --git a/rust/kernel/percpu/numeric.rs b/rust/kernel/percpu/numeric.rs
new file mode 100644
index 000000000000..13b4ab4a794d
--- /dev/null
+++ b/rust/kernel/percpu/numeric.rs
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Pin-hole optimizations for [`PerCpu<T>`] where T is a numeric type.
+
+use super::*;
+use core::arch::asm;
+
+/// Represents a per-CPU variable that can be manipulated with machine-intrinsic numeric
+/// operations.
+pub struct PerCpuNumeric<'a, T> {
+    // INVARIANT: `ptr.0` is a valid offset into the per-CPU area and is initialized on all CPUs
+    // (since we don't have a CPU guard, we have to be pessimistic and assume we could be on any
+    // CPU).
+    ptr: &'a PerCpuPtr<T>,
+}
+
+macro_rules! impl_ops {
+    ($ty:ty, $reg:tt) => {
+        impl DynamicPerCpu<$ty> {
+            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
+            /// variable.
+            #[inline]
+            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
+                // The invariant is satisfied because `DynamicPerCpu`'s invariant guarantees that
+                // this pointer is valid and initialized on all CPUs.
+                PerCpuNumeric { ptr: &self.alloc().0 }
+            }
+        }
+        impl StaticPerCpu<$ty> {
+            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
+            /// variable.
+            #[inline]
+            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
+                // The invariant is satisfied because `StaticPerCpu`'s invariant guarantees that
+                // this pointer is valid and initialized on all CPUs.
+                PerCpuNumeric { ptr: &self.0 }
+            }
+        }
+
+        impl PerCpuNumeric<'_, $ty> {
+            /// Adds `rhs` to the per-CPU variable.
+            #[inline]
+            pub fn add(&mut self, rhs: $ty) {
+                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
+                // pointer relative to the `gs` segment register) by the invariants of this type.
+                unsafe {
+                    asm!(
+                        concat!("add gs:[{off}], {val:", $reg, "}"),
+                        off = in(reg) self.ptr.0.cast::<$ty>(),
+                        val = in(reg) rhs,
+                    );
+                }
+            }
+        }
+        impl PerCpuNumeric<'_, $ty> {
+            /// Subtracts `rhs` from the per-CPU variable.
+            #[inline]
+            pub fn sub(&mut self, rhs: $ty) {
+                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
+                // pointer relative to the `gs` segment register) by the invariants of this type.
+                unsafe {
+                    asm!(
+                        concat!("sub gs:[{off}], {val:", $reg, "}"),
+                        off = in(reg) self.ptr.0.cast::<$ty>(),
+                        val = in(reg) rhs,
+                    );
+                }
+            }
+        }
+    };
+}
+
+macro_rules! impl_ops_byte {
+    ($ty:ty) => {
+        impl DynamicPerCpu<$ty> {
+            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
+            /// variable.
+            #[inline]
+            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
+                // The invariant is satisfied because `DynamicPerCpu`'s invariant guarantees that
+                // this pointer is valid and initialized on all CPUs.
+                PerCpuNumeric { ptr: &self.alloc().0 }
+            }
+        }
+        impl StaticPerCpu<$ty> {
+            /// Returns a [`PerCpuNumeric`] that can be used to manipulate the underlying per-CPU
+            /// variable.
+            #[inline]
+            pub fn num(&mut self) -> PerCpuNumeric<'_, $ty> {
+                // The invariant is satisfied because `StaticPerCpu`'s invariant guarantees that
+                // this pointer is valid and initialized on all CPUs.
+                PerCpuNumeric { ptr: &self.0 }
+            }
+        }
+
+        impl PerCpuNumeric<'_, $ty> {
+            /// Adds `rhs` to the per-CPU variable.
+            #[inline]
+            pub fn add(&mut self, rhs: $ty) {
+                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
+                // pointer relative to the `gs` segment register) by the invariants of this type.
+                unsafe {
+                    asm!(
+                        "add gs:[{off}], {val}",
+                        off = in(reg) self.ptr.0.cast::<$ty>(),
+                        val = in(reg_byte) rhs,
+                    );
+                }
+            }
+        }
+        impl PerCpuNumeric<'_, $ty> {
+            /// Subtracts `rhs` from the per-CPU variable.
+            #[inline]
+            pub fn sub(&mut self, rhs: $ty) {
+                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
+                // pointer relative to the `gs` segment register) by the invariants of this type.
+                unsafe {
+                    asm!(
+                        "sub gs:[{off}], {val}",
+                        off = in(reg) self.ptr.0.cast::<$ty>(),
+                        val = in(reg_byte) rhs,
+                    );
+                }
+            }
+        }
+    };
+}
+
+impl_ops_byte!(i8);
+impl_ops!(i16, "x");
+impl_ops!(i32, "e");
+impl_ops!(i64, "r");
+impl_ops!(isize, "r");
+
+impl_ops_byte!(u8);
+impl_ops!(u16, "x");
+impl_ops!(u32, "e");
+impl_ops!(u64, "r");
+impl_ops!(usize, "r");
diff --git a/samples/rust/rust_percpu.rs b/samples/rust/rust_percpu.rs
index 5adb30509bd4..90f5debd3c7a 100644
--- a/samples/rust/rust_percpu.rs
+++ b/samples/rust/rust_percpu.rs
@@ -28,6 +28,26 @@
 define_per_cpu!(UPERCPU: u64 = 0);
 define_per_cpu!(CHECKED: RefCell<u64> = RefCell::new(0));
 
+macro_rules! make_optimization_test {
+    ($ty:ty) => {
+        let mut test: DynamicPerCpu<$ty> = DynamicPerCpu::new_zero(GFP_KERNEL).unwrap();
+        {
+            let _guard = CpuGuard::new();
+            // SAFETY: No other usage of `test`
+            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| *val = 10);
+            test.num().add(1);
+            // SAFETY: No other usage of `test`
+            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 11));
+            test.num().add(10);
+            // SAFETY: No other usage of `test`
+            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 21));
+            test.num().sub(5);
+            // SAFETY: No other usage of `test`
+            unsafe { test.get_mut(CpuGuard::new()) }.with(|val: &mut $ty| assert_eq!(*val, 16));
+        }
+    };
+}
+
 impl kernel::Module for PerCpuMod {
     fn init(_module: &'static ThisModule) -> Result<Self, Error> {
         pr_info!("rust percpu test start\n");
@@ -228,6 +248,22 @@ fn init(_module: &'static ThisModule) -> Result<Self, Error> {
 
         pr_info!("rust dynamic percpu test done\n");
 
+        pr_info!("rust numeric optimizations test start\n");
+
+        make_optimization_test!(u8);
+        make_optimization_test!(u16);
+        make_optimization_test!(u32);
+        make_optimization_test!(u64);
+        make_optimization_test!(usize);
+
+        make_optimization_test!(i8);
+        make_optimization_test!(i16);
+        make_optimization_test!(i32);
+        make_optimization_test!(i64);
+        make_optimization_test!(isize);
+
+        pr_info!("rust numeric optimizations test done\n");
+
         // Return Err to unload the module
         Result::Err(EINVAL)
     }

-- 
2.34.1

