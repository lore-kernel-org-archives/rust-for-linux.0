Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C145F3CF053
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022925; cv=none; b=ifEDii9VS2WJVJmhA1fRqP8SeEfd1Vq72mjmFdIH7MDREmHoX2t+H0BvbKfWHBVWHLbovqq2k4wuPozPWWCBKay3pL2gv6a8yKdJNnt9ChebK1L67qNvVsVfN77tU+YcZEe3ehFNbjmrVbX+REaCgM0Jx7AOnj19dKoyVhF1Wu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022925; c=relaxed/simple;
	bh=n3i27r8Uj1K9Jua9JJ5lqChjmq+OSy3eVxOiFxWTgKs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KCKDcbgz4CUe9E/GJJ1JPLojhIZNAEFkjSWva8dJY1MSlqoAhV2tUWOggLh0K+SE9wck/SR8vC1St8gn81QoHaBgzFMXs5NNinIIwrY4lnr5a+K/7J9TiqZkXj7Kvxx0WCuKoE/pwzb7HHkN8H9iIY5o75HJwbMW6F872mNnAo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XxkchYkR; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XxkchYkR"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43b3a675316so1839105f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022921; x=1774627721; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Igsa35Q/abhqbKOPMwTPoyThyZXwfOe3ZKKrgGUnE38=;
        b=XxkchYkR/J7/OMrN3UVqc4Xbyawk2nspqNhc+KCuyhTOZDRkYro7PxcT5wX4npEXIy
         V/BWdVY42UoEmWMdZ+ox+Jd4c11abyjP/wtv1GjU+41t+r4jmyO2UZ6gKlmnhTjk4+Bi
         vfAIlw0eAHuiHRjhScCsn9L8dvh/bb//vrmThFnWJ//SWynKYScFCsiXpm2Op/POeo5E
         mlS7fWjC1oeSm25TlDE6tc2HfJO0+o0TYJC2Ez58ISLSmxqwYO42crrQBlgY7K4aK8DT
         PFVsyJBsEoXVFYCMcSM6NGInsZstEHCQT/KvoCsVyAanFDOFPN/JKEpfVVFK147fqb4Q
         vD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022921; x=1774627721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Igsa35Q/abhqbKOPMwTPoyThyZXwfOe3ZKKrgGUnE38=;
        b=GrWRo+raJj+0tF8PS2ZWKe+mf4kynoi3ly5TnPmQ0C9hXgLaSX7He2Y3k6i6FCk3+V
         9qmFjxC/7nd3eX5EQ9elctBKK7glBxcLBkp4gK8/fRQTJAfasOnblxac4f5rYAqertOX
         FlsVh/kLrI4/fepgEfpjAw8V0C2VIQYSECdNgM/MnVEE0g1z05AxgUTbl++szmc449ao
         U3m8Gaco25k+hKXttjhXOpRB0bOdVZx+c0VQQRemec8c10MMQOjuTM1wepktS04zhmI6
         XvYQeO7o1D48QxS1orqFbfIYTzu5RoWcEEA+borEIWgRaHbFcHLvoDSlzim8g8U6Jrag
         qJXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/PApOMI3CGw9yov8WZGg4FdnOjB6po+rKarL5pP9TVQJxLbnsqkJx9WDzyuQ6Lqq5bUEZYASY4W0SoEviwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvaqmvkZl8WxBK1xnVHWDK4E70xyp0opA7CZNBhKO5Azws6idQ
	qWXFPPcGGZ/Px6DrNDhUsJLw2UORi7aSVPsql4xa/GNvI1yQsHIzCeXly+koSTilBBlAbTghoPH
	KS7HuthbKvRg0xfbcUA==
X-Received: from wrwn9.prod.google.com ([2002:a5d:67c9:0:b0:439:b81f:ad99])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f84:b0:43b:4d2e:a004 with SMTP id ffacd0b85a97d-43b64242f00mr6010280f8f.10.1774022920836;
 Fri, 20 Mar 2026 09:08:40 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:08:27 +0000
