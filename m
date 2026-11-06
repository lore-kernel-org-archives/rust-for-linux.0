Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793966680;
	b=Tq4ql5GQBX5+y4EALNe1h/BNE0y/0Dvu2a+qJU412kjtmtHx2Z6Jvs9hi52so4S1/2RK
	 iL/W0oARchh9C2u0LzwxGA24kthTlnqJPcYZKeysKPB9cwkFSrLaHb4/EDYYPoRPdpaqN
	 f421xBkJYr1XayX4NQiTf5bawnCre8AWEG0x4XqWYRjoveoAYtUnT50SKn2icPxfoDbzg
	 s1YegWHO17IW7R4ZuKCtTa6VW/hvCBNF8ptfnjqNHWBKWADrALl2DIXilZeK8x4J8Z033
	 2CVnNaiBfp6kkpZGMq32YeVzI9kINqCMokAdgPbFuRswP3s253bgdJS8plYTD980M1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966680;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=0VMSuKuVUf2dlWYzVs5lJWxmrLEkc9V1Bcxwn1i5L2k=;
	b=2xCWGq1WtVZwzReHSYmF3ueVEwA43aGqaInoIfN75WlvSTlPsXZgybq0VFxvL2gJ14cI
	 KKjnSR224Do8pl0NTTnHMGAM0lKIVe3Uq8kSGuPmDHR+rQt2Dkx/WWjotXCy1FDIHTTRz
	 Kz4WPf1d4b+1pSXHL4tiOjyvTdUvV4znwXazPRXwl9dcN5qGQKaCCKgW3iby23UaQRfsQ
	 8HVqrYS5sV6Pfcp+f+oRIkBz8vy6EckOxSxeqscl/unrNM2uvRqiUVURBxwuv0ROjdiF9
	 YX5O21C6iLMd8nY+1Da15ZZWJwAN5OlVTyplGkYrGZK7OwMbATnwUycNiVCOX/i3m4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Su6il38E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2578606D812;
	Fri,  6 Nov 2026 12:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2578606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Su6il38E
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BBA542008B8;
	Fri, 06 Nov 2026 13:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793966676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0VMSuKuVUf2dlWYzVs5lJWxmrLEkc9V1Bcxwn1i5L2k=;
	b=Su6il38EHz3iTBVlv0SlQYW10yVxaG+ejejIeK798vykwVDWA90DGHk0IFdIx9iP6hIBah
	2WzAY09Zu0fMcIQbLn1Buf6Fx8espq8It4foZFZdDhogvANqt8C3S3TzRaRm+BmqS6mAqJ
	XDn1h3bgNidn6zoj30ya1afL+2BESUEuZKg6s3zQsmslXqvIOnGF50RpcNFAMGCszsccPc
	hDCXnHD/E+V3LX+QUa1pWdmbCJCou8tYi6FF3i4aqMV0OnR41vkKI9bPey2qRRCO/ss7qv
	hSjmtA9NAFk+wYk9If+ZWvawRVMGdAinibi4dwR7qkAwhgc8zeIncMWRvTM4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793966676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0VMSuKuVUf2dlWYzVs5lJWxmrLEkc9V1Bcxwn1i5L2k=;
	b=IOJJSX9ztQ+7tZjTkiwUnQhDHtJZyOMRqVHT5szroNBYIQLV8me9BkyR1eA9pvwCVe9WyA
	YRrvOBQy5+Nw6XsfoG4DYF2w+ZiVKw4jQBgkGBzaHAY/RCvR39d+gkba8gF6FLeHLS3ERV
	+UcathHPfNvDni8rIljvnPzYolu+PvL93PC6/nfZsALSBdDp8so5H5tRxjR8vJCuqOH5vy
	BToujHEwcXxf4aJa7xuodb2DXdVRK5J7fno2S4f7WAEQdrUSsQKJnllgf19y+3Nz7/Pf4t
	M7NHIyXFZzHsOxFKD/ExruJluEsqsxxVF4MT5AefxdGKXywY08KhHFRMUzTsqg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793966676; a=rsa-sha256;
	cv=none;
	b=WN+CuIG0kbvQZm/6IEIW0/xFm0gz9uZN0oE9xAVbEEG3era3lay+WVcsWdK+nEZwtkxmA2
	u01SorhQP/aXH0Hm/O5xTky/Ugd3F+KiwbMNpmWAWqexuNSvb0yCT4a6VdVkdbUhyEt6jf
	loFmHEiZ/eW9bv66/fJbguajdsJFwPET41eKHcdZKbl5ELQ6c0XdXOdP+gamAt7cflTwqA
	tYxyKcZZv3xprq21O4X/zEd1xNFlLbsUZnJLSgGEA2QVMUa3AznqTJi0TEwi844AAX8rvk
	ws2V9Wc6SNNwXz13fRVVMQjwjhDpMhiAkdszADlqXH5c9vOjkrZKlfHTbENmjA==
