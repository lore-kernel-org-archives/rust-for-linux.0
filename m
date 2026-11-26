Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684567;
	b=NYRFATGC6PR2A04EEaJli2TdS9QkXLlgEyqKOveMJNIc65clQ6CSnbaigMD4k0J9XITe
	 OM3gplYazOaAWZNVEpilYfN/9nX+HxzG0IEq/jpYZP4nmNoQieNwr0dyBMutm+lstkjPC
	 RRzmR72UK1jZbifrg1EV/I47Pfy9T2TJQ8OYSJT61gefcjQv/6akw/Wzw2716xLH/rJsh
	 H7wFii7hQSeLkm/1zGCPSzOPlw8xlySYpsMM0kmvJ/Fw4qIM/sgZHf+ZyChBg6CEXovKj
	 qqFajjA5QerkPbf8OL3NQZ59T6+XzordCn7eepfUG4CN360BkMCAabK/PiYqaLZQGLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:User-Agent;
	bh=u+KLpNY2dU02tYhy42ZvU+l2NLhTWxQ80l+Z82aKbCw=;
	b=bixs7dC+uv4Dz0KBVKEAnAO2Ur55y6avnYojvqzKx0lTZyOppeY7jkrZ/pJXFHD0BVnR
	 sBExe7d7kj8VvPDbxKGC7w1cj9O7G2p/TnuBUGY6/OPy4f2s1/Mgqp7sMqGlsuSTBKpuY
	 LOBbvloFbdD9cFAQCZ2tYpYQj2DBVYhj+gtKU8U6NQF1QU1iqzaDrcF3o33gdWTaeYpsT
	 XG4cyMOy4QvAIOkSQIssylEQuOLf2nvsIXpM3wSp7NoZN2XCgzrMa5WP/3oBX2r1YptNy
	 FQ+uwjXoWxxf04ZBytO6j56He/rj7QC+mgE98ARv3NfeIcWhvtBOK6KKlkSghPcnG7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2XoQI0E;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48127606A333
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 09:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48127606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c2XoQI0E
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2ed408b0d0bso39395865ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 01:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684566; x=1796289366; darn=vger.kernel.org;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+KLpNY2dU02tYhy42ZvU+l2NLhTWxQ80l+Z82aKbCw=;
        b=c2XoQI0ET+xArlm0kliUPwM9rZDJDpQbL/cRu+mxrY1rjmsGlajdeWNEhl+OpqxyI/
         AUwUovflJHeuSlyn5+ZGQRdWDpDqetVdKiWml0mWtWvjnmM88ULyi7cPnmYTznq/zw3t
         wYcq3ED2uSu27DiSASdK2U5hRunl5YvMMFZswLp9FktjWZ6syBJn6S/ORd1tr72D71Nm
         BoJmSoj3XHh0eEkT7Od6eDGEPjtIOIpNDCfOQS3aVlF9B+C7i3V1t4hDdAxOp6NdSFPx
         Ia6X1Kah80AOofoSyHkS/SsdQqpMyn4GUspACMm3S9CQAkzrMHl1p9K6QRiXSh4wywvB
         l/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684566; x=1796289366;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+KLpNY2dU02tYhy42ZvU+l2NLhTWxQ80l+Z82aKbCw=;
        b=1BcTSb9o+emEeG2ybr01xSO/NoeKiuf3u3shtkDI2u5R62ZTQsyoFd3PUqfT4Hv8hD
         BKlD102brUo9/18nVHbm/6MRgPl+OgYkkVYPQ00+W9mlYdjePiCTmHr86d3IpMSE9E+o
         DCzZM8CbyRe3cCQei+ah///UhqMTmaVpol6iGZ5qcx0XFuctxLMrR8y6oLELkWBJ8Uxm
         VIdr9L8RvwySxH/yUsfsNS2rwqy8o1xiHO+EFki9nZO8gqIMjlydyYwgI+2hsJd8uxpY
         1szbNgL6RpXYjexw1H2gzCEfANt454oi/6ppvWkQ8CAVuEPXHNliCCbrbhfRDdWzXhQ9
         gUrg==
