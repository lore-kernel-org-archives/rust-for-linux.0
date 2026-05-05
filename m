Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8898F30B501
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987801; cv=none; b=CaXF6YYpl18oAKpHvhRVP4P2ZvRpVz27KLAhbbqDJ+kO9krSW63reVY98qOQ37A9qlV2SEneWAHR4v8EWmk1vHW9EDOy8jJTFWOTgxdvVj2OHaDEvTMxleYF4q6dvgHOUTz7MiNBR0o8x53qFbX+Z4hJ3XgwyU8yu0MN/aRU/F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987801; c=relaxed/simple;
	bh=D38IP4eDNtMMI0IcGktFlp2eQ3DhTGlCsra4pFAIzVw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WHvpLzXPMhKjMznOBq3MHRgqon0820MDiLWQGkZJ2Y5KI1hhPoeB4DvvB2gFKcs6OjZdGX6UHohSsoX/NBoTDNzRvl60mbOEwHgJODWTAEJRYdr0wGczOhWM919sMXeffne879meKOv8fs5v7Kj7RmVQrIacBBLe4SExWQsJjoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mDEiVabX; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mDEiVabX"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4362197d1easo4566174f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777987794; x=1778592594; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2RGX6Vwv6i9Ia+V/bXwK0J5Boae0O+Cfqmb25x4+UY=;
        b=mDEiVabXt9owy/Xi7AcDk89uOSF0/YD9+v9mziwyj+B1RaycEe5gY4jkQB60u+TNq/
         //dn6YuWSssbwRBeBxRL5R39l53/sgu3FZ5C2BY4NIEqGBEJ2p6U1Oi4XeQQJVAYfhSM
         gCpKPLooWKScQBx8sTpt7KtmHZc2+ZXgnkR9zW1oHqLWf8BBDTM6hxLd2ODtSfCPmni5
         LkYBTbqloh19GNRDTRN5sQ25qc/zDTqB3Cf0lbLq7c3edRvyBZ1Dytpvz/7ebOpVKEfF
         fm6HKry/Y85E/DbciTT9eqDAy2hsJwfaWrtsL+qwmo8eSU9ZK1RpmMa03zVq1rsKq641
         zfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777987794; x=1778592594;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2RGX6Vwv6i9Ia+V/bXwK0J5Boae0O+Cfqmb25x4+UY=;
        b=kIaO3oGatSgzbC1Awyup5Al2cNkHd5R6BjgvXLbTqRRYukUfS64RJPuWFRHmXwvd32
         XvlFlVVoOewowlZGdNfRfTqh1E3Qswz669/W2Rj3MKVA4ydDoFjp8hZ2XvXvvQaACCGN
         G6p8xaXxhenphPRBWYVfETaE/6Id+glMC+686mYMKLPtHX5AeHSmRHDxICH3YgZE/fx9
         F7oUN2lkmlKbcWrIlP5avCcgH+00zhAN+349OVRdpSfac+9pbEg8zrSflS2NuNwiHFCH
         K+uv3yq/HRERpeC2ctVH06z3nzhaHB3vX9P/kj3dC3HLg/9zs80PmzknzDdK1HXyUXEp
         2nng==
X-Forwarded-Encrypted: i=1; AFNElJ9y+NaP5UP0UpBN8o81z4Ahs+LIddCdGBoJ+eNSmbHxnqOQzLK5Y07VUblumwTZf7q8ZhxX3v+6mxgiKrNp9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/OmRntcuncrVen/pe7d1rEwRTWBQCtzsxg6BgZt03IwZevQ0n
	a9SyNDvaNybDlwIzAlv8t2VsSXa4kioxLPNXfHt9Ds1ymYTq1hB/9ypLkiArbGsh6le59qMDWBc
	cAcJuP8rJpIuMfbkS6w==
