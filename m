Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27B4331A6A
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783074; cv=none; b=JzH/jmYGBcKfgPKUKOruC1B/ArHLoIRsYvzm93sTWaSfT9BkFh9/Tw1F5DlUoo01gh2uTjqOvTIQCN+V+0sSc+Ezk4NlNey+i3U6qlN9xYXnFkSKeB30nb94Srw+Cp8b1aCMUriX5lNUKq/na2ejyg1j3Ae9M1KoIs9l/JxHfU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783074; c=relaxed/simple;
	bh=eLhNisHxVldbjSAORK0H/oAbA90dI0faTM2nrjJzZY8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F3sVaF7+sop07pEjyE1kby5bi2PNeozHCdOG0mp8ZU/aZmLoaDNrEGGaKH9fFBL+n65ZG6f3iSgovQrOJ4oTRlQSiCzeDtI66i+FJA+SZjQaVoc9KU/j+CAYqWHfjDbMaPkx+sxNs40/GHgNu5I447vO8qJNfdJmkrhMBdmWXI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xUSPiMY0; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xUSPiMY0"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48057c39931so25394455e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 06:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769783071; x=1770387871; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3944QNBiimcmSBU0CWJuvRuEeF8KgtSwRq2Snhbdh2o=;
        b=xUSPiMY0UI4x/aJc0PVWPKz9YFYbGSgLX1cZLgXQZ1Nc4/eM/jwSEud5MdvABKJr60
         K6kGwnZmDVwmDpJ4qqfu6WCPvijP/twkRV6Px/Uag5PfcsdDgBmZnGuBC7V26S2BH94I
         aTvXm9aa7XFv7KktYw+50h6Hvjoo3wb+cxi6GNoDJpnCjXpwptHPyt95C/CHTR2/dt37
         MqN4Y9kMxxo0zCi5vnRaMAGWvTUDNHiL9LK3Nrnk7BOwqZsv0LE+lR3EMfsv01GzCsfl
         ErksrhKfN4H3PSNkcvkHelP5zSpd1Pf19XJ2L2T8tvVfYsY1SXxC7R61tRh9FAMcxqK9
         ibMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769783071; x=1770387871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3944QNBiimcmSBU0CWJuvRuEeF8KgtSwRq2Snhbdh2o=;
        b=EmV0bAHs68BKTiCZBxrZWNErhdumYTBs+H68N2yl142/aWIwwBDMwYd6j/w0DayebU
         KyDlvBrYcJKeqXnM+w1y78fyoVBs54UtRgCRB241LeQh1f4E4fJTEh7fiQiw42HbXfj5
         xAJawuP3gkhK3haMSDBDiItJCS8/OiprE4e00xcFhCY6lJjrgXNLt2V6GTNhbwpRff8F
         bZVyDwR9ZzH9+FsrcVbJRa3xwJ/G6MhspQnRUK8nlbTojSzr96ocyGtQUGUuzwzHKT5j
         x2ecYVt4+BXTxYJvW528Yzv39FcMK5AGwkcxAYcEg1mcNrw7JqX6vauwWmvGgugA/bO4
         Km7w==
X-Forwarded-Encrypted: i=1; AJvYcCVYD6dIE6iFSCmOVwqMv8tT4FgULWRbj5yO8eqMxKEPMmedifebyau8zItPodf41M49AnOE0Vq/XocAOVnphw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpc5l8okLIHF5p8muqeibGLL7BmcOPg9JjJkmfMdqjNjCPWaFQ
	TWg3AG39ZpW3n+hH87gAfNtKOvxAi3TsHZQ4xWde+G25CnkWjknP+F+zgZcUfGT+Nd9FWVY4adM
	+dem9/9/N0a1sPi/dQg==
X-Received: from wmbil22.prod.google.com ([2002:a05:600c:a596:b0:47d:50d8:6af4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34c7:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-482db47413emr41588745e9.16.1769783071255;
 Fri, 30 Jan 2026 06:24:31 -0800 (PST)
Date: Fri, 30 Jan 2026 14:24:13 +0000
In-Reply-To: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6776; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=eLhNisHxVldbjSAORK0H/oAbA90dI0faTM2nrjJzZY8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpfL8Ttv+SXxrvnn5ZalEbpepz5kw5ggYMm3jh6
 1tzLUbHgT+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaXy/EwAKCRAEWL7uWMY5
 RtE3EACjdIjwMBgmn4NIM88dT1GBf79ISVz8nY9qSmipE30ianz59B8nc2sAmNr9IvJtOoNON8F
 6SJmvVzN5EiY/A2cdWyWtn3CIcCKJd8v7EwKyykGpAH7D9YywoxXJHSAIjGwAUBb7YLSaSpwrmp
 4DtP+puAeAwfoCPpJQn5r/IVYJepTqd4lXVCBOg03pwVjqnP/kOF2dgVOQozH3OsWCNjASXnEal
 ni/apkFE+e0yvebe+Y81C3JCQgzHfX6jJqNACmr3SB61ITQYh1f+FJHUZSdF/Xn1c4RmuZ0Y6Px
 09VAwkRcCQ67pHAqmY8wbedplUq0+60BfGrVaoM+4tfrQB7jZdpQ3B/Q5jI16lovNu8sisvsETb
 G2vB/EZhP2ptbmrDCRPioU3HHfWFJXvfCqsRQWHsDu8v59/02ULcQni8ZuSV4X31JRi7V6sZQg6
 Hys5aU9QnQfZNMvuRUSOyxF+Npcc6htXfYoz2QdyD2quSKjZP58C0h2gdVS+Q+YAgMc4OeGS0bA
 ExTW3ogtNOzViVuHoee46j9XMWWkznsPOH1vO1MmRXO+3PICyf5OosmiK+vrN/V/jInAzXXHJpM
 Hg/wAbC1sECTAtY7J87seuAvu0/KXpefdpnCjvAq+As/ZisdkkRCuvve7zgL+LR6+ZIsb+oVowU i1bd43kkm+nTvpg==
X-Mailer: b4 0.14.2
Message-ID: <20260130-gpuvm-rust-v4-4-8364d104ff40@google.com>
Subject: [PATCH v4 4/6] rust: gpuvm: add GpuVa struct
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
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs |  17 ++++-
 rust/kernel/drm/gpuvm/va.rs  | 149 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 8f2f1c135e9dd071fd4b4ad0762a3e79dc922eea..c8c024ec47b0053d9941465858c0597f0dfd4950 100644
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
2.53.0.rc1.225.gd81095ad13-goog

