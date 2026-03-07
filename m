Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2916330664
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772888316; cv=none; b=eVfJa2sNm99WyAo3DXbIyHhpso6sEI06dUlHmIT9UQUtc7lA8e4PHa2ozJOb1z+X5uu+fn5Lhm5ADEGohZoUEc1vPAc+JIc3QLYIfpRAJeeZQRS4G7stpqd7MzPIuCQF65QPZOdg+WD+mzFGbGeFmVLWtB08Lso3QVil0+R4az4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772888316; c=relaxed/simple;
	bh=Fj+OrpPXWH4i0peZ38llrgnJu7mnjMoWLPvt0OuLv4Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ig3Tmcvmo9H+0t8tqGKzBB+lJOS0AYTB9Htf5kxAy4LgR0VTW8+qFfh2eKY0bbB2HIx8IwOnCJT9k1Dn+K7n3JSnHiEMwUvzPuR0RKnesRhQ8z8v0b+UWf+gIQMlKi8fAmrb0h2JyjgEESQwvVOKunqmfgQuDXBK9X0V8WwiFkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=LCsawahp; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="LCsawahp"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 54DF1240028
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 13:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772888312; bh=Opr1f1ATZy2cRkzInxq0gxGUxnt6PVN0pwyqViGilD8=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=LCsawahpDw94cYYZ7W0tJCUmYuvpxawppXoDfBJipstI5VURA1XhGqsT2OGhUOWen
	 6m1vLQY7zZ6Q9NQq3exhwGYMOJ32+qnlPNvdjrlX+N+hhnYnbSwXxGkvue3hJ9zusf
	 iWgeNwYBhlVX83PyXet9Nf5vfNDApQvAdGiJEXb4R/2RHsFH4cU7RulAoJPsvqHABR
	 0jSlkFuLO50UT8C/7RnFLCf35hGQgZClKI2vyTNUYxIivLDwkZGWWEqvdE+BCTDzD8
	 hx9t5Nkzx2D6MAmJ03BjSjzsyZNyffiINy1vLTjDt4Pe1wkzsJULpnILOKdAIqHu74
	 alpwxa2lgDV1A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fSjxx752Pz6v13;
	Sat,  7 Mar 2026 13:58:29 +0100 (CET)