X-Received: from wrbes25.prod.google.com ([2002:a05:6000:44d9:b0:44a:70d3:31fd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:444c:0:b0:44b:d58b:6a01 with SMTP id ffacd0b85a97d-44bd59aada4mr15775676f8f.1.1777987793893;
 Tue, 05 May 2026 06:29:53 -0700 (PDT)
Date: Tue, 05 May 2026 13:29:37 +0000
In-Reply-To: <20260505-gpuvm-drm-exec-v1-0-958306ded36e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260505-gpuvm-drm-exec-v1-0-958306ded36e@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6284; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=D38IP4eDNtMMI0IcGktFlp2eQ3DhTGlCsra4pFAIzVw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBp+fDNU9ynbvS3XqymbWEIFFSYVxq4nVooOCqAz
 8ojvGQzQrSJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCafnwzQAKCRAEWL7uWMY5
 RhxWEACUfl0Spaz0xAbL0EstZcKnvjGq70NJR0uHyy/8h4gZQYldwrE+tFVx9pa6WzyND2y5gbL
 +29uPSTOfRxUfwtkr/WVnPlBvxGxJWZ6YWd6VV8cLqmy7hZwUSI3SyD6zTVsTKfC8J64OkcoTCK
 aQRz7zUqG0aFmaL55YE0pZB4L5pAeyM64FL6NTLJ9KK5kWt9MVfmJARTrjNYuo4x0cGHWQG76c/
 ftxOTAjFr1EFv/+dQYO7Jau+YFAgywBT+AO+aaWQcOOE2YOphCykKAxv2X7Ll0bR+D1JijF9Snb
 mn2RCFCU2VAA4v2Rr6c7DoRxY1bEaZl4ovdMo0dEvKqT1xOK8i5qIMmpUXN1TyS7/tRMixWlxyR
 b+EzeVH/TjKWDo8i3W6kcXXm2wRG6or/q1YFNQLgowdcy0nFuQDTYr52FAw5NoWftLY/mNIjVSI
 jeVI2lsO3Xm1YCIERvFheCpBFOiwx6mtsNMH2LmSdeI4DalQDf0eaoW1ACHsI1g7NqjBmyxXTjl
 X2mt6gmE8/Z/JAF/itemiWpj4TRo/tF9FoxhGh0KYmPpTzlJVprRCl+4EEazKwbHwuUxLnEg8RN
 AKgpGFxsO+YpgrytwrriLKkSPAMmFoobSQNe6P7fNu1v0W7hgNvwe0VMgTMXC8zd8Cloj/GtzeC STnjuONyxsqk9QQ==
X-Mailer: b4 0.14.3
Message-ID: <20260505-gpuvm-drm-exec-v1-2-958306ded36e@google.com>
Subject: [PATCH 2/2] drm/gpuvm: rust: add drm_gpuvm_exec support
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Philipp Stanner <pstanner@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds support for simple usage of drm_gpuvm_exec() for locking all
of the dma reservations and adding fences to them. For more complex
usage that does not involve locking all reservations, it is expected
that the ww-mutex abstractions will be used instead.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/bindings/bindings_helper.h |  2 ++
 rust/helpers/drm_gpuvm.c        |  6 ++++
 rust/kernel/dma_buf/mod.rs      | 17 ++++++++++
 rust/kernel/drm/gpuvm/mod.rs    | 71 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 1124785e210b..3978682a6f2e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -151,6 +151,8 @@ const vm_flags_t RUST_CONST_HELPER_VM_MIXEDMAP = VM_MIXEDMAP;
 const vm_flags_t RUST_CONST_HELPER_VM_HUGEPAGE = VM_HUGEPAGE;
 const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE = VM_NOHUGEPAGE;
 
+const u32 RUST_CONST_HELPER_DRM_EXEC_INTERRUPTIBLE_WAIT = DRM_EXEC_INTERRUPTIBLE_WAIT;
+
 #if IS_ENABLED(CONFIG_GPU_BUDDY)
 const unsigned long RUST_CONST_HELPER_GPU_BUDDY_RANGE_ALLOCATION = GPU_BUDDY_RANGE_ALLOCATION;
 const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TOPDOWN_ALLOCATION = GPU_BUDDY_TOPDOWN_ALLOCATION;
diff --git a/rust/helpers/drm_gpuvm.c b/rust/helpers/drm_gpuvm.c
index 4130b6325213..30fb1777fbf2 100644
--- a/rust/helpers/drm_gpuvm.c
+++ b/rust/helpers/drm_gpuvm.c
@@ -23,4 +23,10 @@ bool rust_helper_drm_gpuvm_is_extobj(struct drm_gpuvm *gpuvm,
 	return drm_gpuvm_is_extobj(gpuvm, obj);
 }
 
+__rust_helper
+void rust_helper_drm_gpuvm_exec_unlock(struct drm_gpuvm_exec *vm_exec)
+{
+	drm_gpuvm_exec_unlock(vm_exec);
+}
+
 #endif // CONFIG_RUST_DRM_GPUVM
diff --git a/rust/kernel/dma_buf/mod.rs b/rust/kernel/dma_buf/mod.rs
index b66e747c35ad..234936ba8265 100644
--- a/rust/kernel/dma_buf/mod.rs
+++ b/rust/kernel/dma_buf/mod.rs
@@ -5,3 +5,20 @@
 pub mod dma_fence;
 
 pub use self::dma_fence::Fence;
+
+/// How the fences from a `dma_resv` obj are used.
+///
+/// Please see [the C-side documentation][dma_resv_usage] for more details.
+///
+/// [dma_resv_usage]: https://docs.kernel.org/driver-api/dma-buf.html#c.dma_resv_usage
+#[repr(u32)]
+pub enum DmaResvUsage {
+    /// For in kernel memory management only (e.g. copying, clearing memory).
+    Kernel = bindings::dma_resv_usage_DMA_RESV_USAGE_KERNEL,
+    /// Implicit write synchronization for userspace submissions.
+    Write = bindings::dma_resv_usage_DMA_RESV_USAGE_WRITE,
+    /// Implicit read synchronization for userspace submissions.
+    Read = bindings::dma_resv_usage_DMA_RESV_USAGE_READ,
+    /// No implicit sync (e.g. preemption fences, page table updates, TLB flushes).
+    Bookkeep = bindings::dma_resv_usage_DMA_RESV_USAGE_BOOKKEEP,
+}
diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index ae58f6f667c1..a52fb25f22ff 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -16,6 +16,7 @@
         Flags as AllocFlags, //
     },
     bindings,
+    dma_buf::{DmaResvUsage, Fence},
     drm,
     drm::gem::IntoGEMObject,
     error::to_result,
@@ -216,6 +217,30 @@ pub fn obtain(
         Ok(GpuVmBoAlloc::new(self, obj, data)?.obtain())
     }
 
+    /// Prepare this GPUVM.
+    ///
+    /// The parameter indicates how many fences to preallocate space for.
+    #[inline]
+    pub fn prepare(&self, num_fences: u32) -> impl PinInit<GpuVmExec<'_, T>, Error> {
+        try_pin_init!(GpuVmExec {
+            exec <- Opaque::try_ffi_init(|exec: *mut bindings::drm_gpuvm_exec| {
+                // SAFETY: exec is valid but unused memory, so we can write.
+                unsafe {
+                    ptr::write_bytes(exec, 0u8, 1usize);
+                    ptr::write(&raw mut (*exec).vm, self.as_raw());
+                    ptr::write(&raw mut (*exec).flags, bindings::DRM_EXEC_INTERRUPTIBLE_WAIT);
+                    ptr::write(&raw mut (*exec).num_fences, num_fences);
+                }
+
+                // SAFETY: If successful, this `struct drm_gpuvm_exec` remains valid until this is
+                // unlocked because it's pinned and unlocks it in drop. The contained pointer to
+                // `self` remains valid because `GpuVmExec` borrows from `self`.
+                to_result(unsafe { bindings::drm_gpuvm_exec_lock(exec) })
+            }),
+            _gpuvm: PhantomData,
+        })
+    }
+
     /// Clean up buffer objects that are no longer used.
     #[inline]
     pub fn deferred_cleanup(&self) {
@@ -326,3 +351,49 @@ fn deref(&self) -> &GpuVm<T> {
         &self.0
     }
 }
