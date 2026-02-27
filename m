Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FA642B73B;
	Fri, 27 Feb 2026 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204591; cv=none; b=K0EsGh8ZjSNpLONMNZQLy7wBMrRROvxhIPGNThWx0fyI/3UNxN6UOagw4QBhfo5q4UFz6Xlg1HWDQd+ggFDzGOW+uX5GQg7DSoOwA3kEWFn+ZWWgKWu07E3yW9MOFJo8aqxcb0hvPgni23Xlen1CmHBPLVGeUWdwMxCLYKaqp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204591; c=relaxed/simple;
	bh=Jj+dC//IBlftYmVdQ/yMWLBkVIxcXzh6KV/CBbHLSv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7PH4bm51QDzPizqBNzecznWZ0xrmarfr8w86Q1Df6kvpIwJQhnNwX5U3g/wWAhmB2yqPuP0muTi+MlguWl9OU3MXlVyStYoooSoW/j+J/OKYv8VaoaqBCDFcuSSQcn9vveZzFlrbuu10NIl11cXi2vVC1AI6trDxs1Ny9yxI1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s6HqWSLx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s6HqWSLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AEFC19422;
	Fri, 27 Feb 2026 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772204591;
	bh=Jj+dC//IBlftYmVdQ/yMWLBkVIxcXzh6KV/CBbHLSv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6HqWSLx+bmZiXvhZ0ULnPh0C/1j5nqzJHuFpU7PC9l6ndSv8h7C7w1e4xSm2a3R7
	 mDrbTCtFVS/3NybM6boKhNnN6gGLjxnDYI+xdhXOpHuV8M8VObsUq1oxAn+nsOA9xM
	 FXIZ1+Ut+PW8oZjk3UrpcF+V/Z4sPlbhmNYZu30BYEJ9nwIO0hZLvrp0KDMX5V3k+U
	 k7dy++WRRUnwF2mMMLCbSNnsyAeQ3RX2BlT1zuExwosToRacOFscEKerY7zS/iG82T
	 wIVVzfIimmQJlik8RoWRDqfufbEFSx5WvuFhbrSp5thnJYqlRwceLjVXurEza+hZQw
	 OyTc0oi4V4tpg==
Date: Fri, 27 Feb 2026 15:03:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: Re: linux-next: Tree for Feb 26
Message-ID: <759447c5-a2bd-445f-a245-8772f9ea1316@sirena.org.uk>
References: <aaBWxNYF4g5jRzzg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TSJOcLNUhfsHDCBt"
Content-Disposition: inline
In-Reply-To: <aaBWxNYF4g5jRzzg@sirena.org.uk>
X-Cookie: Only fools are quoted.


--TSJOcLNUhfsHDCBt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 02:20:52PM +0000, Mark Brown wrote:
> Hi all,
>=20
> Changes since 20260225:
>=20
> We now do a rustfmtcheck build after each x86_64 allmodconfig.

I meant to CC you yesterday to let you know about the additional rust
checks - I'll add other checks one at a time.

--TSJOcLNUhfsHDCBt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmhsioACgkQJNaLcl1U
h9C1YQf/UksOxxwX6asTjKjeXbB9A75UQk60pa1ISZOuL40hQjxiwTAQ3DizQArJ
EHa6UmyDdxYyzsfrbXc9Ovzo5zGOcrFBmhz1GzFL62og3VQO16JHL8u1kM2DxneK
mg94qyPljCjC3qcevrUIkwCgTNNB0WagOhpK3SGnFd1ynZm6KS/mKmjtFV7HqM9S
tySQQ+Xr+r5hwP8uByp8GUL3+MTFK6jLZkHXe71aM0MtceZ5eD113GEYQpE0Qybo
9EMRQHx0kAPmi9ClR5yY32z9+8hVfxJ/lq3VzEyQQRo+Up+RVP8SOnxhT1HE/uNt
TPhvaivdVuhKB05MWcSHp2OV/IWKog==
=Mio9
-----END PGP SIGNATURE-----

--TSJOcLNUhfsHDCBt--
