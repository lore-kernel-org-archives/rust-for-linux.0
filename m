Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF832EBB83
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891402; cv=none; b=m3fqeyTt+WyPevLvAD+yPs5eo8G6uJHnQRlQDrqwdqIZUVfOjR+6FGQh/d8mByV+HMFqqe7fU3q+OisQAywTRh2pniG22gV7O9eGakA2JsuxT8PjVlImbpLi7WN3bLGL9QTPNUBymGbs8BgfYIIPfAs55gwSx4Av554RZKLwuIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891402; c=relaxed/simple;
	bh=2eM/CKRs5f4Vpe8oURMPgU9mms6UR5PTLCJgmzoxUVo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pWARphc+mJH5YJdutPUuEsXg+m6asiKDShRB2ZaUI23iGpV38nXAFP8nmVGvgTS/NjV/Z/4mHiuKOUtKP3SNwypQau6mlaBk5zhMuzMijovdGdrDJQPdlypm44Nxm5TaIhyx+WiBFJho8q63z+LITua2s9EahChxwco6phoyo5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X6wYQV6p; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X6wYQV6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770891399;
	bh=2eM/CKRs5f4Vpe8oURMPgU9mms6UR5PTLCJgmzoxUVo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X6wYQV6pJjeFhd9Lwg+y2WGYiV5ICcJ2/JhavwsL6uqoorwHIlDavIQNvnrpEc5Fe
	 vWtadjZJGBA5WVXUy2CqJslWPkCHanM7qn6qWH5TVKVaigRawdrRwc/jpLz46SoUfD
	 /Rt+X5u0oq5Og1j+AKUHFfFgFprr0rPXUE+XXsRFQl+riY3vob6tR7g40sn1yNd0MD
	 2h+IvzMR5WLyvcW5+pO+IkkmXiuSiihDj50KW3wFNZTL80UhXiL72xh8yVbmgxQOAN
	 KTHtXkX6a4BUjRCPBHnsE/lXVe3wCS5GV7CE+8Ky/86P3S2zvKQITwhDDvuUO4FjK4
	 KuQEiX/r8JkJg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E6C1417E127F;
	Thu, 12 Feb 2026 11:16:38 +0100 (CET)
Date: Thu, 12 Feb 2026 11:16:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 04/12] drm/tyr: set DMA mask using GPU physical address
Message-ID: <20260212111633.77755caf@fedora>
In-Reply-To: <20260212013713.304343-5-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
	<20260212013713.304343-5-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Feb 2026 17:37:05 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> From: Beata Michalska <beata.michalska@arm.com>
> 
> Configure the device DMA mask during probe using the GPU's physical
> address capability reported in GpuInfo. This ensures DMA allocations
> use an appropriate address mask.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/driver.rs | 11 +++++++++++
>  drivers/gpu/drm/tyr/gpu.rs    |  1 -
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index e5eae5a73371..2973a8b3cc09 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -11,6 +11,10 @@
>          Device, //
>      },
>      devres::Devres,
> +    dma::{
> +        Device as DmaDevice,
> +        DmaMask, //
> +    },
>      drm,
>      drm::{
>          driver::Registration,
> @@ -134,6 +138,13 @@ fn probe(
>          let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
>          gpu_info.log(pdev);
>  
> +        // SAFETY: No concurrent DMA allocations or mappings can be made because
> +        // the device is still being probed and therefore isn't being used by
> +        // other threads of execution.
> +        unsafe {
> +            pdev.dma_set_mask_and_coherent(DmaMask::try_new(gpu_info.pa_bits())?)?;
> +        }
> +
>          let uninit_ddev = UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
>          let platform: ARef<platform::Device> = pdev.into();
>  
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index affca5b0dc6c..b5f11bc96fa0 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -141,7 +141,6 @@ pub(crate) fn va_bits(&self) -> u32 {
>      }
>  
>      /// Returns the number of physical address bits supported by the GPU.
> -    #[expect(dead_code)]
>      pub(crate) fn pa_bits(&self) -> u32 {
>          (self.mmu_features >> 8) & genmask_u32(0..=7)
>      }