+
+/// The exec token for preparing the objects.
+///
+/// # Invariants
+///
+/// Owns a GPUVM exec context.
+#[pin_data(PinnedDrop)]
+pub struct GpuVmExec<'vm, T: DriverGpuVm> {
+    #[pin]
+    exec: Opaque<bindings::drm_gpuvm_exec>,
+    _gpuvm: PhantomData<&'vm mut GpuVm<T>>,
+}
+
+impl<'vm, T: DriverGpuVm> GpuVmExec<'vm, T> {
+    /// Add a fence.
+    ///
+    /// The caller must ensure that the preallocated space for fences is sufficient.
+    #[inline]
+    pub fn resv_add_fence(
+        &self,
+        fence: &Fence,
+        private_usage: DmaResvUsage,
+        extobj_usage: DmaResvUsage,
+    ) {
+        // SAFETY: This method takes a refcount on the fence, so it's only required to be valid for
+        // the duration of this method. If there is not enough space for the pre-allocated fence,
+        // then this leads to a BUG_ON() but does not trigger UB.
+        unsafe {
+            bindings::drm_gpuvm_resv_add_fence(
+                (*self.exec.get()).vm,
+                &raw mut (*self.exec.get()).exec,
+                fence.as_raw(),
+                private_usage as u32,
+                extobj_usage as u32,
+            )
+        }
+    }
+}
+
+#[pinned_drop]
+impl<'vm, T: DriverGpuVm> PinnedDrop for GpuVmExec<'vm, T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: We hold the lock, so it's safe to unlock.
+        unsafe { bindings::drm_gpuvm_exec_unlock(self.exec.get()) };
+    }
+}

-- 
2.54.0.545.g6539524ca2-goog

