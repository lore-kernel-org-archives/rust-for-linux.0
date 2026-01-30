Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A253322B8B
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 14:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783067; cv=none; b=aqMaGSdXvyH6+mT1Q7zigfVRzpKzPtEnJklYB9Hc7AWg/AT+eLhcASUHFqDJIaOt/Gago0k1dzp7TfQPZjLmwVPkli3wQEuce/VJcfblvDleziy9E8yS4Oor0PNrw4pnu81FAxORD9E2A1wIpmU94aqb9yJc+LpotOGWtiMp5iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783067; c=relaxed/simple;
	bh=p6q7ABPVf1V7n4SSGe1o9ggHL5+0T5eSDdsnUVTtoVQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UzOF5IwbTMKCSJd8dhwto9lqMwh82tTDEHkp3FRASWRB4J7TfDvMxkBzKDAcQhDUA3eKbpqkKocgN9gBk1M6pE9lqc7Nydc2rQMTleqq7Yp/wdEqL2jIUrbMmjRv+me9JcQf6IDPvrTN8wXBn746NJHXDPSrWyiX/7+ed+eyC3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P5nFjEdu; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P5nFjEdu"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47ee33324e8so23713645e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 06:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769783064; x=1770387864; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppUfKt0GlMufYciF/ftyvL04mIsDf9JeAbFlI9mEvvA=;
        b=P5nFjEduJDu2rMcn72SQiaPS124x7xWFnAt4EIqf87z9mQI491fClMqG5CvTPe+xN/
         wjVwmE1O1NmVBSRv4RCcEQj4/fJa3wLtaYpnN+uvDY8SDaRp3RqR5WlHNb9kqJtuz8rS
         0NxSazfvGFuPBNVIufXrLW8l/LhH/Mf/9HhMGoS4OvOrObtukSVDw1hi+Fmg7AfWsqne
         yARZxp2VDPmKVKXLjUp7HqzRaKjY7m8hzyyePRS6qTTHT8VUAiPi1N8gbkgLB7ipx1DG
         BaiAJNYxlx6jGDbCu5C9p5rL/9lEbKQ8ZK5NrR5mMwddQEXGMYRp1g0WRYy/xtaYDTE+
         eHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769783064; x=1770387864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppUfKt0GlMufYciF/ftyvL04mIsDf9JeAbFlI9mEvvA=;
        b=C+m8tgPydB9PpCnwfqk5dUOzpFdyznSWUQNCawei+sKzc2mviatKgbLIsmuiFeGzjw
         8i/aLzXO3Ul/uIKy3qUyJgbWtKCWrKJSSjgF89BNeHc6mQIGakDjrAguF+YEnPIieAoK
         WxoKKRaZWUNpKaDgcClxlWEMzoiYU+8cXDVW0cS5KJgpx7RD7URvUuGl/0TaRfzdcwPq
         fyjfVF9Z1OEZCRRUtW66O1/itTN0RT4H2nftce6ltzNk3jGuWwMpzde+1Jh0PpM+vXi0
         LW4oQU3RVoy1Cr6TY09qVbtMed+/BLRTdoX9xhbl3+SB6bnGV1uK6jO7M4jtGESgM6Xn
         7pfw==
X-Forwarded-Encrypted: i=1; AJvYcCWhx/sm++pfEf2LYorWxwdtX4o325o4xcpwOEpCmOFMg1UhetjqW3PBX1zLxHNzgwtCoRFa1QU6vRYki3PPFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWFCU1OBfvNMmwt7Lit3OMl//eakp2luEFGFbrLhBd8noitqWq
	875qS7xl3vmjImKM8PqMzlbWfP97t+2yYlIKVcStpOEQ3h7qOSVnqlvyqFBSzkBKGZF8us6D7sf
	0CQWolUZ9YpnJPH2Qwg==
X-Received: from wmbjp21.prod.google.com ([2002:a05:600c:5595:b0:47e:da9a:d7da])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34ca:b0:480:3b4e:41ba with SMTP id 5b1f17b1804b1-482db48d595mr34991155e9.18.1769783063901;
 Fri, 30 Jan 2026 06:24:23 -0800 (PST)
