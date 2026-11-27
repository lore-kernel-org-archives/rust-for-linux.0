Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798427;
	b=E/jf+KDclF7uXesjDe8QhnnKrDAT0YQ6YYZfiRtwpQ6sj6E8OTzdYQ+lLpa6U86E3pmc
	 8hV4sBD21iYRdmEV6poGvf4hffQqsg8JB5dEEUgBe/aQCAUGGBrUjJLpq4y1j8TQOAC3T
	 +Zi7PDfxVW2tWbnZ737FyoclK8gqIdbCUPn/vfWpVXq4OEmMB86siQdcQ8AzLTnx5a6gi
	 shgYehV2wTBY5mX6dHenCsPLmwTPbJaMHaVYTls3kAlB0jAGBVM0IRnA8c4S3SbDzc+XM
	 PgfPx0BAhfP7PQKVp5FsvSKr9wqsu7odEe1wP+Bo1/4COmdxt2vtUqwOSI3aGT3z61w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798427;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=O8vowK1gkwnNLIhhzkJMkitG8JCCO+6fftR4y5K5evc=;
	b=bYBWEmHF1PCdGOqZUJsJnCJJ+6nlZt8kgP9J+1fmzXoDhtdaam0kUO0Nn9rbudPL3Q8B
	 8bELd3ArMb9A0e8Pu2YoXWvLQDNd8H79lQXx6aNATqAr3YbUJpc/5bufvFxwRYcZGjGXz
	 tDPXye5aYFUPK8nm3TFaNJoKls1dvwovV9h4pdurIwG5cztCuoZ3w4GCM+dAASm7ouNnC
	 LYPX8mzfAorasn14RH5WuiRk9POkhVH+86LvAq8AZo8n+gVCI0BpTVMgXdOqbGEg8xTGz
	 HBCUni6kr5Tt8lCNkt1t4c4HoSaAbarbo0j2XgLqI0kuMakT51E/vHn80+w6nZR0uNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ERtCaBg3;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635DA606A31C;
	Fri, 27 Nov 2026 16:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ERtCaBg3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7DFF1575;
	Fri, 27 Nov 2026 08:53:42 -0800 (PST)
