Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64153CFF4E
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022928; cv=none; b=SjTctQFsh/GCOl56db+8SrUEHbIISuBVAdkO9mGzKPVN35GTWg1MoyRof8MyK0VsFeHcAEhgC/X+gVdoQ7qsNkcxb2zVYtw7/I4akaN9dfB9NhGBCxtUeZ09oFijhIiS9DBREgDmh0PgnQe6Q+xlQM+N8l0EcaMa6nJ2cNu6vWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022928; c=relaxed/simple;
	bh=YP9pNPeNfXJOzTxZQ1Z8+iVttV0lADSArhe2qrwpJas=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rZ+foj5YAcuCBIMm2vy5VLzQV7aeVHJPKh9xqsdXlemyMGG8PVjn/7iy/92OL4noeQI14ekbgEPdgujm5R5w6m1zFDipfSV3HkFwkDmR1Dt8Mo6c0hpPxJ+CFRFR8rhvg184td8qxW42qp0F40+U2Ja9JQrBFcBsZnoYoruXFRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N0hOuk1q; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N0hOuk1q"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439a85832c0so1660456f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 09:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022924; x=1774627724; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AouGft0bx+9AXi5MVuNtcImb+EKH7/hONBpgoj18nJk=;
        b=N0hOuk1q4O9UJdP+IbcrKHHN6e+MPuif6gA3waebsvbipRh2wQzeyDeTUhA6TSrwPh
         WrMoBp85kymVVF8Mjjn7QooETdhSpWx28L5mNwLi/QCmR+Hs0lsTkd4Dfj7JO/wv7QfC
         exo8Akaz0wYfoYNjf9ahZOLtl/5mx9rnR+yNgL0vc59Btyp5ZUtRnZlmkaWFY3n4r+wx
         XHoumqRts0RYviyiBcD5lAbM7OC9lBRBrGufvNsgGz/FQMUkkJtjWlllNcVcN401g+x9
         zlzGKNYTqH/ihUERLawAhhyzxIAtKq0bvhv7xN/QqApXswRPZp6jw1QsmR6yVtfK/hKR
         S1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022924; x=1774627724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AouGft0bx+9AXi5MVuNtcImb+EKH7/hONBpgoj18nJk=;
        b=GeecA8zrjvrKT4FxG0Qc3vik5v/1Jgo1nXR61Ln6WHRJaTCb+NAYytWPAXzRLXD0WU
         KvcchA5qZn7P8usMkaLcgvUTO7YgUADjZKssOFSmX7aod3gRft94K+AVI74MUrZWgT3x
         nEvOmCPWM6UJyDIt/tywCy3+lHWdN/K9wc1FugOYKheM32KGgYklOrzZGyTWaBDp2ika
         D2ptd7lP6Fuk6JY+gFfXjGATQzebtV/KtFXFCL0/NpmCPtWPhGBbjlkVSAzKacoWgE2y
         GLLtDTgj7BbgIhQ7qMMkRhMDMc5CQoGhiOfhkj0XbPJfy4ANn+JWOVjj8Rkc59pAc2MN
         YZkA==
X-Forwarded-Encrypted: i=1; AJvYcCVnHOcuWHTI4nMpY4rVGheY1+oS9ABDBx7DQ27FJDEj+DZmjvmo5W5Xz3k2lZsPMVlLW9D/eJWZI3zrRbMPEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvPV1UNerHrGW0u6pLZ4wgMOpmwjJy/CfnSdPr0vioreqYWXyM
	uYCPTHLxLHzjA4Wq3KAK2o0lx0NDQypXvCS7+ro51DYhGLJULDpQr6mX0VNbaASWH2w8Ix+4Fgg
	rdeMJ7hUNvq6OZNUjsw==
