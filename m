Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C153909A3
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 23:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772493923; cv=pass; b=FhiAap7GD7+/NjbIIlc/BzuWoXxwVzI3twEjOmQHAppNV5fpsmbstbmybqlhEJhzp961oTP3FO7YSZvDuKYkMG7Oph/6wCFZjscHNrGd0om9KgZF8gpAIisX1+kmUBFKZtjxMFxj+29rrlEuyC8dc8qoNDslfm106AHuV7F6G5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772493923; c=relaxed/simple;
	bh=8dijyUHitxsH7NqK1N388YOJnaqd3BgjMOCdaEh2wEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCAkSpEzqSkwHkWWCjLObNbzeiZmolLLWa0blRElyw9Tz+8wlIW3fwe5KKL/svVJv4PGXUZPZqYXSq/sSiPq9pKha2ZuwJqqknM0DcLTkCDJSJs6upqwDS3tjzn2pDTDQCU7llevn8VLbuoruOeJnyDbGt6//3NvqxFNm5011bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=JIDcrAtz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="JIDcrAtz"
ARC-Seal: i=1; a=rsa-sha256; t=1772493911; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jYbCAWRGLaowgigFkjWD432sojlokrjk88ajSfWAMTrh3yP9+Snkdc/z81ZfOvDxgfldyLmZqu0OnJG9IJLr5sUqidnWb9znO0bAj+40yyIGRChfRQiKemFBXF4kgshNOBDrzDZfy51G9BoEFSY+WZQHWNuihtZJqiGBFDx0t7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772493911; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7XhCTbBU/DjN+wplKr2O9vw77GILisJwvKNB/tG55rE=; 
	b=oC0/i4pku2te0vnnX7rgt3CJXBtKaGo4oM5XmeOXKxgkiOGLo7hspDLtRjIPjXBmKyha2jXI6FCci6V5YJGs4tAP8t4n5ykW87PAlNHJf2/X1DyXh2SKbKI5ZJqz5v+4YF7auZkI+vfa0COUNtjoUgRwF1X5UF9boYIhg+KMbn0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772493911;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7XhCTbBU/DjN+wplKr2O9vw77GILisJwvKNB/tG55rE=;
	b=JIDcrAtzEnmDUsZb7ZCEb3JB5pX2LFgiR82kqF9PVl9bTkjBbAAb860eBhbiSNOk
	1FPeHuYd2Nk76wbmdqWgjb/ooUd2+S3+Sm1p74jaoddaZYHeWkBNmMqJolzw+7kz4nF
	DNhreYQNCLh8I0Sugsqr+ZT2lb3E9cG0X4MK4IwQ=
Received: by mx.zohomail.com with SMTPS id 1772493909966587.7674767848347;
	Mon, 2 Mar 2026 15:25:09 -0800 (PST)
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
Subject: [PATCH v2 01/12] drm/tyr: select DRM abstractions in Kconfig
Date: Mon,  2 Mar 2026 15:24:49 -0800
Message-ID: <20260302232500.244489-2-deborah.brouwer@collabora.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

When Tyr uses GEM_SHMEM_HELPER and GPUVM, these helpers must be enabled
or the build will fail with undefined symbol errors like:
  "ld.lld: error: undefined symbol: drm_gem_shmem_free"

Introduce DRM_TYR_STATIC_DEPS and have Tyr select the required
abstractions to ensure that they are enabled when Tyr is built.

Also add MMU and IOMMU dependencies that will be required to boot
the firmware.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
No changes in v2.

 drivers/gpu/drm/tyr/Kconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/Kconfig b/drivers/gpu/drm/tyr/Kconfig
index e933e6478027..e5db8fa5dd57 100644
--- a/drivers/gpu/drm/tyr/Kconfig
+++ b/drivers/gpu/drm/tyr/Kconfig
@@ -1,5 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0 or MIT
 
+config DRM_TYR_STATIC_DEPS
+	bool
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_GPUVM
+	help
+	  Ensure required DRM infrastructure is built-in when enabling Tyr
+	  even if Tyr is =m
+
 config DRM_TYR
 	tristate "Tyr (Rust DRM support for ARM Mali CSF-based GPUs)"
 	depends on DRM=y
@@ -7,6 +15,10 @@ config DRM_TYR
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
 	depends on COMMON_CLK
+	depends on MMU
+	select DRM_TYR_STATIC_DEPS
+	select IOMMU_IO_PGTABLE_LPAE
+	depends on IOMMU_SUPPORT
 	default n
 	help
 	  Rust DRM driver for ARM Mali CSF-based GPUs.
@@ -16,5 +28,5 @@ config DRM_TYR
 	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
 	  be supported with the panfrost driver as they are not CSF GPUs.
 
-	  if M is selected, the module will be called tyr. This driver is work
+	  If M is selected, the module will be called tyr. This driver is work
 	  in progress and may not be functional.
-- 
2.52.0

