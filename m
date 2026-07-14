Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A7C3A4510;
	Tue, 14 Jul 2026 03:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999164; cv=pass; b=DFSc1zBUTe5hjaPfSATlStPPet8/hsFny9y8zcTRWRo6GBl7yaEYkhJUUJDk1oEWEQk5X1Ur8L+4gS8zgGTglxwiX3p0jS05HhFmCP14K7J8ednW+BdJ9YTpm6nNaaAuKmhFZlk81xe5IS3qCTUFURzkheIm8NSIarEh0u1hSbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999164; c=relaxed/simple;
	bh=/sD3Dwni/MdYye4RpZVxgxUSX49sFfnkmHpx+hyNdSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDX9LNuEqBckqkANhRazJxMynSf73h09HbZLBquQekqN6Dlxau2CQTUttowz48P6PkME0GOlAWdjDs2bhKYURg6nxeyYTqooRZsS6XGtCYPh3xY3TGLlzHeq81+BUDFA5jqSSb7L+wCeucWC2953eiZnMxIzlOPJ0M9aTJs6lkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=bsHizDiu; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="bsHizDiu"
ARC-Seal: i=1; a=rsa-sha256; t=1783999140; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MPVuydFc09nt4VsIA5J0hFANZi22dIzC3EaiNJn+afYnhGoFyjmAYEv2uiuu6Vh4Xx51uOg8fmiZa/+AWQ4Xqv6ZHr2MBe0XShIMZY1Hr4tMVUCQ765+Os/tFV0tTa79dDEy9FCpb5X97Yvv1AyXLBj7+Gz1c9IeiEPQ6hu4y2k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783999140; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CqZt6uwrnjXjiwcScBt70Pe/agqwavvDJ7ZlS5w0LwU=; 
	b=LdFGrOP4e8DnZfDDsb0zi5BrjCLB4TYSelFl6ewA6XLUwzseUpmIcaf6zUgBcV7w93S/iG04fyGM2bNSNKVLBR2Y3RY1pi83SKXmjXkaHMC7JuL7pvqBOj4WDrsUVdGnM2Gr1EolEGfEfXsImrk/Awv4OVqnogQ5HenFqTBbICc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783999140;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=CqZt6uwrnjXjiwcScBt70Pe/agqwavvDJ7ZlS5w0LwU=;
	b=bsHizDiubvFKX9rR1ojxpA5UMuEd5PVrxI8xdBdW02uTo489uuv7/mLC5Wv1ZTxN
	r3EF4eTUjTVMlTXZdzyxsw6YFyM80K7x4kRtUwluPcJJrOK+nrEPLEq8NkbJIp79AMh
	mi6LWq6mCA97MnDcNOMapdm8CumxBLb02PJaAlZg=
Received: by mx.zohomail.com with SMTPS id 1783999137808210.2008414009524;
	Mon, 13 Jul 2026 20:18:57 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Mon, 13 Jul 2026 20:18:45 -0700
Subject: [PATCH v7 1/7] drm/tyr: add resources to RegistrationData
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-fw-boot-b4-v7-1-afd8dc1494dd@collabora.com>
References: <20260713-fw-boot-b4-v7-0-afd8dc1494dd@collabora.com>
In-Reply-To: <20260713-fw-boot-b4-v7-0-afd8dc1494dd@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>, 
 boris.brezillon@collabora.com, samitolvanen@google.com, work@onurozkan.dev, 
 acourbot@nvidia.com, lyude@redhat.com, laura.nao@collabora.com, 
 beata.michalska@arm.com, alvin.sun@linux.dev, steven.price@arm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5729;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=/sD3Dwni/MdYye4RpZVxgxUSX49sFfnkmHpx+hyNdSY=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFmhq+ZHXA54ZbuhJb3ndfLD5x2zWc0fPTm2hM/9waW4K
 J6OFwk2HaUsDGJcDLJiiixn7Y16xKveG+nO/98MM4eVCWQIAxenAExkogLD//gcrVMJUhFr9/45
 VFggWflU2EhdSFqD3frY1tXekhe3VDAydEozTEhhf3z+85SicmchLsYpKl+jxXZyvjKddePSF35
 GRgA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Currently Tyr is not storing any resources in its drm::Driver
RegistrationData.

Move Tyr's device-private resources and gpu information from
drm::Driver::Data to drm::Driver::RegistrationData. This allows Tyr to
access this data safely within the lifetime of its binding to its parent
platform device and while registered with userspace.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 42 +++++++++++++++++++++---------------------
 drivers/gpu/drm/tyr/file.rs   | 11 ++++++-----
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 8348c6cd3929..46ce5c41e310 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -6,6 +6,7 @@
         OptionalClk, //
     },
     device::{
+        Bound,
         Core,
         Device,
         DeviceContext, //
@@ -27,10 +28,7 @@
     regulator,
     regulator::Regulator,
     sizes::SZ_2M,
-    sync::{
-        aref::ARef,
-        Mutex, //
-    },
+    sync::Mutex,
     time, //
 };
 