Message-ID: <938755087c25b0b4eb6e32b84c1dd25cc2d71439.camel@posteo.de>
Subject: Re: [PATCH 2/2] staging: Add initial synology microp driver
From: Markus Probst <markus.probst@posteo.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, rust-for-linux@vger.kernel.org
Date: Sat, 07 Mar 2026 12:58:31 +0000
In-Reply-To: <2026030742-concave-dastardly-801e@gregkh>
References: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
	 <20260306-synology_microp_initial-v1-2-fcffede6448c@posteo.de>
	 <2026030742-concave-dastardly-801e@gregkh>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=mQINBGiDvXgBEADAXUceKafpl46S35UmDh2wRvvx+UfZbcTjeQOlSwKP7YVJ4JOZrVs93
 qReNLkOWguIqPBxR9blQ4nyYrqSCV+MMw/3ifyXIm6Pw2YRUDg+WTEOjTixRCoWDgUj1nOsvJ9tVA
 m76Ww+/pAnepVRafMID0rqEfD9oGv1YrfpeFJhyE2zUw3SyyNLIKWD6QeLRhKQRbSnsXhGLFBXCqt
 9k5JARhgQof9zvztcCVlT5KVvuyfC4H+HzeGmu9201BVyihJwKdcKPq+n/aY5FUVxNTgtI9f8wIbm
 fAjaoT1pjXSp+dszakA98fhONM98pOq723o/1ZGMZukyXFfsDGtA3BB79HoopHKujLGWAGskzClwT
 jRQxBqxh/U/lL1pc+0xPWikTNCmtziCOvv0KA0arDOMQlyFvImzX6oGVgE4ksKQYbMZ3Ikw6L1Rv1
 J+FvN0aNwOKgL2ztBRYscUGcQvA0Zo1fGCAn/BLEJvQYShWKeKqjyncVGoXFsz2AcuFKe1pwETSsN
 6OZncjy32e4ktgs07cWBfx0v62b8md36jau+B6RVnnodaA8++oXl3FRwiEW8XfXWIjy4umIv93tb8
 8ekYsfOfWkTSewZYXGoqe4RtK80ulMHb/dh2FZQIFyRdN4HOmB4FYO5sEYFr9YjHLmDkrUgNodJCX
 CeMe4BO4iaxUQARAQABtCdNYXJrdXMgUHJvYnN0IDxtYXJrdXMucHJvYnN0QHBvc3Rlby5kZT6JAl
 QEEwEIAD4CGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQSCdBjE9KxY53IwxHM0dh/4561
 D0gUCaIZ9HQIZAQAKCRA0dh/4561D0pKmD/92zsCfbD+SrvBpNWtbit7J9wFBNr9qSFFm2n/65qen
 NNWKDrCzDsjRbALMHSO8nigMWzjofbVjj8Nf7SDcdapRjrMCnidS0DuW3pZBo6W0sZqV/fLx+AzgQ
 7PAr6jtBbUoKW/GCGHLLtb6Hv+zjL17KGVO0DdQeoHEXMa48mJh8rS7VlUzVtpbxsWbb1wRZJTD88
 ALDOLTWGqMbCTFDKFfGcqBLdUT13vx706Q29wrDiogmQhLGYKc6fQzpHhCLNhHTl8ZVLuKVY3wTT+
 f9TzW1BDzFTAe3ZXsKhrzF+ud7vr6ff9p1Zl+Nujz94EDYHi/5Yrtp//+N/ZjDGDmqZOEA86/Gybu
 6XE/v4S85ls0cAe37WTqsMCJjVRMP52r7Y1AuOONJDe3sIsDge++XFhwfGPbZwBnwd4gEVcdrKhnO
 ntuP9TvBMFWeTvtLqlWJUt7n8f/ELCcGoO5acai1iZ59GC81GLl2izObOLNjyv3G6hia/w50Mw9MU
 dAdZQ2MxM6k+x4L5XeysdcR/2AydVLtu2LGFOrKyEe0M9XmlE6OvziWXvVVwomvTN3LaNUmaINhr7
 pHTFwDiZCSWKnwnvD2+jA1trKq1xKUQY1uGW9XgSj98pKyixHWoeEpydr+alSTB43c3m0351/9rYT
 TTi4KSk73wtapPKtaoIR3rOFHLQXbWFya3VzLnByb2JzdEBwb3N0ZW8uZGWJAlEEEwEIADsWIQSCd
 BjE9KxY53IwxHM0dh/4561D0gUCaIO9eAIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCR
 A0dh/4561D0oHZEACEmk5Ng9+OXoVxJJ+c9slBI2lYxyBO84qkWjoJ/0GpwoHk1IpyL+i+kF1Bb7y
 Hx9Tiz8ENYX7xIPTZzS8hXs1ksuo76FQUyD6onA/69xZIrYZ0NSA5HUo62qzzMSZL7od5e12R6OPR
 lR0PIuc4ecOGCEq3BLRPfZSYrL54tiase8HubXsvb6EBQ8jPI8ZUlr96ZqFEwrQZF/3ihyV6LILLk
 geExgwlTzo5Wv3piOXPTITBuzuFhBJqEnT25q2j8OumGQ+ri8oVeAzx24g1kc11pwpR0sowfa5MvZ
 WrrBcaIL7uJfR/ig7FyGnTQ1nS3btf3p0v8A3fc4eUu/K2No3l2huJp3+LHhCmpmeykOhSB63Mj3s
 3Q87LD0HE0HBkTEMwp+sD97ZRpO67H5shzJRanUaDTb/mREfzpJmRT1uuec0X2zItL7a6itgMJvYI
 KG29aJLX3fTzzVzFGPgzVZYEdhu4y53p0qEGrrC1JtKR6DRPE1hb/OdWOkjmJ75+PPLD9U5IuRd6y
 sHJWsEBR1F0wkMPkEofWsvMYJzWXx/rvTWO8N4D6HigTgBXAXNgbc3IHpHlkvKoBJptv6DRVRtIrz
 0G0cfBY0Sm7he4N2IYDWWdGnPBZ3rlLSdj5EiBU2YWgIgtLrb8ZNJ3ZlhYluGnBJDGRqy2jC9s1jY
 66sLA9rQZMHhJTzMyIDwweGlvMzJAcG9zdGVvLmV1PokCbQQTAQgAVxYhBIJ0GMT0rFjncjDEczR2
 H/jnrUPSBQJpa71VGxSAAAAAAAQADm1hbnUyLDIuNSsxLjExLDIsMgIbAwULCQgHAgIiAgYVCgkIC
 wIEFgIDAQIeBwIXgAAKCRA0dh/4561D0gKJD/9uOQKYlsDoQX65Gd0LiMT0C+5vXgr3VI0PHDOwcv
 51fJ3A1vNyPZRFPGrz8+mDEXUQOF/INfnz5Tu1QHwf+iYcWcTGAN/FHgVR6ET6VBNU2hJaKhu+Ggo
 kjYyJTOvyX+3yNRUfSny0GjTjIPuPTErjqmHF+BtjXslpgwqnNMznf3lRIuUjRORupos6p3k1DndE
 5vzUTmXSvMyXyOD2KhBl/kL76k0bHYyAQytZPag12pltrtFbA/r2phDGN2si8PooDT99bSTJjaM45
 MTAAHbHKJfvgfK41bNFD5mMtpWpL195XRtS0Nrxdg3PaYBxN5gtTG0RyZfpYRlkdEhm+jj/8RxuSG
 i/qdhRdbiI7K2IELWeQVHSNDi9JabR/UzlR4NSnhfAjRIVlRM+eFbUl8XwxwVrAkojF5IraH2qRvg
 VCmuFsHUW07FUlrDrzpjXsD73cKppoFGDCdDR0BHJepXbFLS9+AqkT+guRJlnCTg2p+TQtnbwPgKp
 Vj98JixovCl99zRYTsL2bRNU5+q8iET65VMJ1ydyNanvLd5vI/NqDkXhlXLsGmdaDTtu4R21PkToX
 dQNGrZ91M9nlIBKw8Y7c7xZ4098qX2b8JX/CxD+gC1r4C8vuA3GkhFLx+KlkON7LyiJPkrePp6Qky
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-UEj1ciT76eIznC7lX4dC"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-UEj1ciT76eIznC7lX4dC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-03-07 at 08:15 +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 06, 2026 at 07:38:30PM +0000, Markus Probst wrote:
> > Add a initial synology microp driver, written in Rust, to the staging t=
ree.
> > The driver targets a microcontroller found in Synology NAS devices. It
> > currently only supports controlling of the power led, status led, alert
> > led and usb led. Other components such as fan control or handling
> > on-device buttons will be added once the required rust abstractions are
> > there.
> > ---
> >  MAINTAINERS                                        |   6 +
> >  drivers/staging/Kconfig                            |   2 +
> >  drivers/staging/Makefile                           |   1 +
> >  drivers/staging/synology_microp/Kconfig            |   4 +
> >  drivers/staging/synology_microp/Makefile           |   2 +
> >  drivers/staging/synology_microp/TODO               |   8 +
> >  drivers/staging/synology_microp/command.rs         |  48 +++++
> >  drivers/staging/synology_microp/led.rs             | 229 +++++++++++++=
++++++++
> >  drivers/staging/synology_microp/synology_microp.rs |  73 +++++++
> >  rust/uapi/uapi_helper.h                            |   2 +
> >  10 files changed, 375 insertions(+)
>=20
> No signed-off-by?
Signed-off-by: Markus Probst <markus.probst@posteo.de>

