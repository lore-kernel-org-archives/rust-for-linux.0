Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25102DC348;
	Mon, 22 Dec 2025 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766413137; cv=pass; b=GPBKnpAy+o0WhSbgm5I0xsbbv2GqswTMZEt94mwBh+0XP+xzExrbaJVJH9DvWHIAW3q2DZRsJ7ISdczw4fxIO04CP+hC9A191SNSrQ7FKt1DKyTmcF03LoUsRSF7dKXF9aqm3iKYLE3UE9nnhbeLTwR2KdhdIgSvcnYTUu4qlU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766413137; c=relaxed/simple;
	bh=2pqpPSAq2A2+nkax0gkRYvg+ckf+ACgoMkr98Z0ve7E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HO6WXus7NO9XzEEUJkR4FmQ2/6cA0Mu4Rnzseo6g/n7ltKznrxp2aK0WAChRYHAmaNbTzyIoRzMuXFsgfdCkxDc0x66TWyysxMdRtgbDGqj54el13jRWNXpeg+Y9npwvkaxN3gjACDQt105ZYxLWsJwMHJLauMHuU4icBEc1pMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=OZqDfMrD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="OZqDfMrD"
ARC-Seal: i=1; a=rsa-sha256; t=1766413116; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XkCUX7wkE2voJ4iTfDeZCOs6dh9cZzj/H8XpIMpogsgPBCbYgoE3Gbd4Dg8d0IiSqP90PPkQCb/4oA1pKlMIqU2M21O/tJsRhD7c1r34RLHG3+pmdsxScQkbe8PW52fZOUSzzGYfVPFKFn1lhCYrDy0sPkXBzBh4S0Tirhwag4Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766413116; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lzMVTHQXBmFFySJGVo+Kjnu5s7ZRwk+oWJPLJB199EY=; 
	b=F8Gm2qTFwwyiB8FeAbURAPMz/rzEpPFe8eRhZd8ehWroaH4ErctEqYrmRnUEQrGLDE1uXsb0a+pdeAhZ3vwO6Z1xCzbp3uRHUu1v5w2nKt6R+ulERuDWrvr4H21Pls5N56VuCYWJrfYbapOq+GrXRBU+KRQW1+CVVXaUkEAN52Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766413116;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=lzMVTHQXBmFFySJGVo+Kjnu5s7ZRwk+oWJPLJB199EY=;
	b=OZqDfMrD7Ua11+rYXx5PY53XUTpARMfXB2KIv8MAz95JKnTtRoesd7lmkmLxacJR
	Ua7/yfdOuscJMo+C89+RTzzD81m1YKhZ9aqCLANhLG18MG0gClW03hJ6SXIOicb7pD6
	AkeTzDg5dOhswPreO9JWfH34Sk7gRKbXWHL169Zk=
Received: by mx.zohomail.com with SMTPS id 1766413113669740.3661118189485;
	Mon, 22 Dec 2025 06:18:33 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: drm: replace `kernel::c_str!` with C-Strings
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com>
Date: Mon, 22 Dec 2025 11:18:15 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Tamir Duberstein <tamird@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8ED64170-53CC-4D03-BAC3-682ACF273ADF@collabora.com>
References: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Tamir,

Please cc me for any Tyr changes.

> On 22 Dec 2025, at 09:27, Tamir Duberstein <tamird@kernel.org> wrote:
>=20
> From: Tamir Duberstein <tamird@gmail.com>
>=20
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> drivers/gpu/drm/tyr/driver.rs | 19 +++++++++----------
> 1 file changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index 0389c558c036..65405f365fec 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -1,6 +1,5 @@
> // SPDX-License-Identifier: GPL-2.0 or MIT
>=20
> -use kernel::c_str;
> use kernel::clk::Clk;
> use kernel::clk::OptionalClk;
> use kernel::device::Bound;
> @@ -91,8 +90,8 @@ fn issue_soft_reset(dev: &Device<Bound>, iomem: =
&Devres<IoMem>) -> Result {
>     MODULE_OF_TABLE,
>     <TyrDriver as platform::Driver>::IdInfo,
>     [
> -        (of::DeviceId::new(c_str!("rockchip,rk3588-mali")), ()),
> -        (of::DeviceId::new(c_str!("arm,mali-valhall-csf")), ())
> +        (of::DeviceId::new(c"rockchip,rk3588-mali"), ()),
> +        (of::DeviceId::new(c"arm,mali-valhall-csf"), ())
>     ]
> );
>=20
> @@ -104,16 +103,16 @@ fn probe(
>         pdev: &platform::Device<Core>,
>         _info: Option<&Self::IdInfo>,
>     ) -> impl PinInit<Self, Error> {
> -        let core_clk =3D Clk::get(pdev.as_ref(), =
Some(c_str!("core")))?;
> -        let stacks_clk =3D OptionalClk::get(pdev.as_ref(), =
Some(c_str!("stacks")))?;
> -        let coregroup_clk =3D OptionalClk::get(pdev.as_ref(), =
Some(c_str!("coregroup")))?;
> +        let core_clk =3D Clk::get(pdev.as_ref(), Some(c"core"))?;
> +        let stacks_clk =3D OptionalClk::get(pdev.as_ref(), =
Some(c"stacks"))?;
> +        let coregroup_clk =3D OptionalClk::get(pdev.as_ref(), =
Some(c"coregroup"))?;
>=20
>         core_clk.prepare_enable()?;
>         stacks_clk.prepare_enable()?;
>         coregroup_clk.prepare_enable()?;
>=20
> -        let mali_regulator =3D =
Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("mali"))?;
> -        let sram_regulator =3D =
Regulator::<regulator::Enabled>::get(pdev.as_ref(), c_str!("sram"))?;
> +        let mali_regulator =3D =
Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"mali")?;
> +        let sram_regulator =3D =
Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
>=20
>         let request =3D pdev.io_request_by_index(0).ok_or(ENODEV)?;
>         let iomem =3D Arc::pin_init(request.iomap_sized::<SZ_2M>(), =
GFP_KERNEL)?;
> @@ -174,8 +173,8 @@ fn drop(self: Pin<&mut Self>) {
>     major: 1,
>     minor: 5,
>     patchlevel: 0,
> -    name: c_str!("panthor"),
> -    desc: c_str!("ARM Mali Tyr DRM driver"),
> +    name: c"panthor",
> +    desc: c"ARM Mali Tyr DRM driver",
> };
>=20
> #[vtable]
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-tyr-37ee95790f5f
>=20
> Best regards,
> -- =20
> Tamir Duberstein <tamird@gmail.com>
>=20
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

