Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305044;
	b=izst3ZoNzCdFUWaXMqP8ooLFFdpckJfDWWtPwTNJqtmji/9AgXcit5SzlE7JHuCHw/Yd
	 1//4LJpH5pK+ur+LBklXUEYxEEevUMItKjazNzW6wy2SwsqaLrJecv1PBY3BUFLTwFr+1
	 u3d/Zdf79yKqYsSsrmyWOMNvwZNIdIUTflZAbYYygERtPGmzunXahvSlRgr7WRIjnbM/o
	 CAJX4tVyZmp2W+Hz/TfHu8WxCS6ZxGLmnHrzDr3KfZJbtV5/Rsl/n5GAPlUIE3FN73oSH
	 IBH1YCzV8NRiwfJQHd/WygtR0a2TwNVYtSuC8zrq6l+VQMnzVZhzFRbYMELRufvJBSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305044;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=5v0nfMk4rBodRMogcp330VoEDCSVbK9/ewM4ci8K6Js=;
	b=yLLCgY8/4f5xikUCfGjzPHavnhUG5O72VfRqIJ4IghhJ03BVVE0nrzd4dm6qI2ZeQ7L4
	 SxfMc4rfpkbeq7ToRknB6QIeH2cFtGoblow4WnvgDy/EvWFZnAwkLh6QRnBjWNp5oekad
	 pqJ7RqTY+IhdxEPSQRf1uFEIu8pyInvqfeYNu5wHeB5m/BRelxuGs9c22q/O3WKu3qEwY
	 MYCT7ioGdtvhhxz8pUue2O2JFb6j+SsMVubv826bfGYrTfUJUxdbBt9nxP336KyRksCcn
	 1rqKMqcKeZfc/8h28iu5MPkSZNSRZnlHvoOoJ6dQTT7EqqTWY0cS7FQ7j5njR3W0HCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tvw01Pb7;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7781606A32A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 10:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7781606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tvw01Pb7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A54D1F02
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 02:04:00 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E8F4D3F85F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 02:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794305043; bh=u5FOKVXPwtEHvG/wCtI/T33KcnjC+imee3/ObiHKJ8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvw01Pb7xwfpb0XvK+vtkoovhcBHJe7XBi7IAFnQD0WsYVOyLi6kH4H+1Uloi6Gmf
	 DShULHoeOEo3k4SsxpLpd7/pzIpq6HSC4F1ThSXVdIknq/6Ajw+QJemrN54MazNERb
	 +zUeksOnKTXDYYySkGpEjLEAGZb3c0BOstxGoGn4=
Date: Tue, 10 Nov 2026 10:03:46 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gary.yang@cixtech.com,
	fugang.duan@cixtech.com, daniel.almeida@collabora.com,
	aliceryhl@google.com, p.zabel@pengutronix.de,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com
Subject: Re: [PATCH v2 2/3] drm/panthor: Add initial support for CIX Sky1
Message-ID: <avLsAlL048MtIX4x@e142607>
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
 <20261109120902.125242-3-cunyuan.liu@cixtech.com>
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
In-Reply-To: <20261109120902.125242-3-cunyuan.liu@cixtech.com>

Hi Cunyuan,

On Mon, Nov 09, 2026 at 08:09:00PM +0800, Cunyuan Liu wrote:
> Add Sky1 SoC data for system-level cache settings and to skip devfreq.
> 
> The GPU on CIX Sky1 needs an external reset before the driver first
> accesses the hardware. Without this reset, the GPU hardware cannot be
> accessed correctly. Acquire an optional exclusive reset for all platforms
> and apply it after enabling the clocks during initial probe. Platforms
> without a reset keep working through the reset framework NULL handling.

Adding support for an external reset should be separate from the enablement
of Sky1 GPU.

> 
> Configure SYSC_ALLOC before L2 power-on. Without these settings, GPU
> rendering results are displayed incorrectly.

Adding support for SYSC_ALLOC should be a separate patch. It can be used
by other SoCs as well, not just Sky1. 

> 
> Keep the clock settings provided by the PM firmware. This first version
> does not read OPPs or enable devfreq. It does not register a GPU cooling
> device.

