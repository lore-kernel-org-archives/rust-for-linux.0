Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557231EA7EC
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764278352; cv=pass; b=WmKiRHltYV1noNqXynkVC8ZypkD1diZkUZJ/dbovewkekXClt+CvKTx435ozpZ+90vcqLcwiyqjqqade6biUr7JdLsw17IhbX4CHzwcMbPnAAX7ejvRATQoPAuPGG1lgbG1QhKlqkCMBYUd0TgKczds9z0SAt6eiEcp6pLkePe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764278352; c=relaxed/simple;
	bh=5REku5QYi99Spr4/9DUL1fvB2aDLrSAcIDZNmQC2+XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7a5Skj0rV2WibkpdUr8rywJW7kBea/ZRTL/FwzWcZWl42B1YGwn11xcKK3k/HrdmwKNgh4MwEIwlYz9sv6BFZpVTHP+YcNEvD1Wn71KvalXzkyseM1b7cqM9eQR7SxSpDq+U9ZbFns7jqFL4lXJcE/OiuL7FEQlSwT7nY/qcTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=WA+L2L20; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="WA+L2L20"
ARC-Seal: i=1; a=rsa-sha256; t=1764278344; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZrU8wAZ3QAqHlQnoVgf4mpY6hkN3gJ3NxsEtlKBqkeXFpsMzlR4nxSJTXF/Qu6JHyDP9AecmV9fxn5FHG/4WeijXWD/jNvU927Uu7M0h7RBpLxtrAKMEZlBzcv79PdGpIyRxg9WnVmNc3LqbBBgWTzqr6vnJYfYrTeyJX98hHOA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764278344; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CDmXMFFIi9M1Uo3efFpvPOwqq+qj7RzbBIEIQ1D57kU=; 
	b=BU01zz6VJVzbH9bAwjJGIoFDUuaLRCZPdfUq4sVtDxEi9zWlr9BD7UC+APfyB4nXTllsuIJqfYq1RyxxYq5VgACcxW7HVzxpkwrqk7QAlPj9nM8Y9Rz3p9BxIbZHH5UwOLVeTOO0KHfcUiQ7QI9ub81uM8+JOvRyrq4nVS6Bxsw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764278344;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CDmXMFFIi9M1Uo3efFpvPOwqq+qj7RzbBIEIQ1D57kU=;
	b=WA+L2L202YrF9tfg8oj56+CXwFeb4l8do7MlrIYVI1vQfirW1Yjq6ouEOSSGEUKz
	vbJ7ZLjzTUdrn2HKEtrsQ3IHhpuztnAbwNY7W40DpUEveQkQ96xIiNVVR2Wsu3ySkjq
	TGVahMuJw5zr1VXLKInMwKX0doT0+fXyFf31hEMc=
Received: by mx.zohomail.com with SMTPS id 1764278343231532.5505947730755;
	Thu, 27 Nov 2025 13:19:03 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH] rust: drm: tyr: use generated bindings for GpuInfo
Date: Thu, 27 Nov 2025 13:18:43 -0800
Message-ID: <20251127211843.46258-1-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.51.1
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

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
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
2.51.1

