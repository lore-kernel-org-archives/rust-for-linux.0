Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF052AE68;
	Fri, 13 Feb 2026 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770998071; cv=none; b=atrS+wbjW6xfjJ8xXTCCcyhW//xG8tf1XolVmduftf6Nu3IH9w4abRG/lUP32KG6rJkF6rsqRdUu0ngT9X0d1Qu06DIjxCSoL5VFFGd/VxHwPKubwnDeViKSB8jPENhp0jyuiy/LE6OGoRK5KiQ0QfcVq2u976Szy/nLElI6q3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770998071; c=relaxed/simple;
	bh=LSegEQrSOwuVPwnSlWUvlsuB3DrPeTxqGE1znf4tkxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIzOQQuQua6pc9mBEHIs5cK70+8hi9MXVi8BOEMm9eglrWpSfucB16lLUdicN9WYSwZ+yEUOIZRHk5MYE8GzXSZuf1NelEbzw7q+F2YVNr4tShzADnJWO4dbdi8oXgWOFDn1isNLNRq/uJ4pqfAOj8eGeNTA1g52S6DQPBJ2dGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2UORqzU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2UORqzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABBFC116C6;
	Fri, 13 Feb 2026 15:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770998071;
	bh=LSegEQrSOwuVPwnSlWUvlsuB3DrPeTxqGE1znf4tkxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2UORqzUWWsGbuacUdgB5VuK4KR/W/mMun7zc+tiJAW1dnSaSZJ0fWM5A/RVnpeBo
	 U7FM822Vj6d/pmQDJ108ykmSj/5X+yTW/5rTDMLCLwjq9Mrd5lME9NAIuF5ndP2owl
	 RC07VSGKn0aYrni6eoo0Z8mFoCmIh1WdZCTKTjHI44xDt0iNtCVe7p1HtLp81TaMki
	 ofMGEFc2wW4NBtTCwS3yE4WybV9mn79N0C6RANf6FEPaiVP8MqvXTb9BPz8rjwo++X
	 pg5OHrXrvfZ18SVbxWAbJ9yRXeMj6i1K/Na1tvXaLeRxiMZotb48n9h32Srp2gW7H1
	 Zo1HeA8qJDEGg==
Date: Fri, 13 Feb 2026 15:54:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <fa0f761d-45f8-4d94-b077-945b228858a8@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
 <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
 <aY8DrSjWm5w6Lfs-@e142607>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OBu0sbjdvL7VcMH0"
Content-Disposition: inline
In-Reply-To: <aY8DrSjWm5w6Lfs-@e142607>
X-Cookie: I have become me without my consent.


--OBu0sbjdvL7VcMH0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 13, 2026 at 10:57:49AM +0000, Liviu Dudau wrote:

> Please note that the sram supply is mandatory in all compatibles except
> for the "mt8196-mali". This was to work around the fact that MTK has decided
> to control some supplies via another method and not give Panthor control over
> those.

> We should fix Panthor to check that we only treat the sram supply as
> optional for "mt8196-mali", but that doesn't alleviate Tyr's need to support
> optional regulators.

If you know that the supply will never be present for that compatible
then the driver shouldn't really be requesting it in the first place.

--OBu0sbjdvL7VcMH0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmPSTEACgkQJNaLcl1U
h9BH2Af/frL1CweswfxYTiomuQSnfzKCXtEbAxxX9OsnTb2VD/9A3iEMrwQkpGm0
AnMCBxq1ijav/NXN326PFqMDQ6n3QzcS7v+ma92ZIHXTgyvS9viTOGbJMMk7BnFW
6RbDc9CrcBcfJqPlJMV33uQ1Tdch53y/XPKZR9dsMckYS6YXuXivMJ+pEU5dr8cS
HQ+MA5Y55VfvJifiImaZv9YmQNib7o/tVMpjH8dE6wgGKmr0sz37gBCrdr0IyEg7
FCORJor2aGmKG5aehRDqCYKJ2BZcvJGeEASZkALUfbI78U1XxR2QMrKVYz0HAvAV
9t5xafl28wVPbEB9VVdOXle6h8b6Nw==
=zF/0
-----END PGP SIGNATURE-----

--OBu0sbjdvL7VcMH0--