Message-ID: <aa7385b6f373cd6467b772bf0a9941618b35c5ba.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/panthor: Add initial support for CIX Sky1
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Cunyuan Liu <cunyuan.liu@cixtech.com>, boris.brezillon@collabora.com, 
	steven.price@arm.com, liviu.dudau@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, 	conor+dt@kernel.org, gary.yang@cixtech.com,
 fugang.duan@cixtech.com
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	robin.wang@cixtech.com
Date: Fri, 06 Nov 2026 13:04:36 +0100
In-Reply-To: <20261106104735.1651267-3-cunyuan.liu@cixtech.com>
References: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
	 <20261106104735.1651267-3-cunyuan.liu@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fr, 2026-11-06 at 18:47 +0800, Cunyuan Liu wrote:
> Add Sky1 SoC data to support the external reset and system-level cache
> settings, and to skip devfreq.
>=20
> The GPU on CIX Sky1 needs an external reset before the driver first
> accesses the hardware. Without this reset, the GPU hardware cannot be
> accessed correctly.
>=20
> Configure SYSC_ALLOC before L2 power-on. Without these settings, GPU
> rendering results are displayed incorrectly.
>=20
> Keep the clock settings provided by the PM firmware. This first version
> does not read OPPs or enable devfreq. It does not register a GPU cooling
> device.
>=20
> Tested on Orion O6: offscreen pixel readback, kmscube, glmark2 at 1080p,
> runtime suspend and resume with a retained EGL context, software-triggere=
d
> reset-worker tests, and module unload and reload. Display tests used
> local Komeda support.
>=20
> Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c  | 11 +++++++++-
>  drivers/gpu/drm/panthor/panthor_device.c   | 15 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h   | 25 ++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c      | 15 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_gpu.c      | 14 ++++++++++++
>  drivers/gpu/drm/panthor/panthor_gpu_regs.h |  2 ++
>  6 files changed, 81 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index 2249b41ca4af..1914549f7b1f 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
[...]
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index 9687c59de350..1d682731a181 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -229,6 +229,13 @@ int panthor_device_init(struct panthor_device *ptdev=
)
>  		return ret;
>  	}
> =20
> +	if (ptdev->soc_data && ptdev->soc_data->needs_external_reset) {
> +		ptdev->reset_control =3D devm_reset_control_get_exclusive(ptdev->base.=
dev, NULL);

You can just use devm_reset_control_get_optional_exclusive()
unconditionally.
Device tree validation makes sure the required reset will be specified.

> +		if (IS_ERR(ptdev->reset_control))
> +			return dev_err_probe(ptdev->base.dev, PTR_ERR(ptdev->reset_control),
> +					     "Failed to get GPU reset\n");
> +	}
> +
>  	ret =3D panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;
> @@ -511,6 +518,12 @@ int panthor_device_resume(struct device *dev)
>  	if (ret)
>  		goto err_disable_stacks_clk;
> =20
> +	if (ptdev->reset_control && !panthor_device_is_initialized(ptdev)) {
> +		ret =3D reset_control_reset(ptdev->reset_control);

reset_control_reset() already checks that ptdev->reset_control !=3D NULL,
so the first check is superfluous.


[...]
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index b55a3f9edd41..0923cc5df042 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
[...]
> @@ -34,10 +36,30 @@ struct panthor_pwr;
>  struct panthor_vm;
>  struct panthor_vm_pool;
> =20
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
> +	/**
> +	 * @needs_external_reset: Reset the GPU after enabling its clocks
> +	 * during initial probe.
> +	 */
> +	bool needs_external_reset;

Not needed.

[...]
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index dc8d0191aef4..766df6505a7b 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1872,12 +1872,27 @@ static struct attribute *panthor_attrs[] =3D {
> =20
>  ATTRIBUTE_GROUPS(panthor);
> =20
> +static const struct panthor_sysc_config sysc_config_cix_sky1 =3D {
> +	/* Sky1 needs these SYSC_ALLOC policies for correct display of GPU outp=
ut. */
> +	.alloc =3D {
> +		0x00230000, 0x00000023, 0x00000000, 0x00000000,
> +		0x00523222, 0x00523200, 0x00000022, 0x00000032,
> +	},
> +};
> +
> +static const struct panthor_soc_data soc_data_cix_sky1 =3D {
> +	.needs_external_reset =3D true,

Not needed.

regards
Philipp
