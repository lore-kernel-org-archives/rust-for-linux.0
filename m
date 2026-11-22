Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385720;
	b=l3jzKpoBxCiGPK/tqkctclMq0KBmrcStNSvHD2ClfAvS+BkURg+S7vRTdX4bNa3Sh+9s
	 yTJl/2/SmAQANI6nYu+pbrAhL7OM31hYi2WF/gYsq8cPiMja5revJXoHSww93vNoGe7Lj
	 pLrCdVJpr1XnUBY/UC93syjM+hnECL8G4lvmdAdzImydgO5eGyYNQwtZyt67EtOA6aoJ0
	 GQcOcSUqojLiHbcIqBsXnEl3qujur85++/vJ+QmeZWX4OcgCa+KCin+H9xkGx2Kvinq/D
	 zPx74KYwdis2dKWrtte9/KmPb8Xnn/GKhkPItuRQDQ2X+d/B15chM+bCKse2dF9bAPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385720;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=NrK9/r4SJF3jAwZM8JqYqYC1DRFMvOtMUQh9jZZynaM=;
	b=Lg4v4Ep/XvsWgJWXpqDW3efMC15/stXxIuEYu2S7FBVUpl5X2KKfwIN2d2vJRWKYqI2U
	 U+o11V+aIC36knJ2Hed+cXre/rX4R7H5lYXGoW8NSFnokirz2+VkJ8OYf9UMSH9nIo8Ak
	 Etbuv9oecRCUc3SGuqP3AsBVM9t0f0TVlqKUvZfQLRWoypDsGeDRM3qjJI/nSxxGxHI8I
	 nh4iiFdgQXz8iP8SL9SGwYAispzrF5dr5f2AMCJlQ2I4NbcDfV3nBlu4p6GX3u/3IhpQZ
	 YdvXXay5Wffa6L8W/65tyqrqAOoS2pVxEW4lx07L3vUbNMlQBqLYe1HNBU05f/nUIVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=gKnxcWsQ;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34586606A31D
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 22:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34586606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=gKnxcWsQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=NrK9/r4SJF3jAwZM8JqYqYC1DRFMvOtMUQh9jZZynaM=; t=1795385719; x=2110745719; 
	b=gKnxcWsQI6/Kdu8xOBTwsmdvkz/Q2kNtqh8yImD7CX5TKfPLyqWPugNCiaSrHlayqOs3evFKflW
	FyiqwrAbzmtLNoDgYc+ylX/bGYygDmuqtW3jTzerPBbicTubieup123sSZUbIlGM6f7SjO3VbJGZZ
	IIgww9RfBJF+bMyb/ouaUuD3FgnPACVjErZphv2fcRIrtrwQ2MhjwSbMaPbb/FV77nwl4KTTU9w6K
	8IFULmt56KCHlUGm/uedWMmuG/RMG4DtGJ9jevb97A7IqdTDkkhj9pIiFvMXcQptdbaMsE38/vMGb
	Us3CZNw6HwcjtNSYjy200LGlXnKHW3P/ZFYA==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xVFq4-00000002j1Q-3s6a;
	Sun, 22 Nov 2026 23:15:13 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 22 Nov 2026 19:14:50 -0300
Subject: [PATCH v2 2/4] drm/panfrost: Use drm_gem_shmem_sync()
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261122-pan-drop-dma-buf-hooks-v2-2-2ed42dce9db6@igalia.com>
References: <20261122-pan-drop-dma-buf-hooks-v2-0-2ed42dce9db6@igalia.com>
In-Reply-To: <20261122-pan-drop-dma-buf-hooks-v2-0-2ed42dce9db6@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Karunika Choo <karunika.choo@arm.com>, 
 Lukas Zapolskas <lukas.zapolskas@arm.com>, 
 Chris Diamand <chris.diamand@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Alice Ryhl <aliceryhl@google.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3626; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=ry5WZonfag3R2iYp6kbiStBXwZxqNwSRvxUM5zYxctA=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBrA2leWB2k31mdfCb7Rqs6hOZ6szq/sXqkQQzXv
 PXz/+4kPkyJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCawNpXgAKCRA/8w6Kdoj6
 qqB6B/9gzdu8RXkVh34Hxhc/mlUDuoApgnZGKgUUiDMpJh+xnGWirSpak/cWfYRa+UD1qcT1a/9
 vZX200KIQDnrhzPN7JaFbzFH73sH8ViKBgRunirq3UuoDyPDWWEyZ84usB1AtPWuU48TKDAOBvy
 7sdj/Y+AfK5nJWmcuOimIuKM1sgLWZRA7ndvJw8vbRC6CHjQwnoHh3qt9SwB1NMFDkPifh7+suy
 OXOPlN4J7/Y0j0/0H7i6wDBaH2L8LbK7brDJBo3yhU/HqEg++dw7pBmDENZRe5JwN7DFJXyM27h
 NZp9mEhH236PXoxfBTLAAWZBHLLP1GwFZpHniYK0oO0dbqxz
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

