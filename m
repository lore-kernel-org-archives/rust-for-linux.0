Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C73DFC60
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 21:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856988; cv=none; b=je649XYqdmD2monmZeKlpwx852YTl9S8O19XnEpAqWzXlxJkz0WHkZgnP1PX9EE1MxrPl5Pop0xWnPMI1kL0RwINGY0qqZa5DNK6ESqlxNS/x6KGeCsc3wPlKVJiwrpy7ZwZGc3pt4f1Vy18U7aTz0gd4Xi9kdbJo9WksPz1wSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856988; c=relaxed/simple;
	bh=MZsr3UdiERwV1f/QQfUp88/S78aGt9zYSriryeD+vLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syOT7j0wBtF1yB4Wow/MWtOKGzL8DjpOs7lGbdRDqQTd5JakrJfbGQrgIPKkHvJ9rmEXpv/szalRgt1bNxx3P8Vs2x9fgh3h0hw1ahTgGKwxZZwFgSMIl5cnqzNI8xpeZJs2Jr88nY4GS9qzxzcl5hdPFjKzqH8MVFXz1pVAiq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smlNTIgN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smlNTIgN"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cebbdab08so2001339b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Apr 2026 14:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856987; x=1776461787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qp18656DxFkgwOS2U3bgLEL3hq8+puEOLyZcxkp/3uY=;
        b=smlNTIgNbEDERR9GDG8/chy5EfUWP+Chh9YhoL6GAaaF81IP20dlFrhInzS+EHTIaY
         JbxKHte6sasbB37HaPOyfOGj604MkovjjASbFniFaY85iHVqULGVsWS6zAAyCCZ5p7xI
         vzH1S9CyDVwxJ5M5lgI7sRZ3LdIkzZJJUx//tU4EqCEoVt4LMvJ0jucm1BwrrTyi+/Im
         nPEPDORslG9E8Xpc9q2B4OYTzYE2AG+/wWvEBAu+OQdyOz74M6LPlsTRjQYA/Gy3nKUY
         rksquuzqnC1dPp+kE8LlgU9Ykp0MMpTrGZkXpy0w7rLuOIlLhgNA22HcNlzV75T8SSPW
         yNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856987; x=1776461787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qp18656DxFkgwOS2U3bgLEL3hq8+puEOLyZcxkp/3uY=;
        b=H4p4/nIAURXlHNUdLauDM6wT6utTQyxZejGch6J7Nvlg6kwcInp9T7SaNyy87Y1kxK
         t9OheFdlZQPm0NXXBJifSrSvRbSVQOdn7P87hc/KLFrrBkUwLN/FC9WB+PAUgX8aGH8/
         xB5mvR0o9d9vbjNbknkTXfHUhqM4SwhwYIineA5cI55oqSLg8JgY21U8h3M6zuKVKtxd
         wlSbtRDyck4qWkV3myeHbh33deajaVdOGmUTVgYmMMh0U1R6/imxZdJqmwEyXnDe1AIB
         hKGsNg4fyEDSwcNkNSyCrC9+S+lzo8P07c20pkBdzxiQB06NjWzKCjieVlVGHlUupLcI
         PbRA==
X-Forwarded-Encrypted: i=1; AJvYcCV9qUbQSHwfeUKteOcRVnOp/XYqxeh3kjIKYj1lXV9Q6HoRsGeNeELSEiGGBMDOYIB1O/5XAO0ueka2eENpyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/quCWeYfZCNr925vJpCqezQzqAn4fn2XpOFH5ZQoVuv7Wzamj
	tdlcy96vi1ngylhVj+RFC6oy6YNUO7GXTKM1MmE6DsW0ZaJ9et5oVLFJ8WeBrN0X
X-Gm-Gg: AeBDies45p5/Nbc+4WhH1LOS/iEuHCOP8GsnmVse0jdDBfF9QGm7Cpvm6nHi3SqzOTe
	WSItYBSTdl1eiMVWZb4sEa8Bitnm9ppGEPKajGns3tBccWUqi2wotW+PkVIoalP6XWE0BhCaTmI
	I64iaVYeSy0Yz4iCzXI6EaQb4X3snZp/NLvYUgguwuy/R2SdS2KavyTAl9mijkZUI/iE9l1vH/P
	11WGxPY6h0ZYKOBIpBqvR1Eu/ch34nDmZLWKE2RpcFTMAHZyhLqIvr21EmVf9xvaQwdbwqCjvmY
	R5u9+586h27bgTDL8GjHML98Seoi2+kuYHIX4rdK1uZzw4Kdxeybradnf9ydM+WVi4tvU5Pgipu
	FOECSB1KYfelKadYvsvexRrAvh7q0mveRV1cDzh8Ggjjf184XBCRJpeXMDZFpkYYOwHOfwoHUHV
	eHkx5CilxtXzbm4Y9bomlE9QBg0PLDJbnSf9UiMRhkBTDz
