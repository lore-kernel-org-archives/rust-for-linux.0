Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94FC367F59;
	Wed, 11 Feb 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805724; cv=none; b=Gx5bVJQmUsWwo07RlUwcQTtvAR61HXWyfVBx0Ote5c6EUBf07vPTB5kOf44qzqjES/7UzkhMP3Qy73siniUpmvOkFEuTwYHreUvtuTwYehHpqpjnJE7X7EjHHlHctp2Ok57eaeGGCGSp6PCQNPDxVXextxZpbtmeU0bx9tBDFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805724; c=relaxed/simple;
	bh=vs+SUfnNTDDq40YnvycZi17YVfWDsZv9ecA5HvwyLV0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Un0kC334dKkU9FvEcgwKv6e0raj5DLQMQEWCunl7UfojtGVP2AvqWa0+Pte0WSxQmSLch5Z372gfQeaHtZa2PO+B30azMz9oSRbaDuUY//qok5y6vEAM9tt5DjgFfKoKPxJN4SH4w6NSoArqS1lefd/stTRIOi2I04TJx09xeWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFK2TyZv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFK2TyZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3D8C4CEF7;
	Wed, 11 Feb 2026 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770805723;
	bh=vs+SUfnNTDDq40YnvycZi17YVfWDsZv9ecA5HvwyLV0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=WFK2TyZvVioU3r2uFFo3og/5ZCE4MhjBlmxP514OxL4hjUi7VqbRk7G14mtLB+19p
	 2c89rJHot4fCH+tDaeHXO2nU+dRclJ7b+LJi2IuyOYooeYsHriq1cuBwPgMeRDM0qk
	 1GvAXvASCwyiYqIWIXUXid2XkwQ790z2b7WahkeCGgjAjK6cAmQozhSEHBR4PDt5iy
	 3dB0kCgHtw2NCCqlwHwCqjZW+VSJsTBijD5X0UUAJnrqp+QGC2wcDsszYNo6JJdSk5
	 aS0J/W4tykH/DRVprnYygSyBuRGh38/yi1R2u/H91rWwJmu2VnM3LF8BR0jMyAXT6t
	 UU5Hb6LGWLwBg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:28:37 +0100
Message-Id: <DGC28K8J39E2.1X173NHT9ZJDI@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 08/33] gpu: nova-core: set DMA mask width based on
 GPU architecture
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-9-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-9-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> This removes a "TODO" item in the code, which was hardcoded to work on
> Ampere and Ada GPUs. Hopper/Blackwell+ have a larger width, so do an
> early read of boot42, in order to pick the correct value.
>
> Cc: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 33 ++++++++++++++--------------
>  drivers/gpu/nova-core/gpu.rs    | 38 ++++++++++++++++++++++++---------
>  2 files changed, 44 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index e39885c0d5ca..4ff07b643db6 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -5,7 +5,6 @@
>      device::Core,
>      devres::Devres,
>      dma::Device,
> -    dma::DmaMask,
>      pci,
>      pci::{
>          Class,
> @@ -17,7 +16,10 @@
>      sync::Arc, //
>  };
> =20
> -use crate::gpu::Gpu;
> +use crate::gpu::{
> +    Gpu,
> +    Spec, //
> +};
> =20
>  #[pin_data]
>  pub(crate) struct NovaCore {
> @@ -29,14 +31,6 @@ pub(crate) struct NovaCore {
> =20
>  const BAR0_SIZE: usize =3D SZ_16M;
> =20
> -// For now we only support Ampere which can use up to 47-bit DMA address=
es.
> -//
> -// TODO: Add an abstraction for this to support newer GPUs which may sup=
port
> -// larger DMA addresses. Limiting these GPUs to smaller address widths w=
on't
> -// have any adverse affects, unless installed on systems which require l=
arger
> -// DMA addresses. These systems should be quite rare.
> -const GPU_DMA_BITS: u32 =3D 47;
> -
>  pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
> =20
>  kernel::pci_device_table!(
> @@ -75,18 +69,23 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdIn=
fo) -> impl PinInit<Self, E
>              pdev.enable_device_mem()?;
>              pdev.set_master();
> =20
> -            // SAFETY: No concurrent DMA allocations or mappings can be =
made because
> -            // the device is still being probed and therefore isn't bein=
g used by
> -            // other threads of execution.
> -            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_D=
MA_BITS>())? };
> -
> -            let bar =3D Arc::pin_init(

Spurious rename.

> +            let devres_bar =3D Arc::pin_init(
>                  pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0=
"),
>                  GFP_KERNEL,
>              )?;
> =20
> +            // Read the GPU spec early to determine the correct DMA addr=
ess width.

Hm.. we should move the dma_set_mask_and_coherent() call into Gpu::new(), s=
o all
GPU specific initialization remains in the constructor of Gpu.

> +            // Hopper/Blackwell+ support 52-bit DMA addresses, earlier a=
rchitectures use 47-bit.

I'd move this down to the dma_set_mask_and_coherent() call, or maybe just r=
emove
it as well, since we have the very same comment for Architecture::dma_mask(=
).

> +            let spec =3D Spec::new(pdev.as_ref(), devres_bar.access(pdev=
.as_ref())?)?;
> +            dev_info!(pdev.as_ref(), "NVIDIA ({})\n", spec);

This re-introduces pdev.as_ref().

> +
> +            // SAFETY: No concurrent DMA allocations or mappings can be =
made because
> +            // the device is still being probed and therefore isn't bein=
g used by
> +            // other threads of execution.
> +            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch(=
).dma_mask())? };
> +
>              Ok(try_pin_init!(Self {
> -                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_re=
f())?),
> +                gpu <- Gpu::new(pdev, devres_bar.clone(), devres_bar.acc=
ess(pdev.as_ref())?, spec),
>                  _reg <- auxiliary::Registration::new(
>                      pdev.as_ref(),
>                      c"nova-drm",
