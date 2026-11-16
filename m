Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828432;
	b=5t1hJGgSj7sSpgLXMRaywx+OFQJVtZbt1tfwYE8jjy2tZ5l6mv7r/umMb6OnwpddH3eF
	 xLmzaeH3e68hYi/LGnDasH+MXQiOh2y2N9OPYiRAUIrt6+sC983p7/R6Vz+rXzBB598Rp
	 GQfGGt8nET2bH4F7JTaJLBbusjecjvJfNU/mb+XYv4DTNFPqPvd8eq1goiuFrWfK8D2rb
	 EOelrO7qW0tI/yxXHfvhnO1G3/fxx1Beh8T3CJbAADjb0jfXRdoFwP2flTueRRYkTmknO
	 HkjlXTS9u96feIqAuwXP8Dt3OGVb0UWiEHNO89yNSMVaBCgmGmIacaGReraxlayHHjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828432;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5S85P3XEEE6NqVAuQGN+mHAd/gR8/Ehk0Yn8sc/3XKI=;
	b=Qo+kOTwF1gaHu7v7WyVGBl0X891aelGf/PYt07YbyEXtuQDuYg2Nla/MtozS3FgW57oi
	 xegYE3zhQwpBezQOhVVT79HzxxeloCoQGiA3fY+iUrUyE/XnSqzJuAK82xmer0ITsio6u
	 vglbQKyjaeUeK7a7AnMbeml4XHnnXSh1l94h2r7Zuis4BjjFLJ77uuFrfITl8juezX7WX
	 ++LMPCIK9kfvND+GZvl3c5Fxg1TKdBngbu05HZHKYbb17SdECOvvDpnBdOL1UjuIb8YgO
	 1z5v1nd82mENIBpX2vHNDecq+CadUymTW8uUU7e9NZyYj/Icwk2KHkiHu/3pOoPVH4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QDFbGLKS;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A0B60A380A;
	Mon, 16 Nov 2026 11:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A0B60A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QDFbGLKS
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 854021713;
	Mon, 16 Nov 2026 03:27:08 -0800 (PST)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2743F3F632;
	Mon, 16 Nov 2026 03:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794828431; bh=Kzre6pxQ016nPSDOnbBU+qRYlurYunuGVpyGY7E3MKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QDFbGLKS+uQv9EGk2EavQrZteK+7abdqapaLmZsNm0uNwkKcqOD5rWQJ129cuOS0P
	 9MdcsL2WeuniBoLrnvCjaQ0+e+OLnHSk3YpOhY/cLPJJldy5Txd1ZQMonCoF/Szn1t
	 +a5zPRbcBPQFn4N4I9+ZN6PsavS3zJllb4EWCpN4=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Akash Goel <akash.goel@arm.com>,
	Karunika Choo <karunika.choo@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH v5 13/13] drm/panthor: Bump version to expose protm feature
Date: Mon, 16 Nov 2026 12:26:01 +0100
Message-ID: <20261116112601.3483649-14-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116112601.3483649-1-ketil.johnsen@arm.com>
References: <20261116112601.3483649-1-ketil.johnsen@arm.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bumps version to expose previously added:
- DRM_IOCTL_PANTHOR_PROTM_INIT ioctl
- DRM_PANTHOR_DEV_QUERY_PROTM_INFO query
- drm_panthor_group_create::protected_suspend_bo_handle

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v4:
- First version of this change as a separate commit
---
 drivers/gpu/drm/panthor/panthor_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index ffea1eef134f5..e87d9d7a3fb77 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1800,6 +1800,9 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.8 - extends DEV_QUERY_TIMESTAMP_INFO with flags
  * - 1.9 - adds DRM_PANTHOR_DEV_QUERY_MMU_INFO query
  *       - adds DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE flag
+ * - 1.10 - adds DRM_IOCTL_PANTHOR_PROTM_INIT ioctl
+ *        - adds DRM_PANTHOR_DEV_QUERY_PROTM_INFO query
+ *        - adds drm_panthor_group_create::protected_suspend_bo_handle
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1813,7 +1816,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 9,
+	.minor = 10,
 
 	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
 	.gem_prime_import = panthor_gem_prime_import,
-- 
2.43.0