Date: Fri, 30 Jan 2026 14:24:10 +0000
In-Reply-To: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11998; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=sB6yEvHJS8rqhFVL17ijf9/pm4c8+sT/fWcd41WFMgU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpfL8S3JTmpmG1lqNYg6FwVI/4Ks5CfnsjvVg/f
 mL2AQzUofGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXy/EgAKCRAEWL7uWMY5
 RkPUEACYJ5n97LQYXabI1mnBL41ofB7vcoESU2dNaWIx722lo42b7p2abJ66Am0wxuyCdU8ewE2
 voPmWHhVwwI3ciaRKdRDMenBtKewU6CfQnSWRCia9vNTe3KEgBbqzRd0FJyRKcnmWTKPH/QZafe
 PD/nnqOb8/2ROjy47lbPgBj3E6Llq6Oo+WgDFLVYZyua0eX9/A0bVVvlCSgQ99z5XHmaNJ2WObq
 l7/Tk1NoNbNLVBvDwEhg9s65VGx4l764c8htUUAy4PGrAi0Dir0pInFhlIRJzZ762zSG/Rx4BMI
 S6Im+dLI0kP/sjO1VawaN0/Umpf9WaONMlDgrobrV6NuslYhpntWdY7CdpnP5xNq4JS6BkYvOqY
 zL4tjFai7brd28vJWQuQ9pM+6WLAHU27SksbXirO+GshZMzh5oq0PwZ8clY0BqQhVaT8jHOV4MJ
 3DM7S6zsGDaq6A5hI9VMOAAqFBsUkI+cPAVogCSUGyetqVZOU8vU0XAZ4xqJThTA37t9uoAO1vW
 kBXyIQObIZYSMxo+aB0l/otaWF8NGFFhr18XrwLCEvGN+wxNyY+CHeN14ZqsDJhTTL52W4KLy2u
 T9sLcU+3+nfkWhP3OGHpruNj9MygYzUP/ZIHseddJLyz5Rx1uWl8qKpTE8zg8lQ19h2c25UodYV 6vV4dbkA1ieRWFQ==
X-Mailer: b4 0.14.2
Message-ID: <20260130-gpuvm-rust-v4-1-8364d104ff40@google.com>
Subject: [PATCH v4 1/6] rust: drm: add base GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Asahi Lina <lina+kernel@asahilina.net>

Add a GPUVM abstraction to be used by Rust GPU drivers.

GPUVM keeps track of a GPU's virtual address (VA) space and manages the
corresponding virtual mappings represented by "GPU VA" objects. It also
keeps track of the gem::Object<T> used to back the mappings through
GpuVmBo<T>.

This abstraction is only usable by drivers that wish to use GPUVM in
immediate mode. This allows us to build the locking scheme into the API
design. It means that the GEM mutex is used for the GEM gpuva list, and
that the resv lock is used for the extobj list. The evicted list is not
yet used in this version.

This abstraction provides a special handle called the GpuVmCore, which
is a wrapper around ARef<GpuVm> that provides access to the interval
tree. Generally, all changes to the address space requires mutable
access to this unique handle.

Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                     |   2 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/drm_gpuvm.c        |  18 ++++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/drm/gpuvm/mod.rs    | 231 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   1 +
 6 files changed, 254 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b84ad595e226f231b256d24f0da6bac459e93a8..618becae72985b9dfdca8469ee48d4752fd0ca41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8720,6 +8720,8 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/drm_gpuvm.c
 F:	include/drm/drm_gpuvm.h
+F:	rust/helpers/drm_gpuvm.c
+F:	rust/kernel/drm/gpuvm/
 
 DRM LOG
 M:	Jocelyn Falempe <jfalempe@redhat.com>
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b422b4256f4a2b75fe644d47e6e82c8..dd60a5c6b142ec2c5fd6df80279ab6813163791c 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -33,6 +33,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gpuvm.h>
 #include <drm/drm_ioctl.h>
 #include <kunit/test.h>
 #include <linux/auxiliary_bus.h>
diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
new file mode 100644
index 0000000000000000000000000000000000000000..d1471e5844ec81f994af9252d9054053ab13f352
--- /dev/null
+++ b/rust/helpers/drm_gpuvm.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+#ifdef CONFIG_DRM_GPUVM
+
+#include <drm/drm_gpuvm.h>
+
+struct drm_gpuvm *rust_helper_drm_gpuvm_get(struct drm_gpuvm *obj)
+{
+	return drm_gpuvm_get(obj);
+}
+
+bool rust_helper_drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
+				     struct drm_gem_object *obj)
+{
+	return drm_gpuvm_is_extobj(gpuvm, obj);
+}
+
+#endif // CONFIG_DRM_GPUVM
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c4b473971e6210c9577860d2e2b08..0943d589b7578d3c0e207937f63a5e02719c6146 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -26,6 +26,7 @@
 #include "device.c"
 #include "dma.c"
 #include "drm.c"