panfrost_gem_sync() walks the shmem sgt without holding the resv lock,
so the shrinker can purge a BO and free the sgt during the walk. It also
repopulates purged BOs, allocating memory the shrinker can no longer
reclaim.

The common helper drm_gem_shmem_sync() has the same functionality as
panfrost_gem_sync(), but it also handles the mentioned cases. Translate
the Panfrost UAPI sync type to the common shmem type and use the helper
instead.

Fixes: 7be45f548976 ("drm/panfrost: Add a PANFROST_SYNC_BO ioctl")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 74 +++------------------------------
 1 file changed, 5 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 518f24549b9d..8c0facd498d7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -555,84 +555,20 @@ int
 panfrost_gem_sync(struct drm_gem_object *obj, u32 type, u32 offset, u32 size)
 {
 	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
-	struct drm_gem_shmem_object *shmem = &bo->base;
-	const struct drm_device *dev = shmem->base.dev;
-	struct sg_table *sgt;
-	struct scatterlist *sgl;
-	unsigned int count;
-
-	/* Make sure the range is in bounds. */
-	if (offset + size < offset || offset + size > shmem->base.size)
-		return -EINVAL;
-
-	/* Disallow CPU-cache maintenance on imported buffers. */
-	if (drm_gem_is_imported(&shmem->base))
-		return -EINVAL;
+	enum drm_gem_shmem_sync_type shmem_type;
 
 	switch (type) {
 	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH:
+		shmem_type = DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH;
+		break;
 	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
+		shmem_type = DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE;
 		break;
-
 	default:
 		return -EINVAL;
 	}
 
-	/* Don't bother if it's WC-mapped */
-	if (shmem->map_wc)
-		return 0;
-
-	/* Nothing to do if the size is zero. */
-	if (size == 0)
-		return 0;
-
-	sgt = drm_gem_shmem_get_pages_sgt(shmem);
-	if (IS_ERR(sgt))
-		return PTR_ERR(sgt);
-
-	for_each_sgtable_dma_sg(sgt, sgl, count) {
-		if (size == 0)
-			break;
-
-		dma_addr_t paddr = sg_dma_address(sgl);
-		size_t len = sg_dma_len(sgl);
-
-		if (len <= offset) {
-			offset -= len;
-			continue;
-		}
-
-		paddr += offset;
-		len -= offset;
-		len = min_t(size_t, len, size);
-		size -= len;
-		offset = 0;
-
-		/* It's unclear whether dma_sync_xxx() is the right API to do CPU
-		 * cache maintenance given an IOMMU can register their own
-		 * implementation doing more than just CPU cache flushes/invalidation,
-		 * and what we really care about here is CPU caches only, but that's
-		 * the best we have that is both arch-agnostic and does at least the
-		 * CPU cache maintenance on a <page,offset,size> tuple.
-		 *
-		 * Also, I wish we could do a single
-		 *
-		 *      dma_sync_single_for_device(BIDIR)
-		 *
-		 * and get a flush+invalidate, but that's not how it's implemented
-		 * in practice (at least on arm64), so we have to make it
-		 *
-		 *      dma_sync_single_for_device(TO_DEVICE)
-		 *      dma_sync_single_for_cpu(FROM_DEVICE)
-		 *
-		 * for the flush+invalidate case.
-		 */
-		dma_sync_single_for_device(dev->dev, paddr, len, DMA_TO_DEVICE);
-		if (type == PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
-			dma_sync_single_for_cpu(dev->dev, paddr, len, DMA_FROM_DEVICE);
-	}
-
-	return 0;
+	return drm_gem_shmem_sync(&bo->base, offset, size, shmem_type);
 }
 
 void

-- 
2.56.0

