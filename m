Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09222D7B5
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 00:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780361443; cv=pass; b=LbeOp42xcYPEW1b2LjndVPzeKjP4a2OxwAjcgCvOTqZW/JYQlIWgblnMzpBSqy3q5WSws9aNYsRLqdTFglZC/Tnk6CcbOtFzRkLukEg8bK+vZeBtDQr48t/rac1BjdGmB3yFbYQRRjaM7eAyd0BvkgGFVbtAlChdz7EaSUBtdzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780361443; c=relaxed/simple;
	bh=/hyL7cA7BF0OAY1sraYUXECDQh2b2FXONevPpQNIGsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+hQ8m6HWge5CJMk+Ap2TSRBexca6eFXdw6Ln3wLNnMGOgiq6vMVDGjCZ0FRTL/1lnKwxeYlZxmLoBCP6u6QHuXL0D+1b3uZwo4fH5U3MQ/GXZ9s2prUy/EsgTHF4LMFPM2Eph4kAB0t9Tz/9SJcLec3Cdx51HC4nbYAZ2KywpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=D06wfwne; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="D06wfwne"
ARC-Seal: i=1; a=rsa-sha256; t=1780361430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h+A++VxEQl5kUkKjeVa4HCqpoVfs4rhxctpaE50IweNTz0tZF6IJjc9d6p03t7+dDgp9yqCuBRQ/mT1PTXAzN5hNU5wAfowiwr+ierRAmb0UiW1oGW3hMxAlKeDAkANAiWoZUO57mhR/IWNlOOhucsNben4FRh4AfP6oXO3DUqY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780361430; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pjWJrIt/n9HMLOgYJ35uhL4BcEX9QAHXR+gnnQ/aClI=; 
	b=fezZsR0m8wyfU8Tp0qnnJFIPcQJ/+j8AaGDYLs467qPUaeQ/V+yLmNk57bi9/rfmqJRVBnBqpeNrnvFr0Uy67rGlh6fPVIIqnYKctSQzvnO8sBfHs8SR7uidAJWgSrZMWlzAPz1w53zkax0SEGvGlJDn149bWNjvZpgvK7KyW+A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780361430;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=pjWJrIt/n9HMLOgYJ35uhL4BcEX9QAHXR+gnnQ/aClI=;
	b=D06wfwne1Qo5sEH/0jivBkpEk+D0QOJgEAi9ABbTAq/VoUduUEDttQmBqCAqe+G8
	NIxM0ORuEJnsKxzHmv6ZiDUUa2Hm1iQjNw/3UDeV54zadaCkvW7c/6Fk6gQ6oTcILp4
	66yr3u3Rtjf11UFZkxWfBUUz+Dv94j9XUPD3UO5s=
Received: by mx.zohomail.com with SMTPS id 1780361427087837.5804531921661;
	Mon, 1 Jun 2026 17:50:27 -0700 (PDT)
Date: Mon, 1 Jun 2026 17:50:26 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, daniel.almeida@collabora.com,
	boris.brezillon@collabora.com, gary@garyguo.net,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	Eliot Courtney <ecourtney@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2 2/2] drm/tyr: use IoMem directly instead of Devres
Message-ID: <ah4o0tJKYoKULt1w@um790>
References: <20260529000106.2257996-1-dakr@kernel.org>
 <20260529000106.2257996-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529000106.2257996-3-dakr@kernel.org>

On Fri, May 29, 2026 at 02:00:54AM +0200, Danilo Krummrich wrote:
> Now that IoMem is lifetime-parameterized, use it directly in probe
> rather than wrapping it in Devres and Arc. The I/O memory mapping is
> only used during probe and not stored in driver data, so device-managed
> revocation is unnecessary.
> 
> This removes the Devres access(dev) pattern from issue_soft_reset(),
> GpuInfo::new(), and l2_power_on(), simplifying register access.
> 
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/drm/tyr/driver.rs | 19 ++++++-------------
>  drivers/gpu/drm/tyr/gpu.rs    | 17 +++++------------
>  2 files changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 6276e9743c32..227ea2adccea 100644
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
> +        let gpu_info = GpuInfo::new(&iomem);
>          gpu_info.log(pdev.as_ref());
>  
>          let pa_bits = MMU_FEATURES::from_raw(gpu_info.mmu_features)
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 652556026f50..592b8bb16eba 100644
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
> @@ -40,10 +39,8 @@
>  pub(crate) struct GpuInfo(pub(crate) uapi::drm_panthor_gpu_info);
>  
>  impl GpuInfo {
> -    pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
> -        let io = (*iomem).access(dev)?;
> -
> -        Ok(Self(uapi::drm_panthor_gpu_info {
> +    pub(crate) fn new(io: &IoMem<'_>) -> Self {
> +        Self(uapi::drm_panthor_gpu_info {
>              gpu_id: io.read(GPU_ID).into_raw(),
>              gpu_rev: io.read(REVIDR).into_raw(),
>              csf_id: io.read(CSF_ID).into_raw(),
> @@ -81,7 +78,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
>              pad: 0,
>              //GPU_FEATURES register is not available; it was introduced in arch 11.x.
>              gpu_features: 0,
> -        }))
> +        })
>      }
>  
>      pub(crate) fn log(&self, dev: &Device<Bound>) {
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

Looks good to me!

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>

