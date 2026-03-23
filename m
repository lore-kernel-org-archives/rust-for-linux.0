Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029D38837F;
	Mon, 23 Mar 2026 11:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264888; cv=none; b=V7ifW7pg3so24RPcK717WzVaorcs/CjMdXC/R/iVYfFDPYcm6/whre1jLfwWRywOEyeAeLW1DjDzISlKR5pJm+qSiOPCsaOttG+QkWQGCJC5LCGFXklRCu9vGTcoPtN12nt5zTW3GWxpcZ1yXxuRv2yxMa7o2Yti6PYyA4I2ve8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264888; c=relaxed/simple;
	bh=ms8SURZjK2TNwnwC4VHjTeboaZrJo14MJa9t1jjQSjU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=XikBIaFBF+FitmgLEfwQX6FoQkk4y6jkGAtKBeFHYmR/TKn6TyLrzEQB/0QkG3S6PDI1Kz5ayaaImIXRvTN0z2bAUHqbzRNVtgNxoXoMwzqYsfAMOJmcDTH79mdQtUtl4fdmR54oM/03dpuh/FHC9ovTuG6keVZlWhPfxZUefR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzIblu2M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzIblu2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757F6C4CEF7;
	Mon, 23 Mar 2026 11:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774264888;
	bh=ms8SURZjK2TNwnwC4VHjTeboaZrJo14MJa9t1jjQSjU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=rzIblu2Mx3mzCx8Tb95ri9WGjs4az9ufrC9qOTQnVXrj3zkA2lMOi8JOO7ZA97dsK
	 XjtcZbe1nzWnGGqDCdSZ8O+x/Ga6Uew9vi35dPTkuO519tM2PN5zwfZvAUKjFUrB7Y
	 jPfJkZifwjdtkbPB4wcQ/Zgo2pJJhvdVA6yS77iXSgp3PD7Ek80DKss7VksuXGsjGL
	 9WL2aqabOgIdUfAXsc2vN+bhAjYcPRPJRaqS06fjMq0dBQSkCkXY5wIX2kHit9zy4q
	 aBFFp1JttHtoR7K/nwbikiWLCSQkiY7e9bXLNOs9lWwBXFifVsYno4PNWJNIwYKD8c
	 TyU7RO7URnWZQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 12:21:21 +0100
Message-Id: <DHA4EQAOO8QW.3AFGNJZFQX6N7@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 01/10] gpu: nova-core: convert PMC registers to
 kernel register macro
References: <20260323-b4-nova-register-v3-0-ae2486ecef1b@nvidia.com>
 <20260323-b4-nova-register-v3-1-ae2486ecef1b@nvidia.com>
In-Reply-To: <20260323-b4-nova-register-v3-1-ae2486ecef1b@nvidia.com>

On Mon Mar 23, 2026 at 12:07 PM CET, Alexandre Courbot wrote:
> -impl TryFrom<u8> for Architecture {
> +impl TryFrom<Bounded<u32, 6>> for Architecture {
>      type Error =3D Error;
> =20
> -    fn try_from(value: u8) -> Result<Self> {
> -        match value {
> +    fn try_from(value: Bounded<u32, 6>) -> Result<Self> {
> +        match u8::from(value) {
>              0x16 =3D> Ok(Self::Turing),
>              0x17 =3D> Ok(Self::Ampere),
>              0x19 =3D> Ok(Self::Ada),
> @@ -155,23 +151,26 @@ fn try_from(value: u8) -> Result<Self> {
>      }
>  }
> =20
> -impl From<Architecture> for u8 {
> +impl From<Architecture> for Bounded<u32, 6> {
>      fn from(value: Architecture) -> Self {
> -        // CAST: `Architecture` is `repr(u8)`, so this cast is always lo=
ssless.
> -        value as u8
> +        match value {
> +            Architecture::Turing =3D> Bounded::<u32, _>::new::<0x16>(),
> +            Architecture::Ampere =3D> Bounded::<u32, _>::new::<0x17>(),
> +            Architecture::Ada =3D> Bounded::<u32, _>::new::<0x19>(),
> +        }
>      }
>  }

Can this use bounded_enum!()?
