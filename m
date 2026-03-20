Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE83D0921
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022929; cv=none; b=Gim/irz6FvHz5tWkDxJ7BrMGNieCaigY06j4sFAKBxdeXVRlyQ+oc6o45kBysXVrPSb3IP9hyIl+9mnvKi0dS/9qvxR31D3gKoyjkY3qhgAaaDpOwKQhxqk2/bvfwQhCaYiZ3sGna68Rpbdt+WjVUfA4Num4FgCP72LsDRQGZT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022929; c=relaxed/simple;
	bh=pJHrLXIHGhItCYI8EF29aToSZy8W3VqMaEzP+Dsyx3o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kkmQ3EPiRRtsxG2RwDIp15a4p1WZpR/6HQQ7g/xE/SDRMfaUWI6SFslgQRCXkRwL0KSbMspt/u18GLawqN4N5XBTnHb1HoLbjD8zyDrIiR2iWs7Eh2mkowYtM3mn9qeG4CM6N+nt4LtkENJ3m4KCJpYvhY143OpKgJj5yfKCrKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X9yKugow; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X9yKugow"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-486fb29a8b8so15875945e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022926; x=1774627726; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEPN1CCLI1GKK6sV/j4L1DMhnYo+L22QHlnStf4ccEg=;
        b=X9yKugow8/QrbhNG2MtW+jTEcjiaHPgec1fYy+yaWGjp41rkzYXorfq675DuYXIX4b
         6adau6LrDoo19hnhFLS05bau5kJ5CvjM5mLS/XdXhkrC8eMSmqrztEdW9Q8D/V2YuMJ0
         M1m9zLTs+U7t5TIKtiR/KyJBNPlOLByRSFqZ1dtPlIl7tcZQQfeMvg5zc3SfnvhNMCAV
         ibDK3sPUNwdNgUX4SIB0pyoSatQQOtxkd8smTJ/ZP6KK+VUVjz1XsUAqOJVb1Z9CI1uD
         T1FH40TkoBPP5HT88Z+ZNSuVNudHtqo1nASKgBWt3Zqh+2ARbVejfGZ2Hu+nMyDzYGmQ
         2ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022926; x=1774627726;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEPN1CCLI1GKK6sV/j4L1DMhnYo+L22QHlnStf4ccEg=;
        b=dE6DJICr8T9v9Z0X5zuJ7lR4qXiQCPuz5iJ+pyY2wtjAe3Fkevnv2jPg7VW/H/YKSQ
         +jt+Fja7ud+d6o36TnkP+luU+cUutwmfhpbTSrB2q0jdoNKEcoYc32E26trgCI7vPuxf
         08nQn07+fHw1+6mJPyJaPzGsvT0Q0uqIyqrQpoAPCj7ETr1Bgoxmk7CbPoNGVBmdcL0z
         mHU82YYCL9uATbxYLO0k9mvBl7wc6ieDEE6nNIxRDVdhvoverfC6RAbfbZtkoCv2qIh9
         xHDEj0hto4y9NAL5LB8Y8xvoB5IY6ff311qGKbHz1p03Y2BePbHrkbLQ1EqlTWneKQFI
         6Qcg==
X-Forwarded-Encrypted: i=1; AJvYcCWbhycIgB9UqRJcbmV52EiKDHCGoBOv9b+6FYkPc3VYAb0zdYAmJun8hzbh+6HZdmTtAtp1e9EqEQM0El5liQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE0jNNU7COWOZAHXcNaLn3IekE7ZJlcNz7d2QGLkMp85OBLw5j
	H7h1STI3lhjaJrSeVKKu/mFd4DPJYU3d/emTJaOKDxIGeQpuXDWQCbarUHn9wlJWLjf9KmQfWSG
	RBw3x7OQlgPFBc9/oKA==
X-Received: from wmjq10.prod.google.com ([2002:a7b:ce8a:0:b0:485:2cf0:2668])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46ce:b0:485:2f4a:6ae6 with SMTP id 5b1f17b1804b1-486febb56demr52608445e9.6.1774022925504;
 Fri, 20 Mar 2026 09:08:45 -0700 (PDT)
