Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689826;
	b=m8EBOrWL64xHVOBsWyXUu1GlJHeizckfCY/t6+LHsC6w4c4XxkwVvbmBOfB3lRoFTwHU
	 /85urGzt+iMNU3dnbyxJmP/OHUCDbrderZo1ft0vYalNBzVW4y6cRxEmoTE8biuMtNngF
	 3q7/vKYER2JRXEFmlMsXfqhsUMKk4P45HW9L0bb4gUbaJBghzCHxuZdOT2I+M0x2Zo7Gp
	 gJUmBtiipnmvm8Ar0zA/zR3qP0J2NkpchpByqMUZihformZxAnwvf9g+Ia8xEZSQ2QRpv
	 jjCeMAvHI8qyNADyznMP86mARVHGdRI9KauSR5D2IoltDooFE/r9f1gPC+KMDiip1YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:User-Agent;
	bh=c1nvGyyATSzvkRs46WMcaspK2QvDsxzNoOVTMvbbYTk=;
	b=ES5NX5FulOmG2OWmHQXuCIsm3LcaxIw7PfvTlbq+CXGMdLaU1U944tST8rBoKsqk15sX
	 +P+JQKhy28givA+SFK6IpbkvI0MnEFy4kBm9tzOxouxS7i1u37fZ7kfSQN3bmTjGZQWYd
	 DmR+XGrPuHQ4EZEdghTBLPwpDPBsCFdfWweFa3ODAMCRF2W+2gGE3G7E8s9OhFX/HsfEG
	 jQadDblFytn58QFR3xIvoT5q8W3HWh4vbnhQ8BlXS1osPf32i56zFriDxeSjR/68iWZJY
	 3FGCuI1zQuxjAA1Gf98rb2JM1HxTxbLuxh+7a/gpYpCJYXV+4HzAmFYFCmc2w71ehJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=roqaHcvE;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2F6606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 10:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=roqaHcvE
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3b41c8d9767so3628131a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 02:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689825; x=1796294625; darn=vger.kernel.org;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c1nvGyyATSzvkRs46WMcaspK2QvDsxzNoOVTMvbbYTk=;
        b=roqaHcvEgGVem/kNb+hmQEF8T9M5UJBJjsH12Y61q4gBdaebiU2/rmNdxCN3STAj1W
         91jwKvUUG5YFD58BfjzmGH73aMRdaFwy+seO68u/3ZnWGMpsEINpn7QYgimW1Jzal7We
         0x83rG2ptktuEwxeqgX16bZ2JLOoDtXhsh/RL59WqOkNOMnZvQ7ILQ42Cd+gMg8Khx7Z
         RZ14873FZof1s0PnHLScH1Jb54mwx6sHN/I4YJ5bP4fcXDRTq4URZJEikhRdgj0ZSD2b
         KlC8bwSq2A42/ELv+xa4UrdowOl2DScI0rcJtHgUqGChlXp+jfjSuoeoHH7j7sPL9GaL
         jk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689825; x=1796294625;
        h=user-agent:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1nvGyyATSzvkRs46WMcaspK2QvDsxzNoOVTMvbbYTk=;
        b=ReCHt0nAcFIP75/iluUVM1aWxJ9ZRPlAJihjbyZ3o/UtAOtk/kb7NW2nHVedpECfV5
         +fZJtiKkC74o+Ad9D+5UboStz1IzRFlNuG7md8Bi1mMLwMaR8j4QIGciIbDN2M1WSlaX
         zKaH5pJMunO0bfiKBsLSlwS1bEDrN9UQ8ojQFE9+F2hBGoT/675TiIKuqyAvpUnwQrEF
         InsVOK0bgDe/h/YZ/mXQwWhhLKQAsEjGXVVwRDZefecAMzLNJMgSc3Q/oT3TwNrFYJ+S
         zWGzurgGuAj+zX0HIYBqxa+YUF7OA4EP/kYJIxQO0tH2YJZYZWJ0O6WYp3/wQc0sFPpz
         THNw==
X-Forwarded-Encrypted: i=1; AL+hErEv4GOw3BEZOIOXv6BhungvbwllQd8RMvBtJCrmZiIFfwjhzVgdB3g6QXBfyGga2cyzoaWC+1rBzrYK4UD3rw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+f4qcWUSkq6LFw2KwmLhW7VCh+Uo9KE2KKj/r8akQVthAdG9n
	dzBC5UUDbsvzE8GK2ovIg3I986Hxj0uXQZxbh3psWCSUPY75z+Al77IoqwWofE2s+Aw=