>=20
> And why staging?  That's for stuff that needs obvious cleanups done to
> it, you don't list that here.
Because the driver is not done yet. There are components that do not
exist yet, because the rust abstractions are missing.

Merging an initial version of this driver into staging makes it
possible for the serdev and led rust abstractions to be merged (as
their now exists a driver). After this I can work on the missing rust
abstractions.

Once the driver is complete, is can be moved into the mfd tree.

>=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e9e83ab552c7..a1f8dec31db2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -25143,6 +25143,12 @@ L:	linux-fbdev@vger.kernel.org
> >  S:	Maintained
> >  F:	drivers/staging/sm750fb/
> > =20
> > +STAGING - SYNOLOGY MICROP DRIVER
> > +M:  Markus Probst <markus.probst@posteo.de>
> > +S:  Maintained
> > +F: Documentation/devicetree/bindings/mfd/synology,microp.yaml
> > +F: drivers/staging/synology_microp/
>=20
> No tabs?
Will be fixed.

>=20
> thanks,
>=20
> greg k-h

Thanks
- Markus Probst

--=-UEj1ciT76eIznC7lX4dC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmsIPIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSvsYQAIEgoTQripeEonZYf2T+
I11oZrrA0SUhwn/jkGjIjlT7l+4DLf2cchXwnBs8PpRXk0RWh+ujD3VmhZp+sbZ8
IvfEHg1djnWT804ytrHYoeL8/DiQQuOdpkElqn8JeqIasL0CL1KMFaNoaEoCQgU1
BgWI7hPkObgoNTa67OWJTq8co9OX/E6Cs80FtpD+8Y2Wbwg+c7+bM85Opt6lEzDR
ZcxsfJKRyF64bJVjZr3SlBk4QDT3Gr62Et87DRk9ydI/U1lFv1LEcZ9baEfHX35F
CK4Z/l3CUfEBNYi97+RKeE3neBTvEZc3mvXxDbuk/jZi5ltU3NFkjij+E3LNG1TS
IAzGenjxpFXLQgq4HWvfGPHT+6+hnN6Ba1yM38l7xn9sWMac8hxeBBEsEGNgJ12m
UlFcTaymHmNXrGR+oPrCbk8+QYiZeJdWqpYJG6ZyH4tndx2olqphGj678rCjAz3t
lAeF+hycyVoWPQZ8tEVaPzNP6N+OH6KDibDByVv0YIRgA2LLdCrBciBkRjRlChiM
0K4Eprc8WPmHryp2o1JIXWv4IpK0RDjsLYS4csZaYjjh4Ue0YkJX35sxwp8DDFJH
b8azPrU0m1TvpFqnbwNNUZ7WzeqJuhs/0+9fvBM3Kd0qlQwzxDDQcOVCEObr1Gm/
WTx2OyRxSU6FDU9eTsmICUEj
=5+ov
-----END PGP SIGNATURE-----

--=-UEj1ciT76eIznC7lX4dC--
