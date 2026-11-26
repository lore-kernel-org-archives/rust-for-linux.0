Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795726038;
	b=qEDaC7r7cpU1IhHI5JnVr782BZIvAd+nMiX5/UUHIg9bvynMYEh7hepGlluS6PVeSASo
	 qXaUksmZQiYiCZH54Xelftq2ztq1fR1xwptZzreucev/ZJxp4UW4ooyvXp66B8UHZCl1D
	 sg/ha5Po5bmhwenYsbnl6BTclhZH2Vp04cTBz8Ce6UidU3Lr8/8NnDIdoXrpUtk3IcT3d
	 HkI/E7EmRVgDwYsCr3UKG8x459iInpVbYa6nB0Sloh3ZyY4mmOP71WIeFGH0AGsGS+vjB
	 7LD5YS/v1ZZiew/11n7n5GCGM2dDpLEX+0OdXPBus39gAXoh2wJ5ohT/G69tvJ8Vecw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726038;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=7skOuYzYPTry/TblpYJR9UAACaIhegaKxC50HTc/l38=;
	b=yv9HtW06mOhVPNDikRkGJz589VK6IbCvWJFSMKrxhBVhAg2iQXt1llciO6fdJMvMxBfZ
	 ktiljrbOVsgS2kd45GxhKO9SaWAQRi3Fnlhknsq5FMLgHQs+MrZIVtJmuzqOoP9tWTVfW
	 e+97XpMcC5s1vbd2IGrUZznXf/BcGKxOd2ZGvrCR+TdeSsWq7R+xi0GxPnrwbeUPIOJgu
	 QtpwC28QH5U2ni18+Es+Cj0pgq/L1A+M9KbFNE/k9idkMC7XKc5npwl3lliC/vDmSczMY
	 A6h7jnir3oTXfsJFI497Mrb4Hk+zufwVTcidGOwD2y4K+JVlWqhgXzNVWfnCFu5GGGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Ds91mDRD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EF9606A31C;
	Thu, 26 Nov 2026 20:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3EF9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Ds91mDRD
ARC-Seal: i=1; a=rsa-sha256; t=1795726006; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LJMlbpytMkIyPev2CDE2n1g89s8TKpLiiaXHOrCPCLdqfEUdGeg4lFNi97n6GF/pKewDodXH+oJvtIJNpCQnviSyiERsujRGBw4pZHYSAcwLpIU5w81FsaElFCU7zdcIUfS28QPMx7JYnvAroUjqmMd8tSy1yqJZlrpq9JT11k8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795726006; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7skOuYzYPTry/TblpYJR9UAACaIhegaKxC50HTc/l38=; 
	b=Cn46JgpsOtaK0NN/shdfZXr0OMUmVXLjIeY0JGipQ4eXXUoXSTR6TCLtx0ocgj3wR6lzeWLTlr+2348taENoIPPiKNnL3+oqI+j/nIr3mOhid/g7MvyjR76AnCs2QVDbv7ZYfBieD+8LsC8cTICRmWSwtvD9cilzYSZrA4oGi1o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Ds91mDRDQmnDJYklSX21AT3u9i8jv8tNbnuMxmAegeCzPQBx3zcaR6NTdeo1nufRBfoWZ/6zVSSA8qcOrajCCoa8g9ZkCz24Ms9Znt2r2Pkcf6BhWXZQMoLcekZhfcnHeFHDdvd5PH1zUSHtjzxiZqDuR2bmXIojutFfViRYDSI=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=7skOuYzYPTry/TblpYJR9UAACaIhegaKxC50HTc/l38=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179572600353920.21911314558963;
	Thu, 26 Nov 2026 12:46:43 -0800 (PST)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Thu, 26 Nov 2026 17:44:40 -0300
Subject: [PATCH] rust: drm: gpuvm: store the driver data in UniqueRefGpuVm
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-gpuvm-data-in-handle-v1-1-47b1e9928f20@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAyF4atI1gZMkSy8yuCittGJOFVaFUG8u
 3VcfvDef0KSqJKgKU6IsmvSOWRQWYD72jAIqs8GUxkmMozDsu0/9Ha1qAHzxE+CrqurmiwzCUO
 +LlF6Pf7ZT/s6bd0obn1acF03PoS2IngAAAA=
X-Change-ID: 20261126-gpuvm-data-in-handle-cb4041a661e6
To: Danilo Krummrich <dakr@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthew Leach <matthew.leach@collabora.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15.2
X-ZohoMailClient: External

GpuVm<T> keeps the driver data in an UnsafeCell<T> inside the
refcounted allocation, and UniqueRefGpuVm hands it out through unsafe
accessors. Only UniqueRefGpuVm accesses the data, so it does not need
to live in the shared allocation.

Move the data into UniqueRefGpuVm, which turns data() and data_mut()
into plain field accesses. GpuVm<T> keeps a PhantomData<*mut T> so that
it stays invariant in T without the UnsafeCell.

The data is now dropped with UniqueRefGpuVm rather than when the last
reference to the GpuVm goes away, and UniqueRefGpuVm is Unpin only if T
is.