Received: from [10.0.129.128] (e122027.cambridge.arm.com [10.0.129.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F9D43F632;
	Fri, 27 Nov 2026 08:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795798425; bh=kE61tij3lKwCRxNXlUK+a8Xg+n3YF3HXcvIJXjVVL2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ERtCaBg3JRfaK2IUHWNlS38I4DsQ4EX7XHsdTnvExuWssFMcp6Dgr2YgLXZ9Gc3Q/
	 Y1UFXtwAG/Oe6O0KgEBFjW2HuHe7dh3G+jqMBuJKLcIRgZ3ddmLe16sE/d+aH2Ub5A
	 C5tBM99o6JclrHOsi0JmGFJBbF7yp1Y6r/IqbTaw=
Message-ID: <cb8d7520-ead2-446a-ac02-974024f59ec2@arm.com>
Date: Fri, 27 Nov 2026 16:53:39 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] drm/panthor: Pass drm_file instead of
 panthor_file
To: Ketil Johnsen <ketil.johnsen@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Akash Goel <akash.goel@arm.com>,
 Karunika Choo <karunika.choo@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Chris Diamand <chris.diamand@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20261116112601.3483649-1-ketil.johnsen@arm.com>
 <20261116112601.3483649-4-ketil.johnsen@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20261116112601.3483649-4-ketil.johnsen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/11/2026 11:25, Ketil Johnsen wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Some sched helpers need info that are part of drm_file, and we will
> soon need to call drm_gem_object_lookup() from panthor_group_create().
> Let's prepare for that by passing a drm_file instead of panthor_file to
> all current helpers taking a panthor_file, so we keep things consistent.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> 
> ---
> 
> v5:
> - Updated kernel doc
> 
> v4:
> - No change
> 
> v3:
> - Fixed incorrect parameter passed to panthor_gpu_show_fdinfo()
> 
> v2:
> - First introduction of this patch in this patch set
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   | 38 +++++++++++-------------
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 17 ++++++-----
>  drivers/gpu/drm/panthor/panthor_mmu.h   |  6 ++--
>  drivers/gpu/drm/panthor/panthor_sched.c | 39 +++++++++++++++----------
>  drivers/gpu/drm/panthor/panthor_sched.h | 23 +++++++--------
>  5 files changed, 63 insertions(+), 60 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index dc8d0191aef42..7edb8d329a705 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1106,7 +1106,6 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  static int panthor_ioctl_group_submit(struct drm_device *ddev, void *data,
>  				      struct drm_file *file)
>  {
> -	struct panthor_file *pfile = file->driver_priv;
>  	struct drm_panthor_group_submit *args = data;
>  	struct drm_panthor_queue_submit *jobs_args;
>  	struct panthor_submit_ctx ctx;
> @@ -1131,8 +1130,7 @@ static int panthor_ioctl_group_submit(struct drm_device *ddev, void *data,
>  		const struct drm_panthor_queue_submit *qsubmit = &jobs_args[i];
>  		struct drm_sched_job *job;
>  
> -		job = panthor_job_create(pfile, args->group_handle, qsubmit,
> -					 file->client_id);
> +		job = panthor_job_create(file, args->group_handle, qsubmit);
>  		if (IS_ERR(job)) {
>  			ret = PTR_ERR(job);
>  			goto out_cleanup_submit_ctx;
> @@ -1212,19 +1210,17 @@ static int panthor_ioctl_group_submit(struct drm_device *ddev, void *data,
>  static int panthor_ioctl_group_destroy(struct drm_device *ddev, void *data,
>  				       struct drm_file *file)
>  {
> -	struct panthor_file *pfile = file->driver_priv;
>  	struct drm_panthor_group_destroy *args = data;
>  
>  	if (args->pad)
>  		return -EINVAL;
>  
> -	return panthor_group_destroy(pfile, args->group_handle);
> +	return panthor_group_destroy(file, args->group_handle);
>  }
>  
>  static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
>  				      struct drm_file *file)
>  {
> -	struct panthor_file *pfile = file->driver_priv;
>  	struct drm_panthor_group_create *args = data;
>  	struct drm_panthor_queue_create *queue_args;
>  	int ret;
> @@ -1240,7 +1236,7 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
>  	if (ret)
>  		goto out;
>  
> -	ret = panthor_group_create(pfile, args, queue_args, file->client_id);
> +	ret = panthor_group_create(file, args, queue_args);
>  	if (ret < 0)
>  		goto out;
>  	args->group_handle = ret;
> @@ -1254,10 +1250,9 @@ static int panthor_ioctl_group_create(struct drm_device *ddev, void *data,
>  static int panthor_ioctl_group_get_state(struct drm_device *ddev, void *data,
>  					 struct drm_file *file)
>  {
> -	struct panthor_file *pfile = file->driver_priv;
>  	struct drm_panthor_group_get_state *args = data;
>  
> -	return panthor_group_get_state(pfile, args);
> +	return panthor_group_get_state(file, args);
>  }
>  
>  static int panthor_ioctl_tiler_heap_create(struct drm_device *ddev, void *data,
> @@ -1600,6 +1595,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  	if (!pfile)
>  		return -ENOMEM;
>  
> +	file->driver_priv = pfile;
>  	pfile->ptdev = ptdev;
>  	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
>  
> @@ -1614,19 +1610,18 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  #endif
>  
>  
> -	ret = panthor_vm_pool_create(pfile);
> +	ret = panthor_vm_pool_create(file);
>  	if (ret)
>  		goto err_free_file;
>  
> -	ret = panthor_group_pool_create(pfile);
> +	ret = panthor_group_pool_create(file);
>  	if (ret)
>  		goto err_destroy_vm_pool;
>  
> -	file->driver_priv = pfile;
>  	return 0;
>  
>  err_destroy_vm_pool:
> -	panthor_vm_pool_destroy(pfile);
> +	panthor_vm_pool_destroy(file);
>  
>  err_free_file:
>  	kfree(pfile);
> @@ -1638,8 +1633,8 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
>  {
>  	struct panthor_file *pfile = file->driver_priv;
>  
> -	panthor_group_pool_destroy(pfile);
> -	panthor_vm_pool_destroy(pfile);
> +	panthor_group_pool_destroy(file);
> +	panthor_vm_pool_destroy(file);
>  
>  	kfree(pfile);
>  }
> @@ -1699,11 +1694,13 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
>  }
>  
>  static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
> -				    struct panthor_file *pfile,
> +				    struct drm_file *file,
>  				    struct drm_printer *p)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
> +
>  	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_ALL)
> -		panthor_fdinfo_gather_group_samples(pfile);
> +		panthor_fdinfo_gather_group_samples(file);
>  
>  	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
>  #ifdef CONFIG_ARM_ARCH_TIMER
> @@ -1723,11 +1720,10 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
>  static void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)
>  {
>  	char *drv_name = file->minor->dev->driver->name;
> -	struct panthor_file *pfile = file->driver_priv;
>  	struct drm_memory_stats stats = {0};
>  
> -	panthor_fdinfo_gather_group_mem_info(pfile, &stats);
> -	panthor_vm_heaps_sizes(pfile, &stats);
> +	panthor_fdinfo_gather_group_mem_info(file, &stats);
> +	panthor_vm_heaps_sizes(file, &stats);
>  
>  	drm_fdinfo_print_size(p, drv_name, "resident", "memory", stats.resident);
>  	drm_fdinfo_print_size(p, drv_name, "active", "memory", stats.active);
> @@ -1738,7 +1734,7 @@ static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	struct drm_device *dev = file->minor->dev;
>  	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
>  
> -	panthor_gpu_show_fdinfo(ptdev, file->driver_priv, p);
> +	panthor_gpu_show_fdinfo(ptdev, file, p);
>  	panthor_show_internal_memory_stats(p, file);
>  
>  	drm_show_memory_stats(p, file);
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index d1c29eec46f21..838753db95151 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1676,15 +1676,16 @@ panthor_vm_pool_get_vm(struct panthor_vm_pool *pool, u32 handle)
>  
>  /**
>   * panthor_vm_pool_destroy() - Destroy a VM pool.
> - * @pfile: File.
> + * @file: DRM file.
>   *
>   * Destroy all VMs in the pool, and release the pool resources.
>   *
>   * Note that VMs can outlive the pool they were created from if other
>   * objects hold a reference to there VMs.
>   */
> -void panthor_vm_pool_destroy(struct panthor_file *pfile)
> +void panthor_vm_pool_destroy(struct drm_file *file)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_vm *vm;
>  	unsigned long i;
>  
> @@ -1702,12 +1703,13 @@ void panthor_vm_pool_destroy(struct panthor_file *pfile)
>  
>  /**
>   * panthor_vm_pool_create() - Create a VM pool
> - * @pfile: File.
> + * @file: DRM file.
>   *
>   * Return: 0 on success, a negative error code otherwise.
>   */
> -int panthor_vm_pool_create(struct panthor_file *pfile)
> +int panthor_vm_pool_create(struct drm_file *file)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_gem_object *dummy;
>  	int ret;
>  
> @@ -1728,7 +1730,7 @@ int panthor_vm_pool_create(struct panthor_file *pfile)
>  	return 0;
>  
>  err_destroy_vm_pool:
> -	panthor_vm_pool_destroy(pfile);
> +	panthor_vm_pool_destroy(file);
>  	return ret;
>  }
>  
> @@ -2141,14 +2143,15 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
>  /**
>   * panthor_vm_heaps_sizes() - Calculate size of all heap chunks across all
>   * heaps over all the heap pools in a VM
> - * @pfile: File.
> + * @file: DRM file.
>   * @stats: Memory stats to be updated.
>   *
>   * Calculate all heap chunk sizes in all heap pools bound to a VM. If the VM
>   * is active, record the size as active as well.
>   */
> -void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats)
> +void panthor_vm_heaps_sizes(struct drm_file *file, struct drm_memory_stats *stats)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_vm *vm;
>  	unsigned long i;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index abc36e7204be0..e262fe2303f6c 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -38,7 +38,7 @@ int panthor_vm_as(struct panthor_vm *vm);
>  struct panthor_heap_pool *
>  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);
>  
> -void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memory_stats *stats);
> +void panthor_vm_heaps_sizes(struct drm_file *file, struct drm_memory_stats *stats);
>  
>  struct panthor_vm *panthor_vm_get(struct panthor_vm *vm);
>  void panthor_vm_put(struct panthor_vm *vm);
> @@ -64,8 +64,8 @@ void panthor_vm_add_job_fence_to_bos_resvs(struct panthor_vm *vm,
>  struct dma_resv *panthor_vm_resv(struct panthor_vm *vm);
>  struct drm_gem_object *panthor_vm_root_gem(struct panthor_vm *vm);
>  
> -void panthor_vm_pool_destroy(struct panthor_file *pfile);
> -int panthor_vm_pool_create(struct panthor_file *pfile);
> +void panthor_vm_pool_destroy(struct drm_file *file);
> +int panthor_vm_pool_create(struct drm_file *file);
>  int panthor_vm_pool_create_vm(struct panthor_device *ptdev,
>  			      struct panthor_vm_pool *pool,
>  			      struct drm_panthor_vm_create *args);
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index d632fe1bf4db8..c75be18d24274 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3117,8 +3117,9 @@ void panthor_sched_post_reset(struct panthor_device *ptdev, bool reset_failed)
>  	}
>  }
>  
> -void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
> +void panthor_fdinfo_gather_group_samples(struct drm_file *file)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_group *group;
>  	unsigned long i;
> @@ -3654,11 +3655,11 @@ static void add_group_kbo_sizes(struct panthor_device *ptdev,
>  
>  #define MAX_GROUPS_PER_POOL		128
>  
> -int panthor_group_create(struct panthor_file *pfile,
> +int panthor_group_create(struct drm_file *file,
>  			 const struct drm_panthor_group_create *group_args,
> -			 const struct drm_panthor_queue_create *queue_args,
> -			 u64 drm_client_id)
> +			 const struct drm_panthor_queue_create *queue_args)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> @@ -3756,7 +3757,8 @@ int panthor_group_create(struct panthor_file *pfile,
>  		goto err_put_group;
>  
>  	for (i = 0; i < group_args->queues.count; i++) {
> -		group->queues[i] = group_create_queue(group, &queue_args[i], drm_client_id, gid, i);
> +		group->queues[i] = group_create_queue(group, &queue_args[i],
> +						      file->client_id, gid, i);
>  		if (IS_ERR(group->queues[i])) {
>  			ret = PTR_ERR(group->queues[i]);
>  			group->queues[i] = NULL;
> @@ -3796,8 +3798,9 @@ int panthor_group_create(struct panthor_file *pfile,
>  	return ret;
>  }
>  
> -int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle)
> +int panthor_group_destroy(struct drm_file *file, u32 group_handle)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> @@ -3848,9 +3851,10 @@ static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
>  	return group;
>  }
>  
> -int panthor_group_get_state(struct panthor_file *pfile,
> +int panthor_group_get_state(struct drm_file *file,
>  			    struct drm_panthor_group_get_state *get_state)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> @@ -3881,8 +3885,9 @@ int panthor_group_get_state(struct panthor_file *pfile,
>  	return 0;
>  }
>  
> -int panthor_group_pool_create(struct panthor_file *pfile)
> +int panthor_group_pool_create(struct drm_file *file)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_group_pool *gpool;
>  
>  	gpool = kzalloc_obj(*gpool);
> @@ -3894,8 +3899,9 @@ int panthor_group_pool_create(struct panthor_file *pfile)
>  	return 0;
>  }
>  
> -void panthor_group_pool_destroy(struct panthor_file *pfile)
> +void panthor_group_pool_destroy(struct drm_file *file)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_group *group;
>  	unsigned long i;
> @@ -3904,7 +3910,7 @@ void panthor_group_pool_destroy(struct panthor_file *pfile)
>  		return;
>  
>  	xa_for_each(&gpool->xa, i, group)
> -		panthor_group_destroy(pfile, i);
> +		panthor_group_destroy(file, i);
>  
>  	xa_destroy(&gpool->xa);
>  	kfree(gpool);
> @@ -3914,14 +3920,15 @@ void panthor_group_pool_destroy(struct panthor_file *pfile)
>  /**
>   * panthor_fdinfo_gather_group_mem_info() - Retrieve aggregate size of all private kernel BO's
>   * belonging to all the groups owned by an open Panthor file
> - * @pfile: File.
> + * @file: DRM file.
>   * @stats: Memory statistics to be updated.
>   *
>   */
>  void
> -panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
> +panthor_fdinfo_gather_group_mem_info(struct drm_file *file,
>  				     struct drm_memory_stats *stats)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_group *group;
>  	unsigned long i;
> @@ -3984,11 +3991,11 @@ struct panthor_vm *panthor_job_vm(struct drm_sched_job *sched_job)
>  }
>  
>  struct drm_sched_job *
> -panthor_job_create(struct panthor_file *pfile,
> +panthor_job_create(struct drm_file *file,
>  		   u16 group_handle,
> -		   const struct drm_panthor_queue_submit *qsubmit,
> -		   u64 drm_client_id)
> +		   const struct drm_panthor_queue_submit *qsubmit)
>  {
> +	struct panthor_file *pfile = file->driver_priv;
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_job *job;
>  	u32 credits;
> @@ -4059,7 +4066,7 @@ panthor_job_create(struct panthor_file *pfile,
>  
>  	ret = drm_sched_job_init(&job->base,
>  				 &job->group->queues[job->queue_idx]->entity,
> -				 credits, job->group, drm_client_id);
> +				 credits, job->group, file->client_id);
>  	if (ret)
>  		goto err_put_job;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> index d87cbdba4d40b..c509fcb5a0c9c 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -16,31 +16,28 @@ struct drm_panthor_queue_create;
>  struct drm_panthor_group_get_state;
>  struct drm_panthor_queue_submit;
>  struct panthor_device;
> -struct panthor_file;
>  struct panthor_group_pool;
>  struct panthor_job;
>  
> -int panthor_group_create(struct panthor_file *pfile,
> +int panthor_group_create(struct drm_file *file,
>  			 const struct drm_panthor_group_create *group_args,
> -			 const struct drm_panthor_queue_create *queue_args,
> -			 u64 drm_client_id);
> -int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle);
> -int panthor_group_get_state(struct panthor_file *pfile,
> +			 const struct drm_panthor_queue_create *queue_args);
> +int panthor_group_destroy(struct drm_file *file, u32 group_handle);
> +int panthor_group_get_state(struct drm_file *file,
>  			    struct drm_panthor_group_get_state *get_state);
>  
>  struct drm_sched_job *
> -panthor_job_create(struct panthor_file *pfile,
> +panthor_job_create(struct drm_file *file,
>  		   u16 group_handle,
> -		   const struct drm_panthor_queue_submit *qsubmit,
> -		   u64 drm_client_id);
> +		   const struct drm_panthor_queue_submit *qsubmit);
>  struct drm_sched_job *panthor_job_get(struct drm_sched_job *job);
>  struct panthor_vm *panthor_job_vm(struct drm_sched_job *sched_job);
>  void panthor_job_put(struct drm_sched_job *job);
>  void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *job);
>  
> -int panthor_group_pool_create(struct panthor_file *pfile);
> -void panthor_group_pool_destroy(struct panthor_file *pfile);
> -void panthor_fdinfo_gather_group_mem_info(struct panthor_file *pfile,
> +int panthor_group_pool_create(struct drm_file *file);
> +void panthor_group_pool_destroy(struct drm_file *file);
> +void panthor_fdinfo_gather_group_mem_info(struct drm_file *pfile,
>  					  struct drm_memory_stats *stats);
>  
>  int panthor_sched_init(struct panthor_device *ptdev);
> @@ -54,7 +51,7 @@ void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
>  void panthor_sched_prepare_for_vm_destruction(struct panthor_device *ptdev);
>  void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
>  
> -void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);
> +void panthor_fdinfo_gather_group_samples(struct drm_file *file);
>  
>  #ifdef CONFIG_DEBUG_FS
>  void panthor_sched_debugfs_init(struct drm_minor *minor);

