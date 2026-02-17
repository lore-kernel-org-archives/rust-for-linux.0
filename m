Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BD25A2DD;
	Tue, 17 Feb 2026 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771352182; cv=none; b=cRvAC1SB1j+LsyJ+7D/11FxSwTN0sBAYpM9LCTFWWXIlhx1F2DCL5MYcgiua9+mQqwNaHZlju96WnazoD1ZNtwxMpTIvv1qkDodn6if5KNxS/5jIkiktthgPdxYBjr8Lkv+ZlTyydyXk6LvI9TURJipdE8xoKXUBrEgvEvFoyDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771352182; c=relaxed/simple;
	bh=GGR8mEKIwAKotXY6I6xx8Yr9YWpWwMdyDRXJEclhJeU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=YJQX1U9XsPMSlHgddstRIJ0HlU9mMWPtzA1uUwRN/KBwH6QIozS4vBuYHllVdgnaaT+XdD1Ne67pLCUReOUbpu/2GDs++o4ajxNXJk0iUR3L8G5Z6bqk899fAdM0uzKMII1O8JIGIWxXRN8AX7NqrI6kx2D15jvoNKNjb7+6Sxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCPJuQfc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCPJuQfc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A49EC4CEF7;
	Tue, 17 Feb 2026 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771352181;
	bh=GGR8mEKIwAKotXY6I6xx8Yr9YWpWwMdyDRXJEclhJeU=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=PCPJuQfcOk1iBSw28B+kAXLJ7gJhXovhtBmeorOiNY4d/FzPLzF5/3Tou0vlJnlr4
	 svOkWA7JR7RgSZgsFKitcsIJVL/eImTxu2b5Tjk/afmT4jjzEtPZmAs2VpEgekJ6/1
	 GzkDpZL2YTZODFh2+xa2qUNGoqqAJOX6uDnZH4KKO4s1vwJX3uAiCrKMd03niCumBw
	 ZUGpVhYcH8d0eka4VTnqGcLHrCGKam4E+HKD+ikh/XzR8TFUccQXG1mtXCbpHDpN65
	 Pb+m+bVFoOIS6dZ+gXfYj8blyBV5TUSaLKhw/QaiBWeAUrOv5tx1zTCz45INcG+Wo/
	 tNbAdS67PVXjw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 19:16:15 +0100
Message-Id: <DGHFXVMKDCYX.2WNLOCBRBFCEM@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 24/33] gpu: nova-core: Hopper/Blackwell: add FSP
 Chain of Trust boot
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
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-25-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-25-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> +    /// Creates FMC boot parameters structure for FSP.
> +    ///
> +    /// This structure tells FSP how to boot GSP-RM with the correct mem=
ory layout.
> +    pub(crate) fn create_fmc_boot_params(
> +        dev: &device::Device<device::Bound>,
> +        wpr_meta_addr: u64,
> +        wpr_meta_size: u32,
> +        libos_addr: u64,
> +    ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
> +        use kernel::dma::CoherentAllocation;
> +
> +        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 =3D 1;
> +        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 =3D 2;
> +
> +        let fmc_boot_params =3D CoherentAllocation::<GspFmcBootParams>::=
alloc_coherent(
> +            dev,
> +            1,
> +            GFP_KERNEL | __GFP_ZERO,
> +        )?;

I've mentioned this in another context already (where it doesn't work
unfortunately), but I think we should add a constructor that takes a closur=
e
with a &mut [T] argument, so we don't have to use dma_write!() for
initialization. If you want I can prepare a patch.

> +
> +        // Configure ACR boot parameters (WPR metadata location) using d=
ma_write! macro
> +        kernel::dma_write!(
> +            fmc_boot_params[0].boot_gsp_rm_params.target =3D GSP_DMA_TAR=
GET_COHERENT_SYSTEM
> +        )?;
> +        kernel::dma_write!(
> +            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset =3D=
 wpr_meta_addr
> +        )?;
> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_=
desc_size =3D wpr_meta_size)?;
> +
> +        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_si=
ze to be zero;
> +        // it obtains WPR info from other sources.
> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gs=
p_rm_boot =3D 1)?;
> +
> +        // Configure RM parameters (libos location) using dma_write! mac=
ro
> +        kernel::dma_write!(
> +            fmc_boot_params[0].gsp_rm_params.target =3D GSP_DMA_TARGET_N=
ONCOHERENT_SYSTEM
> +        )?;
> +        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_of=
fset =3D libos_addr)?;
> +
> +        Ok(fmc_boot_params)
> +    }
> +
> +    /// Boot GSP FMC with pre-extracted signatures.
> +    ///
> +    /// This version takes pre-extracted signatures and FMC image data.
> +    /// Used when signatures are extracted separately from the full ELF =
file.
> +    #[allow(clippy::too_many_arguments)]

