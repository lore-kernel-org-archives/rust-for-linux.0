Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9042049
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 01:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860268; cv=pass; b=daf5rR6k8nU5X2E3rf3A0hgVgWt4gPELLKEQQ5EZTrRZwOkr7VT4aQm7cDShg/6JsUZFDODKqaWpAge+N+XNXgwm7PTHcw9YV7dMTL+n2tG9K3bmxYVM7HSKarVHYN35Al5O9E8I4/iPXO0El1cDsMcAJ29368Za++wlrMfKNr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860268; c=relaxed/simple;
	bh=JvTsXIabSkiKDKvVQ9ucemK8tskcJM/LqrVmxXnwlLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRt6RDpyRNdndwqvS725zJPJ1pVH9bbFrJ430sAHueuwXglzvq4ew/ZkGLjJNDecmn4qGC0BnVcCSU5IVfwrNpitn93EhGtf1hLNNxmHpS/4qZ3QmQEO2Y7WWbCEpD7+uxRFM3an1Z+Wp/NRSRgZTylx0cUQv6a4Kfn25FFh4XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=SCW+phRR; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="SCW+phRR"
ARC-Seal: i=1; a=rsa-sha256; t=1770860259; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ACyV2YKqSlEP/4oYN3u8nHUlhCn47HvoeJ7ytz2vQaPBfcy5HNwI9vzwZs33M8Xt548CDvuD6LT2VGOwyHWNXZUc+iUm/GcKgiUijo/BfjSjxRv0fTQFqnkYk0U77fShoyxlkJGPxqkPebf2ZJlQrt259CT6e4mGF882mCaeakY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770860259; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CWm37nCtUD/jg5RR68zFHxZO+Vn5ZYwP9UJe7FtREtA=; 
	b=AXFPAWkliKrevws3f5ze9vwiPWTKWaxr97vSIMbouYhIh03/IUVGgZxnE92daRI+PYpGxRu4qWp79WqJZUiZpTfGaLMhyGNtAxRKK0tJhbtlNBha16hPO/oYUppjXQyOM5aB+Lld2GzSljSFiRL3KgxPfEAJq9FRf5mMCpTgt/Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860259;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=CWm37nCtUD/jg5RR68zFHxZO+Vn5ZYwP9UJe7FtREtA=;
	b=SCW+phRRx+PV5CfZfDWWPDCcY+o/tTvB90z6nDPvZU93szSf3blDso0mcb4DOaqw
	41tEz+UfJCd/mZXJs7tO/VObrHFJxuGEaNSmJ2zft3idyFqUFVkWyRzRS61oB/VnFc2
	husF8lxfPz5de5viFymrcpJ801S1jmg/zeqg8Z4I=
Received: by mx.zohomail.com with SMTPS id 1770860258119770.7608444313937;
	Wed, 11 Feb 2026 17:37:38 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 04/12] drm/tyr: set DMA mask using GPU physical address
Date: Wed, 11 Feb 2026 17:37:05 -0800
Message-ID: <20260212013713.304343-5-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212013713.304343-1-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Beata Michalska <beata.michalska@arm.com>

Configure the device DMA mask during probe using the GPU's physical
address capability reported in GpuInfo. This ensures DMA allocations
use an appropriate address mask.

Signed-off-by: Beata Michalska <beata.michalska@arm.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/driver.rs | 11 +++++++++++
 drivers/gpu/drm/tyr/gpu.rs    |  1 -
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index e5eae5a73371..2973a8b3cc09 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -11,6 +11,10 @@
         Device, //
     },
     devres::Devres,
+    dma::{
+        Device as DmaDevice,
+        DmaMask, //
+    },
     drm,
     drm::{
         driver::Registration,
@@ -134,6 +138,13 @@ fn probe(
         let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
         gpu_info.log(pdev);
 
+        // SAFETY: No concurrent DMA allocations or mappings can be made because
+        // the device is still being probed and therefore isn't being used by
+        // other threads of execution.
+        unsafe {
+            pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)?;
+        }
+
         let uninit_ddev = UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
         let platform: ARef<platform::Device> = pdev.into();
 
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index affca5b0dc6c..b5f11bc96fa0 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -141,7 +141,6 @@ pub(crate) fn va_bits(&self) -> u32 {
     }
 
     /// Returns the number of physical address bits supported by the GPU.
-    #[expect(dead_code)]
     pub(crate) fn pa_bits(&self) -> u32 {
         (self.mmu_features >> 8) & genmask_u32(0..=7)
     }
-- 
2.52.0

