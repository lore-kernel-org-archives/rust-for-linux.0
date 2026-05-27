Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B930BF67
	for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 22:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779922628; cv=pass; b=K0dVTbjnpHTVqdjieHd2z3gjHnWzKRVaq5f/I4CDPi9JOY7QSf1K5YRvOOz4P9t6cOhb1AMjWUVjpxRPsVn2hX1te3+jUsorvppi2m1YDPj5N6T2qREbpTCWDETIkY8rByQI+ZNXSgdpoX3tW+tYs0Fqbiz9C2UGmwHWcooEpZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779922628; c=relaxed/simple;
	bh=fjOBwH7XU0NKuRvF+t1+ZV98YYQEyHloipA9SBFSAt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTHrLHfsGRT6sLrNzE2B1oT8GhPeObtIEkJrTp5sDrJWC14JU+g8k70FAfc8AK+iVgVIG2tA1UMg+T1ixZvCzBRkrht9iiYbA4jjvFv9BNGWPQuTEd0+FHV4r/6Xb12vhTwzPR8hjzTkRWi+LIzxg5joyeWp00pA3+NLMxwyBF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=DGMsfMgj; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="DGMsfMgj"
ARC-Seal: i=1; a=rsa-sha256; t=1779922618; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JHkQWSmB/wFsYENRrekJYu6xMDD0SWh8nyJk/iIyWewy1dyzzrlF2eJvWdp5K1jtQeQzZag95aunnKDciHcR4C/Q4JuBk9z0WP1MAbHxUrk90WbJajgSoj4h+2VasH6WylTNzpA3ctDQUJcI9DtLWDsqcPTna7b1pkz3jf8B9OQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779922618; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Exu4e0hj+t/SjnQsVBb0HuBRRQZlBHZC5PARo8jlOJI=; 
	b=PwtjgyEH0gW+N7gRIZFZD7fscTy/wy2V1owPB+wekqlsvRsqAakkB0HDS2r59Cx7dmdaKlNnlnAIt5cejKRRx49VI06yNXJSOllbkQjip7JDu7qLQEx47Bfu0kmtPaGS0neyZKtI/R0JBQ18TZsOmjp71xA9zOkCfb5v8L8Wg3U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779922618;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Exu4e0hj+t/SjnQsVBb0HuBRRQZlBHZC5PARo8jlOJI=;
	b=DGMsfMgjrhg9jr3hL7cZlFNfK03Xc0j351CLW/8uAFQunc7Ngt4VdIFaSEs+37YD
	eETa3oI9GYIF9H1U00xyyco67IW6/sq0IhS2wPNQRivn4torn7se2oVYqhpdXbuMreM
	n3ewTQu39ojk7BhiHIcRGoV0JOw0sxTX/o8tbZiQ=
Received: by mx.zohomail.com with SMTPS id 1779922615627710.289019625184;
	Wed, 27 May 2026 15:56:55 -0700 (PDT)
Date: Wed, 27 May 2026 15:56:55 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, daniel.almeida@collabora.com,
	boris.brezillon@collabora.com, gary@garyguo.net,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] gpu: drm: tyr: use IoMem directly instead of Devres
Message-ID: <ahd2t_aHA5hk9xml@um790>
References: <20260525230152.277820-1-dakr@kernel.org>
 <20260525230152.277820-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525230152.277820-3-dakr@kernel.org>

