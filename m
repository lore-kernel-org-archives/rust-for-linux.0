Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF52E88B0;
	Thu, 12 Feb 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770898873; cv=none; b=TkXEQMK3n5rpo+qPo2Gdy4/aH7EBKeNAoInEK6uZEdg3SpG7PPz6yjhL0w3+4xS6Vt862+wfifjzky8vK2kEbvPyCJXJHk657aWVkBIpgaxVD7wyt1wetlFwu7t2726h0Z18dOJD2xY+JjPSAl5rAsva7nUcm4CHHlHfz8B05ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770898873; c=relaxed/simple;
	bh=QEkV3oob5sDVWk9eUL7QetXC3bEgf6Q/cnB6/3i3eEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTC2CnIQ673Bm3Mjdb6QKlUofN/9hbBIM13+w2nP+dIlPRlnTWgUJDDCSwKS/uj89Ieuq8KClTLQO6x/dkPjjMAehd1Xa+LNlkANMBeKLjTMCbCB7tHu3o6HV0AG6/dve+lMx01rFN1P5IGnURSGniHk2OqMUEUHoYhrDzVeCdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jlq1C/A9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jlq1C/A9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3699C4CEF7;
	Thu, 12 Feb 2026 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770898873;
	bh=QEkV3oob5sDVWk9eUL7QetXC3bEgf6Q/cnB6/3i3eEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jlq1C/A9Vr9pzMfZHblI+jCIQ8XDhLMzHXbWD7qP6C79mkVzXZf5DwhucEHkQJUXB
	 zEaI+Nd36reT2MapYI1TXypSR32lD7QypvqMoh+niwlVyO3y4PkvCN/9wkfLLArZ0t
	 +7WAbTUbfe3flnz4kJx9a9UxD3sPvEzI9e4h1r/+SzoKT7KK8Lt1ki/GELFck9xEF1
	 76l+qFmKXubY406Qw6XE8hWxs/H6JBScECEWnwqCV0dFw1etq6FykcY7M2uhuMtyEW
	 4LM0850Qez+GfKKeekQruNpFAbRLxxN7Rz0Y3eNLaXNsLx3iPNn/tDCgZUbOLbDQbE
	 dUjUs33SNRCgA==
Date: Thu, 12 Feb 2026 12:21:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BRO4QnJAtMBrNyRi"
Content-Disposition: inline
In-Reply-To: <20260212151644.4c179594@nimda>
X-Cookie: Save energy: be apathetic.


--BRO4QnJAtMBrNyRi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 03:16:44PM +0300, Onur =D6zkan wrote:
> Mark Brown <broonie@kernel.org> wrote:
> > On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur =D6zkan wrote:

> > > Panthor handles SRAM as optional and tolerates missing sram-supply.

> > Does the RAM really work without power?

> If the platform has no separate sram-supply (meaning that rail is
> coupled to mali), RAM should still be powered and work fine. Panthor
> already relies on this model by treating sram-supply as optional and
> as far as I can see there are no RAM issues on Panthor.

The panthor driver is buggy here and should be fixed, the driver should
treat the supply as mandatory and let the system integration work out
how it's actually made available.

Trying to open code this just breaks the error handling.

--BRO4QnJAtMBrNyRi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmNxbMACgkQJNaLcl1U
h9Cnvwf/TCuOUm6GYAgjd4gutI6awBtaXVBn0V+7G8ydJyYzWkF9ZTFMGkegkGZK
FcAYz7fSYOjRGXF6uRG+H6P/22b+yneS6Lrxz0wU65HmeKx4BkDmrEX8L95RQUST
hkTu6Pqo04er7xH+MQKslDAzzySHu2W3bj1bdNK788u+HAACKYxnfiRrHuX1z8HK
KzHKko3xvfuCi7Epfs4Xl2ZttC/mq2uZUKzP+oaVWVw7NPsOyItHKVgGH2xnsrxE
nK/wdLNjI+yqUVZeGlQbiBcBN3aLZLmo/phZe2XERa1NbmP2QW+rNMc+UhZuJncJ
WzjsEeca5fxwsadCMuwfOLce2lrd5A==
=dqR6
-----END PGP SIGNATURE-----

--BRO4QnJAtMBrNyRi--