+#include "drm_gpuvm.c"
 #include "err.c"
 #include "irq.c"
 #include "fs.c"
diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
new file mode 100644
index 0000000000000000000000000000000000000000..dcb1fccc766115c6a0ca03bda578e3f3e5791492
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+#![cfg(CONFIG_DRM_GPUVM = "y")]
+
+//! DRM GPUVM in immediate mode
+//!
+//! Rust abstractions for using GPUVM in immediate mode. This is when the GPUVM state is updated
+//! during `run_job()`, i.e., in the DMA fence signalling critical path, to ensure that the GPUVM
+//! and the GPU's virtual address space has the same state at all times.
+//!
+//! C header: [`include/drm/drm_gpuvm.h`](srctree/include/drm/drm_gpuvm.h)
+
+use kernel::{
+    alloc::AllocError,
+    bindings,
+    drm,
+    drm::gem::IntoGEMObject,
+    prelude::*,
+    sync::aref::{
+        ARef,
+        AlwaysRefCounted, //
+    },
+    types::Opaque, //
+};
+
+use core::{
+    cell::UnsafeCell,
+    ops::{
+        Deref,
+        Range, //
+    },
+    ptr::NonNull, //
+};
+
+/// A DRM GPU VA manager.
+///
+/// This object is refcounted, but the "core" is only accessible using a special unique handle. The
+/// core consists of the `core` field and the GPUVM's interval tree.
+///
+/// # Invariants
+///
+/// * Stored in an allocation managed by the refcount in `self.vm`.
+/// * Access to `data` and the gpuvm interval tree is controlled via the [`GpuVmCore`] type.
+#[pin_data]
+pub struct GpuVm<T: DriverGpuVm> {
+    #[pin]
+    vm: Opaque<bindings::drm_gpuvm>,
+    /// Accessed only through the [`GpuVmCore`] reference.
+    data: UnsafeCell<T>,
+}
+
+// SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
+unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
+    fn inc_ref(&self) {
+        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
+        unsafe { bindings::drm_gpuvm_get(self.vm.get()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
+        unsafe { bindings::drm_gpuvm_put((*obj.as_ptr()).vm.get()) };
+    }
+}
+
+impl<T: DriverGpuVm> GpuVm<T> {
+    const fn vtable() -> &'static bindings::drm_gpuvm_ops {
+        &bindings::drm_gpuvm_ops {
+            vm_free: Some(Self::vm_free),
+            op_alloc: None,
+            op_free: None,
+            vm_bo_alloc: None,
+            vm_bo_free: None,
+            vm_bo_validate: None,
+            sm_step_map: None,
+            sm_step_unmap: None,
+            sm_step_remap: None,
+        }
+    }
+
+    /// Creates a GPUVM instance.
+    #[expect(clippy::new_ret_no_self)]
+    pub fn new<E>(
+        name: &'static CStr,
+        dev: &drm::Device<T::Driver>,
+        r_obj: &T::Object,
+        range: Range<u64>,
+        reserve_range: Range<u64>,
+        data: T,
+    ) -> Result<GpuVmCore<T>, E>
+    where
+        E: From<AllocError>,
+        E: From<core::convert::Infallible>,
+    {
+        let obj = KBox::try_pin_init::<E>(
+            try_pin_init!(Self {
+                data: UnsafeCell::new(data),
+                vm <- Opaque::ffi_init(|vm| {
+                    // SAFETY: These arguments are valid. `vm` is valid until refcount drops to
+                    // zero.
+                    unsafe {
+                        bindings::drm_gpuvm_init(
+                            vm,
+                            name.as_char_ptr(),
+                            bindings::drm_gpuvm_flags_DRM_GPUVM_IMMEDIATE_MODE
+                                | bindings::drm_gpuvm_flags_DRM_GPUVM_RESV_PROTECTED,
+                            dev.as_raw(),
+                            r_obj.as_raw(),
+                            range.start,
+                            range.end - range.start,
+                            reserve_range.start,
+                            reserve_range.end - reserve_range.start,
+                            const { Self::vtable() },
+                        )
+                    }
+                }),
+            }? E),
+            GFP_KERNEL,
+        )?;
+        // SAFETY: This transfers the initial refcount to the ARef.
+        Ok(GpuVmCore(unsafe {
+            ARef::from_raw(NonNull::new_unchecked(KBox::into_raw(
+                Pin::into_inner_unchecked(obj),
+            )))
+        }))
+    }
+
+    /// Access this [`GpuVm`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must reference the `struct drm_gpuvm` in a valid [`GpuVm<T>`] that remains
+    /// valid for at least `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm) -> &'a Self {
+        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `GpuVm<T>`. Caller ensures the
+        // pointer is valid for 'a.
+        unsafe { &*kernel::container_of!(Opaque::cast_from(ptr), Self, vm) }
+    }
+
+    /// Returns a raw pointer to the embedded `struct drm_gpuvm`.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm {
+        self.vm.get()
+    }
+
+    /// The start of the VA space.
+    #[inline]
+    pub fn va_start(&self) -> u64 {
+        // SAFETY: The `mm_start` field is immutable.
+        unsafe { (*self.as_raw()).mm_start }
+    }
+
+    /// The length of the GPU's virtual address space.
+    #[inline]
+    pub fn va_length(&self) -> u64 {
+        // SAFETY: The `mm_range` field is immutable.
+        unsafe { (*self.as_raw()).mm_range }
+    }
+
+    /// Returns the range of the GPU virtual address space.
+    #[inline]
+    pub fn va_range(&self) -> Range<u64> {
+        let start = self.va_start();
+        // OVERFLOW: This reconstructs the Range<u64> passed to the constructor, so it won't fail.
+        let end = start + self.va_length();
+        Range { start, end }
+    }
+
+    /// Clean up buffer objects that are no longer used.
+    #[inline]
+    pub fn deferred_cleanup(&self) {
+        // SAFETY: This GPUVM uses immediate mode.
+        unsafe { bindings::drm_gpuvm_bo_deferred_cleanup(self.as_raw()) }
+    }
+
+    /// Check if this GEM object is an external object for this GPUVM.
+    #[inline]
+    pub fn is_extobj(&self, obj: &T::Object) -> bool {
+        // SAFETY: We may call this with any GPUVM and GEM object.
+        unsafe { bindings::drm_gpuvm_is_extobj(self.as_raw(), obj.as_raw()) }
+    }
+
+    /// Free this GPUVM.
+    ///
+    /// # Safety
+    ///
+    /// Called when refcount hits zero.
+    unsafe extern "C" fn vm_free(me: *mut bindings::drm_gpuvm) {
+        // SAFETY: Caller passes a pointer to the `drm_gpuvm` in a `GpuVm<T>`.
+        let me = unsafe { kernel::container_of!(Opaque::cast_from(me), Self, vm).cast_mut() };
+        // SAFETY: By type invariants we can free it when refcount hits zero.
+        drop(unsafe { KBox::from_raw(me) })
+    }
+}
+
+/// The manager for a GPUVM.
+pub trait DriverGpuVm: Sized {
+    /// Parent `Driver` for this object.
+    type Driver: drm::Driver<Object = Self::Object>;
+
+    /// The kind of GEM object stored in this GPUVM.
+    type Object: IntoGEMObject;
+}
+
+/// The core of the DRM GPU VA manager.
+///
+/// This object is a unique reference to the VM that can access the interval tree and the Rust
+/// `data` field.
+///
+/// # Invariants
+///
+/// Each `GpuVm` instance has at most one `GpuVmCore` reference.
+pub struct GpuVmCore<T: DriverGpuVm>(ARef<GpuVm<T>>);
+
+impl<T: DriverGpuVm> GpuVmCore<T> {
+    /// Access the core data of this GPUVM.
+    #[inline]
+    pub fn data(&mut self) -> &mut T {
+        // SAFETY: By the type invariants we may access `core`.
+        unsafe { &mut *self.0.data.get() }
+    }
+}
+
+impl<T: DriverGpuVm> Deref for GpuVmCore<T> {
+    type Target = GpuVm<T>;
+
+    #[inline]
+    fn deref(&self) -> &GpuVm<T> {
+        &self.0
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 1b82b6945edf25b947afc08300e211bd97150d6b..a4b6c5430198571ec701af2ef452cc9ac55870e6 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -6,6 +6,7 @@
 pub mod driver;
 pub mod file;
 pub mod gem;
+pub mod gpuvm;
 pub mod ioctl;
 
 pub use self::device::Device;

-- 
2.53.0.rc1.225.gd81095ad13-goog

