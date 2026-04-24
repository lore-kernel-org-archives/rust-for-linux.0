Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6686E37BE93;
	Fri, 24 Apr 2026 23:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777074004; cv=pass; b=iqNOhZqDgs7TbPh53NnACX6cs0wPlPf+a3KCjPMWoM+WUfrIT6yI7al3L6JWl66twy54E5y68sDQ2Dl6Vojbo5V8NBdIoagjYrnJ0Kf1anSf7tS5Ix82GJl4Alfe1FFW0HPuYnUh3HhM+U2jOkDCtiwmsf3ZAVAYQ7KL8/7jI40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777074004; c=relaxed/simple;
	bh=ivbl2vLKaVvN2BrJiNwbEU0fWVyjo9M4UlpAyaejolc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URMDZ/UyjDQBYeIZM79GxZMGCIsZV2hzOhT8zP+/7DtvJ93ZKCt6OgvBJelg2MEV5tYp4wFzWFI/hMQTYFoiiesMGUaaDrIToUz6J6ax/lW6YTK2BKfZUbk07E850PWhF5KxjC8dWplF5n4uOUfbWqDUo9sYxRvlTT0ocpho4hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=WONhtmyI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="WONhtmyI"
ARC-Seal: i=1; a=rsa-sha256; t=1777073959; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZVI4V81+UbYERqMbRFCA9h8Ye0VN3qYaRaM7kEjjTghBYOjqm7VZSdCy8ted9oB31hBU9I//3CImXhwsU0ghNQXXOBCLtONyRLKQ9glFRDKwTivWLqnhcRxqmVbe+0WarsCq7TJvTjaG7UnswQgk577WwvMEKgLDWnmHDi02iuA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777073959; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VXDFGS98Tc4lDYbE888SjtHArlQzwAEr30/idT3TFd4=; 
	b=juh3oJeYS1WULvVpm2cOTxhJDm8ZwOZTSRXpb0tF/Ty/P9uLPsDUNyWUnl1bflBhS/SbFE3ZkPZ5auFrfw2tbfkNt9D9StIW38Eq8w3KvHh0FjvIUJuqDwLvw1QaXZVegS+s15xduD8JpPguMRNCmLuh6jXH9RnxpRMU7p8hLE8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777073959;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=VXDFGS98Tc4lDYbE888SjtHArlQzwAEr30/idT3TFd4=;
	b=WONhtmyI+l/5fo3WIN5w2hMQShNh4hlIfMNsrYSAzkBxRl/5y8FcrTeGEFsqJ3eU
	tI0TeLH3W9uhfAJbthngzeCjXbUMDdASRyFnEliwxft1dARFq9IMfzWY4R9kIc8KZG2
	zOjHwYQmFEhVQAQjpgWTfoMx5p4TEpFyVNLRKg0c=
Received: by mx.zohomail.com with SMTPS id 1777073957029974.786460593181;
	Fri, 24 Apr 2026 16:39:17 -0700 (PDT)
From: Deborah Brouwer <deborah.brouwer@collabora.com>
Date: Fri, 24 Apr 2026 16:38:56 -0700
Subject: [PATCH v4 02/20] drm/tyr: select required dependencies in Kconfig
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-b4-fw-boot-v4-v4-2-a5d91050789d@collabora.com>
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
In-Reply-To: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com, 
 beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com, 
 work@onurozkan.dev, alvin.sun@linux.dev, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840;
 i=deborah.brouwer@collabora.com; h=from:subject:message-id;
 bh=kedRnGAjTEAxNymKdPnucngrkvI5gPskFo8gwuQEDjk=;
 b=owGbwMvMwCVWuULzOU9c7WvG02pJDJmv/ytkCPS7T0rvXCZzgjfpWuDKL89SJvrlxDg+zuZef
 mfDTHG3jlIWBjEuBlkxRZaz9kY94lXvjXTn/2+GmcPKBDKEgYtTACaSdZKRYcoLwZlx989NjXos
 On3LdQGmevbalROl34t4mtcdn7jxgB3D/2TBwIv/HM545MpqOz38IFtmdZvFolphGf+JBOVd9kt
 YGAA=
X-Developer-Key: i=deborah.brouwer@collabora.com; a=openpgp;
 fpr=CD3F328C177AEF322D9FFF8379A829E70C5E7DEB

From: Boris Brezillon <boris.brezillon@collabora.com>

Tyr depends on DRM_GPUVM, RUST_DRM_GEM_SHMEM_HELPER, MMU, IOMMU_SUPPORT,
and IOMMU_IO_PGTABLE_LPAE. Select or depend on these symbols in Kconfig so
the required infrastructure is enabled when Tyr is built.

Introduce DRM_TYR_STATIC_DEPS to keep the built-in DRM dependencies
selected even when Tyr is built as a module.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/gpu/drm/tyr/Kconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/Kconfig b/drivers/gpu/drm/tyr/Kconfig
index e933e6478027..443ce988b570 100644
--- a/drivers/gpu/drm/tyr/Kconfig
+++ b/drivers/gpu/drm/tyr/Kconfig
@@ -1,5 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0 or MIT
 
+config DRM_TYR_STATIC_DEPS
+	bool
+	select DRM_GPUVM
+	help
+	  Ensure required DRM infrastructure is built-in when enabling Tyr
+	  even if Tyr is =m
+
 config DRM_TYR
 	tristate "Tyr (Rust DRM support for ARM Mali CSF-based GPUs)"
 	depends on DRM=y
@@ -7,6 +14,11 @@ config DRM_TYR
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
 	depends on COMMON_CLK
+	depends on MMU
+	select DRM_TYR_STATIC_DEPS
+	select IOMMU_IO_PGTABLE_LPAE
+	select RUST_DRM_GEM_SHMEM_HELPER
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
2.53.0

