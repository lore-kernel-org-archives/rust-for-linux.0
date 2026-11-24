Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557433;
	b=ChPUQOUi9hT2aorh7BHfO6mb0CWq1910obMcd+8sZDPkYUrK8hDuGbvkMWkdbHd/q529
	 mOc4ytc78IekGU4pismRSvkhUwlqZs5ZiZ3Yu1XcqY6tv8HZa/6qGcBQsfpE1zfL/17sQ
	 qZPcigPYTntsYvTWBJYWaSqRLxn2NFk6/0pGS7gyWwXahccpN3XV8a3PDrpKll4hI5x35
	 AjM4m2fcpEyx3XT2HFA4Zlupm37FKzpe4V9q0D7e+uUpHm/aC4RoWxy2a5YTloEI4PUUi
	 jkkRLgr8y63Ad2EDX7asVbXXbx4ejeFiqvb0WetHW5DeTtdYVDVV2PoiMGmqUGw81lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557433;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=y7bP+CZPpx2yVIY/lngLe2s+quzyte5ixxJmcdp6ly8=;
	b=EZV3f1lyoG8ePyGbcIJomPB0fbNYHxhzYMMBdLOFDM+MTL039Yp5GJgQLQnWISLxn896
	 3y7eoNtsQvj8mBiwD+DRgF+X12zuhQsYjK4cpKIPGYEq+W/IQP07Dhi6Q3nsIlbH5bFzB
	 sIYJT/TeZwozX/eiG//HLviVbMRtHLbPJTfLK/064BcaYhcluHU7vCHhtx+lx/SiCMTDM
	 YWuFdqkUzDnhw4edPJq/xfn8ATcn2weCrFlPyLXpT4yiorSlNB+IjIeuCt+YWQSFkvB1o
	 I5+HhGAEblGKlVmJL3qR2O5aR/ArFogfCBzveDeKUMThLVUa3QVALCDF58kD5b0srCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="erjU/wgj";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7C4606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 21:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C7C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=erjU/wgj
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F8CB339
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 13:57:08 -0800 (PST)
Received: from [10.2.11.19] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06EF23F763
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 13:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795557431; bh=bpiX+NehYtjOn104gSrnkTT9oI27YzkEJxqY6Ww988k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=erjU/wgjHcacVXiIMni5zyXCRKCNh7+MEcfgHnpYE4zn1n4lxv32hFfjc32ihw3me
	 NlhkXDGFKZ+5YO9tZnAerKSqunU/a5A6APjLZKuLfOwzr/vSm/g7l2QfHXuPqyzVWc
	 0szaUNgSvzsGHECztqNJ64Mq/TBABAPYHFOUr61E=
Date: Tue, 24 Nov 2026 21:56:51 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Faith Ekstrand <faith.ekstrand@collabora.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	=?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
	Akash Goel <akash.goel@arm.com>,
	Karunika Choo <karunika.choo@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>, kernel-dev@igalia.com,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drm/shmem: Add a drm_gem_shmem_sync() helper
Message-ID: <awYII3tzMzv89tAV@e142607>
References: <20261122-pan-drop-dma-buf-hooks-v2-0-2ed42dce9db6@igalia.com>
 <20261122-pan-drop-dma-buf-hooks-v2-1-2ed42dce9db6@igalia.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261122-pan-drop-dma-buf-hooks-v2-1-2ed42dce9db6@igalia.com>