X-Forwarded-Encrypted: i=1; AL+hErG2iw6OrQlBgx4VqbDpgGHG9CTZfcANphdRNG3hshz9Om8OB+9tBGwwoRP654GN1AKvW0dbuasA7pxd780cvA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9gfKVevUNsa9tBZ9UrATtTNVopvsU8MD8A1qkJkpRRJrwQT75h
	Vrh9gsHHQM/ruuRFqWGT8FKp3crh9uJrNSN609kUgqRYL+MWYovp9EOl
X-Gm-Gg: AZFdTZe3jZM42RPswuMcf5arb+0gOwfHLdFYDvQ29/+G2/cA5XDTJBHi3lGkPkvRUoy
	HuDiizhhUV9eSZuTsY2anzAM0NdTqeX2YW1eJH8R10+9n9fiEI7AZeIITAs+d5JWDnOULuAc0qZ
	lATbRTDHjIO8NrVRE3WHDgCiJhJJne5D9I0rtD+PaOZnxSFgwdr9z1HnioqZ+hLbpNCoL64StKG
	odKaCJw2Q47qHFr5O7lDDvA6W2uZGjWk0hDVxnADrbpqqA+lmSBY7y+MEudg85oZZmSoVur+0cA
	We8cfipJluQdB0n8YSuU3Aaa8IBN4jk6jsIt+dkVVUkZ4aefz0qpMwKmjV+J9eKqzzd85/6TgEe
	bD5krECrvMFe+T70fhtZ0bM5bF0vpVMEGESLDI02eDLOxbfOK9CX11Y6nD/+Hkcl1La0/IzedTM
	VC0NNbhPbC75EGnYB9ome+CL7bSpiugCJh8moC7ATEaVbFYEHi619lqfXLktZkWct6c6R9Qhxf4
	bcoJB6uJLzUbuyfF5F1ETFYpFmKIMU/ttOLznqFYOcwPvq1tNyWvjWyVRKB93BMIu24rA/YONw8
	LU8a1s2Ciq52fJcTcHcywbPs6hx70H7FUXfBjYsIqR7f8bnDsoS9oq1TbHQ=
X-Received: by 2002:a17:903:2450:b0:2ef:f312:b848 with SMTP id d9443c01a7336-2f03f16ca8emr218494285ad.48.1795684565324;
        Thu, 26 Nov 2026 01:16:05 -0800 (PST)
