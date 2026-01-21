Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E753EFD2C
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995124; cv=none; b=ayiRhvtzvxg7+uP9nv00e10wR7mKCPv3m1LSwXGm1yn5KRapxHeyS3A2On8fMRMRshal7J9LNC9Z7h+BxhG+TztVmOiCNtrA4BGWPHQr5ygS9Wq703EVto9w3yepyLKYhhn9T4Bq1AJaXAm6p9/WalucWsWIVXMidBjz1NlTLyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995124; c=relaxed/simple;
	bh=eaJbZT8B2Xja2kdiGi1Ws869kj8AJxUSIKK3G5I4Mvs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UwP3sxirKzeeFRLbYJe3jVliMNDoc5EqOmYa9iih1RKeJqeBRO8Muc6OefXD+44gDROg2IZpGMdfWj8tAVXmGVkgd51pKPvzpmADT5s+ygHutflxf+PnKmzwVZjK8PGPv/gLPCmZ4DU4jjCpcLA/52hbFycaOZoQDJ0RfZSTBv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P57C4fTe; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P57C4fTe"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4803e8b6007so11582475e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 03:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768995120; x=1769599920; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LdNXhntJkj2eNG88xbizt69UmEV/pDIxWww84BjGwBY=;
        b=P57C4fTeTd99SG84pHdsOuV9WvjKcmRPFL4OZVwOS0jq9VMEN9kvlDLpC38QkFdbTd
         Z+ljPPPHz8ISoEYd2ydAbUeBblW3zUVclzYNuFYXCAjYtCd3gwtnTS4ojZ+6xbCPEsXX
         ildL3S4s+2vFn0/WWiPOluPRPz09/yjh5jvy9RWYXH9vAsHrZ1jqB4CnAkCktPGC+rpb
         oXGp8GgmqG8VSuEq8K4B5wEbW7+IvTTCZsBsKD6lkgXknTiEXMf4oys0EVnluxa8tX6B
         SIxO1EuFcUO6uvv5pjr3uHX6U2giQaNHuSsWyxeFrRitNhwr2wqO/Q6Sskaph5J1h3/b
         GRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768995120; x=1769599920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdNXhntJkj2eNG88xbizt69UmEV/pDIxWww84BjGwBY=;
        b=WcZ9UGgaPjugx9yXyBOJP317uMAjr8NQ2SJapvhv481Otn3GpVTZljclm5KA79nOE6
         yJDAcdcmvTW/covBJ8KXU9zbXDKIQHqiUph02jxBKzpF+YLOREo5X57BCTtxL/+7nD7u
         xpPN4yuNjQ+u9IhIcaYs/1cPYjEhRAvSzOlOckyG7RULiHRgEgLNNcujrz53+ZcabWQf
         2xoVssmGvstu9DR2d+q1/QYQDfbxbktjpD3+y0DiCrdtr0NryuM/kL+txUYI71LSeqXM
         5Db6rzcW6CTH9F3Zv23jX1LpKZZrDF7uOVJFiicz6tLwBWT+mFAiJWEtvPwFnnmqt+ly
         kQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUsqVwmcYFfs1VCbeXaB4WDfCGqoE0gjeIKoi6PuXAGkcuj3eatKT+pMjgx2EP+Mn3J2tqSVM2WSOvxQ0HGYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRVCaghDiujj/UEbZkEQUVhQQZlkS1rKbrr1J2xAttXHBAc5nw
	b+zbJKUzQ4nu9/4j5BPimrDsG+IuYUqtcvaMmiB6Y5v5GhhRkBTL4FGmKoqNPxAMSm6jEvcb5UC
	J7wsS/vUZ2gPBYwmsVw==
X-Received: from wrbex1.prod.google.com ([2002:a05:6000:2481:b0:432:88c5:9eae])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:4a92:0:b0:435:94dc:8c78 with SMTP id ffacd0b85a97d-43594dc8d0emr6022606f8f.40.1768995119989;
 Wed, 21 Jan 2026 03:31:59 -0800 (PST)