Maybe we should just add a FmcBootArgs type with a corresponding constructo=
r.
This should also get us rid of the helper function create_fmc_boot_params()=
.

> +    pub(crate) fn boot_gsp_fmc_with_signatures(
>          dev: &device::Device<device::Bound>,
>          bar: &crate::driver::Bar0,
> +        chipset: crate::gpu::Chipset,
> +        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image=
 section
> +        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootPara=
ms>,
> +        total_reserved_size: u64,
> +        resume: bool,
>          fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
> -        nvdm_type: u32,
> -        packet: &[u8],
> +        signatures: &FmcSignatures,
>      ) -> Result<()> {
> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);
> +
> +        // Build FSP Chain of Trust message
> +        let fmc_addr =3D fmc_image_fw.dma_handle(); // Now points to ima=
ge data only
> +        let fmc_boot_params_addr =3D fmc_boot_params.dma_handle();
> +
> +        // frts_offset is relative to FB end: FRTS_location =3D FB_END -=
 frts_offset
> +        let frts_offset =3D if !resume {
> +            let mut frts_reserved_size =3D
> +                if let Some(heap_size) =3D crate::fb::hal::fb_hal(chipse=
t).non_wpr_heap_size() {
> +                    u64::from(heap_size)
> +                } else {
> +                    total_reserved_size
> +                };
> +
> +            // Add PMU reserved size
> +            frts_reserved_size +=3D u64::from(crate::fb::PMU_RESERVED_SI=
ZE);
> +
> +            frts_reserved_size
> +                .align_up(Alignment::new::<SZ_2M>())
> +                .unwrap_or(frts_reserved_size)
> +        } else {
> +            0
> +        };
> +        let frts_size =3D if !resume { SZ_1M as u32 } else { 0 };
> +
> +        // Build the FSP message

This comment seems superfluous.

> +        let msg =3D KBox::new(
> +            FspMessage {
> +                mctp_header: (mctp::HEADER_SOM << mctp::HEADER_SOM_SHIFT=
)
> +                    | (mctp::HEADER_EOM << mctp::HEADER_EOM_SHIFT)
> +                    | (mctp::HEADER_SEID << mctp::HEADER_SEID_SHIFT)
> +                    | (mctp::HEADER_SEQ << mctp::HEADER_SEQ_SHIFT),
> +
> +                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
> +                    | (mctp::VENDOR_ID_NV << mctp::NVDM_VENDOR_ID_SHIFT)
> +                    | (mctp::NVDM_TYPE_COT << mctp::NVDM_TYPE_SHIFT),
> +
> +                cot: NvdmPayloadCot {
> +                    version: chipset.fsp_cot_version(),
> +                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
> +                    gsp_fmc_sysmem_offset: fmc_addr,
> +                    frts_sysmem_offset: 0,
> +                    frts_sysmem_size: 0,
> +                    frts_vidmem_offset: frts_offset,
> +                    frts_vidmem_size: frts_size,
> +                    hash384: signatures.hash384,
> +                    public_key: signatures.public_key,
> +                    signature: signatures.signature,
> +                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
> +                },
> +            },
> +            GFP_KERNEL,
> +        )?;
> +
> +        // Send COT message to FSP and wait for response
> +        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
> +
> +        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
> +        Ok(())
> +    }

<snip>

> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index f04e2a795e90..88b1546e3cb4 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -124,6 +124,18 @@ pub(crate) const fn arch(&self) -> Architecture {
>              | Self::GB207 =3D> Architecture::Blackwell,
>          }
>      }
> +
> +    /// Returns the FSP Chain of Trust (COT) protocol version for this c=
hipset.
> +    ///
> +    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
> +    pub(crate) const fn fsp_cot_version(&self) -> u16 {
> +        match self.arch() {
> +            Architecture::Hopper =3D> 1,
> +            Architecture::Blackwell =3D> 2,
> +            // Other architectures don't use FSP COT
> +            _ =3D> 0,

I think we should use a new type to represent this version and use Option, =
i.e.
return Option<FspCotVersion>.
