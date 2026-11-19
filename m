Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117198;
	b=iRE69FhkrdLb8IFZvgKcNHONsTE8bFEL+fey5NVyCaSBRqyKOc64c4EBnWIpR2My3k3y
	 PrWS64kFRduI3p0M6XjwHc3KYlE9YXGZqPEJGADBi+TnTF5x9NtslJHkSeAkbk5oBc4QP
	 YuhrtnABDT1aXOxU4OpbkIHoMedsnFVMLWF13/4899N9QhuaFIbD5GhiZ4XbkehEIqV1g
	 gN03WfL1Q3p1HUEwcjPkpbXkKZywNL7MP8iEx5R6wX5mDCOgrn0WPqT90mmsMD1FCJNfW
	 M+ptCdmLVxa+WurztNLBqPoJFjuQOMucfqkClDkFHJeERnSYVPgtuTn8aaDtk0lN29Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117198;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OuPoMSCOjOhx47a37SW0L7HBTGLu7gUxL3KlitKE/d8=;
	b=VLJlM23JTYSwbw1YqmwpDbA1rtnExyWRMJkmg4Lxd8MDqRHa2YSZEUsBeT8HAr/SNsJ8
	 MNSgaRDAEobP7al0pOxlNd6ZkDp/JINIj++i+3TVWfCR2IukB9YCISSfgx7FhFU0waAK1
	 pTtWevJpLnTyBoYcwunnOMXQvzOR3PVNiDwAEHM4unwBHQpfJkneE8M/Xh4IvECpJ1Pqo
	 BrNQl3Wei3AcDP4xW5l9hrewcxtUa4Yac9e+QefXcVZKqroWoxd+G4vFWzNIfzHHd5l5Y
	 tUTORvjz35BtjEIVX0w5DdmbJYjqHPhb2gwZ/wQXISCjUQLY4ctW+9VsOxich5VN3nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KABnzZt1;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8814B606A330
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 19:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8814B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=KABnzZt1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=OuPoMSCOjOhx47a37SW0L7HBTGLu7gUxL3KlitKE/d8=; t=1795117197; x=2110477197; 
	b=KABnzZt1lHgzTiaOa1izs0RhdtoAhVcwbvh/X8LfOK4jVhUm50UK6yv8P+1TxPDxaL8w8/X/bMo
	3ULgKxp5xxYLEiDYEb/aJAdSXiEM53Kjut/CEC70WanvZqScjlSdYV462aHTVpW3Tdm3Jv5EFjF3x
	da22jLNzYbvBDD/mqbJxbSZI5JHyxHdGmEAEBoWaBUOQhojk/hz19vZQq4k2tjM5+rieJIdJI0CMl
	QWmz7bbB7K56lRf87ZOKaPoqrddH0tr5nt116bz2UjE0/DjQlSWmc1YxWETGwHOcLIT8+jSvo4chK
	IQGLaqKhzjN6cBKqR9zgfDYrI8krMeG0h9Kw==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xU7z7-00000001bU7-27xb;
	Thu, 19 Nov 2026 20:39:53 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 19 Nov 2026 16:38:18 -0300
Subject: [PATCH 3/6] drm/panfrost: Drop custom dma_buf_ops
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
Message-Id: <20261119-pan-drop-dma-buf-hooks-v1-3-6c6f1629e7f9@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5984; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=R5glBy0apaFtcqYXA74H/E/8MA5Dydbs6vIEtUBXWM8=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBq/1BvFy7nvWfhHDo7GL3f41ELygZaY1yQ9rZgI
 17ejiJuVn+JATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCav9QbwAKCRA/8w6Kdoj6
 qsfUB/0YvO44Te6S3NeW8Bt+D7r/7SsDHMZmzL7yLKqwHDRDbDlgYkVvjE331m4+G+SBgXNaOWV
 EOJ1NJi6g+gXjLo6GidX5v5RDztlgEsA5vJPGFfQw6W85FJ7FRafuCEiNGKMkJcCRzfaxmsfitR
 wodmo2zvGDM3fTuubOrX/wpt3jif3KTXYK6610BEC7+ZNrQN47lnYg4VjEvPJTQNtjHVzzN4X79
 FmLIFLwIJV784QlOQ8njxSgL/y5ON+kPtoTBqFRFJkGzJTJWo8CBTJMqjTRzRIamM5wCGBwxJiB
 BRkhu2kX/Ot0yEdYQJ4ISSnA1iiu9a/8LmLKUVsPZsxDH5Cf
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

The custom dma_buf_ops were added to provide CPU cache maintenance in
begin/end_cpu_access() for WB_MMAP BOs. As those can no longer be
exported, use the default PRIME ops.

