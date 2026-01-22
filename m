Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769F341C300
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080972; cv=none; b=WGIE1NgAWUYA2GpMy35XoqZwv9+Ba/4BY9UEhNPoQsncZmVH2vAa78ax4P+sR/vnVXZy+hS1d3tFDhC3pSv95ymzjC8gvCHlZvA9FomZcSccKJ2xeLDBK9bHKvNa41swXp3fMW+huvTNf0QfxqjjKZJccDfkhGgBQVhlr3wSs0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080972; c=relaxed/simple;
	bh=aIkk/tkoBjjaZGUol+Q8NYf9FUSE+hDzD2pFBqWcSYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCq4ZzIBoIyMgvuH/0oKxbS9chbJuneISDNUQT8N21jYVYsGLe6EcXTNb6ul23thgTMTLXAW6m3j9VWbuD5HMpf2aEj6g2xMySMX4neWZXWvNlUf+NhywYUXKLyDN2UTiaH6k2curlHEwo8B01xwW46/V4M95zFz4oqsrf6VqGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AueUwJyz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AueUwJyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD28FC116C6;
	Thu, 22 Jan 2026 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769080972;
	bh=aIkk/tkoBjjaZGUol+Q8NYf9FUSE+hDzD2pFBqWcSYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AueUwJyz5uXNxV7P/dgqUn5oM1Bn2sqxdH+jdFwQ580pc7SgAJe+OLG/SvSY01YSH
	 pI/YRzufwDfk5ScdnZgi+ZejhEK1TT/rloFXjj28c95KXjQ+agWKU2zE+A1TJ3PiuA
	 78ns6Pyv0eu0+4C8sVzoBYtvy3HpQYb8PXhSiewxOGUHgxC0hMSxKmurya567Os+ja
	 awZVQzH3OMdFt8I8kF3WRZPL5iWGJ9gqFOivWHeD1CS9vlfgdtyM1Euj2LHPQOdQZx
	 qM5ZO4t0x+Iu04n/026RNVHrLT1trzQEvViL338CEwXAhVlKIh6NfF8cAfKFDKhE9w
	 1AnBgf3gJj+YQ==
Date: Thu, 22 Jan 2026 11:22:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	boris.brezillon@collabora.com, dakr@kernel.org
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
Message-ID: <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ylg+OgKEabxTjFCD"
Content-Disposition: inline
In-Reply-To: <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
X-Cookie: Don't read everything you believe.


--ylg+OgKEabxTjFCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 01:58:40AM +0100, Miguel Ojeda wrote:

> From what I understand, this is only reproducible with Rust 1.80.0
> (unsupported upstream), and was fixed in Rust 1.80.1. Did you
> reproduce it elsewhere? I asked Mark where his toolchain comes to see
> what could be done there (e.g. in his distribution).
>=20
> If it is just in Rust 1.80.0, and if a distribution still uses that
> one, and for some reason they don't want to use/backport the fix in
> 1.80.1, then we could consider something more global, i.e. ignoring
> that lint altogether for that version, since it also fails for another
> trait in `bounded.rs` (that is why I knew about this).

As I said on the other thread I'm seeing this with what appears to be
1.85.0 in Debian stable.

--ylg+OgKEabxTjFCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyCIcACgkQJNaLcl1U
h9D7QQgAgokMVY8wkRK1eJb+Gmjrh5mrfN84W00WkkRYvnanOAof3yqDcOb/pKPg
h5C2Xc05b4nxoN+N8cSxewpo2sJTsvRhC78Sf8udNFsYPjxpkvEjTML6yjog+nIo
QkLVCUwnvjlx9QM2vBeIZDLomej2iG3RM7IABGV/E3fnokFCF8fJLBwRoq4KwKhg
0tQX1SFBHakC0XJrh1TGGo/A+u4NyvpKQSk3s7aeGd7nDFEDRfk5JULzuD2Ur0GI
r7j8mnb06N3viCTWhuZbWl2Bu8S//PrMubVFwufxUPHVowcZWN+uLV0u0Jh+h4+h
F/DCcMNedzoW6BDKs5KogIGeV/wbNQ==
=Va4T
-----END PGP SIGNATURE-----

--ylg+OgKEabxTjFCD--
