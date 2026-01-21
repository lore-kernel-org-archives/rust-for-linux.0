Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F253D4122
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995117; cv=none; b=sa8b5gn3gkgp4RZpFFg3DlW8z7RSbCwRZpMZURLYtrGUgzSAby3Z7ZyQsHl+jDC8ym6ErjeWjfHGxy7TqXReRkN6GkxBNt1fNSPtDIyDHISX2kTTBsjK+W22JbtlkBUGEzZguwiUqJKABYZFwU+DELdqxVqb9CGVwrn7Go3RDT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995117; c=relaxed/simple;
	bh=QT598xKSltbEtm8vXGNQ8SdDthsUesBeRaBTzJqOa44=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I5wnS20vfXk/IB4Fel6m1PONmf9l698S9A2VSrE8v4Wi9HooJTP/+gJuLXecHzxL5O+1PW8MHOqj4YjO5jLHkPVasMBPhZ0YfhrJXFNVHFxMBfaEe2A9KYMMEyfBczi8jvR4uu1Ruvgse9+Iy+EKnyNTo7gT5C3XYOMoO00h4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FU5VlZgZ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FU5VlZgZ"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-430fcfe4494so6294321f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 03:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768995112; x=1769599912; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGHQDH6BoNVeJd4cDefcw3Iw7Y0ea3fsAXQePB2iyUs=;
        b=FU5VlZgZAbmHoHz+GecPDAiFk+jCyST92tHlHnBPqG2IRC/nikKZG9Od8o/svBoqtx
         yctXRwQTJ74fPA6EQMGXHqEKlDCb8TGnuNgvIlRlPXHOD+OyiX6I+K5wZkAzXENR4dZs
         9aG4aJHqwuWa7RlcjVg6J5DqZnda//uEf2Vo/bKHBdxrefcO1vMVsjCWiJPUzNaIzVVZ
         g/Ij7qGvypBl4+p8WuYxjE/lM8L5rXX3FLiyHrn0o0gZCYRfK4+M5d5RAVicatOrFVuK
         daqUM3A/aM1RBFfxU3E7rzW2sR+ZrQZmMzzKMekjlN8sKIHvMRn7n2t61vKCGKGx9dr7
         EPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768995112; x=1769599912;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGHQDH6BoNVeJd4cDefcw3Iw7Y0ea3fsAXQePB2iyUs=;
        b=bTjFAD+8aQin+LCpE4CUMie7Na6RQf/o/NGspggfr/McHdhgaea6Uw0sQW9CrWi4cX
         ZSKFdF37aSfvjLA/+eOulPoLmyhgFwcM1ONzUNCoD5xe8WocfItyFE6JnAWIDdEAHwzM
         6amkDkcTVCP2Hr/LD/lo5Wa5vtWkLGABUy6Jdd9V4P22X+z6i9BXFCwVCqOVeLbD4Bsg
         LWanGtfNubDL+99f8S/u49k6POuwEva1e8uN0W29L17KBrGOr+okXyOhRNAcCS0Tcqdf
         bx6sL5Qdjsj246UisrxfVj+mgUZuiz6fwCV1IR3kYbpfL68o6P6Pl0hzIvPzmyJlD+ni
         iUMg==
X-Forwarded-Encrypted: i=1; AJvYcCWbffx8T50+HsR52JAWMI5FESeRXNWgpXwDPgNNOHxcrXfgaubDTqOzaqKBFY4G0kCE7W8HbpnnLjv6itDRuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzk+EkqR9VWdy3Ns3/ezqctEAeIH6XOpcskTk4I3QRaU8GB7TQ
	cca8m5UZRst9aKRDRPp5IJG9dDu4/q/MeuzyXc9SkA3gUjSoib4apCJqyZvI9gL05fzI5CYnRCC
	bc3p+e6r90Oc4zt5W0Q==
X-Received: from wrf23.prod.google.com ([2002:a05:6000:43d7:b0:435:97fd:ed65])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f48:0:b0:431:6ba:38ac with SMTP id ffacd0b85a97d-4356a033204mr24644212f8f.4.1768995112164;
 Wed, 21 Jan 2026 03:31:52 -0800 (PST)
Date: Wed, 21 Jan 2026 11:31:17 +0000
In-Reply-To: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=11911; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=gsy08/pi46UtQSQFtePT4mRLZ3dgJLIJxW9dRSa7MUo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpcLkdA2PFraLMJbUWQJH5xRZjLi6fWKC0BrD/3
 XHW50OrXCiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXC5HQAKCRAEWL7uWMY5
 Rk5hEACmArh2p5dOffCaFjbbfF8wAjZnLbci4H5HAv4AF3AEUcc5WGUOB8Yl7pPt0+IK/L5ORnX
 L/RjBB9ZLWE20bUW1Ctk7KifXTFEdGnZfwfF6YyTs60kgMsX/5qt2YU3nUnhiDksZXLn/wCrBTS
 dByMUpzrO7voCxJZWqmLOmaMLesyMBS9d3CM/JUhPdf6imGGYZKZ/2G1Fx6Oo9r+ndjJfH4tXXk
 ps4dAoehsaVZaS25GPjGOzGRb8sJv/oagR8IdK3KAleipMqkRv1PVwgQkhQzbxqZ19/t1mlxkKn
 DXg6z8p2zaGfTg5WRasTNN86c/0FxYguq6biDSC2tzhzRqdWzrc6iM4H0h3CjG74gCjHypLADhz
 59ka0Ca5JHDvgoSRTKm4ShnvTsye+gr9wQMnwasvcw13PHtcACvhHD2ZX5b2+fdMXFarUna4zVh
 y8MXsNddRE+8BiUJSSHC2/UM9uleykIf7luXAol3vXS2ZYTZ9nb+HUEvjCB7sSIkeZL877w4HvS
 bFTDjcOekP5gYQUMziF3aaq24TSshRtMU0QQHXA3dXZzyVpMCJzLcPvOFslRUF0/0fv9sdr7E9M
 iU1E6i6cZBGdEFAqUjOvCGdyiIj7B9FI9vetG9RGFTY/vVjBy7gJOdzTnneY+JLKbXWDEkUXoXb bfK7jXi3WobDwMw==
X-Mailer: b4 0.14.2
Message-ID: <20260121-gpuvm-rust-v3-1-dd95c04aec35@google.com>
Subject: [PATCH v3 1/6] rust: drm: add base GPUVM immediate mode abstraction
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
index 0000000000000000000000000000000000000000..81b5e767885d8258c44086444b153c91961ffabc
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
+    type Driver: drm::Driver;
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
2.52.0.457.g6b5491de43-goog

