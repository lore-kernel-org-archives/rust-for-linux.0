Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8938736CE19
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783079; cv=none; b=IH1aayf8ld0bZR3xSCDW7wr/ZbHSqJZVpsSZMDp5vHLF+dqpxA4UQp0aO26vI1oxBlNbCrpPpCVJdwiMFqJwfBOxrolis7RXAaMKWDBczIhu8TJB8agcxPCsFpe+vb2BiegwLn8EF3Jeyn+/hhyMZoNmL+tUtbEpPtnZyOQgfQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783079; c=relaxed/simple;
	bh=jgzhuuggRvgfvFa+UYkqzqI+ERjQOxfIuIZZ+mOO67g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tMvjpik/5e+O9YE1UTkiyRW81Np2WXr7QsWqRW0NP3n32JhXJmSyjc403hOGUCO885uAyOCWLypvX/tDZuNhSlpVsq8pLTOfWWPt7EkZQMtuFE3k6uP4XuDDJCceu6i4v+mj9Wv+cXtd/clvMmyf7GlFRgJP9OtB/arH9qg9LSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yCPhcWni; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yCPhcWni"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-430fe16b481so1426944f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 06:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769783076; x=1770387876; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=27748GJnY6LQ5US9SZ5tQooCOHDDmElDfpB/MH1p8m8=;
        b=yCPhcWniQv6O/x0syQpv/4aXNqvgYGJwGCb3pvbzT5Ahb5zzkMQu+dktdoGL5Ib7fP
         nE1Y2qgjaSwQLVGHbJmj2yD4LFeoWarOpQXCdOKwAzNbdfhsupAEtx61l0pzBjb79ZAQ
         7aFCzeaJV7hlWmhDU7NgfT8gKTzLTq75uJKwJeXOK2xev4nOxSOPDRvFWkvdiDguhQMw
         6Q9oHCQK1bI72KA8+J95E7/FePGgLNNpRRdW89W8cVeptedXt1B9CJUqUHb+ztjHlx36
         cnPsKNAflh2lkM0sbKJbjfXuQNLuJpItFECWYiv1/OtR7SnASEiIeoBT/Nsv/HnoPCBX
         9wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769783076; x=1770387876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27748GJnY6LQ5US9SZ5tQooCOHDDmElDfpB/MH1p8m8=;
        b=IzceswgYRkzyMhyi8vWRB+9CTYWH6VUuQeB+nNMGV9S9xR6WQpcnhViGCJnq96VVaX
         c02JQaac45uj2sl/NJm2qfxHQ3aDaB0xUS3vtttLtASk85jtYRb76lyWOfcxA2vvsrdv
         b+2PuIM9qYHouusgJEYnSkIycFtf+Kw+DJea2qC1iu/1gkCHN2kQrI9Y/KJLox1UQyfw
         6ofdQPVD68+UDwGf2Jm5UYJJ3JUHbQoB8oBzy7172VQEcFLHXcLDsuRQiWcbyoLqtFP/
         BgdPqx5htgS7mTiOYJhHSy+9rBlf9EXaf2PZcYIdNIkkNcRwtIR2RoNCTMTRI6oXX7Bl
         ej2g==
X-Forwarded-Encrypted: i=1; AJvYcCU8kNNgY/eNo/YPT6BqPxYpOSYfJyyLTwxpYBQ80T0EgZo1tAu+KNkVAjbWWpfLvn1W1J2L8npuPeJmAHc6HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyjDAB3mf/hbnNpnoDl9DH+pWJ0dRJYAjfXKKdGpAIqdjiirKB
	JkDKfT3H8VRwLLqUg740B+p1+Xh3+XNOXXVwsELXBciHfri6VWPNw+vnFXG/G1pR/19veGuSotN
	6SOnAU4LEufffLqEVyQ==