On Sun, Nov 22, 2026 at 07:14:49PM -0300, Maíra Canal wrote:
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> This enables syncing mapped GEM objects between the CPU and GPU via calls
> to dma_sync_*().  It's a bit annoying as it requires walking the sg_table
> so it's best if every driver doesn't hand-roll it.
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> [mcanal: rebased on top of drm-misc-next, fixed kernel-doc nits, added a
> resv lock across the sgt walk, and skip unbacked/purged BOs]
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 108 +++++++++++++++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h     |  17 ++++++
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index d654a22a30de..cc3d04d2d58e 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -901,6 +901,114 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt);
>  
> +/**
> + * drm_gem_shmem_sync - Sync CPU-mapped data
> + * @shmem: shmem GEM object
> + * @offset: Offset into the GEM object
> + * @size: Size of the area to sync
> + * @type: Type of synchronization
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int drm_gem_shmem_sync(struct drm_gem_shmem_object *shmem, size_t offset,
> +		       size_t size, enum drm_gem_shmem_sync_type type)
> +{
> +	const struct drm_device *dev = shmem->base.dev;
> +	struct sg_table *sgt;
> +	struct scatterlist *sgl;
> +	unsigned int count;
> +	int ret;
> +
> +	/* Make sure the range is in bounds. */
> +	if (offset + size < offset || offset + size > shmem->base.size)
> +		return -EINVAL;
> +
> +	/* Disallow CPU-cache maintenance on imported buffers. */
> +	if (drm_gem_is_imported(&shmem->base))
> +		return -EINVAL;
> +
> +	switch (type) {
> +	case DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH:
> +	case DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* Don't bother if it's WC-mapped */
> +	if (shmem->map_wc)
> +		return 0;
> +
> +	/* Nothing to do if the size is zero. */
> +	if (size == 0)
> +		return 0;
> +
> +	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
> +	if (ret)
> +		return ret;
> +
> +	/* No CPU mapping can exist without pages, and purged BOs have
> +	 * no content to be synced.
> +	 */
> +	if (!shmem->pages || shmem->madv < 0)
> +		goto out_unlock;
> +
> +	sgt = drm_gem_shmem_get_pages_sgt_locked(shmem);
> +	if (IS_ERR(sgt)) {
> +		ret = PTR_ERR(sgt);
> +		goto out_unlock;
> +	}
> +
> +	for_each_sgtable_dma_sg(sgt, sgl, count) {
> +		if (size == 0)
> +			break;
> +
> +		dma_addr_t paddr = sg_dma_address(sgl);
> +		size_t len = sg_dma_len(sgl);
> +
> +		if (len <= offset) {
> +			offset -= len;
> +			continue;
> +		}
> +
> +		paddr += offset;
> +		len -= offset;
> +		len = min_t(size_t, len, size);
> +		size -= len;
> +		offset = 0;
> +
> +		/* It's unclear whether dma_sync_xxx() is the right API to do CPU
> +		 * cache maintenance given an IOMMU can register their own
> +		 * implementation doing more than just CPU cache flushes/invalidation,
> +		 * and what we really care about here is CPU caches only, but that's
> +		 * the best we have that is both arch-agnostic and does at least the
> +		 * CPU cache maintenance on a <page,offset,size> tuple.
> +		 *
> +		 * Also, I wish we could do a single
> +		 *
> +		 *	dma_sync_single_for_device(BIDIR)
> +		 *
> +		 * and get a flush+invalidate, but that's not how it's implemented
> +		 * in practice (at least on arm64), so we have to make it
> +		 *
> +		 *	dma_sync_single_for_device(TO_DEVICE)
> +		 *	dma_sync_single_for_cpu(FROM_DEVICE)
> +		 *
> +		 * for the flush+invalidate case.
> +		 */
> +		dma_sync_single_for_device(dev->dev, paddr, len, DMA_TO_DEVICE);
> +		if (type == DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
> +			dma_sync_single_for_cpu(dev->dev, paddr, len, DMA_FROM_DEVICE);
> +	}
> +
> +out_unlock:
> +	dma_resv_unlock(shmem->base.resv);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_sync);
> +
>  /**
>   * drm_gem_shmem_prime_import_sg_table - Produce a shmem GEM object from
>   *                 another driver's scatter/gather table of pinned pages
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index bcbb92f3fe9b..a5def70fae7a 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -122,6 +122,23 @@ void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>  				 struct iosys_map *map);
>  int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
>  
> +/**
> + * enum drm_gem_shmem_sync_type - Type of synchronization
> + */
> +enum drm_gem_shmem_sync_type {
> +	/** @DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH: Flush CPU caches */
> +	DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH = 0,
> +
> +	/**
> +	 * @DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE: Flush and
> +	 * invalidate CPU caches
> +	 */
> +	DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE,
> +};
> +
> +int drm_gem_shmem_sync(struct drm_gem_shmem_object *shmem, size_t offset,
> +		       size_t size, enum drm_gem_shmem_sync_type type);
> +
>  int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);
>  
> 
> -- 
> 2.56.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
