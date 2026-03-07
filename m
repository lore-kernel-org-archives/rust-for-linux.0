Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0A3A1E9B
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772895809; cv=none; b=TYo4Wl1izmXvZYL9aaKVTFeGvR9Qn1IMHPIMK7zHCgLEJLjFeR+vWC0ql1uFQAt4gxQ7o7LsJn9Yqup80GUZFQ+hAEgHlBvg/gdP2CivFnXzc4FD6wYkNEPkSl/2W5bAjAXS/InfJv5L5qinC9Ayjn9OK8+cReIYYWJYe4TZR2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772895809; c=relaxed/simple;
	bh=YopjtQ831nORHTq3BmR2IvkR3be1dw7pERjTIvZN7Ck=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j8fMh3TxZI1t9N358dtybkslzth7iBVst0+h7PeBxZEx8pHB2R4ou7g7JKsFvesk6GO4fVKRFeujcXCrt9kCDFPzAejZ63jtWahPywJ2C4PaZDj8X1mEKaUS5bouQ8mX5855k8QlUS/n+pLw27aafANE/zHhs68fehgAGgHHtX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Uch8DRUT; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Uch8DRUT"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 02EBF240108
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Mar 2026 16:03:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772895805; bh=85pMn91pvCeVIfx+UL//VyWHbHVXCjnJFWgF9MrBPsU=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=Uch8DRUTxr8UyQhWkFFLshxHP8+EAXuJYY48ZcqFiHZx4EmHcNxStzOxi8dhrnYvf
	 uKegAwi2GzzJjMpOV7t7ZPnxsXlWWiEZ5zCMX9eROsW7eBQ0DLQx+CoOb7weuxNXPt
	 S1Ge8DwDmf7tDMwYL0gzEAPQTFXEsNJonVFF0qxof/n9E3oAfTVVT2KFjoj62auNXb
	 5a8m3sZfXRdmMkd2KZ3+UVXdFfbVAT75dHmvgpAxDpb8muWsDbrW2AUyR6vziFD9I9
	 txbHtMsIyHi5FQemnj1SxoJXczOUerHAhQ5vCV/2B3TJBSCLP2kKikSGDbrZjAvY2G
	 JYbcZaLsArkbQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fSmk26h3vz9rxQ;
	Sat,  7 Mar 2026 16:03:22 +0100 (CET)
Message-ID: <91a80c27dd3a2bad819a8537187a9d9adfa4a123.camel@posteo.de>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add binding for synology,microp
 devices
From: Markus Probst <markus.probst@posteo.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,  =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron	 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, rust-for-linux@vger.kernel.org
Date: Sat, 07 Mar 2026 15:03:24 +0000
In-Reply-To: <be179573-edc3-4b6c-8c91-ae7b0c61c1b1@kernel.org>
References: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
	 <20260306-synology_microp_initial-v1-1-fcffede6448c@posteo.de>
	 <be179573-edc3-4b6c-8c91-ae7b0c61c1b1@kernel.org>
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
	protocol="application/pgp-signature"; boundary="=-K52iwPLrwnGDR7Khi5Qh"
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-K52iwPLrwnGDR7Khi5Qh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-03-07 at 11:20 +0100, Krzysztof Kozlowski wrote:
> On 06/03/2026 20:38, Markus Probst wrote:
> > Add the Synology Microp devicetree bindings. Those devices are
> > microcontrollers found on Synology NAS devices. They are connected to a
> > serial port on the host device.
>=20
> A nit, subject: drop second/last, redundant "binding for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>=20
> >=20
> > Those devices are used to control certain LEDs, fan speeds, a beeper, t=
o
> > handle buttons, fan failures and to properly shutdown and reboot the
> > device.
> >=20
> > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > ---
> >  .../devicetree/bindings/mfd/synology,microp.yaml   | 75 ++++++++++++++=
++++++++
> >  1 file changed, 75 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/synology,microp.yaml=
 b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
