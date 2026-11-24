Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530005;
	b=ilExCuiDOBAuHcrW3amS1tAC0vNlVlZH8wt4yWW6jDa/kwLlnuJbOyNaOPn7D7pE/GVr
	 BPshD5kIdXWwB5MBuw3MHAFHCk1i3O13W2s0UbZrHXZTGl7twF164WUZHIW3CNLkccq3L
	 qnDHH9c2S9UI5rb0AlvGwyzxXFepIzn0tJQWQZRG1rSjj0iejvFhKOJFKgVgFH2Y1FlRf
	 ZtvM5VVRlW37xARoEZSPvCEfJ5b8kIOeR02FeKhwkrEIQlJErcozAmn+Ah4EvXTw+iH0q
	 GIf5Af6GCCT0sUmn3JGoiSaotevFfn4amanxNVkM3+DsfM7hbsDW255UaBk8GBMcc4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530005;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=tEGouMmhYAeja5urgKVsvbhmrkwsfAFXC5BTzsQYono=;
	b=LPxFghFrBSqq6TK92Hw1bhM+0w5n7NF2/8sFfPwSNcUkhmrmPyJycEEHqKmNVwc87XNX
	 pI1lrWfO/Tr5oIMoNSJu34EYPwfKFoDjL4rHTscceUfqnmx8FMnDwyU32NVVK67Kqbt2o
	 S+lVPOg286vyChEhW7cme6wlf863sfSEo8/lnnPAE/xkhKZ5AOFIDJc9G3iKJGbF21Yca
	 yg9MQfctQJGi4drSXPpDdTAus77F3kBYjQ2VJvSFTTExlJcnKCZGdvEskp7S7qZac0LOC
	 RRnT1atX63b8xKwzcxmuBLXShwFGHaHvZmGLss584LB1Js/AEhLzLrUTSMj9X8l0Tzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lNnQ7ft5;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6BF606A335
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 14:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D6BF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lNnQ7ft5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B434F497
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 06:19:59 -0800 (PST)
Received: from [10.2.11.19] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 595283F632
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 06:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795530002; bh=FuyFuIeHIuWMzYCUI4xQv58iEQ62HNIN1zugcPKZV4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lNnQ7ft5EaUWiYF0JrjgSWPaa5tLubWbAy0+2hf4V8yPOV/u4akDF2ASQUFMwJFpH
	 nBskK2PtICQ165cSW2X1sIGRxqxHMwVRFkxt2m7k62Za0IWxqGk65UT7PA9ocSCDnJ
	 05DNs+RGc2eqi+0uQnA65sM2V8n3g3fzNsxk7rIY=
Date: Tue, 24 Nov 2026 14:19:39 +0000
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
Subject: Re: [PATCH 1/6] drm/shmem: Add a drm_gem_shmem_sync() helper
Message-ID: <awWc-1edHJpmIHF4@e142607>
References: <20261119-pan-drop-dma-buf-hooks-v1-0-6c6f1629e7f9@igalia.com>
 <20261119-pan-drop-dma-buf-hooks-v1-1-6c6f1629e7f9@igalia.com>
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
In-Reply-To: <20261119-pan-drop-dma-buf-hooks-v1-1-6c6f1629e7f9@igalia.com>

On Thu, Nov 19, 2026 at 04:38:16PM -0300, Maíra Canal wrote:
> From: Faith Ekstrand <faith.ekstrand@collabora.com>
> 
> This enables syncing mapped GEM objects between the CPU and GPU via calls
> to dma_sync_*().  It's a bit annoying as it requires walking the sg_table
> so it's best if every driver doesn't hand-roll it.
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> [mcanal: rebased on top of drm-misc-next and fixed a kernel-doc nit]
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 93 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h     | 17 +++++++
>  2 files changed, 110 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index d654a22a30de..72933ed28373 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -790,6 +790,99 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
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
> +	sgt = drm_gem_shmem_get_pages_sgt(shmem);
> +	if (IS_ERR(sgt))
> +		return PTR_ERR(sgt);
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
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_sync);
> +
>  /**
>   * drm_gem_shmem_print_info() - Print &drm_gem_shmem_object info for debugfs
>   * @shmem: shmem GEM object
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
