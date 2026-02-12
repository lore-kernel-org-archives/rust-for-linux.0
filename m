Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90B171C9;
	Thu, 12 Feb 2026 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770899142; cv=none; b=CxnTuE3v7z/Gwt/3rsmamP+p8c/P6hiNDUKScJPsmTanIHSAYFlbdOJNAjBDusQO4YpggZE/BelXOt4kvK18tONiBiMTaHeVNvMCX5fdOWsGhV1ySp9BEDln0/9PryoQdfrSfOVXkrJNqMmVVFMwmzWH2TrtPCOSJwNiL/aDyOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770899142; c=relaxed/simple;
	bh=E1ppuDkUjhv1cxj2mRtLRlumGkKTthSCdrELx98tgt0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sb0TwAgONcxflYk/3bhssiNFsGeY8MAEx2XcRO+x/i0s7jPCQr46Mi73m/vnX0bIPmq/VClcGvKNix2syGMLVH+HbuyPi/8fj88P9+ZGNNqtW3v9oqb1Gxt0WNEqRjLp/VtqV3Zx+AjR54QSDTFs4d3bGW+j1NOwJ27S4LjrWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g9GVte2U; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g9GVte2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770899139;
	bh=E1ppuDkUjhv1cxj2mRtLRlumGkKTthSCdrELx98tgt0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g9GVte2UbOH6CjhR9R/B3BkRv8wvdoh2NlC1ctWKZsHzoxbPGUQ0LskPYmcCHkquq
	 tsV6MQa9eGiTbBbeQYhgJnkfM3qBSBJ9m8l+Z7MMtN7o86XqkKx0drA4g/ZTDOObFi
	 rdZFafViHThNoQrKgFfW0NkjBRI5uQoqsQmIqW7LTvTkYQJH5GEInewIG/N4UE8pZ1
	 p95kvCFej7hjKz1YOWGhKA1COhX2rKoZTLbwD1NtJkEYs1eZj3FjNq/ogbBxAZNimw
	 ixmOR9LSvdW7yvx1wC6idp3STuo6syG/9KCMfBNqhhPPf+IiioQvj1GvuEvvhaPpgs
	 0XiQ2YOjby+BA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2E8317E151C;
	Thu, 12 Feb 2026 13:25:38 +0100 (CET)
Date: Thu, 12 Feb 2026 13:25:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1] drm/tyr: gpu: fix GpuInfo::log model/version
 decoding
Message-ID: <20260212132534.3b18096f@fedora>
In-Reply-To: <20260210183812.261142-1-work@onurozkan.dev>
References: <20260210183812.261142-1-work@onurozkan.dev>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Feb 2026 21:38:12 +0300
Onur =C3=96zkan <work@onurozkan.dev> wrote:

> GpuInfo::log() was decoding GPU_ID like this:
>=20
>   major =3D (self.gpu_id >> 16) & 0xff;
>   minor =3D (self.gpu_id >> 8) & 0xff;
>   status =3D self.gpu_id & 0xff;
>=20
> That does not match the Mali GPU_ID layout and mixes unrelated
> fields. Due to that, model detection becomes `mali-unknown` on
> rk3588s which is wrong.
>=20
> We can already get all the version information with a single
> GpuId::from call (less code and cleaner), so this patch uses it.
>=20
> Also renamed `GpuModels` fields from `major/minor` to
> `arch_major/prod_major` to reflect their real meaning.
>=20
> This change was tested on Orange Pi 5 (rk3588s) board and the
> results are as follows:
>=20
> Before this change:
>=20
> $ dmesg | grep 'tyr'
> [   19.698338] tyr fb000000.gpu: mali-unknown id 0xa867 major 0x67 minor =
0x0 status 0x5
> [   19.699050] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.699817] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.702493] tyr fb000000.gpu: Tyr initialized correctly.
>=20
> After this change:
>=20
> $ dmesg | grep 'tyr'
> [   19.591692] tyr fb000000.gpu: mali-g610 id 0xa867 major 0x0 minor 0x0 =
status 0x5
> [   19.592374] tyr fb000000.gpu: Features: L2:0x7120306 Tiler:0x809 Mem:0=
x301 MMU:0x2830 AS:0xff
> [   19.593141] tyr fb000000.gpu: shader_present=3D0x0000000000050005 l2_p=
resent=3D0x0000000000000001 tiler_present=3D0x0000000000000001
> [   19.595831] tyr fb000000.gpu: Tyr initialized correctly.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/gpu.rs | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index 6c582910dd5d..da97844efbec 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -99,13 +99,11 @@ pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres=
<IoMem>) -> Result<Self> {
>      }
> =20
>      pub(crate) fn log(&self, pdev: &platform::Device) {
> -        let major =3D (self.gpu_id >> 16) & 0xff;
> -        let minor =3D (self.gpu_id >> 8) & 0xff;
> -        let status =3D self.gpu_id & 0xff;
> +        let gpu_id =3D GpuId::from(self.gpu_id);
> =20
>          let model_name =3D if let Some(model) =3D GPU_MODELS
>              .iter()
> -            .find(|&f| f.major =3D=3D major && f.minor =3D=3D minor)
> +            .find(|&f| f.arch_major =3D=3D gpu_id.arch_major && f.prod_m=
ajor =3D=3D gpu_id.prod_major)
>          {
>              model.name
>          } else {
> @@ -117,9 +115,9 @@ pub(crate) fn log(&self, pdev: &platform::Device) {
>              "mali-{} id 0x{:x} major 0x{:x} minor 0x{:x} status 0x{:x}",
>              model_name,
>              self.gpu_id >> 16,
> -            major,
> -            minor,
> -            status
> +            gpu_id.ver_major,
> +            gpu_id.ver_minor,
> +            gpu_id.ver_status
>          );
> =20
>          dev_info!(
> @@ -167,14 +165,14 @@ unsafe impl AsBytes for GpuInfo {}
> =20
>  struct GpuModels {
>      name: &'static str,
> -    major: u32,
> -    minor: u32,
> +    arch_major: u32,
> +    prod_major: u32,
>  }
> =20
>  const GPU_MODELS: [GpuModels; 1] =3D [GpuModels {
>      name: "g610",
> -    major: 10,
> -    minor: 7,
> +    arch_major: 10,
> +    prod_major: 7,
>  }];
> =20
>  #[allow(dead_code)]