> > new file mode 100644
> > index 000000000000..0fcb0b750bf0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
> > @@ -0,0 +1,75 @@
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/synology,microp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synology NAS on-board Microcontroller
> > +
> > +maintainers:
> > +  - Markus Probst <markus.probst@posteo.de>
> > +
> > +description: |
>=20
> Do not need '|' unless you need to preserve formatting.
>=20
> > +  Synology devices contain a microcontroller on their device to contro=
l
> > +  certain leds, fan speeds, a beeper, to properly handle system shutdo=
wn
> > +  and reboot, buttons and fan failures.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - synology,microp
>=20
> Missing blank line. Look at other bindings how to write one.
>=20
> > +  power-led:
> > +    $ref: /schemas/leds/common.yaml
> > +    unevaluatedProperties: false
> > +  status-led:
> > +    $ref: /schemas/leds/common.yaml
> > +    unevaluatedProperties: false
> > +  alert-led:
> > +    $ref: /schemas/leds/common.yaml
> > +    unevaluatedProperties: false
> > +  usb-led:
> > +    $ref: /schemas/leds/common.yaml
> > +    unevaluatedProperties: false
>=20
> That's pretty unreadable code.
>=20
> > +  no-check-fan:
>=20
> Vendor prefix

In the documentation it says

"
Nonstandard property names should specify a unique string prefix, such
as a stock ticker symbol, identifying the name of the company or
organization that defined the property.
"

I am not sure whether to use synology or linux as vendor prefix here.

The property itself was not defined by synology,

but the property also is not necessarily specific to linux.
The driver has to tell the device whether it should even check for fan
failures. The property wouldn't alter behaviour of the driver, but of
the device. The device itself would not check for fan failures anymore.

Thanks
- Markus Probst

>=20
> > +    type: boolean
> > +    description: |
> > +      Disable fan failure check.
>=20
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
>=20
> > +
> > +      The fan failure event is triggered on the device, even if the fa=
n
> > +      has been intentionally set to a low speed. This property prevent=
s a
> > +      hardware protection shutdown if a fan failure event is reported.
> > +  no-check-cpu-fan:
>=20
> You described the desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and its description to match actual hardware
> capabilities/features/configuration etc.
>=20
> > +    type: boolean
> > +    description: |
> > +      Disable cpu fan failure check.
> > +
> > +      The cpu fan failure event is triggered on the device, even if th=
e cpu
> > +      fan has been intentionally set to a low speed. This property pre=
vents
> > +      a hardware protection shutdown if a cpu fan failure event is
> > +      reported.
> > +
> > +required:
> > +  - compatible
> > +  - power-led
> > +  - status-led
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/leds/common.h>
> > +
> > +    uart {
>=20
> Drop, unuesed
>=20
> > +      microp {
>=20
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
>=20
> > +        compatible =3D "synology,microp";
> > +
> > +        power-led {
> > +          color =3D <LED_COLOR_ID_BLUE>;
> > +          function =3D LED_FUNCTION_POWER;
> > +        };
> > +
> > +        status-led {
> > +          color =3D <LED_COLOR_ID_MULTI>;
> > +          function =3D LED_FUNCTION_STATUS;
> > +        };
> > +      };
> > +    };
> >=20
>=20
>=20
> Best regards,
> Krzysztof

--=-K52iwPLrwnGDR7Khi5Qh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmmsPjcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEDR2H/jnrUPSMngP/2YowX4VAeDRbbrgtrmO
Ok474zMAqY5Y3+DHEpA4fcZRIi0hpUMTE+ZGY1OyXB9k326T4Xephwa19IBBDlDp
riKr8lWQ/q5G2K55J3asj35KnQ6eJnY0+LsY53uf1KTGhKUkyC9NHdt9jeiVFkZn
rZv34j6mjQuFAvJhydO6tY5quAv7wksjkaEw93jwXWgfJg2SqK+AkewfyImJd5FB
TuCE8lzeUROPOyIRcPQAmHCiGSfKJv6IzFxRYDlyWcFzWZQvHgelKGAuIKYuF48t
469xFyPf044AvBAdxh+31DLvaotXq+UHQTeHRc1qmv9P/QSJEfhgE8iyM7/9rGSN
ptlhk1JC/Oq+s706zrlA8ryvHjdlQICzIObKYqgczpMwZSIGwDpbrzMuCnkzkDro
rxe5q7Bm2CVZBL6yGN/qUqxH7J7iy0aDsQHTe2TZIesHwnI25URUiQPiSpefckyk
xhmnZoCIA2LVsQDWtEx+b8SU2KgFrBmloI3xPbI81a8WxQs7cdFJ4Ha5GhLNNiLT
V5k0DvXM0rXsQZCC8Q4Ll6NM/Gf9LWjYwjfpYJzeOPQAMSnaGQTrl+tGP3KHf69r
rKjwZWjH32yJpgqvl7dHJxF5euqimJT/O0D9Rojoq/95JzVaJ1tb+iaIc88kEaCM
BduN50fu24ONmMfq6ubxonbW
=NMMl
-----END PGP SIGNATURE-----

--=-K52iwPLrwnGDR7Khi5Qh--