X-Received: from wmop18.prod.google.com ([2002:a05:600c:4692:b0:477:a4d4:607a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d8c:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-482db4970e2mr39979535e9.33.1769783075895;
 Fri, 30 Jan 2026 06:24:35 -0800 (PST)
Date: Fri, 30 Jan 2026 14:24:14 +0000
In-Reply-To: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=14341; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jgzhuuggRvgfvFa+UYkqzqI+ERjQOxfIuIZZ+mOO67g=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpfL8T2HejB1v/RawIRXHvsE/4tmAvzaeR/cz7h
 qqxkrd7s5uJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXy/EwAKCRAEWL7uWMY5
 Rnh9D/9SohCFHKBAzPMJGvZ4Eo7T9AfaGaSgl5/8DEs/8nQTZ5djjoRp6uiNarsYWm5viaqrcey
 Ubh33pzzSS9s0T/8VhoRTrCC4PTgflduQMLGsMzADpmkdXYcrC6BhLL/dtSWUu0bK7FBXN+zX6x
 YuHbNTl2CKG9zRs4q4/3m80L9F3vQyT52nRAH41pVAOqF2sx1iiXzoCU9YgUZ+/DyfOQnntKMzi
 yLLr9dnZabUvWkPSGw4aQO4vBkhrK7jYLmnf9po2zt/ZH+XGCm5mEXywBlRlnJksTfAMR8873uQ
 V+6hvQe9X4Q/FA/2v///K2TxZ3TGL/SmT69rR7u1VdZoS8+LFSgyRvzDAq8KJYB/TorPTAfFu+K
 gDW5xxwuP0gYc37aUfZrDQIi1RC5zd9rpmbmWjPmpeijz+BN2YxG8BOLfhvmibjpSU21oMVTVwI
 E52km3d3+W7l16T0ph2Z02M1BgpdYxUfFu8DNctYEp18EWNp/5JpH9QJY9j99v47/oGIyRfxClF
 1XoZNEsUrwQXWUIeuTH0wHKB//1PrM42szF88wvZs6+XbMK1OIi7xo/1bX5NOEyLchb0Jyjbc3w
 qUIZIPTKbjdw8hmXIoJsAnif9iQrXn0a8039KdaBrMO9LLD3j7GAaPYXqXR/uYf8DuRSes0FwBF qajHgyVfzhtiWiQ==
X-Mailer: b4 0.14.2
Message-ID: <20260130-gpuvm-rust-v4-5-8364d104ff40@google.com>
Subject: [PATCH v4 5/6] rust: gpuvm: add GpuVmCore::sm_unmap()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Add the entrypoint for unmapping ranges in the GPUVM, and provide
callbacks and VA types for the implementation.

Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs    |  30 ++++-
 rust/kernel/drm/gpuvm/sm_ops.rs | 270 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/gpuvm/va.rs     |   1 -
 rust/kernel/drm/gpuvm/vm_bo.rs  |   8 ++
 4 files changed, 304 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index c8c024ec47b0053d9941465858c0597f0dfd4950..fd4c662f84a4830515c2ddd18d5d503e4ee9fc8f 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -18,6 +18,7 @@
     bindings,
     drm,
     drm::gem::IntoGEMObject,
+    error::to_result,
     prelude::*,
     sync::aref::{
         ARef,
@@ -28,6 +29,7 @@
 
 use core::{
     cell::UnsafeCell,
+    marker::PhantomData,
     mem::{
         ManuallyDrop,
         MaybeUninit, //
@@ -43,12 +45,15 @@
     }, //
 };
 
-mod va;
-pub use self::va::*;
+mod sm_ops;
+pub use self::sm_ops::*;
 
 mod vm_bo;
 pub use self::vm_bo::*;
 
+mod va;
+pub use self::va::*;
+
 /// A DRM GPU VA manager.
 ///
 /// This object is refcounted, but the "core" is only accessible using a special unique handle. The
@@ -89,8 +94,8 @@ const fn vtable() -> &'static bindings::drm_gpuvm_ops {
             vm_bo_free: GpuVmBo::<T>::FREE_FN,
             vm_bo_validate: None,
             sm_step_map: None,
-            sm_step_unmap: None,
-            sm_step_remap: None,
+            sm_step_unmap: Some(Self::sm_step_unmap),
+            sm_step_remap: Some(Self::sm_step_remap),
         }
     }
 
@@ -239,6 +244,23 @@ pub trait DriverGpuVm: Sized {
 
     /// Data stored with each `struct drm_gpuvm_bo`.
     type VmBoData;
+
+    /// The private data passed to callbacks.
+    type SmContext<'ctx>;
+
+    /// Indicates that an existing mapping should be removed.
+    fn sm_step_unmap<'op, 'ctx>(
+        &mut self,
+        op: OpUnmap<'op, Self>,
+        context: &mut Self::SmContext<'ctx>,
+    ) -> Result<OpUnmapped<'op, Self>, Error>;
+
+    /// Indicates that an existing mapping should be split up.
+    fn sm_step_remap<'op, 'ctx>(
+        &mut self,
+        op: OpRemap<'op, Self>,
+        context: &mut Self::SmContext<'ctx>,
+    ) -> Result<OpRemapped<'op, Self>, Error>;
 }
 
 /// The core of the DRM GPU VA manager.
diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs b/rust/kernel/drm/gpuvm/sm_ops.rs
new file mode 100644
index 0000000000000000000000000000000000000000..3f345bce14a18ae88ce525629e3e5b76820e97a6
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/sm_ops.rs
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+use super::*;
+
+/// The actual data that gets threaded through the callbacks.
+struct SmData<'a, 'ctx, T: DriverGpuVm> {
+    gpuvm: &'a mut GpuVmCore<T>,
+    user_context: &'a mut T::SmContext<'ctx>,
+}
+
+/// Represents an `sm_step_unmap` operation that has not yet been completed.
+pub struct OpUnmap<'op, T: DriverGpuVm> {
+    op: &'op bindings::drm_gpuva_op_unmap,
+    // This ensures that 'op is invariant, so that `OpUnmap<'long, T>` does not
+    // coerce to `OpUnmap<'short, T>`. This ensures that the user can't return the
+    // wrong`OpUnmapped` value.
+    _invariant: PhantomData<fn(&'op mut T) -> fn(&'op mut T)>,
+}
+
+impl<'op, T: DriverGpuVm> OpUnmap<'op, T> {
+    /// Indicates whether this [`GpuVa`] is physically contiguous with the
+    /// original mapping request.
+    ///
+    /// Optionally, if `keep` is set, drivers may keep the actual page table
+    /// mappings for this `drm_gpuva`, adding the missing page table entries
+    /// only and update the `drm_gpuvm` accordingly.
+    pub fn keep(&self) -> bool {
+        self.op.keep
+    }
+
+    /// The range being unmapped.
+    pub fn va(&self) -> &GpuVa<T> {
+        // SAFETY: This is a valid va.
+        unsafe { GpuVa::<T>::from_raw(self.op.va) }
+    }
+
+    /// Remove the VA.
+    pub fn remove(self) -> (OpUnmapped<'op, T>, GpuVaRemoved<T>) {
+        // SAFETY: The op references a valid drm_gpuva in the GPUVM.
+        unsafe { bindings::drm_gpuva_unmap(self.op) };
+        // SAFETY: The va is no longer in the interval tree so we may unlink it.
+        unsafe { bindings::drm_gpuva_unlink_defer(self.op.va) };
+
+        // SAFETY: We just removed this va from the `GpuVm<T>`.
+        let va = unsafe { GpuVaRemoved::from_raw(self.op.va) };
+
+        (
+            OpUnmapped {
+                _invariant: self._invariant,
+            },
+            va,
+        )
+    }
+}
+
+/// Represents a completed [`OpUnmap`] operation.
+pub struct OpUnmapped<'op, T> {
+    _invariant: PhantomData<fn(&'op mut T) -> fn(&'op mut T)>,
+}
+
+/// Represents an `sm_step_remap` operation that has not yet been completed.
+pub struct OpRemap<'op, T: DriverGpuVm> {
+    op: &'op bindings::drm_gpuva_op_remap,
+    // This ensures that 'op is invariant, so that `OpRemap<'long, T>` does not
+    // coerce to `OpRemap<'short, T>`. This ensures that the user can't return the
+    // wrong`OpRemapped` value.
+    _invariant: PhantomData<fn(&'op mut T) -> fn(&'op mut T)>,
+}
+
+impl<'op, T: DriverGpuVm> OpRemap<'op, T> {
+    /// The preceding part of a split mapping.
+    #[inline]
+    pub fn prev(&self) -> Option<&OpRemapMapData> {
+        // SAFETY: We checked for null, so the pointer must be valid.
+        NonNull::new(self.op.prev).map(|ptr| unsafe { OpRemapMapData::from_raw(ptr) })
+    }
+
+    /// The subsequent part of a split mapping.
+    #[inline]
+    pub fn next(&self) -> Option<&OpRemapMapData> {
+        // SAFETY: We checked for null, so the pointer must be valid.
+        NonNull::new(self.op.next).map(|ptr| unsafe { OpRemapMapData::from_raw(ptr) })
+    }
+
+    /// Indicates whether the `drm_gpuva` being removed is physically contiguous with the original
+    /// mapping request.
+    ///
+    /// Optionally, if `keep` is set, drivers may keep the actual page table mappings for this
+    /// `drm_gpuva`, adding the missing page table entries only and update the `drm_gpuvm`
+    /// accordingly.
+    #[inline]
+    pub fn keep(&self) -> bool {
+        // SAFETY: The unmap pointer is always valid.
+        unsafe { (*self.op.unmap).keep }
+    }
+
+    /// The range being unmapped.
+    #[inline]
+    pub fn va_to_unmap(&self) -> &GpuVa<T> {
+        // SAFETY: This is a valid va.
+        unsafe { GpuVa::<T>::from_raw((*self.op.unmap).va) }
+    }
+
+    /// The [`drm_gem_object`](crate::gem::Object) whose VA is being remapped.
+    #[inline]
+    pub fn obj(&self) -> &T::Object {
+        self.va_to_unmap().obj()
+    }
+
+    /// The [`GpuVmBo`] that is being remapped.
+    #[inline]
+    pub fn vm_bo(&self) -> &GpuVmBo<T> {
+        self.va_to_unmap().vm_bo()
+    }
+
+    /// Update the GPUVM to perform the remapping.
+    pub fn remap(
+        self,
+        va_alloc: [GpuVaAlloc<T>; 2],
+        prev_data: impl PinInit<T::VaData>,
+        next_data: impl PinInit<T::VaData>,
+    ) -> (OpRemapped<'op, T>, OpRemapRet<T>) {
+        let [va1, va2] = va_alloc;
+
+        let mut unused_va = None;
+        let mut prev_ptr = ptr::null_mut();
+        let mut next_ptr = ptr::null_mut();
+        if self.prev().is_some() {
+            prev_ptr = va1.prepare(prev_data);
+        } else {
+            unused_va = Some(va1);
+        }
+        if self.next().is_some() {
+            next_ptr = va2.prepare(next_data);
+        } else {
+            unused_va = Some(va2);
+        }
+
+        // SAFETY: the pointers are non-null when required
+        unsafe { bindings::drm_gpuva_remap(prev_ptr, next_ptr, self.op) };
+
+        let gpuva_guard = self.vm_bo().lock_gpuva();
+        if !prev_ptr.is_null() {
+            // SAFETY: The prev_ptr is a valid drm_gpuva prepared for insertion. The vm_bo is still
+            // valid as the not-yet-unlinked gpuva holds a refcount on the vm_bo.
+            unsafe { bindings::drm_gpuva_link(prev_ptr, self.vm_bo().as_raw()) };
+        }
+        if !next_ptr.is_null() {
+            // SAFETY: The next_ptr is a valid drm_gpuva prepared for insertion. The vm_bo is still
+            // valid as the not-yet-unlinked gpuva holds a refcount on the vm_bo.
+            unsafe { bindings::drm_gpuva_link(next_ptr, self.vm_bo().as_raw()) };
+        }
+        drop(gpuva_guard);
+
+        // SAFETY: The va is no longer in the interval tree so we may unlink it.
+        unsafe { bindings::drm_gpuva_unlink_defer((*self.op.unmap).va) };
+
+        (
+            OpRemapped {
+                _invariant: self._invariant,
+            },
+            OpRemapRet {
+                // SAFETY: We just removed this va from the `GpuVm<T>`.
+                unmapped_va: unsafe { GpuVaRemoved::from_raw((*self.op.unmap).va) },
+                unused_va,
+            },
+        )
+    }
+}
+
+/// Part of an [`OpRemap`] that represents a new mapping.
+#[repr(transparent)]
+pub struct OpRemapMapData(bindings::drm_gpuva_op_map);
+
+impl OpRemapMapData {
+    /// # Safety
+    /// Must reference a valid `drm_gpuva_op_map` for duration of `'a`.
+    unsafe fn from_raw<'a>(ptr: NonNull<bindings::drm_gpuva_op_map>) -> &'a Self {
+        // SAFETY: ok per safety requirements
+        unsafe { ptr.cast().as_ref() }
+    }
+
+    /// The base address of the new mapping.
+    pub fn addr(&self) -> u64 {
+        self.0.va.addr
+    }
+
+    /// The length of the new mapping.
+    pub fn length(&self) -> u64 {
+        self.0.va.range
+    }
+
+    /// The offset within the [`drm_gem_object`](crate::gem::Object).
+    pub fn gem_offset(&self) -> u64 {
+        self.0.gem.offset
+    }
+}
+
+/// Struct containing objects removed or not used by [`OpRemap::remap`].
+pub struct OpRemapRet<T: DriverGpuVm> {
+    /// The `drm_gpuva` that was removed.
+    pub unmapped_va: GpuVaRemoved<T>,
+    /// If the remap did not split the region into two pieces, then the unused `drm_gpuva` is
+    /// returned here.
+    pub unused_va: Option<GpuVaAlloc<T>>,
+}
+
+/// Represents a completed [`OpRemap`] operation.
+pub struct OpRemapped<'op, T> {
+    _invariant: PhantomData<fn(&'op mut T) -> fn(&'op mut T)>,
+}
+
+impl<T: DriverGpuVm> GpuVmCore<T> {
+    /// Remove any mappings in the given region.
+    ///
+    /// Internally calls [`DriverGpuVm::sm_step_unmap`] for ranges entirely contained within the
+    /// given range, and [`DriverGpuVm::sm_step_remap`] for ranges that overlap with the range.
+    #[inline]
+    pub fn sm_unmap(&mut self, addr: u64, length: u64, context: &mut T::SmContext<'_>) -> Result {
+        let gpuvm = self.as_raw();
+        let mut p = SmData {
+            gpuvm: self,
+            user_context: context,
+        };
+        // SAFETY:
+        // * raw_request() creates a valid request.
+        // * The private data is valid to be interpreted as SmData.
+        to_result(unsafe { bindings::drm_gpuvm_sm_unmap(gpuvm, (&raw mut p).cast(), addr, length) })
+    }
+}
+
+impl<T: DriverGpuVm> GpuVm<T> {
+    /// # Safety
+    /// Must be called from `sm_unmap` with a pointer to `SmData`.
+    pub(super) unsafe extern "C" fn sm_step_unmap(
+        op: *mut bindings::drm_gpuva_op,
+        p: *mut c_void,
+    ) -> c_int {
+        // SAFETY: The caller provides a pointer to `SmData`.
+        let p = unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
+        let op = OpUnmap {
+            // SAFETY: sm_step_unmap is called with an unmap operation.
+            op: unsafe { &(*op).__bindgen_anon_1.unmap },
+            _invariant: PhantomData,
+        };
+        match p.gpuvm.data().sm_step_unmap(op, p.user_context) {
+            Ok(OpUnmapped { .. }) => 0,
+            Err(err) => err.to_errno(),
+        }
+    }
+
+    /// # Safety
+    /// Must be called from `sm_unmap` with a pointer to `SmData`.
+    pub(super) unsafe extern "C" fn sm_step_remap(
+        op: *mut bindings::drm_gpuva_op,
+        p: *mut c_void,
+    ) -> c_int {
+        // SAFETY: The caller provides a pointer to `SmData`.
+        let p = unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
+        let op = OpRemap {
+            // SAFETY: sm_step_remap is called with a remap operation.
+            op: unsafe { &(*op).__bindgen_anon_1.remap },
+            _invariant: PhantomData,
+        };
+        match p.gpuvm.data().sm_step_remap(op, p.user_context) {
+            Ok(OpRemapped { .. }) => 0,
+            Err(err) => err.to_errno(),
+        }
+    }
+}
diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
index c96796a6b2c8c7c4b5475324562968ca0f07fd09..a31122ff22282186a1d76d4bb085714f6465722b 100644
--- a/rust/kernel/drm/gpuvm/va.rs
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 
-#![expect(dead_code)]
 use super::*;
 
 /// Represents that a range of a GEM object is mapped in this [`GpuVm`] instance.
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index 272e1a83c2d5f43c42dbdd9e09f51394a1e855b6..e8570f321c107be44fe2e463c88e2760fa197dfa 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -100,6 +100,14 @@ pub fn obj(&self) -> &T::Object {
     pub fn data(&self) -> &T::VmBoData {
         &self.data
     }
+
+    pub(super) fn lock_gpuva(&self) -> crate::sync::MutexGuard<'_, ()> {
+        // SAFETY: The GEM object is valid.
+        let ptr = unsafe { &raw mut (*self.obj().as_raw()).gpuva.lock };
+        // SAFETY: The GEM object is valid, so the mutex is properly initialized.
+        let mutex = unsafe { crate::sync::Mutex::from_raw(ptr) };
+        mutex.lock()
+    }
 }
 
 /// A pre-allocated [`GpuVmBo`] object.

-- 
2.53.0.rc1.225.gd81095ad13-goog

