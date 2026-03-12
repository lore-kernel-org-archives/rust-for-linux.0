Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237653A7F7E
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773306430; cv=none; b=YMA17s13BsELkpNPGqO80qClq1cuwlPQ0fLz3AGb2RTBxoGUXMyAH08VgcaBw7k40UOmubnrdxrPsf9lU7vGWKfHsj3gtO75+RtpLJGy1Lr3DJzrPQm8F4HKkP5MGTs2FI1Fzl8Z0tVt+GGzLVmxSx2qh0POvUHA+cd7iIxn3OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773306430; c=relaxed/simple;
	bh=FxBCaalaWjs4jL9qj0sRvvmKhR8pByZkiFr2A2HVhM4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k/aiYFNXdYtK61PxKXLAj/SdYMR/X1rqVA7jLJ+pgXg+PukZ82JY5i6meHfLx7ZmAtpKhth/DRoV5qQfjru7lCU7ygdtIreeHmAVfANac/gSBSUEaQq9rXcv9hds6sh/uIscCYkelHqxmCmiQ0MOlaDfkhsRmCg4Qn6fkWpz60k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RroYhaMF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RroYhaMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773306427;
	bh=FxBCaalaWjs4jL9qj0sRvvmKhR8pByZkiFr2A2HVhM4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RroYhaMFj+LddXEmZuxFdX6yZOPewU+8nBGbI5hBfVgQMqt/pNDPNGHFSu6UqezM+
	 o0iwxFzR26ZWotm8RLJMXjKFqpiPGWrZ44Y+fr4YhlUeMduLZeDFQ5BcVlLeCqMVQK
	 BIoX8+LkllMH1hnenaAFNfVOuwSK/lhrOkwKstBrYq4OSlVF+4wi+igWb7zdNQnwE9
	 HoM95E1UUARlr4t8lAFGg38nx5XoNZcnCmPiLG5BqVMkq4OydXUajTQCiq6juKCPAZ
	 cj1qcWfO0a+miaTOzObi2doej955d0jGjNY/MzHDIgW6QY4f7O63VUf+YkLKeuhENY
	 DxNccBwCwrbkA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 628C017E12BA;
	Thu, 12 Mar 2026 10:07:06 +0100 (CET)
Date: Thu, 12 Mar 2026 10:07:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Danilo
 Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v2 2/5] drm/tyr: Set interconnect coherency during probe
Message-ID: <20260312100703.7984c5f1@fedora>
In-Reply-To: <20260311-b4-tyr-use-register-macro-v2-v2-2-b936d9eb8f51@collabora.com>
References: <20260311-b4-tyr-use-register-macro-v2-v2-0-b936d9eb8f51@collabora.com>
	<20260311-b4-tyr-use-register-macro-v2-v2-2-b936d9eb8f51@collabora.com>
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

On Wed, 11 Mar 2026 16:03:59 -0700
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Currently GpuInfo reports the interconnect coherency protocol as none
> without actually reading the `COHERENCY_ENABLE` register.
> 
> Although the result is the same, write `NO_COHERENCY` to the register
> during probe and then read back the register to populate the GpuInfo
> struct.
> 
> This ensures that GpuInfo is populated consistently and is always as
> accurate as possible by reporting the register values directly.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/gpu/drm/tyr/driver.rs | 6 ++++++
>  drivers/gpu/drm/tyr/gpu.rs    | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 10c212a3a01910858f02c6d637edff8a263f017b..b2147c305bacf081caf028866811b902cf7b9182 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -138,6 +138,12 @@ fn probe(
>          issue_soft_reset(pdev.as_ref(), &iomem)?;
>          gpu::l2_power_on(pdev.as_ref(), &iomem)?;
>  
> +        let io = (*iomem).access(pdev.as_ref())?;
> +        io.write_val(
> +            COHERENCY_ENABLE::zeroed()
> +                .with_const_l2_cache_protocol_select::<{ COHERENCY_ENABLE::NO_COHERENCY }>(),
> +        );

If we want to do it right from the start, we should do what Panthor
does: check if the device is IO coherent (device_get_dma_attr()), and
set the protocol based on that. Given device_get_dma_attr() is not
currently exposed by the rust Device abstraction, I guess we can force
it to NO_COHERENCY, but I'd add a

	// FIXME: This needs to be set properly once we get
	// device_get_dma_attr() properly exposed to the rust drivers.
	

> +
>          let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
>          gpu_info_log(pdev.as_ref(), &iomem)?;
>  
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 51a250570f375e12bb0f7fb32f047bf219ef9b70..9f572ccffd11a7ea1872a1e4e1c88f78fd6cad29 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -55,7 +55,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
>              // TODO: Add texture_features_{1,2,3}.
>              texture_features: [io.read(TEXTURE_FEATURES_0).into_raw(), 0, 0, 0],
>              as_present: io.read(AS_PRESENT).into_raw(),
> -            selected_coherency: uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE,
> +            selected_coherency: io.read(COHERENCY_ENABLE).into_raw(),
>              shader_present: io.read(SHADER_PRESENT).into_raw(),
>              l2_present: io.read(L2_PRESENT).into_raw(),
>              tiler_present: io.read(TILER_PRESENT).into_raw(),
> 