X-Gm-Gg: AZFdTZfdN68QpORgVIS1ge8vNyn4RXc59CaQjrOKsHDL+f3j+D36OD1Kq4auKXVxCDw
	3apM4SAYrVYvw1jrgv8o42/zRqBM7Sgfpe3yMGVNIAWmx13x55X39m9k8I3yFJounkdmvrtRQXg
	vgk+ec5xyodZiuwtBwVMS129EaOcAzQT+l8j8O/4AS8rDV1pIZod4gk72SIpbmVs/BFAzqFUPWQ
	qAPYEIEXjpgKijyAzSJfcDNHLeTtKYZEW+Tp6EWDWCcILo2xI5Nf2BmyFDXu0OtRAyT9kzgcJZI
	ZFZq8Or9F9CydqqA7lPkzk4NP2341+7ehHrKEs4lCP2awQQv7zem0IaDpAKHUtgRImLF/yxUynq
	vc0j8jleXYSYHygHmcTN59YBh1R1BBsEC3TzAZmMwWK4iMLKNKXEhPbLc/izGs+DkXyALrkpPPo
	TEUh/BAErU0+30qBPCQZ63lgmAe6AxK0KH79H6n4nFmh4ASzsFQgKmczodHTjLs7s48/MtlRL7J
	c177b5W7TLgWCgYM+oxeMupgySJtWb08twrQFyv4JgA21R2+FSpn0NBN1nZ25VFf/2wsq3HmMRn
	j7lBDBotvXWJSUJShbLUqAVW8Jz12ZoZf5ZRlA==
X-Received: by 2002:a17:90b:4a47:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3b41c8fe84amr21058716a91.10.1795689824766;
        Thu, 26 Nov 2026 02:43:44 -0800 (PST)