Date: Wed, 21 Jan 2026 11:31:20 +0000
In-Reply-To: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6712; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=eaJbZT8B2Xja2kdiGi1Ws869kj8AJxUSIKK3G5I4Mvs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpcLke0bv1AU0YLFOT8myV74XrcFtjRhhP+57oB
 ChfIUqWAWqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXC5HgAKCRAEWL7uWMY5
 RhWED/wJPKLEvMvMMtru2PUKQVwm4UuBejGc+CN4McSACM9zZJwCKrd/n9DghJpF6mqL5LOw5/B
 wqCtvPBTrKSrFM+FeZcXYTHxP7EGoIP10vS2n16clXWUf6d4SDVDcH9Jn3vnIg0dTpDXOqh1H6B
 uKTJVQ8bFavjXWZCY3MfbCUc/+O5L4GH5FbURaSS50AxMjNdYmMv5X0nfo3uestPY5s+i7m+69/
 BAiINrxfezJkRNptUzFarzZS1gWhq619MBF3lfTvVhYcXuHwvuGXJPFXVY3EvEv+URxQvSghqtE
 V3gAZEN8mExr12z3mG+WbVQOinRQfpRfiQDFb4u3bv9RdDvjz0mmmYlTAM3MF3ZCEfqF0QR0rnL
 4zXnejcVgHSe1f/GqJQrGAtMzleRokvwkD/dhOLE2qxE8easwlCYdbm6BDIAwU9XgYZBmPvh9po
 Bqs6LFioU1HVyvbDx+aDFo49y0mEZ58GZ4RRueCCul3tA/CIyRghS3m/85tEmNQZv1Fv2DTRrIf
 IDm7LGruBN/rOw3uZ2UcTTFAPY6GznEzKKlSmUNiUWihc9a8ZMMyf4XEKqM27Gsn4sedzvoaMxQ
 /zb8EFdpmFeqZaNAeaIm1OnP/NOFCJJSKMzqvAVCZL5bc8jOMsPDc+8ZKh3NZIEm7XsEnFRK/ll /vv3cmCcK72U+jA==
X-Mailer: b4 0.14.2
Message-ID: <20260121-gpuvm-rust-v3-4-dd95c04aec35@google.com>
Subject: [PATCH v3 4/6] rust: gpuvm: add GpuVa struct
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This struct will be used to keep track of individual mapped ranges in
the GPU's virtual memory.