On IO-coherent GPUs, all BOs are CPU-mapped WB, so exported BOs lose
begin/end_cpu_access() cache maintenance for non-coherent importers.
This restores the behavior prior to commit 3ae6637378e6 ("drm/panfrost:
Provide a custom dma_buf implementation").

Suggested-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |   1 -
 drivers/gpu/drm/panfrost/panfrost_gem.c | 118 +-------------------------------
 drivers/gpu/drm/panfrost/panfrost_gem.h |   3 -
 3 files changed, 1 insertion(+), 121 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index eeda113037fe..0a6ff8bec66d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -824,7 +824,6 @@ static const struct drm_driver panfrost_drm_driver = {
 	.minor			= 7,
 
 	.gem_create_object	= panfrost_gem_create_object,
-	.gem_prime_import	= panfrost_gem_prime_import,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = panfrost_device_debugfs_init,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index c7160223ea17..7d04793cc6ce 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -289,130 +289,14 @@ static size_t panfrost_gem_rss(struct drm_gem_object *obj)
 	return 0;
 }
 
-static struct sg_table *
-panfrost_gem_prime_map_dma_buf(struct dma_buf_attachment *attach,
-			       enum dma_data_direction dir)
-{
-	struct sg_table *sgt = drm_gem_map_dma_buf(attach, dir);
-
-	if (!IS_ERR(sgt))
-		attach->priv = sgt;
-
-	return sgt;
-}
-
-static void
-panfrost_gem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
-				 struct sg_table *sgt,
-				 enum dma_data_direction dir)
-{
-	attach->priv = NULL;
-	drm_gem_unmap_dma_buf(attach, sgt, dir);
-}
-
-static int
-panfrost_gem_prime_begin_cpu_access(struct dma_buf *dma_buf,
-				    enum dma_data_direction dir)
-{
-	struct drm_gem_object *obj = dma_buf->priv;
-	struct drm_device *dev = obj->dev;
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	struct dma_buf_attachment *attach;
-
-	dma_resv_lock(obj->resv, NULL);
-	if (shmem->sgt)
-		dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
-
-	if (shmem->vaddr)
-		invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.size);
-
-	list_for_each_entry(attach, &dma_buf->attachments, node) {
-		struct sg_table *sgt = attach->priv;
-
-		if (sgt)
-			dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
-	}
-	dma_resv_unlock(obj->resv);
-
-	return 0;
-}
-
-static int
-panfrost_gem_prime_end_cpu_access(struct dma_buf *dma_buf,
-				  enum dma_data_direction dir)
-{
-	struct drm_gem_object *obj = dma_buf->priv;
-	struct drm_device *dev = obj->dev;
-	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
-	struct dma_buf_attachment *attach;
-
-	dma_resv_lock(obj->resv, NULL);
-	list_for_each_entry(attach, &dma_buf->attachments, node) {
-		struct sg_table *sgt = attach->priv;
-
-		if (sgt)
-			dma_sync_sgtable_for_device(attach->dev, sgt, dir);
-	}
-
-	if (shmem->vaddr)
-		flush_kernel_vmap_range(shmem->vaddr, shmem->base.size);
-
-	if (shmem->sgt)
-		dma_sync_sgtable_for_device(dev->dev, shmem->sgt, dir);
-
-	dma_resv_unlock(obj->resv);
-	return 0;
-}
-
-static const struct dma_buf_ops panfrost_dma_buf_ops = {
-	.attach = drm_gem_map_attach,
-	.detach = drm_gem_map_detach,
-	.map_dma_buf = panfrost_gem_prime_map_dma_buf,
-	.unmap_dma_buf = panfrost_gem_prime_unmap_dma_buf,
-	.release = drm_gem_dmabuf_release,
-	.mmap = drm_gem_dmabuf_mmap,
-	.vmap = drm_gem_dmabuf_vmap,
-	.vunmap = drm_gem_dmabuf_vunmap,
-	.begin_cpu_access = panfrost_gem_prime_begin_cpu_access,
-	.end_cpu_access = panfrost_gem_prime_end_cpu_access,
-};
-
 static struct dma_buf *
 panfrost_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
-	struct drm_device *dev = obj->dev;
-	struct dma_buf_export_info exp_info = {
-		.exp_name = KBUILD_MODNAME,
-		.owner = THIS_MODULE,
-		.ops = &panfrost_dma_buf_ops,
-		.size = obj->size,
-		.flags = flags,
-		.priv = obj,
-		.resv = obj->resv,
-	};
-
 	/* WB_MMAP BOs can't be shared. */
 	if (to_panfrost_bo(obj)->wb_mmap)
 		return ERR_PTR(-EINVAL);
 
-	return drm_gem_dmabuf_export(dev, &exp_info);
-}
-
-struct drm_gem_object *
-panfrost_gem_prime_import(struct drm_device *dev,
-			  struct dma_buf *dma_buf)
-{
-	struct drm_gem_object *obj = dma_buf->priv;
-
-	if (dma_buf->ops == &panfrost_dma_buf_ops && obj->dev == dev) {
-		/* Importing dmabuf exported from our own gem increases
-		 * refcount on gem itself instead of f_count of dmabuf.
-		 */
-		drm_gem_object_get(obj);
-		return obj;
-	}
-
-	return drm_gem_prime_import(dev, dma_buf);
+	return drm_gem_prime_export(obj, flags);
 }
 
 static const struct drm_gem_object_funcs panfrost_gem_funcs = {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 3008afcf4bff..b80bd5f2295f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -138,9 +138,6 @@ struct drm_gem_object *
 panfrost_gem_prime_import_sg_table(struct drm_device *dev,
 				   struct dma_buf_attachment *attach,
 				   struct sg_table *sgt);
-struct drm_gem_object *
-panfrost_gem_prime_import(struct drm_device *dev,
-			  struct dma_buf *dma_buf);
 
 struct panfrost_gem_object *
 panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags);

-- 
2.56.0

