Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F0D2F60A2
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 23:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762383757; cv=none; b=iiO4OQqlIIcOW7t51uNHtRQeQ/Xl41D4WazbrUyMdBzfJdTdP5qZYt+/XZ1fXl/nWBPki+2kNLAqL5DYYw8qz9aOVFDn1soQRS8zAkf6gKqyXUgh+76F6UT2Z0i93a3AjaYTkAp/uDEjU9dB2ShRP2+lvdwlY4b+tW1Aj455fH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762383757; c=relaxed/simple;
	bh=BqnHuY+j+zWWmGsgTf4cjhQ+rYxxpT17fToJwK3G2cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K0qySab9XcMX7mTE2BBbG6ts37bunAsxQBqLQy6gVaaj6qr3q9uz0y3RKHa19zq+aKXbOdsdY0FRHLBDW3cOsv29m0v7AyYiZpaXhkRmIuP2jgSEddxkMT2PNIkR+55L7eXNtvoUrohhWnKFaT2Sq+oMuZBTEqlyl2Asx9tLmEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f21KwWxz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f21KwWxz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27d3540a43fso3748655ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 15:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762383755; x=1762988555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlEVe7ZQ+3aZbaXo/QWkECKjdoOcpAx/m3mobBviog0=;
        b=f21KwWxzPINkqh5S72/Tte/NS38rv3H9Y9JRxtefnCfwUyVWZ4hoI7aFuomForMQrU
         yO6FFEeDMG4AvJw3gR2oDtqd6DKi7eXuw178rBscx1x85s9iNRiy9j28oFAAHbDHKO7T
         +JARdr45ZX4bPGDidEj5EVozyZFBNlIfOYcVPBN1x5IgLodwjd1lx6ACNjcgB6cb62O/
         cTIDsx/cFF21uYGfA9hA/paKic2tCqYGH/egxRZdhpNKc8KGYd1F3Q4zuQizf9D81dQW
         T/AMEFjAE+JgSbkykFKzzi5IdxiH7unbB9jWAAZFLaSbAEhxwADNDSgmWnTfNPn68zsp
         PVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762383755; x=1762988555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlEVe7ZQ+3aZbaXo/QWkECKjdoOcpAx/m3mobBviog0=;
        b=PJiB/9eVt2h9hrzrNOHJV3HPFD23eYrWcLAjgX472dyrBk+ZSrMdJBZJQSlAr3hpma
         /EwjN/JFGJykLw6Jn5baQyorx6eFQqKPtAXKyUf3V2TmG5rQegwlN40/gcQZQMe0YQN7
         enkIdjI9xfovV3Vw3kBfDFG++NyvRD7c9Jq1PtojSxBqJljnfVqR/DtJbyETw9ZrBPlz
         V+GskPUeuOTRovVcT08OTBT1o/5KEQx2EQgZ7E9xv/HTX0N0WCt77sjEEk3yDeGQ0yRb
         8fYz0p6/aEYP4iZm8qFLFWDnoSNS4aOKi1faGPcLJgjG9TSwVdHgwolipLtuYCNXfZm8
         aH/A==
X-Forwarded-Encrypted: i=1; AJvYcCVEH7mkk27cRt63xsOjjAe0GUfpgYppI+y2PwQt4nd8wePed/K+cx3ttYlqY/yAYqyoe4rwjGc0p2c16r6OUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhcmXEOHzqd+OmY1JNm82lOCqNJXUUmyghlSLXMHNr5cIWHHxy
	e/nS0VH/7pE0QGuEYiDO08lSGbhYQU5rr4jc5nTevAypT2fT1KP3iuY+