X-Received: from wmpd23.prod.google.com ([2002:a05:600c:4c17:b0:483:29f4:26b8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c111:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-486ff024da8mr37521875e9.20.1774022924188;
 Fri, 20 Mar 2026 09:08:44 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:08:29 +0000
In-Reply-To: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=14053; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=YP9pNPeNfXJOzTxZQ1Z8+iVttV0lADSArhe2qrwpJas=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpvXECqvWiWpo3fTo0JRHXwoFOtJtUNNuNs2rWb
 i2LKx40mPKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCab1xAgAKCRAEWL7uWMY5
 RkaPD/94IQtMcgikWvw0IY0sGoaz8Vzi6w2cqmyeTOs7uA+UXeVputHDSN5edrYzjsAdL8cu/Cc
 K2l+/C+eHFz28EiYM9nh0onoLIEg12g6l+G7DWypuMFOzlJhmX3gxDwuFaQGZdaL3cG999ROX62
 PzSNZqBMOoZ/38TjDG+Ucc7dxBDMoRLwr8ZT/uAW2Aa+r1WzGTNbbzQjpuP3MBbnEGJ54P9+SAG
 ZUQS9GiPL9xfv8diFyVlOoee0fffqAcQDt/SqTY0gMmnl/zenTwvU8VbQ7nAYzoDCkba/F3YZJK
 f9TGaE79HQbnQp9NtUtrtTp6tP/tOdQDlqKNDFbmAtG/5+Mx2YPP2DVHTxSbxKto5mKUmG2B8b/
 3ATUiqerGWTLF+1rHbmZC2taA/NnGyq8LYim/qChpOOZi8sh/Tv2MAt6/7fIPphOGvljAqvgi7t
 MFQZZGWYjz3QLo93drSDpmsnkUas9X/+um7+ckHg7qi8CwJv0h035k+Lkz2sK5AxpLjUJaUJjr6
 D5bOmrTa8kbqEwnrEW8++dmrPFWxa3htbkZoecU+NMgHHpNv6oSoIIgeaHhL4wNuirssfgJY6fB
 jEdhCOLIKLEG28+HW4Rkz4fZHsHl18ZgyyMT7TR1hpBEDLjR8wCe+huDXaA4qeG0kg8n92gfgrN MoFRI464M5pXUYw==
X-Mailer: b4 0.14.3
Message-ID: <20260320-gpuvm-rust-v5-5-76fd44f17a87@google.com>
Subject: [PATCH v5 5/6] rust: gpuvm: add GpuVmCore::sm_unmap()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-media@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
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
index 2eb4fb0f9839..dca72e7b2b89 100644
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
 /// This object is refcounted, but the locations of mapped ranges may only be accessed or changed
@@ -94,8 +99,8 @@ const fn vtable() -> &'static bindings::drm_gpuvm_ops {
             vm_bo_free: GpuVmBo::<T>::FREE_FN,
             vm_bo_validate: None,
             sm_step_map: None,
-            sm_step_unmap: None,
-            sm_step_remap: None,
+            sm_step_unmap: Some(Self::sm_step_unmap),
+            sm_step_remap: Some(Self::sm_step_remap),
         }
     }
 
@@ -246,6 +251,23 @@ pub trait DriverGpuVm: Sized {
 
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
index 000000000000..ab802a07e4be
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/sm_ops.rs
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+use super::*;
+
+/// The actual data that gets threaded through the callbacks.
+struct SmData<'a, 'ctx, T: DriverGpuVm> {
+    gpuvm: &'a mut UniqueRefGpuVm<T>,
+    user_context: &'a mut T::SmContext<'ctx>,
+}
+
+/// Represents an `sm_step_unmap` operation that has not yet been completed.
+pub struct OpUnmap<'op, T: DriverGpuVm> {
+    op: &'op bindings::drm_gpuva_op_unmap,
+    // This ensures that 'op is invariant, so that `OpUnmap<'long, T>` does not
+    // coerce to `OpUnmap<'short, T>`. This ensures that the user can't return the
+    // wrong`OpUnmapped` value.
+    _invariant: PhantomData<*mut &'op mut T>,
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
+    _invariant: PhantomData<*mut &'op mut T>,
+}
+
+/// Represents an `sm_step_remap` operation that has not yet been completed.
+pub struct OpRemap<'op, T: DriverGpuVm> {
+    op: &'op bindings::drm_gpuva_op_remap,
+    // This ensures that 'op is invariant, so that `OpRemap<'long, T>` does not
+    // coerce to `OpRemap<'short, T>`. This ensures that the user can't return the
+    // wrong`OpRemapped` value.
+    _invariant: PhantomData<*mut &'op mut T>,
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
+    _invariant: PhantomData<*mut &'op mut T>,
+}
+
+impl<T: DriverGpuVm> UniqueRefGpuVm<T> {
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
index 540f525bb56d..654e5ca09bcb 100644
--- a/rust/kernel/drm/gpuvm/va.rs
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 
-#![expect(dead_code)]
 use super::*;
 
 /// Represents that a range of a GEM object is mapped in this [`GpuVm`] instance.
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index 7fd1d301fd41..098dbd7f9aa4 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -136,6 +136,14 @@ pub fn obj(&self) -> &T::Object {
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
2.53.0.959.g497ff81fa9-goog