Date: Fri, 20 Mar 2026 16:08:30 +0000
In-Reply-To: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260320-gpuvm-rust-v5-0-76fd44f17a87@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9670; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=pJHrLXIHGhItCYI8EF29aToSZy8W3VqMaEzP+Dsyx3o=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpvXECjoN67yqz9QA1puINwCTzOntqXbsNrU+4a
 RodE6QNb/aJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCab1xAgAKCRAEWL7uWMY5
 RszxD/9kMoNIG/ohpvcMrtMbuodzOfNpRDtOMbn+49YSrdubOITnMFZDMqS9JMJP0rQVila++8n
 RaOKiB9lo7YF93n1rbdv1BNxEemrQfZhf3Rrs7vPwcWD1NarPNqVSusCgi6o03Msl3V9Z54WT4z
 9TqPKTVHsVNErS8yP4CMUHBWpOs8nkI5JLzDThMAO4g0qI79V/1lU6sfxRzwUxb0i03QcaA8Fs4
 zHunoHK8LhoOb6dDV2Rv5vHqVIeG5izarcwR5Fipa7melfQ6J1GFe7GeN9fA/sN5XIWDml1MUtm
 peWrxGkDpPr5UgaMQ81ji7cAO3emiUcmewbkFSOo+NuSQmCwnfMl1SX7NpKAUJkIvq7rRi2uJob
 mSpeD9AyJTzFfK5wsT8IV1aFT5bZFoF0pf/vDV9Xj5XBfH2j9D9tZSO+IGqXeMEUFsO2xaNmUKb
 cTrTT9DJ72mbEguMKKxPg/+8oryabvUEVVDsibUQz79IRcKwsFnIGZ5ccjhe8W4IYZLl8gVcobd
 W7ZAEm8OIvjNsfRpAdS7M5mWdpW3rGPvVE+Zcj1/E6ixSiljitdxsA5+BJ4VVidsbUaxtzt6sWY
 uK7gMVDk14+Wb29RMoiVYzbOgAaYgnRUrywHoIeHCOU+4WxbU7GqEE3WPWzcPFoEr5QsK5C1YLe 3rwCvMdtFHl8lYA==
X-Mailer: b4 0.14.3
Message-ID: <20260320-gpuvm-rust-v5-6-76fd44f17a87@google.com>
Subject: [PATCH v5 6/6] rust: gpuvm: add GpuVmCore::sm_map()
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

Finally also add the operation for creating new mappings. Mapping
operations need extra data in the context since they involve a vm_bo
coming from the outside.

Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs    |   9 ++-
 rust/kernel/drm/gpuvm/sm_ops.rs | 157 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 160 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index dca72e7b2b89..64a614d14f09 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -98,7 +98,7 @@ const fn vtable() -> &'static bindings::drm_gpuvm_ops {
             vm_bo_alloc: GpuVmBo::<T>::ALLOC_FN,
             vm_bo_free: GpuVmBo::<T>::FREE_FN,
             vm_bo_validate: None,
-            sm_step_map: None,
+            sm_step_map: Some(Self::sm_step_map),
             sm_step_unmap: Some(Self::sm_step_unmap),
             sm_step_remap: Some(Self::sm_step_remap),
         }