Received: from [100.88.6.56] ([1.55.160.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm35385634a91.10.2026.11.26.02.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:43:44 -0800 (PST)
From: Tran Van Tien <7enlab@gmail.com>
To: ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, oliver.mangold@pm.me, igor.korotin@linux.dev, vireshk@kernel.org, ukleinek@kernel.org
Subject: [PATCH v3] rust: sync: make AlwaysRefCounted::inc_ref an associated function
Date: Thu, 26 Nov 2026 17:43:35 +0700
Message-ID: <1795689815.75b422ec@gmail.com>
In-Reply-To: <1795684556.6d661f19@gmail.com>
References: <1795684556.6d661f19@gmail.com> <1795688552.31c01b07@gmail.com>
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

In-Reply-To: <1795684556.6d661f19@gmail.com>
References: <1795684556.6d661f19@gmail.com>

Incrementing a reference count must be a deliberate act, and every
inc_ref must be matched by exactly one dec_ref. Making inc_ref an
associated function that takes a NonNull<Self> mirrors dec_ref, which
is already an associated function because the object is freed when the
count reaches zero.

Having one half of the protocol take a reference and the other half a
raw pointer makes the pairing harder to review and easier to get wrong.

This was suggested by Benno Lossin.

Suggested-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1177
Signed-off-by: Tran Van Tien <7enlab@gmail.com>
---

Changes in v2:
  - serdev: call get_device() on the embedded struct device instead of
    recursing into serdev::Device::inc_ref() itself. Reported by Sashiko.
  - gpuvm: dereference obj before accessing the vm field. Reported by
    Sashiko.
  - gpuvm/vm_bo: dereference obj before accessing the inner field.
    Reported by Sashiko.
  - opp, pwm: dereference obj before accessing field 0. Reported by
    Sashiko.
  - Group the core::ptr::NonNull imports vertically, as the coding
    guidelines require. Reported by Sashiko.
  - Add #[inline] to inc_ref and to ARef::clone() / ARef::from().
    Reported by Sashiko.

Build tested with CONFIG_RUST_DRM_GPUVM, CONFIG_DRM_TYR and
CONFIG_RUST_SERIAL_DEV_BUS_ABSTRACTIONS enabled, so that every touched
file is actually compiled.

Changes in v3:
  - No code change. Rebased confirmation and coordination only.
  - State the base explicitly: this patch applies to the RUST tree listed
    in MAINTAINERS (git://github.com/Rust-for-Linux/linux.git rust-next)
    at v7.4-rc4, commit b6a9fa34c, where inc_ref is still a &self method.
  - Note the conflict with the in-flight series "rust: rename
    AlwaysRefCounted to RefCounted" (v22), which touches the same set of
    files and keeps inc_ref as a &self method on RefCounted. This patch is
    a different change (making inc_ref an associated function), so the two
    should be sequenced by the maintainer. I am happy to rebase on top of
    that series once it lands in rust-next.
 rust/kernel/auxiliary.rs         |  7 ++++---
 rust/kernel/block/mq/request.rs  |  6 ++++--
 rust/kernel/cred.rs              |  7 ++++---
 rust/kernel/device.rs            |  8 +++++---
 rust/kernel/device/property.rs   |  9 +++++----
 rust/kernel/dma_buf/dma_fence.rs |  7 ++++---
 rust/kernel/drm/device.rs        |  7 ++++---
 rust/kernel/drm/gem/mod.rs       |  5 +++--
 rust/kernel/drm/gpuvm/mod.rs     |  7 ++++---
 rust/kernel/drm/gpuvm/vm_bo.rs   |  7 ++++---
 rust/kernel/fs/file.rs           | 21 ++++++++++++---------
 rust/kernel/fwctl.rs             |  4 ++--
 rust/kernel/i2c.rs               | 13 +++++++------
 rust/kernel/mm.rs                | 12 ++++++------
 rust/kernel/mm/mmput_async.rs    |  6 +++---
 rust/kernel/opp.rs               |  7 ++++---
 rust/kernel/pci.rs               |  6 +++---
 rust/kernel/pid_namespace.rs     | 12 +++++++-----
 rust/kernel/platform.rs          |  7 ++++---
 rust/kernel/pwm.rs               |  6 +++---
 rust/kernel/serdev.rs            |  9 +++++++--
 rust/kernel/sync/aref.rs         | 19 ++++++++++++++-----
 rust/kernel/task.rs              | 11 +++++++----
 rust/kernel/usb.rs               | 12 ++++++------
 24 files changed, 126 insertions(+), 89 deletions(-)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 9d3de109b..3f499be2f 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -390,9 +390,10 @@ unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for Device<Ctx>
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    #[inline]
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_device(core::ptr::addr_of_mut!((*obj.as_ref().as_raw()).dev)) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/block/mq/request.rs b/rust/kernel/block/mq/request.rs
index 6115f9aec..4b82885cf 100644
--- a/rust/kernel/block/mq/request.rs
+++ b/rust/kernel/block/mq/request.rs
@@ -240,8 +240,10 @@ unsafe impl<T: Operations> Sync for Request<T> {}
 // keeps the object alive in memory at least until a matching reference count
 // decrement is executed.
 unsafe impl<T: Operations> AlwaysRefCounted for Request<T> {
-    fn inc_ref(&self) {
-        self.wrapper_ref().refcount().inc();
+    #[inline]
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
index 2291d85b6..0e96f9606 100644
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
@@ -436,9 +437,10 @@ pub fn name(&self) -> &CStr {
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_raw()) };
+    #[inline]
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_device(obj.as_ref().as_raw()) };
     }
 
     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 5aead835f..fcff7e5a2 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -4,6 +4,7 @@
 //!
 //! C header: [`include/linux/property.h`](srctree/include/linux/property.h)
 
+use core::ptr::NonNull;
 use core::{mem::MaybeUninit, ptr};
 
 use super::private::Sealed;
@@ -361,10 +362,10 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 
 // SAFETY: Instances of `FwNode` are always reference-counted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for FwNode {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the
-        // refcount is non-zero.
-        unsafe { bindings::fwnode_handle_get(self.as_raw()) };
+    #[inline]
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::fwnode_handle_get(obj.as_ref().as_raw()) };
     }
 
     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index 18a43e1bb..cc8add65b 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -566,9 +566,10 @@ pub unsafe fn from_raw<'a>(ptr: *mut bindings::dma_fence) -> &'a Self {
 // SAFETY: These implement the C backends refcounting methods which are proven
 // to work correctly.
 unsafe impl AlwaysRefCounted for Fence {
-    fn inc_ref(&self) {
-        // SAFETY: `self.as_raw()` is a pointer to a valid `struct dma_fence`.
-        unsafe { bindings::dma_fence_get(self.as_raw()) }
+    #[inline]
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: `obj.as_ref().as_raw()` is a pointer to a valid `struct dma_fence`.
+        unsafe { bindings::dma_fence_get(obj.as_ref().as_raw()) }
     }
 
     unsafe fn dec_ref(ptr: NonNull<Self>) {
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 6b88ade28..4cdb25f30 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -481,9 +481,10 @@ fn deref(&self) -> &Self::Target {
 // SAFETY: DRM device objects are always reference counted and the get/put functions
 // satisfy the requirements.
 unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::drm_dev_get(self.as_raw()) };
+    #[inline]
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::drm_dev_get(obj.as_ref().as_raw()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 85657a39e..e290c3ac9 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -52,10 +52,11 @@ unsafe impl $( <$( $tparam_id ),+> )? $crate::sync::aref::AlwaysRefCounted for $
             Self: IntoGEMObject,
             $( $( $bind_param : $bind_trait ),+ )?
         {
-            fn inc_ref(&self) {
+            #[inline]
+            unsafe fn inc_ref(obj: NonNull<Self>){
                 // SAFETY: The existence of a shared reference guarantees that the refcount is
                 // non-zero.
-                unsafe { bindings::drm_gem_object_get(self.as_raw()) };
+                unsafe { bindings::drm_gem_object_get(obj.as_ref().as_raw()) };
             }
 
             unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index d9d43d719..681daeae7 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -82,9 +82,10 @@ unsafe impl<T: DriverGpuVm> Sync for GpuVm<T> {}
 
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
 unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVm<T> {
-    fn inc_ref(&self) {
-        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
-        unsafe { bindings::drm_gpuvm_get(self.vm.get()) };
+    #[inline]
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::drm_gpuvm_get(obj.as_ref().vm.get()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/drm/gpuvm/vm_bo.rs b/rust/kernel/drm/gpuvm/vm_bo.rs
index 5989972da..0ffb7cdad 100644
--- a/rust/kernel/drm/gpuvm/vm_bo.rs
+++ b/rust/kernel/drm/gpuvm/vm_bo.rs
@@ -30,9 +30,10 @@ unsafe impl<T: DriverGpuVm> Sync for GpuVmBo<T> {}
 
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
 unsafe impl<T: DriverGpuVm> AlwaysRefCounted for GpuVmBo<T> {
-    fn inc_ref(&self) {
-        // SAFETY: By type invariants, the allocation is managed by the refcount in `self.inner`.
-        unsafe { bindings::drm_gpuvm_bo_get(self.inner.get()) };
+    #[inline]
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::drm_gpuvm_bo_get(obj.as_ref().inner.get()) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/fs/file.rs b/rust/kernel/fs/file.rs
index 23ee689bd..b5242e019 100644
--- a/rust/kernel/fs/file.rs
+++ b/rust/kernel/fs/file.rs
@@ -15,7 +15,10 @@
     sync::aref::{ARef, AlwaysRefCounted},
     types::{NotThreadSafe, Opaque},
 };
-use core::ptr;
+use core::ptr::{
+    self,
+    NonNull, //
+};
 
 /// Primitive type representing the offset within a [`File`].
 ///
@@ -199,13 +202,13 @@ unsafe impl Sync for File {}
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
-    unsafe fn dec_ref(obj: ptr::NonNull<File>) {
+    unsafe fn dec_ref(obj: NonNull<File>) {
         // SAFETY: To call this method, the caller passes us ownership of a normal refcount, so we
         // may drop it. The cast is okay since `File` has the same representation as `struct file`.
         unsafe { bindings::fput(obj.cast().as_ptr()) }
@@ -235,13 +238,13 @@ pub struct LocalFile {
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
-    unsafe fn dec_ref(obj: ptr::NonNull<LocalFile>) {
+    unsafe fn dec_ref(obj: NonNull<LocalFile>) {
         // SAFETY: To call this method, the caller passes us ownership of a normal refcount, so we
         // may drop it. The cast is okay since `LocalFile` has the same representation as
         // `struct file`.
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
index b4ff25c83..d8d96958d 100644
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
@@ -493,9 +493,10 @@ unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for I2cClient<C
 
 // SAFETY: Instances of `I2cClient` are always reference-counted.
 unsafe impl AlwaysRefCounted for I2cClient {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    #[inline]
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
index 62e446761..cec86e284 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -19,6 +19,7 @@
     sync::aref::{ARef, AlwaysRefCounted},
     types::Opaque,
 };
+use core::ptr::NonNull;
 
 #[cfg(CONFIG_CPU_FREQ)]
 /// Frequency table implementation.
@@ -1043,9 +1044,9 @@ unsafe impl Sync for OPP {}
 /// SAFETY: The type invariants guarantee that [`OPP`] is always refcounted.
 unsafe impl AlwaysRefCounted for OPP {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference means that the refcount is nonzero.
-        unsafe { bindings::dev_pm_opp_get(self.0.get()) };
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::dev_pm_opp_get(obj.as_ref().0.get()) };
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
index 979a9718f..6c625a02c 100644
--- a/rust/kernel/pid_namespace.rs
+++ b/rust/kernel/pid_namespace.rs
@@ -8,7 +8,9 @@
 //! [`include/linux/pid.h`](srctree/include/linux/pid.h)
 
 use crate::{bindings, sync::aref::AlwaysRefCounted, types::Opaque};
-use core::ptr;
+use core::ptr::{
+    NonNull, //
+};
 
 /// Wraps the kernel's `struct pid_namespace`. Thread safe.
 ///
@@ -43,13 +45,13 @@ pub unsafe fn from_ptr<'a>(ptr: *const bindings::pid_namespace) -> &'a Self {
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
-    unsafe fn dec_ref(obj: ptr::NonNull<PidNamespace>) {
+    unsafe fn dec_ref(obj: NonNull<PidNamespace>) {
         // SAFETY: The safety requirements guarantee that the refcount is non-zero.
         unsafe { bindings::put_pid_ns(obj.cast().as_ptr()) }
     }
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index ac0a012ae..37e7ec9e7 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -535,9 +535,10 @@ impl<'a> crate::dma::Device<'a> for Device<device::Core<'a>> {}
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
-        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
-        unsafe { bindings::get_device(self.as_ref().as_raw()) };
+    #[inline]
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid object.
+        unsafe { bindings::get_device(core::ptr::addr_of_mut!((*obj.as_ref().as_raw()).dev)) };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index 8aa47304b..aefcf68e2 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -629,10 +629,10 @@ pub fn new<'a>(
 // SAFETY: Implements refcounting for `Chip` using the embedded `struct device`.
 unsafe impl<T: PwmOps> AlwaysRefCounted for Chip<T> {
     #[inline]
-    fn inc_ref(&self) {
-        // SAFETY: `self.0.get()` points to a valid `pwm_chip` because `self` exists.
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid `Chip`.
         // The embedded `dev` is valid. `get_device` increments its refcount.
-        unsafe { bindings::get_device(&raw mut (*self.0.get()).dev) };
+        unsafe { bindings::get_device(&raw mut (*obj.as_ref().0.get()).dev) };
     }
 
     #[inline]
diff --git a/rust/kernel/serdev.rs b/rust/kernel/serdev.rs
index 17ca504b7..4e58cd138 100644
--- a/rust/kernel/serdev.rs
+++ b/rust/kernel/serdev.rs
@@ -571,8 +571,13 @@ unsafe impl<Ctx: device::DeviceContext> device::AsBusDevice<Ctx> for Device<Ctx>
 
 // SAFETY: Instances of `Device` are always reference-counted.
 unsafe impl AlwaysRefCounted for Device {
-    fn inc_ref(&self) {
-        self.as_ref().inc_ref();
+    #[inline]
+    unsafe fn inc_ref(obj: NonNull<Self>) {
+        // SAFETY: The safety requirements guarantee that `obj` points to a valid
+        // `serdev::Device`, and thus to a valid embedded `struct device`.
+        unsafe {
+            bindings::get_device(&raw mut (*obj.as_ptr().cast::<bindings::serdev_device>()).dev)
+        };
     }
 
     unsafe fn dec_ref(obj: NonNull<Self>) {
diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
index 9983ee085..becd2db78 100644
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
@@ -149,8 +153,10 @@ pub fn into_raw(me: Self) -> NonNull<T> {
 }
 
 impl<T: AlwaysRefCounted> Clone for ARef<T> {
+    #[inline]
     fn clone(&self) -> Self {
-        self.inc_ref();
+        // SAFETY: The type invariants guarantee that `self.ptr` is valid.
+        unsafe { T::inc_ref(self.ptr) };
         // SAFETY: We just incremented the refcount above.
         unsafe { Self::from_raw(self.ptr) }
     }
@@ -166,10 +172,13 @@ fn deref(&self) -> &Self::Target {
 }
 
 impl<T: AlwaysRefCounted> From<&T> for ARef<T> {
+    #[inline]
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
index 3336df493..76cc236fe 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -14,7 +14,10 @@
 };
 use core::{
     ops::Deref,
-    ptr, //
+    ptr::{
+        self,
+        NonNull, //
+    },
 };
 
 /// A sentinel value used for infinite timeouts.
@@ -349,9 +352,9 @@ pub fn group_leader(&self) -> &Task {
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


