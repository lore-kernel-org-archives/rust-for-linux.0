Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385716;
	b=ZQIjtEXUmlX4uRxo/3xcg0WdY20zCXyHPRSCdRIYnH9T16do7L82GIzg3vVWgli0MILz
	 NIRtYHSuISlE5rs3P906wE+aO8Ki8UsrxFQVyDOfvqwCXMxmI8XHqImSMOaUU2E7rDtH3
	 DWuz0qAiun+vcVafD6/69HBfw3OzZcFi+ZDZIRc7b8bbPCZvVa1wWhUPaFO2tTf6ZA5Oi
	 13hIPCyaxv056k8gtaYpJo0g3A2A2DzyT6n2eBYApb8ukmSH+J5DkNVqxDJlnaw03WyXx
	 tJfRz7iXGbz6b4BOA4q8SgumR9RM+qRGoKEMXLLJ2/m+tFB0OQ3JWym4hWoLTaLMyoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385716;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tZgy2Acviezdj4+o9I81vHvd1Rw5D+LtDPB44OQJRD0=;
	b=Sgr3de5f0Os74IvZSBFhgoZ2bYQX4RlfiHn9GF14MzSB2TsnnrH9wAw4kd3aC8uMzF8L
	 2UEgWjw/xrMBAd+zCXROEYOE5UNTxpW8oRJavJAJJe+zJGoADYdHiAJsZtrhr88GnmyrU
	 8bRmbe6wfP+69iaJyNeHDQ0JXhTw2XZGJ9/NrzmAy+wMxOGldGHi53t8hRbt7OCPO6zoi
	 KrqGh3gl7JYanFL5KaW8bmnJOsLHBahh6d4pgFBVg3APmFp/y7goCtEcY75vYMLEQyN0z
	 Zp4TmF1bMHPm/sc4UhRCTrl+ckWXDRfw+UHw8Dri9ZjiXzcsZZXbgDj8K0z5B2eArkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=mWF8Urru;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DD3606A320
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Nov 2026 22:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DD3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=mWF8Urru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=tZgy2Acviezdj4+o9I81vHvd1Rw5D+LtDPB44OQJRD0=; t=1795385714; x=2110745714; 
	b=mWF8Urru3RKEbsKt6ORObWhh3pCY+YXoqv3mYzB6FXjq95n9k6q5HXemy2J0hfFx9UtHHxiP+88
	Y7CCSpKsmejLqoo/XLpguo1XDiCjFT8dPxVxLKYG6ijVUwrLHBAxidZQiabdp8YHcwIQVZX80rra0
	iYnzKj8epqHaUGMiACJYbepl8HdeXrFnFkqY4rhQOgSR9rlw4+7FLgh2qrYVDmF28fVciuwrcEc7M
	uqu4oqIXKEuv1b/V4RW4l+I69M/dea8ogs5N4CuWvdpILmXoOFHYnIiAdJt5DiVxlFgm+nRJS43Cs
	16YF87Y0TckmdMcudJYX16ONz/FPrYMpPP2A==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xVFpy-00000002j1Q-2GZX;
	Sun, 22 Nov 2026 23:15:06 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 22 Nov 2026 19:14:49 -0300
Subject: [PATCH v2 1/4] drm/shmem: Add a drm_gem_shmem_sync() helper
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
Message-Id: <20261122-pan-drop-dma-buf-hooks-v2-1-2ed42dce9db6@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=mHgl0Na3xpR041r5/wE7OxY53UlFpicQLznYg7tTlW4=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBrA2ld+Z2v2b4U+j4fuvUWeC4+a4bfTs7ADTCBo
 SusPAelWP6JATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCawNpXQAKCRA/8w6Kdoj6
 qtxgB/4+T3PUmsG+d4WUUDwwsR1ybff9BHyxWFcr0NH0VRlkZD/0dSxl3yJnLbo1OJyMCbEth0Q
 K6RxA6aPOzPCmCP2tGkM2rWWOV7psMVkEwWTFGWEE2U2pkF/oHk2S/NxR9XNV/Kej6gc0R5jGtv
 EOe41c0PpCphZP1FBAd7oh5mHM2JII/GQLYxAdyTPLwctXIxO8/M77IZVF/N5P3N/SR9PkEyqfj
 I5uGObqP1Gc9yQSt4bBW/b2eSZnNjWpx+NO3SdYGceb3rjvLGdb8cd7wzMZzEVsdKGHIQfan68a
 AjmZQtXoUs1Vsh7AcFt3U04pMeCb249qDufqD+Q1wimOvEGm
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

From: Faith Ekstrand <faith.ekstrand@collabora.com>

This enables syncing mapped GEM objects between the CPU and GPU via calls
to dma_sync_*().  It's a bit annoying as it requires walking the sg_table
so it's best if every driver doesn't hand-roll it.

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
[mcanal: rebased on top of drm-misc-next, fixed kernel-doc nits, added a
resv lock across the sgt walk, and skip unbacked/purged BOs]
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 108 +++++++++++++++++++++++++++++++++
 include/drm/drm_gem_shmem_helper.h     |  17 ++++++
 2 files changed, 125 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d654a22a30de..cc3d04d2d58e 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -901,6 +901,114 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
 
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
+	int ret;
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
+	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
+	if (ret)
+		return ret;
+
+	/* No CPU mapping can exist without pages, and purged BOs have
+	 * no content to be synced.
+	 */
+	if (!shmem->pages || shmem->madv < 0)
+		goto out_unlock;
+
+	sgt = drm_gem_shmem_get_pages_sgt_locked(shmem);
+	if (IS_ERR(sgt)) {
+		ret = PTR_ERR(sgt);
+		goto out_unlock;
+	}
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
+out_unlock:
+	dma_resv_unlock(shmem->base.resv);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_gem_shmem_sync);
+
 /**
  * drm_gem_shmem_prime_import_sg_table - Produce a shmem GEM object from
  *                 another driver's scatter/gather table of pinned pages
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