Received: from [100.88.6.56] ([1.55.160.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f07d6d4bddsm72065295ad.62.2026.11.26.01.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:16:04 -0800 (PST)
From: Tran Van Tien <7enlab@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rust: sync: make `AlwaysRefCounted::inc_ref` an associated function
Date: Thu, 26 Nov 2026 16:15:56 +0700
Message-ID: <1795684556.6d661f19@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
User-Agent: git/2.47.3

`AlwaysRefCounted::inc_ref` is currently a method taking `&self`, which
makes it easy to increment the reference count by accident on any value
that happens to be in scope. Incrementing the refcount should be a
deliberate act: every successful call must be paired with exactly one
`dec_ref`, and getting that wrong leaks the object or frees it early.

`dec_ref` is already an associated function taking `NonNull<Self>` for
the same reason. Align `inc_ref` with it so that the two halves of the
refcount protocol have the same shape, and so that a call site has to
name the type explicitly.

Callers that legitimately need to increment the refcount now obtain a
`NonNull` first, which also makes the safety requirement explicit: the
pointer must be valid.

This is a mechanical conversion of the trait and of all 27
implementations in-tree. `ARef::clone` and `From<&T> for ARef<T>`
already hold a `NonNull`, so they pass it directly. `serdev::Device`
forwards to the inner `device::Device` implementation. `Fence`,
`FwNode`, `GpuVm`, `I2cAdapter`, `I2cClient`, `Request`, `Mm`,
`MmWithUser`, `MmWithUserAsync`, `OPP`, `Chip`, `Credential`,
`PidNamespace`, `Task`, `LocalFile`, `File`, and `Device` (platform,
pci, usb, auxiliary, drm) each take the raw pointer through a shared
reference.

All 27 implementations are converted; no behaviour changes.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1177
Signed-off-by: Tran Van Tien <7enlab@gmail.com>
---
 rust/kernel/auxiliary.rs         |  6 +++---
 rust/kernel/block/mq/request.rs  |  5 +++--
 rust/kernel/cred.rs              |  7 ++++---
 rust/kernel/device.rs            |  7 ++++---
 rust/kernel/device/property.rs   |  8 ++++----
 rust/kernel/dma_buf/dma_fence.rs |  6 +++---
 rust/kernel/drm/device.rs        |  6 +++---
 rust/kernel/drm/gem/mod.rs       |  4 ++--
 rust/kernel/drm/gpuvm/mod.rs     |  6 +++---
 rust/kernel/drm/gpuvm/vm_bo.rs   |  6 +++---
 rust/kernel/fs/file.rs           | 13 +++++++------
 rust/kernel/fwctl.rs             |  4 ++--
 rust/kernel/i2c.rs               | 12 ++++++------
 rust/kernel/mm.rs                | 12 ++++++------
 rust/kernel/mm/mmput_async.rs    |  6 +++---
 rust/kernel/opp.rs               |  6 +++---
 rust/kernel/pci.rs               |  6 +++---
 rust/kernel/pid_namespace.rs     |  7 ++++---
 rust/kernel/platform.rs          |  6 +++---
 rust/kernel/pwm.rs               |  6 +++---
 rust/kernel/serdev.rs            |  5 +++--
 rust/kernel/sync/aref.rs         | 17 ++++++++++++-----
 rust/kernel/task.rs              |  7 ++++---
 rust/kernel/usb.rs               | 12 ++++++------
 24 files changed, 97 insertions(+), 83 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 9d3de109b..d394b2098 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -390,9 +390,9 @@ unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for Device<Ctx>
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_device(core::ptr::addr_of_mut!((*obj.as_ref().as_raw()).dev)) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index 6115f9aec..7ef0822b2 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -240,8 +240,9 @@ unsafe impl<T: Operations> Sync for Request<T> {}
 // keeps the object alive in memory at least until a matching reference count
 // decrement is executed.
 unsafe impl<T: Operations> AlwaysRefCounted for Request<T> {
-    fn inc_ref(&self) {
-        self.wrapper_ref().refcount().inc();
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` is valid.
+        unsafe { obj.as_ref().wrapper_ref().refcount().inc() };
     }
 
     unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
diff --git a/rust/kernel/cred.rs b/rust/kernel/cred.rs
index ffa156b9d..2a2b2d3b0 100644
--- a/rust/kernel/cred.rs
+++ b/rust/kernel/cred.rs
@@ -9,6 +9,7 @@
 //! Reference: <https://www.kernel.org/doc/html/latest/security/credentials.html>
 
 use crate::{bindings, sync::aref::AlwaysRefCounted, task::Kuid, types::Opaque};
+use core::ptr::NonNull;
 
 /// Wraps the kernel's `struct cred`.
 ///
@@ -78,9 +79,9 @@ pub fn euid(&self) -> Kuid {
 // SAFETY: The type invariants guarantee that `Credential` is always ref-counted.
 unsafe impl AlwaysRefCounted for Credential {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
-        unsafe { bindings::get_cred(self.0.get()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_cred(obj.as_ref().0.get()) };
     }
 
     #[inline]
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 2291d85b6..6212a6c3d 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -14,6 +14,7 @@
         Opaque, //
     }, //
 };
+use core::ptr::NonNull;
 use core::{
     marker::PhantomData,
     ptr, //
@@ -436,9 +437,9 @@ pub fn name(&self) -> &CStr {
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_device(obj.as_ref().as_raw()) };
     }
 
     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 5aead835f..171fabfeb 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -4,6 +4,7 @@
 //!
 //! C header: [`include/linux/property.h`](srctree/include/linux/property.h)
 
+use core::ptr::NonNull;
 use core::{mem::MaybeUninit, ptr};
 
 use super::private::Sealed;
@@ -361,10 +362,9 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for FwNode {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the
-        // refcount is non-zero.
-        unsafe { bindings::fwnode_handle_get(self.as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::fwnode_handle_get(obj.as_ref().as_raw()) };
     }
 
     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 18a43e1bb..ed89e117a 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -566,9 +566,9 @@ pub unsafe fn from_raw<'a>(ptr: *mut bindings::dma_fence) -> &'a Self {
 // SAFETY: These implement the C backends refcounting methods which are proven
 // to work correctly.
 unsafe impl AlwaysRefCounted for Fence {
-    fn inc_ref(&self) {
-        // SAFETY: `self.as_raw()` is a pointer to a valid `struct dma_fence`.
-        unsafe { bindings::dma_fence_get(self.as_raw()) }
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: `obj.as_ref().as_raw()` is a pointer to a valid `struct dma_fence`.
+        unsafe { bindings::dma_fence_get(obj.as_ref().as_raw()) }
     }
 
     unsafe fn dec_ref(ptr: NonNull<Self>) {
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 6b88ade28..db3df7085 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -481,9 +481,9 @@ fn deref(&self) -> &Self::Target {
 // SAFETY: DRM device objects are always reference counted and the get/put functions
 // satisfy the requirements.
 unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::drm_dev_get(self.as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::drm_dev_get(obj.as_ref().as_raw()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 85657a39e..e064de8ef 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -52,10 +52,10 @@ unsafe impl $( <$( $tparam_id ),+> )? $crate::sync::aref::AlwaysRefCounted for $
             Self: IntoGEMObject,
             $( $( $bind_param : $bind_trait ),+ )?
         {
-            fn inc_ref(&self) {
+            unsafe fn inc_ref(obj: NonNull<Self>){
                 // SAFETY: The existence of a shared reference guarantees that the refcount is
                 // non-zero.
-                unsafe { bindings::drm_gem_object_get(self.as_raw()) };
+                unsafe { bindings::drm_gem_object_get(obj.as_ref().as_raw()) };
             }
 
             unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index d9d43d719..b8ac14d04 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -82,9 +82,9 @@ unsafe impl<T: DriverGpuVm> Sync for GpuVm<T> {}
 
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
 unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
-    fn inc_ref(&self) {
-        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
-        unsafe { bindings::drm_gpuvm_get(self.vm.get()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: By type invariants, the allocation is managed by the refcount in `obj.vm`.
+        unsafe { bindings::drm_gpuvm_get(obj.vm.get()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index 5989972da..b46aa9ef3 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -30,9 +30,9 @@ unsafe impl<T: DriverGpuVm> Sync for GpuVmBo<T> {}
 
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
 unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
-    fn inc_ref(&self) {
-        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
-        unsafe { bindings::drm_gpuvm_bo_get(self.inner.get()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: By type invariants, the allocation is managed by the refcount in `obj.inner`.
+        unsafe { bindings::drm_gpuvm_bo_get(obj.inner.get()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 23ee689bd..c5a2649ae 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -16,6 +16,7 @@
     types::{NotThreadSafe, Opaque},
 };
 use core::ptr;
+use core::ptr::NonNull;
 
 /// Primitive type representing the offset within a [`File`].
 ///
@@ -199,9 +200,9 @@ unsafe impl Sync for File {}
 // makes `ARef<File>` own a normal refcount.
 unsafe impl AlwaysRefCounted for File {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
-        unsafe { bindings::get_file(self.as_ptr()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_file(obj.as_ref().as_ptr()) };
     }
 
     #[inline]
@@ -235,9 +236,9 @@ pub struct LocalFile {
 // makes `ARef<LocalFile>` own a normal refcount.
 unsafe impl AlwaysRefCounted for LocalFile {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
-        unsafe { bindings::get_file(self.as_ptr()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_file(obj.as_ref().as_ptr()) };
     }
 
     #[inline]
diff --git a/rust/kernel/fwctl.rs b/rust/kernel/fwctl.rs
index b7778e4d5..8f1d094b5 100644
--- a/rust/kernel/fwctl.rs
+++ b/rust/kernel/fwctl.rs
@@ -261,9 +261,9 @@ fn as_ref(&self) -> &device::Device {
 // `fwctl_put` decrements it and frees the device when it reaches zero.
 unsafe impl<T: Operations> AlwaysRefCounted for Device<T> {
     #[inline]
-    fn inc_ref(&self) {
+    unsafe fn inc_ref(obj: NonNull<Self>) {
         // SAFETY: `self` holds a live reference.
-        unsafe { bindings::fwctl_get(self.as_raw()) };
+        unsafe { bindings::fwctl_get(obj.as_ref().as_raw()) };
     }
 
     #[inline]
diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
index b4ff25c83..6ccfe8ff3 100644
--- a/rust/kernel/i2c.rs
+++ b/rust/kernel/i2c.rs
@@ -416,9 +416,9 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
 // SAFETY: Instances of `I2cAdapter` are always reference-counted.
 unsafe impl AlwaysRefCounted for I2cAdapter {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::i2c_get_adapter(self.index()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::i2c_get_adapter(obj.as_ref().index()) };
     }
 
     #[inline]
@@ -493,9 +493,9 @@ unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for I2cClient<C
 
 // SAFETY: Instances of `I2cClient` are always reference-counted.
 unsafe impl AlwaysRefCounted for I2cClient {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_device(obj.as_ref().as_ref().as_raw()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index 58bc1793f..f5deac0b7 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -57,9 +57,9 @@ unsafe impl Sync for Mm {}
 // SAFETY: By the type invariants, this type is always refcounted.
 unsafe impl AlwaysRefCounted for Mm {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The pointer is valid since self is a reference.
-        unsafe { bindings::mmgrab(self.as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The pointer is valid since obj is a reference.
+        unsafe { bindings::mmgrab(obj.as_ref().as_raw()) };
     }
 
     #[inline]
@@ -93,9 +93,9 @@ unsafe impl Sync for MmWithUser {}
 // SAFETY: By the type invariants, this type is always refcounted.
 unsafe impl AlwaysRefCounted for MmWithUser {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The pointer is valid since self is a reference.
-        unsafe { bindings::mmget(self.as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The pointer is valid since obj is a reference.
+        unsafe { bindings::mmget(obj.as_ref().as_raw()) };
     }
 
     #[inline]
diff --git a/rust/kernel/mm/mmput_async.rs b/rust/kernel/mm/mmput_async.rs
index b8d2f0512..2e490f8ce 100644
--- a/rust/kernel/mm/mmput_async.rs
+++ b/rust/kernel/mm/mmput_async.rs
@@ -36,9 +36,9 @@ unsafe impl Sync for MmWithUserAsync {}
 // SAFETY: By the type invariants, this type is always refcounted.
 unsafe impl AlwaysRefCounted for MmWithUserAsync {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The pointer is valid since self is a reference.
-        unsafe { bindings::mmget(self.as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` is valid.
+        unsafe { bindings::mmget(obj.as_ref().as_raw()) };
     }
 
     #[inline]
diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 62e446761..651cbc945 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -1043,9 +1043,9 @@ unsafe impl Sync for OPP {}
 /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
 unsafe impl AlwaysRefCounted for OPP {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
-        unsafe { bindings::dev_pm_opp_get(self.0.get()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::dev_pm_opp_get(obj.0.get()) };
     }
 
     #[inline]
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 769d01d23..0fdf7caa5 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -512,9 +512,9 @@ impl<'a> crate::dma::Device<'a> for Device<device::Core<'a>> {}
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::pci_dev_get(self.as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::pci_dev_get(obj.as_ref().as_raw()) };
     }
 
     #[inline]
diff --git a/rust/kernel/pid_namespace.rs b/rust/kernel/pid_namespace.rs
index 979a9718f..fdc0243f5 100644
--- a/rust/kernel/pid_namespace.rs
+++ b/rust/kernel/pid_namespace.rs
@@ -9,6 +9,7 @@
 
 use crate::{bindings, sync::aref::AlwaysRefCounted, types::Opaque};
 use core::ptr;
+use core::ptr::NonNull;
 
 /// Wraps the kernel's `struct pid_namespace`. Thread safe.
 ///
@@ -43,9 +44,9 @@ pub unsafe fn from_ptr<'a>(ptr: *const bindings::pid_namespace) -> &'a Self {
 // SAFETY: Instances of `PidNamespace` are always reference-counted.
 unsafe impl AlwaysRefCounted for PidNamespace {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
-        unsafe { bindings::get_pid_ns(self.as_ptr()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_pid_ns(obj.as_ref().as_ptr()) };
     }
 
     #[inline]
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index ac0a012ae..0c166c220 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -535,9 +535,9 @@ impl<'a> crate::dma::Device<'a> for Device<device::Core<'a>> {}
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_device(core::ptr::addr_of_mut!((*obj.as_ref().as_raw()).dev)) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 8aa47304b..f4f9d858e 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -629,10 +629,10 @@ pub fn new<'a>(
 // SAFETY: Implements refcounting for `Chip` using the embedded `struct device`.
 unsafe impl<T: PwmOps> AlwaysRefCounted for Chip<T> {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: `self.0.get()` points to a valid `pwm_chip` because `self` exists.
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: `obj.0.get()` points to a valid `pwm_chip` because `self` exists.
         // The embedded `dev` is valid. `get_device` increments its refcount.
-        unsafe { bindings::get_device(&raw mut (*self.0.get()).dev) };
+        unsafe { bindings::get_device(&raw mut (*obj.0.get()).dev) };
     }
 
     #[inline]
diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index 17ca504b7..7319a5c4a 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -571,8 +571,9 @@ unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for Device<Ctx>
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
-        self.as_ref().inc_ref();
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements of this function guarantee that `obj` is valid.
+        unsafe { Device::inc_ref(obj.cast()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 9983ee085..0198c042e 100644
--- a/rust/kernel/sync/aref.rs
+++ b/rust/kernel/sync/aref.rs
@@ -49,7 +49,11 @@
 /// alive.)
 pub unsafe trait AlwaysRefCounted {
     /// Increments the reference count on the object.
-    fn inc_ref(&self);
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `obj` points to a valid object of this type.
+    unsafe fn inc_ref(obj: NonNull<Self>);
 
     /// Decrements the reference count on the object.
     ///
@@ -131,7 +135,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
     ///
     /// # // SAFETY: TODO.
     /// unsafe impl AlwaysRefCounted for Empty {
-    ///     fn inc_ref(&self) {}
+    ///     unsafe fn inc_ref(_obj: NonNull<Self>) {}
     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
     /// }
     ///
@@ -150,7 +154,8 @@ pub fn into_raw(me: Self) -> NonNull<T> {
 
 impl<T: AlwaysRefCounted> Clone for ARef<T> {
     fn clone(&self) -> Self {
-        self.inc_ref();
+        // SAFETY: The type invariants guarantee that `self.ptr` is valid.
+        unsafe { T::inc_ref(self.ptr) };
         // SAFETY: We just incremented the refcount above.
         unsafe { Self::from_raw(self.ptr) }
     }
@@ -167,9 +172,11 @@ fn deref(&self) -> &Self::Target {
 
 impl<T: AlwaysRefCounted> From<&T> for ARef<T> {
     fn from(b: &T) -> Self {
-        b.inc_ref();
+        let ptr = NonNull::from(b);
+        // SAFETY: `ptr` comes from a live shared reference.
+        unsafe { T::inc_ref(ptr) };
         // SAFETY: We just incremented the refcount above.
-        unsafe { Self::from_raw(NonNull::from(b)) }
+        unsafe { Self::from_raw(ptr) }
     }
 }
 
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 3336df493..c60e6e0cb 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -12,6 +12,7 @@
     sync::aref::ARef,
     types::{NotThreadSafe, Opaque},
 };
+use core::ptr::NonNull;
 use core::{
     ops::Deref,
     ptr, //
@@ -349,9 +350,9 @@ pub fn group_leader(&self) -> &Task {
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for Task {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
-        unsafe { bindings::get_task_struct(self.as_ptr()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_task_struct(obj.as_ref().as_ptr()) };
     }
 
     #[inline]
diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 993760ff3..812159a82 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -375,11 +375,11 @@ fn as_ref(&self) -> &Device {
 // SAFETY: Instances of `Interface` are always reference-counted.
 unsafe impl AlwaysRefCounted for Interface {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The invariants of `Interface` guarantee that `self.as_raw()`
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The invariants of `Interface` guarantee that `obj.as_ref().as_raw()`
         // returns a valid `struct usb_interface` pointer, for which we will
         // acquire a new refcount.
-        unsafe { bindings::usb_get_intf(self.as_raw()) };
+        unsafe { bindings::usb_get_intf(obj.as_ref().as_raw()) };
     }
 
     #[inline]
@@ -428,11 +428,11 @@ fn as_raw(&self) -> *mut bindings::usb_device {
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl AlwaysRefCounted for Device {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The invariants of `Device` guarantee that `self.as_raw()`
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The invariants of `Device` guarantee that `obj.as_raw()`
         // returns a valid `struct usb_device` pointer, for which we will
         // acquire a new refcount.
-        unsafe { bindings::usb_get_dev(self.as_raw()) };
+        unsafe { bindings::usb_get_dev(obj.as_ref().as_raw()) };
     }
 
     #[inline]
-- 
2.47.3