In-Reply-To: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=13926; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=n3i27r8Uj1K9Jua9JJ5lqChjmq+OSy3eVxOiFxWTgKs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpvXECzP7ZocGSSzsHAKUlGZh0W8Rs/EEFE/Chd
 WOKGnKJG8iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCab1xAgAKCRAEWL7uWMY5
 RgmcD/9ALk+plFEngOFLXrpDHniFei2T0g9ABTC9MLlSIJ6fuG1nrGGmK2jue4BtBf/fWyeIGHZ
 LPc209/72ZbAm/HZ9EiqHp48Mc5FUKOABRxou1BsTDrf6XIN3kzfURJ/rNQRcyaz6m5yRI/esO/
 sX1EOx03qxdzcSTeFTGmxCWa3JOotn8TeQDIpkoZmeaCqqJIzhfP0fLGcBAPPcSqV062QXpKoD2
 Xc8UTJeu4aA2bZ6OyCjLKkqcfz1NM35NdLEHw7XJQEfiLEe3L9XeEEHrZeleP9TP6p3fOkq6l+l
 ST7PFiehIi92TV5F9qyUCtz2BuoZ9yr/F3vy16w2gA1kROVTF4h4h5YCJLv+ejMsSpgH8flbjqP
 00x7o9bH9omusaUUqF+yyZCW+lKzvzvjLBT3AR/h+aPYAEsCy4nAYGRPwko9UuYShHHJulfiBNS
 sbD5i6mG0wger1TN2kkZguMuk9G3JOY3WHmMSpsRxcDqgddY/RO7CZoglQFPswqiP3VXHV84prC
 VqgBmiP3CdQlvKyP21830kFP0qf/DYldsqQDuCjaKli0i/8voCLPFLZhkiFpxQ8ssROLBPnwgMW
 T7oUxbMSahs2lv+133PxrdvxBQLG5nfKwCfIl6toybf3nObQV34roAZORnLbF8EBad2MlF1jQJ0 aOUsab+c842ZU9A==
X-Mailer: b4 0.14.3
Message-ID: <20260320-gpuvm-rust-v5-3-76fd44f17a87@google.com>
Subject: [PATCH v5 3/6] rust: gpuvm: add GpuVm::obtain()
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

This provides a mechanism to create (or look up) VMBO instances, which
represent the mapping between GPUVM and GEM objects.

The GpuVmBoRegistered<T> type can be considered like ARef<GpuVm<T>>,
except that no way to increment the refcount is provided.

The GpuVmBoAlloc<T> type is more akin to a pre-allocated GpuVmBo<T>, so
it's not really a GpuVmBo<T> yet. Its destructor could call
drm_gpuvm_bo_destroy_not_in_lists(), but as the type is currently
private and never called anywhere, this perf optimization does not need
to happen now.

Pre-allocating and obtaining the gpuvm_bo object is exposed as a single
step. This could theoretically be a problem if one wanted to call
drm_gpuvm_bo_obtain_prealloc() during the fence signalling critical
path, but that's not a possibility because:

1. Adding the BO to the extobj list requires the resv lock, so it cannot
   happen during the fence signalling critical path.
2. obtain() requires that the BO is not in the extobj list, so obtain()
   must be called before adding the BO to the extobj list.

Thus, drm_gpuvm_bo_obtain_prealloc() cannot be called during the fence
signalling critical path. (For extobjs at least.)

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/drm_gpuvm.c       |   6 ++
 rust/kernel/drm/gpuvm/mod.rs   |  32 +++++-
 rust/kernel/drm/gpuvm/vm_bo.rs | 227 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 262 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
index 18cf104a8bc7..ca959d9a66f6 100644
--- a/rust/helpers/drm_gpuvm.c
+++ b/rust/helpers/drm_gpuvm.c
@@ -4,6 +4,12 @@
 
 #include <drm/drm_gpuvm.h>
 
