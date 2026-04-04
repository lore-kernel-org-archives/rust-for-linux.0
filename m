Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0343446A6
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Apr 2026 22:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775341164; cv=none; b=j4HtJqhOqOyRodnWmE7WGKKIMl8Fui/BJYSZ9gr0gBdDIIyKVy9HeQ1QM35DOs3uRZVYf9JbycjshKIk8YfXY289oJtzIeug36OWhf2G7NTmH6JLKiERPKhoB6LrbylebUpWR9PffaYDgohcFxodMgPfnCNc1FILAlsjTdJWzA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775341164; c=relaxed/simple;
	bh=uyQMcVqCEHNc2ykfDVyqf63QS3R+RZO8Ikta+Cfz23Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2AyoaOPgH0GTrQ7/NvMc5uYuOSpsYx32ITFyD+QngkdkGdQvxBOrNOIV0HieV8MlPuiQy+9LNiKZD4XFGcXFHsBcr+AwadnDrRZvq1dhVFydQgpom/kyoYW5KCD1DKNYMxeyt1enKuE9FZJGQQ16HkXSLwkhaSqy0NA0N5sGko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iFhPo44I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iFhPo44I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=uyQM
	cVqCEHNc2ykfDVyqf63QS3R+RZO8Ikta+Cfz23Y=; b=iFhPo44IquY+Ej0klekS
	iag4cRsat06r9Y00y/Ofq6+fbFTlsMHwFrsB1oDOJ0KUY4Ga+53+Ay3HbuDLRdD0
	g55ZrISAIBntkkPfmLe6RDxOrNoRuJy1GjQzyCkuQSnRGa6SKWT+jGoF1j5ZsWmF
	j2zr8473XLbjT+pEYl1RgPDqdiA2nXkU40x5Jvzoqjg+kGbX4lqpMkIlYvOBE9RX
	0lkiZCWvmH0f5R9xJRf5HW3YGRcO67gkzgRRpQXdPncIQMCaBtW00GBbwwfSG75R
	Ow3Lx6VVkBzd1i/VyPjwX2c8ln7qFui/aoTmsEH+BoUYFL3Wk0qJC8LU+lgXCzsr
	AA==
Received: (qmail 3337396 invoked from network); 5 Apr 2026 00:19:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2026 00:19:17 +0200
X-UD-Smtp-Session: l3s3148p1@HAMF06lOFMoujnsV
Date: Sun, 5 Apr 2026 00:19:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: add Rust I2C tree and update Igor
 Korotin's email
Message-ID: <adGOXajATeerw91I@shikoro>
References: <20260404-update-rust-i2c-maintainers-v2-1-42f929828eb1@linux.dev>
 <CANiq72nzNa29_YduauW_qwPq9sLbYa+28ykq42_bbfLnOqUm9Q@mail.gmail.com>
 <707e9f2e-048a-469e-adbb-17334dd027ab@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OTRbOk1Yf2ZPdzSk"
Content-Disposition: inline
In-Reply-To: <707e9f2e-048a-469e-adbb-17334dd027ab@linux.dev>


--OTRbOk1Yf2ZPdzSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I imagine this will go through Wolfram.
>=20
> Yes, Wolfram is added and aware.

Well, this doesn't apply on top of rc6, so I assume it will be included
in a i2c-rust pull request I will receive?


--OTRbOk1Yf2ZPdzSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnRjlkACgkQFA3kzBSg
KbYxAQ/+JSckOqEUqILlYOfTXzPdQr8yJ6Cm/o0levyznufTGxBsZXIyMtLhyPUh
UQlaFP1SHJmwPRUoU7O3Ljak9pWJ/Gcxgo+7Wi6tG6fh/Q2BGj5m7vDCFS25YAMQ
Nf1be2ImT4JdavmD9SPc5uC2m/8ToGY+hvS/X0dJoucm8692u8aTW2+28uCzzHnt
zzJJqZfYg8Io0zLk9UVcEpibr/evAq9GP4dmvJpxMX9PWqGEJnYYvNF6jfoNm20k
KrBL4j9TQIIAN+WUjvM+5ULeq8OIiBzf+89IbFgq++eX7+2qUBA/5S13NRmkUHdL
0kuF54LHBGRZXa2YVjnTJHrezUMquRNII9H/rEjPjmBAW3rA8/hFykBRkfBN1A6j
KXj+N2jq8rSy+Lta1xOjCKsQxDVwHxODtPjzBUcacgww3kEfNgQIgYfT3oeoYaMm
kB1gksRzT81P9yjzkZo/qhWyNaSH0CvfYGz+dzWYuPpSgoegDHbuR+s6a0j960hf
/TAvoRGK2AUjEIdaLgFshm1+lnbsRrEKEDQWJBVd1MrhmdbGKNnNOk8iwgFGoRSN
d/sY62F7C+pKPccUa9FBwFzEQZ9JreOzFAeiN0Vr5+GK5lKYhkxDS8eqjOcCdDV+
Wol5t/u/eC/4k0pVL1UlxEgQClg0mqg7LDckE8GWgbPzqjRIRyM=
=XBh+
-----END PGP SIGNATURE-----

--OTRbOk1Yf2ZPdzSk--
