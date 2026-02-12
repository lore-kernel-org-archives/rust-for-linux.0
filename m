Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB6F11CAF;
	Thu, 12 Feb 2026 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770901810; cv=none; b=YcDcl++Bho22Mbt9+K7WAGG3gvtzqVK6va8OEhTHUMfWj1ZZ1qjJ17N34vSgKAx2++yAKvoW/tJC6lMgBCXrTb4p6BUpcpdb+sxvsFArSKKoEP2QB+cVbShuz6DEQ+LDa4CxWdMv7pDh8MKxrev4YEtFq4Jr1qsNJDNUGtO5/Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770901810; c=relaxed/simple;
	bh=4OGIymvtICOLenGdbfRwIuE8+QmaHpFUy3M6cMFFxAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLCSQtNqYkdkDKBGycVtKObb8Twlj6NBgcUOnOtEOei1uPYiJw8l0mr8AB0bsqEhXo4daIOsoJrVGxAPIu5K7X+6vAQ1crkyBn9Jpi5jCRCSBLzw19g6TL9ox9raoEsvYBZeR86uBVHdQ0JdL6DekWs3v5aFy+BZCKclFnDqgYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYoMtjTd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYoMtjTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D73C4CEF7;
	Thu, 12 Feb 2026 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770901809;
	bh=4OGIymvtICOLenGdbfRwIuE8+QmaHpFUy3M6cMFFxAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYoMtjTdUbc0iEbqzlUIDRCXkuq/9C5H+pf7mCPoF4ngTw+2xYNDIx28mXK3SwJbb
	 5QR5mapIXdNcVstci04N/UOhf+qk9rNNNjMcdfm7WinF4QD63tDmKh43gxYIxjFjBR
	 VNgkLiL/fkmIPQHrBvQoAaEdU9MBYuTiQ4uR+Nkr7bcvnYLq4QnetsZ8gARjdkt1ko
	 jwRL2tMZS5TS6AgDgvFnlFIHTxDDAqztNw21dA5SF1KryXqp4yLJNZx6ySVeE7K5jh
	 pW1VTnBaX7UCfVak8zOtHoIlAzt2ynpKslCjg7qslXBJ4xutTfbU0kZNsbLpw3GBc9
	 7QeO4mbxkpnww==
Date: Thu, 12 Feb 2026 13:10:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <3507d7d0-a612-4a2f-baf8-c1f19b388e20@sirena.org.uk>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
 <20260212132222.0708d190@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvo5ftwoWWXOz+Ms"
Content-Disposition: inline
In-Reply-To: <20260212132222.0708d190@fedora>
X-Cookie: Save energy: be apathetic.


--cvo5ftwoWWXOz+Ms
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 01:22:22PM +0100, Boris Brezillon wrote:
> Onur =D6zkan <work@onurozkan.dev> wrote:

> > If the platform has no separate sram-supply (meaning that rail is
> > coupled to mali), RAM should still be powered and work fine. Panthor
> > already relies on this model by treating sram-supply as optional and
> > as far as I can see there are no RAM issues on Panthor.

> Yep, some SoC integration have just one power-rail for everything in
> the GPU, others have two. The sram-supply is documented as optional in
> the DT bindings, so I think that's the right thing to do.

This is expected to be handled through platform integration of the
device, not through bodges like this.

--cvo5ftwoWWXOz+Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmN0SsACgkQJNaLcl1U
h9CERQf/WPhdYMMN7QryNfnqGHWlAqwjwFuIVKusX9xlNevK6AN0uZKCa9LBUQIN
1rUOW/F+QqkYLLoAgx2SirPyNNp+iSF73gMR4djkdjDuUGPBOb6pbSR9CB9SL4Ld
az6CQgA6CJy4FJrHPHUx3DX3r2SBZoxEYHaj62MBrK01NKvnif21vrJhhMi0wdkp
WBt77vlxguYuftP6Z1Zja9uRiO/uOyTHluEDIG+K4qbTO9RPicF5AtYgG8VzymXK
vAwLOJ9/COn+HkxMapymldP8m26LZzTrU+gi6zifUXMdPMvE5RMrHT8OofhPG5Yi
9oEiixP/fVABAEZumt+bZThSqKJ+cg==
=QE/u
-----END PGP SIGNATURE-----

--cvo5ftwoWWXOz+Ms--