This looks like a stop gap measure. What is your plan here? When do you
think you might be able to provide OPP and devfreq support and what is
the hold up?

> 
> Tested on Orion O6: offscreen pixel readback, kmscube, glmark2 at 1080p,
> runtime suspend and resume with a retained EGL context, software-triggered
> reset-worker tests, and module unload and reload. Display tests used
> local Komeda support.
> 
> Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c  | 11 ++++++++++-
>  drivers/gpu/drm/panthor/panthor_device.c   | 13 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h   | 19 +++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c      | 14 ++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gpu.c      | 14 ++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gpu_regs.h |  2 ++
>  6 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 2249b41ca4af..1914549f7b1f 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -154,6 +154,12 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  
>  	ptdev->devfreq = pdevfreq;
>  
> +	/* Keep the firmware clock settings until Sky1 devfreq is supported. */
> +	if (ptdev->soc_data && ptdev->soc_data->skip_devfreq) {
> +		ptdev->fast_rate = clk_get_rate(ptdev->clks.core);
> +		return 0;
> +	}

This should not be in the driver. If you want to have a fixed frequency just use a fixed
clock provider, or make the clock provider query the firmware for the value.

> +
>  	/*
>  	 * The power domain associated with the GPU may have already added an
>  	 * OPP table, complete with OPPs, as part of the platform bus
> @@ -323,8 +329,11 @@ unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
>  	unsigned long freq = 0;
>  	int ret;
>  
> -	if (!pdevfreq->devfreq)
> +	if (!pdevfreq->devfreq) {
> +		if (ptdev->soc_data && ptdev->soc_data->skip_devfreq)
> +			return clk_get_rate(ptdev->clks.core);
>  		return 0;
> +	}
>  
>  	ret = pdevfreq->devfreq->profile->get_cur_freq(ptdev->base.dev, &freq);
>  	if (ret)
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 9687c59de350..a3a32abec5f7 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -229,6 +229,11 @@ int panthor_device_init(struct panthor_device *ptdev)
>  		return ret;
>  	}
>  
> +	ptdev->reset_control = devm_reset_control_get_optional_exclusive(ptdev->base.dev, NULL);
> +	if (IS_ERR(ptdev->reset_control))
> +		return dev_err_probe(ptdev->base.dev, PTR_ERR(ptdev->reset_control),
> +				     "Failed to get GPU reset\n");
> +
>  	ret = panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;
> @@ -511,6 +516,12 @@ int panthor_device_resume(struct device *dev)
>  	if (ret)
>  		goto err_disable_stacks_clk;
>  
> +	if (!panthor_device_is_initialized(ptdev)) {
> +		ret = reset_control_reset(ptdev->reset_control);
> +		if (ret)
> +			goto err_disable_coregroup_clk;
> +	}
> +
>  	panthor_devfreq_resume(ptdev);
>  
>  	if (panthor_device_is_initialized(ptdev) &&
> @@ -553,6 +564,8 @@ int panthor_device_resume(struct device *dev)
>  
>  err_suspend_devfreq:
>  	panthor_devfreq_suspend(ptdev);
> +
> +err_disable_coregroup_clk:
>  	clk_disable_unprepare(ptdev->clks.coregroup);
>  
>  err_disable_stacks_clk:
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index b55a3f9edd41..afb4167bd364 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -19,6 +19,8 @@
>  #include <drm/gpu_scheduler.h>
>  #include <drm/panthor_drm.h>
>  
> +struct reset_control;
> +
>  struct panthor_csf;
>  struct panthor_csf_ctx;
>  struct panthor_device;
> @@ -34,10 +36,24 @@ struct panthor_pwr;
>  struct panthor_vm;
>  struct panthor_vm_pool;
>  
> +/**
> + * struct panthor_sysc_config - GPU system-cache configuration
> + */
> +struct panthor_sysc_config {
> +	/** @alloc: System-cache allocation policies for GPU access types. */
> +	u32 alloc[8];
> +};
> +
>  /**
>   * struct panthor_soc_data - Panthor SoC Data
>   */
>  struct panthor_soc_data {
> +	/** @skip_devfreq: Keep the firmware clock settings without devfreq. */
> +	bool skip_devfreq;
> +
> +	/** @sysc_config: System-cache configuration, or NULL to keep defaults. */
> +	const struct panthor_sysc_config *sysc_config;
> +
>  	/** @asn_hash_enable: True if GPU_L2_CONFIG_ASN_HASH_ENABLE must be set. */
>  	bool asn_hash_enable;
>  
> @@ -138,6 +154,9 @@ struct panthor_device {
>  	/** @soc_data: Optional SoC data. */
>  	const struct panthor_soc_data *soc_data;
>  
> +	/** @reset_control: Optional external GPU reset. */
> +	struct reset_control *reset_control;
> +
>  	/** @phys_addr: Physical address of the iomem region. */
>  	phys_addr_t phys_addr;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index dc8d0191aef4..4d7b1230cd7b 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1872,12 +1872,26 @@ static struct attribute *panthor_attrs[] = {
>  
>  ATTRIBUTE_GROUPS(panthor);
>  
> +static const struct panthor_sysc_config sysc_config_cix_sky1 = {
> +	/* Sky1 needs these SYSC_ALLOC policies for correct display of GPU output. */
> +	.alloc = {
> +		0x00230000, 0x00000023, 0x00000000, 0x00000000,
> +		0x00523222, 0x00523200, 0x00000022, 0x00000032,
> +	},
> +};

These should not be in the driver but in the device tree bindings. If you extract
the system cache code into a separate patch we can have a proper discussion there.

> +
> +static const struct panthor_soc_data soc_data_cix_sky1 = {
> +	.skip_devfreq = true,
> +	.sysc_config = &sysc_config_cix_sky1,
> +};
> +
>  static const struct panthor_soc_data soc_data_mediatek_mt8196 = {
>  	.asn_hash_enable = true,
>  	.asn_hash = { 0xb, 0xe, 0x0, },
>  };
>  
>  static const struct of_device_id dt_match[] = {
> +	{ .compatible = "cix,sky1-mali", .data = &soc_data_cix_sky1 },
>  	{ .compatible = "mediatek,mt8196-mali", .data = &soc_data_mediatek_mt8196, },
>  	{ .compatible = "rockchip,rk3588-mali" },
>  	{ .compatible = "arm,mali-valhall-csf" },
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index a383b04f101e..9a6963fe62ae 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -63,6 +63,19 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
>  		  ptdev->gpu_info.selected_coherency);
>  }
>  
> +static void panthor_gpu_sysc_config_set(struct panthor_device *ptdev)
> +{
> +	const struct panthor_sysc_config *config;
> +	unsigned int i;
> +
> +	if (!ptdev->soc_data || !ptdev->soc_data->sysc_config)
> +		return;
> +
> +	config = ptdev->soc_data->sysc_config;
> +	for (i = 0; i < ARRAY_SIZE(config->alloc); i++)
> +		gpu_write(ptdev->gpu->iomem, GPU_SYSC_ALLOC(i), config->alloc[i]);

This will crash for arch10 GPUs. I know that you're relying here on soc_data not having
the fields filled in, but if we move the sysc_config data to being provided by DT, we
need to check here.

> +}
> +
>  static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
>  {
>  	struct panthor_gpu *gpu = ptdev->gpu;
> @@ -317,6 +330,7 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
>  	}
>  
>  	/* Set the desired coherency mode and L2 config before the power up of L2 */
> +	panthor_gpu_sysc_config_set(ptdev);
>  	panthor_gpu_coherency_set(ptdev);
>  	panthor_gpu_l2_config_set(ptdev);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu_regs.h b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> index 4c5b953796e4..f9b65a4dae83 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
> @@ -116,4 +116,6 @@
>  #define   GPU_COHERENCY_ACE				1
>  #define   GPU_COHERENCY_NONE				31
>  
> +#define GPU_SYSC_ALLOC(n)				(0x340 + (n) * 4)
> +
>  #endif /* __PANTHOR_GPU_REGS_H__ */
> -- 
> 2.53.0
> 

Best regards,
Liviu


-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