@@ -255,6 +255,13 @@ pub trait DriverGpuVm: Sized {
     /// The private data passed to callbacks.
     type SmContext<'ctx>;
 
+    /// Indicates that a new mapping should be created.
+    fn sm_step_map<'op, 'ctx>(
+        &mut self,
+        op: OpMap<'op, Self>,
+        context: &mut Self::SmContext<'ctx>,
+    ) -> Result<OpMapped<'op, Self>, Error>;
+
     /// Indicates that an existing mapping should be removed.
     fn sm_step_unmap<'op, 'ctx>(
         &mut self,
diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs b/rust/kernel/drm/gpuvm/sm_ops.rs
index ab802a07e4be..1d07e84a8062 100644
--- a/rust/kernel/drm/gpuvm/sm_ops.rs
+++ b/rust/kernel/drm/gpuvm/sm_ops.rs
@@ -8,6 +8,103 @@ struct SmData<'a, 'ctx, T: DriverGpuVm> {
     user_context: &'a mut T::SmContext<'ctx>,
 }
 
+#[repr(C)]
+struct SmMapData<'a, 'ctx, T: DriverGpuVm> {
+    sm_data: SmData<'a, 'ctx, T>,
+    vm_bo: ARef<GpuVmBo<T>>,
+}
+
+/// The argument for [`GpuVmCore::sm_map`].
+pub struct OpMapRequest<'a, 'ctx, T: DriverGpuVm> {
+    /// Address in GPU virtual address space.
+    pub addr: u64,
+    /// Length of mapping to create.
+    pub range: u64,
+    /// Offset in GEM object.
+    pub gem_offset: u64,
+    /// The GEM object to map.
+    pub vm_bo: ARef<GpuVmBo<T>>,
+    /// The user-provided context type.
+    pub context: &'a mut T::SmContext<'ctx>,
+}
+
+impl<'a, 'ctx, T: DriverGpuVm> OpMapRequest<'a, 'ctx, T> {
+    fn raw_request(&self) -> bindings::drm_gpuvm_map_req {
+        bindings::drm_gpuvm_map_req {
+            map: bindings::drm_gpuva_op_map {
+                va: bindings::drm_gpuva_op_map__bindgen_ty_1 {
+                    addr: self.addr,
+                    range: self.range,
+                },
+                gem: bindings::drm_gpuva_op_map__bindgen_ty_2 {
+                    offset: self.gem_offset,
+                    obj: self.vm_bo.obj().as_raw(),
+                },
+            },
+        }
+    }
+}
+
+/// Represents an `sm_step_map` operation that has not yet been completed.
+pub struct OpMap<'op, T: DriverGpuVm> {
+    op: &'op bindings::drm_gpuva_op_map,
+    // Since these abstractions are designed for immediate mode, the VM BO needs to be
+    // pre-allocated, so we always have it available when we reach this point.
+    vm_bo: &'op GpuVmBo<T>,
+    // This ensures that 'op is invariant, so that `OpMap<'long, T>` does not
+    // coerce to `OpMap<'short, T>`. This ensures that the user can't return
+    // the wrong `OpMapped` value.
+    _invariant: PhantomData<*mut &'op mut T>,
+}
+
+impl<'op, T: DriverGpuVm> OpMap<'op, T> {
+    /// The base address of the new mapping.
+    pub fn addr(&self) -> u64 {
+        self.op.va.addr
+    }
+
+    /// The length of the new mapping.
+    pub fn length(&self) -> u64 {
+        self.op.va.range
+    }
+
+    /// The offset within the [`drm_gem_object`](crate::gem::Object).
+    pub fn gem_offset(&self) -> u64 {
+        self.op.gem.offset
+    }
+
+    /// The [`drm_gem_object`](crate::gem::Object) to map.
+    pub fn obj(&self) -> &T::Object {
+        // SAFETY: The `obj` pointer is guaranteed to be valid.
+        unsafe { <T::Object as IntoGEMObject>::from_raw(self.op.gem.obj) }
+    }
+
+    /// The [`GpuVmBo`] that the new VA will be associated with.
+    pub fn vm_bo(&self) -> &GpuVmBo<T> {
+        self.vm_bo
+    }
+
+    /// Use the pre-allocated VA to carry out this map operation.
+    pub fn insert(self, va: GpuVaAlloc<T>, va_data: impl PinInit<T::VaData>) -> OpMapped<'op, T> {
+        let va = va.prepare(va_data);
+        // SAFETY: By the type invariants we may access the interval tree.
+        unsafe { bindings::drm_gpuva_map(self.vm_bo.gpuvm().as_raw(), va, self.op) };
+
+        let _gpuva_guard = self.vm_bo().lock_gpuva();
+        // SAFETY: The va is prepared for insertion, and we hold the GEM lock.
+        unsafe { bindings::drm_gpuva_link(va, self.vm_bo.as_raw()) };
+
+        OpMapped {
+            _invariant: self._invariant,
+        }
+    }
+}
+
+/// Represents a completed [`OpMap`] operation.
+pub struct OpMapped<'op, T> {
+    _invariant: PhantomData<*mut &'op mut T>,
+}
+
 /// Represents an `sm_step_unmap` operation that has not yet been completed.
 pub struct OpUnmap<'op, T: DriverGpuVm> {
     op: &'op bindings::drm_gpuva_op_unmap,