On Tue, May 26, 2026 at 01:01:44AM +0200, Danilo Krummrich wrote:
> Now that IoMem is lifetime-parameterized, use it directly in probe
> rather than wrapping it in Devres and Arc. The I/O memory mapping is
> only used during probe and not stored in driver data, so device-managed
> revocation is unnecessary.
> 
> This removes the Devres access(dev) pattern from issue_soft_reset(),
> GpuInfo::new(), and l2_power_on(), simplifying register access.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/drm/tyr/driver.rs | 19 ++++++-------------
>  drivers/gpu/drm/tyr/gpu.rs    | 13 +++----------
>  2 files changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 5f4c484f671f..b9a5cc5fc678 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -6,11 +6,9 @@
>          OptionalClk, //
>      },
>      device::{
> -        Bound,
>          Core,
>          Device, //
>      },
> -    devres::Devres,
>      dma::{
>          Device as DmaDevice,
>          DmaMask, //
> @@ -30,7 +28,6 @@
>      sizes::SZ_2M,
>      sync::{
>          aref::ARef,
> -        Arc,
>          Mutex, //
>      },
>      time, //
> @@ -44,7 +41,7 @@
>      regs::gpu_control::*, //
>  };
>  
> -pub(crate) type IoMem = kernel::io::mem::IoMem<'static, SZ_2M>;
> +pub(crate) type IoMem<'a> = kernel::io::mem::IoMem<'a, SZ_2M>;
>  
>  pub(crate) struct TyrDrmDriver;
>  
> @@ -74,15 +71,11 @@ pub(crate) struct TyrDrmDeviceData {
>      pub(crate) gpu_info: GpuInfo,
>  }
>  
> -fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
> -    let io = (*iomem).access(dev)?;
> -    io.write_reg(GPU_COMMAND::reset(ResetMode::SoftReset));
> +fn issue_soft_reset(dev: &Device, iomem: &IoMem<'_>) -> Result {
> +    iomem.write_reg(GPU_COMMAND::reset(ResetMode::SoftReset));
>  
>      poll::read_poll_timeout(
> -        || {
> -            let io = (*iomem).access(dev)?;
> -            Ok(io.read(GPU_IRQ_RAWSTAT))
> -        },
> +        || Ok(iomem.read(GPU_IRQ_RAWSTAT)),
>          |status| status.reset_completed(),
>          time::Delta::from_millis(1),
>          time::Delta::from_millis(100),
> @@ -123,12 +116,12 @@ fn probe<'bound>(
>          let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
>  
>          let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
> -        let iomem = Arc::new(request.iomap_sized::<SZ_2M>()?.into_devres()?, GFP_KERNEL)?;
> +        let iomem = request.iomap_sized::<SZ_2M>()?;
>  
>          issue_soft_reset(pdev.as_ref(), &iomem)?;
>          gpu::l2_power_on(pdev.as_ref(), &iomem)?;
>  
> -        let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
> +        let gpu_info = GpuInfo::new(&iomem)?;
>          gpu_info.log(pdev.as_ref());
>  
>          let pa_bits = MMU_FEATURES::from_raw(gpu_info.mmu_features)
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 652556026f50..3acffefaf210 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -9,7 +9,6 @@
>          Bound,
>          Device, //
>      },
> -    devres::Devres,
>      io::{
>          poll,
>          register::Array,
> @@ -40,9 +39,7 @@
>  pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);
>  
>  impl GpuInfo {
> -    pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
> -        let io = (*iomem).access(dev)?;
> -
> +    pub(crate) fn new(io: &IoMem<'_>) -> Result<Self> {
>          Ok(Self(uapi::drm_panthor_gpu_info {
>              gpu_id: io.read(GPU_ID).into_raw(),
>              gpu_rev: io.read(REVIDR).into_raw(),
> @@ -163,15 +160,11 @@ struct GpuModels {
>  }];
>  
>  /// Powers on the l2 block.
> -pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
> -    let io = (*iomem).access(dev)?;
> +pub(crate) fn l2_power_on(dev: &Device, io: &IoMem<'_>) -> Result {
>      io.write_reg(L2_PWRON_LO::zeroed().with_const_request::<1>());
>  
>      poll::read_poll_timeout(
> -        || {
> -            let io = (*iomem).access(dev)?;
> -            Ok(io.read(L2_READY_LO))
> -        },
> +        || Ok(io.read(L2_READY_LO)),
>          |status| status.ready() == 1,
>          Delta::from_millis(1),
>          Delta::from_millis(100),
> -- 
> 2.54.0
> 

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>

