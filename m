Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC1625DCF0
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386111; cv=none; b=hbGWLkZKr0xP/0pnmMW6dWv03QTbhfyW1RNBmqfJY5C0Hsb54uahuMf95KQ8qISa9jJCKEmezttPM/+rmljgGFDg10ivv7uSPbDCh6OiEly04btpyT7QEOzKXr6pmJpV5unR4ZrtBjxEOUzVLW2Hn2v+UY0tqVcNdlyH3uP1exA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386111; c=relaxed/simple;
	bh=i12F5S7mhzty8UI6XGf1tfFXx0IQ0+C+EoGm5lr9ik8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZnnJ1w+QGT6KDukoilvUrdeKtolaj81c1R/SGkC5d6FUtNA7qs1tJd6z25fFo8hgEOwf5Wm8XKlaaEU5BBZxrhUZ313AaYam+83EZYcuH3aBpEJxlrUSo0DdHt7WH08SfP9NRvLtbnXGVHvTDR8nTQe7McmeEquGW3h8LCiPhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XJ6bCpYf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XJ6bCpYf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i12F
	5S7mhzty8UI6XGf1tfFXx0IQ0+C+EoGm5lr9ik8=; b=XJ6bCpYfzsn/4Cn4ZrZ6
	mMM7Rk8Lmimf1Uo8BGrD1TwkshOstpkI2iopU0KDzffbXeZBg5mR1qECGptYdYCh
	1yuLWInQb0Tg4GA4C8REE4ImBeVl+Ukpc7rB8hF0yGN+YRa+Wdo+RtkLQcKkJQ3A
	cgf0DvWs3p3z6+omiOcq8MszEgWEXSl8tjiOhuoeypAYKqGZhJJplEq3gGOz3zsx
	ntiuLikHVzkiCYrHfxJir8D+jxP9VgEZcpXWo4qZ+9JG3w0R3lTXDH31LwRDC/aF
	4E+uZ5PXHwQOtdILQxo9PvyCidUbblZdUg5I6xojNq0Uo2KG6gq3ADcnPJfBCXZd
	Cw==
Received: (qmail 162327 invoked from network); 5 Aug 2025 11:28:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Aug 2025 11:28:24 +0200
X-UD-Smtp-Session: l3s3148p1@+HeQ2Jo75pAujnvb
Date: Tue, 5 Aug 2025 11:28:24 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
Message-ID: <aJHOuKh4siIzVgn3@shikoro>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
 <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
 <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com>
 <aJDbmFx3QAm-TY4L@shikoro>
 <DBTTAEC8HLGA.QYJ0UZOIDYEZ@kernel.org>
 <aJEtrI6RlU1tiflq@shikoro>
 <166cf13c-7bec-40cb-8d33-1c36c7927aff@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mbEQwmEDx6+StxPd"
Content-Disposition: inline
In-Reply-To: <166cf13c-7bec-40cb-8d33-1c36c7927aff@gmail.com>


--mbEQwmEDx6+StxPd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Well, I2C client drivers go to their specific subsystem, of course. I2C
> > controller drivers will go to I2C. But as I can't review them, I need a
> > maintainer for them. Is Igor willing to do this? Review I2C controller
> > drivers written in Rust? Or is he only interested in the Rust I2C
> > bindings? Anything is fine with me, we should only make sure that the
> > MAINTATINERS file describes this correctly.
>=20
> I'm definitely interested, but going through a tough period right now,
> so I=E2=80=99m not sure I can commit fully just yet. Happy to stay involv=
ed and
> ramp up over time.

Perfectly understandable. Let's just deal with it when it happens.
Unlike client drivers, it might take a while until a controller driver
shows up (famous last words). We will figure a way then. Thanks for your
current commitment despite the tough period and all the best going
through it!


--mbEQwmEDx6+StxPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiRzrQACgkQFA3kzBSg
Kbb3oA/9EXu+KyTW0f4l3pVPaqN9Vd0piBTGQdHYFzJQroj8SoBukwYtmTBaeqLU
TPZwNIuXiQSmAQ7f+j60HuFnIX/JECr4Wg6jHuzUGbTgl+JoyzIik2Ajir0CCpYz
VtEvjzMyr0tycgk2yz6OtdVKd084vPA4C03qe3tvBz1/MY0gc9J35T/vEuBnMi+P
DXvlq2sl6Zvl9SV9Os1oLRkyFaiZyTKWxfePeSbSGEm5E9vmSkQl0gbgXUjXGLW3
c3rCTGBJ0d6pM+cFVB6wQhPPyy0gLAOkHYTkBAH9C99mH9B5/JZrxVldy4Nh1HFt
uAsRX4sKZuNUNf+8Jx/YK6tdiviTjDB8b3Wh2r4y7Nomc95S2qXwm2hsLxnk+qdo
4KKcCflFLTWubWUPxjf7dbry3cjFfI0YEJPN9lW/5KGUHKGt4iDHBlbzGE50Jho3
zGW8ISS+V1F/Tzrzep8liFQCnuV2rnu2qdA7p72RF6BW8CkhgShoyvU39qkYynmP
LYr0qcPKp7emGE7C/0IXTkqCUH2WHo4fYmBnlNg7we2JsSQz7BwHkShSAKnQyj0G
wdWSSD4EOPuXi6TKnmKzj5s7/KHmZ0erUXuBVOOP0oUfSFT3lLqqtKuvMkU3MyEl
BkSuScFaMdWf/1CUCnSDbMqyPaiwzmps5KA7PDLoN9ZFEeKwI48=
=3YzK
-----END PGP SIGNATURE-----

--mbEQwmEDx6+StxPd--