X-Gm-Gg: ASbGnctksRFVFXR/9Z6jOatBSAzLddtkRzmCg2YRaobW4MRRxvowPw4vUwfeTNfIU0G
	PD7azWZYuGeqf3pKAoivzt+DUc89lrC0sh3SLr7ZNxZ40n8nruKHRWvy/jIw3ikPWBDcoEfAcsm
	ehMCLtoKUZnKxyev1QDnjw1UHCsUmJvu/eeVAYbvxFVj8jq1D1aaotHufGqwhUov4DgFDOWioBx
	zz+4VClWliVZgIoePtIFID86494u0yxbRO7c6KKyUb81XunBQWXZc5dCM5I6YuAuIk425TCPLaX
	pg2yUnV+mfe393yt2bMX6AzEWk8J0tBA578b84laJ++PaNnoTj9g7Ac6KdEZu18hsscPdfOZ1a5
	LSODvNaDHAhaYvgzRfQVWq6ndVDTaO+EoZ+FFB/W5iBPJIaDM8NsBL8vl/t1C0JSGUwBEjUGJbm
	teledvgXbS8Z+N7+bk1Cj3o0NifoCxU3aE6g==
X-Google-Smtp-Source: AGHT+IGL90UCdSoq8ldn75N4+7GWkkl8BPXpNVrFKQinz3VwFnZfYaDmILgoDXuV49BzxLMOOrniRg==
X-Received: by 2002:a17:902:e751:b0:295:1277:7926 with SMTP id d9443c01a7336-2962ad2b031mr67951235ad.23.1762383754797;
        Wed, 05 Nov 2025 15:02:34 -0800 (PST)
Received: from mitchelllevy.localdomain ([131.107.147.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096839asm6325645ad.13.2025.11.05.15.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:02:34 -0800 (PST)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Wed, 05 Nov 2025 15:01:19 -0800
Subject: [PATCH v4 7/9] rust: percpu: Support non-zeroable types for
 DynamicPerCpu
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-rust-percpu-v4-7-984b1470adcb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762383744; l=10112;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=BqnHuY+j+zWWmGsgTf4cjhQ+rYxxpT17fToJwK3G2cU=;
 b=kTPf2rF1bKOOsD6lCvyiNpGrvnXPjibUxkDPtlxWNqeA6HklvELVCnpq28MLWOYvQwBQQswYj
 r6Ije0nlQwZCQZtslxG/M/AMyLX3SwifpWpGi+UEShOEycvwWb6obHp
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add functionality to `PerCpuPtr` to compute pointers to per-CPU variable
slots on other CPUs. Use this facility to initialize per-CPU variables
on all possible CPUs when a dynamic per-CPU variable is created with a
non-zeroable type. Since `RefCell` and other `Cell`-like types fall into
this category, `impl CheckedPerCpu` on `DynamicPerCpu` for these
`InteriorMutable` types since they can now be used. Add examples of
these usages to `samples/rust/rust_percpu.rs`. Add a test to ensure
dynamic per-CPU variables properly drop their contents, done here since
non-trivially dropped types often aren't `Zeroable`.

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/kernel/percpu/dynamic.rs |  44 +++++++++++++++++
 samples/rust/rust_percpu.rs   | 109 +++++++++++++++++++++++++++++++++++++++---
 2 files changed, 146 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/percpu/dynamic.rs b/rust/kernel/percpu/dynamic.rs
index 1863f31a2817..a74c8841aeb2 100644
--- a/rust/kernel/percpu/dynamic.rs
+++ b/rust/kernel/percpu/dynamic.rs
@@ -89,6 +89,36 @@ pub fn new_zero(flags: Flags) -> Option<Self> {
     }
 }
 
+impl<T: Clone> DynamicPerCpu<T> {
+    /// Allocates a new per-CPU variable
+    ///
+    /// # Arguments
+    /// * `val` - The initial value of the per-CPU variable on all CPUs.
+    /// * `flags` - Flags used to allocate an [`Arc`] that keeps track of the underlying
+    ///   [`PerCpuAllocation`].
+    pub fn new_with(val: &T, flags: Flags) -> Option<Self> {
+        let alloc: PerCpuAllocation<T> = PerCpuAllocation::new_uninit()?;
+        let ptr = alloc.0;
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
+                (*remote_ptr).write(val.clone());
+            }
+        }
+
+        let arc = Arc::new(alloc, flags).ok()?;
+
+        Some(Self { alloc: Some(arc) })
+    }
+}
+
 impl<T> PerCpu<T> for DynamicPerCpu<T> {
     unsafe fn get_mut(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
         // SAFETY:
@@ -105,6 +135,20 @@ unsafe fn get_mut(&mut self, guard: CpuGuard) -> PerCpuToken<'_, T> {
     }
 }
 