@@ -53,13 +51,17 @@
 
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrPlatformDriverData<'bound> {
-    _device: ARef<TyrDrmDevice>,
     _reg: drm::Registration<'bound, TyrDrmDriver>,
 }
 
+/// Data owned by the DRM [`Registration`].
+///
+/// This data can have references tied to the parent platform device binding scope
+/// and is accessible only while the DRM device is registered with userspace.
 #[pin_data]
-pub(crate) struct TyrDrmDeviceData {
-    pub(crate) pdev: ARef<platform::Device>,
+pub(crate) struct TyrDrmRegistrationData<'bound> {
+    /// Parent platform device.
+    pub(crate) pdev: &'bound platform::Device<Bound>,
 
     #[pin]
     clks: Mutex<Clocks>,
@@ -67,9 +69,10 @@ pub(crate) struct TyrDrmDeviceData {
     #[pin]
     regulators: Mutex<Regulators>,
 
-    /// Some information on the GPU.
-    ///
-    /// This is mainly queried by userspace, i.e.: Mesa.
+    /// GPU MMIO register mapping.
+    pub(crate) iomem: IoMem<'bound>,
+
+    /// GPU information read from hardware during probe.
     pub(crate) gpu_info: GpuInfo,
 }
 
@@ -134,10 +137,10 @@ fn probe<'bound>(
         // other threads of execution.
         unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(pa_bits)?)? };
 
-        let platform: ARef<platform::Device> = pdev.into();
+        let unreg_dev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, Ok(()))?;
 
-        let data = try_pin_init!(TyrDrmDeviceData {
-                pdev: platform.clone(),
+        let reg_data = try_pin_init!(TyrDrmRegistrationData {
+                pdev,
                 clks <- new_mutex!(Clocks {
                     core: core_clk,
                     stacks: stacks_clk,
@@ -147,18 +150,15 @@ fn probe<'bound>(
                     _mali: mali_regulator,
                     _sram: sram_regulator,
                 }),
+                iomem,
                 gpu_info,
         });
 
-        let tdev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data)?;
         // SAFETY: `reg` is stored in `TyrPlatformDriverData` and dropped when the driver is
         // unbound; it is never forgotten.
-        let reg = unsafe { drm::Registration::new(pdev.as_ref(), tdev, (), 0)? };
+        let reg = unsafe { drm::Registration::new(pdev.as_ref(), unreg_dev, reg_data, 0)? };
 
-        let driver = TyrPlatformDriverData {
-            _device: reg.device().into(),
-            _reg: reg,
-        };
+        let driver = TyrPlatformDriverData { _reg: reg };
 
         // We need this to be dev_info!() because dev_dbg!() does not work at
         // all in Rust for now, and we need to see whether probe succeeded.
@@ -184,8 +184,8 @@ fn drop(self: Pin<&mut Self>) {}
 
 #[vtable]
 impl drm::Driver for TyrDrmDriver {
-    type Data = TyrDrmDeviceData;
-    type RegistrationData<'a> = ();
+    type Data = ();
+    type RegistrationData<'bound> = TyrDrmRegistrationData<'bound>;
     type File = TyrDrmFileData;
     type Object = drm::gem::shmem::Object<BoData>;
     type ParentDevice<Ctx: DeviceContext> = platform::Device<Ctx>;
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index b686041d5d6b..9f60a90d4948 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -12,7 +12,8 @@
 
 use crate::driver::{
     TyrDrmDevice,
-    TyrDrmDriver, //
+    TyrDrmDriver,
+    TyrDrmRegistrationData, //
 };
 
 #[pin_data]
@@ -31,15 +32,15 @@ fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
 
 impl TyrDrmFileData {
     pub(crate) fn dev_query(
-        ddev: &TyrDrmDevice<Registered>,
-        _reg_data: &(),
+        _ddev: &TyrDrmDevice<Registered>,
+        reg_data: &TyrDrmRegistrationData<'_>,
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
         if devquery.pointer == 0 {
             match devquery.type_ {
                 uapi::drm_panthor_dev_query_type_DRM_PANTHOR_DEV_QUERY_GPU_INFO => {
-                    devquery.size = core::mem::size_of_val(&ddev.gpu_info) as u32;
+                    devquery.size = core::mem::size_of_val(&reg_data.gpu_info) as u32;
                     Ok(0)
                 }
                 _ => Err(EINVAL),
@@ -53,7 +54,7 @@ pub(crate) fn dev_query(
                     )
                     .writer();
 
-                    writer.write(&ddev.gpu_info)?;
+                    writer.write(&reg_data.gpu_info)?;
 
                     Ok(0)
                 }

-- 
2.54.0

