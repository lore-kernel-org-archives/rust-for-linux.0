Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D5742049
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 01:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770860264; cv=pass; b=bOouPxjykGaNIgGUpPxH9zom4AMv1/DpJfstdQNxzrxOAIYAlXimlSV/B+OflYWwjq7O2w49Ju/ydyMWpvSvHqQpkF0k7TYHfCo6xzrznbGfZS+5zZDcYmxJicvEVIIegl+0BsdoI322zDvYxbxldChJzZJ2DN6hGZcs85wDS3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770860264; c=relaxed/simple;
	bh=7U/vjIXAGoGIzOnmkiEY28vvMSmszU5IiTtL2aOYCmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmX/fn6JZnQmz7Pyv9udwvpA9QmFMp2kHBe+onoKrjjfOB3ZuMYA3thMcUgQvbUUOgC39+vNYRhO7ca3zuKv+HANOqIwG58fSWbNa/FZAbYXwXmwcspiVJL/pxggf/O/rnyOnB7Xy7AAYB/D07GLQEdbeqgUTBMi15Rv6mcYzls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=hgOZQGzl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="hgOZQGzl"
ARC-Seal: i=1; a=rsa-sha256; t=1770860255; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n1CzFEGTKviIMX/d15K2//1s9Wv5dTmRu3R9+NQOdFSm3cyPVC7XVgsSwdWA751yL0Qc+n2OFvNFFug3Y3dFYQTzmaS7WTiv+PouCW+7sBxmXmlOIfjrkGevYiTwYi73q6tsJNWIzTJAMKGnRH+tTy/4P6/oWPZqyR7ywc3ysdI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770860255; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lez+oPXTsx7GivoupNNO0Y6wKAfdFgOevpV5ZU+wW0M=; 
	b=TenFGY1TVnJe78lySi7yFk7SyIfS0mfL6oLLGfXbfaHZFhA/1IIn37zTQj2uyCYAmWW64a2SgHMyKTAyiOeaggwkKOFtCyxTl2T26Jk7kshaf5rR6Wtaw977fLXSM7twyTRNIBeibqt4RWZEDvgSAfDXhrSouliuU3k2Vcu9JWY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770860255;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Lez+oPXTsx7GivoupNNO0Y6wKAfdFgOevpV5ZU+wW0M=;
	b=hgOZQGzlxu8ykY8BXzSYLBY4zU+X7LyfJo8HWghvxqCckU1F7oaO83FmNxA0zWmM
	UOS4zn9hCN5NH8lnW9I/PgBePiwL8F+y8DjqyZYD7y0H/3Y2iAewtRzqjHyf7fVrk4F
	+MDifukPQDGHCx264QPrbzK5bU1+mM5NiK8u8V0Y=
Received: by mx.zohomail.com with SMTPS id 1770860253185360.3147245468143;
	Wed, 11 Feb 2026 17:37:33 -0800 (PST)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	boris.brezillon@collabora.com,
	beata.michalska@arm.com,
	lyude@redhat.com,
	Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 01/12] drm/tyr: select DRM abstractions in Kconfig
Date: Wed, 11 Feb 2026 17:37:02 -0800
Message-ID: <20260212013713.304343-2-deborah.brouwer@collabora.com>
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
 drivers/gpu/drm/tyr/Kconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/Kconfig b/drivers/gpu/drm/tyr/Kconfig
index 4b55308fd2eb..c521fbd950ea 100644
--- a/drivers/gpu/drm/tyr/Kconfig
+++ b/drivers/gpu/drm/tyr/Kconfig
@@ -1,11 +1,23 @@
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
 	depends on RUST
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
+	depends on MMU
+	select DRM_TYR_STATIC_DEPS
+	select IOMMU_IO_PGTABLE_LPAE
+	depends on IOMMU_SUPPORT
 	default n
 	help
 	  Rust DRM driver for ARM Mali CSF-based GPUs.
@@ -15,5 +27,5 @@ config DRM_TYR
 	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
 	  be supported with the panfrost driver as they are not CSF GPUs.
 
-	  if M is selected, the module will be called tyr. This driver is work
+	  If M is selected, the module will be called tyr. This driver is work
 	  in progress and may not be functional.
-- 
2.52.0