X-Received: by 2002:a05:6a00:4388:b0:82c:daa4:ce2b with SMTP id d2e1a72fcca58-82f0c2f1536mr5606609b3a.49.1775856986535;
        Fri, 10 Apr 2026 14:36:26 -0700 (PDT)
Received: from mitchelllevy.localdomain ([131.107.1.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e3d41sm5111551b3a.48.2026.04.10.14.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:36:26 -0700 (PDT)
From: Mitchell Levy <levymitchell0@gmail.com>
Date: Fri, 10 Apr 2026 14:35:36 -0700
Subject: [PATCH v5 6/8] rust: percpu: add a rust per-CPU variable sample
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-rust-percpu-v5-6-4292380d7a41@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775856978; l=13379;
 i=levymitchell0@gmail.com; s=20240719; h=from:subject:message-id;
 bh=MZsr3UdiERwV1f/QQfUp88/S78aGt9zYSriryeD+vLw=;
 b=rKc93uyRO4qfeWUI6y1uol7p76Ye5NgzhZp3pAGG5J/gi0WD/mvuCE/Sq1fkPMzpQCuRmoB/N
 Ur2QmXulKQ9BolYILXGzMRLyvFRjw8NpVKiAPCPSKhnRjb0Yh6UWMrz
X-Developer-Key: i=levymitchell0@gmail.com; a=ed25519;
 pk=n6kBmUnb+UNmjVkTnDwrLwTJAEKUfs2e8E+MFPZI93E=

Add a short exercise for Rust's per-CPU variable API, modelled after
lib/percpu_test.c

Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
---
 rust/helpers/percpu.c       |   1 +
 rust/kernel/percpu.rs       |   2 +-
 samples/rust/Kconfig        |   9 ++
 samples/rust/Makefile       |   1 +
 samples/rust/rust_percpu.rs | 278 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 290 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/percpu.c b/rust/helpers/percpu.c
index 3b2f69a96c66..173b516cd813 100644
--- a/rust/helpers/percpu.c
+++ b/rust/helpers/percpu.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/percpu.h>
+#include <linux/smp.h>
 
 __rust_helper
 void __percpu *rust_helper_alloc_percpu(size_t sz, size_t align)
diff --git a/rust/kernel/percpu.rs b/rust/kernel/percpu.rs
index 0ec1245038bb..72c83fef68ee 100644
--- a/rust/kernel/percpu.rs
+++ b/rust/kernel/percpu.rs
@@ -2,7 +2,7 @@
 //! Per-CPU variables.
 //!
 //! See the [`crate::define_per_cpu!`] macro, the [`DynamicPerCpu`] type, and the [`PerCpu<T>`]
-//! trait.
+//! trait. Example usage can be found in `samples/rust/rust_percpu.rs`.
 
 pub mod cpu_guard;
 mod dynamic;
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c49ab9106345..2616dbd7b37a 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -172,6 +172,15 @@ config SAMPLE_RUST_SOC
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_PERCPU
+	tristate "Per-CPU support"
+	depends on m
+	help
+	  Enable this option to build a module which demonstrates Rust per-CPU
+	  operations.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_HOSTPROGS
 	bool "Host programs"
 	help
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6c0aaa58cccc..1ce120ac0402 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
 obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
 obj-$(CONFIG_SAMPLE_RUST_SOC)			+= rust_soc.o
+obj-$(CONFIG_SAMPLE_RUST_PERCPU)		+= rust_percpu.o
 
 rust_print-y := rust_print_main.o rust_print_events.o
 
diff --git a/samples/rust/rust_percpu.rs b/samples/rust/rust_percpu.rs
new file mode 100644
index 000000000000..5adb30509bd4
--- /dev/null
+++ b/samples/rust/rust_percpu.rs
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0
+//! A simple demonstration of the rust per-CPU API.
+
+use core::cell::RefCell;
+use core::ffi::c_void;
+
+use kernel::{
+    bindings::on_each_cpu,
+    cpu::CpuId,
+    define_per_cpu, get_static_per_cpu,
+    percpu::{cpu_guard::*, *},
+    pr_info,
+    prelude::*,
+    sync::Arc,
+};
+
+module! {
+    type: PerCpuMod,
+    name: "rust_percpu",
+    authors: ["Mitchell Levy"],
+    description: "Sample to demonstrate the Rust per-CPU API",
+    license: "GPL v2",
+}
+
+struct PerCpuMod;
+
+define_per_cpu!(PERCPU: i64 = 0);
+define_per_cpu!(UPERCPU: u64 = 0);
+define_per_cpu!(CHECKED: RefCell<u64> = RefCell::new(0));
+
+impl kernel::Module for PerCpuMod {
+    fn init(_module: &'static ThisModule) -> Result<Self, Error> {
+        pr_info!("rust percpu test start\n");
+
+        let mut native: i64 = 0;
+        let mut pcpu: StaticPerCpu<i64> = get_static_per_cpu!(PERCPU);
+
+        // SAFETY: We only have one PerCpu that points at PERCPU
+        unsafe { pcpu.get_mut(CpuGuard::new()) }.with(|val: &mut i64| {
+            pr_info!("The contents of pcpu are {}\n", *val);
+
+            native += -1;
+            *val += -1;
+            pr_info!("Native: {}, *pcpu: {}\n", native, *val);
+            assert!(native == *val && native == -1);
+
+            native += 1;
+            *val += 1;
+            pr_info!("Native: {}, *pcpu: {}\n", native, *val);
+            assert!(native == *val && native == 0);
+        });
+
+        let mut unative: u64 = 0;
+        let mut upcpu: StaticPerCpu<u64> = get_static_per_cpu!(UPERCPU);
+
+        // SAFETY: We only have one PerCpu pointing at UPERCPU
+        unsafe { upcpu.get_mut(CpuGuard::new()) }.with(|val: &mut u64| {
+            unative += 1;
+            *val += 1;
+            pr_info!("Unative: {}, *upcpu: {}\n", unative, *val);
+            assert!(unative == *val && unative == 1);
+
+            unative = unative.wrapping_add((-1i64) as u64);
+            *val = val.wrapping_add((-1i64) as u64);
+            pr_info!("Unative: {}, *upcpu: {}\n", unative, *val);
+            assert!(unative == *val && unative == 0);
+
+            unative = unative.wrapping_add((-1i64) as u64);
+            *val = val.wrapping_add((-1i64) as u64);
+            pr_info!("Unative: {}, *upcpu: {}\n", unative, *val);
+            assert!(unative == *val && unative == (-1i64) as u64);
+
+            unative = 0;
+            *val = 0;
+
+            unative = unative.wrapping_sub(1);
+            *val = val.wrapping_sub(1);
+            pr_info!("Unative: {}, *upcpu: {}\n", unative, *val);
+            assert!(unative == *val && unative == (-1i64) as u64);
+            assert!(unative == *val && unative == u64::MAX);
+        });
+
+        let mut checked_native: u64 = 0;
+        let checked: StaticPerCpu<RefCell<u64>> = get_static_per_cpu!(CHECKED);
+        checked.get(CpuGuard::new()).with(|val: &RefCell<u64>| {
+            checked_native += 1;
+            *val.borrow_mut() += 1;
+            pr_info!(
+                "Checked native: {}, *checked: {}\n",
+                checked_native,
+                *val.borrow()
+            );
+            assert!(checked_native == *val.borrow() && checked_native == 1);
+
+            checked_native = checked_native.wrapping_add((-1i64) as u64);
+            val.replace_with(|old: &mut u64| old.wrapping_add((-1i64) as u64));
+            pr_info!(
+                "Checked native: {}, *checked: {}\n",
+                checked_native,
+                *val.borrow()
+            );
+            assert!(checked_native == *val.borrow() && checked_native == 0);
+
+            checked_native = checked_native.wrapping_add((-1i64) as u64);
+            val.replace_with(|old: &mut u64| old.wrapping_add((-1i64) as u64));
+            pr_info!(
+                "Checked native: {}, *checked: {}\n",
+                checked_native,
+                *val.borrow()
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
+                *val.borrow()
+            );
+            assert!(checked_native == *val.borrow() && checked_native == (-1i64) as u64);
+            assert!(checked_native == *val.borrow() && checked_native == u64::MAX);
+        });
+
+        pr_info!("rust static percpu test done\n");
+
+        pr_info!("rust dynamic percpu test start\n");
+        let mut test: DynamicPerCpu<u64> = DynamicPerCpu::new_zero(GFP_KERNEL).unwrap();
+
+        // SAFETY: No prerequisites for on_each_cpu.
+        unsafe {
+            on_each_cpu(Some(inc_percpu_u64), (&raw mut test).cast(), 0);
+            on_each_cpu(Some(inc_percpu_u64), (&raw mut test).cast(), 0);
+            on_each_cpu(Some(inc_percpu_u64), (&raw mut test).cast(), 0);
+            on_each_cpu(Some(inc_percpu_u64), (&raw mut test).cast(), 1);
+            on_each_cpu(Some(check_percpu_u64), (&raw mut test).cast(), 1);
+        }
+
+        let checked: DynamicPerCpu<RefCell<u64>> =
+            DynamicPerCpu::new_with(&RefCell::new(100), GFP_KERNEL).unwrap();
+
+        // SAFETY: No prerequisites for on_each_cpu.
+        unsafe {
+            on_each_cpu(
+                Some(inc_percpu_refcell_u64),
+                (&raw const checked) as *mut c_void,
+                0,
+            );
+            on_each_cpu(
+                Some(inc_percpu_refcell_u64),
+                (&raw const checked) as *mut c_void,
+                0,
+            );
+            on_each_cpu(
+                Some(inc_percpu_refcell_u64),
+                (&raw const checked) as *mut c_void,
+                0,
+            );
+            on_each_cpu(
+                Some(inc_percpu_refcell_u64),
+                (&raw const checked) as *mut c_void,
+                1,
+            );
+            on_each_cpu(
+                Some(check_percpu_refcell_u64),
+                (&raw const checked) as *mut c_void,
+                1,
+            );
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
+                *val.borrow()
+            );
+            assert!(checked_native == *val.borrow() && checked_native == 1);
+
+            checked_native = checked_native.wrapping_add((-1i64) as u64);
+            val.replace_with(|old: &mut u64| old.wrapping_add((-1i64) as u64));
+            pr_info!(
+                "Checked native: {}, *checked: {}\n",
+                checked_native,
+                *val.borrow()
+            );
+            assert!(checked_native == *val.borrow() && checked_native == 0);
+
+            checked_native = checked_native.wrapping_add((-1i64) as u64);
+            val.replace_with(|old: &mut u64| old.wrapping_add((-1i64) as u64));
+            pr_info!(
+                "Checked native: {}, *checked: {}\n",
+                checked_native,
+                *val.borrow()
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
+                *val.borrow()
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
+        assert!(Arc::into_unique_or_drop(arc).is_some());
+
+        pr_info!("rust dynamic percpu test done\n");
+
+        // Return Err to unload the module
+        Result::Err(EINVAL)
+    }
+}
+
+extern "C" fn inc_percpu_u64(info: *mut c_void) {
+    // SAFETY: We know that info is a void *const DynamicPerCpu<u64> and DynamicPerCpu<u64> is Send.
+    let mut pcpu = unsafe { (*(info as *const DynamicPerCpu<u64>)).clone() };
+    pr_info!("Incrementing on {}\n", CpuId::current().as_u32());
+
+    // SAFETY: We don't have multiple clones of pcpu in scope
+    unsafe { pcpu.get_mut(CpuGuard::new()) }.with(|val: &mut u64| *val += 1);
+}
+
+extern "C" fn check_percpu_u64(info: *mut c_void) {
+    // SAFETY: We know that info is a void *const DynamicPerCpu<u64> and DynamicPerCpu<u64> is Send.
+    let mut pcpu = unsafe { (*(info as *const DynamicPerCpu<u64>)).clone() };
+    pr_info!("Asserting on {}\n", CpuId::current().as_u32());
+
+    // SAFETY: We don't have multiple clones of pcpu in scope
+    unsafe { pcpu.get_mut(CpuGuard::new()) }.with(|val: &mut u64| assert!(*val == 4));
+}
+
+extern "C" fn inc_percpu_refcell_u64(info: *mut c_void) {
+    // SAFETY: We know that info is a void *const DynamicPerCpu<RefCell<u64>> and
+    // DynamicPerCpu<RefCell<u64>> is Send.
+    let pcpu = unsafe { (*(info as *const DynamicPerCpu<RefCell<u64>>)).clone() };
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
+    let pcpu = unsafe { (*(info as *const DynamicPerCpu<RefCell<u64>>)).clone() };
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

