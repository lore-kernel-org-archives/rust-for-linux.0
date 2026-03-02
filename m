Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51FE330B38
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493928; cv=pass; b=S7w8rSt+J5vYgR9S9HTzfbWg5B0pBJO6+k5qW9fHptKxoO454mwp3gonmK/5mvvUsSWzAk3GnMY93DC7u1gucnwceBneb/4BRuqA5uk8NWAmTFr2D6/AsSIhYVsBZMoMf6x0jhNTkHCerYGZ4jSAawpBCNui00eg/9cMR72T9pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493928; c=relaxed/simple;
	bh=nYsyUQhPpegU+qa+zWojpTzj+g/OhaISWDVPkGQRVkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8N3FGrDxnd3YLeSZozXoUpe9RIjBSAoHqHX+sRY7XCG7zT+UB4ORVgvl99ghKhyLbYJFRsuC/ZFwdKCfLCquC+0WNaTntXUwS+vEXlIg09jFaKXYq1myE5Ym3Y5rvNdURK2sWg47xZ0bCu1WsA4bTbBNDhE8k2v/0yPdHeHp5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=VSY0B1P8; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="VSY0B1P8"
ARC-Seal: i=1; a=rsa-sha256; t=1772493915; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FSIBqt3cWMjAsK8XqsCqd9Ocujf84ivUN0Ic1h1mq18UaHlhTsKQy22DiqpMpwMw4KeVNl1RP88pSj3xXAnztQRYrVVNLejP292K6e85DmQm1lTur1+Eo6lumDHgZ8A9d+fng93TrjP06Y0dhHkT0dPt8z1IRCJNC30LOvrYV/k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772493915; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HY43KfGaI/ZgxHpQugvLpiakTEg355Vk9snU7BhusEM=; 
	b=EMMV5Dr7ypdOXko6PzWaNMQRezjhjdxJYw7gS/FCAhUYTBBhBYfd05qW70wcuQJj7NuzlLcLquo/ovQL6Jl7FKvJZlleeTanyCSU+8CgHFCgArtFVLurIe2qGRKM0373cuc+5XDvwi6SP9z5mqYtVhuggIQAvhiNC4NvJ1Jor5s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493915;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HY43KfGaI/ZgxHpQugvLpiakTEg355Vk9snU7BhusEM=;
	b=VSY0B1P82KVLG3Lx206+/4D8VwYzQnKUI9SLzP+eYPa1PPdo9h77jhWEMfq0y2r2
	+jJEGfzvYMOHry2AWpjw4ko/gGPRFU/J8fFP892t2sWVdq2W0wtwVWN09WQ4eUDXnnk
	Z+BQGZHaXGjt//gGeGOqePnv7KDItnnD6erLxC3I=
Received: by mx.zohomail.com with SMTPS id 1772493913174510.58349943679843;
	Mon, 2 Mar 2026 15:25:13 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	work@onurozkan.dev,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 04/12] drm/tyr: set DMA mask using GPU physical address
Date: Mon,  2 Mar 2026 15:24:52 -0800
Message-ID: <20260302232500.244489-5-deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302232500.244489-1-deborah.brouwer@collabora.com>
References: <20260302232500.244489-1-deborah.brouwer@collabora.com>
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Beata Michalska <beata.michalska@arm.com>
Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
Changes in v2:
- Move the semi-colon outside of unsafe block and reformat.
- Pick up Reviewed-by tags.

 drivers/gpu/drm/tyr/driver.rs | 9 +++++++++
 drivers/gpu/drm/tyr/gpu.rs    | 1 -
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index eccf36d601ac..781502c6db36 100644
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
@@ -134,6 +138,11 @@ fn probe(
         let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
         gpu_info.log(pdev);
 
+        // SAFETY: No concurrent DMA allocations or mappings can be made because
+        // the device is still being probed and therefore isn't being used by
+        // other threads of execution.
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)? };
+
         let uninit_ddev = UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
         let platform: ARef<platform::Device> = pdev.into();
 
diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
index a88775160f98..5d9637899c7d 100644
--- a/drivers/gpu/drm/tyr/gpu.rs
+++ b/drivers/gpu/drm/tyr/gpu.rs
@@ -139,7 +139,6 @@ pub(crate) fn va_bits(&self) -> u32 {
     }
 
     /// Returns the number of physical address bits supported by the GPU.
-    #[expect(dead_code)]
     pub(crate) fn pa_bits(&self) -> u32 {
         (self.mmu_features >> 8) & genmask_u32(0..=7)
     }
-- 
2.52.0

