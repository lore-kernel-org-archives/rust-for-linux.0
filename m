Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE81449B2A;
	Wed, 22 Jul 2026 23:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784764492; cv=pass; b=QxnAqKo5lTUm7Wzce2h4rPudg+3tbaVjzZbX92/swBdHCJUBqhQoXO33oYdLr2wlg2swIW5WivdkHKogyPW7op5RcI+IkgCocx8pGbly6N0rZGy742xVDHzvnD31D1W3oMYuCzM0NLjkIRf1OVm3RcCkWd66FbHIsm6s75qXXJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784764492; c=relaxed/simple;
	bh=dKzL3X3uBJqRLYIHoO7ah22jAzO/LHpMDY7j+Dyg9ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IjUe2/z6C0CN0jfv7v2HasmWsiREpEBlwXd4aL9k4VXulMS9KB3K1kZFmiTr9nRefZNsIhqEiuiTXJ2exGaodfkBO6QTEovLtSy8KDR/e7jG56LFiCBlgScXQ89qlWIG/t+kDwPVxrzoUjFFJMqfFS04JeE0UyLRgerP7K1novo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=IahmPlZS; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="IahmPlZS"
ARC-Seal: i=1; a=rsa-sha256; t=1784764454; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S1MFF1UB7bWMg29OLm1pqKWuIr9lyF605u1DVu5sl7ORejAAqXoO06X3yiUY9rDC8ztgHb3RXG7saCYPzFN0FOavWZhX6MKEQvtwS97MDN1jbDDQokcTywGJtx8BYzoAmxMTcRiPk9Qo670FLNaldzDm04DdAbX9sPxC2uhkbHY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784764454; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g3nbqIyxkNM73KC2oeZ+6NYURzs14m9OEzaGq9rVgWk=; 
	b=Vf4N7DC6ExcBlrAOXfVVvJHnVBgs9LsEpmliwXk05L023m1IHac39+LgZqKI68lw5vrUn5cw+V7t7VO2urcihYM+IShqN8L3ZEGqAJklmMhG/cHuS2r1b1Z4OH8OzcLRPIo040bYeDKJoouyqL9QLGi9DRBZRPTseDNtRUYZpv0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784764454;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=g3nbqIyxkNM73KC2oeZ+6NYURzs14m9OEzaGq9rVgWk=;
	b=IahmPlZSAjZvh/4CS2JOs0leJkuloWTZBlXzsP0zT6Ou0PV4QsyzZ1PqOdX7UnGL
	RAD+tV4C8O+JDDKYZZgvy4Y7VtOHsofgFsi+4vTabYxs0T4TlVnao/8LThy8cmOomlG
	8GQOWTj/ZwpiSaSUJ9N6t7zSGLNkhsoNsbQ/fwyo=
Received: by mx.zohomail.com with SMTPS id 1784764453593797.4660081619885;
	Wed, 22 Jul 2026 16:54:13 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Wed, 22 Jul 2026 16:54:07 -0700
Subject: [PATCH v9 1/7] drm/tyr: add resources to RegistrationData
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-fw-boot-b4-v9-1-8669d2a02590@collabora.com>
References: <20260722-fw-boot-b4-v9-0-8669d2a02590@collabora.com>
In-Reply-To: <20260722-fw-boot-b4-v9-0-8669d2a02590@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 Deborah Brouwer <deborah.brouwer@collabora.com>, samitolvanen@google.com, 
 lyude@redhat.com, boris.brezillon@collabora.com, steven.price@arm.com, 
 alvin.sun@linux.dev, laura.nao@collabora.com, beata.michalska@arm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5789;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=dKzL3X3uBJqRLYIHoO7ah22jAzO/LHpMDY7j+Dyg9ng=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDFmJEcotHYm1EybO9bNRC/j4USpEvzz8XvGeX1efcwc/l
 ryxfH5IRykLgxgXg6yYIstZe6Me8ar3Rrrz/zfDzGFlAhnCwMUpABPZx8XI8GrOuTurGlZrvrsy
 8ZXlhIdsNeUuMq/m5OWs9629FffMy5vhDw+/f2ng+t3F2k8V/2xWUzWuXWNpVlK2neEa1+7coBP
 zmQE=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

Currently Tyr is not storing any resources in its drm::Driver
RegistrationData.

Move Tyr's device-private resources and gpu information from
drm::Driver::Data to drm::Driver::RegistrationData. This allows Tyr to
access this data safely within the lifetime of its binding to its parent
platform device and while registered with userspace.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
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
2.55.0

