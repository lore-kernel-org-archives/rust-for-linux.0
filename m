Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117184;
	b=iAnGoNQ6BbQc89Imbobt6cyFwm5GRf+wMF9zcgDasKxnzZucBsqm/sS5bHgSgYJ8DjI/
	 ShCS9LvSD17J4F12Izada+ujer2KiIL/ofoDcvBOz3LZJ6FI+XeTrmjKKUwie0GTt8hSz
	 QoUzWVYWz09B0GNzYAweuWj5HUsqC9v62Hvh/jJe1xJfuPbEtozeLYHu65BzHIRIiTEI9
	 5xOcYH7VM8vZoaOlNV0tpY9Z9sJIqJL73B8TcoQl6gneunFqFQYs0BuhR2t5Pn5OQI94Q
	 8VYPvNsi1pz8UExhNHpNY1sQhBY4rL+AOe5IQaeEHqP224N7FP2EjeO5GAT0Hnxpxgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117184;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ixa+ENI6eAGW02eHz27q61QbODiFBBbeXHlcNb/p1n8=;
	b=FLBROpvkXVY2hcvDQAW9fAFOpn1QNrvmFbskXtRBxNKXNNAxKS8Xh5yWjBzy5YOzQO83
	 w3oxym6209mks2nC2tPA9ACTVXMNWM+WUNQRH0TPz5xAjK66XoVLVxBDMLGNFaBbWR3X7
	 vO5AMZj9uDhhdG7/UQGLjPlWaoNILarcYF6z65GgwX657EMB6c14DyRhkrKT4HHusPBEU
	 HAmOEfY1+Rc/Vljvdn9b35pWMJCPvAzH/1E7TihNmjA0iyQDDGQJyuogOdj/KR1/MZILp
	 TwJpAUwu4KphTZwuOiZlIjh8wyqebDV3EQfRWtUjanZ3ykirgpJxUNbAE62MxuoeaKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b="feANNr/K";
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90766606A320
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 19:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90766606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=feANNr/K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=ixa+ENI6eAGW02eHz27q61QbODiFBBbeXHlcNb/p1n8=; t=1795117184; x=2110477184; 
	b=feANNr/KI7xnWLyowcyv2DaA5W0cS/dx/BFJpADTVyd7oqU+K1KL7onCpWNmfRRxuXz98fBX5/x
	//A7e1YKEehoTNxFvIZl0jYXti1TZTwc8pJaHku1WR753Q251W+pPHXfV7TRRMpQ0LP0lCkh8Oq0K
	k/StcR9ii6iN6MD4HTWrCPlyVeNS0PhofCCdTl55q5kaf0nFkWl8OmmRJHdY5GpeWC6zykUB3Lhoz
	8//xHn4bQNGEvzb2qwGAhMH7sLVZTiwVzzDPBu3Gi0s9qsE3gTKWlxHIJgzGv7O2lex7ZQwdpH1KK
	phlZGS0pGAv+Tp28GuT7Cc6Br1fNx6O+0FrQ==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xU7yu-00000001bU7-0o9b;
	Thu, 19 Nov 2026 20:39:40 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 19 Nov 2026 16:38:16 -0300
Subject: [PATCH 1/6] drm/shmem: Add a drm_gem_shmem_sync() helper
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
Message-Id: <20261119-pan-drop-dma-buf-hooks-v1-1-6c6f1629e7f9@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4927; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=XYXvbIMVlRl9OO7Lt7svHGYxZCClm2wNi5jv7y6SbKk=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBq/1BuizGcJPFyqIKskCq5AuZAa+zRB6M/yBCNO
 dNyvjuB1DqJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCav9QbgAKCRA/8w6Kdoj6
 qjuwCAC8sFlGNLARHZRY9soNUKWpP75h158QVkT5W2DPnFSrdxdI5z0y8ow3f6xVoU/+v/PSRQZ
 dSi57MNo66izt1fKaYZODi2ynDWdiOIQDAAxUJmjY8cp6Q7+06NHFlVPk9upsmMa0TmI2faFmlb
 FnfHjOGJliuJwGXHQmI2x5Hb7vcmhiCUK0MFHZZCR2jG54gPkRG/1Y6WxHhhFq/suTOtaPOAxD8
 Fez40T40affYvXKtlaPGZlcn7fkLUgh6EBcvqPtRITNbhjaZ8BRDZfp6RQjCm0ErKNLltYMX8ay
 jNxsonREpLrmm0ZHBhPifFEWeBvTRugmWrF3CmOOrSShBoi7
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