+__rust_helper
+struct drm_gpuvm_bo *rust_helper_drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
+{
+	return drm_gpuvm_bo_get(vm_bo);
+}
+
 __rust_helper
 struct drm_gpuvm *rust_helper_drm_gpuvm_get(struct drm_gpuvm *obj)
 {
diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 5086625bbbe7..40446e679844 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -25,13 +25,20 @@
 
 use core::{
     cell::UnsafeCell,
+    mem::ManuallyDrop,
     ops::{
         Deref,
         Range, //
     },
-    ptr::NonNull, //
+    ptr::{
+        self,
+        NonNull, //
+    }, //
 };
 
+mod vm_bo;
+pub use self::vm_bo::*;
+
 /// A DRM GPU VA manager.
 ///
 /// This object is refcounted, but the locations of mapped ranges may only be accessed or changed
@@ -73,8 +80,8 @@ const fn vtable() -> &'static bindings::drm_gpuvm_ops {
             vm_free: Some(Self::vm_free),
             op_alloc: None,
             op_free: None,
-            vm_bo_alloc: None,
-            vm_bo_free: None,
+            vm_bo_alloc: GpuVmBo::<T>::ALLOC_FN,
+            vm_bo_free: GpuVmBo::<T>::FREE_FN,
             vm_bo_validate: None,
             sm_step_map: None,
             sm_step_unmap: None,
@@ -173,6 +180,16 @@ pub fn va_range(&self) -> Range<u64> {
         Range { start, end }
     }
 
+    /// Get or create the [`GpuVmBo`] for this gem object.
+    #[inline]
+    pub fn obtain(
+        &self,
+        obj: &T::Object,
+        data: impl PinInit<T::VmBoData>,
+    ) -> Result<ARef<GpuVmBo<T>>, AllocError> {
+        Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
+    }
+
     /// Clean up buffer objects that are no longer used.
     #[inline]
     pub fn deferred_cleanup(&self) {
@@ -198,6 +215,12 @@ pub fn is_extobj(&self, obj: &T::Object) -> bool {
         // SAFETY: By type invariants we can free it when refcount hits zero.
         drop(unsafe { KBox::from_raw(me) })
     }
+
+    #[inline]
+    fn raw_resv(&self) -> *mut bindings::dma_resv {
+        // SAFETY: `r_obj` is immutable and valid for duration of GPUVM.
+        unsafe { (*(*self.as_raw()).r_obj).resv }
+    }
 }
 
 /// The manager for a GPUVM.
@@ -207,6 +230,9 @@ pub trait DriverGpuVm: Sized {
 
     /// The kind of GEM object stored in this GPUVM.
     type Object: IntoGEMObject;
+
+    /// Data stored with each `struct drm_gpuvm_bo`.
+    type VmBoData;
 }
 
 /// The core of the DRM GPU VA manager.
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
new file mode 100644
index 000000000000..b51c6f106185
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+use super::*;
+
+/// Represents that a given GEM object has at least one mapping on this [`GpuVm`] instance.
+///
+/// Does not assume that GEM lock is held.
+///
+/// # Invariants
+///
+/// * Allocated with `kmalloc` and refcounted via `inner`.
+/// * Is present in the gem list.
+#[repr(C)]
+#[pin_data]
+pub struct GpuVmBo<T: DriverGpuVm> {
+    #[pin]
+    inner: Opaque<bindings::drm_gpuvm_bo>,
+    #[pin]
+    data: T::VmBoData,
+}
+
+// SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
+unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
+    fn inc_ref(&self) {
+        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
+        unsafe { bindings::drm_gpuvm_bo_get(self.inner.get()) };
+    }
+
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // CAST: `drm_gpuvm_bo` is first field of repr(C) struct.
+        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
+        // This GPUVM instance uses immediate mode, so we may put the refcount using the deferred
+        // mechanism.
+        unsafe { bindings::drm_gpuvm_bo_put_deferred(obj.as_ptr().cast()) };
+    }
+}
+
+impl<T: DriverGpuVm> GpuVmBo<T> {
+    /// The function pointer for allocating a GpuVmBo stored in the gpuvm vtable.
+    ///
+    /// Allocation is always implemented according to [`Self::vm_bo_alloc`], but it is set to
+    /// `None` if the default gpuvm behavior is the same as `vm_bo_alloc`.
+    ///
+    /// This may be `Some` even if `FREE_FN` is `None`, or vice-versa.
+    pub(super) const ALLOC_FN: Option<unsafe extern "C" fn() -> *mut bindings::drm_gpuvm_bo> = {
+        use core::alloc::Layout;
+        let base = Layout::new::<bindings::drm_gpuvm_bo>();
+        let rust = Layout::new::<Self>();
+        assert!(base.size() <= rust.size());
+        if base.size() != rust.size() || base.align() != rust.align() {
+            Some(Self::vm_bo_alloc)
+        } else {
+            // This causes GPUVM to allocate a `GpuVmBo<T>` with `kzalloc(sizeof(drm_gpuvm_bo))`.
+            None
+        }
+    };
+
+    /// The function pointer for freeing a GpuVmBo stored in the gpuvm vtable.
+    ///
+    /// Freeing is always implemented according to [`Self::vm_bo_free`], but it is set to `None` if
+    /// the default gpuvm behavior is the same as `vm_bo_free`.
+    ///
+    /// This may be `Some` even if `ALLOC_FN` is `None`, or vice-versa.
+    pub(super) const FREE_FN: Option<unsafe extern "C" fn(*mut bindings::drm_gpuvm_bo)> = {
+        if core::mem::needs_drop::<Self>() {
+            Some(Self::vm_bo_free)
+        } else {
+            // This causes GPUVM to free a `GpuVmBo<T>` with `kfree`.
+            None
+        }
+    };
+
+    /// Custom function for allocating a `drm_gpuvm_bo`.
+    ///
+    /// # Safety
+    ///
+    /// Always safe to call.
+    unsafe extern "C" fn vm_bo_alloc() -> *mut bindings::drm_gpuvm_bo {
+        let raw_ptr = KBox::<Self>::new_uninit(GFP_KERNEL | __GFP_ZERO)
+            .map(KBox::into_raw)
+            .unwrap_or(ptr::null_mut());
+
+        // CAST: `drm_gpuvm_bo` is first field of `Self`.
+        raw_ptr.cast()
+    }
+
+    /// Custom function for freeing a `drm_gpuvm_bo`.
+    ///
+    /// # Safety
+    ///
+    /// The pointer must have been allocated with [`GpuVmBo::ALLOC_FN`], and must not be used after
+    /// this call.
+    unsafe extern "C" fn vm_bo_free(ptr: *mut bindings::drm_gpuvm_bo) {
+        // CAST: `drm_gpuvm_bo` is first field of `Self`.
+        // SAFETY:
+        // * The ptr was allocated from kmalloc with the layout of `GpuVmBo<T>`.
+        // * `ptr->inner` has no destructor.
+        // * `ptr->data` contains a valid `T::VmBoData` that we can drop.
+        drop(unsafe { KBox::<Self>::from_raw(ptr.cast()) });
+    }
+
+    /// Access this [`GpuVmBo`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of `'a`, the pointer must reference a valid `drm_gpuvm_bo` associated with
+    /// a [`GpuVm<T>`]. The BO must also be present in the GEM list.
+    #[inline]
+    #[expect(dead_code)]
+    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuvm_bo) -> &'a Self {
+        // SAFETY: `drm_gpuvm_bo` is first field and `repr(C)`.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns a raw pointer to underlying C value.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
+        self.inner.get()
+    }
+
+    /// The [`GpuVm`] that this GEM object is mapped in.
+    #[inline]
+    pub fn gpuvm(&self) -> &GpuVm<T> {
+        // SAFETY: The `obj` pointer is guaranteed to be valid.
+        unsafe { GpuVm::<T>::from_raw((*self.inner.get()).vm) }
+    }
+
+    /// The [`drm_gem_object`](crate::gem::Object) for these mappings.
+    #[inline]
+    pub fn obj(&self) -> &T::Object {
+        // SAFETY: The `obj` pointer is guaranteed to be valid.
+        unsafe { <T::Object as IntoGEMObject>::from_raw((*self.inner.get()).obj) }
+    }
+
+    /// The driver data with this buffer object.
+    #[inline]
+    pub fn data(&self) -> &T::VmBoData {
+        &self.data
+    }
+}
+
+/// A pre-allocated [`GpuVmBo`] object.
+///
+/// # Invariants
+///
+/// Points at a `drm_gpuvm_bo` that contains a valid `T::VmBoData`, has a refcount of one, and is
+/// absent from any gem, extobj, or evict lists.
+pub(super) struct GpuVmBoAlloc<T: DriverGpuVm>(NonNull<GpuVmBo<T>>);
+
+impl<T: DriverGpuVm> GpuVmBoAlloc<T> {
+    /// Create a new pre-allocated [`GpuVmBo`].
+    ///
+    /// It's intentional that the initializer is infallible because `drm_gpuvm_bo_put` will call
+    /// drop on the data, so we don't have a way to free it when the data is missing.
+    #[inline]
+    pub(super) fn new(
+        gpuvm: &GpuVm<T>,
+        gem: &T::Object,
+        value: impl PinInit<T::VmBoData>,
+    ) -> Result<GpuVmBoAlloc<T>, AllocError> {
+        // CAST: `GpuVmBoAlloc::vm_bo_alloc` ensures that this memory was allocated with the layout
+        // of `GpuVmBo<T>`. The type is repr(C), so `container_of` is not required.
+        // SAFETY: The provided gpuvm and gem ptrs are valid for the duration of this call.
+        let raw_ptr = unsafe {
+            bindings::drm_gpuvm_bo_create(gpuvm.as_raw(), gem.as_raw()).cast::<GpuVmBo<T>>()
+        };
+        let ptr = NonNull::new(raw_ptr).ok_or(AllocError)?;
+        // SAFETY: `ptr->data` is a valid pinned location.
+        let Ok(()) = unsafe { value.__pinned_init(&raw mut (*raw_ptr).data) };
+        // INVARIANTS: We just created the vm_bo so it's absent from lists, and the data is valid
+        // as we just initialized it.
+        Ok(GpuVmBoAlloc(ptr))
+    }
+
+    /// Returns a raw pointer to underlying C value.
+    #[inline]
+    pub(super) fn as_raw(&self) -> *mut bindings::drm_gpuvm_bo {
+        // SAFETY: The pointer references a valid `drm_gpuvm_bo`.
+        unsafe { (*self.0.as_ptr()).inner.get() }
+    }
+
+    /// Look up whether there is an existing [`GpuVmBo`] for this gem object.
+    #[inline]
+    pub(super) fn obtain(self) -> ARef<GpuVmBo<T>> {
+        let me = ManuallyDrop::new(self);
+        // SAFETY: Valid `drm_gpuvm_bo` not already in the lists.
+        let ptr = unsafe { bindings::drm_gpuvm_bo_obtain_prealloc(me.as_raw()) };
+
+        // Add the vm_bo to the extobj list if it's an external object, and if the vm_bo does not
+        // already exist. (If we are using an existing vm_bo, it's already in the extobj list.)
+        if ptr::eq(ptr, me.as_raw()) && me.gpuvm().is_extobj(me.obj()) {
+            let resv_lock = me.gpuvm().raw_resv();
+            // TODO: Use a proper lock guard here once a dma_resv lock abstraction exists.
+            // SAFETY: The GPUVM is still alive, so its resv lock is too.
+            unsafe { bindings::dma_resv_lock(resv_lock, ptr::null_mut()) };
+            // SAFETY: We hold the GPUVMs resv lock.
+            unsafe { bindings::drm_gpuvm_bo_extobj_add(ptr) };
+            // SAFETY: We took the lock, so we can unlock it.
+            unsafe { bindings::dma_resv_unlock(resv_lock) };
+        }
+
+        // SAFETY: `drm_gpuvm_bo_obtain_prealloc` always returns a non-null ptr
+        let ptr = unsafe { NonNull::new_unchecked(ptr.cast()) };
+
+        // INVARIANTS: `drm_gpuvm_bo_obtain_prealloc` ensures that the bo is in the GEM list.
+        // SAFETY: We received one refcount from `drm_gpuvm_bo_obtain_prealloc`.
+        unsafe { ARef::from_raw(ptr) }
+    }
+}
+
+impl<T: DriverGpuVm> Deref for GpuVmBoAlloc<T> {
+    type Target = GpuVmBo<T>;
+    #[inline]
+    fn deref(&self) -> &GpuVmBo<T> {
+        // SAFETY: By the type invariants we may deref while `Self` exists.
+        unsafe { self.0.as_ref() }
+    }
+}
+
+impl<T: DriverGpuVm> Drop for GpuVmBoAlloc<T> {
+    #[inline]
+    fn drop(&mut self) {
+        // TODO: Call drm_gpuvm_bo_destroy_not_in_lists() directly.
+        // SAFETY: It's safe to perform a deferred put in any context.
+        unsafe { bindings::drm_gpuvm_bo_put_deferred(self.as_raw()) };
+    }
+}

-- 
2.53.0.959.g497ff81fa9-goog

