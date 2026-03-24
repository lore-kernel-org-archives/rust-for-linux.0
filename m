Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554903DB63E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 09:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346136; cv=none; b=eymEGK1sy8RnAu+EZgpme7KE/fRUox7l5bxeWJjGArlGbf74sI+P5gjdFARIj/v+fX+m201LsTuffiU9y9l+TAO24/g3bXbXnoc/2LOkwSpDQclRFdUE2kk5hpXYwwPq/8GBG58g+2vmZRhIGLtbnMFEa0iRoEAbdKH40GHOTBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346136; c=relaxed/simple;
	bh=tnrLvArGzRZzy5aK1JFU5crmecE4BzC8HL11nAYoeek=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eQCltCzNcqs3vY7VQGJ2fSATATTE+/RUkMtdLZEFMdHSVCDVysPASWwlCPZ87mNXO47etcB71uv6PtUu36DIl/ZQ9zSlzAHgVVd2LLHlsXKGMfriWkvYy04Z41YUwYIONWlTO7pqYZnbkf38j41ZCLUw/3WPFA7Dl8Sf3XA7F1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n1iIzZiC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n1iIzZiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774346133;
	bh=tnrLvArGzRZzy5aK1JFU5crmecE4BzC8HL11nAYoeek=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n1iIzZiCeQaEIHV9LXid9Zc+tG8TD8wRQjJtqNPYsCLW7W3UTVb4iTH6Hbg2kmIbl
	 WesshralHDISjw1JtT+9aZlgttWVBKgvsUC2U8lR6pVxsybmkeI97PUlc83kBS4Eog
	 KyYb/6FCH2oiULQ79xNUcK9b/WQZusGOlpj10LxWtLU/N1kGF9iVH43QFV3xNtsnZU
	 04o0nbFkbyGX6Atrr/atrbtBi4+SFsePJq4spHC3jNyhZuU46Wja/v0Anedkawz1dP
	 E6tdjBWEuF8MyUm2fjjGDFSbpu6vqlTIf8WxtGh3rfADb29rYaIhx//0Hx/KzjFZWk
	 QKS8SO+mRCQ2Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F0F6E17E59B7;
	Tue, 24 Mar 2026 10:55:32 +0100 (CET)
Date: Tue, 24 Mar 2026 10:55:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Boqun
 Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 03/12] drm/tyr: Set interconnect coherency during
 probe
Message-ID: <20260324105529.09d4d214@fedora>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-3-a87daf9e4701@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
	<20260323-b4-tyr-use-register-macro-v3-v3-3-a87daf9e4701@collabora.com>
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

On Mon, 23 Mar 2026 17:18:05 -0700
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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/driver.rs | 5 +++++
>  drivers/gpu/drm/tyr/gpu.rs    | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 3ebb5e08bfca342f136e8d365b1d9dcb6cc3dbca..7232d9f9547c239689dc424380109a4e5140dd84 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -136,6 +136,11 @@ fn probe(
>          issue_soft_reset(pdev.as_ref(), &iomem)?;
>          gpu::l2_power_on(pdev.as_ref(), &iomem)?;
>  
> +        let io = (*iomem).access(pdev.as_ref())?;
> +        // FIXME: This needs to be set properly once we get
> +        // device_get_dma_attr() properly exposed to the rust drivers.
> +        io.write_reg(COHERENCY_ENABLE::zeroed().with_l2_cache_protocol_select(CoherencyMode::None));
> +
>          let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
>          gpu_info_log(pdev.as_ref(), &iomem)?;
>  
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 4a50055b415c693a89cb99dba241b21351a14149..d5240f4567ca4e763b09e015908bdc5c22276e0d 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -60,7 +60,7 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
>                  io.read(TEXTURE_FEATURES::at(3)).supported_formats().get(),
>              ],
>              as_present: io.read(AS_PRESENT).into_raw(),
> -            selected_coherency: uapi::drm_panthor_gpu_coherency_DRM_PANTHOR_GPU_COHERENCY_NONE,
> +            selected_coherency: io.read(COHERENCY_ENABLE).into_raw(),
>              shader_present: io.read(SHADER_PRESENT).into_raw(),
>              l2_present: io.read(L2_PRESENT).into_raw(),
>              tiler_present: io.read(TILER_PRESENT).into_raw(),
> 