From: Faith Ekstrand <faith.ekstrand@collabora.com>

This enables syncing mapped GEM objects between the CPU and GPU via calls
to dma_sync_*().  It's a bit annoying as it requires walking the sg_table
so it's best if every driver doesn't hand-roll it.

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
[mcanal: rebased on top of drm-misc-next and fixed a kernel-doc nit]
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 93 ++++++++++++++++++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     | 17 +++++++
 2 files changed, 110 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d654a22a30de..72933ed28373 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -790,6 +790,99 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
 
+/**
+ * drm_gem_shmem_sync - Sync CPU-mapped data
+ * @shmem: shmem GEM object
+ * @offset: Offset into the GEM object
+ * @size: Size of the area to sync
+ * @type: Type of synchronization
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
+ */
+int drm_gem_shmem_sync(struct drm_gem_shmem_object *shmem, size_t offset,
+		       size_t size, enum drm_gem_shmem_sync_type type)
+{
+	const struct drm_device *dev = shmem->base.dev;
+	struct sg_table *sgt;
+	struct scatterlist *sgl;
+	unsigned int count;
+
+	/* Make sure the range is in bounds. */
+	if (offset + size < offset || offset + size > shmem->base.size)
+		return -EINVAL;
+
+	/* Disallow CPU-cache maintenance on imported buffers. */
+	if (drm_gem_is_imported(&shmem->base))
+		return -EINVAL;
+
+	switch (type) {
+	case DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH:
+	case DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	/* Don't bother if it's WC-mapped */
+	if (shmem->map_wc)
+		return 0;
+
+	/* Nothing to do if the size is zero. */
+	if (size == 0)
+		return 0;
+
+	sgt = drm_gem_shmem_get_pages_sgt(shmem);
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
+
+	for_each_sgtable_dma_sg(sgt, sgl, count) {
+		if (size == 0)
+			break;
+
+		dma_addr_t paddr = sg_dma_address(sgl);
+		size_t len = sg_dma_len(sgl);
+
+		if (len <= offset) {
+			offset -= len;
+			continue;
+		}
+
+		paddr += offset;
+		len -= offset;
+		len = min_t(size_t, len, size);
+		size -= len;
+		offset = 0;
+
+		/* It's unclear whether dma_sync_xxx() is the right API to do CPU
+		 * cache maintenance given an IOMMU can register their own
+		 * implementation doing more than just CPU cache flushes/invalidation,
+		 * and what we really care about here is CPU caches only, but that's
+		 * the best we have that is both arch-agnostic and does at least the
+		 * CPU cache maintenance on a <page,offset,size> tuple.
+		 *
+		 * Also, I wish we could do a single
+		 *
+		 *	dma_sync_single_for_device(BIDIR)
+		 *
+		 * and get a flush+invalidate, but that's not how it's implemented
+		 * in practice (at least on arm64), so we have to make it
+		 *
+		 *	dma_sync_single_for_device(TO_DEVICE)
+		 *	dma_sync_single_for_cpu(FROM_DEVICE)
+		 *
+		 * for the flush+invalidate case.
+		 */
+		dma_sync_single_for_device(dev->dev, paddr, len, DMA_TO_DEVICE);
+		if (type == DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
+			dma_sync_single_for_cpu(dev->dev, paddr, len, DMA_FROM_DEVICE);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_sync);
+
 /**
  * drm_gem_shmem_print_info() - Print &drm_gem_shmem_object info for debugfs
  * @shmem: shmem GEM object
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index bcbb92f3fe9b..a5def70fae7a 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -122,6 +122,23 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 				 struct iosys_map *map);
 int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
 
+/**
+ * enum drm_gem_shmem_sync_type - Type of synchronization
+ */
+enum drm_gem_shmem_sync_type {
+	/** @DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH: Flush CPU caches */
+	DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH = 0,
+
+	/**
+	 * @DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE: Flush and
+	 * invalidate CPU caches
+	 */
+	DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE,
+};
+
+int drm_gem_shmem_sync(struct drm_gem_shmem_object *shmem, size_t offset,
+		       size_t size, enum drm_gem_shmem_sync_type type);
+
 int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
 

-- 
2.56.0

