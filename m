Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079732573C
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768505946; cv=pass; b=YPBkKDH2+TmS5V1YaVg2S/QGgETuExryKhD3RX60LOAEFnro6n0M47W/xvckjVNGDXlgaDFvKFNPst8mdW6etdA6uG7dsXpIpGAVIb6jE+nS0Zjc5J6MyKN+Iyv3hA4sGbl7pAQVIMp+yhswxBHDxsFJfB64kyYx8boNveSz8k8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768505946; c=relaxed/simple;
	bh=Yse7kV//Ak55wW7EWNRb31DB65CCgekj+Ux91cBqyy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XARycUJM6JAZBpM5qvD1/keQd7H6DW22miMsQcsWAT/mR3Awh5BSAVA70V9C5I7kLZ+az9ixCoT5NwA7nup1726flvkx1SXBrVgSoc1DmZzZFOLjzzSUTd6Fw9icG2sPa+4gngnw0M01BpWvlBuQpmYASZMwpoKm4j3Zb4+fXbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=OMYAhn5C; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="OMYAhn5C"
ARC-Seal: i=1; a=rsa-sha256; t=1768505937; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S8eFQ8AdCVE19WEaWoeP8b8ai7AXgHctKy54h/Vxg+JcN0vuEuE5FRY0g9MCHDtSSkkdUBAO6Fkc1PKokz1HKSgWcKnjHh+1s6loFmDcQUn4cqxIczYKgK3D7lw4t65akvgXtUWsxjpXrZfJRh+/+0+7jGZGRPMudIZDs2Yvylg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768505937; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SUZBeWhLHhcWfnVHN1bwgWdcEMSetAkrwgb+5GfC+yQ=; 
	b=JmqkorZqn0azyUgLaX4Cf6emGeaFqteJe0LiSv0WrbgCjFWOO8HX6i/+JMghaoAbeNV4GmU1vXsAYAOv91Japz3g2Rj2iiGRYH4geYJ3GKeKC6YGdU2DpFUrQ6dIBWprmFVHfgQUg4gHQhgrfNKDb1RLA79kRs55tTlPTzq6M/c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768505937;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SUZBeWhLHhcWfnVHN1bwgWdcEMSetAkrwgb+5GfC+yQ=;
	b=OMYAhn5CMV4KOwLp/jxVWB5f2dBKOwHy3JoZ/eqyrUhSkk72+Zi8maa2WbJiCmB+
	DcizIM8p8xYsJyiB6EqTdgpUrNjhr7Q3RdcmmNGmKPX3QExey0Em0w7gR1neqo4VFA1
	AZRhCm83jC6BhTj+tN6EnMahEC1Alp8TDhzYQtVI=
Received: by mx.zohomail.com with SMTPS id 1768505934597190.801920558147;
	Thu, 15 Jan 2026 11:38:54 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2] rust: drm: tyr: use generated bindings for GpuInfo
Date: Thu, 15 Jan 2026 11:38:43 -0800
Message-ID: <20260115193843.34878-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Tyr's struct GpuInfo is manually copied and updated from
include/uapi/drm/panthor_drm.h. But an auto generated struct is available,
so use that instead to avoid copy/paste errors and to stay up-to-date with
the panthor uapi.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

---
Changes in v2:
- Picked up Reviewed-by: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>
- Link to v1: https://lore.kernel.org/rust-for-linux/20251127211843.46258-1-deborah.brouwer@collabora.com/

 drivers/gpu/drm/tyr/gpu.rs | 48 ++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index 6c582910dd5d..3072562e36e5 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
+use core::ops::Deref;
+use core::ops::DerefMut;
 use kernel::bits::genmask_u32;
 use kernel::device::Bound;
 use kernel::device::Device;
@@ -8,6 +10,7 @@
 use kernel::prelude::*;
 use kernel::time;
 use kernel::transmute::AsBytes;
+use kernel::uapi;
 
 use crate::driver::IoMem;
 use crate::regs;
@@ -18,29 +21,9 @@
 /// # Invariants
 ///
 /// - The layout of this struct identical to the C `struct drm_panthor_gpu_info`.
-#[repr(C)]
-pub(crate) struct GpuInfo {
-    pub(crate) gpu_id: u32,
-    pub(crate) gpu_rev: u32,
-    pub(crate) csf_id: u32,
-    pub(crate) l2_features: u32,
-    pub(crate) tiler_features: u32,
-    pub(crate) mem_features: u32,
-    pub(crate) mmu_features: u32,
-    pub(crate) thread_features: u32,
-    pub(crate) max_threads: u32,
-    pub(crate) thread_max_workgroup_size: u32,
-    pub(crate) thread_max_barrier_size: u32,
-    pub(crate) coherency_features: u32,
-    pub(crate) texture_features: [u32; 4],
-    pub(crate) as_present: u32,
-    pub(crate) pad0: u32,
-    pub(crate) shader_present: u64,
-    pub(crate) l2_present: u64,
-    pub(crate) tiler_present: u64,
-    pub(crate) core_features: u32,
-    pub(crate) pad: u32,
-}
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);
 
 impl GpuInfo {
     pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
@@ -73,7 +56,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
         let l2_present = u64::from(regs::GPU_L2_PRESENT_LO.read(dev, iomem)?);
         let l2_present = l2_present | u64::from(regs::GPU_L2_PRESENT_HI.read(dev, iomem)?) << 32;
 
-        Ok(Self {
+        Ok(Self(uapi::drm_panthor_gpu_info {
             gpu_id,
             gpu_rev,
             csf_id,
@@ -95,7 +78,8 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
             tiler_present,
             core_features,
             pad: 0,
-        })
+            gpu_features: 0,
+        }))
     }
 
     pub(crate) fn log(&self, pdev: &platform::Device) {
@@ -154,6 +138,20 @@ pub(crate) fn pa_bits(&self) -> u32 {
     }
 }
 
+impl Deref for GpuInfo {
+    type Target = uapi::drm_panthor_gpu_info;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl DerefMut for GpuInfo {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        &mut self.0
+    }
+}
+
 // SAFETY: `GpuInfo`'s invariant guarantees that it is the same type that is
 // already exposed to userspace by the C driver. This implies that it fulfills
 // the requirements for `AsBytes`.
-- 
2.52.0

