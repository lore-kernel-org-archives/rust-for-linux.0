Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147B318EF7;
	Thu, 12 Feb 2026 13:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770902017; cv=none; b=AbCWGnp+WBxzZ3OzSwFnFF3rBZd3sdUOCa8mP8ERbZjLzdNEEkxobgIy0m8JLKZQIeZ2zsztDmKaNx/hjnzv+OIzKfr7oYHj7xxGlBdj7igbhStKX8P6Wn8LCZLLfZCLAX/7YaKMsGGjD6YsbJTBk2aDmTJ4+Tw/6s3Gg+f6zv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770902017; c=relaxed/simple;
	bh=BCMcKXyibuY72ZlBsUpi4Tif7N5dBM6mOtsw8Eg567Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GV4eoVAb36gKq/i/5RrHGmNF93u5fappPXGjBhVvRshiRI056R/UB5kM0/xLzIRropcL4l7LyA1ZW3h9bnMYgffqUi81Y6IwfXf1xjWxeUYW7dQHWgpYIX1uTo1ltfN/huA/wmwxH2kmwPugafkL4n68lPibq2v3/MxjkVPunb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYFcDVUk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYFcDVUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59AEC4CEF7;
	Thu, 12 Feb 2026 13:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770902017;
	bh=BCMcKXyibuY72ZlBsUpi4Tif7N5dBM6mOtsw8Eg567Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYFcDVUk8+ORzvt5z7z4RyAoaXeEJ6lMScqhsm1HBC3vao6/oRZ+cqMZ86rCaTQuN
	 go1yQ64Jbmptyj0WZtAZ9Sdu1YW6aAzgtFgUIJHIXd0esI3DYR80eGV+8nqfndCrvZ
	 nEA6tPnJdVelUq1lz3FPhGjwVrz5UH00jlaE2fcDVqlZrRFhVaH0ekn+KXGN6PPRx8
	 jS1JBpwo202JwW1L0qhcj3Vpoi9OAA4Ax2DcMURxp7MMYXJpUowl9WgUsQWJkaoh9S
	 oEClVC+hY78RJd7qVKQqPrMmKKsNEy+8dr/HH+nR0fZEcbW1M+BoIWVIFvUIWungTy
	 X5njY4oC7gJVg==
Date: Thu, 12 Feb 2026 13:13:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <a76b1e27-87ea-42e0-88f3-0512b2e1ac0b@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
 <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
 <20260212134601.7760f414@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eRjwlYwruHn/MzvF"
Content-Disposition: inline
In-Reply-To: <20260212134601.7760f414@fedora>
X-Cookie: Save energy: be apathetic.


--eRjwlYwruHn/MzvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 12, 2026 at 01:46:01PM +0100, Boris Brezillon wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > The panthor driver is buggy here and should be fixed, the driver should
> > treat the supply as mandatory and let the system integration work out
> > how it's actually made available.

> > Trying to open code this just breaks the error handling.

> Maybe, but the thing is, the DT bindings have been accepted already,
> and it's not something we can easily change. What we can do is make this
> sram-supply mandatory for new compatibles, but we can't force it on
> older/existing SoCs without breaking backward-DT compat.

In practice you can because we do sub in a dummy regulator for missing
supplies, it produces a warning but works fine.  If we didn't do this
it'd be basically impossible to add regulator support to anything at any
point after the original merge which is clearly not reasonable.

--eRjwlYwruHn/MzvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmN0fsACgkQJNaLcl1U
h9Cw+wf+P2+piOIgK1GSaH7ikNmVinqDjcyC98yMJbSjrTf10BDJ93IbC65gKLmN
/XZxE5xRB+p7RO+kxK7SgCGRWHDQU/LeSchhImc28Q3SXSmNULWSYBKiLE95XyQy
b0eT4ZuJIMulwPkGC/0ht4M1hFp5d065pSbksFh/1lTDWMZYbr+BQGdfzUCodaYK
d49bTbFgXaPJZtOXUu0Vav00k6L/f7l0xW5rslBKh5qFfCTvy7TEUlmxE1ZzNWcR
6oZFOnsYE6Lbq+LRMBguN9u8A/kK53oSgbO7AjlzAtdstKb3gSv9NjBq+S0Yz6R1
hRHTH+pKtJW6rQnlchJiebWis0//ZQ==
=e+eT
-----END PGP SIGNATURE-----

--eRjwlYwruHn/MzvF--