+impl<T: InteriorMutable> CheckedPerCpu<T> for DynamicPerCpu<T> {
+    fn get(&mut self, guard: CpuGuard) -> CheckedPerCpuToken<'_, T> {
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
 impl<T> Drop for DynamicPerCpu<T> {
     fn drop(&mut self) {
         // SAFETY: This type's invariant ensures that `self.alloc` is `Some`.
diff --git a/samples/rust/rust_percpu.rs b/samples/rust/rust_percpu.rs
index 98ca1c781b6b..be70ee2e513f 100644
--- a/samples/rust/rust_percpu.rs
+++ b/samples/rust/rust_percpu.rs
@@ -11,6 +11,7 @@
     percpu::{cpu_guard::*, *},
     pr_info,
     prelude::*,
+    sync::Arc,
 };
 
 module! {
@@ -130,13 +131,81 @@ fn init(_module: &'static ThisModule) -> Result<Self, Error> {
 
         // SAFETY: No prerequisites for on_each_cpu.
         unsafe {
-            on_each_cpu(Some(inc_percpu), (&raw mut test).cast(), 0);
-            on_each_cpu(Some(inc_percpu), (&raw mut test).cast(), 0);
-            on_each_cpu(Some(inc_percpu), (&raw mut test).cast(), 0);
-            on_each_cpu(Some(inc_percpu), (&raw mut test).cast(), 1);
-            on_each_cpu(Some(check_percpu), (&raw mut test).cast(), 1);
+            on_each_cpu(Some(inc_percpu_u64), (&raw mut test).cast(), 0);
+            on_each_cpu(Some(inc_percpu_u64), (&raw mut test).cast(), 0);
+            on_each_cpu(Some(inc_percpu_u64), (&raw mut test).cast(), 0);
+            on_each_cpu(Some(inc_percpu_u64), (&raw mut test).cast(), 1);
+            on_each_cpu(Some(check_percpu_u64), (&raw mut test).cast(), 1);
         }
 
+        let mut checked: DynamicPerCpu<RefCell<u64>> =
+            DynamicPerCpu::new_with(&RefCell::new(100), GFP_KERNEL).unwrap();
+
+        // SAFETY: No prerequisites for on_each_cpu.
+        unsafe {
+            on_each_cpu(Some(inc_percpu_refcell_u64), (&raw mut checked).cast(), 0);
+            on_each_cpu(Some(inc_percpu_refcell_u64), (&raw mut checked).cast(), 0);
+            on_each_cpu(Some(inc_percpu_refcell_u64), (&raw mut checked).cast(), 0);
+            on_each_cpu(Some(inc_percpu_refcell_u64), (&raw mut checked).cast(), 1);
+            on_each_cpu(Some(check_percpu_refcell_u64), (&raw mut checked).cast(), 1);
+        }
+
+        checked.get(CpuGuard::new()).with(|val: &RefCell<u64>| {
+            assert!(*val.borrow() == 104);
+
+            let mut checked_native = 0;
+            *val.borrow_mut() = 0;
+
+            checked_native += 1;
+            *val.borrow_mut() += 1;
+            pr_info!(
+                "Checked native: {}, *checked: {}\n",
+                checked_native,
+                val.borrow()
+            );
+            assert!(checked_native == *val.borrow() && checked_native == 1);
+
+            checked_native = checked_native.wrapping_add((-1i64) as u64);
+            val.replace_with(|old: &mut u64| old.wrapping_add((-1i64) as u64));
+            pr_info!(
+                "Checked native: {}, *checked: {}\n",
+                checked_native,
+                val.borrow()
+            );
+            assert!(checked_native == *val.borrow() && checked_native == 0);
+
+            checked_native = checked_native.wrapping_add((-1i64) as u64);
+            val.replace_with(|old: &mut u64| old.wrapping_add((-1i64) as u64));
+            pr_info!(
+                "Checked native: {}, *checked: {}\n",
+                checked_native,
+                val.borrow()
+            );
+            assert!(checked_native == *val.borrow() && checked_native == (-1i64) as u64);
+
+            checked_native = 0;
+            *val.borrow_mut() = 0;
+
+            checked_native = checked_native.wrapping_sub(1);
+            val.replace_with(|old: &mut u64| old.wrapping_sub(1));
+            pr_info!(
+                "Checked native: {}, *checked: {}\n",
+                checked_native,
+                val.borrow()
+            );
+            assert!(checked_native == *val.borrow() && checked_native == (-1i64) as u64);
+            assert!(checked_native == *val.borrow() && checked_native == u64::MAX);
+        });
+
+        let arc = Arc::new(0, GFP_KERNEL).unwrap();
+        {
+            let _arc_pcpu: DynamicPerCpu<Arc<u64>> =
+                DynamicPerCpu::new_with(&arc, GFP_KERNEL).unwrap();
+        }
+        // `arc` should be unique, since all the clones on each CPU should be dropped when
+        // `_arc_pcpu` is dropped
+        assert!(arc.into_unique_or_drop().is_some());
+
         pr_info!("rust dynamic percpu test done\n");
 
         // Return Err to unload the module
@@ -144,7 +213,7 @@ fn init(_module: &'static ThisModule) -> Result<Self, Error> {
     }
 }
 
-extern "C" fn inc_percpu(info: *mut c_void) {
+extern "C" fn inc_percpu_u64(info: *mut c_void) {
     // SAFETY: We know that info is a void *const DynamicPerCpu<u64> and DynamicPerCpu<u64> is Send.
     let mut pcpu = unsafe { (*(info as *const DynamicPerCpu<u64>)).clone() };
     pr_info!("Incrementing on {}\n", CpuId::current().as_u32());
@@ -153,7 +222,7 @@ extern "C" fn inc_percpu(info: *mut c_void) {
     unsafe { pcpu.get_mut(CpuGuard::new()) }.with(|val: &mut u64| *val += 1);
 }
 
-extern "C" fn check_percpu(info: *mut c_void) {
+extern "C" fn check_percpu_u64(info: *mut c_void) {
     // SAFETY: We know that info is a void *const DynamicPerCpu<u64> and DynamicPerCpu<u64> is Send.
     let mut pcpu = unsafe { (*(info as *const DynamicPerCpu<u64>)).clone() };
     pr_info!("Asserting on {}\n", CpuId::current().as_u32());
@@ -161,3 +230,29 @@ extern "C" fn check_percpu(info: *mut c_void) {
     // SAFETY: We don't have multiple clones of pcpu in scope
     unsafe { pcpu.get_mut(CpuGuard::new()) }.with(|val: &mut u64| assert!(*val == 4));
 }
+
+extern "C" fn inc_percpu_refcell_u64(info: *mut c_void) {
+    // SAFETY: We know that info is a void *const DynamicPerCpu<RefCell<u64>> and
+    // DynamicPerCpu<RefCell<u64>> is Send.
+    let mut pcpu = unsafe { (*(info as *const DynamicPerCpu<RefCell<u64>>)).clone() };
+    // SAFETY: smp_processor_id has no preconditions
+    pr_info!("Incrementing on {}\n", CpuId::current().as_u32());
+
+    pcpu.get(CpuGuard::new()).with(|val: &RefCell<u64>| {
+        let mut val = val.borrow_mut();
+        *val += 1;
+    });
+}
+
+extern "C" fn check_percpu_refcell_u64(info: *mut c_void) {
+    // SAFETY: We know that info is a void *const DynamicPerCpu<RefCell<u64>> and
+    // DynamicPerCpu<RefCell<u64>> is Send.
+    let mut pcpu = unsafe { (*(info as *const DynamicPerCpu<RefCell<u64>>)).clone() };
+    // SAFETY: smp_processor_id has no preconditions
+    pr_info!("Asserting on {}\n", CpuId::current().as_u32());
+
+    pcpu.get(CpuGuard::new()).with(|val: &RefCell<u64>| {
+        let val = val.borrow();
+        assert!(*val == 104);
+    });
+}

-- 
2.34.1