Co-developed-by: Asahi Lina <lina+kernel@asahilina.net>
Signed-off-by: Asahi Lina <lina+kernel@asahilina.net>
Co-developed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs |  17 ++++-
 rust/kernel/drm/gpuvm/va.rs  | 149 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index cb576a7ffa07bc108704e008b7f87de52a837930..2179ddd717d8728bbe231bd94ea7b5d1e2652543 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -11,7 +11,10 @@
 //! C header: [`include/drm/drm_gpuvm.h`](srctree/include/drm/drm_gpuvm.h)
 
 use kernel::{
-    alloc::AllocError,
+    alloc::{
+        AllocError,
+        Flags as AllocFlags, //
+    },
     bindings,
     drm,
     drm::gem::IntoGEMObject,
@@ -25,9 +28,13 @@
 
 use core::{
     cell::UnsafeCell,
-    mem::ManuallyDrop,
+    mem::{
+        ManuallyDrop,
+        MaybeUninit, //
+    },
     ops::{
         Deref,
+        DerefMut,
         Range, //
     },
     ptr::{
@@ -36,6 +43,9 @@
     }, //
 };
 
+mod va;
+pub use self::va::*;
+
 mod vm_bo;
 pub use self::vm_bo::*;
 
@@ -224,6 +234,9 @@ pub trait DriverGpuVm: Sized {
     /// The kind of GEM object stored in this GPUVM.
     type Object: IntoGEMObject;
 
+    /// Data stored with each `struct drm_gpuva`.
+    type VaData;
+
     /// Data stored with each `struct drm_gpuvm_bo`.
     type VmBoData;
 }
diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c96796a6b2c8c7c4b5475324562968ca0f07fd09
--- /dev/null
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+#![expect(dead_code)]
+use super::*;
+
+/// Represents that a range of a GEM object is mapped in this [`GpuVm`] instance.
+///
+/// Does not assume that GEM lock is held.
+///
+/// # Invariants
+///
+/// This is a valid `drm_gpuva` that is resident in the [`GpuVm`] instance.
+#[repr(C)]
+#[pin_data]
+pub struct GpuVa<T: DriverGpuVm> {
+    #[pin]
+    inner: Opaque<bindings::drm_gpuva>,
+    #[pin]
+    data: T::VaData,
+}
+
+impl<T: DriverGpuVm> GpuVa<T> {
+    /// Access this [`GpuVa`] from a raw pointer.
+    ///
+    /// # Safety
+    ///
+    /// For the duration of `'a`, the pointer must reference a valid `drm_gpuva` associated with a
+    /// [`GpuVm<T>`].
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_gpuva) -> &'a Self {
+        // SAFETY: `drm_gpuva` is first field and `repr(C)`.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Returns a raw pointer to underlying C value.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::drm_gpuva {
+        self.inner.get()
+    }
+
+    /// Returns the address of this mapping in the GPU virtual address space.
+    #[inline]
+    pub fn addr(&self) -> u64 {
+        // SAFETY: The `va.addr` field of `drm_gpuva` is immutable.
+        unsafe { (*self.as_raw()).va.addr }
+    }
+
+    /// Returns the length of this mapping.
+    #[inline]
+    pub fn length(&self) -> u64 {
+        // SAFETY: The `va.range` field of `drm_gpuva` is immutable.
+        unsafe { (*self.as_raw()).va.range }
+    }
+
+    /// Returns `addr..addr+length`.
+    #[inline]
+    pub fn range(&self) -> Range<u64> {
+        let addr = self.addr();
+        addr..addr + self.length()
+    }
+
+    /// Returns the offset within the GEM object.
+    #[inline]
+    pub fn gem_offset(&self) -> u64 {
+        // SAFETY: The `gem.offset` field of `drm_gpuva` is immutable.
+        unsafe { (*self.as_raw()).gem.offset }
+    }
+
+    /// Returns the GEM object.
+    #[inline]
+    pub fn obj(&self) -> &T::Object {
+        // SAFETY: The `gem.offset` field of `drm_gpuva` is immutable.
+        unsafe { <T::Object as IntoGEMObject>::from_raw((*self.as_raw()).gem.obj) }
+    }
+
+    /// Returns the underlying [`GpuVmBo`] object that backs this [`GpuVa`].
+    #[inline]
+    pub fn vm_bo(&self) -> &GpuVmBo<T> {
+        // SAFETY: The `vm_bo` field has been set and is immutable for the duration in which this
+        // `drm_gpuva` is resident in the VM.
+        unsafe { GpuVmBo::from_raw((*self.as_raw()).vm_bo) }
+    }
+}
+
+/// A pre-allocated [`GpuVa`] object.
+///
+/// # Invariants
+///
+/// The memory is zeroed.
+pub struct GpuVaAlloc<T: DriverGpuVm>(KBox<MaybeUninit<GpuVa<T>>>);
+
+impl<T: DriverGpuVm> GpuVaAlloc<T> {
+    /// Pre-allocate a [`GpuVa`] object.
+    pub fn new(flags: AllocFlags) -> Result<GpuVaAlloc<T>, AllocError> {
+        // INVARIANTS: Memory allocated with __GFP_ZERO.
+        Ok(GpuVaAlloc(KBox::new_uninit(flags | __GFP_ZERO)?))
+    }
+
+    /// Prepare this `drm_gpuva` for insertion into the GPUVM.
+    pub(super) fn prepare(mut self, va_data: impl PinInit<T::VaData>) -> *mut bindings::drm_gpuva {
+        let va_ptr = MaybeUninit::as_mut_ptr(&mut self.0);
+        // SAFETY: The `data` field is pinned.
+        let Ok(()) = unsafe { va_data.__pinned_init(&raw mut (*va_ptr).data) };
+        KBox::into_raw(self.0).cast()
+    }
+}
+
+/// A [`GpuVa`] object that has been removed.
+///
+/// # Invariants
+///
+/// The `drm_gpuva` is not resident in the [`GpuVm`].
+pub struct GpuVaRemoved<T: DriverGpuVm>(KBox<GpuVa<T>>);
+
+impl<T: DriverGpuVm> GpuVaRemoved<T> {
+    /// Convert a raw pointer into a [`GpuVaRemoved`].
+    ///
+    /// # Safety
+    ///
+    /// Must have been removed from a [`GpuVm<T>`].
+    pub(super) unsafe fn from_raw(ptr: *mut bindings::drm_gpuva) -> Self {
+        // SAFETY: Since it has been removed we can take ownership of allocation.
+        GpuVaRemoved(unsafe { KBox::from_raw(ptr.cast()) })
+    }
+
+    /// Take ownership of the VA data.
+    pub fn into_inner(self) -> T::VaData
+    where
+        T::VaData: Unpin,
+    {
+        KBox::into_inner(self.0).data
+    }
+}
+
+impl<T: DriverGpuVm> Deref for GpuVaRemoved<T> {
+    type Target = T::VaData;
+    fn deref(&self) -> &T::VaData {
+        &self.0.data
+    }
+}
+
+impl<T: DriverGpuVm> DerefMut for GpuVaRemoved<T>
+where
+    T::VaData: Unpin,
+{
+    fn deref_mut(&mut self) -> &mut T::VaData {
+        &mut self.0.data
+    }
+}

-- 
2.52.0.457.g6b5491de43-goog

