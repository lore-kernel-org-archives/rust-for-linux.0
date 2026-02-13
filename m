Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5783612E2;
	Fri, 13 Feb 2026 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994026; cv=none; b=YzxmIjK1OQ6xUQq+HPgs7wnghXj91oSvs3Fbn9PiKeFmn0sJck7LjldHABeRLI3LxegLmO5XKQNQ9WmP4+D9HbWf5dXCwyelAY6WE+LoE10hfV3coV/loRMMMWtEzNGvRNnmD/v9sv+Fsbvdwyu4Up2jenBgv+5NUf8YTazJq4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994026; c=relaxed/simple;
	bh=PfUuTo2C22B502KfiidVcMpl6fd1ZJEdslkaqG2JgXo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=CzHWoO61f7yjfN2mX/9i/1py67qBaeV14VTiTtfUDc7uEtHskjSFehwbCT5Y3G2gyHhNl8nyBAcsfkZuIMcgADrvRxCPMi1npSAjidjil1/hiZZBhNVvSbOyCZxpPSh6BYOd/LNaMR2wa5zJqDZvaTPJljivzl0xYIdDyGmJbHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLGa0ZqO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLGa0ZqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6E9C116C6;
	Fri, 13 Feb 2026 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770994026;
	bh=PfUuTo2C22B502KfiidVcMpl6fd1ZJEdslkaqG2JgXo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=qLGa0ZqOVOApBCBl9bS3iFM0WK0TiLYX01j2qDqzV+QxNd8Upska8blJ6snj7Kh1/
	 MyJIOCBf5Ucy1ct7yxtw9TsQK/927cYKtZghWawrDKmvR5oUct2EiruQKrLUOWeRiC
	 GMk4q9+mVQiYoClAVfo/RfRwD9popMZL5ORrDYb4xus850SjWtcTOXdArG9hAn57FA
	 LDRSSQSh6Eg9zlxsmFytnFptZAOT4bK972lTEIXUbUCkiYadROP8AphflKTdvg9CdK
	 u9aNAv7ya/aP8cNrN8yStE17ZbQyCw9fp2KAFPKPx/33yVa4vDg0cumdpbNcISc78g
	 0lX4Em1fA84Bw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 15:47:01 +0100
Message-Id: <DGDWZHY8XCLX.19DI18CI9QSPQ@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v9 6/9] gpu: nova-core: add PIO support for loading
 firmware images
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
 <20260212-turing_prep-v9-6-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-6-238520ad8799@nvidia.com>

On Thu Feb 12, 2026 at 9:26 AM CET, Alexandre Courbot wrote:
> +    fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter<=
'_, Self>> {

[...]

> +        let dmem =3D {
> +            let params =3D self.dmem_load_params();
> +
> +            // SAFETY: we keep a reference to `self` for as long as this=
 slice is alive, and the
> +            // device will not access this DMA object since we are using=
 PIO.

How is this guaranteed by this function? I.e. how is it prevented that this
function is never called when the device acesses the DMA memory?

> +            let data =3D unsafe {
> +                self.as_slice(
> +                    usize::from_safe_cast(params.src_start),
> +                    usize::from_safe_cast(params.len),
> +                )?
> +            };
> +
> +            let dst_start =3D u16::try_from(params.dst_start).map_err(|_=
| EINVAL)?;
> +
> +            FalconPioDmemLoadTarget { data, dst_start }
> +        };
> +
> +        Ok(FalconDmaFirmwarePioAdapter {
> +            fw: self,
> +            imem_sec,
> +            imem_ns,
> +            dmem,
> +        })
> +    }
> +}

<snip>

> +/// Adapter type that makes any DMA-loadable firmware also loadable via =
PIO.
> +///
> +/// Created using [`FalconDmaLoadable::try_as_pio_loadable`].
> +pub(crate) struct FalconDmaFirmwarePioAdapter<'a, T: FalconDmaLoadable +=
 ?Sized> {
> +    /// Reference to the DMA firmware.
> +    fw: &'a T,

In v6 [1] I wrote:

	> @@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
	>      desc: FalconUCodeDesc,
	>      /// GPU-accessible DMA object containing the firmware.
	>      ucode: FirmwareDmaObject<Self, Signed>,
	> +    /// Generic bootloader
	> +    gen_bootloader: Option<GenericBootloader>,

	I'm not convinced this is a good idea. We probably want a HAL here and
	have different FwsecFirmware types:

	One with a DMA object and one with a system memory object when the
	architecture uses PIO. In the latter case the object can have a
	GenericBootloader field, i.e.  this also gets us rid of the Option and
	all the subsequent 'if chipset < Chipset::GA102' checks and 'match
	gbl_fw' matches below.

So, I still wonder, why use an Adapter impl on top of DMA memory for PIO ra=
ther
than different base types with a common trait to avoid DMA allocations in t=
he
PIO case altogether?

[1] https://lore.kernel.org/all/DFQBHVTTHZY8.13ASLCJ3FJP81@kernel.org/