Suggested-by: Matthew Leach <matthew.leach@collabora.com>
Suggested-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/drm/gpuvm/mod.rs | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index 23e73da865fb..d3b11e2a39d5 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -28,7 +28,6 @@
 };
 
 use core::{
-    cell::UnsafeCell,
     marker::PhantomData,
     mem::{
         ManuallyDrop,
@@ -62,22 +61,21 @@
 /// # Invariants
 ///
 /// * Stored in an allocation managed by the refcount in `self.vm`.
-/// * Access to `data` and the gpuvm interval tree is controlled via the [`UniqueRefGpuVm`] type.
+/// * Access to the gpuvm interval tree is controlled via the [`UniqueRefGpuVm`] type.
 /// * Does not contain any sparse [`GpuVa<T>`] instances.
 #[pin_data]
 pub struct GpuVm<T: DriverGpuVm> {
     #[pin]
     vm: Opaque<bindings::drm_gpuvm>,
-    /// Accessed only through the [`UniqueRefGpuVm`] reference.
-    data: UnsafeCell<T>,
+    _invariant: PhantomData<*mut T>,
 }
 
 // SAFETY: It is safe to send a `GpuVm<T>` to another thread: all data reachable through it
-// (`T`, `T::VmBoData`, and the GEM `T::Object`) is `Send` by the `DriverGpuVm` bounds.
+// (`T::VmBoData` and the GEM `T::Object`) is `Send` by the `DriverGpuVm` bounds.
 unsafe impl<T: DriverGpuVm> Send for GpuVm<T> {}
 // SAFETY: It is safe to share a `&GpuVm<T>` between threads: `&self` methods only alias data
-// that is `Sync` by the `DriverGpuVm` bounds, and any thread may drop that data, or upgrade the
-// reference and ultimately drop `T`, which the same bounds make `Send`.
+// that is `Sync` by the `DriverGpuVm` bounds, and any thread may drop that data, which the same
+// bounds make `Send`.
 unsafe impl<T: DriverGpuVm> Sync for GpuVm<T> {}
 
 // SAFETY: By type invariants, the allocation is managed by the refcount in `self.vm`.
@@ -132,7 +130,7 @@ pub fn new<E, Ctx: drm::DeviceContext>(
     {
         let obj = KBox::try_pin_init::<E>(
             try_pin_init!(Self {
-                data: UnsafeCell::new(data),
+                _invariant: PhantomData,
                 vm <- Opaque::ffi_init(|vm| {
                     // SAFETY: These arguments are valid. `vm` is valid until refcount drops to
                     // zero. The `vm` is zeroed before calling this method by `__GFP_ZERO` flag
@@ -163,7 +161,7 @@ pub fn new<E, Ctx: drm::DeviceContext>(
             )))
         };
         // INVARIANT: This reference is unique.
-        Ok(UniqueRefGpuVm(aref))
+        Ok(UniqueRefGpuVm { vm: aref, data })
     }
 
     /// Access this [`GpuVm`] from a raw pointer.
@@ -298,29 +296,28 @@ fn sm_step_remap<'op, 'ctx>(
 
 /// The core of the DRM GPU VA manager.
 ///
-/// This object is a unique reference to the VM that can access the interval tree and the Rust
-/// `data` field.
+/// This object is a unique reference to the VM that can access the interval tree. It also owns
+/// the Rust `data` field.
 ///
 /// # Invariants
 ///
 /// Each `GpuVm` instance has at most one `UniqueRefGpuVm` reference.
-// `Send`/`Sync` derive from `ARef<GpuVm<T>>`; the trait bounds make them correct for the unique
-// handle's `&mut T` access.
-pub struct UniqueRefGpuVm<T: DriverGpuVm>(ARef<GpuVm<T>>);
+pub struct UniqueRefGpuVm<T: DriverGpuVm> {
+    vm: ARef<GpuVm<T>>,
+    data: T,
+}
 
 impl<T: DriverGpuVm> UniqueRefGpuVm<T> {
     /// Access the data owned by this `UniqueRefGpuVm` immutably.
     #[inline]
     pub fn data(&self) -> &T {
-        // SAFETY: By the type invariants we may access `data`.
-        unsafe { &*self.0.data.get() }
+        &self.data
     }
 
     /// Access the data owned by this `UniqueRefGpuVm` mutably.
     #[inline]
     pub fn data_mut(&mut self) -> &mut T {
-        // SAFETY: By the type invariants we may access `data`.
-        unsafe { &mut *self.0.data.get() }
+        &mut self.data
     }
 }
 
@@ -329,6 +326,6 @@ impl<T: DriverGpuVm> Deref for UniqueRefGpuVm<T> {
 
     #[inline]
     fn deref(&self) -> &GpuVm<T> {
-        &self.0
+        &self.vm
     }
 }

---
base-commit: 94c9ad2fd7a15f58782c50e471397d1efe6b6363
change-id: 20261126-gpuvm-data-in-handle-cb4041a661e6

Best regards,
--  
Daniel Almeida <daniel.almeida@collabora.com>