@@ -211,6 +308,30 @@ pub struct OpRemapped<'op, T> {
 }
 
 impl<T: DriverGpuVm> UniqueRefGpuVm<T> {
+    /// Create a mapping, removing or remapping anything that overlaps.
+    ///
+    /// Internally calls the [`DriverGpuVm`] callbacks similar to [`Self::sm_unmap`], except that
+    /// the [`DriverGpuVm::sm_step_map`] is called once to create the requested mapping.
+    #[inline]
+    pub fn sm_map(&mut self, req: OpMapRequest<'_, '_, T>) -> Result {
+        let gpuvm = self.as_raw();
+        let raw_req = req.raw_request();
+        let mut p = SmMapData {
+            sm_data: SmData {
+                gpuvm: self,
+                user_context: req.context,
+            },
+            vm_bo: req.vm_bo,
+        };
+        // SAFETY:
+        // * raw_request() creates a valid request.
+        // * The private data is valid to be interpreted as both SmData and SmMapData since the
+        //   first field of SmMapData is SmData.
+        to_result(unsafe {
+            bindings::drm_gpuvm_sm_map(gpuvm, (&raw mut p).cast(), &raw const raw_req)
+        })
+    }
+
     /// Remove any mappings in the given region.
     ///
     /// Internally calls [`DriverGpuVm::sm_step_unmap`] for ranges entirely contained within the
@@ -224,19 +345,45 @@ pub fn sm_unmap(&mut self, addr: u64, length: u64, context: &mut T::SmContext<'_
         };
         // SAFETY:
         // * raw_request() creates a valid request.
-        // * The private data is valid to be interpreted as SmData.
+        // * The private data is a valid SmData.
         to_result(unsafe { bindings::drm_gpuvm_sm_unmap(gpuvm, (&raw mut p).cast(), addr, length) })
     }
 }
 
 impl<T: DriverGpuVm> GpuVm<T> {
     /// # Safety
-    /// Must be called from `sm_unmap` with a pointer to `SmData`.
+    /// Must be called from `sm_map` with a pointer to `SmMapData`.
+    pub(super) unsafe extern "C" fn sm_step_map(
+        op: *mut bindings::drm_gpuva_op,
+        p: *mut c_void,
+    ) -> c_int {
+        // SAFETY: If we reach `sm_step_map` then we were called from `sm_map` which always passes
+        // an `SmMapData` as private data.
+        let p = unsafe { &mut *p.cast::<SmMapData<'_, '_, T>>() };
+        let op = OpMap {
+            // SAFETY: sm_step_map is called with a map operation.
+            op: unsafe { &(*op).__bindgen_anon_1.map },
+            vm_bo: &p.vm_bo,
+            _invariant: PhantomData,
+        };
+        match p
+            .sm_data
+            .gpuvm
+            .data()
+            .sm_step_map(op, p.sm_data.user_context)
+        {
+            Ok(OpMapped { .. }) => 0,
+            Err(err) => err.to_errno(),
+        }
+    }
+
+    /// # Safety
+    /// Must be called from `sm_map` or `sm_unmap` with a pointer to `SmMapData` or `SmData`.
     pub(super) unsafe extern "C" fn sm_step_unmap(
         op: *mut bindings::drm_gpuva_op,
         p: *mut c_void,
     ) -> c_int {
-        // SAFETY: The caller provides a pointer to `SmData`.
+        // SAFETY: The caller provides a pointer that can be treated as `SmData`.
         let p = unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
         let op = OpUnmap {
             // SAFETY: sm_step_unmap is called with an unmap operation.
@@ -250,12 +397,12 @@ impl<T: DriverGpuVm> GpuVm<T> {
     }
 
     /// # Safety
-    /// Must be called from `sm_unmap` with a pointer to `SmData`.
+    /// Must be called from `sm_map` or `sm_unmap` with a pointer to `SmMapData` or `SmData`.
     pub(super) unsafe extern "C" fn sm_step_remap(
         op: *mut bindings::drm_gpuva_op,
         p: *mut c_void,
     ) -> c_int {
-        // SAFETY: The caller provides a pointer to `SmData`.
+        // SAFETY: The caller provides a pointer that can be treated as `SmData`.
         let p = unsafe { &mut *p.cast::<SmData<'_, '_, T>>() };
         let op = OpRemap {
             // SAFETY: sm_step_remap is called with a remap operation.

-- 
2.53.0.959.g497ff81fa9-goog

