Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117203;
	b=XF0rwiDamnzrDZVLIBq/tlF3atIWyWKcs6QzO0RE77eBa9U/xUsJQJsvKU5zVdeqU9eD
	 IZ6L8X7GfyWRJLWemS5ICCUPgksF+mdEDwsC1nE6U5TxmwdJ/hdpmcK6COIAYdiZ2HwEW
	 IZV+P/BJl9EChsDTjLiAISaszIMv4RsZwgazticyAws2tHEj0odm2EiTbFvJhaGOEuMy3
	 ZFmqnGqg4tFj/Z/2ooXmhCgr5RYS2Squ+KYgPofWAiY6Cq0evLTcO9fs+bI92FAlLBj0y
	 mZSIPqaKTs0NGELX0KwIlbDm42Q0fJBnp9Djv3iXgZ0KMLjH31PbFd4nHhYOAZJNFng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117203;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=11dceCx6NNltF/tXlwjsqpzrmsRuS7s/DgEQ4I62VNM=;
	b=FKVXjNrWkZLxTpKam+/U2zOlfy0gcZNi6GHeD8GFM5zX1Nt7VOr7PkIiELzX3whL5TYE
	 kpLq4Arkg5w27FshDpankbRORWdL0UbXsWOR8It2Kg8+5bUUByPYZRTRWcB9Jomdilb2C
	 8Jfuqag8fAIG16yr7LNX6punNUmOK6WPc/RQ8PSYkToBOdQoFy/cmCd2HE37F+YtGO2KN
	 yedpDo9XJ8SzP56+GCVMXdKPbV9VR5n2esiV0Foum8zlc/G55RkMCtpe4f+zKlbXWIBY0
	 Frt1bvDm+TXqO/BfMEgi1TFyF9sIDY+5jmU6R67nCn3XvbdrRIvuyN/00FORFp8PBWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=c55pa8qf;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130B606A325
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 19:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9130B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=c55pa8qf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=11dceCx6NNltF/tXlwjsqpzrmsRuS7s/DgEQ4I62VNM=; t=1795117203; x=2110477203; 
	b=c55pa8qf9fLLPmYQu7/6NS68/uCSBButpBMj88A1I/kxfZam23Hjqj0arGeMIgkroDmKgt2M+sD
	nzkO/5Vy+PaCnA4sU+XbUO44wGnriWfL0PlParmxH5eY52hiUuz+PhqMmGPSUp1fD+Q2z29cG5XvX
	mlPhN7vPowHKwMgF0WpFnnmf7mvnJxmPAhknNKVkOJ7kd4c9FoB7HONRwilLme4GK3G0b2nkhyAjC
	hUYZSRGwdCHjReRBkgvwl3FpIUcW0Fs9LYOffxb2iwZKibhJlxYARaynrLHYNoQyPQNqNExXlBdDo
	JLsTiU6qI02WPRKlnW9mnl3OkjnBdL5C/D7Q==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xU7zD-00000001bU7-33Jo;
	Thu, 19 Nov 2026 20:39:59 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 19 Nov 2026 16:38:19 -0300
Subject: [PATCH 4/6] drm/panfrost: Use drm_gem_shmem_sync()
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
Message-Id: <20261119-pan-drop-dma-buf-hooks-v1-4-6c6f1629e7f9@igalia.com>
References: <20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com>
In-Reply-To: <20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3271; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=E08CGpE8feIhO6oDiRunoctz785nqcNQtJgh54zPEBo=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBq/1Bvajb5Tz6P5ei8rUKp1JLbWxViWT56ewLIU
 jKhr1F6x/+JATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCav9QbwAKCRA/8w6Kdoj6
 qv2nB/98DQyLZMariRAuMQeqbWXCtnziFDpC87FBoYo7xyGLyhJLbWX5cu2zu0hGU1tEqvQof32
 JUb+N9DxRY3tX1DCm+7kYkRntxkE/yAwMPzKIm38qbHXCeuXNbcwfzMA2UTWBZ6m3fxbGEHDYdB
 XYiyAVNQzwDfXbGjvpysntMdZ4mEZ5bTmqwwgZK9/TascPCoSfde4/MRfOkJip5NKEBSZ5sbNsh
 4jJmNwkBE0I5afgrIen0U/P8P3WCdZKvtGErw2D5uNErDhQOQKLRhQ5/NbKKDUjkGZIAgx8TMaP
 bTask6IHPh9Ak06o9XmIYIZxpOASAMuYU/vAm7mBP3ZpfPic
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

panfrost_gem_sync() has the same code as the function drm_gem_shmem_sync().
Translate the UAPI sync type to the common shmem type and use the shmem
helper instead.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 74 +++------------------------------
 1 file changed, 5 insertions(+), 69 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 7d04793cc6ce..5b4401b967aa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -443,84 +443,20 @@ int
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

