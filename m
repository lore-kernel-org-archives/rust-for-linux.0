Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A55F32937E;
	Thu, 12 Feb 2026 11:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896087; cv=none; b=l2/XsCeHOGObXLhT4w+jlkU+HDK6EJqrWU82PF2d9qM+v1u+ZeWNszi6s4EeBkDzjIuLuczBN29PjJ5wCys8yiti2dbhGiwLWbSaSKPXX8Kz6ISDTOrx6CRPUUDQytN4QoMjUdxumTEe8hZKu4uTsA6DjT1EhEqSax4BIUaRjVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896087; c=relaxed/simple;
	bh=cdzDHmhAqk8/Nk4W5hBG5sQdMJ67tOeq4Ny+gim3Iyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KO3riWVzSAKrPXa/rs2DfDxSyrNuqU08DWymH1YAo+mFAjdusvdqEAN93zFKeFyHf+DlVVMGAnB/CVbPdd0x36ryBYaRHs8qRQ/PzMgNAWtfRGaqxGozxpd6jfzL0gXssh0nNxh5ncFKZ5cDtJpIIAsRg3dSSnfQl+8gI19c/Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVzwS6M5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVzwS6M5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77759C4CEF7;
	Thu, 12 Feb 2026 11:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896086;
	bh=cdzDHmhAqk8/Nk4W5hBG5sQdMJ67tOeq4Ny+gim3Iyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVzwS6M5BL5a3U9CM0XI/9eNret7pVEykI7tewrdL/aQ63lfMAK4OiE7JQBM0gdci
	 IpwH5r9ylLJfG/JK/xZrxatMVQd56EN5mRIAHFeR8vC6ZzBjbsv/yHahDuvpPIOkST
	 ez9pusCRACJ383jaOUm8BCFpg4WX29lPSzSD2HacZ6lRoczAz3c4XmYBntlu8KdAn/
	 C/w6NOF0K8hDdu2bBlMo3MKZFqCU9kzSbLNYhoS9VTx2c347LHA+l4iNzoxEPsmRAy
	 JBuwtcgLpj+hrNOz163pM8NqEq0vrxxSUFZgLABmlxSfGV7pwRzbRu44xlqSP2fSTs
	 tWg0rl7Vs0Dcw==
Date: Thu, 12 Feb 2026 11:34:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bFbv3jIqiwfaKw4C"
Content-Disposition: inline
In-Reply-To: <20260212100538.170445-2-work@onurozkan.dev>
X-Cookie: Save energy: be apathetic.


--bFbv3jIqiwfaKw4C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =D6zkan wrote:
> On rk3588s, `dmesg | grep 'tyr'` logs:
>=20
>   tyr fb000000.gpu: supply SRAM not found, using dummy regulator
>=20
> This happens because Tyr calls Regulator<Enabled>::get() for SRAM,
> which goes through the non-optional regulator_get() path. If the
> device tree doesn't provide sram-supply, regulator core falls back
> to a dummy regulator and writes that log.

> Panthor handles SRAM as optional and tolerates missing sram-supply.

Does the RAM really work without power?

--bFbv3jIqiwfaKw4C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmNutAACgkQJNaLcl1U
h9Dz5Af/a5nGg0PyZZkNCLYWsu8Yp65N5DBsShu+i4JNiPXQM0JRu1w55Fw5rciV
qUInXjGWeP0IO2jA86UxCl0j2knqIf4xkPcxowPi3eGU176bpnamvR4fJBpLPHjk
m+HC5Rg4UC7rveN50yPY/LtJPKakw5ED3EBBGA1stCKK2HWtL+1MzJeK2fYDVauC
fth9GO58lnZJdh/3FnTwYc37fgNwNtv5PHjK9Ms3GsRATVyy0LFUIx8h66R22hxa
ho+Y0/ZE16zuWH3ZbLrBFFeqeyAmCQhnUmtt46K0OROK0x4ae/JGwxZUyxtg9Ew3
zqQsvzLnYq6WUgBG/NKBz5f61HHktw==
=8+Wg
-----END PGP SIGNATURE-----

--bFbv3jIqiwfaKw4C--
